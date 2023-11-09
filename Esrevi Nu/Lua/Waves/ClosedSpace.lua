timer = 0
Tim = 0
bullets = {}
Arena.ResizeImmediate(155, 155)
Player.MoveTo(0,0,false)
Up = CreateProjectile("Pixel",0,Arena.height/2+1)
Up.sprite.xscale = Arena.width

Left = CreateProjectile("Pixel",-Arena.width/2-1,0)
Left.sprite.yscale = Arena.height

Down = CreateProjectile("Pixel",0,-Arena.height/2-1)
Down.sprite.xscale = Arena.width

Right = CreateProjectile("Pixel",Arena.width/2+1,0)
Right.sprite.yscale = Arena.height

T = 0

function Update()
	timer = timer + 1
	if timer == 50 then
		T = 1
	end
	if T == 1 then
		if Up.sprite.yscale < 57.5 then
			Up.sprite.yscale = Up.sprite.yscale + 5
			Up.MoveTo(Up.x,(Arena.height/2+1)+(-Up.sprite.yscale/2))
		end
		if Down.sprite.yscale < 57.5 then
			Down.sprite.yscale = Down.sprite.yscale + 5
			Down.MoveTo(Down.x,(-Arena.height/2-1)+(Down.sprite.yscale/2))
		end
		if Right.sprite.xscale < 57.5 then
			Right.sprite.xscale = Right.sprite.xscale + 5
			Right.MoveTo((-Arena.width/2-1)+(Right.sprite.xscale/2),Right.y)
		end
		if Left.sprite.xscale < 57.5 then
			Left.sprite.xscale = Left.sprite.xscale + 5
			Left.MoveTo((Arena.width/2+1)+(-Left.sprite.xscale/2),Left.y)
		end
		if Up.sprite.yscale >= 57.5 and Down.sprite.yscale >= 57.5 and Right.sprite.xscale >= 57.5 and Left.sprite.xscale >= 57.5 then
			T = 2
			Ax1 = math.abs(math.random(0,105))
			Ax2	= (155 - Ax1)-40
			Ay1 = math.abs(math.random(0,105))
			Ay2 = (155 - Ay1)-40
			Tim = timer
		end
	elseif T == 2 then 
		if timer >= Tim + 60 then
			if timer%50 == 0 then
				Ax1 = math.abs(math.random(0,105))
				Ax2	= (155 - Ax1)-40
				Ay1 = math.abs(math.random(0,105))
				Ay2 = (155 - Ay1)-40
			end
			if Up.sprite.yscale < Ay1 then
				Up.sprite.yscale = Up.sprite.yscale + 0.4
				Up.MoveTo(Up.x,(Arena.height/2+1)+(-Up.sprite.yscale/2))
			elseif Up.sprite.yscale > Ay1 then
				Up.sprite.yscale = Up.sprite.yscale - 0.4
				Up.MoveTo(Up.x,(Arena.height/2+1)+(-Up.sprite.yscale/2))
			end
			if Down.sprite.yscale < Ay2 then
				Down.sprite.yscale = Down.sprite.yscale + 0.4
				Down.MoveTo(Down.x,(-Arena.height/2-1)+(Down.sprite.yscale/2))
			elseif Down.sprite.yscale > Ay2 then
				Down.sprite.yscale = Down.sprite.yscale - 0.4
				Down.MoveTo(Down.x,(-Arena.height/2-1)+(Down.sprite.yscale/2))
			end
			if Right.sprite.xscale < Ax1 then
				Right.sprite.xscale = Right.sprite.xscale + 0.4
				Right.MoveTo((-Arena.width/2-1)+(Right.sprite.xscale/2),Right.y)
			elseif Right.sprite.xscale > Ax1 then
				Right.sprite.xscale = Right.sprite.xscale - 0.4
				Right.MoveTo((-Arena.width/2-1)+(Right.sprite.xscale/2),Right.y)
			end
			if Left.sprite.xscale < Ax2 then
				Left.sprite.xscale = Left.sprite.xscale + 0.4
				Left.MoveTo((Arena.width/2+1)+(-Left.sprite.xscale/2),Left.y)
			elseif Left.sprite.xscale > Ax2 then
				Left.sprite.xscale = Left.sprite.xscale - 0.4
				Left.MoveTo((Arena.width/2+1)+(-Left.sprite.xscale/2),Left.y)
			end
		end
	end
	function OnHit(bullet)
		Player.Hurt(9,0.5)
	end
    if timer >= 750 then
        EndWave()
    end
end