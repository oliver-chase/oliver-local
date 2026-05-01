---
name: nextjs-scaffold
description: Scaffold a production-ready Next.js 14+ project with TypeScript, Tailwind CSS, shadcn/ui, dark mode, and ESLint. Use when user asks to create/bootstrap a new Next.js project.
---

# Next.js Project Scaffold

Scaffold a complete Next.js project with TypeScript, Tailwind, shadcn/ui.

## Quick scaffold via script (non-interactive)

```bash
curl -O https://raw.githubusercontent.com/gbechtold/Claude-to-React-Next/refs/heads/main/nextjs-setup-script.sh
chmod +x nextjs-setup-script.sh
./nextjs-setup-script.sh
```

## Manual scaffold steps

```bash
npx create-next-app@latest <project-name> --typescript --tailwind --eslint --app --src-dir --use-npm
cd <project-name>
npm install class-variance-authority clsx tailwind-merge @radix-ui/react-select @radix-ui/react-switch @radix-ui/react-slider lucide-react
```

## Project structure produced

```
src/
├── app/
│   ├── globals.css        # Tailwind + CSS variables (light/dark)
│   ├── layout.tsx         # RootLayout, Inter font, suppressHydrationWarning
│   └── page.tsx
├── components/
│   ├── ui/                # shadcn/ui components
│   └── ClientWrapper.tsx
├── lib/
│   ├── constants.ts
│   ├── types.ts
│   └── utils.ts           # cn() utility
```

## Install shadcn/ui components

```bash
npx shadcn-ui@latest init
npx shadcn-ui@latest add button card select switch
```

## Key files to create

### src/lib/utils.ts
```ts
import { type ClassValue, clsx } from "clsx"
import { twMerge } from "tailwind-merge"

export function cn(...inputs: ClassValue[]) {
  return twMerge(clsx(inputs))
}
```

### layout.tsx pattern
```tsx
import type { Metadata } from "next"
import { Inter } from "next/font/google"
import "./globals.css"

const inter = Inter({ subsets: ["latin"] })

export const metadata: Metadata = {
  title: "App",
  description: "Description",
}

export default function RootLayout({ children }: { children: React.ReactNode }) {
  return (
    <html lang="en" suppressHydrationWarning>
      <body className={inter.className}>{children}</body>
    </html>
  )
}
```

## Config refs

Full production configs (Next.js 15, shadcn, Tailwind, Drizzle, Vercel AI SDK, MCP servers):
`~/references/claude-code-configs/configurations/`

Use `npx claude-config-composer` to merge multiple configs interactively.
