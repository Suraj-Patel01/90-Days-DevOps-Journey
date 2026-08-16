# Day 26 – GitHub CLI

## 🚀 What I Learned

Today I learned how to use **GitHub CLI (`gh`)** to manage GitHub directly from the terminal.

## 🔐 Authentication

I installed GitHub CLI and authenticated my GitHub account.

```bash
gh auth login
gh auth status
```

`gh` supports authentication through **browser-based OAuth** and **authentication tokens**.

---

## 📦 Repository Management

Useful commands I practiced:

```bash
gh repo create
gh repo clone OWNER/REPO
gh repo view
gh repo list
gh repo view --web
gh repo delete OWNER/REPO
```

These commands allow me to create, clone, view, list, open, and delete GitHub repositories directly from the terminal.

---

## 🐛 Issues

```bash
gh issue create
gh issue list
gh issue view NUMBER
gh issue close NUMBER
```

### How can `gh issue` be used in automation?

`gh issue` can be used in shell scripts or CI/CD workflows to automatically create, update, list, or close issues based on events or project conditions.

---

## 🔀 Pull Requests

```bash
gh pr create
gh pr list
gh pr view NUMBER
gh pr checks NUMBER
gh pr review NUMBER
gh pr merge NUMBER
```

### Merge Methods

`gh pr merge` supports:

* Merge commit
* Squash merge
* Rebase merge

I can review another developer's PR using:

```bash
gh pr view NUMBER
gh pr diff NUMBER
gh pr checks NUMBER
gh pr review NUMBER
```

---

## ⚙️ GitHub Actions

```bash
gh run list
gh run view RUN_ID
gh workflow list
gh workflow view WORKFLOW
```

### Use in CI/CD

`gh run` can help monitor workflow executions and check failures, while `gh workflow` can be used to view, run, and manage GitHub Actions workflows from the terminal.

---

## 🛠️ Useful `gh` Commands

### GitHub API

```bash
gh api repos/OWNER/REPO
```

### Gist

```bash
gh gist create file.txt
```

### Release

```bash
gh release list
gh release create v1.0.0
```

### Alias

```bash
gh alias set pv 'pr view'
```

### Search Repositories

```bash
gh search repos devops
```

---

## 🎯 Key Takeaways

* `gh` allows me to manage GitHub without leaving the terminal.
* It is useful for automation and scripting.
* `--json` output can be used for machine-readable data.
* `gh pr create --fill` can automatically generate PR information.
* GitHub CLI can be useful for DevOps and CI/CD workflows.

## 🔥 Conclusion

GitHub CLI makes GitHub management faster and more automation-friendly. It is an important tool for DevOps engineers who frequently work with repositories, issues, pull requests, and CI/CD workflows.
