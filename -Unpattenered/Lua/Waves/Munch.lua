timer = 0
Munch1 = CreateProjectile('Spikes', 100, 100)
Munch1.sprite.xscale=2
Munch1.sprite.yscale=2
Munch2 = CreateProjectile('Spikes', 100, 100)
Munch2.sprite.rotation = 180
Munch2.sprite.xscale=2
Munch2.sprite.yscale=2
Arena.Resize(16, 300)
function Update()
    timer = timer + 1
	Munch1.MoveTo((30 * math.cos((timer) / 7) - 25),(-140 * math.sin((timer+400) / 35) + 0))
	Munch2.MoveTo((30 * math.cos((timer-20) / 7) + 25),(-140 * math.sin((timer+400) / 35) + 0))
    if timer >= 500 then
        EndWave() 
    end
end