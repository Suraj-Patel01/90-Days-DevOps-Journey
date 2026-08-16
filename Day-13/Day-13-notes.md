# Day 13 – Linux Volume Management (LVM)

## Objective

Learned how to manage Linux storage using **LVM (Logical Volume Manager)**.

---

# Task 1: Check Current Storage

Commands used:

```bash
lsblk
pvs
vgs
lvs
df -h
```

### Observation

* `lsblk` shows disks and partitions.
* `pvs` shows physical volumes.
* `vgs` shows volume groups.
* `lvs` shows logical volumes.
* `df -h` shows mounted filesystem usage.

---

# Task 2: Create Physical Volume

Used a spare disk or loop device:

```bash
sudo pvcreate /dev/sdb
```

Verify:

```bash
pvs
```

The disk was initialized as an LVM Physical Volume.

---

# Task 3: Create Volume Group

Created a volume group:

```bash
sudo vgcreate devops-vg /dev/sdb
```

Verify:

```bash
vgs
```

The Physical Volume was added to `devops-vg`.

---

# Task 4: Create Logical Volume

Created a 500 MB logical volume:

```bash
sudo lvcreate -L 500M -n app-data devops-vg
```

Verify:

```bash
lvs
```

Logical Volume created:

```text
app-data
```

---

# Task 5: Format and Mount

Formatted the logical volume:

```bash
sudo mkfs.ext4 /dev/devops-vg/app-data
```

Created a mount point:

```bash
sudo mkdir -p /mnt/app-data
```

Mounted the volume:

```bash
sudo mount /dev/devops-vg/app-data /mnt/app-data
```

Checked storage:

```bash
df -h /mnt/app-data
```

The logical volume was successfully mounted.

---

# Task 6: Extend the Volume

Extended the logical volume by 200 MB:

```bash
sudo lvextend -L +200M /dev/devops-vg/app-data
```

Resized the filesystem:

```bash
sudo resize2fs /dev/devops-vg/app-data
```

Verified:

```bash
df -h /mnt/app-data
```

The available filesystem size increased successfully.

---

# Commands Used

```bash
sudo -i

lsblk
pvs
vgs
lvs
df -h

sudo pvcreate /dev/sdb
sudo vgcreate devops-vg /dev/sdb
sudo lvcreate -L 500M -n app-data devops-vg

sudo mkfs.ext4 /dev/devops-vg/app-data
sudo mkdir -p /mnt/app-data
sudo mount /dev/devops-vg/app-data /mnt/app-data

df -h /mnt/app-data

sudo lvextend -L +200M /dev/devops-vg/app-data
sudo resize2fs /dev/devops-vg/app-data

df -h /mnt/app-data
```

---

# What I Learned

* Learned the basic LVM structure: **PV → VG → LV**.
* Learned how to create, format, mount, and extend logical volumes.
* Understood how LVM makes Linux storage management more flexible.
