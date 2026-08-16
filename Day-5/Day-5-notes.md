# Day 05 – Linux Troubleshooting Runbook: CPU, Memory, and Logs

## Objective

Today's goal was to practice a repeatable Linux troubleshooting routine by checking system health, resources, network connectivity, and service logs.

### Target Service

**SSH (`ssh`)**

---

# 1. Environment Basics

## Check System Information

```bash
uname -a
```

**Observation:** Displayed the Linux kernel version, system architecture, hostname, and operating system information.

## Check OS Information

```bash
cat /etc/os-release
```

**Observation:** Displayed the Linux distribution name and version.

---

# 2. Filesystem Sanity

## Create Temporary Directory

```bash
mkdir -p /tmp/runbook-demo
```

**Observation:** Created a temporary directory for testing without modifying important system files.

## Copy and Check File

```bash
cp /etc/hosts /tmp/runbook-demo/hosts-copy && ls -l /tmp/runbook-demo
```

**Observation:** Successfully copied the `/etc/hosts` file and verified the new file using `ls`.

---

# 3. CPU & Memory

## Check CPU and Processes

```bash
top
```

**Observation:** Checked CPU usage, memory usage, load average, and running processes. No unusual CPU spike was observed during the check.

## Check Memory

```bash
free -h
```

**Observation:** Displayed total, used, free, and available memory in a human-readable format.

---

# 4. Disk & I/O

## Check Disk Usage

```bash
df -h
```

**Observation:** Checked filesystem capacity and available disk space. No critical disk usage was observed.

## Check Log Directory Size

```bash
du -sh /var/log
```

**Observation:** Checked how much disk space was being used by system logs.

---

# 5. Network

## Check Listening Ports

```bash
ss -tulpn
```

**Observation:** Verified listening services and checked whether SSH was listening on port `22`.

## Test Local SSH Port

```bash
nc -zv localhost 22
```

**Observation:** Successfully connected to port `22`, confirming that the SSH service was reachable locally.

---

# 6. Logs

## Check SSH Logs

```bash
journalctl -u ssh -n 50
```

**Observation:** Reviewed the latest SSH service logs and checked for recent errors or failed connections.

## Check Authentication Logs

```bash
tail -n 50 /var/log/auth.log
```

**Observation:** Reviewed recent authentication activity and checked for suspicious or failed login attempts.

---

# Quick Findings

* CPU and memory usage were within normal limits.
* Disk space was sufficient for normal operation.
* SSH was listening on port `22`.
* Local connectivity to SSH was successful.
* Recent SSH logs did not show any critical service errors.
* System logs were checked before taking any corrective action.

---

# Mini Runbook

When SSH is not working, I would follow this sequence:

```text
Check service
      ↓
systemctl status ssh
      ↓
Check CPU & Memory
      ↓
top / free -h
      ↓
Check port
      ↓
ss -tulpn
      ↓
Test connectivity
      ↓
nc -zv localhost 22
      ↓
Check logs
      ↓
journalctl -u ssh -n 50
```

This approach helps collect evidence before restarting the service.

---

# If This Worsens

### 1. Restart the Service

```bash
sudo systemctl restart ssh
```

Then verify:

```bash
systemctl status ssh
```

### 2. Collect More Detailed Logs

Increase logging temporarily if required and investigate the latest errors using:

```bash
journalctl -u ssh --since "30 minutes ago"
```

### 3. Trace the Problem

If the issue continues, collect more detailed process information and use tools such as:

```bash
strace -p <PID>
```

I would also check firewall rules, SSH configuration, authentication failures, and system resource usage.

---

# Commands Used

```bash
uname -a
cat /etc/os-release
mkdir -p /tmp/runbook-demo
cp /etc/hosts /tmp/runbook-demo/hosts-copy
ls -l /tmp/runbook-demo
top
free -h
df -h
du -sh /var/log
ss -tulpn
nc -zv localhost 22
journalctl -u ssh -n 50
tail -n 50 /var/log/auth.log
```

---

# What I Learned

* Learned how to capture system health information before troubleshooting.
* Practiced checking CPU, memory, disk, and network resources.
* Learned how to investigate service logs using `journalctl` and `tail`.
* Built a repeatable troubleshooting workflow for Linux services.
* Understood why collecting evidence before restarting a service is important in production.

---

# Real Production Use

A troubleshooting runbook helps DevOps Engineers:

* Reduce incident response time.
* Identify resource bottlenecks.
* Troubleshoot failed services.
* Analyze logs before taking action.
* Avoid guesswork during production incidents.
* Create repeatable procedures for common problems.
