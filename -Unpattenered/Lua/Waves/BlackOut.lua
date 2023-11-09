-- The chasing attack from the documentation example.
timer = 0
spawntimer = 0
Timer2 = 0
T = 1
Circle = 0
BlackOut = CreateProjectile('bulletB', 0,0)
BlackOut.sprite.yscale = 100
BlackOut.sprite.xscale = 100
BlackOut.sprite.alpha = 0
BlackOut.SetVar('Type', -1)
BlackOut.sprite.color = {0.00,0.00,0.00}
bullets = {}

function Update()
    Circle = math.random()*360
    timer = timer + 1
	spawntimer = spawntimer + 1
	BlackOut.sprite.SendToTop()
	BlackOut.sprite.alpha = (timer/100)
	if BlackOut.sprite.alpha == 1 then
	    Timer2 = Timer2 + 1
		if Timer2 == 60 then
	        BlackOut.sprite.alpha = 0
		    T = T + 1
			timer = 0
			Timer2 = 0
			
		end
	end
	if (spawntimer+10)%50 == 0 then
	    local bullet = CreateProjectile('bulletA',(100 * math.cos(Circle)),(-100 * math.sin(Circle)))
		bullet.SetVar('TargetX', Player.x)
		bullet.SetVar('TargetY', Player.y)
		bullet.SetVar('BX', bullet.x)
		bullet.SetVar('BY', bullet.y)
		bullet.SetVar('Type', 0)
		table.insert(bullets, bullet)
	end
	for i=1,#bullets do
	    local bullet = bullets[i]
		BX = bullet.GetVar('BX')
		BY = bullet.GetVar('BY')
		local TargetX = bullet.GetVar('TargetX')
        local xdifference = TargetX - BX
		local TargetY = bullet.GetVar('TargetY')
        local ydifference = TargetY - BY
        bullet.Move(((xdifference/math.abs(xdifference))),((ydifference/math.abs(ydifference))))
	end
    if spawntimer >= 549 then
        EndWave() 
    end
end
function OnHit(bullet)
    if bullet.isactive then
        local bullet = bullet
		if bullet.GetVar("Type") == 0 then
    	   Player.Hurt(3)
		end
	end
end
