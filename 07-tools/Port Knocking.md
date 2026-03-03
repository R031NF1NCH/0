#Configuration saved @ /etc/knockd.conf

#Nmap sends only one probe to ports 7469,8475,9842
nmap -Pn --host-timeout 100 --max-retries 0 -p 7469,8475,9842 IP
