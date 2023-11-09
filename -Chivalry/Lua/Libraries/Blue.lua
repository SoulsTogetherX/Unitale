blue = {}

blue.isBlue = false
blue.inAir = false
blue.sprite = nil
blue.velY = 0
blue.newX = Player.x
blue.newY = Player.y
blue.canDraw = true
blue.inSelection = false
blue.inAct = false
blue.mask = nil


function blue.SetSprite(sprite)
end

function blue.TurnBlue(boolean)
	if boolean == false then
		blue.isBlue = false
		Player.sprite.color32 = {255, 0, 0}
		Player.SetControlOverride(false)
	else
		blue.isBlue = true
		Player.sprite.color32 = {0, 60, 255}
		Player.SetControlOverride(true)
	end
end

function blue.WaveStart()
	if blue.isBlue then
		Player.SetControlOverride(true)
		blue.inAir = true
		blue.velY = 0
		blue.newX = Player.x
		blue.newY = Player.y
	end
end

function blue.HandleMovement()
	if blue.isBlue then
		if Input.Up > 0 and blue.velY == 0 and blue.inAir == false then
			blue.velY = 3/Time.mult
			blue.inAir = true
		end
		
		if blue.velY/Time.mult > 1/Time.mult and Input.Up < 0 then
				blue.velY = 1/Time.mult
		end
		
		if blue.inAir then
			if blue.newY < -Arena.height/2 + 8 then
				blue.velY = 0
				blue.newY = -Arena.height/2 + 8
				blue.inAir = false
			elseif blue.velY/Time.mult >= 2/Time.mult then
				blue.velY = blue.velY - 0.05/Time.mult^2
				blue.newY = Player.y + blue.velY
			elseif 2/Time.mult > blue.velY/Time.mult and blue.velY/Time.mult >= 0.5/Time.mult then
				blue.velY = blue.velY - 0.125/Time.mult^2
				blue.newY = Player.y + blue.velY
			elseif 0.5/Time.mult > blue.velY/Time.mult and blue.velY/Time.mult >= -0.25/Time.mult then
				blue.velY = blue.velY - 0.05/Time.mult^2
				blue.newY = Player.y + blue.velY
			elseif -0.25/Time.mult > blue.velY/Time.mult and blue.velY/Time.mult > -4.25/Time.mult then
				blue.velY = blue.velY - 0.15/Time.mult^2
				blue.newY = Player.y + blue.velY
			elseif -4/Time.mult >= blue.velY/Time.mult then
				blue.velY = 0
				blue.newY = -Arena.height/2 + 8
				blue.inAir = false
			end
		end
		
		if Input.Left > 0 then
			if Input.Cancel > 0 then
				blue.newX = Player.x - 1
			else
				blue.newX = Player.x - 2
			end
		end
		
		if Input.Right > 0 then
			if Input.Cancel > 0 then
				blue.newX = Player.x + 1
			else
				blue.newX = Player.x + 2
			end
		end
	end
	
	Player.MoveTo(blue.newX, blue.newY, false)
end

function blue.HandleMenu()
	if Input.Confirm == 1 and blue.inSelection then
		blue.inSelection = false
		blue.inAct = false
		blue.canDraw = false
		if blue.mask ~= nil then
			blue.mask.Remove()
		end
	end
	
	if Input.Confirm == 1 and blue.inSelection == false and (Player.absx == 48 or Player.absx == 361 or Player.absx == 515) and Player.absy == 25 then
		blue.inSelection = true
	end
	
	if Input.Confirm == 1 and blue.inAct then
		blue.inSelection = true
	end
	
	if Input.Confirm == 1 and blue.inAct == false and Player.absx == 202 and Player.absy == 25 then
		blue.inAct = true
	end
end

function blue.Draw()
end

return blue