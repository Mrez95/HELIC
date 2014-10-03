%***********************************************%
%**********Written by Eddie Zhang***************%
%**********
%SetScreen
setscreen ("graphics: 550;400,nobuttonbar")
%Background
drawbox (0, 0, maxx, maxy, red)
drawfill (20, 20, black, red)

%%%%%%%%%%%%%%%%%%%%%%%%%
process z
    setscreen ("nocursor")
    var x, y, button : int
    loop
	Mouse.Where (x, y, button)
	%locate (1, 1)
	%put x : 4, y : 4
    end loop
end z
fork z
%%%%%%%%%%%%%%%%%%%%%%%%






% The "array" program.
var smoke : array 1 .. 1 of int
var downchopper : array 1 .. 4 of int
var upchopper : array 1 .. 4 of int
var choppercrash : array 1 .. 14 of int
var mySprite, mySprite1, mySprite2, mySprite3 : int
var cycles, cycles1, cycles2 : int := 1
var position : int := 1
var picID : int
var cy : real := 185
var x, y, button, cx, cdy : int := 155

var testDot : int

%Wall
var wall : int := Pic.FileNew ("copterwall.bmp")
var wallS : int := Sprite.New (wall)

% random walls
var randi : int := 0

var hold : int := 0
%X of the wall

var wallX : int := 400

% var bottom : int := 45
% var top : int := 350

%Map
drawline (0, 35, maxx, 35, 72)
drawline (0, 362, maxx, 362, 72)
drawfill (0, 0, 72, 72)
drawfill (0, 365, 72, 72)
%map deltail
%Top
drawline (0, 7, maxx, 7, 116)
drawline (0, 14, maxx, 14, 116)
drawline (0, 21, maxx, 21, 116)
drawline (0, 28, maxx, 28, 116)
drawline (0, 35, maxx, 35, 116)
%Botton
drawline (0, 393, maxx, 393, 116)
drawline (0, 386, maxx, 386, 116)
drawline (0, 379, maxx, 379, 116)
drawline (0, 372, maxx, 372, 116)
drawline (0, 365, maxx, 365, 116)
%chopper

for a : 1 .. 1
    smoke (a) := Pic.FileNew ("smoke.bmp")
end for
for i : 1 .. 4
    downchopper (i) := Pic.FileNew ("downchoppernew" + intstr (i) + ".bmp")
    upchopper (i) := Pic.FileNew ("upchoppernew" + intstr (i) + ".bmp")
end for
%CRASH!
for m : 1 .. 14
    choppercrash (m) := Pic.FileNew ("choppercrashnew" + intstr (m) + ".bmp")
end for

%Import Picture
%Sprite
mySprite := Sprite.New (upchopper (1))
mySprite1 := Sprite.New (downchopper (1))
mySprite2 := Sprite.New (choppercrash (1))
mySprite3 := Sprite.New (smoke (1))

%up/down

loop
    Sprite.SetHeight(mySprite,0)
    if wallX > 0 then
	wallX := wallX - 2
    elsif wallX <= 0 then
	wallX := 550
	hold := 0
    end if

    Mouse.Where (x, y, button)

    if hold = 0 then
	randint (randi, 35, 290)
	hold := 1
    end if

    Sprite.SetPosition (wallS, wallX, randi, false)
    Sprite.Show (wallS)

    %moving up
    if button = 1 then
	cy += 1.4
	Sprite.ChangePic (mySprite, upchopper (cycles))
	Sprite.SetPosition (mySprite, cx, cdy, false)
	Sprite.Show (mySprite)
	

	position := 1
	%moving down
    else
	cy -= 2

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

    %%%%%%%%%%%%

    Sprite.ChangePic (mySprite3, smoke (cycles2))
    Sprite.SetPosition (mySprite3, cx - 10, cdy + 10, false)
    Sprite.Show (mySprite3)
testDot := whatdotcolor (235, y)
    %Collision Detection
    locate (2, 30)
    put "cdy:", cdy, "what:", whatdotcolour (222, cdy)..
    if whatdotcolour (cx + 80, cdy) not= 7 or (whatdotcolour (222, cdy + 32) not= 7) or  cy + 70 > maxy or cy < 38 then

	


	for b : 1 .. 14
	    Sprite.ChangePic (mySprite, choppercrash (b))
	    Sprite.SetPosition (mySprite, cx, cdy, false)
	    Sprite.Show (mySprite)
	    delay (85)
	end for
	%put testDot
	exit

    end if
    delay (7)

end loop


%Map





