# Buddie's Reco

A new Flutter project.


## Contributing
 
### General Rules
- Use **English** for branch names, commit messages, and Merge Request titles.
- One branch = one task (short-lived).
- Rebase your branch on `main` before opening a Merge Request.
- Merge via **squash merge** only → one clean commit per feature.
- Always go through a **Merge Request**, even when working solo.
- Delete the branch after merge.
 
### Branch Naming
 
Branches must follow the format `<type>/<short-description>` with words separated by hyphens.
 
| Type | Usage |
| --- | --- |
| `feature` | New functionality |
| `bugfix` | Bug fix |
| `refactor` | Refactoring without functional change |
| `docs` | Documentation only |
| `chore` | Maintenance, dependencies, config |
 
**Examples:**
```
feature/user-profile-screen
bugfix/recommendation-list-overflow
refactor/simplify-api-supabase-calls
docs/update-setup-guide
chore/upgrade-flutter-3-22
```



### Commit Messages (squash merge)
 
Merge commits follow the [Conventional Commits](https://www.conventionalcommits.org/) convention:
 
| Type | Usage |
| --- | --- |
| `feat` | New functionality |
| `fix` | Bug fix |
| `refactor` | Refactoring |
| `docs` | Documentation |
| `chore` | Maintenance, dependencies |
 
**Examples:**
```
feat: implement user profile screen with avatar upload
fix: resolve recommendation list overflow on small screens
refactor: simplify Supabase API calls in data layer
docs: update flutter setup guide for macOS
chore: upgrade flutter to 3.22.0
```