# Day 06 – Linux Fundamentals: Read and Write Text Files

## Objective

Today's goal was to practice basic Linux file input and output operations using simple commands.

---

# File Creation

## 1. Create an Empty File

```bash
touch notes.txt
```

**Observation:** Created a new empty file named `notes.txt`.

---

# Writing to a File

## 2. Write First Line

```bash
echo "Linux is the foundation of DevOps" > notes.txt
```

**Observation:** Created the file content. The `>` operator overwrites existing content.

## 3. Append Second Line

```bash
echo "I am practicing Linux commands" >> notes.txt
```

**Observation:** Added a new line without removing the existing content.

## 4. Append and Display Using `tee`

```bash
echo "File handling is important in DevOps" | tee -a notes.txt
```

**Observation:** Added the line to the file and displayed it on the terminal at the same time.

---

# Reading the File

## 5. Read the Complete File

```bash
cat notes.txt
```

**Observation:** Displayed the complete contents of `notes.txt`.

## 6. Read First Two Lines

```bash
head -n 2 notes.txt
```

**Observation:** Displayed the first two lines of the file.

## 7. Read Last Two Lines

```bash
tail -n 2 notes.txt
```

**Observation:** Displayed the last two lines of the file.

---

# File Content

```text
Linux is the foundation of DevOps
I am practicing Linux commands
File handling is important in DevOps
```

---

# Commands Used

```bash
touch notes.txt
echo "Linux is the foundation of DevOps" > notes.txt
echo "I am practicing Linux commands" >> notes.txt
echo "File handling is important in DevOps" | tee -a notes.txt
cat notes.txt
head -n 2 notes.txt
tail -n 2 notes.txt
```

---

# What I Learned

* Learned how to create files using `touch`.
* Learned the difference between `>` and `>>`.
* Practiced reading files using `cat`, `head`, and `tail`.
* Learned how `tee` can write and display content simultaneously.
* Understood the importance of basic file handling in DevOps.

---

# Real Production Use

File handling is commonly used for:

* Reading application logs.
* Editing configuration files.
* Creating shell scripts.
* Managing deployment files.
* Debugging production issues.
