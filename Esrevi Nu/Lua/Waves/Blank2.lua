timer = 0
function Update()
	SetGlobal("Blank2",2)
    timer = timer + 1
	if timer > 100 then
        EndWave()
    end
end