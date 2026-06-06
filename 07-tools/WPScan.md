```markdown
# WPScan Commands

## basic usage
```bash
wpscan --url "target" --verbose
```

# enumerate vulnerable plugins, users, vulrenable themes, timthumbs
```bash
wpscan --url "target" --wp-content-dir="/wp-content/" --force --enumerate vp,vt,cb,dbe,u,tt  --plugins-detection aggressive --detection-mode aggressive
```

```bash
wpscan --url "target" --api-token YOUR_TOKEN
```

## Supply list of passwords
```bash
$ wpscan --url example.com -P passwords.txt
```

## Supply list of usernames
```bash
$ wpscan --url example.com -U users.txt
```

## Enumeration
### Usernames
```bash
$ wpscan --url example.com --enumerate u
```

### Vulnerable Plugins
```bash
--enumerate vp
```

### Popular Plugins
```bash
--enumerate p
```

### All Plugins
```bash
--enumerate ap
```

### Vulnerable Themes
```bash
--enumerate vt
```

### All Themes
```bash
--enumerate at
```

### Popular Themes
```bash
--enumerate t
```

### wp-config.php Backups
```bash
--enumerate cb
```

### Database Exports
```bash
--enumerate dbe
```

## Useful Flags
### Supply custom wp-content Directory
```bash
--wp-content-dir
```

### Random User Agent
```bash
--random-user-agent
```

### Avoid Detection (limited checks)
```bash
--stealthy
```

### Disable SSL/TLS Security
```bash
--disable-tls-checks
```

### Disable WordPress Detection
```bash
--force
```

### Set the Detection Mode
```bash
--detection-mode [mixed|passive|aggressive]
```
```
