spawntimer = 0
bullets = {}
Winds = {}
WAVETIMER = 0
Type = 0
Timer = 0
Size = 0
T = 0
Rotaion = 0
function Update()
    WAVETIMER = (WAVETIMER + 1)
	spawntimer = WAVETIMER
	DEBUG("spawntimer"..spawntimer)
	Player.MoveTo((Player.x - 1.5), Player.y, false)
    if (spawntimer+10)%20 == 0 then
        local posx = 300
        local posy = 50
        local bullet = CreateProjectile('bulletB', posx, posy)
		bullet.SetVar('velx', 0)
        bullet.SetVar('vely', 70 - 130*math.random())
        bullet.SetVar('Rotation', math.random()*360)
		bullet.sprite.rotation = bullet.GetVar('Rotation')
		local Size = math.abs(math.random())
		if Size < 0.2 then
			Size = math.abs(math.random())
		end
		bullet.sprite.xscale = Size
		bullet.sprite.yscale = Size
		bullet.SetVar("Type", 0)
        table.insert(bullets, bullet)
    end
    for i=1,#bullets do
        local bullet = bullets[i]
        local vely = bullet.GetVar('vely')
        local newposx = bullet.x - 6
        bullet.MoveTo(newposx, vely)
    end
    function OnHit(bullet)
        if bullet.isactive then
		    if bullet.GetVar("Type") == 0 then
			    Player.Hurt(3)
			end
        end
    end
	if (spawntimer)%20 == 0 then
        local posx = (math.sin(math.random()*360))*200
        local posy = (math.sin(math.random()*360))*200
        local wind = CreateProjectile('Wind00', posx, posy)
		wind.sprite.SetAnimation({"Wind00", "Wind01", "Wind02", "Wind03", "Wind04", "Wind05", "Wind06", "Wind07", "Wind08", "Wind09",})
	    wind.SetVar("Type", -1)
		wind.SetVar("Timer", 0)
		table.insert(Winds, wind)
    end
	for i=1,#Winds do
        local wind = Winds[i]
		if wind.isactive == true then
		    local Timer = wind.GetVar("Timer")
		    wind.SetVar("Timer", (Timer + 1))
			if Timer >= 20 then
			    wind.Remove()
			end
		end
    end
	if WAVETIMER >= 420 then -- 420 is how many frames the wave will last
	  EndWave()
	end
end
