ASeom's dotfiles
================

개발환경 구축에 필요한 잡동사니들을 모아둔 저장소


## PC-ASeom

	Windows (C:)
	├─ Portable - 잡다한 무설치 프로그램
	├─ Console - 해당 본문 참조
	├─ Git - Git for Windows 설치
	└─ 기타 소프트웨어

	External (D:)
	├─ Windows 백업
	└─ 기타 대용량 데이터

	Backup (평상시 언마운트)
	└─ 주 1회 Windows 이미지 백업

- 네트워크 공유, 파일 공유 끄기
- 홈 그룹 비활성화 (HomeGroup Provider 서비스)
- 자동 업데이트 비활성화 (gpedit.msc)
- 자동 로그인 설정 (netplwiz)
- OneDrive 비활성화 (gpedit.msc)

개발용으로 웹서버 구동시 방화벽으로 인바운드 연결 차단


## Console

#### 설치 필요

- **Git for Windows**  
	`C:\Git\`  
	https://git-for-windows.github.io/

- **Clink**  
	`C:\Console\clink\`  
	https://mridgers.github.io/clink/

- **Ansicon**  
	`C:\Console\ansicon\`  
	http://adoxa.altervista.org/ansicon/

- **NirCmd**  
	`C:\Console\utils\nircmd.exe`  
	http://www.nirsoft.net/utils/nircmd.html

Bash profile 흉내내기  
몹쓸 명령 프롬프트를 쓸만하게 만듦

	cmd.exe /k "C:\Console\profile.cmd"

cmd.exe를 위한 Color schemes: `console/color-schemes/cmd-color-*.reg`

시스템 환경 변수에 `C:\Console\utils\` 추가. 각종 CLI 유틸리티를 해당 폴더에 설치.


## Sublime Text 3

#### Command Palette

- **ASeom: Ruby Pry**
	- SublimeREPL의 [Ruby Pry 오류 해결][]한 것
	- 작동하려면 `gem install pry` 필요함

[Ruby Pry 오류 해결]: https://github.com/smiler/SublimeREPL/commit/95ffe15382336ef6720502752e71c290055cf7f8


## Git

#### 이미 커밋된 파일을 .gitignore에 추가할 경우

무시되지만 여전히 무시되지 않는(?) 파일의 리스트를 확인하고,
해당되는 파일들을 stage 영역에서 삭제 후 변경사항을 커밋.

	$ git ls-files --ignored --exclude-standard
	$ git rm --cached path/to/file
	$ git commit -m "Delete ignored files"
