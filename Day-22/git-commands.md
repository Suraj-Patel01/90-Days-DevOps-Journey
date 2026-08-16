# Git Commands Reference

## Setup & Config

### git --version
Checks the installed Git version.

Example:
git --version

### git config --global user.name
Sets the Git username.

Example:
git config --global user.name "Your Name"

### git config --global user.email
Sets the Git email.

Example:
git config --global user.email "your@email.com"

### git config --list
Displays Git configuration.

Example:
git config --list

## Basic Workflow

### git init
Initializes a new Git repository.

Example:
git init

### git status
Shows the current state of the working directory.

Example:
git status

### git add
Stages files for the next commit.

Example:
git add git-commands.md

### git commit
Creates a commit from staged changes.

Example:
git commit -m "Add Git commands reference"

## Viewing Changes

### git diff
Shows unstaged changes.

Example:
git diff

### git diff --staged
Shows changes that are staged.

Example:
git diff --staged

### git log
Shows commit history.

Example:
git log

### git log --oneline
Shows commit history in compact format.

Example:
git log --oneline


### git branch -d <branch-name>
to delete a branch

Example:
git branch -d dev


### git branch <branch-name>
Make a new branch in a working directory

Example:
git branch feature-1

### git checkout 
Switch to another branch

Example:
git checkout feature-1

### git branch
List all branch

Example:
git branch
