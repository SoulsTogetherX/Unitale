timer = 0
bullets = {}
bullet1 = CreateProjectile("Sword",99999,99999)
bullet1.sprite.rotation = -90
bullet1.SetVar("Type",1)
bullet1.ppcollision = true
bullet1.sprite.color = { 1.00, 0.00, 0.00}
bullet2 = CreateProjectile("Sword",99999,99999)
bullet2.sprite.rotation = -90
bullet2.SetVar("Type",1)
bullet2.ppcollision = true
bullet2.sprite.color = { 1.00, 0.00, 0.00}
bullet3 = CreateProjectile("Sword",99999,99999)
bullet3.sprite.rotation = -90
bullet3.SetVar("Type",1)
bullet3.ppcollision = true
bullet3.sprite.color = { 1.00, 0.00, 0.00}
bullet4 = CreateProjectile("Sword",99999,99999)
bullet4.sprite.rotation = -90
bullet4.SetVar("Type",1)
bullet4.ppcollision = true
bullet4.sprite.color = { 1.00, 0.00, 0.00}
X1 = math.random(-Arena.height/2, Arena.height/2)
X2 = math.random(-Arena.height/2, Arena.height/2)
X3 = math.random(-Arena.height/2, Arena.height/2)
X4 = math.random(-Arena.height/2, Arena.height/2)

function Update()
    timer = timer + 1
	if timer >= 99 then
		bullet1.MoveTo(100*math.tan(timer/50),X1)
	end
	bullet2.MoveTo(100*math.tan((timer+25)/50),X2)
	bullet3.MoveTo(100*math.tan((timer+50)/50),X3)
	bullet4.MoveTo(100*math.tan((timer+75)/50),X4)
	
	if bullet1.x > 320 then
		X1 = math.random(-Arena.height/2, Arena.height/2)
	end
	if bullet2.x > 320 then
		X2 = math.random(-Arena.height/2, Arena.height/2)
	end
	if bullet3.x > 320 then
		X3 = math.random(-Arena.height/2, Arena.height/2)
	end
	if bullet4.x > 320 then
		X4 = math.random(-Arena.height/2, Arena.height/2)
	end
	function OnHit(bullet)
		if bullet.GetVar("Type") == 1 then
    	   	Player.Hurt(99)
		end
	end
    if timer >= 700 then
        EndWave() 
    end
end