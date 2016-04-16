Node.js
=======

설치: OS X
----

```Shell
brew install node
```

Vim autocomplete
----------------

### [YouCompleteMe](https://github.com/Valloric/YouCompleteMe)

`vim-plug`로 일단 설치:
```Vim
Plug 'Valloric/YouCompleteMe'
```

이후 빌드 스크립트 실행:
```Shell
brew install cmake
cd ~/.vim/plugged/YouCompleteMe
./install.py --tern-completer
```

Node의 `Tern` 모듈이 설치되는 위치:
```
~/.vim/plugged/YouCompleteMe/third_party/ycmd/third_party/tern_runtime
```

### [Tern](https://github.com/ternjs/tern)

> A JavaScript code analyzer for deep, cross-editor language support
