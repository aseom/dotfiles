# ASeom's Linux server

Hosted by Vultr.


## Initialize

#### vultr-aseom
Ubuntu 14.04 x64 인스턴스 생성 후,  
초기 비밀번호로 SSH 접속.

#### 타임존 설정
```Shell
$ dpkg-reconfigure tzdata
```
Asia → Seoul 선택.

#### Hostname 설정
```Shell
$ echo "vultr-aseom" > /etc/hostname
$ hostname -F /etc/hostname
```
SSH 재접속 후 바뀐 것 확인.

#### APT 서버 위치 변경
```Shell
$ cd /etc/apt
$ cat sources.list
$ cp -p sources.list sources.list.backup_
$ sed -i "s/archive.ubuntu.com/jp.archive.ubuntu.com/g" sources.list
```

#### 패키지 업데이트
```Shell
$ apt-get update
$ apt-get upgrade
```

#### Vim 확인 및 설치

```Shell
$ vim --version
```

문제가 있거나 `-syntax`로 나오면...

```Shell
$ apt-get install vim
```

#### SSH 접속 설정

```Shell
$ cat ~/.ssh/authorized_keys
$ echo "[공개키]" > ~/.ssh/authorized_keys
$ cd /etc/ssh
$ cp -p sshd_config sshd_config.backup_
$ vi sshd_config
```

```
Port [비밀!]

AllowUsers root
PermitRootLogin yes

PubkeyAuthentication yes
PasswordAuthentication no
```

```Shell
$ service ssh restart
```

SSH 접속 가능한지 테스트.

#### 마무리

서버 잠깐 내리고 `initial_snapshot` 스냅샷 생성.


## Working with this repository

```Shell
cd ~
git clone https://github.com/aseom/dotfiles.git
ln -sf ~/dotfiles/.vimrc
ln -sf ~/dotfiles/ubuntu/.bashrc
ln -sf ~/dotfiles/ubuntu/.ssh/config .ssh
```
