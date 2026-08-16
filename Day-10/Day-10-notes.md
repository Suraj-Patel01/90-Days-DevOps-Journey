# Day 10 – File Permissions & File Operations Challenge

## Files Created

The following files and directory were created:

* `devops.txt`
* `notes.txt`
* `script.sh`
* `project/`

### File Contents

**devops.txt**

```text
Empty file created using touch.
```

**notes.txt**

```text
Linux file permissions are important in DevOps.
They control who can read, write, and execute files.
```

**script.sh**

```bash
#!/bin/bash
echo "Hello DevOps"
```

---

## Task 1: Create Files

Commands used:

```bash
touch devops.txt
echo "Linux file permissions are important in DevOps." > notes.txt
vim script.sh
```

To check the files and permissions:

```bash
ls -l
```

---

## Task 2: Read Files

### Read notes.txt

```bash
cat notes.txt
```

### View script.sh in read-only mode

```bash
vim -R script.sh
```

### Display first 5 lines of /etc/passwd

```bash
head -n 5 /etc/passwd
```

### Display last 5 lines of /etc/passwd

```bash
tail -n 5 /etc/passwd
```

---

## Task 3: Understanding Permissions

Linux permissions follow this format:

```text
rwxrwxrwx
│  │  │
│  │  └── Others
│  └───── Group
└──────── Owner
```

Permission values:

| Permission  | Value |
| ----------- | ----: |
| `r` Read    |     4 |
| `w` Write   |     2 |
| `x` Execute |     1 |

Check permissions:

```bash
ls -l devops.txt notes.txt script.sh
```

Example:

```text
-rw-r--r-- devops.txt
-rw-r--r-- notes.txt
-rw-r--r-- script.sh
```

Initially, the files were readable and writable by the owner, while group and others had read permission.

---

## Task 4: Modify Permissions

### 1. Make script.sh executable

```bash
chmod +x script.sh
```

Run the script:

```bash
./script.sh
```

Output:

```text
Hello DevOps
```

Verify:

```bash
ls -l script.sh
```

The execute permission `x` was added.

---

### 2. Make devops.txt read-only

```bash
chmod -w devops.txt
```

Verify:

```bash
ls -l devops.txt
```

The write permission was removed.

---

### 3. Set notes.txt to 640

```bash
chmod 640 notes.txt
```

Verify:

```bash
ls -l notes.txt
```

`640` means:

```text
Owner  = rw- = 6
Group  = r-- = 4
Others = --- = 0
```

Therefore:

```text
rw-r-----
```

---

### 4. Create project directory with 755 permissions

```bash
mkdir project
chmod 755 project
```

Verify:

```bash
ls -ld project
```

`755` means:

```text
Owner  = rwx = 7
Group  = r-x = 5
Others = r-x = 5
```

---

## Task 5: Test Permissions

### Try writing to a read-only file

```bash
echo "Test" > devops.txt
```

Expected result:

```text
Permission denied
```

The file cannot be modified because write permission was removed.

---

### Try executing a file without execute permission

Remove execute permission:

```bash
chmod -x script.sh
```

Then run:

```bash
./script.sh
```

Expected result:

```text
Permission denied
```

The script cannot be executed because the execute permission is missing.

Restore execute permission:

```bash
chmod +x script.sh
```

---

## Commands Used

```bash
touch devops.txt
echo "Linux file permissions are important in DevOps." > notes.txt
vim script.sh
cat notes.txt
vim -R script.sh
head -n 5 /etc/passwd
tail -n 5 /etc/passwd
ls -l
chmod +x script.sh
chmod -w devops.txt
chmod 640 notes.txt
mkdir project
chmod 755 project
chmod -x script.sh
./script.sh
```

---

## Permission Summary

| File/Directory | Permission | Meaning                                          |
| -------------- | ---------- | ------------------------------------------------ |
| `devops.txt`   | Read-only  | Write permission removed                         |
| `notes.txt`    | `640`      | Owner: read/write, Group: read                   |
| `script.sh`    | Executable | Can be executed using `./script.sh`              |
| `project/`     | `755`      | Owner: full access, Group/Others: read & execute |

---

## What I Learned

1. Linux permissions control who can **read, write, and execute** files.
2. `chmod` can modify permissions using symbolic or numeric modes such as `755` and `640`.
3. Execute permission is required to run scripts directly using `./filename`.
