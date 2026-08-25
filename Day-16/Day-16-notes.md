# Day 16 – Shell Scripting Basics

## Overview

Today I learned the basics of Shell Scripting using Bash. I created simple scripts using shebang, variables, user input, conditions, file checking, and `systemctl`.

---

## Task 1: My First Script

### Code

```bash
#!/bin/bash

echo "Hello, DevOps!"
```

### Output

```text
Hello, DevOps!
```

### Commands

```bash
chmod +x hello.sh
./hello.sh
```

### What happens if the shebang is removed?

The shebang tells the operating system which interpreter should execute the script. Without it, executing the script directly may fail or may be handled by a fallback shell depending on the environment. Therefore, using `#!/bin/bash` is recommended for Bash scripts.

---

## Task 2: Variables

### Code

```bash
#!/bin/bash

NAME="Suraj"
ROLE="DevOps Engineer"

echo "Hello, I am $NAME and I am a $ROLE"
```

### Output

```text
Hello, I am Suraj and I am a DevOps Engineer
```

### Single Quotes vs Double Quotes

```bash
NAME="Suraj"

echo '$NAME'
echo "$NAME"
```

Output:

```text
$NAME
Suraj
```

Single quotes prevent variable expansion, while double quotes allow variable expansion.

---

## Task 3: User Input with read

### Code

```bash
#!/bin/bash

read -p "Enter your name: " NAME
read -p "Enter your favourite tool: " TOOL

echo "Hello $NAME, your favourite tool is $TOOL"
```

### Output

```text
Enter your name: Suraj
Enter your favourite tool: Docker
Hello Suraj, your favourite tool is Docker
```

---

## Task 4: If-Else Conditions

### check_number.sh

```bash
#!/bin/bash

read -p "Enter a number: " NUMBER

if [ "$NUMBER" -gt 0 ]; then
    echo "The number is positive."
elif [ "$NUMBER" -lt 0 ]; then
    echo "The number is negative."
else
    echo "The number is zero."
fi
```

### Output

```text
Enter a number: 10
The number is positive.
```

### file_check.sh

```bash
#!/bin/bash

read -p "Enter filename: " FILE

if [ -f "$FILE" ]; then
    echo "File exists: $FILE"
else
    echo "File does not exist: $FILE"
fi
```

### Output

```text
Enter filename: hello.sh
File exists: hello.sh
```

---

## Task 5: Combine It All

### server_check.sh

```bash
#!/bin/bash

SERVICE="nginx"

read -p "Do you want to check the status? (y/n): " ANSWER

if [ "$ANSWER" = "y" ]; then

    if systemctl is-active --quiet "$SERVICE"; then
        echo "$SERVICE is active."
    else
        echo "$SERVICE is not active."
    fi

elif [ "$ANSWER" = "n" ]; then
    echo "Skipped."

else
    echo "Invalid choice."
fi
```

### Output

```text
Do you want to check the status? (y/n): y
nginx is active.
```

---

## What I Learned

1. **Shebang** – `#!/bin/bash` tells the system to use Bash to execute the script.
2. **Variables and User Input** – I learned how to store values in variables and accept input using `read`.
3. **Conditions** – I learned how to use `if`, `elif`, `else`, and tests such as `-f`, `-gt`, and `-lt`.

---

## Conclusion

Day 16 helped me understand the fundamentals of Bash Shell Scripting. I can now create executable Bash scripts, use variables, accept user input, perform conditional checks, and check Linux services using `systemctl`.
