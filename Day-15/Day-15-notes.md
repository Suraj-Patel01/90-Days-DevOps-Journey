# Day 15 – Networking Concepts: DNS, IP, Subnets & Ports

## Objective

Today's goal was to understand the core networking concepts used by DevOps Engineers, including DNS, IP addressing, CIDR, subnetting, and ports.

---

# Task 1: DNS – How Names Become IPs

## What happens when you type `google.com` in a browser?

When I enter `google.com`, the browser first checks its DNS cache for the IP address.
If the IP is not available, a DNS query is sent to a DNS resolver.
The DNS resolver finds the IP address of `google.com` and returns it to the browser.
The browser then connects to the server using the resolved IP address.

---

## DNS Record Types

| **Record** | **Purpose**                                              |
| ---------- | -------------------------------------------------------- |
| A          | Maps a domain name to an IPv4 address.                   |
| AAAA       | Maps a domain name to an IPv6 address.                   |
| CNAME      | Maps one domain name to another domain name.             |
| MX         | Specifies mail servers responsible for receiving emails. |
| NS         | Specifies the authoritative name servers for a domain.   |

---

## DNS Command

```bash
dig google.com
```

### Observation

The `dig` command provides DNS information including the resolved IP address and TTL.

### Example

```text
google.com.    300    IN    A    <IPv4 Address>
```

* **A Record:** IPv4 address of the domain.
* **TTL:** Time for which the DNS record can be cached.

---

# Task 2: IP Addressing

## What is an IPv4 Address?

An IPv4 address is a 32-bit address used to identify a device on a network.

Example:

```text
192.168.1.10
```

It contains four octets separated by dots, with each octet ranging from `0` to `255`.

---

## Public vs Private IP

### Private IP

Used inside local networks and is not directly routable on the public Internet.

Example:

```text
192.168.1.10
```

### Public IP

Used to identify a device or server on the Internet.

Example:

```text
8.8.8.8
```

---

## Private IP Ranges

| **Range**        | **Purpose**     |
| ---------------- | --------------- |
| `10.0.0.0/8`     | Private network |
| `172.16.0.0/12`  | Private network |
| `192.168.0.0/16` | Private network |

---

## Check IP Addresses

```bash
ip addr show
```

### Observation

The command displays network interfaces and their assigned IP addresses. Private addresses usually belong to the RFC 1918 ranges listed above.

---

# Task 3: CIDR & Subnetting

## What does `/24` mean?

In:

```text
192.168.1.0/24
```

`/24` means that the first **24 bits** are used for the network portion and the remaining **8 bits** are available for hosts.

---

## CIDR Table

| **CIDR** | **Subnet Mask**   | **Total IPs** | **Usable Hosts** |
| -------- | ----------------- | ------------- | ---------------- |
| `/24`    | `255.255.255.0`   | 256           | 254              |
| `/16`    | `255.255.0.0`     | 65,536        | 65,534           |
| `/28`    | `255.255.255.240` | 16            | 14               |

> Usable host counts above assume traditional IPv4 subnetting where the network and broadcast addresses are reserved.

---

## Why Do We Subnet?

Subnetting divides a large network into smaller networks.

It helps to:

* Organize networks
* Reduce unnecessary broadcast traffic
* Improve security
* Use IP addresses efficiently
* Separate applications and environments

---

# Task 4: Ports – The Doors to Services

## What is a Port?

A port is a logical number used to identify a specific service or application running on a device.

For example, a web server commonly uses port `80` for HTTP and port `443` for HTTPS.

---

## Common Ports

| **Port** | **Service** |
| -------- | ----------- |
| `22`     | SSH         |
| `80`     | HTTP        |
| `443`    | HTTPS       |
| `53`     | DNS         |
| `3306`   | MySQL       |
| `6379`   | Redis       |
| `27017`  | MongoDB     |

---

## Check Listening Ports

```bash
ss -tulpn
```

### Observation

The command displays TCP and UDP listening ports and helps identify which services are running.

Example:

```text
22    → SSH
80    → Nginx / HTTP
```

---

# Task 5: Putting It Together

## `curl http://myapp.com:8080`

Several networking concepts are involved:

* DNS resolves `myapp.com` to an IP address.
* TCP connects to port `8080`.
* HTTP is used to communicate with the application.
* IP handles communication between the client and server.

---

## Application Can't Reach Database

Example:

```text
10.0.1.50:3306
```

First, I would check whether the database server is reachable:

```bash
ping 10.0.1.50
```

Then I would check whether port `3306` is accessible:

```bash
nc -zv 10.0.1.50 3306
```

I would also check the database service, firewall/security group, routing, and whether MySQL is listening on the correct interface and port.

---

# Commands Used

```bash
dig google.com
ip addr show
ss -tulpn
ping 10.0.1.50
nc -zv 10.0.1.50 3306
```

---

# What I Learned

* Learned how DNS converts domain names into IP addresses.
* Understood public/private IP addresses and IPv4 addressing.
* Learned CIDR notation, subnet masks, and usable hosts.
* Understood why subnetting is important in cloud and production networks.
* Learned common ports used by services such as SSH, HTTP, HTTPS, MySQL, Redis, and MongoDB.
* Practiced using `dig`, `ip`, `ss`, `ping`, and `nc` for network troubleshooting.

---

# Real Production Use

These networking concepts are essential for:

* AWS VPC and subnet configuration
* Security Group troubleshooting
* DNS troubleshooting
* Server connectivity
* Database connectivity
* Application debugging
* Docker and Kubernetes networking
* Cloud infrastructure design
* Production incident troubleshooting
