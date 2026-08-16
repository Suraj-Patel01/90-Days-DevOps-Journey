# Day 12 – Breather & Revision (Days 01–11)

## Goal

Reviewed the important Linux concepts and commands learned during Days 01–11.

---

# What I Reviewed

### Mindset & Plan

* Reviewed my Day 01 learning plan.
* My goal is still to build strong Linux and DevOps fundamentals.
* I will continue focusing on practical hands-on learning.

### Processes & Services

Commands practiced:

```bash
ps
systemctl status nginx
journalctl -u nginx
```

Observation:

* `ps` shows running processes.
* `systemctl status` shows service status.
* `journalctl` helps check service logs.

### File Skills

Practiced:

```bash
ls -l
mkdir test
cp file.txt backup.txt
chmod 640 file.txt
sudo chown user:group file.txt
```

### Important Commands

Five commands I would use first during an issue:

```bash
ps
systemctl status
journalctl
ls -l
ss -tulpn
```

### User & Group

Checked user information:

```bash
id
```

Checked file ownership:

```bash
ls -l
```

---

# Mini Self-Check

## 1. Which 3 commands save you the most time?

* `systemctl status` – quickly checks service health.
* `journalctl` – helps find service errors.
* `ss -tulpn` – shows listening ports and services.

---

## 2. How do you check if a service is healthy?

```bash
systemctl status nginx
ss -tulpn
curl -I http://localhost
```

---

## 3. How do you safely change ownership and permissions?

Example:

```bash
sudo chown user:group app.log
chmod 640 app.log
```

Verify:

```bash
ls -l app.log
```

---

## 4. What will I focus on improving?

Over the next three days I will focus on:

* Networking fundamentals
* Shell scripting
* Linux troubleshooting
* Practical DevOps commands

---

# Key Takeaways

* Reviewed Linux commands from Days 01–11.
* Practiced processes and service management.
* Refreshed file permissions and ownership.
* Revised important troubleshooting commands.
* Strengthened my Linux fundamentals through hands-on practice.
