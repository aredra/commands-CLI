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
echo $0 - 현재의 쉘 확인
echo 'hellow world' > test.txt
echo * >> test.txt

# -e 특수문자 사용가능, -n 개행 안 함
echo -ne 'hellow echo\a'
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
chmod +x backup
chmod 600 ${target}
chown -R owner:group
```

# 파일 검색

```sh
locate *.log
find . -name test.*
find . -name '*.log' | xargs grep -r --color=auto -n 2>/dev/null 'searchingText'
whereis
ls -alR /  > result.txt 2> error.log &
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

# alias

```sh
alias ll = 'ls -al' //대소문자 구별함
```

# 사용자 및 추가

```sh
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

# http 메시지 확인, 인터넷 연결 확인

```sh
curl -i https://helloworld.com
dig
telnet 127.0.0.1 8080
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

# 자바 설치 - brew

```sh
brew tap AdoptOpenJDK/openjdk
brew cask install adoptopenjdk8
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
iptables -L //리스트 조회
iptables -I INPUT -p tcp --dport portNumber -j ACCEPT
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
