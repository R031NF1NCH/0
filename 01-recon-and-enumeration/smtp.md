# SMTP
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

## Enumeration

```bash
telnet example.com 25
openssl s_client -connect example.com:465  # Connect using encryption
nmap -p25 --script smtp-enum-users.nse target.com
dig +short mx example.com
nmap -p25 --script smtp-ntlm-info --script-args smtp-ntlm-info.fingerprint=on target.com
nmap --script=smtp-commands,smtp-enum-users,smtp-vuln-cve2010-4344,smtp-vuln-cve2011-1720,smtp-vuln-cve2011-1764 -p 25 IP
```

## Metasploit

```
auxiliary/scanner/smtp/smtp_enum
auxiliary/scanner/smtp/smtp_version
```

## Sample Sending Mail

```
220 test.example.com ESMTP Postfix
HELO www.example.com
250 test.example.com
MAIL FROM: <jdoe@example.com>
250 2.1.0 Ok
RCPT TO: <joel@carnat.net>
250 2.1.5 Ok
DATA
354 End data with <CR><LF>.<CR><LF>
From: ptiJo <jdoe@example.com>
To: <joel@carnat.net>
Subject: Sending e-mail with the hands
Thank you telnet!
.
250 2.0.0 Ok: queued as BF478261B3
QUIT
221 2.0.0 Bye
```

## Authenticated SMTP (EHLO)

Some SMTP servers require you to authenticate before using e-mail. They will announce AUTH if you say EHLO rather than HELO:

```
250 DSN
helo www.example.com
250 test.example.com
auth plain AHVzZXJpZAB1c2VycGFzcw==    # Note base64 encoded password
235 2.7.0 Authentication successful
mail from: <jdoe@example.com>
250 2.1.0 Ok
rcpt to: <joel@carnat.net>
250 2.1.5 Ok
data
354 End data with <CR><LF>.<CR><LF>
.
250 2.0.0 Ok: queued as A7213261B3
QUIT
DONE
```

## SMTP Commands Reference

| Command | Syntax | Description |
|---------|--------|-------------|
| HELO | `HELO <domain>` | Provides the identification of the sender i.e. the host name |
| EHLO | | Alternative to HELO for servers that support ESMTP. If the server does not support ESMTP, it will reply with an error |
| MAIL | `MAIL FROM:<reverse-path>` | Specifies the originator of the mail |
| RCPT | `RCPT TO:<forward-path>` | Specifies the recipient of mail |
| DATA | `DATA` | Specifies the beginning of the mail |
| QUIT | `QUIT` | Closes the TCP connection |
| RSET | `RSET` | Aborts the current mail transaction but the TCP connection remains open |
| VRFY | `VRFY <string>` | Used to confirm or verify the user name |
| NOOP | `NOOP` | No operation |
| TURN | `TURN` | Reverses the role of sender and receiver |
| EXPN | `EXPN <string>` | Specifies the mailing list to be expanded |
| HELP | `HELP <string>` | Send some specific documentation to the system |
| SEND | `SEND FROM:<reverse-path>` | Send mail to the terminal |
| SOML | `SOML FROM:<reverse-path>` | Send mail to the terminal if possible; otherwise to mailbox |
| SAML | `SAML FROM:<reverse-path>` | Send mail to the terminal and mailbox |
