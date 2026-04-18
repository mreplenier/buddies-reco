# Buddie's Reco

A new Flutter project.


## Branch naming convention

| Prefix | Usage |
|--------|-------|
| `feature/[issue_id-]short-description` | New feature |
| `bugfix/[issue_id-]short-description` | Bug fix |
| `hotfix/[issue_id-]short-description` | Urgent fix directly on `main` |
| `refactor/[issue_id-]short-description` | Refactoring without functional change |
| `test/[issue_id-]short-description` | Adding or updating tests |
| `docs/[issue_id-]short-description` | Documentation only |

> 💡 `[issue_id-]` is optional — include it when a GitHub issue exists for that task.


## Commit Message Convention

> 💡 This convention applies to **squash merge commits into `dev`** only — not to individual commits on feature branches.

Format: `<type>: <short description>`

| Type | Usage |
|------|-------|
| `feat` | New feature |
| `fix` | Bug fix |
| `refactor` | Refactoring (neither a feature nor a bug fix) |
| `style` | Formatting, whitespace, missing semicolons (no logic change) |
| `test` | Adding or updating tests |
| `docs` | Documentation only |
| `chore` | Maintenance tasks (dependencies, config…) |
| `revert` | Reverting a previous commit |

