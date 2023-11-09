timer = 0
function Update()
	timer = timer + 1
	if timer > 30 then
		EndWave()
	end
end