# docker 설치

```
sudo yum install docker-io -- yes
```

# docker 설치 후 시작

```sh
sudo systemctl start docker
```

# docker 권한 부여

```sh
sudo setfacl -m username:rw /var/run/docker.sock
```

# docker 구동 확인

```sh
docker ps -a
```

# docker 기본 동작

```sh
# docker container run [Dokcer 이미지명] [실행 명령]
docker container run ubuntu:latest /bin/echo 'Hello wrold'

# version 정보 확인
docker version

# 실행환경 확인
docker system info

# 디스크 현황 확인
docker system df

# 허브에 있는 이미지의 경우
docker pull nginx

# 클라이언트 이미지 다운로드 확인
docker image ls

# nginx 구동 예제 --name: 컨테이너 이름을 webserver로, -d: 데몬으로 돌리고 ID, -p 80에 대하 접근허가
docker container run --name webserver -d -p 80:80 nginx

# 컨테이너 상태확인
docker container ps

# 컨테이너 상세 확인
docker container stats webserver

# 컨테이너 정지
docker stop webserver

# 컨테이너 시작
docker start webserver
```

# docker 이미지, 삭제, 생성, 실행

```sh
docker rm --volumes --force "name-container"
docker pull address
docker create --restart=no --name ""\options
docker start --attach "name-container"
```

# docker Hub와 로그인 및 검색

```sh
docker login
docker search
```
