timer = 0
bullets = {}
SetGlobal("WaveTime",611)
Player.SetControlOverride(true)
SetGlobal("SOUL",0)
	SetGlobal("width",Arena.width)
	SetGlobal("height",Arena.height)
WaveTim = GetGlobal("WaveTime")
function Update()
	if WaveTim <= 2 then
		Player.Move(1,1)
	else
		Player.MoveTo(0,0)
	end
end

--				 _				 _
--				| |				| |
--				| |				| |
--				| |				| |
--				| | 			| |
--				| |				| |
--				|_|				|_|
--				 
--			__						  __
--			\ \						 / /
--			 \ \					/ /
--			  \ \__________________/ /
--			   \____________________/
--
--
--
--
--
--
--
--Yes, I spent a while on it...