```markdown
# Cracking password with JTR

\# Use John the Ripper default settings to attack the hash
```bash
john hash.txt
```

\# Use wordlist to crack hash
```bash
john hash.txt --wordlist=~/wordlists/rockyou.txt
```

\# Crack raw MD5 hashes with default attack modes
```bash
john hash.txt --format=raw-md5
```

\# Crack NTLM hashes using rockyou wordlist
```bash
john hash.txt --format=nt --wordlist=/usr/share/wordlists/rockyou.txt
```

\# Crack SHA-256 crypt hashes with a custom wordlist
```bash
john hash.txt --format=sha256-crypt --wordlist=wordlist.txt
```

\# Run incremental mode (brute-force) for all possible character combinations
```bash
john hash.txt --incremental
```

\# Apply wordlist mangling rules to crack MD5 crypt hashes
```bash
john hash.txt --format=md5crypt --wordlist=wordlist.txt --rules
```

\# Crack bcrypt hashes using default settings
```bash
john hash.txt --format=bcrypt
```

\# Use jumbo rules for advanced wordlist mangling
```bash
john hash.txt --wordlist=wordlist.txt --rules=jumbo
```

\# Run single crack mode using login-related information
```bash
john hash.txt --single
```

\# Crack LAN Manager (LM) hashes
```bash
john hash.txt --format=lm
```

\# Crack SHA-512 crypt hashes with a wordlist
```bash
john hash.txt --format=sha512-crypt --wordlist=wordlist.txt
```

\# Display cracked passwords from a previous session
```bash
john --show hash.txt
```

\# Brute-force SHA-1 hashes with digits only
```bash
john hash.txt --format=raw-sha1 --incremental=digits
```

\# Use mask attack for 4 lowercase letters + 2 digits
```bash
john hash.txt --format=nt --mask=?l?l?l?l?d?d
```

\# Apply custom wordlist rules for mangling
```bash
john hash.txt --wordlist=wordlist.txt --rules=wordlist
```

\# Crack PBKDF2-HMAC-SHA256 hashes
```bash
john hash.txt --format=pbkdf2-hmac-sha256
```

\# Use previously cracked passwords as a wordlist
```bash
john hash.txt --loopback --wordlist=cracked.txt
```

\# Crack SHA-256 hashes using 4 parallel processes
```bash
john hash.txt --format=raw-sha256 --fork=4
```

\# Pipe John’s output to hashcat for hybrid attack
```bash
john hash.txt --wordlist=wordlist.txt --stdout | hashcat -a 0 -m 0 -
```

\# Limit cracking session to 1 hour
```bash
john hash.txt --format=md5crypt --max-run-time=3600
```

\# Use KoreLogic rules for advanced mangling
```bash
john hash.txt --format=nt --wordlist=wordlist.txt --rules=korelogic
```

\# Brute-force lowercase passwords for raw MD5 hashes
```bash
john hash.txt --format=raw-md5 --incremental=lower
```

\# Crack SHA-1 crypt hashes with minimum length 8
```bash
john hash.txt --format=sha1-crypt --wordlist=wordlist.txt --min-length=8
```

\# Mask attack for 2 uppercase letters + 3 digits
```bash
john hash.txt --format=nt --mask=?u?u?d?d?d
```

\# Suppress duplicate guesses in wordlist mode
```bash
john hash.txt --wordlist=wordlist.txt --rules --dupe-suppression
```

\# Show progress for bcrypt hash cracking
```bash
john hash.txt --format=bcrypt --progress-only
```

\# Use extra rules for SHA-512 hash cracking
```bash
john hash.txt --format=raw-sha512 --wordlist=wordlist.txt --rules=extra
```

\# Save cracking session with a custom name
```bash
john hash.txt --format=nt --session=mysession
```

\# Restore a previously saved cracking session
```bash
john --restore=mysession
```

\# Limit guesses to 12 characters for MD5 crypt
```bash
john hash.txt --format=md5crypt --wordlist=wordlist.txt --max-length=12
```

\# Use Markov mode with a stat level of 200
```bash
john hash.txt --format=raw-md5 --markov=200
```

\# Apply custom external mode (e.g., leet transformations)
```bash
john hash.txt --format=nt --external=leet
```

\# Crack SHA-256 crypt with 2 parallel processes
```bash
john hash.txt --format=sha256-crypt --wordlist=wordlist.txt --fork=2
```

\# Use PRINCE mode with a wordlist for combinator attack
```bash
john hash.txt --format=raw-md5 --prince=wordlist.txt
```

\# Use memory file for large wordlists
```bash
john hash.txt --format=nt --wordlist=wordlist.txt --rules --mem-file=memfile.txt
```
```
