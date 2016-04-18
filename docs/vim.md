Vim - Vi IMproved
=================

설치 (OS X)
-----------

[neocomplete](https://github.com/Shougo/neocomplete.vim) 플러그인이 lua를 사용한다.

```Shell
brew install vim --with-lua

ln -sf ~/dotfiles/.vimrc ~
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```

vim 실행 후 `:PlugInstall`하면 끝이긴 한데...  
JavaScript 자동완성을 위해 아래 명령으로 [Tern](http://ternjs.net/)을 설치해 준다.

```Shell
cd ~/.vim/plugged/tern_for_vim && npm install
```
