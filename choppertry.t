%***********************************************%
%**********Written by Eddie Zhang***************%
%**********
%SetScreen
setscreen ("graphics: 550;400,nobuttonbar")
%Background
drawbox (0, 0, maxx, maxy, red)
drawfill (20, 20, black, red)

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
var asd, ass : int
var distance : real := 0
var font : int := Font.New ("Swiss911 XCm BT:30")

View.Set ("offscreenonly")

var height : int := 5
var counter : int := 1

var pic : int
var spr : array 1 .. 20 of int
var barHeight : array 1 .. 20 of int
var barX : array 1 .. 20 of int

%temp
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%title page
Pic.ScreenLoad ("copter start.bmp", 140, 100, picMerge)
Mouse.Where (asd, ass, button)
if button = 1 then



end if



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%5
%Map
drawline (0, 35, maxx, 35, 72)
drawline (0, 362, maxx, 362, 72)
drawfill (0, 0, 72, 72)
drawfill (0, 365, 72, 72)
%map deltail
%Top
drawline (0, 7, maxx, 7, 16)
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
%bricks
pic := Pic.FileNew ("copter wall.bmp")
%Import Picture
%Sprite
mySprite := Sprite.New (upchopper (1))
mySprite1 := Sprite.New (downchopper (1))
mySprite2 := Sprite.New (choppercrash (1))
mySprite3 := Sprite.New (smoke (1))
%set each sprite to the pic ... replace this with pics of varying height
for i : 1 .. upper (spr)
    spr (i) := Sprite.New (pic)
    %generate random number until you are happy with the result
    loop
	barHeight (i) := (Rand.Int (height - 2, height + 2)) * 10
	exit when barHeight (i) > 0 and barHeight (i) < 200
    end loop

    barX (i) := (i - 1) * 23
    height := barHeight (i) div 10
end for


%Initial drawing of sprites to screen
for i : 1 .. upper (spr)
    Sprite.SetPosition (spr (i), (barX (i)), barHeight (i), false)
    Sprite.Show (spr (i))
end for

%up/down

%scene
loop
    %loop to control animation, 45 movements = 1 iteration
    Draw.Text (" " + realstr (distance, 0), 0, 0, font, black)
    distance += 1
    
    for j : 1 .. 23
	%go through each item in the array and move it's X value to the left
	for i : 1 .. upper (spr)
	    Sprite.SetPosition (spr (i), barX (i), barHeight (i), false)
	    delay (1)
	    %decrement barX
	    barX (i) := barX (i) - 1
	end for
    end for
    loop
	barHeight (20) := (Rand.Int (height - 2, height + 2)) * 10
	exit when barHeight (20) > 0 and barHeight (18) < 200
    end loop
    height := barHeight (20) div 10
    barX (20) := 425
    Sprite.SetPosition (spr (20), barX (20), barHeight (20), false)

    for i : 1 .. upper (spr) - 1
	barX (i) := barX (i + 1)
	barHeight (i) := barHeight (i + 1)
	Sprite.SetPosition (spr (i), barX (i), barHeight (i), false)
    end for




    Mouse.Where (x, y, button)

    %moving up
    if button = 1 then
	cy += 1.4
	Sprite.ChangePic (mySprite, upchopper (cycles))
	Sprite.SetPosition (mySprite, cx, cdy, false)
	Sprite.Show (mySprite)


	position := 1
	%moving down

    elsif button = 0 then
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

    %Collision Detection


    if (whatdotcolour (30, y + 20) not= black) or (whatdotcolour (170, y) not= black) or (whatdotcolour (190, y + 60) not= black) or (whatdotcolour (110, y - 1) not= black)
	    or (whatdotcolour (115, y + 72) not= black) or (whatdotcolour (40, y + 60) not= black) then
	for b : 1 .. 14
	    Sprite.ChangePic (mySprite, choppercrash (b))
	    Sprite.SetPosition (mySprite, cx, cdy, false)
	    Sprite.Show (mySprite)
	    delay (85)
	end for
	exit
    end if



    delay (7)


    Draw.Text ("You went " + realstr (distance, 2) + " km. Please try again", 200, 200, Font.New ("arial:18"), white)
    delay (2000)

    %         exit
    %     end if
    %
    % if cy + 70 > maxy or cy < 38 then
    %
end loop

%Map






