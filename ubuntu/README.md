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
# 서버에 Git SSH key 업로드: ~/.ssh/github-aseom
echo -e "Host github.com\n  IdentityFile ~/.ssh/github-aseom" >> ~/.ssh/config

cd /home
git clone git@github.com:aseom/vultr-aseom.git

cd ~
ln -sf /home/vultr-aseom/.vimrc
ln -sf /home/vultr-aseom/.bashrc
```
