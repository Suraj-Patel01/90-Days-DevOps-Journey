# Day 03 – Linux Commands Cheat Sheet

## Objective

Today's goal was to build confidence with essential Linux commands used for process management, file system operations, and networking troubleshooting.

---

# Process Management

| Command         | Usage                                         |
| --------------- | --------------------------------------------- |
| `ps aux`        | Display all running processes.                |
| `top`           | Monitor processes and system resource usage.  |
| `htop`          | Interactive process monitoring.               |
| `pgrep nginx`   | Find the PID of a process by name.            |
| `pidof nginx`   | Find the PID of a running program.            |
| `kill <PID>`    | Send a signal to a process.                   |
| `kill -9 <PID>` | Forcefully terminate a process.               |
| `jobs`          | Display background jobs in the current shell. |
| `fg`            | Bring a background job to the foreground.     |
| `bg`            | Continue a stopped job in the background.     |

---

# File System Commands

| Command                     | Usage                                             |
| --------------------------- | ------------------------------------------------- |
| `pwd`                       | Show the current working directory.               |
| `ls`                        | List files and directories.                       |
| `ls -la`                    | Show detailed information including hidden files. |
| `cd <dir>`                  | Change the current directory.                     |
| `mkdir <dir>`               | Create a new directory.                           |
| `touch file.txt`            | Create an empty file.                             |
| `cp file1 file2`            | Copy a file.                                      |
| `mv file1 file2`            | Move or rename a file.                            |
| `rm file.txt`               | Remove a file.                                    |
| `find / -name file.txt`     | Search for a file.                                |
| `cat file.txt`              | Display file contents.                            |
| `less file.txt`             | View a file page by page.                         |
| `head file.txt`             | Display the first lines of a file.                |
| `tail file.txt`             | Display the last lines of a file.                 |
| `grep "text" file.txt`      | Search for text inside a file.                    |
| `chmod 640 file.txt`        | Change file permissions.                          |
| `chown user:group file.txt` | Change file ownership.                            |
| `df -h`                     | Check disk space usage.                           |
| `du -sh <dir>`              | Check directory size.                             |

---

# Networking Commands

### 1. Check IP Address

```bash
ip addr
```

Displays network interfaces and assigned IP addresses.

### 2. Test Connectivity

```bash
ping google.com
```

Checks network connectivity and latency.

### 3. DNS Lookup

```bash
dig google.com
```

Displays DNS records and resolves a domain to an IP address.

### 4. HTTP Check

```bash
curl -I https://google.com
```

Checks HTTP response headers and status code.

### 5. Check Listening Ports

```bash
ss -tulpn
```

Displays listening TCP/UDP ports and services.

---

# Service & System Commands

| Command                   | Usage                                  |
| ------------------------- | -------------------------------------- |
| `systemctl status nginx`  | Check service status.                  |
| `systemctl restart nginx` | Restart a service.                     |
| `systemctl enable nginx`  | Enable a service at boot.              |
| `journalctl -u nginx`     | View service logs.                     |
| `free -h`                 | Check memory usage.                    |
| `uptime`                  | Check system uptime and load average.  |
| `uname -a`                | Display kernel and system information. |

---

# Quick Troubleshooting Flow

When a service is not working:

```text
Check service
      ↓
systemctl status <service>
      ↓
Check logs
      ↓
journalctl -u <service>
      ↓
Check processes
      ↓
ps aux / top
      ↓
Check ports
      ↓
ss -tulpn
      ↓
Check network
      ↓
ping / ip addr / dig / curl
```

---

# What I Learned

* Practiced essential Linux commands for daily administration.
* Learned how to inspect and manage processes.
* Improved my understanding of Linux file system commands.
* Practiced networking troubleshooting using `ping`, `ip`, `dig`, `curl`, and `ss`.
* Learned a basic troubleshooting flow for production issues.

---

# Real Production Use

These commands are useful for:

* Troubleshooting server issues
* Managing Linux services
* Checking CPU and memory usage
* Investigating application failures
* Checking disk space
* Debugging DNS and network problems
* Monitoring listening ports
* Analyzing service logs
