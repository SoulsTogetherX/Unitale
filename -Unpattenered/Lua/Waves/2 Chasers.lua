-- The chasing attack from the documentation example.
chasingbullet1 = CreateProjectile('bulletB', Arena.width/2, Arena.height/2)
chasingbullet2 = CreateProjectile('bulletB', -Arena.width/2, -Arena.height/2)
bullets = {chasingbullet1, chasingbullet2}
timer = 0

for i=1,#bullets do
    local bullet = bullets[i]
    bullet.SetVar('xspeed', 0)
    bullet.SetVar('yspeed', 0)
end

function Update()
     timer = timer + 1
    for i=1,#bullets do
	    local bullet = bullets[i]
        local xdifference = Player.x - bullet.x
	    local xVspeed = (xdifference / math.abs(xdifference))*3
        local ydifference = Player.y - bullet.y
	    local yVspeed = (ydifference / math.abs(ydifference))*6
        local xspeed = bullet.GetVar('xspeed') / 2 + xVspeed / 10
        local yspeed = bullet.GetVar('yspeed') / 2 + yVspeed / 10
        bullet.Move(xspeed, yspeed)
        bullet.SetVar('xspeed', xspeed)
        bullet.SetVar('yspeed', yspeed)
	end
    if timer >= 300 then
        EndWave() 
    end
end