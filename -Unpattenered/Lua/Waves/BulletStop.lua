-- The chasing attack from the documentation example.
timer = 0
Circle = 0
bullets = {}
Arena.Resize(100, 100)

function Update()
    Circle = math.random()*360
	timer = timer + 1
	if (timer+10)%50 == 0 then
	    local bullet = CreateProjectile('bulletC',(160 * math.cos(Circle)),(-100 * math.sin(Circle)))
		bullet.SetVar('TargetX', Player.x)
		bullet.SetVar('TargetY', Player.y)
		table.insert(bullets, bullet)
	end
	for i=1,#bullets do
	    local bullet = bullets[i]
		local TargetX = bullet.GetVar('TargetX')
        local xdifference = TargetX - bullet.x
		local TargetY = bullet.GetVar('TargetY')
        local ydifference = TargetY - bullet.y
        bullet.Move((xdifference/math.abs(xdifference)),(ydifference/math.abs(ydifference)))
	end
    if timer >= 900 then
        EndWave() 
    end
end
function OnHit(bullet)
    if bullet.isactive then
        Player.Hurt(3)
	end
end
