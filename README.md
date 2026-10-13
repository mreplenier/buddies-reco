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



<<<<<<< HEAD
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
=======
For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.




## Prérequis et environnement local

- **Flutter** : `3.47.4` (Dart `3.13.3`, DevTools `2.60.0`)
- **Bundle ID** : `com.buddiesreco.app`

### Android
- **Java** : OpenJDK 17 (`brew install openjdk@17` puis lier le JDK au système)
- **Gradle** : `8.14` (géré automatiquement via le wrapper)
- **AGP (Android Gradle Plugin)** : `8.11.1` (configuré dans `android/settings.gradle`)
- **KGP (Kotlin Gradle Plugin)** : `2.1.0` (configuré dans `android/settings.gradle`)

### iOS
- **Xcode** : version compatible avec iOS 15.0+ (deployment target configuré)
- **Gestionnaire de dépendances** : Swift Package Manager
>>>>>>> 380f69e (chore: setup project skeleton and native build configs for both android & ios (#21))
