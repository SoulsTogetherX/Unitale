-- The bouncing bullets attack from the documentation example.
timer = 0
function Update()
    timer = timer + 1
    if timer >= 10 then
        EndWave()
    end
end