function remo()
	if Arena.width/2 < Player.x then
		Player.MoveTo(Arena.width/2 - 8, Player.y)
	elseif -Arena.width/2 > Player.x then
		Player.MoveTo(Arena.width/2 + 8, Player.y)
	elseif Arena.height/2 < Player.y then
		Player.MoveTo(Player.x, Arena.height/2 - 8)
	elseif -Arena.height/2 > Player.x then
		Player.MoveTo(Player.x, Arena.height/2 + 8)
	end
end