# Day 22 – Introduction to Git

## 1. What is the difference between `git add` and `git commit`?

`git add` moves selected changes from the working directory into the staging area. It tells Git which changes should be included in the next commit.

`git commit` takes the changes from the staging area and permanently records them in the Git repository with a commit message.

Example:

```bash
git add git-commands.md
git commit -m "Update Git commands"
```

---

## 2. What does the staging area do? Why doesn't Git just commit directly?

The staging area allows us to choose exactly which changes should be included in the next commit.

For example, if we modify three files but only want to commit one of them, we can stage only that file.

```bash
git add file1.txt
git commit -m "Update file1"
```

This makes commits more organized and meaningful.

---

## 3. What information does `git log` show you?

`git log` displays the commit history of a Git repository.

It normally shows:

* Commit ID (hash)
* Author
* Date
* Commit message

Example:

```bash
git log
```

For a shorter view:

```bash
git log --oneline
```

---

## 4. What is the `.git/` folder and what happens if you delete it?

The `.git/` folder contains the internal data that makes a directory a Git repository.

It stores important information such as:

* Commit history
* Branch information
* Repository configuration
* Git objects
* References

If the `.git/` folder is deleted, the project files themselves normally remain, but the Git repository information and commit history are lost.

The directory will no longer be recognized as a Git repository.

---

## 5. What is the difference between a working directory, staging area, and repository?

### Working Directory

The working directory contains the actual project files that we create and modify.

Example:

```text
git-commands.md
day-22-notes.md
```

Changes made to these files initially exist in the working directory.

### Staging Area

The staging area contains the changes that have been selected for the next commit.

We move changes there using:

```bash
git add
```

### Repository

The repository contains the committed version history of the project.

We create a commit using:

```bash
git commit
```

### Simple Workflow

```text
Working Directory
       |
       | git add
       ↓
Staging Area
       |
       | git commit
       ↓
Git Repository
```

## Day 22 Summary

Today I learned the basic Git workflow:

```text
Create/Modify → git add → Staging Area → git commit → Repository
```

I also created my first Git repository, explored the `.git` directory, created a Git command reference, and built a commit history with multiple commits.

