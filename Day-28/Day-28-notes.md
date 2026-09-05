# Day 28 – Revision Notes

## DevOps & Cloud

### What is DevOps?

DevOps is a combination of **Development (Dev)** and **Operations (Ops)**. It focuses on collaboration, automation, continuous delivery, and reliable software deployment.

### SDLC

SDLC (Software Development Life Cycle) is the process used to develop software.

Main stages:

1. Planning
2. Requirement Analysis
3. Design
4. Development
5. Testing
6. Deployment
7. Maintenance

### Cloud Computing

Cloud computing provides computing resources such as servers, storage, databases, and networking over the internet.

Common cloud models:

* IaaS – Infrastructure as a Service
* PaaS – Platform as a Service
* SaaS – Software as a Service

---

# Linux Fundamentals

## Linux Architecture

Basic Linux architecture:

```text
User
  ↓
Applications
  ↓
Shell
  ↓
Kernel
  ↓
Hardware
```

### Kernel

The kernel is the core of Linux. It manages:

* CPU
* Memory
* Processes
* Devices
* File systems
* Networking

### Shell

The shell allows users to interact with the operating system through commands.

---

# Important Linux Commands

## File and Directory Management

```bash
pwd
ls
cd
mkdir
touch
cp
mv
rm
rmdir
```

Examples:

```bash
mkdir project
cd project
touch file.txt
cp file.txt backup.txt
mv backup.txt old.txt
rm old.txt
```

## Viewing Files

```bash
cat file.txt
less file.txt
head file.txt
tail file.txt
```

## Searching

```bash
find / -name "file.txt"
grep "error" app.log
```

---

# Linux File System Hierarchy

Important directories:

```text
/
├── /bin
├── /boot
├── /dev
├── /etc
├── /home
├── /opt
├── /tmp
├── /usr
└── /var
```

### Important directories

* `/` – Root of the filesystem
* `/etc` – Configuration files
* `/home` – User home directories
* `/var` – Variable data such as logs
* `/tmp` – Temporary files
* `/boot` – Boot-related files
* `/dev` – Device files
* `/usr` – User applications and utilities
* `/opt` – Optional/third-party software

---

# Linux Processes

A **process** is a running instance of a program.

View processes:

```bash
ps aux
```

Interactive process monitoring:

```bash
top
```

Find a process:

```bash
ps aux | grep nginx
```

Kill a process:

```bash
kill <PID>
```

Force kill:

```bash
kill -9 <PID>
```

### Background and Foreground

Run a command in background:

```bash
command &
```

Bring a background job to foreground:

```bash
fg
```

---

# Process vs Service

A **process** is a running instance of a program.

A **service** is a background program that provides a specific function and is usually managed by the operating system.

Example:

```bash
systemctl status nginx
```

Nginx is a service, while the running Nginx instances are processes.

---

# systemd and Services

`systemd` is a service and system manager used by many Linux distributions.

Check service:

```bash
systemctl status nginx
```

Start:

```bash
sudo systemctl start nginx
```

Stop:

```bash
sudo systemctl stop nginx
```

Restart:

```bash
sudo systemctl restart nginx
```

Enable at boot:

```bash
sudo systemctl enable nginx
```

Disable at boot:

```bash
sudo systemctl disable nginx
```

---

# Linux Troubleshooting

## CPU

```bash
top
```

## Memory

```bash
free -h
```

## Disk space

```bash
df -h
```

## Directory size

```bash
du -sh /var/log
```

Useful troubleshooting approach:

```text
Check CPU
   ↓
Check Memory
   ↓
Check Disk
   ↓
Check Processes
   ↓
Check Services
   ↓
Check Logs
```

---

# Users and Groups

Create a user:

```bash
sudo useradd username
```

Set password:

```bash
sudo passwd username
```

Create a group:

```bash
sudo groupadd developers
```

Add user to group:

```bash
sudo usermod -aG developers username
```

View users:

```bash
cat /etc/passwd
```

---

# File Permissions

Linux permissions contain:

```text
r = read
w = write
x = execute
```

Example:

```text
rwxr-xr-x
```

Permissions are divided into:

```text
Owner | Group | Others
```

## Numeric Permissions

```text
r = 4
w = 2
x = 1
```

Therefore:

```text
7 = rwx
6 = rw-
5 = r-x
4 = r--
```

Example:

```bash
chmod 755 script.sh
```

Means:

```text
Owner  → rwx = 7
Group  → r-x = 5
Others → r-x = 5
```

Result:

```text
rwxr-xr-x
```

---

# Ownership

Change owner:

```bash
sudo chown user file.txt
```

Change owner and group:

```bash
sudo chown user:group file.txt
```

Change group:

```bash
sudo chgrp group file.txt
```

---

# LVM

LVM means **Logical Volume Manager**.

It provides flexible disk management.

Basic structure:

```text
Physical Disk
      ↓
Physical Volume (PV)
      ↓
Volume Group (VG)
      ↓
Logical Volume (LV)
      ↓
Filesystem
```

Important commands:

```bash
pvcreate /dev/sdb
vgcreate myvg /dev/sdb
lvcreate -L 5G -n mylv myvg
```

Check:

```bash
pvs
vgs
lvs
```

### Why use LVM?

LVM makes it easier to:

* Resize volumes
* Add storage
* Manage disks
* Create snapshots
* Manage storage logically

---

# Cloud Server Setup

A cloud server is a virtual machine running on a cloud provider.

Common steps:

```text
Create Server
     ↓
Connect using SSH
     ↓
Update System
     ↓
Install Nginx/Docker
     ↓
Configure Firewall
     ↓
Deploy Application
     ↓
Test Application
```

---

# Docker

Docker is a platform used to package and run applications in **containers**.

Important concepts:

* Image
* Container
* Dockerfile
* Registry
* Volume
* Network

Basic commands:

```bash
docker --version
docker images
docker ps
docker ps -a
docker pull nginx
docker run nginx
docker stop <container>
docker rm <container>
```

### Image vs Container

**Image:** Template used to create a container.

**Container:** Running instance of an image.

```text
Docker Image
     ↓
Docker Container
```

---

# Nginx

Nginx is commonly used as:

* Web server
* Reverse proxy
* Load balancer

Check Nginx:

```bash
systemctl status nginx
```

Test locally:

```bash
curl http://localhost
```

Default HTTP port:

```text
80
```

HTTPS:

```text
443
```

---

# Networking Fundamentals

## IP Address

An IP address identifies a device/interface on a network.

Example:

```text
192.168.1.10
```

## Domain Name

A domain name is a human-readable name that points to an IP address.

Example:

```text
example.com
```

## DNS

DNS means **Domain Name System**.

It converts domain names into IP addresses.

```text
example.com
     ↓
    DNS
     ↓
192.168.1.10
```

Useful commands:

```bash
dig example.com
nslookup example.com
```

---

# Subnet Mask

A subnet mask determines which part of an IP address represents the network and which part represents the host.

Example:

```text
IP:          192.168.1.10
Subnet Mask: 255.255.255.0
```

CIDR notation:

```text
192.168.1.10/24
```

---

# Common Network Commands

Check connectivity:

```bash
ping google.com
```

Test HTTP:

```bash
curl http://example.com
```

Check listening ports:

```bash
ss -ltn
```

Find process using port 8080:

```bash
sudo lsof -i :8080
```

or:

```bash
sudo ss -ltnp | grep :8080
```

---

# Common Ports

| Port | Service                     |
| ---: | --------------------------- |
|   22 | SSH                         |
|   23 | Telnet                      |
|   25 | SMTP                        |
|   53 | DNS                         |
|   80 | HTTP                        |
|  443 | HTTPS                       |
| 3306 | MySQL                       |
| 5432 | PostgreSQL                  |
| 8080 | Common application/web port |

---

# Git Fundamentals

Git is a **distributed version control system** used to track changes in code.

Basic workflow:

```text
Working Directory
       ↓
     git add
       ↓
Staging Area
       ↓
   git commit
       ↓
Local Repository
       ↓
    git push
       ↓
Remote Repository
```

---

# Basic Git Commands

Initialize repository:

```bash
git init
```

Check status:

```bash
git status
```

Stage files:

```bash
git add .
```

Commit:

```bash
git commit -m "Add feature"
```

View history:

```bash
git log --oneline
```

Push:

```bash
git push
```

Pull:

```bash
git pull
```

---

# Git Branching

A branch allows developers to work on features independently.

Create a branch:

```bash
git branch feature-login
```

Create and switch:

```bash
git switch -c feature-login
```

List branches:

```bash
git branch
```

Switch branch:

```bash
git switch main
```

Example:

```text
main
  |
  └── feature-login
          |
          ├── commit
          └── commit
```

---

# Clone vs Fork

### Git Clone

Copies a repository from a remote location to your local computer.

```bash
git clone <repository-url>
```

### Git Fork

Creates your own copy of another person's repository on GitHub.

```text
Original Repository
        ↓
       Fork
        ↓
Your GitHub Repository
```

---

# Git Merge

Merge combines changes from one branch into another.

```bash
git switch main
git merge feature
```

## Fast-Forward Merge

When the target branch has no new commits:

```text
A---B---C---D---E
```

Git simply moves the branch pointer forward.

No merge commit is required.

## Merge Commit

When branches have diverged:

```text
      C---D
     /     \
A---B       M
     \     /
      E---F
```

Git creates a merge commit.

---

# Git Rebase

Rebase moves your branch commits onto a new base.

Before:

```text
A---B---C  main
     \
      D---E  feature
```

After:

```text
A---B---C---D'---E'
```

Command:

```bash
git switch feature
git rebase main
```

### Merge vs Rebase

**Merge:**

* Preserves history
* Can create merge commit
* Safe for shared branches

**Rebase:**

* Creates cleaner linear history
* Rewrites commit history
* Best for your own/private feature branch

Rule:

> Rebase your own work; avoid rebasing shared/public history.

---

# Git Stash

`git stash` temporarily saves uncommitted changes.

```bash
git stash
```

View stashes:

```bash
git stash list
```

Restore changes:

```bash
git stash pop
```

Use stash when you need to temporarily switch branches without committing unfinished work.

---

# Git Cherry-Pick

Cherry-pick copies a specific commit from another branch.

```bash
git cherry-pick <commit-hash>
```

Example:

```text
feature:
A---B---C---D

main:
A---B
```

If you cherry-pick `D`:

```text
main:
A---B---D'
```

Only the selected commit's changes are applied.

---

# Squash Merge

Squash merge combines multiple feature commits into one commit.

Example:

```text
Feature:
C---D---E
```

After squash:

```text
main:
A---B---S
```

Where `S` contains the changes from `C`, `D`, and `E`.

### Regular Merge vs Squash Merge

**Regular merge:**

* Keeps individual commits
* Preserves detailed history

**Squash merge:**

* Combines commits into one
* Produces a cleaner main branch history

---

# Git Reset

Reset moves the current branch pointer to another commit.

## Soft Reset

```bash
git reset --soft HEAD~1
```

Removes the commit but keeps changes staged.

## Mixed Reset

```bash
git reset --mixed HEAD~1
```

Removes the commit and unstages changes, but keeps files modified.

## Hard Reset

```bash
git reset --hard HEAD~1
```

Removes the commit and discards the changes.

### Warning

Do not use `reset --hard` carelessly because uncommitted changes can be lost.

---

# Git Revert

Revert creates a new commit that reverses an earlier commit.

```bash
git revert <commit-hash>
```

Example:

```text
A---B---C
        ↓
       revert C
        ↓
A---B---C---D
```

`D` reverses the changes introduced by `C`.

### Reset vs Revert

```text
Reset  → changes existing history
Revert → creates a new commit to undo changes
```

For shared branches, `git revert` is generally safer.

---

# Git Fetch vs Git Pull

### git fetch

```bash
git fetch
```

Downloads changes from the remote repository but does not integrate them into your current branch.

### git pull

```bash
git pull
```

Downloads and integrates remote changes.

Simple:

```text
fetch = download
pull  = download + integrate
```

---

# GitHub Flow

GitHub Flow is a simple branching strategy.

```text
main
  ↓
feature branch
  ↓
Pull Request
  ↓
Code Review
  ↓
Merge
  ↓
main
```

It works well for teams that release frequently.

---

# GitFlow

GitFlow uses multiple long-lived branches such as:

```text
main
develop
feature
release
hotfix
```

It provides more structure but is more complicated than GitHub Flow.

---

# Trunk-Based Development

Developers work mainly around one shared branch called the **trunk** or `main`.

Features are integrated frequently, often using short-lived branches.

```text
        feature
           ↓
main ←─────┘
```

The goal is to keep branches short-lived and integrate changes frequently.

---

# GitHub CLI

GitHub CLI allows GitHub operations from the terminal.

Check installation:

```bash
gh --version
```

Login:

```bash
gh auth login
```

Create repository:

```bash
gh repo create
```

Create issue:

```bash
gh issue create
```

Create pull request:

```bash
gh pr create
```

View pull requests:

```bash
gh pr list
```

---

# Quick-Fire Revision

## 1. What does `chmod 755 script.sh` do?

It gives:

```text
Owner  → read/write/execute
Group  → read/execute
Others → read/execute
```

Permissions:

```text
rwxr-xr-x
```

---

## 2. Process vs Service

A process is a running instance of a program.

A service is a background program managed by the operating system, usually through `systemd`.

---

## 3. Find the process using port 8080

```bash
sudo lsof -i :8080
```

or:

```bash
sudo ss -ltnp | grep :8080
```

---

## 4. Reset vs Revert

```text
reset  → moves branch history backward
revert → creates a new commit that undoes changes
```

---

## 5. Recommended branching strategy for a small team

For a team of around 5 developers releasing frequently, **GitHub Flow** is a simple choice:

```text
feature → Pull Request → main
```

---

## 6. What does git stash do?

It temporarily saves uncommitted changes so you can switch branches or perform another task.

```bash
git stash
git stash pop
```

---

## 7. How do you run a script every day at 3 AM?

Use cron:

```bash
crontab -e
```

Then:

```text
0 3 * * * /path/to/script.sh
```

---

## 8. git fetch vs git pull

```text
git fetch → downloads remote changes
git pull  → downloads and integrates remote changes
```

---

## 9. What is LVM?

LVM stands for **Logical Volume Manager**.

It provides flexible storage management using:

```text
PV → VG → LV
```

It is useful for resizing and managing storage more easily than traditional fixed partitions.

---

# Day 28 Weak Spots

The three areas I need to revisit are:

1. **Linux Process and systemd Management**
2. **LVM**
3. **Git Reset, Revert and Branching Strategies**

I will practice these topics hands-on instead of only reading the theory.

---

# What I Learned

During the first 27 days, I learned the basics of DevOps, Linux, cloud servers, Docker, Nginx, users and permissions, LVM, networking, Git, GitHub, and GitHub CLI.

I also learned how developers and operations teams use Linux and Git in real-world environments.

The most important lesson is that DevOps is not only about knowing commands. It is about understanding how systems, applications, infrastructure, networking, and version control work together.
