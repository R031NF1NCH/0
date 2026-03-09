**POP3 / POP3S Enumeration & Connection**

**Port scan for POP3**  
```bash
nmap -p 110,995 -sV -sC <target-ip>
```

**Full port scan to confirm POP3 ports**  
```bash
nmap -p- --min-rate 5000 <target-ip> | grep -E "110|995"
```

**Nmap POP3 scripts**  
```bash
nmap -p 110,995 --script pop3-* <target-ip>
```

**Banner grab with netcat (plain POP3)**  
```bash
nc -nv <target-ip> 110
```

**Banner grab for POP3S (SSL)**  
```bash
openssl s_client -connect <target-ip>:995
```

**Check POP3 capabilities**  
```bash
# After connecting, send:
CAPA
```

**Brute force POP3 credentials**  
```bash
hydra -l <user> -P /usr/share/wordlists/rockyou.txt <target-ip> pop3
```

**Brute force with user list**  
```bash
hydra -L /usr/share/wordlists/metasploit/unix_users.txt -P /usr/share/wordlists/rockyou.txt <target-ip> pop3
```

**Login via netcat**  
```bash
# After nc -nv <target-ip> 110
USER username
PASS password
```

**Mailbox status (messages + total size)**  
```bash
STAT
```

**List messages with sizes**  
```bash
LIST
```

**Retrieve message**  
```bash
RETR 1
```

**Retrieve specific message**  
```bash
RETR <msg-number>
```

**Connect and interact via curl (alternative)**  
```bash
curl -v --user <user>:<pass> pop3://<target-ip>
```

**Fetch specific message via curl**  
```bash
curl -v --user <user>:<pass> pop3://<target-ip>/1
```

**Logout**  
```bash
QUIT
```
