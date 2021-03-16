### 로컬pc - workspace - 로컬저장소(.git) - stage - commit - push

### stage에 없을 경우 새로 생성된 파일의 경우 tracking 되지 않음

### fork 저장소를 통째로 복제하여 repository를 새로 만듬

### pull request(PR) 에 fork 및 branch에서 merge 요청

### feat/기능이름, fix/버그이름, hotfix/급한버그

### dev, master, release branch는 커밋하지 않는다, merge만 하는 걸 권장

# 계정정보 수정

```
git config --global user.name name
git config --local user.email email
git config --unset credential.helper
```

# 해당 디렉토리 git 생성

```
git init
```

# README.md 생성

```
echo "#repository name readme!" >> README.md
```

# 파일 스테이지에 올리기

```
git add fileName.etc
git add .
```

# 현재 스테이지 상황 comment 로 commit 하기

```
git commit -m "comment"
```

# origin 에서 내용 가져오기

```
git fetch origin branchName
git pull origin branchName
```

# 원격 오리진 저장소 추가, 삭제

```sh
git remote add origin address
git remote remove origin
git remote -v

# 삭제
git push origin --delete branchName
git push origin :oldBranchName

# 교체한 브랜치 등록
git push --set-upstream origin newBranchName
```

# git 현재 hash 값 확인

```sh
git rev-parse --short HEAD
```

# 올리기

```sh
git push origin branchName
```

# stage 취소

```sh
git reset HEAD fileName
```

# 커밋 취소

```
git reset --soft HEAD^  //commit 취소 staging
git reset --mixed           //commit staging 취소
git reset --hard             //commit 취소 파일 삭제
```

# commit message 변경

```
git commit --amend
git commit --allow-empty -m "test"
```

# branch 변경

```
git checkout -b branchName
git branch branchName //git branch 현재 브랜치 확인
git branch -r //원격 브랜치 확인
git checkout -t origin/branchName // 원격브랜치 가져와서 로컬브랜치 생성 및 교체
git branch -m $currentName $changedName
```

# branch 삭제

```
git branch -d branchName
```

# 원격 저장소 clone

```
git clone address
```

# git stash

```
git stash  //staging or not 전부 stash
git stash -u  //.gitignore 제외 추적 안되는 파일들까지 전부
git stash save "msg"
git stash list
git stash pop  //삭제 후 적용
git stash apply  //삭제 노 적용
git stash clear
```

# compare와 base merge

```
git merge compareBranch - baseBranch에서 작업
git mergetool
git status
```

# git cash 삭제

```
git rm -r --cached .
```

# etc

```
git rebase //conflict가 안나는 상태로
git amend //좀 전 커밋에 살짝 추가
git cherry-pick // 커밋 하나만 지금 브랜치에 붙임
git reverse //변경사항만 되돌림
git stash // 변경사항을 잠시 keep
git reset --hard, --soft
git revert commitNum -m 부모넘버
git reflog
git log
git log --pretty=oneline
git log --oneline --graph
gitk
```

# conflict

```
<<<< HEAD
asdfasdf    - baseBranch

zxczcxvz    - compareBranch
 >>>> compare
```
