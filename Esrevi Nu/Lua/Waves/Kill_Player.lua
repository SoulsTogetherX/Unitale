timer = 0

function Update()
    timer = timer + 1

	if timer == 70 then
		Arena.Resize( 16 ,  16 )
	end

	if timer > 78 then
		Player.Hurt(math.huge,0.1)
	end

end