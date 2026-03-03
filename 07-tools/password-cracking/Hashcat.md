```markdown
# Hashcat Commands for Password Cracking on Windows

\# -m 0 = MD5, -a 3 = brute force with no password list
```bash
.\hashcat.exe -m 0 -a 3 .\testhash.txt
```

\# -m 0 = MD5, -a 0 = wordlist attack with rockyou.txt
```bash
.\hashcat.exe -m 0 -a 0 .\testhash.txt .\wordlists\rockyou.txt
```

\# -m 100 = SHA1, -a 0 = wordlist attack
```bash
.\hashcat.exe -m 100 -a 0 .\testhash.txt .\wordlists\rockyou.txt
```

\# -m 500 = md5crypt, brute force with 4 lowercase + 2 digits
```bash
.\hashcat.exe -m 500 -a 3 .\testhash.txt ?l?l?l?l?d?d
```

\# -m 1800 = sha512crypt, wordlist with best64 rule
```bash
.\hashcat.exe -m 1800 -a 0 .\testhash.txt .\wordlists\rockyou.txt -r .\rules\best64.rule
```

\# -m 0 = MD5, -a 1 = combinator attack with two wordlists
```bash
.\hashcat.exe -m 0 -a 1 .\testhash.txt .\wordlists\list1.txt .\wordlists\list2.txt
```

\# -m 400 = phpass, brute force with uppercase, lowercase, 3 digits
```bash
.\hashcat.exe -m 400 -a 3 .\testhash.txt ?u?l?d?d?d
```

\# -m 1000 = NTLM, incremental wordlist attack
```bash
.\hashcat.exe -m 1000 -a 0 .\testhash.txt .\wordlists\rockyou.txt --increment
```

\# -m 3200 = bcrypt, wordlist with dive rule
```bash
.\hashcat.exe -m 3200 -a 0 .\testhash.txt .\wordlists\rockyou.txt -r .\rules\dive.rule
```

\# -m 0 = MD5, -a 6 = hybrid wordlist + mask (append 2 digits)
```bash
.\hashcat.exe -m 0 -a 6 .\testhash.txt .\wordlists\rockyou.txt ?d?d
```

\# -m 0 = MD5, -a 7 = hybrid mask + wordlist (prepend 2 lowercase)
```bash
.\hashcat.exe -m 0 -a 7 ?l?l .\testhash.txt .\wordlists\rockyou.txt
```

\# -m 0 = MD5, brute force with custom charset (lowercase + uppercase)
```bash
.\hashcat.exe -m 0 -a 3 .\testhash.txt -1 ?l?u ?1?1?1?1
```

\# -m 1800 = sha512crypt, save cracked passwords to output.txt
```bash
.\hashcat.exe -m 1800 -a 0 .\testhash.txt .\wordlists\rockyou.txt --outfile=output.txt
```

\# -m 100 = SHA1, incremental brute force (4-8 chars)
```bash
.\hashcat.exe -m 100 -a 3 .\testhash.txt --increment --increment-min=4 --increment-max=8
```

\# -m 0 = MD5, force GPU usage for small jobs
```bash
.\hashcat.exe -m 0 -a 0 .\testhash.txt .\wordlists\rockyou.txt --force
```

\# -m 500 = md5crypt, optimized kernel for faster cracking
```bash
.\hashcat.exe -m 500 -a 0 .\testhash.txt .\wordlists\rockyou.txt -O
```

\# -m 1000 = NTLM, brute force 8-digit passwords
```bash
.\hashcat.exe -m 1000 -a 3 .\testhash.txt ?d?d?d?d?d?d?d?d
```

\# -m 0 = MD5, remove cracked hashes from input file
```bash
.\hashcat.exe -m 0 -a 0 .\testhash.txt .\wordlists\rockyou.txt --remove
```

\# -m 3200 = bcrypt, use cracked passwords as wordlist
```bash
.\hashcat.exe -m 3200 -a 0 .\testhash.txt .\wordlists\rockyou.txt --loopback
```

\# -m 0 = MD5, brute force with high workload profile
```bash
.\hashcat.exe -m 0 -a 3 .\testhash.txt -w 3
```

\# -m 100 = SHA1, process hashes with usernames
```bash
.\hashcat.exe -m 100 -a 0 .\testhash.txt .\wordlists\rockyou.txt --username
```

\# -m 0 = MD5, apply custom leet-speak rule
```bash
.\hashcat.exe -m 0 -a 0 .\testhash.txt .\wordlists\rockyou.txt -r .\rules\leet.rule
```

\# -m 1800 = sha512crypt, brute force 3 lowercase + 4 digits
```bash
.\hashcat.exe -m 1800 -a 3 .\testhash.txt ?l?l?l?d?d?d?d
```

\# -m 400 = phpass, show cracked passwords
```bash
.\hashcat.exe -m 400 -a 0 .\testhash.txt .\wordlists\rockyou.txt --show
```

\# -m 0 = MD5, save session with custom name
```bash
.\hashcat.exe -m 0 -a 3 .\testhash.txt --session=mysession
```

\# -m 0 = MD5, restore previous session
```bash
.\hashcat.exe -m 0 --restore --session=mysession
```

\# -m 1000 = NTLM, disable potfile for clean run
```bash
.\hashcat.exe -m 1000 -a 0 .\testhash.txt .\wordlists\rockyou.txt --potfile-disable
```

\# -m 0 = MD5, brute force 4 chars (all types), output hash:password
```bash
.\hashcat.exe -m 0 -a 3 .\testhash.txt ?a?a?a?a --outfile-format=2
```

\# -m 500 = md5crypt, use GPU only
```bash
.\hashcat.exe -m 500 -a 0 .\testhash.txt .\wordlists\rockyou.txt --opencl-device-types=1
```

\# -m 0 = MD5, -a 9 = association attack with two wordlists
```bash
.\hashcat.exe -m 0 -a 9 .\testhash.txt .\wordlists\rockyou.txt .\wordlists\extra.txt
```

\# -m 100 = SHA1, incremental brute force (6-10 chars)
```bash
.\hashcat.exe -m 100 -a 3 .\testhash.txt -i --increment-min=6 --increment-max=10
```

\# -m 0 = MD5, wordlist attack with minimum length 8
```bash
.\hashcat.exe -m 0 -a 0 .\testhash.txt .\wordlists\rockyou.txt --min=8
```

\# -m 3200 = bcrypt, optimize for slow candidates
```bash
.\hashcat.exe -m 3200 -a 0 .\testhash.txt .\wordlists\rockyou.txt --slow-candidates
```

\# -m 0 = MD5, brute force with custom charset (lowercase + digits)
```bash
.\hashcat.exe -m 0 -a 3 .\testhash.txt -1 ?l?d ?1?1?1?1?1
```

\# -m 1000 = NTLM, apply combinator rule
```bash
.\hashcat.exe -m 1000 -a 0 .\testhash.txt .\wordlists\rockyou.txt -r .\rules\combinator.rule
```

\# -m 0 = MD5, hybrid wordlist + mask (append 2 lowercase + digit)
```bash
.\hashcat.exe -m 0 -a 6 .\testhash.txt .\wordlists\rockyou.txt ?l?l?d
```

\# -m 1800 = sha512crypt, stop after 1 hour
```bash
.\hashcat.exe -m 1800 -a 0 .\testhash.txt .\wordlists\rockyou.txt --runtime=3600
```

\# -m 0 = MD5, brute force uppercase, 2 lowercase, 2 digits, symbol
```bash
.\hashcat.exe -m 0 -a 3 .\testhash.txt ?u?l?l?d?d?s
```

\# -m 400 = phpass, show real-time status
```bash
.\hashcat.exe -m 400 -a 0 .\testhash.txt .\wordlists\rockyou.txt --status
```

\# -m 0 = MD5, save hash:password:username
```bash
.\hashcat.exe -m 0 -a 0 .\testhash.txt .\wordlists\rockyou.txt --outfile=cracked.txt --outfile-format=3
```
```
