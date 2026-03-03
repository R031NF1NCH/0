#Wordlist location of common user pass combinations - hydra -C /home/kali/wordlists/seclists/Passwords/Default-Credentials/ftp-betterdefaultpasslist.txt 192.168.0.0 ftp -V -I -t 64
/home/kali/wordlists/seclists/Passwords/Default-Credentials/ftp-betterdefaultpasslist.txt

#ftp client commands
ftp anonymous@192.168.1.1
binary - set binary transfer type
cd - change remote working directory
lcd - change local working directory
get - recieve file
put - Send one file. 
mget - get multiple files
passive - enter passive transfer mode
ls - list contents of remote directory
mkdir -	Make directory on remote machine. 
chmod 	Change file permissions of remote file. 
send -	Send one file. 

#Traditional ports, though they can be dynmically assigned
Port 21 - control commands
Port 20 - data transfer

#Active mode
Client initiates control session on port 21 and leaves port 20 open for the server to send data, and the server initiates the connection for port 20.
***If client is behind a firewall, or NAT, then the sever might not be able to connect to send data.

#Passive mode
Server gives teh client a port to initiate a connection to for data transfer.
***Most commonly used by browsers, ect.
------------------------------------------------------------------------------------------------------------------------------------------
Handling FTP Extended Passive Mode (EPSV)

Extended Passive Mode (EPSV) is an FTP protocol extension for IPv6 and NAT traversal. The server provides a single port for data 
connections (e.g., file transfers, directory listings). The server uses EPSV by default, opening a random high-numbered port (e.g., 1024–65535) for data transfers.
Potential issues:
Firewalls/NAT may block dynamic EPSV ports.
Client may not fully support EPSV.
Timeouts if data connection ports are unreachable.

Technical Solutions

Switch to Active Mode (PORT):
Active mode has the client open a port and instruct the server to connect to it for data transfers. This avoids EPSV issues and often works better in controlled 
environments. 

FileZilla: Go to Settings > Connection > FTP and select “Active” under Transfer Mode.

Command-line FTP:ftp ftp.example.com
Name: your_username
Password: your_password
ftp> passive off  # Disable passive mode (EPSV/PASV)
ftp> dir          # Test directory listing

Note: Active mode may fail if the client’s firewall blocks incoming connections from the server.

Verify Client Support for EPSV:
Ensure your FTP client (e.g., FileZilla, WinSCP, ftp) supports EPSV.
FileZilla: Go to Settings > Connection > FTP and confirm “Passive mode” is enabled (EPSV is handled automatically).

Command-line FTP:ftp> epsv  # Enable EPSV explicitly
ftp> dir   # Test a directory listing


Force Traditional Passive Mode (PASV):
If active mode isn’t viable, try traditional passive mode instead of EPSV.
FileZilla: Go to Settings > Connection > FTP and disable EPSV explicitly (if available) or select “Use plain FTP (insecure)”.

Command-line FTP:ftp> pasv  # Enable PASV
ftp> dir

