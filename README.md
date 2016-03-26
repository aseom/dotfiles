ASeom's dotfiles
================

개발환경에 필요한 잡동사니들을 모아둔 저장소


## Cheatsheet

#### [Linux](docs/cheatsheet-linux.md)


## macbook-pro

추가바람.


## SSH key pairs

로컬에서 key pair 생성 후 1Password에 저장

```Shell
$ ssh-keygen -t rsa -N "" -f id_rsa
```

#### GitHub SSH connection
```Shell
# Generated at 2016‎-03‎-22‎
.../github-aseom/id_rsa
.../github-aseom/id_rsa.pub
```

#### Linux server (vultr-aseom)
```Shell
# Generated at 2016‎-03‎-22‎
.../vultr-aseom/id_rsa
.../vultr-aseom/id_rsa.pub
```


## Sublime Text 3

#### Python with virtualenv

`*.sublime-project` 파일에 다음과 같이 virtualenv의 Python executable을 지정.

```JSON
"settings": {
	"python_interpreter": "$project_path/.venv/Scripts/python.exe"
}
```


## Git

#### 이미 커밋된 파일을 .gitignore에 추가할 경우

무시되지만 여전히 무시되지 않는(?) 파일의 리스트를 확인하고,  
해당되는 파일들을 stage 영역에서 삭제 후 변경사항을 커밋.

	$ git ls-files --ignored --exclude-standard
	$ git rm --cached path/to/file
	$ git commit -m "Delete ignored files"
