
### IMAP / IMAPS Enumeration & Connection

**Quick port check (IMAP ports)**  
```bash
nmap -p 143,993 --open <target-ip>
```

**Standard version + script scan (recommended first IMAP enum)**  
```bash
nmap -p 143,993 -sV -sC <target-ip>
```

**Targeted IMAP nmap scripts (capabilities, NTLM, brute hints)**  
```bash
nmap -p 143,993 --script imap-capabilities,imap-ntlm-info <target-ip>
```

**Banner grab – plain IMAP (port 143)**  
```bash
nc -nv <target-ip> 143
```

**Connect/Banner grab + capabilities check – plain IMAP**  
```bash
# Connect with nc then immediately type (case sensitive, end with CRLF):
A1 CAPABILITY
```

**Connect/Banner grab – IMAPS (port 993, SSL/TLS)**  
```bash
openssl s_client -connect <target-ip>:993 -quiet
```

**IMAPS full connection + show certificate details**  
```bash
openssl s_client -connect <target-ip>:993 -showcerts
```

**IMAPS cipher suite & protocol enum (useful for weak TLS)**  
```bash
nmap -p 993 --script ssl-enum-ciphers <target-ip>
```

**Manual login & interaction – plain IMAP via nc**  
```bash
nc -nv <target-ip> 143
# After * OK greeting, type (use your own tag like A1/A2):
A1 LOGIN username password
```

**Common IMAP commands after successful login (via nc)**

List all mailboxes/folders  
```bash
A2 LIST "" "*"
```

Select the inbox  
```bash
A3 SELECT INBOX
```

Search for all messages  
```bash
A4 SEARCH ALL
```

Fetch headers of message 1  
```bash
A5 FETCH 1 (BODY[HEADER])
```

Fetch full body of message 1  
```bash
A6 FETCH 1 BODY[]
```

Fetch range of messages (e.g. first 5)  
```bash
A7 FETCH 1:5 BODY[]
```

Logout cleanly  
```bash
A8 LOGOUT
```

**Alternative: Connect & fetch via curl (if credentials known, simpler for quick read)**  
```bash
curl -v --user username:password imaps://<target-ip>/INBOX
```

**Fetch specific message via curl (message 1)**  
```bash
curl -v --user username:password 'imaps://<target-ip>/INBOX;MAILINDEX=1'
```

**Brute force single user (common OSCP pattern)**  
```bash
hydra -l administrator -P /usr/share/wordlists/rockyou.txt <target-ip> imap
```

**Brute force with user list**  
```bash
hydra -L users.txt -P /usr/share/wordlists/rockyou.txt <target-ip> imap -t 4
```

**Quick null/anonymous login test (rare but worth 2 seconds)**  
```bash
# After nc connect:
A1 LOGIN "" ""
```


