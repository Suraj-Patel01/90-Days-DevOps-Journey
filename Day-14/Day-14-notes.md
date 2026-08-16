# Day 14 – Networking Fundamentals & Hands-on Checks

## Objective

Today's goal was to understand the fundamentals of computer networking and practice essential Linux networking commands used in real-world DevOps troubleshooting.

---

# Quick Concepts

## OSI Model vs TCP/IP Model

### OSI Model (7 Layers)

1. Physical
2. Data Link
3. Network
4. Transport
5. Session
6. Presentation
7. Application

### TCP/IP Model (4 Layers)

1. Link
2. Internet
3. Transport
4. Application

### Difference

* OSI is a reference model used for learning networking.
* TCP/IP is the model used by the Internet.

---

# Where Protocols Work

| **Protocol** | **Layer**          |
| ------------ | ------------------ |
| HTTP / HTTPS | Application        |
| DNS          | Application        |
| SSH          | Application        |
| TCP / UDP    | Transport          |
| IP           | Internet / Network |
| Ethernet     | Link               |

### Example

```text
curl https://example.com

Application (HTTP)
        ↓
Transport (TCP)
        ↓
Internet (IP)
        ↓
Link Layer
```

---

# Hands-on Commands

## 1. Check IP Address

### Command

```bash
hostname -I
```

### Observation

Displayed the private IP address of my EC2 instance.

---

## 2. Network Interface

```bash
ip addr show
```

### Observation

Displayed network interfaces and IP configuration.

---

## 3. Connectivity Test

```bash
ping google.com
```

### Observation

Verified network connectivity and checked latency.

---

## 4. Trace Network Path

```bash
tracepath google.com
```

### Observation

Displayed the route packets travel to reach Google.

---

## 5. Listening Services

```bash
ss -tulpn
```

### Observation

Verified that SSH and Nginx were listening on their respective ports.

---

## 6. DNS Resolution

```bash
nslookup google.com
```

or

```bash
dig google.com
```

### Observation

Resolved the domain name into its IP address.

---

## 7. HTTP Response

```bash
curl -I https://google.com
```

### Observation

Received the HTTP status code and response headers.

---

## 8. Active Connections

```bash
netstat -an | head
```

### Observation

Displayed active and listening network connections.

---

## 9. Port Test

```bash
nc -zv localhost 22
```

### Observation

Verified that the SSH service was accepting connections on port 22.

---

# Mini Task

## Listening Port

**Port 22 — SSH**

### Test

```bash
nc -zv localhost 22
```

### Result

Connection succeeded.

If it had failed, I would check:

* `systemctl status ssh`
* Firewall rules
* Security Group configuration
* Port listening using `ss -tulpn`

---

# Reflection

## Which three commands save you the most time?

* `ss -tulpn`
* `ping`
* `curl -I`

These commands quickly identify whether the problem is related to networking, service availability, or HTTP response.

---

## How do you check whether a service is healthy?

```bash
systemctl status nginx

ss -tulpn

curl -I http://localhost
```

---

## How do you safely change ownership and permissions?

### Example

```bash
sudo chown ubuntu:developers app.log

chmod 640 app.log
```

Always verify changes using:

```bash
ls -l
```

---

## What will I improve over the next three days?

* Learn networking in greater depth.
* Practice troubleshooting production-like issues.
* Improve Linux administration skills.

---

# Commands Used

```bash
hostname -I
ip addr show
ping google.com
tracepath google.com
ss -tulpn
nslookup google.com
dig google.com
curl -I https://google.com
netstat -an | head
nc -zv localhost 22
systemctl status nginx
```

---

# What I Learned

* Learned how data travels from a browser to a server.
* Understood the difference between the OSI and TCP/IP models.
* Learned the role of IP addresses, DNS, TCP, UDP, HTTP, and HTTPS.
* Practiced essential Linux networking commands.
* Understood how DevOps Engineers troubleshoot network-related issues in production.

---

# Real Production Use

Networking knowledge is essential for:

* Troubleshooting application failures
* Debugging DNS issues
* Checking server connectivity
* Verifying service availability
* Monitoring open ports
* Managing cloud infrastructure
* Supporting Docker and Kubernetes networking
