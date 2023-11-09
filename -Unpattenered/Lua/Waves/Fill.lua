timer = 0

function Update()
    timer = timer + 1
	if timer < 180 then
        CreateProjectile('pixel',(50 * math.cos((timer) / 25)),(-50 * math.sin((timer) / 25) + 0))
	end
	if timer == 180 then
        bullet = CreateProjectile('Circle',0,0)
		Audio.PlaySound("000029f8")
		bullet.ppcollision = true
	end
    if timer >= 240 then
        EndWave()
    end
end
