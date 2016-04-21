aseom.dotfiles
==============

### MacBook Pro

> 잠자기 시 암호 요구 끔  
> 보안 설정에서 자동 로그인 활성화 (사용자 설정 아님!)  
> 공유 설정에서 컴퓨터 이름 지정  
> XCode, Homebrew 설치

```Shell
cd ~
git clone https://github.com/aseom/dotfiles.git
ln -sf ~/dotfiles/.gitconfig && ln -sf ~/dotfiles/.gitignore_global
ln -sf ~/dotfiles/bin

mkdir .ssh && chmod 700 .ssh && ln -sf ~/dotfiles/.ssh/config .ssh
chmod 600 .ssh/*.pem  # After copy ssh keys

cd ~/dotfiles && git remote set-url origin git@github.com:aseom/dotfiles.git
```

### Zsh
```Shell
brew install zsh
ln -sf ~/dotfiles/.zshrc ~

# As default shell
sudo cp -p /etc/shells /etc/shells.backup_
echo $(which zsh) | sudo tee -a /etc/shells
chpass -s $(which zsh)
```

### Vim
```Shell
brew install vim --with-lua  # neocomplete requires lua
ln -sf ~/dotfiles/.vimrc ~

curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
vim +PlugInstall +qall

# Plugin reqirements
cd ~/.vim/plugged/tern_for_vim && npm install
pip install grip
```
