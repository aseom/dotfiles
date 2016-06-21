#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

GroupAdd, McTs4, ahk_class LWJGL  ;MC
GroupAdd, McTs4, ahk_exe TS4.exe  ;TS4

Return



;;;;;;;;;;;;;;;;
;; OSK        ;;
;;;;;;;;;;;;;;;;

#IfWinExist, ahk_exe osk.exe
	RButton::
		SendInput, {Shift Down}
		KeyWait, RButton
		SendInput, {Shift Up}
		SendInput, {RButton}
	Return
#IfWinExist



;;;;;;;;;;;;;;;;;;;;;;
;; MC or TS4 비활성 ;;
;;;;;;;;;;;;;;;;;;;;;;

#IfWinNotActive, ahk_group McTs4

	XButton2::
    WheelRight::
		; OSK 실행 또는 닫기
		Process, Exist, osk.exe
		if (ErrorLevel == 0)
		{
			Run, osk.exe
			WinWait, ahk_exe osk.exe, , 3
			if (ErrorLevel == 0)
				WinMove, ahk_exe osk.exe, , , , 850, 250
		}
		else
			WinClose, ahk_exe osk.exe
	Return
	XButton2 & LButton::
		; AquaSnap
		SendInput, {Ctrl Down}
		SendInput, {LButton Down}
		KeyWait, LButton
		SendInput, {LButton Up}
		SendInput, {Ctrl Up}
	Return

	XButton2 & WheelUp:: SendInput, #^{Left}
	XButton2 & WheelDown:: SendInput, #^{Right}

	XButton1 & WheelUp:: Run, DisplaySwitch.exe /internal
	XButton1 & WheelDown:: Run, DisplaySwitch.exe /external
	WheelLeft:: Run, DisplaySwitch.exe /external

#IfWinNotActive



;;;;;;;;;;;;;;;
;; Minecraft ;;
;;;;;;;;;;;;;;;

; #IfWinActive, ahk_class LWJGL

; openOskForMc()
; {
; 	Run, osk.exe
; 	WinWait, ahk_exe osk.exe, , 3
; 	if (ErrorLevel == 0)
; 		WinMove, ahk_exe osk.exe, , 180, 280, 850, 250
; }

; VK15SC138:: Return

; ~LButton & ~Enter::
; 	Sleep, 100
; 	SendInput, t
; Return

; ; General ;

; WheelUp:: SendInput, a
; WheelDown:: SendInput, b

; XButton2:: ; 윗버튼
; 	Process, Exist, osk.exe
; 	if (ErrorLevel == 0)
; 		SendInput, {MButton}
; 	else
; 	{
; 		WinClose, ahk_exe osk.exe
; 		SendInput, {Esc}
; 		SendInput, {F11}
; 	}
; Return

; XButton1:: SendInput, e ; 아랫버튼

; XButton2 & XButton1::
; 	SendInput, {c Down}
; 	KeyWait, XButton2
; 	SendInput, {c Up}
; Return

; XButton1 & XButton2::
; 	SendInput, {LShift Down}
; 	KeyWait, XButton2
; 	SendInput, {LShift Up}
; Return

; ; With XB2 (윗버튼) ;

; XButton2 & LButton::
; 	KeyWait, LButton, T0.5  ; 0.5초 타임아웃
; 	if (ErrorLevel == 0)  ; If, 롱프레스가 아니면
; 	{
; 		Process, Exist, osk.exe
; 		if (ErrorLevel != 0)
; 		{
; 			WinClose, ahk_exe osk.exe
; 			SendInput, {Esc}
; 			Sleep, 100
; 		}
; 		SendInput, {Esc}
; 	}
; 	else
; 	{
; 		Process, Exist, osk.exe
; 		if (ErrorLevel == 0)
; 			SendInput, {F11}
; 	}
; Return

; XButton2 & RButton::
; 	KeyWait, RButton, T0.5  ; 0.5초 타임아웃
; 	if (ErrorLevel == 0)  ; If, 롱프레스가 아니면
; 	{
; 		Process, Exist, osk.exe
; 		if (ErrorLevel == 0)
; 		{
; 			SendInput, t
; 			WinGetPos, , , W, H
; 			if (W == 1920 && H == 1080)
; 				SendInput, {F11}
; 			openOskForMc()
; 		}
; 	}
; 	else
; 		SendInput, {F3}
; Return

; XButton2 & ~WheelUp::    ; X1 + 휠 업다운시 기본 스크롤 동작 블락시키지 않기(~).
; XButton2 & ~WheelDown::  ; 인풋은 없음. 인벤핫바 스크롤용.
; Return                   ; 건들지 말 것.

; ; With XB1 (아랫버튼) ;

; XButton1 & LButton::
; 	SendInput, {Tab Down}
; 	KeyWait, LButton
; 	SendInput, {Tab Up}
; Return

; XButton1 & RButton::
; 	KeyWait, RButton, T0.5  ; 0.5초 타임아웃
; 	if (ErrorLevel == 0)  ; If, 롱프레스가 아니면
; 		SendInput, {F1}
; 	else
; 	{
; 		KeyWait, RButton, T0.5  ; 0.5초 더 기다림
; 		if (ErrorLevel == 0)  ; 누르고 0.5초 후 뗀 경우
; 			SendInput, {F2}
; 		else
; 			SendInput, {F5}  ; 누르고 0.5+0.5초 후 뗀 경우
; 	}
; Return

; XButton1 & WheelUp:: SendInput, q
; XButton1 & WheelDown:: SendInput, {F3}

; #IfWinActive



;;;;;;;;;;;;
;; Sims 4 ;;
;;;;;;;;;;;;

; #IfWinActive, ahk_exe TS4.exe

; XButton2:: SendInput, {Del}
; XButton2 & WheelUp:: SendInput, +{]}
; XButton2 & WheelDown:: SendInput, .
; XButton2 & LButton::
; 	KeyWait, LButton, T0.5  ; 0.5초 타임아웃
; 	if (ErrorLevel == 0)  ; If, 롱프레스가 아니면
; 		SendInput, h
; 	else
; 		SendInput, k
; Return
; XButton2 & RButton::
; 	KeyWait, RButton, T0.5  ; 0.5초 타임아웃
; 	if (ErrorLevel == 0)  ; If, 롱프레스가 아니면
; 		SendInput, e
; 	else
; 		SendInput, r
; Return

; XButton1:: SendInput, {Alt Down}
; XButton1 Up:: SendInput, {Alt Up}
; ~XButton1 & RButton:: SendInput, {Alt Up}g
; ~XButton1 & WheelUp:: SendInput, {Alt Up}#{Tab}
; ~XButton1 & WheelDown::
; 	SendInput, {Alt Up} 
; 	KeyWait, XButton1
; 	BlockInput, On
; 	SendInput, ^+c
; 	Sleep, 100
; 	SendInput, bb.moveobjects
; 	SendInput, {Enter}
; 	Sleep, 1000
; 	SendInput, {Esc}
; 	BlockInput, Off
; Return

; #IfWinActive
