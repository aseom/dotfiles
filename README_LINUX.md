Linux server
------------

#### Ubuntu 14.04 기준

```Shell
cd ~
ln -sf ~/dotfiles/.vimrc

# Git
git config --global user.name "aseom"
git config --global user.email "hm9599@gmail.com"
git config --global core.editor "vim"
```

---

#### 타임존 설정
```Shell
dpkg-reconfigure tzdata
# Asia → Seoul 선택
```

#### Hostname 설정
```Shell
echo "example-aseom" > /etc/hostname
hostname -F /etc/hostname
# 재접속 후 바뀐 것 확인
```

#### APT 서버 위치 변경
```Shell
cd /etc/apt
cat sources.list
cp -p sources.list sources.list.backup_
sed -i "s/archive.ubuntu.com/jp.archive.ubuntu.com/g" sources.list
```

#### apt-get ...
```Shell
apt-get update
apt-get upgrade
apt-get install git vim
```

#### SSH 접속 설정

공개키 등록: `~/.ssh/authorized_keys`

```Shell
cd /etc/ssh
cp -p sshd_config sshd_config.backup_
vim sshd_config
```

```
Port [비밀!]

AllowUsers root
PermitRootLogin yes

PubkeyAuthentication yes
PasswordAuthentication no
```

```Shell
service ssh restart
```
