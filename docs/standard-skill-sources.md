# Standard Skill Sources

Purpose: track high-value external agent, skill, and orchestration projects without turning them into startup context.

## Rule
These are standard references, not active runtime dependencies.

Agents may use this list to know what exists. They must not clone, install, run setup scripts, or promote content without staging and security review.

## Sources

| Source | Use For | Default Status |
|---|---|---|
| `facebookresearch/HyperAgents` | multi-agent orchestration patterns | reference-only |
| `diegosouzapw/OmniRoute` | routing and provider/model-switch ideas | reference-only |
| `browser-use/browser-use` | browser automation patterns | reference-only |
| `yusufkaraaslan/Skill_Seekers` | skill discovery and skill-library ideas | reference-only |
| `farion1231/cc-switch` | Claude Code model/profile switching ideas | reference-only |
| `Alishahryar1/free-claude-code` | Claude runtime/access pattern research | high-risk reference-only |
| `obra/superpowers` | agent capability/workflow patterns | reference-only |

## Promotion Rules
Before any source becomes active:
1. stage under local private reference sources;
2. run update/security scan;
3. dedupe against existing skills and personas;
4. extract the smallest reusable pattern;
5. update the skill taxonomy or policy instead of importing a whole repo;
6. log the decision.

## High-Risk Boundary
Anything that changes auth, model provider access, browser login behavior, runtime config, or external posting requires explicit approval and security review.

## Routing
Use this document when the user asks to strengthen baseline skills, model switching, browser automation, or cross-agent orchestration from external repos.
