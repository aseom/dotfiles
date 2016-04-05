ASeom's dotfiles
================

개발환경에 필요한 잡동사니들을 모아둔 저장소


## Cheatsheet

#### [Linux](docs/cheatsheet-linux.md)


## macbook-pro

- 잠자기 시 암호 요구 끔
- 보안 설정에서 자동 로그인 활성화 (사용자 설정 아님!)
- 공유 설정에서 컴퓨터 이름 지정

- XCode, iTerm2, Homebrew
- Sublime Text 3, Package Control
- Menlo, D2Coding

```Shell
brew install git vim zsh
```

```Shell
cd ~
git clone https://github.com/aseom/dotfiles.git
ln -sf ~/dotfiles/.gitconfig
ln -sf ~/dotfiles/.gitignore_global
ln -sf ~/dotfiles/.vimrc
ln -sf ~/dotfiles/.zshrc

mkdir .ssh && chmod 700 .ssh && ln -sf ~/dotfiles/.ssh/config .ssh
cd "$HOME/Library/Application Support/Sublime Text 3/Packages"
rm -rf User && ln -s ~/dotfiles/sublime-text User
```

---

#### Use SSH
```Shell
chmod 600 ~/.ssh/*.pem
cd ~/dotfiles && git remote set-url origin git@github.com:aseom/dotfiles.git
```

#### Generate SSH key
```Shell
$ ssh-keygen -t rsa -N "" -f whatever.pem
```

#### ST3: Python with virtualenv

`*.sublime-project` 파일에 다음과 같이 virtualenv의 Python executable을 지정.

```JSON
"settings": {
	"python_interpreter": "$project_path/.venv/Scripts/python.exe"
}
```

#### 이미 커밋된 파일을 .gitignore에 추가

무시되지만 여전히 무시되지 않는(?) 파일의 리스트를 확인하고,  
해당되는 파일들을 stage 영역에서 삭제 후 변경사항을 커밋.

	$ git ls-files --ignored --exclude-standard
	$ git rm --cached path/to/file
	$ git commit -m "Delete ignored files"
