# Day 25 – Git Reset vs Revert & Branching Strategies

## Task 1: Git Reset

Git reset moves the current branch to an earlier commit.

### Reset Types

* `--soft` → Removes the commit but keeps changes staged.
* `--mixed` → Removes the commit and unstages changes, but keeps files.
* `--hard` → Removes the commit and changes completely.

### Which is destructive?

`git reset --hard` is destructive because it can permanently remove uncommitted changes.

### When to use?

* **Soft:** Edit the last commit and keep changes staged.
* **Mixed:** Undo a commit but keep the changes.
* **Hard:** Completely discard unwanted changes.

Avoid using `git reset` on commits already pushed and shared with others because it rewrites history.

---

## Task 2: Git Revert

`git revert` creates a new commit that reverses the changes of an earlier commit.

```bash
git revert <commit-hash>
```

The reverted commit **still remains in Git history**, but its changes are undone by a new commit.

### Reset vs Revert

* **Reset:** Rewrites history.
* **Revert:** Keeps history and creates a new undo commit.

Revert is safer for shared branches because it does not rewrite existing history.

---

## Task 3: Reset vs Revert

|                              | `git reset`            | `git revert`           |
| ---------------------------- | ---------------------- | ---------------------- |
| What it does                 | Moves branch backward  | Creates an undo commit |
| Removes commit from history? | Yes                    | No                     |
| Safe for shared branches?    | No                     | Yes                    |
| Best use                     | Local/unpushed commits | Pushed/shared commits  |

---

## Task 4: Branching Strategies

### 1. GitFlow

GitFlow uses multiple branches such as `main`, `develop`, `feature`, `release`, and `hotfix`.

```text
main
 |
develop
 ├── feature
 ├── feature
 └── release
       |
      main
```

**Used for:** Scheduled releases and large projects.

**Pros:** Organized and controlled releases.

**Cons:** More complex and slower.

---

### 2. GitHub Flow

GitHub Flow uses `main` and short-lived feature branches.

```text
main
 |
 └── feature
       |
       └── Pull Request → main
```

**Used for:** Web applications and teams deploying frequently.

**Pros:** Simple and fast.

**Cons:** Less suitable for complex scheduled releases.

---

### 3. Trunk-Based Development

Developers work mainly on `main` using very short-lived branches.

```text
main ──●──●──●──●──●
        \ /
       short branch
```

**Used for:** Fast-moving teams and continuous delivery.

**Pros:** Simple, fast integration.

**Cons:** Requires good testing and CI/CD.

### Which strategy?

* **Startup shipping fast:** GitHub Flow or Trunk-Based Development.
* **Large team with scheduled releases:** GitFlow.
* **Open-source example:** Many modern open-source projects use a main-branch + pull-request workflow similar to GitHub Flow.

---

## Task 5: Git Commands Reference

```bash
# Setup
git config --global user.name "Your Name"
git config --global user.email "you@example.com"
git init

# Basic Workflow
git status
git add .
git commit -m "message"
git log
git diff

# Branching
git branch
git branch feature
git switch feature
git checkout feature
git switch -c feature

# Remote
git remote -v
git push
git pull
git fetch
git clone <url>

# Merge & Rebase
git merge <branch>
git rebase main

# Stash
git stash
git stash list
git stash pop
git stash apply

# Cherry Pick
git cherry-pick <commit-hash>

# Reset
git reset --soft HEAD~1
git reset --mixed HEAD~1
git reset --hard HEAD~1

# Revert
git revert <commit-hash>
```

