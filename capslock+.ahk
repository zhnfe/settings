#Requires AutoHotkey v2.0

^q::!F4

;CAPSLOCK
;上下左右
CapsLock & e::Up
CapsLock & d::Down
CapsLock & s::Left
CapsLock & f::Right
;上下移动
CapsLock & i::!Up
CapsLock & k::!Down
CapsLock & j::!Left
CapsLock & l::!Right

; 编辑
CapsLock & `;::End
CapsLock & p::Home
; 删除一行
CapsLock & BackSpace:: Send "{End}{Shift down}{Home}{Home}{Left}{Shift up}{BackSpace}"
; 左右移动一个单词
CapsLock & u::^Left
CapsLock & o::^Right
+Esc:: Send "``"
;切换桌面
CapsLock & r::#^Right
CapsLock & w::#^Left


;滚轮
!WheelDown::PgDn
!WheelUp::PgUp
MButton & WheelDown::Send "{Ctrl Down}{WheelDown}{Ctrl Up}"
MButton & WheelUp::Send "{Ctrl Down}{WheelUp} {Ctrl Up}"