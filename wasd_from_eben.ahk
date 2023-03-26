;sometimes this script from eben dont work in some computers (like mine) if not in admin mode, so now it'll run as admin mode automatically
if not A_IsAdmin
	Run *RunAs "%A_ScriptFullPath%"
;this is original eben script
#SingleInstance Force
#UseHook
#IfWinActive GTA: San Andreas
w::f5
s::f6
a::f7
d::f8
LButton::f11
#MaxHotkeysPerInterval 10000000