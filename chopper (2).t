%***********************************************%
%**********Written by Eddie Zhang***************%
%**********
%SetScreen
setscreen ("graphics: 550;400,nobuttonbar")
%Background
drawbox (0, 0, maxx, maxy, red)
drawfill (20, 20, black, red)
%Import Picture
var chopper2 := Pic.FileNew ("chopper2.jpg")
var chopper := Pic.FileNew ("chopper.JPG")

var cy : real := 185
var x, y, button, cx, cdy : int := 150
loop
    Mouse.Where (x, y, button)
    if button = 1 then
	cy += 1.35
    else
	cy -= 1.7
    end if
    cdy := round (cy)
    if cy + 40 > maxy or cy < 5 then
	Pic.Draw (chopper2, cx, cdy, picCopy)
	exit
    else
	Pic.Draw (chopper, cx, cdy, picCopy)
    end if
    delay (5)
end loop
