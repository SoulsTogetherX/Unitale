timer = 0
bullets = {}
SetGlobal("WaveTime",1100)
WaveTim = GetGlobal("WaveTime")
SetGlobal("SOUL",1)
	SetGlobal("width",Arena.width)
	SetGlobal("height",Arena.height)
Arena.Resize(150, 150) 
Arena.MoveTo(320, 90, false, false)
require "Libraries/Remo"
a = 1
A = 1
function Update()
	timer = timer + 1
	if timer < 1049 then
		if timer == 50 then
			Right = CreateSprite("Pixel","BelowBullet")
			Right.color = {1.00, 0.00, 0.00}
			Right.alpha = 0
			Left = CreateSprite("Pixel","BelowBullet")
			Left.color = {1.00, 0.00, 0.00}
			Left.alpha = 0
			Up = CreateSprite("Pixel","BelowBullet")
			Up.color = {1.00, 0.00, 0.00}
			Up.alpha = 0
			Down = CreateSprite("Pixel","BelowBullet")
			Down.color = {1.00, 0.00, 0.00}
			Down.alpha = 0
		end
		if timer > 50 then
			if Right.alpha < 1 then
				Right.alpha = Right.alpha + 0.01
			end
			if Left.alpha < 1 then
				Left.alpha = Left.alpha + 0.01
			end
			if Up.alpha < 1 then
				Up.alpha = Up.alpha + 0.01
			end
			if Down.alpha < 1 then
				Down.alpha = Down.alpha + 0.01
			end
			Right.Scale(5,Arena.height)
			Right.MoveTo(Arena.width/2 + Arena.currentx,Arena.currenty + Arena.height/2)
			Left.Scale(5,Arena.height)
			Left.MoveTo(-Arena.width/2 + Arena.currentx,Arena.currenty + Arena.height/2)
			Up.Scale(Arena.width,5)
			Up.MoveTo(Arena.currentx,Arena.height + Arena.currenty)
			Down.Scale(Arena.width,5)
			Down.MoveTo(Arena.currentx,Arena.currenty)
			if Right.alpha >= 0.7 then
				if Player.x == Arena.width/2 - 8 then
					Player.Hurt(GetGlobal("BaseDam"))
				elseif Player.x == -Arena.width/2 + 8 then
					Player.Hurt(GetGlobal("BaseDam"))
				elseif Player.y == Arena.height/2 - 8 then
					Player.Hurt(GetGlobal("BaseDam"))
				elseif Player.y == -Arena.height/2 + 8 then
					Player.Hurt(GetGlobal("BaseDam"))
				end
			end
			if timer == 90 then
				Warn = CreateSprite('WarningRed',"BelowBullet")
				Warn.MoveTo(Arena.currentx,Arena.currenty + Arena.height/2)
				Warn.Scale(2,2)
			end
			if timer > 90 then
				if timer%100 == 0 then
					A = A * (-1)
				end
				if A == 1 then
					Warn.alpha = 1
					Arena.Resize(150, 150) 
					Arena.MoveTo(320, 90, false, false)
					if timer%8 == 0 then
						a = a * -1
					end
					if a == 1 then
						Warn.Set("WarningRed")
					elseif a == -1 then
						Warn.Set("WarningYellow")
					end
					if (timer - 50)%100 == 0 then
						Warn.remove()
						Randomx = math.random(-75 + 9,75 - 9) + 320
						Randomy = math.random(-75 + 9,75 - 9) + 160
						Warn = CreateSprite('WarningRed',"BelowBullet")
						Warn.MoveTo(Randomx, Randomy)
						Warn.Scale(2,2)
						Audio.PlaySound("alarm")
					end
				else
					Warn.alpha = 0
					remo()
					if (timer - 25)%100 == 0 then
						Arena.Resize(55, 55) 
					end
					Arena.MoveTo(Warn.absx, Warn.absy - 30, false, false)
				end
			end
		end
	end
	if timer == 1049 then
		Warn.remove()
		Right.remove()
		Up.remove()
		Left.remove()
		Down.remove()
	end
	function OnHit(bullet)
		if bullet.GetVar("Type") == 1 and Player.hp > GetGlobal("BaseDam") then
			Player.Hurt(GetGlobal("BaseDam") + 15,0.6)
		elseif GetGlobal("REVIVE") > 0 and Player.ishurting == false then
			Player.Hurt(Player.hp - 1)
			SetGlobal("CUTSCENE",true)
			SetGlobal("REVIVE", GetGlobal("REVIVE") - 1)
		elseif Player.ishurting == false then
			Player.Hurt(Player.hp)
		end
	end
end
