FuncStart = false

function FPS()
	function EnteringState(newstate, oldstate)
		if newstate == "DEFENDING" then
			FuncStart = false
		elseif newstate != "ENEMYDIALOGUE" and oldstate == "ENEMYDIALOGUE" then
			FuncStart = true
		end
	end
	
	if FuncStart == true then
		Player.SetControlOverride(true)
		if Input.Up > 0 then
			Player.MoveTo(Player.x,Player.y + (2*Time.mult),false)
		end
		if Input.Down > 0 then
			Player.MoveTo(Player.x,Player.y + (-2*Time.mult),false)
		end
		if Input.Right > 0 then
			Player.MoveTo(Player.x + (2*Time.mult),Player.y,false)
		end
		if Input.Left > 0 then
			Player.MoveTo(Player.x + (-2*Time.mult),Player.y,false)
		end
	else
		Player.SetControlOverride(false)
	end
end
function Reset()
	FuncStart = false
	Player.SetControlOverride(false)
end