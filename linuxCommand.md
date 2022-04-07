# shell script 정적 분석도구

> [shellcheck.net](shellcheck.net)

# 기초

```sh
# 변수 선언
name=aredra
ehco "My nickname is $name"
echo "${name}'s playgaround"
declare -a alnum=(a1 b1 c1) # -a 배열 옵션
declare -i inum=78      # -i 정수형 변수
inum=inum+1
echo ${inum}
echo ${alnum[0]}
declare -r rPi=3.14     # readonly
declare -x xpath="${HOME}/" # 변수 export
export xpath="${HOME}/"

#문자열 다루기
echo ${#name} # 변수 길이 체크
echo ${name:0:3} # 문자열 인덱스부터 길이만큼 출력
echo ${name#a*e}
echo ${name##a*a}
echo ${name%a*is}
echo ${name%%a*is}
echo ${name//is} # 패턴 제거
echo ${name/is/are} # 패턴 치환
echo ${name/[Aa]redra/I}
echo ${name//[Aa]redra/I}

#globe 패턴
echo b???
echo [abcd]*

#변환
tr [:lower:] [:upper:] <<< "Hello World"
tr [:space:] '\t' <<< "Hello World"
tr -s [:space:] <<< "Hello      World"

cut -c2 test.txt
cut -d':' -f1 /etc/passwd
```

# brew

```sh
# brew  설치
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"

brew --help
brew search htop
brew install htop
brew update
brew upgrade vim
```

# Download

```sh
apt-cache search fileName
apt-get update
apt-get install fileName
apt-get remove
apt-get purge
wget address-url
git clone
```

# 파일 읽기

```sh
tail -f filename        # 실시간 로그 볼 때 많이 씀
cat filename
vi
wc -w test.txt          # wc - word count?
```

# IO Redirect

```sh
ls -l > result.log === ls -l 1> result.log
ll 2> log.txt
rm foo 1> result.txt 2> error.txt

cat < hello.txt
cat > hello.txt
```

# append

```sh
ls -al >> log.txt
```

# 다수의 Input

```sh
mail mail@domain.com << EOT
```

# 파일리스트 보기

```sh
ls | less       # 혹은 more
ls -d /*        # 디렉토리 보기
```

# etc

```sh
head -n1 name.txt === head -n1 < name.txt
head -n1 < name.txt > headline.txt
# 이전 실행 명령어
!!
```

# 연결 연산자 ;

```sh
ls;pwd
```

# echo 출력 및 보내기 기능

```sh
echo 'hello'
echo $0 # 현재의 쉘 확인
echo 'hellow world' > test.txt
echo * >> test.txt

# -e 특수문자 사용가능, -n 개행 안 함
echo -ne 'hellow echo\a'

printf "%02d\n" 1
read -n 1 -p "How old are you?" v
```

# touch - 파일 생성

```sh
touch a.log b.log c.log
touch test{1..10}
```

# 파일 복사

```sh
cp *.log bak
```

# 명령어들 위치

```sh
/bin
```

# 디렉토리 이동

```sh
# 왔다 갔다 하기
cd -
pushd
popd
```

# script sample

```sh
#!/bin/bash - bash로 만들었다.
if ! [ -d bak ]; then
        mkdir bak
fi
cp *.log bak
```

# 파일에 실행권한 주기

```sh
ls -ltr ${target}
chmod +x backup
chmod 600 ${target}
chown -R owner:group
```

# 파일 검색

```sh
locate *.log
find . -name test.*
find / -name test* -type d
find . -name '*.log' | xargs grep -r --color=auto -n 2>/dev/null 'searchingText'
whereis
ls -alR /  > result.txt 2> error.log &
```

# 파일명 변경
```sh
for f in *.기존; do mv -- "$f" "${f%.기존}.신규"; done
```

# OS 및 버전 확인

```sh
uname -a
cat /etc/release
```

# 파일 설치

```sh
yum install wget
yum install lsof

rpm                     # 의존성 요구
rpm -ivh 소스명         # 진행상황 확인하며 설치
rpm -qa | grep name     # 패키지 설치 유무 확인
rpm -e name             # 삭제

# yum - rpm 의존성 불필요 버전
```

# 프로세스, 자원 메모리 검색

```sh
ps aux | grep ${target}
top
# Load average: 프로세스 점유율 관련 동작해야되는 프로세스 수 ${1분} ${5분} ${15분}
htop
df -h, du
lsof -i tcp
lsof -i :"$port"
netstat -antp | grep ${target}
nslookup
jobs
free -h
ionice -c 2 -n 7 nice -n 19 top -c
sar -u 3 10 # cpu 사용량
vmstat 1 10 # cpu 사용률
ps aux --sort=-%cpu
```

# background 프로세스 && daemon

```sh
ctrl + z //백그라운드로 넘기기
fg %${no}
kill -9 %${no}
ls -alR /  > result.txt 2> error.log & // & 백그라운드 실행
cd etc/init.d // 데몬 프로그램들이 위치
cd etc/rc3.d // 시스템 구동 시 동작하는 프로그램 리스트 S 시작, K 시작안함
```

# cron 정기적 실행

```sh
crontab -e // 등록
crontab -l // 목록
*/1 * * * * date >> date.log 2>&1

tail -f ~/log.log
clear
```

# alias, function

```sh
alias ll = 'ls -al' //대소문자 구별함
function goDir() { cd /User/dir${1}; }
no=1; while (( no < 10 )); do printf "%02d\n" $no; ((no++)); done
```

# 사용자 및 추가

```sh
# 사용자 확인
a=$(grep ^UID_MIN /etc/login.defs | awk '{print $2}')
b=$(grep ^UID_MAX /etc/login.defs | awk '{print $2}')
c=$(grep /bin/bash /etc/passwd | awk -F':' '{print $1}')
d=$(awk -F':' -v "a=$a" -v "b=$b" '{ if ( $3>=a && $3<=b ) print $1}' /etc/passwd)
echo -e "$c\n$d" | sort | uniq

id
who
su - root
sudo passwd -u / l root
# sudo로 해야됨
useradd -m username
passwd username
# user에게 sudo 권한 주기
sudo usermod -a -G sudo username
usermod -a -G groupname username
groupadd groupname
```

# systemctl

```sh
# 전체 서비스 확인 -
service --status-all

# 실행중인 서비스 확인
service --status-all | grep +

# 등록된 서비스 확인 - RHEL 계열
systemctl list-unit-files
systemctl stop ${serviceName}
systemctl start ${serviceName}
systemctl status ${serviceName}
systemctl restart ${serviceName}
systemctl enable ${serviceName}
journalctl -u ${serviceName}

# 서비스 등록
/etc/systemd/system/${serviceName}.service
# 아래 내용 등록
[Unit]
Description=aibos driver api
After=network.target
StartLimitIntervalSec=0
[Service]
Type=simple
Restart=always
RestartSec=1
User=centos
ExecStart=/data/start-application.sh
ExecStop=/data/stop-application.sh
[Install]
WantedBy=multi-user.target
```

# http 메시지 확인, 인터넷 연결 확인

```sh
curl -i https://helloworld.com
dig
telnet 127.0.0.1 8080
nc -z localhost 8080
ping
dig +trace google.com
netstat -an -ptcp | grep LISTEN
```

# 원격 접속 및 파일 전송

```sh
~/.ssh
ssh-keygen
ssh-copy-id user@localhost

ssh -i ./key.pem user@127.0.0.1
scp -i ./key.pem -r ~/dir user@127.0.01:/data/home/dir
```

# port포워딩

```sh
ssh hostname -L host:hostname2:destination-port
```

# postgres

```sh
sudo -u postgres psql
psql -u postgres -d dbName -h localhost
```

# ip

```sh
ip addr
ip route
ifconfig
```

# rsync - ssh network

```sh
rsync -a src dest
rsync -avzP src/ dest
```

# nginx 관련

```sh
ls -lZd /home/test/
chcon -R -t httpd_sys_content_t /home/test/
```

# 서버 가동시간 확인

```sh
uptime
```

# 시스템 오류 메세지 확인

```sh
dmesg | tail
cat /var/log/messages | egrep -i "emerg|alert|crit|error|warn|fail"
cat /var/log/secure | tail
```

# let's encrypt 설치

```sh
wget https://dl.eff.org/certbot-auto
chmod a+x certbot-auto
./certbot-auto
cd /etc/letsencrypt/live

SHELL=/bin/sh
PATH=/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin
01 01 1 * * root certbot -q renew --nginx --renew-hook 'service nginx reload' >> /logs/certbot.log 2>&1
```

# 압축

```sh
gzip filename
gzip -d filename
# z 압축, v 메시지 출력, f 파일을 묶도록 지정, c,x
tar -cvfz test.tar
find . -name "*.log"  -o -name "test.*" | xargs tar rvf test.tar
```

# iptables

```sh

# -A (--append) : 새로운 규칙을 추가.
# -D (--delete) : 규칙을 삭제.
# -C (--check) : 패킷을 테스트.
# -R (--replace) : 새로운 규칙으로 교체.
# -I (--insert) : 새로운 규칙을 삽입.
# -L (--list) : 규칙을 출력.
# -F (--flush) : chain으로부터 규칙을 모두 삭제.
# -Z (--zero) : 모든 chain의 패킷과 바이트 카운터 값을 0으로 만듬.
# -N (--new) : 새로운 chain을 만듬.
# -X (--delete-chain) : chain을 삭제.
# -P (--policy) : 기본정책을 변경.

# --source (-s) : 출발지 IP주소나 네트워크와의 매칭
# --destination (-d) : 목적지 ip주소나 네트워크와의 매칭
# --protocol (-p) : 특정 프로토콜과의 매칭
# --in-interface (i) : 입력 인테페이스
# --out-interface (-o) : 출력 인터페이스
# --state : 연결 상태와의 매칭
# --string : 애플리케이션 계층 데이터 바이트 순서와의 매칭
# --comment : 커널 메모리 내의 규칙과 연계되는 최대 256바이트 주석
# --syn (-y) : SYN 패킷을 허용하지 않는다.
# --fragment (-f) : 두 번째 이후의 조각에 대해서 규칙을 명시한다.
# --table (-t) : 처리될 테이블
# --jump (-j) : 규칙에 맞는 패킷을 어떻게 처리할 것인가를 명시한다.
# --match (-m) : 특정 모듈과의 매치

# ACCEPT : 패킷을 받아들임.
# DROP : 패킷을 버림(패킷이 전송된 적이 없던 것처럼).
# REJECT : 패킷을 버리고 이와 동시에 적절한 응답 패킷을 전송.
# LOG : 패킷을 syslog에 기록.
# RETURN : 호출 체인 내에서 패킷 처리를 지속함.

# 상태 확인
iptables -nvL

# 특정 ip 차단
iptables -I INPUT -s xxx.xxx.xxx.xxx -j DROP
# 특정 ip 허용
iptables -A INPUT -s xxx.xxx.xxx.xxx -j ACCEPT
# 특정 port 차단
iptables -A INPUT -p tcp --dport xxxx -j DROP
# 특정 ip, port 허용
iptables -A INPUT -p tcp -s xxx.xxx.xxx.xxx --dport xxxx -j ACCEPT

# 모든 규칙 삭제
iptables --flush

# 수정 전 백업 및 복구
/sbin/iptables-save > /etc/iptables.rules
/sbin/iptables-restore < /etc/iptables.rules

iptables -L # 리스트 조회
iptables -I INPUT -p tcp --dport portNumber -j ACCEPT
```

## 복구 예제

```sh
#!/bin/bash

cat /etc/iptables.rules

/sbin/iptables-restore < /etc/iptables.rules
```

# 프로세스 제한 확인

```sh
# nginx tcp 상태별 개수
netstat -napo | fgrep nginx | awk '{print $6}' | sort | uniq -c
ulimit -Hn
ulimit -Sn
```

# 링크 관련

```sh
# 하드링크 만들기
ln test.txt test.txt.hd
# 심볼릭링크 만들기
ln -s test.txt test.txt.sym
```

# Mac - java

```sh
# 설치된 자바 확인
/usr/libexec/java_home -V

#
brew tap adoptopenjdk/openjdk
brew search jdk
brew install --cask adoptopenjdk11

jstat -gcutil -t -h20 14385 3000

# 메모리 확인
jcmd 14385 GC.class_histogram
jmap -histo 14385

# dump 뜨기
jcmd 14385 GC.heap_dump heap_dump.hprof
jmap -dump:file=heap_dump.hprof 14385
```
