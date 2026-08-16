## this is day 23
today i am practice git and github
# Day 23 – Git Branching & Working with GitHub

## Task 1: Understanding Branches

### 1. What is a branch in Git?

A branch is a separate line of development used to work on features or fixes without affecting `main`.

### 2. Why use branches?

Branches keep `main` stable and allow developers to work on features, fixes, and experiments separately.

### 3. What is `HEAD`?

`HEAD` points to the branch or commit we are currently working on.

### 4. What happens when switching branches?

Git updates the working files to match the selected branch.

---

## Task 2: Branching Commands

```bash
git branch
git branch feature-1
git switch feature-1
git switch -c feature-2
git switch main
git branch -d feature-2
```

`git switch` is mainly used for switching branches, while `git checkout` is an older command with multiple uses.

### Commit on `feature-1`

```bash
git switch feature-1
echo "Feature 1" > feature-1.txt
git add .
git commit -m "Add feature-1"
```

Switch to `main`:

```bash
git switch main
```

The `feature-1` commit will not be present on `main`.

---

## Task 3: Push to GitHub

```bash
git remote add origin https://github.com/USERNAME/devops-git-practice.git
git push -u origin main
git push -u origin feature-1
```

### Origin vs Upstream

* `origin` → Usually your own GitHub repository/fork.
* `upstream` → Usually the original repository.

---

## Task 4: Pull from GitHub

After making a change on GitHub:

```bash
git pull origin main
```

### Fetch vs Pull

* `git fetch` → Downloads changes without merging.
* `git pull` → Downloads and integrates changes.

---

## Task 5: Clone vs Fork

### Clone

Copies a repository from GitHub to your computer.

```bash
git clone <repository-url>
```

### Fork

Creates a copy of another person's repository under your GitHub account.

### Clone vs Fork

* **Clone:** Use when you need a local copy.
* **Fork:** Use when contributing to someone else's project.

### Keep a fork in sync

```bash
git remote add upstream <original-repo-url>
git fetch upstream
git switch main
git merge upstream/main
git push origin main
```

## Summary

Today I learned Git branching, `HEAD`, `git switch`, pushing to GitHub, `fetch` vs `pull`, and clone vs fork.
