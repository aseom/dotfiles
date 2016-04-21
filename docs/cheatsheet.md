Cheatsheet
----------

### Vim - Vi IMproved

- [VIM을 사용하자](http://play.joinc.co.kr/w/Site/Vim/Documents/UsedVim)
- [화면 나누기 및 버퍼 관리](http://anster.tistory.com/64)
- [vi Complete Key Binding List](http://hea-www.harvard.edu/~fine/Tech/vi.html)
- [Vi and Vim Editor: 12 Powerful Find and Replace Examples](http://www.thegeekstuff.com/2009/04/vi-vim-editor-search-and-replace-examples/)

##### 파일 비교
```Shell
vimdiff FILE1 FILE2
```

##### 줄 끝의 `^M` 해결
```Vim
:set ff?

" fileformat 이 unix라면
:e ++ff=dos (Edit file again, using dos file format)
:wq
```


### Tmux - terminal multiplexer

- [Tmux 입문자님들을 위해](http://nodeqa.com/nodejs_ref/99)

##### 특정 pane으로 키입력 보내기
```Shell
tmux send -t SESSION:WINDOW.PANE SOME_COMMAND Enter
tmux send -t MCServer:Spigot.0 save-off Enter
```


### Others

- [D2Coding Powerline](http://dalgona.128bit.tech/d2coding-powerline/)

##### umask

umask | 파일            | 폴더
------|-----------------|----------------
000   | 666 (rw-rw-rw-) | 777 (rwxrwxrwx)
022   | 644 (rw-r--r--) | 755 (rwxr-xr-x)
077   | 600 (rw-------) | 700 (rwx------)

Ubuntu 14.04 기준, 시스템 전역 umask는 `/etc/profile`이 아닌 `/etc/login.defs`에 지정됨.  
`USERGROUPS_ENAB yes`인 경우 umask 적용 시 user와 group 권한이 동일하게 적용된다.

##### 디렉토리 내의 모든 파일에 `chmod 600`
```Shell
find DIRNAME/ -type f -exec chmod 600 {} \;
```

##### Generate SSH key
```Shell
ssh-keygen -t rsa -N "" -f whatever.pem
```

##### SSH 접속 시 `~/.ssh/config` 무시하기
```Shell
ssh ... -F /dev/null
```

##### 이미 커밋된 파일을 .gitignore에 추가

무시되지만 여전히 무시되지 않는(?) 파일의 리스트를 확인하고,  
해당되는 파일들을 stage 영역에서 삭제 후 변경사항을 커밋.

```Shell
git ls-files --ignored --exclude-standard
git rm --cached path/to/file
git commit -m "Delete ignored files"
```
