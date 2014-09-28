setscreen ("graphics:415,450")
View.Set ("offscreenonly")

var height : int := 5
var counter : int := 1

var pic : int
var spr : array 1 .. 11 of int
var barHeight : array 1 .. 11 of int
var barX : array 1 .. 11 of int

%temp
var asdf : string

pic := Pic.FileNew ("copter wall.bmp")

%set each sprite to the pic ... replace this with pics of varying height
for i : 1 .. upper (spr)
    spr (i) := Sprite.New (pic)
    %generate random number until you are happy with the result
    loop
	barHeight (i) := (Rand.Int (height - 2, height + 2)) * 10
	exit when barHeight (i) > 0 and barHeight (i) < 200
    end loop
    %put "i: ", i, " barHeight(i): ", barHeight (i)
    barX (i) := (i - 1) * 45
    height := barHeight (i) div 10

end for

%Initial drawing of sprites to screen
for i : 1 .. upper (spr)
    Sprite.SetPosition (spr (i), (barX (i)), barHeight (i), false)
    Sprite.Show (spr (i))
end for



loop
    %loop to control animation, 45 movements = 1 iteration
    for j : 1 .. 45
	%go through each item in the array and move it's X value to the left
	for i : 1 .. upper (spr)
	    Sprite.SetPosition (spr (i), barX (i), barHeight (i), false)
	    delay (1)
	    %decrement barX
	    barX (i) := barX (i) - 1
	end for
	View.Update
    end for
    %put "ended first loop"
    % for i : 1..10
    %     put barX(i), " "
    % end for
    %get asdf
    loop
	barHeight (11) := (Rand.Int (height - 2, height + 2)) * 10
	exit when barHeight (11) > 5 and barHeight (11) < 200
    end loop
    height := barHeight (11) div 10
    barX (11) := 415
    Sprite.SetPosition (spr (11), barX (11), barHeight (11), false)

    for i : 1 .. upper (spr) - 1
	barX (i) := barX (i + 1)
	barHeight (i) := barHeight (i + 1)
	Sprite.SetPosition (spr (i), barX (i), barHeight (i), false)
    end for


end loop
