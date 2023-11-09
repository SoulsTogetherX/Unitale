L = CreateProjectile('Thing', 1000, 1000)
R = CreateProjectile('Thing', 1000, 1000)
U = CreateProjectile('Knife_left', 1000, 1000)
D = CreateProjectile('Knife_left', 1000, 1000)
timer = 0
Sprite = 1
W = 1
bullets = {}
function Update()
     timer = timer + 1
     if timer >= 400 then
         EndWave() 
     end
	 if (timer)%50 == 0 then
	    Sprite = Sprite*(-1)
	 end
     if Sprite == 1 then
        L.Remove()
		R.Remove()
		U.Remove()
		D.Remove()
        L = CreateProjectile('Thing', (14 * math.sin((timer+0) / 18) - (300-(timer*1))),(-14 / math.cos((timer+0) / 18) + 0))
		R = CreateProjectile('Thing', (14 * math.sin((timer+0) / 18) + (300-(timer*1))),(-14 / math.cos((timer+0) / 18) + 0))
		U = CreateProjectile('Knife_left', (14 / math.sin((timer+0) / 18) - (300-(timer*1))),(-14 / math.cos((timer+0) / 18) + 0))
		D = CreateProjectile('Knife_left', (14 / math.sin((timer+0) / 18) + (300-(timer*1))),(-14 / math.cos((timer+0) / 18) + 0))
     elseif Sprite == -1 then
        L.Remove()
		R.Remove()
		U.Remove()
		D.Remove()
        L = CreateProjectile('Thing', (14 * math.sin((timer+0) / 18) - (300-(timer*1))),(-14 / math.cos((timer+0) / 18) + 0))
		R = CreateProjectile('Thing', (14 * math.sin((timer+0) / 18) + (300-(timer*1))),(-14 / math.cos((timer+0) / 18) + 0))
		U = CreateProjectile('Knife_right', (14 / math.sin((timer+0) / 18) - (300-(timer*1))),(-14 / math.cos((timer+0) / 18) + 0))
		D = CreateProjectile('Knife_right', (14 / math.sin((timer+0) / 18) + (300-(timer*1))),(-14 / math.cos((timer+0) / 18) + 0))
     end
end