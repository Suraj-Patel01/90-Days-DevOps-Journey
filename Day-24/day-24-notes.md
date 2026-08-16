# Day 24 – Advanced Git: Merge, Rebase, Stash & Cherry Pick

## Task 1: Git Merge

### Fast-Forward Merge

A fast-forward merge happens when `main` has no new commits after the feature branch was created.

```bash
git switch main
git merge feature-login
```

### Merge Commit

A merge commit is created when both branches have new commits.

### Merge Conflict

A merge conflict occurs when Git cannot automatically combine changes, usually because the same line was changed in both branches.

```bash
git status
# Fix the conflict
git add .
git commit
```

---

## Task 2: Git Rebase

Rebase moves/replays your commits on top of the latest `main` history.

```bash
git switch feature-dashboard
git rebase main
```

### Rebase vs Merge

* **Merge:** Preserves branch history and may create a merge commit.
* **Rebase:** Creates a cleaner, linear history.

Use **rebase** for cleaning local history and **merge** when preserving shared history is important.

**Do not rebase commits that have already been shared**, because rebase changes commit history and can cause problems for other developers.

---

## Task 3: Squash vs Merge

### Squash Merge

```bash
git switch main
git merge --squash feature-profile
git commit -m "Add profile feature"
```

Multiple feature commits become **one commit** on `main`.

### Regular Merge

```bash
git merge feature-settings
```

It preserves the individual commits and branch history.

**Squash:** Good for keeping `main` clean.

**Regular merge:** Good when complete development history is useful.

**Trade-off:** Squashing makes history cleaner but removes the individual commit history from `main`.

---

## Task 4: Git Stash

Stash temporarily saves uncommitted changes.

```bash
git stash
```

List stashes:

```bash
git stash list
```

Apply and remove the latest stash:

```bash
git stash pop
```

Apply without removing it:

```bash
git stash apply
```

### `pop` vs `apply`

* `git stash pop` → Applies and removes the stash.
* `git stash apply` → Applies but keeps the stash.

Use stash when you need to temporarily switch branches without committing unfinished work.

---

## Task 5: Cherry Pick

Cherry-pick applies a specific commit from another branch.

```bash
git log --oneline
git switch main
git cherry-pick COMMIT_HASH
```

It is useful when you need only one specific fix or feature from another branch.

### Possible Problems

Cherry-picking can cause:

* Merge conflicts
* Duplicate changes
* Dependency problems

---

## Useful Commands

```bash
git merge <branch>
git merge --squash <branch>

git rebase main

git stash
git stash push -m "description"
git stash list
git stash pop
git stash apply

git cherry-pick <commit-hash>

git log --oneline --graph --all
```

## Summary

Today I learned:

* Merge and merge conflicts
* Fast-forward merge
* Rebase
* Squash merge
* Git stash
* Cherry-pick
* How to maintain a clean Git history
