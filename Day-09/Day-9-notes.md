# Day 09 – Linux User & Group Management Challenge

## Objective

Today's goal was to practice Linux user and group management by creating users, assigning groups, and configuring shared directories with group permissions.

---

# Task 1: Create Users

Created the following users with home directories:

* `tokyo`
* `berlin`
* `professor`
* `nairobi`

### Create Users

```bash
sudo useradd -m tokyo
sudo useradd -m berlin
sudo useradd -m professor
sudo useradd -m nairobi
```

### Set Passwords

```bash
sudo passwd tokyo
sudo passwd berlin
sudo passwd professor
sudo passwd nairobi
```

### Verify Users

```bash
cat /etc/passwd | grep -E 'tokyo|berlin|professor|nairobi'
```

### Check Home Directories

```bash
ls -ld /home/tokyo /home/berlin /home/professor /home/nairobi
```

**Observation:** The users were created with their respective home directories.

---

# Task 2: Create Groups

Created three groups:

* `developers`
* `admins`
* `project-team`

### Commands

```bash
sudo groupadd developers
sudo groupadd admins
sudo groupadd project-team
```

### Verify Groups

```bash
cat /etc/group | grep -E 'developers|admins|project-team'
```

**Observation:** All required groups were created successfully.

---

# Task 3: Assign Users to Groups

## Group Assignments

| **User**    | **Groups**         |
| ----------- | ------------------ |
| `tokyo`     | developers         |
| `berlin`    | developers, admins |
| `professor` | admins             |
| `nairobi`   | project-team       |
| `tokyo`     | project-team       |

### Add Users to Groups

```bash
sudo usermod -aG developers tokyo
sudo usermod -aG developers berlin
sudo usermod -aG admins berlin
sudo usermod -aG admins professor

sudo usermod -aG project-team nairobi
sudo usermod -aG project-team tokyo
```

### Verify Membership

```bash
groups tokyo
groups berlin
groups professor
groups nairobi
```

**Observation:** Each user was assigned to the required groups.

---

# Task 4: Shared Developer Directory

Created:

```text
/opt/dev-project
```

### Create Directory

```bash
sudo mkdir -p /opt/dev-project
```

### Change Group Ownership

```bash
sudo chgrp developers /opt/dev-project
```

### Set Permissions

```bash
sudo chmod 775 /opt/dev-project
```

### Verify

```bash
ls -ld /opt/dev-project
```

Expected permission structure:

```text
drwxrwxr-x
```

**Observation:** The `developers` group has read, write, and execute permissions.

---

## Test File Creation

### As Tokyo

```bash
sudo -u tokyo touch /opt/dev-project/tokyo-file.txt
```

### As Berlin

```bash
sudo -u berlin touch /opt/dev-project/berlin-file.txt
```

### Verify

```bash
ls -l /opt/dev-project
```

**Observation:** Both users were able to create files because they belong to the `developers` group.

---

# Task 5: Team Workspace

Created:

```text
/opt/team-workspace
```

### Create Directory

```bash
sudo mkdir -p /opt/team-workspace
```

### Set Group Ownership

```bash
sudo chgrp project-team /opt/team-workspace
```

### Set Permissions

```bash
sudo chmod 775 /opt/team-workspace
```

### Verify

```bash
ls -ld /opt/team-workspace
```

Expected:

```text
drwxrwxr-x
```

---

## Test as Nairobi

```bash
sudo -u nairobi touch /opt/team-workspace/nairobi-file.txt
```

### Verify

```bash
ls -l /opt/team-workspace
```

**Observation:** `nairobi` was able to create a file because the user belongs to the `project-team` group.

---

# Users & Groups Created

### Users

* `tokyo`
* `berlin`
* `professor`
* `nairobi`

### Groups

* `developers`
* `admins`
* `project-team`

---

# Group Assignments

| **User**    | **Group Membership**     |
| ----------- | ------------------------ |
| `tokyo`     | developers, project-team |
| `berlin`    | developers, admins       |
| `professor` | admins                   |
| `nairobi`   | project-team             |

---

# Directories Created

| **Directory**         | **Group Owner** | **Permissions** |
| --------------------- | --------------- | --------------- |
| `/opt/dev-project`    | developers      | `775`           |
| `/opt/team-workspace` | project-team    | `775`           |

---

# Commands Used

```bash
sudo useradd -m tokyo
sudo useradd -m berlin
sudo useradd -m professor
sudo useradd -m nairobi

sudo passwd tokyo
sudo passwd berlin
sudo passwd professor
sudo passwd nairobi

sudo groupadd developers
sudo groupadd admins
sudo groupadd project-team

sudo usermod -aG developers tokyo
sudo usermod -aG developers berlin
sudo usermod -aG admins berlin
sudo usermod -aG admins professor
sudo usermod -aG project-team nairobi
sudo usermod -aG project-team tokyo

groups tokyo
groups berlin
groups professor
groups nairobi

sudo mkdir -p /opt/dev-project
sudo chgrp developers /opt/dev-project
sudo chmod 775 /opt/dev-project

sudo -u tokyo touch /opt/dev-project/tokyo-file.txt
sudo -u berlin touch /opt/dev-project/berlin-file.txt

sudo mkdir -p /opt/team-workspace
sudo chgrp project-team /opt/team-workspace
sudo chmod 775 /opt/team-workspace

sudo -u nairobi touch /opt/team-workspace/nairobi-file.txt

ls -ld /opt/dev-project
ls -ld /opt/team-workspace
ls -l /opt/dev-project
ls -l /opt/team-workspace
```

---

# Troubleshooting

## Permission Denied

If permission is denied, first check the user's groups:

```bash
groups username
```

Then check directory permissions:

```bash
ls -ld /path
```

If necessary, verify the group ownership:

```bash
ls -ld /opt/dev-project
```

---

# What I Learned

* Learned how to create Linux users and manage their passwords.
* Learned how to create groups and assign users using `usermod -aG`.
* Practiced managing group ownership using `chgrp`.
* Learned how `chmod 775` provides group write access.
* Practiced testing permissions using `sudo -u`.
* Understood how shared team directories can be configured in Linux.

---

# Real Production Use

Linux user and group management is important for:

* Controlling server access.
* Managing DevOps team permissions.
* Creating shared project directories.
* Securing application files.
* Managing SSH users.
* Following the principle of least privilege.
* Managing access to production servers and resources.
