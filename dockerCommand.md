# docker  설치
```
sudo yum install docker-io -- yes
```
# docker 설치 후 시작
```
sudo systemctl start docker
```
# docker 권한 부여
```
sudo setfacl -m username:rw /var/run/docker.sock
```
# docker 구동 확인
```
docker ps -a
```
# docker 이미지, 삭제, 생성, 실행
```
docker rm --volumes --force "name-container"
docker pull address
docker create --restart=no --name ""\options
docker start --attach "name-container"
```
# docker Hub와 로그인 및 검색
```
docker login
docker search
```