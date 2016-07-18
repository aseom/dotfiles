aseom.dotfiles
==============

### MacBook Pro

> 잠자기 시 암호 요구 끔  
> 보안 설정에서 자동 로그인 활성화 (사용자 설정 아님!)  
> 입력 메뉴에서 다음 소스 선택에 `Cmd` + `Space` 할당  
> XCode, Homebrew 설치

```Shell
git clone --recursive https://github.com/aseom/dotfiles.git ~/dotfiles
cd ~/dotfiles && ./install.sh
```

###### Atom
```Shell
brew cask install atom
apm install --packages-file ~/.atom/packages.txt
```

###### Zsh
```Shell
brew install zsh

# As default shell
sudo cp -p /etc/shells /etc/shells.backup_
echo $(which zsh) | sudo tee -a /etc/shells
chpass -s $(which zsh)
```

###### Vim
```Shell
brew install vim --with-lua  # neocomplete requires lua
brew cask install macvim     # or install MacVim

# Install plugins
vim +PlugInstall +qa
pip install grip  # for vim-markdown-preview
```

### See also

###### [Bookmarks & Cheatsheet](https://github.com/aseom/dotfiles/wiki)
