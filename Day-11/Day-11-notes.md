# Day 11 – File Ownership Challenge

## Objective

Learned how to manage Linux file and directory ownership using `chown` and `chgrp`.

---

# Quick Concepts

Linux files have two important ownership fields:

* **Owner** – User who owns the file.
* **Group** – Group associated with the file.

Example:

```text
-rw-r--r-- 1 suraj suraj 0 devops-file.txt
```

---

# Files & Directories Created

* `devops-file.txt`
* `team-notes.txt`
* `project-config.yaml`
* `app-logs/`
* `heist-project/`
* `bank-heist/`

---

# Ownership Changes

```bash
sudo chown tokyo devops-file.txt
sudo chown berlin devops-file.txt

sudo groupadd heist-team
sudo chgrp heist-team team-notes.txt

sudo chown professor:heist-team project-config.yaml

sudo chown berlin:heist-team app-logs
```

---

# Recursive Ownership

Created the directory structure:

```bash
mkdir -p heist-project/vault
mkdir -p heist-project/plans

touch heist-project/vault/gold.txt
touch heist-project/plans/strategy.conf
```

Created the group:

```bash
sudo groupadd planners
```

Changed ownership recursively:

```bash
sudo chown -R professor:planners heist-project/
```

Verified using:

```bash
ls -lR heist-project/
```

---

# Practice Challenge

Created users:

```bash
sudo useradd tokyo
sudo useradd berlin
sudo useradd nairobi
```

Created groups:

```bash
sudo groupadd vault-team
sudo groupadd tech-team
```

Created files:

```bash
mkdir bank-heist

touch bank-heist/access-codes.txt
touch bank-heist/blueprints.pdf
touch bank-heist/escape-plan.txt
```

Set ownership:

```bash
sudo chown tokyo:vault-team bank-heist/access-codes.txt
sudo chown berlin:tech-team bank-heist/blueprints.pdf
sudo chown nairobi:vault-team bank-heist/escape-plan.txt
```

Verified with:

```bash
ls -l bank-heist/
```

---

# Key Commands

### View ownership

```bash
ls -l filename
```

### Change owner

```bash
sudo chown user filename
```

### Change group

```bash
sudo chgrp group filename
```

### Change owner and group

```bash
sudo chown user:group filename
```

### Recursive ownership

```bash
sudo chown -R user:group directory/
```

---

# What I Learned

* Learned the difference between file **owner and group**.
* Practiced `chown` and `chgrp`.
* Learned how to change ownership recursively using `chown -R`.
* Understood how ownership helps control access to Linux files.
