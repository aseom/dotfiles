Cheatsheet - Linux
==================


Working with files
------------------

#### 디렉토리 내의 모든 파일에 `chmod 600`
```Shell
$ find DIRNAME/ -type f -exec chmod 600 {} \;
```


File permissions
----------------

#### umask

umask | 파일            | 폴더
------|-----------------|----------------
000   | 666 (rw-rw-rw-) | 777 (rwxrwxrwx)
022   | 644 (rw-r--r--) | 755 (rwxr-xr-x)
077   | 600 (rw-------) | 700 (rwx------)

시스템 전역 umask는 `/etc/profile`이 아닌 `/etc/login.defs`에.  
(Ubuntu 14.04 기준)

`USERGROUPS_ENAB yes`인 경우,  
root가 아닌 유저의 유저명과 그룹명이 동일할 때  
umask 적용 시 user와 group 권한이 동일하게 적용된다.

umask 077이면 700권한이 지정되는게 맞지만  
umask 007로 변경되어 770이 지정된다는 뜻.


Vim - Vi IMproved
-----------------

- [VIM을 사용하자](http://play.joinc.co.kr/w/Site/Vim/Documents/UsedVim)

- [VIM 단축키 및 설정](http://sinoroo.tistory.com/entry/VIM-%EB%8B%A8%EC%B6%95%ED%82%A4-%EB%B0%8F-%EC%84%A4%EC%A0%95)

- [화면 나누기 및 버퍼 관리](http://anster.tistory.com/64)

#### Vundle

- [플러그인 관리자 Vundle - GitHub](https://github.com/VundleVim/Vundle.vim)

- [Vundle + NERDTree 플러그인 설치하기](https://dobest.io/install-vundle-and-nerdtree/)

플러그인 추가시 `.vimrc`에 추가하고 `:PluginInstall`  
`:PluginClean`하면 `.vimrc`에 없는 플러그인은 삭제됨.

#### Normal Mode
Key                    | 동작
-----------------------|----------------------------
o                      | 다음줄에서 입력모드
V, y, x (visual, yank) | 줄단위 블럭지정, 복사, 삭제
p (put/paste)          | 붙여넣기
u (undo)               | 실행취소
ctrl+w w               | 창 분할 상태에서 창 이동

#### Command Mode
Command           | 동작
------------------|--------------------------
:w                | 저장
:wq               | 저장 & 닫기
:wqa              | 저장 & 닫기 (모든창)
:q                | 닫기
:qa               | 닫기 (모든창)
/[단어]           | 찾기
:%s/[From]/[To]   | 찾아 바꾸기
:%s/[From]/[To]/c | 찾아 바꾸기 (하나씩 확인)

#### 파일 비교
```Shell
$ vimdiff FILE1 FILE2
```

#### 줄 끝의 `^M` 해결
```Vim
:set ff?
" fileformat 이 unix 이면..
:e ++ff=dos (Edit file again, using dos file format)
:wq
```


tmux - terminal multiplexer
---------------------------

- [tmux man page](http://www.openbsd.org/cgi-bin/man.cgi?query=tmux)

- [Tmux 입문자님들을 위해](http://nodeqa.com/nodejs_ref/99)

#### 특정 pane으로 키입력 보내기
```Shell
$ tmux send -t SESSION:WINDOW.PANE SOME_COMMAND Enter
$ tmux send -t MCServer:Spigot.0 save-off Enter
```


Powerline
---------

- [Powerline beta documentation](http://powerline.readthedocs.org/en/master/)

- [Powerline : Shell, Vim 등의 Statusline을 예쁘게](http://humb1ec0ding.github.io/2013/11/26/ubuntu-powerline-beautify-the-stateline.html)

- [D2Coding Powerline](http://dalgona.128bit.tech/d2coding-powerline/)


Uncategorized
-------------

#### SSH 접속 시 `~/.ssh/config` 무시하기
```Shell
$ ssh ... -F /dev/null
```
