# Day 02 – Linux Architecture, Processes, and systemd

## Objective

Today's goal was to understand how Linux works internally, including its architecture, processes, and `systemd`.

---

# Linux Architecture

Linux can be understood through three main components:

### 1. Kernel

* The core of the Linux operating system.
* Manages CPU, memory, storage, devices, and networking.
* Provides communication between hardware and applications.

### 2. User Space

* The environment where applications and commands run.
* Includes shells, utilities, libraries, and user applications.
* Users interact with Linux mainly through user space.

### 3. Init / systemd

* `systemd` is the default initialization and service manager on many modern Linux distributions.
* It starts and manages services during system boot.
* It can start, stop, restart, and monitor services.

---

# Linux Processes

A **process** is a running instance of a program.

Processes are created when applications or commands are executed.

### Common Process States

* **Running (R)** – Process is currently running or ready to run.
* **Sleeping (S)** – Process is waiting for an event or resource.
* **Disk Sleep (D)** – Process is waiting for I/O and cannot normally be interrupted.
* **Stopped (T)** – Process execution has been stopped.
* **Zombie (Z)** – Process has finished, but its parent has not collected its exit status.

---

# Useful Commands

### 1. View Processes

```bash
ps aux
```

### 2. Monitor Processes

```bash
top
```

### 3. Find a Process

```bash
pgrep nginx
```

### 4. Check Process Details

```bash
ps -p <PID> -f
```

### 5. Manage Services

```bash
systemctl status nginx
```

---

# systemd Commands

Check service status:

```bash
systemctl status nginx
```

Start a service:

```bash
sudo systemctl start nginx
```

Stop a service:

```bash
sudo systemctl stop nginx
```

Restart a service:

```bash
sudo systemctl restart nginx
```

Enable a service at boot:

```bash
sudo systemctl enable nginx
```

---

# What I Learned

* Linux consists of the kernel, user space, and initialization/service management.
* Processes are running instances of programs and can have different states.
* `systemd` manages services and system startup.
* Commands like `ps`, `top`, and `systemctl` are essential for troubleshooting.
* Understanding processes and services is important for DevOps and production troubleshooting.

---

# Real Production Use

This knowledge helps DevOps Engineers to:

* Debug crashed services.
* Find CPU and memory consuming processes.
* Restart failed services.
* Check service status.
* Troubleshoot Linux servers quickly.
