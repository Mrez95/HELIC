%***********************************************%
%**********Written by Eddie Zhang***************%
%**********
%SetScreen
setscreen ("graphics: 550;400,nobuttonbar")
%Background
drawbox (0, 0, maxx, maxy, red)
drawfill (20, 20, black, red)

% The "array" program.
var downchopper : array 1 .. 4 of int
var upchopper : array 1 .. 4 of int
var choppercrash : array 1 .. 11 of int
var mySprite, mySprite1, mySprite2 : int
var cycles, cycles1, cycles2, cycles3, cycles4 : int := 1
var position : int := 1
var picID : int
var cy : real := 185
var x, y, button, cx, cdy : int := 150


%chopper
for i : 1 .. 4
    downchopper (i) := Pic.FileNew ("downchopper" + intstr (i) + ".bmp")
    upchopper (i) := Pic.FileNew ("upchopper" + intstr (i) + ".bmp")
end for
%CRASH!
for m : 1 .. 11
    choppercrash (m) := Pic.FileNew ("choppercrash" + intstr (m) + ".bmp")
end for

%Import Picture
%Sprite
mySprite := Sprite.New (upchopper (1))
mySprite1 := Sprite.New (downchopper (1))
mySprite2 := Sprite.New (choppercrash (1))

%up/down

loop
    Mouse.Where (x, y, button)

    %moving up
    if button = 1 then
	cy += 1.35
	Sprite.ChangePic (mySprite, upchopper (cycles))
	Sprite.SetPosition (mySprite, cx, cdy, false)
	Sprite.Show (mySprite)


	position := 1
	%moving down
    else
	cy -= 1.7

	Sprite.ChangePic (mySprite, downchopper (cycles))
	Sprite.SetPosition (mySprite, cx, cdy, false)
	Sprite.Show (mySprite)

    end if
    cycles := cycles + 1
    if cycles > 4 then
	cycles := 1
	position := 2


    end if
    cdy := round (cy)
    %Collision Detection


    if cy + 40 > maxy or cy < 0 then
	Sprite.ChangePic (mySprite2, choppercrash (cycles1))
	Sprite.SetPosition (mySprite, cx, cdy, false)
	Sprite.Show (mySprite2)

    end if
    cycles1 := cycles1 + 1
    if cycles1 > 11 then
	cycles1 := 1
    end if

    delay (50)
end loop


%Animation




%     Pic.Draw (upchopper, cx, cdy, picCopy)
%     exit
% else
%     Pic.Draw (downchopper, cx, cdy, picCopy)
