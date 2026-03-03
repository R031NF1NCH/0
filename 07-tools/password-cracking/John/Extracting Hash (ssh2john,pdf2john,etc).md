```markdown
# *2john Tools - Extract Hashes for Cracking

## Hashes extracted will be in JTR format and will need to be modified for hashcat.

1. Check available *2john tools installed on system
```bash
locate *2john*
```

2. Execute tool selected in step 1 pointing at target file - Examples below:

\# Preparing hash for cracking in JtR format, needs editing to use in Hashcat
```bash
ssh2john /path/to/your/id_rsa > ssh.hash
```

\# Use ssh2john to grab password hash from SSH private key
```bash
zip2john /path/to/your/protected.zip > ziphash.txt
```

\# Use zip2john to grab password hash from ZIP archive
```bash
keepass2john Database.kdbx > keepass.hash
```

\# Use keepass2john to grab password hash from KeePass database
```bash
7z2john /path/to/your/file.7z > 7z.hash
```

\# Extract hash from 7z archive for cracking
```bash
rar2john /path/to/your/file.rar > rar.hash
```

\# Extract hash from RAR archive for cracking
```bash
pdf2john /path/to/your/file.pdf > pdf.hash
```

\# Extract hash from encrypted PDF file
```bash
1password2john.py /path/to/your/file.1pif > 1password.hash
```

\# Extract hash from 1Password agilekeychain file
```bash
aix2john.py /etc/security/passwd > aix.hash
```

\# Extract hash from AIX passwd file
```bash
androidfde2john.py /path/to/your/android.img > androidfde.hash
```

\# Extract hash from Android Full Disk Encryption
```bash
bitcoin2john.py /path/to/your/wallet.dat > bitcoin.hash
```

\# Extract hash from Bitcoin wallet
```bash
bitwarden2john.py /path/to/your/export.json > bitwarden.hash
```

\# Extract hash from Bitwarden vault
```bash
dmg2john /path/to/your/file.dmg > dmg.hash
```

\# Extract hash from macOS DMG file
```bash
gpg2john /path/to/your/file.asc > gpg.hash
```

\# Extract hash from GPG encrypted file
```bash
hccap2john /path/to/your/capture.hccap > wifi.hash
```

\# Extract hash from WiFi WPA/WPA2 capture (hccap format)
```bash
krb2john.py /path/to/your/ticket.tgt > krb.hash
```

\# Extract hash from Kerberos TGT ticket
```bash
office2john.py /path/to/your/file.docx > office.hash
```

\# Extract hash from encrypted MS Office document
```bash
pwsafe2john /path/to/your/file.psafe3 > pwsafe.hash
```

\# Extract hash from Password Safe file
```bash
racf2john.py /path/to/your/racf.dmp > racf.hash
```

\# Extract hash from IBM RACF system
```bash
sap2john.py /path/to/your/sap.dmp > sap.hash
```

\# Extract hash from SAP CODVN B/B2 system
```bash
truecrypt2john.py /path/to/your/file.tc > truecrypt.hash
```

\# Extract hash from TrueCrypt volume
```bash
wpapcap2john /path/to/your/capture.pcap > wpapcap.hash
```

\# Extract hash from WiFi WPA/WPA2 PCAP capture
```
