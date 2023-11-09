timer = 0
bullets = {}
Knife = CreateProjectile('Knife_right',(80 * math.cos((16) / 15)),(-80 * math.sin((18) / 14) + 200))
Knife.sprite.alpha = 0
Knife.sprite.rotation = -90
function Update()
     timer = timer + 1
	 Knife.sprite.alpha = timer/30
	 if timer == 35 then
		 Audio.PlaySound("slice")
	 elseif timer == 85 then
	 	 Audio.PlaySound("000029a2")
	 end
	 if timer < 50 and timer > 30 then
	     Knife.sprite.rotation = -90 - (timer-30)
		 Knife.MoveTo((80 * math.cos((timer-16) / 15)),(-80 * math.sin((timer-18) / 14) + 200))
	     local bullet = CreateProjectile('bulletB',(100 * math.cos((timer-16) / 15)),(-100 * math.sin((timer-18) / 14) + 200))
		 bullet.sprite.color = { 1.00, 0.00, 0.00 }
         table.insert(bullets, bullet)
	 elseif timer > 80 then
	     Knife.sprite.alpha = 1 - ((timer-80)/30)
	     for i=1,#bullets do
            local bullet = bullets[i]
		    bullet.MoveTo(bullet.x,bullet.y-6)
	     end
	 end
	 function OnHit(bullet)
		Player.Hurt(6)
	 end
     if timer >= 200 then
         EndWave() 
     end
end
