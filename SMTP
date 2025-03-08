telnet example.com 25
openssl s_client -connect example.com:465  #Connect using encryption


nmap -p25 --script smtp-enum-users.nse target.com
dig +short mx example.com
nmap -p25 --script smtp-ntlm-info --script-args smtp-ntlm-info.fingerprint=on target.com
nmap --script=smtp-commands,smtp-enum-users,smtp-vuln-cve2010-4344,smtp-vuln-cve2011-1720,smtp-vuln-cve2011-1764 -p 25 IP

# Metasploit
auxiliary/scanner/smtp/smtp_enum
auxiliary/scanner/smtp/smtp_version

###############################
# Sample Sending Mail
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
###############################
### Some SMTP servers require you to authenticate before using e-mail. ##############
### They will announce AUTH if you say EHLO rather than HELO: #############
250 DSN
helo www.example.com
250 test.example.com
auth plain AHVzZXJpZAB1c2VycGFzcw==			#Note base64 encoded password
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
####################################


HELO	HELO<SP><domain><CRLF>	It provides the identification of the sender i.e. the host name.
EHLO  Alternative to HELO for servers that support the SMTP service extensions (ESMTP). If the server does not support ESMTP, it will reply with an error. 
MAIL	MAIL<SP>FROM : <reverse-path><CRLF>	It specifies the originator of the mail.
RCPT	RCPT<SP>TO : <forward-path><CRLF>	It specifies the recipient of mail.
DATA	DATA<CRLF>	It specifies the beginning of the mail.
QUIT	QUIT<CRLF>	It closes the TCP connection.
RSET	RSET<CRLF>	It aborts the current mail transaction but the TCP connection remains open.
VRFY	VRFY<SP><string><CRLF>	It is use to confirm or verify the user name.
NOOP	NOOP<CRLF>	No operation
TURN	TURN<CRLF>	It reverses the role of sender and receiver.
EXPN	EXPN<SP><string><CRLF>	It specifies the mailing list to be expanded.
HELP	HELP<SP><string><CRLF>	It send some specific documentation to the system.
SEND	SEND<SP>FROM : <reverse-path><CRLF>	It send mail to the terminal.
SOML	SOML<SP>FROM : <reverse-path><CRLF>	It send mail to the terminal if possible; otherwise to mailbox.
SAML	SAML<SP>FROM : <reverse-path><CRLF>	It send mail to the terminal and mailbox.
