#!/bin/bash
# === OSCP Repo Reorganization Script ===
# Run from the root of your local clone of R031NF1NCH/0
# BACK UP YOUR REPO FIRST: cp -r . ../0-backup

set -e

# --- Create new directory structure ---
mkdir -p 01-recon-and-enumeration
mkdir -p 02-web-attacks
mkdir -p 03-exploitation
mkdir -p 04-post-exploitation/linux-priv-esc
mkdir -p 04-post-exploitation/windows
mkdir -p 05-databases
mkdir -p 06-networking
mkdir -p 07-tools
mkdir -p 08-quick-reference

# --- 1. Recon & Enumeration (loose files → .md) ---
for f in SMB SMTP FTP RSync RPCBind Redis; do
  if [ -e "$f" ]; then
    lower=$(echo "$f" | tr '[:upper:]' '[:lower:]')
    git mv "$f" "01-recon-and-enumeration/${lower}.md"
  fi
done

# --- 2. Web Attacks ---
# Folders
[ -d "SQL Injection" ]                    && git mv "SQL Injection" "02-web-attacks/sql-injection"
[ -d "Directory Trav-LFI-RFI-LogPoison" ] && git mv "Directory Trav-LFI-RFI-LogPoison" "02-web-attacks/lfi-rfi-log-poisoning"
[ -d "Directory Brute Force" ]            && git mv "Directory Brute Force" "02-web-attacks/directory-bruteforce"
[ -d "Wordpress" ]                        && git mv "Wordpress" "02-web-attacks/wordpress"
[ -d "Intruder" ]                         && git mv "Intruder" "02-web-attacks/burp-intruder"

# Loose files
[ -e "Header injections" ]     && git mv "Header injections" "02-web-attacks/header-injections.md"
[ -e "OS Command Injection" ]  && git mv "OS Command Injection" "02-web-attacks/os-command-injection.md"
[ -e "PHP Command Injection" ] && git mv "PHP Command Injection" "02-web-attacks/php-command-injection.md"
[ -e "XPath" ]                 && git mv "XPath" "02-web-attacks/xpath-injection.md"
[ -e "NodeJS" ]                && git mv "NodeJS" "02-web-attacks/nodejs.md"
[ -e "WebDav" ]                && git mv "WebDav" "02-web-attacks/webdav.md"

# --- 3. Exploitation & Shells ---
[ -d "Shells" ]    && git mv "Shells" "03-exploitation/shells"
[ -e "MSFVenom" ]  && git mv "MSFVenom" "03-exploitation/msfvenom.md"
[ -e "Metasploit" ] && git mv "Metasploit" "03-exploitation/metasploit.md"

# --- 4. Post-Exploitation ---
# Merge both Linux priv esc sources into one folder
if [ -d "Privilege Escalation/Linux" ]; then
  cp -r "Privilege Escalation/Linux/"* "04-post-exploitation/linux-priv-esc/" 2>/dev/null || true
  git rm -rf "Privilege Escalation"
fi
if [ -e "Priv Esc - Linux" ]; then
  git mv "Priv Esc - Linux" "04-post-exploitation/linux-priv-esc/priv-esc-notes.md"
fi
git add 04-post-exploitation/linux-priv-esc/

[ -d "Windows Stuff" ]       && git mv "Windows Stuff" "04-post-exploitation/windows"
[ -e "Linux File Transfer" ] && git mv "Linux File Transfer" "04-post-exploitation/file-transfers.md"

# --- 5. Databases ---
[ -d "MySQL" ]      && git mv "MySQL" "05-databases/mysql"
[ -e "Postgresql" ] && git mv "Postgresql" "05-databases/postgresql.md"

# --- 6. Networking ---
[ -e "Wireshark" ] && git mv "Wireshark" "06-networking/wireshark.md"
[ -e "TCPDUMP" ]   && git mv "TCPDUMP" "06-networking/tcpdump.md"
[ -e "PCAP" ]      && git mv "PCAP" "06-networking/pcap.md"
[ -e "CURL" ]      && git mv "CURL" "06-networking/curl.md"

# --- 7. Tools ---
[ -d "Tools" ]             && git mv "Tools/"* "07-tools/" && rmdir "Tools"
[ -d "Password Cracking" ] && git mv "Password Cracking" "07-tools/password-cracking"
[ -e "zip-tar archive" ]   && git mv "zip-tar archive" "07-tools/zip-tar-archive.md"

# --- 8. Quick Reference ---
[ -e "Stuff I Forget" ] && git mv "Stuff I Forget" "08-quick-reference/cheatsheet.md"

# --- Commit ---
git add -A
git commit -m "refactor: reorganize repo by OSCP attack phases

- Group files into 8 phase-based directories
- Add .md extensions to all note files
- Merge duplicate Linux priv esc content
- Add README with table of contents and navigation"

echo ""
echo "Done! Review with 'git log --stat -1' then push with 'git push'."
