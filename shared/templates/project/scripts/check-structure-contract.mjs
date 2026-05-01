import { existsSync, readdirSync, statSync } from 'node:fs'
import { basename, join, relative } from 'node:path'
import { execFileSync } from 'node:child_process'

const ROOT = process.cwd()
const failures = []
let trackedFileSet = null

function listFilesRecursive(dir, out = []) {
  let entries = []
  try { entries = readdirSync(dir) } catch { return out }
  for (const entry of entries) {
    const abs = join(dir, entry)
    let st
    try { st = statSync(abs) } catch { continue }
    if (st.isDirectory()) listFilesRecursive(abs, out)
    else out.push(abs)
  }
  return out
}

function getTrackedFileSet() {
  if (trackedFileSet) return trackedFileSet
  try {
    const out = execFileSync('git', ['ls-files'], { cwd: ROOT, encoding: 'utf8', stdio: ['ignore', 'pipe', 'ignore'] })
    trackedFileSet = new Set(out.split('\n').map((s) => s.trim()).filter(Boolean))
  } catch {
    trackedFileSet = new Set()
    failures.push('unable to determine git-tracked files for structure contract')
  }
  return trackedFileSet
}

function requireFile(path, message) {
  if (!existsSync(path)) failures.push(`${message}: ${relative(ROOT, path)}`)
}

function requireTrackedFile(path, message) {
  requireFile(path, message)
  if (!existsSync(path)) return
  const rel = relative(ROOT, path)
  if (!getTrackedFileSet().has(rel)) failures.push(`${message} must be git-tracked: ${rel}`)
}

function requireScriptReferenceTracked(ref, message) {
  if (!ref.startsWith('scripts/')) return
  requireTrackedFile(join(ROOT, ref), message)
}

const githubDir = join(ROOT, '.github')
if (!existsSync(githubDir)) failures.push('missing .github directory')

const userStoriesRoot = join(ROOT, '.github', 'user-stories')
if (!existsSync(userStoriesRoot)) {
  failures.push('missing .github/user-stories directory')
} else {
  requireTrackedFile(join(userStoriesRoot, 'README.md'), 'missing user-stories root guide')
  requireTrackedFile(join(userStoriesRoot, '_index.md'), 'missing user-stories root index')

  const groupDirs = readdirSync(userStoriesRoot).filter((entry) => {
    if (entry === 'README.md' || entry === '_index.md') return false
    const abs = join(userStoriesRoot, entry)
    try { return statSync(abs).isDirectory() } catch { return false }
  })

  if (groupDirs.length === 0) {
    failures.push('missing story-group directory under .github/user-stories')
  }

  for (const group of groupDirs) {
    const storyGroupDir = join(userStoriesRoot, group)
    requireTrackedFile(join(storyGroupDir, 'README.md'), `missing story-group guide (${group})`)
    requireTrackedFile(join(storyGroupDir, '_index.md'), `missing story-group index (${group})`)

    const storyFiles = readdirSync(storyGroupDir).filter((entry) => /^US-[A-Z0-9]+-\d{3,4}-.*\.md$/i.test(entry))
    const planningBacklogReadmes = listFilesRecursive(join(storyGroupDir, 'backlog')).filter((file) => {
      if (basename(file) !== 'README.md') return false
      const rel = relative(storyGroupDir, file).replaceAll('\\', '/')
      return /^backlog\/[^/]+\/README\.md$/i.test(rel)
    })

    if (storyFiles.length === 0 && planningBacklogReadmes.length === 0) {
      failures.push(`missing story artifacts in .github/user-stories/${group}: expected US-* files or backlog/<module>/README.md`)
    }
  }

  const rootMarkdown = readdirSync(userStoriesRoot).filter((entry) => {
    if (!entry.endsWith('.md')) return false
    if (entry === 'README.md' || entry === '_index.md') return false
    if (/^[a-z0-9][a-z0-9-]*-(?:governance|structure)-audit-\d{4}-\d{2}-\d{2}\.md$/i.test(entry)) return false
    return true
  })
  if (rootMarkdown.length > 0) failures.push(`user-stories root should not contain ad-hoc markdown docs: ${rootMarkdown.join(', ')}`)
}

if (existsSync(githubDir)) {
  const allMarkdown = listFilesRecursive(githubDir).filter((f) => f.endsWith('.md'))
  const storyIdToFiles = new Map()
  for (const file of allMarkdown) {
    const m = basename(file).match(/^(US-[A-Z]+-\d+)\b/i)
    if (!m) continue
    const id = m[1].toUpperCase()
    const list = storyIdToFiles.get(id) ?? []
    list.push(file)
    storyIdToFiles.set(id, list)
  }
  for (const [id, files] of storyIdToFiles.entries()) {
    if (files.length > 1) failures.push(`duplicate story id ${id} found in multiple files: ${files.map((f) => relative(ROOT, f)).join(', ')}`)
  }

  const legacyBacklogs = allMarkdown.filter((file) => {
    if (basename(file).toLowerCase() !== 'backlog.md') return false
    return true
  })
  for (const file of legacyBacklogs) failures.push(`legacy backlog.md should be retired: ${relative(ROOT, file)}`)
}

if (existsSync(join(ROOT, 'package.json'))) {
  try {
    const pkgRaw = execFileSync('node', ['-e', "process.stdout.write(require('fs').readFileSync('package.json','utf8'))"], { cwd: ROOT, encoding: 'utf8', stdio: ['ignore', 'pipe', 'ignore'] })
    const pkg = JSON.parse(pkgRaw)
    const scripts = pkg?.scripts && typeof pkg.scripts === 'object' ? Object.values(pkg.scripts) : []
    for (const command of scripts) {
      if (typeof command !== 'string') continue
      const matches = command.match(/scripts\/[A-Za-z0-9._/-]+\.(?:mjs|js|sql)/g) || []
      for (const match of matches) requireScriptReferenceTracked(match, 'package.json references missing build/runtime script')
    }
  } catch {
    failures.push('unable to parse package.json for script reference validation')
  }
}

if (failures.length > 0) {
  console.error('check-structure-contract: failed')
  for (const failure of failures) console.error(`  - ${failure}`)
  process.exit(1)
}

console.log('check-structure-contract: clean')
