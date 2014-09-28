setscreen ("graphics:450,450")

var height : int := 5
var counter : int := 1

var pic : int
var spr : array 1 .. 10 of int
var barHeight : array 1 .. 10 of int
var barX : array 1 .. 10 of int

%temp
var asdf : string

pic := Pic.FileNew ("copter wall.bmp")

%set each sprite to the pic ... replace this with pics of varying height
for i : 1 .. upper (spr)
    spr (i) := Sprite.New (pic)
    loop
	barHeight (i) := (Rand.Int (height - 2, height + 2)) * 10
	exit when barHeight (i) > 0 and barHeight (i) < 600
    end loop
    put "i: ", i, " barHeight(i): ", barHeight (i)
    barX (i) := (i - 1) * 45
    height := barHeight (i) div 10

end for

for i : 1 .. upper (spr)
    Sprite.SetPosition (spr (i), (barX (i)), barHeight (i), false)
    Sprite.Show (spr (i))
end for



loop
    for j : 1 .. 45
	for i : 1 .. upper (spr)
	    Sprite.SetPosition (spr (i), barX (i), barHeight (i), false)
	    delay (1)
	    barX(i) := barX(i) - 1
	end for       
    end for
    put "ended first loop"
    % for i : 1..10
    %     put barX(i), " "
    % end for
    %get asdf
    
    barHeight(10) := (Rand.Int (height - 2, height + 2)) * 10
    height := barHeight (10) div 10
    barX(10) := 370
    Sprite.SetPosition (spr (10), barX (10), barHeight (10), false)
    
    for i : 1.. upper(spr) - 1
	 barX(i) := barX(i + 1)
	 barHeight (i) := barHeight (i + 1)
	 Sprite.SetPosition (spr (i), barX (i), barHeight (i), false)
    end for
    

end loop
