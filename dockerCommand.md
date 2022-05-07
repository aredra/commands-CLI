# docker 설치

```sh
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

# -it 실행한 컨테이너 내부로 들어가기, -e 환경변수 설정
docker contser run -d -it -e foo=bar centos /bin/bash

# 컨테이너 상태확인
docker container ps

# 컨테이너 상세 확인
docker container stats webserver

# 컨테이너 정지
docker stop webserver

# 컨테이너 시작
docker start webserver
```

# 검색

```sh
docker search --limit 10 nginx
docker search --filter=stars=1000 nginx

```

# DCT(Docker Content Trust) 사용

```sh
# 사용
export DOCKER_CONTENT_TRUST=1

# 미사용
export DOCKER_CONTENT_TRUST=0
```

# docker 이미지, 삭제, 생성, 실행

```sh
# -a 모든 태그 url도 가능 프로토콜 부분은 제외
docker image pull centos:7

docker image ls
docker image inspect ${imageName}
docker image tag nginx ${userName}/${imageName}${tagName}

# 삭제
docker image rm ${imageName}
docekr image prune -a

# upload
docker image push ${imageName}
```

# container 다루기

```sh
docker container create
docker container ps
docker container stop
docker container start
docker container restart
docker container pause
docker container rm
docker container inspect
docker container logs

# -a: 표준입출력,에러, -d: 백그라운드
docker container run

```

# docker Hub와 로그인 및 검색

```sh
docker login
docker search
```

# 컨테이너 접속하기

```sh
docker exec -it {containerId} /bin/bash
```
