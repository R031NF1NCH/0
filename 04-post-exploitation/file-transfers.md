### SCP
Secure copy over SSH.

**Upload single file:**  
scp localfile.txt user@remotehost:~

**Upload to specific dir:**  
scp /local/dir/file.txt user@remotehost:/remote/dir/

**Download single file:**  
scp user@remotehost:~/remotefile.txt .

**Download to specific dir:**  
scp user@remotehost:/remote/dir/file.txt /local/dir/

### RSYNC
Synchronize files/directories over SSH.

**Upload single file:**  
rsync -avz localfile.txt user@remotehost:~

**Upload dir to specific dir:**  
rsync -avz /local/dir/ user@remotehost:/remote/dir/

**Download single file:**  
rsync -avz user@remotehost:~/remotefile.txt .

**Download dir from specific dir:**  
rsync -avz user@remotehost:/remote/dir/ /local/dir/

### SFTP
Interactive secure file transfer over SSH.

**Upload single file:**  
sftp user@remotehost  
put localfile.txt

**Upload from specific dir to specific dir:**  
sftp user@remotehost  
put /local/dir/file.txt /remote/dir/

**Download single file:**  
sftp user@remotehost  
get remotefile.txt

**Download from specific dir to specific dir:**  
sftp user@remotehost  
get /remote/dir/file.txt /local/dir/

### FTP
Insecure file transfer protocol.

**Upload single file:**  
ftp remotehost  
put localfile.txt

**Upload from specific dir to specific dir:**  
ftp remotehost  
put /local/dir/file.txt /remote/dir/

**Download single file:**  
ftp remotehost  
get remotefile.txt

**Download from specific dir to specific dir:**  
ftp remotehost  
get /remote/dir/file.txt /local/dir/

### WGET
Download from HTTP/FTP servers.

**Download single file:**  
wget http://remotehost/files/remotefile.txt

**Download to specific dir:**  
wget -P /local/dir/ http://remotehost/files/remotefile.txt

**Download from specific dir:**  
wget http://remotehost/dir/remotefile.txt

### CURL
Transfer via URL (supports upload/download).

**Download single file:**  
curl -O http://remotehost/files/remotefile.txt

**Download to specific dir:**  
curl -o /local/dir/remotefile.txt http://remotehost/files/remotefile.txt

**Upload single file (HTTP PUT):**  
curl -T localfile.txt http://remotehost/upload/

**Upload from specific dir:**  
curl -T /local/dir/file.txt http://remotehost/upload/dir/

### NC
Netcat for raw TCP file transfer.

**Upload single file:**  
cat localfile.txt | nc remotehost 1234  
(On remote: nc -l -p 1234 > remotefile.txt)

**Upload dir (tarred):**  
tar cf - /local/dir/ | nc remotehost 1234  
(On remote: nc -l -p 1234 | tar xf -)

**Download single file:**  
nc remotehost 1234 > localfile.txt  
(On remote: cat remotefile.txt | nc -l -p 1234)

**Download dir (tarred):**  
nc remotehost 1234 | tar xf - /local/dir/  
(On remote: tar cf - /remote/dir/ | nc -l -p 1234)

### SMBCLIENT
Access Samba shares.

**Upload single file:**  
smbclient //remotehost/share -U user -c 'put localfile.txt'

**Upload to specific dir:**  
smbclient //remotehost/share -U user -c 'cd /remote/dir/; put localfile.txt'

**Download single file:**  
smbclient //remotehost/share -U user -c 'get remotefile.txt'

**Download from specific dir:**  
smbclient //remotehost/share -U user -c 'cd /remote/dir/; get remotefile.txt'

### RCP
Insecure remote copy (rsh-based).

**Upload single file:**  
rcp localfile.txt user@remotehost:~

**Upload to specific dir:**  
rcp /local/dir/file.txt user@remotehost:/remote/dir/

**Download single file:**  
rcp user@remotehost:~/remotefile.txt .

**Download from specific dir:**  
rcp user@remotehost:/remote/dir/file.txt /local/dir/

### UUCP
Legacy batch file transfer.

**Upload single file:**  
uucp localfile.txt user!remotehost!~

**Upload to specific dir:**  
uucp /local/dir/file.txt user!remotehost!/remote/dir/

**Download single file:**  
uucp "!remotehost!~/remotefile.txt" .

**Download from specific dir:**  
uucp "!remotehost!/remote/dir/file.txt" /local/dir/
