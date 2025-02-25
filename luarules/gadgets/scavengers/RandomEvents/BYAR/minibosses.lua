
local function miniboss1(currentFrame)
	if currentFrame > scavconfig.gracePeriod*2 then
		local T2bosses = {"corgol_scav","corparrow_scav","armfboy_scav","armmanni_scav",} --"corsumo_scav",
		local T3bosses = {"armmar_scav","armvang_scav","armraz_scav","corshiva_scav","corkarg_scav","corcat_scav","armlun_scav","corsok_scav","armsptkt4_scav",}
		local T4bosses = {"corkorg_scav", "corjugg_scav", "armbanth_scav","armpwt4_scav","armrattet4_scav","armvadert4_scav","cordemont4_scav","corkarganetht4_scav",}
		local baseNumber = ((spawnmultiplier*0.5)+(teamcount*0.5))*0.5
		for i = 1,1000 do
			local posx = math_random(300,mapsizeX-300)
			local posz = math_random(300,mapsizeZ-300)
			local posy = Spring.GetGroundHeight(posx, posz)
			CanSpawnEvent = posLosCheckNoRadar(posx, posy, posz, 300)
			if CanSpawnEvent then
				CanSpawnEvent = posLandCheck(posx, posy, posz, 300)
			end
			if CanSpawnEvent then
				if TierSpawnChances.T2 == 0 and TierSpawnChances.T3 == 0 and TierSpawnChances.T4 == 0 then
					local unit = T2bosses[math_random(1,#T2bosses)]
					for a = 1,math.ceil(baseNumber*4) do
						Spring.CreateUnit(unit, posx+math_random(-300,300), posy, posz+math_random(-300,300), math_random(0,3),GaiaTeamID)
					end
				elseif TierSpawnChances.T3 == 0 and TierSpawnChances.T4 == 0 then
					local unit = T3bosses[math_random(1,#T3bosses)]
					for a = 1,math.ceil(baseNumber*4) do
						Spring.CreateUnit(unit, posx+math_random(-300,300), posy, posz+math_random(-300,300), math_random(0,3),GaiaTeamID)
					end
				elseif TierSpawnChances.T4 == 0 then
					local unit = T4bosses[math_random(1,#T4bosses)]
					for a = 1,math.ceil(baseNumber*4) do
						Spring.CreateUnit(unit, posx+math_random(-300,300), posy, posz+math_random(-300,300), math_random(0,3),GaiaTeamID)
					end
				else
					local unit = T4bosses[math_random(1,#T4bosses)]
					for a = 1,math.ceil(baseNumber*8) do
						Spring.CreateUnit(unit, posx+math_random(-300,300), posy, posz+math_random(-300,300), math_random(0,3),GaiaTeamID)
					end
				end
				--ScavSendNotification("scav_eventminiboss")
				break
			end
		end
	end
end

local function miniboss2(currentFrame)
	if currentFrame > scavconfig.gracePeriod*2 then
		local T2bosses = {"scavmist_scav","scavmist_scav",}
		local T3bosses = {"scavmist_scav","scavmist_scav",}
		local T4bosses = {"scavmistxl_scav", "scavmistxl_scav",}
		local baseNumber = ((spawnmultiplier*0.5)+(teamcount*0.5))
		for i = 1,1000 do
			local posx = math_random(300,mapsizeX-300)
			local posz = math_random(300,mapsizeZ-300)
			local posy = Spring.GetGroundHeight(posx, posz)
			CanSpawnEvent = posLosCheckNoRadar(posx, posy, posz, 300)
			if CanSpawnEvent then
				CanSpawnEvent = posLandCheck(posx, posy, posz, 300)
			end
			if CanSpawnEvent then
				if TierSpawnChances.T2 == 0 and TierSpawnChances.T3 == 0 and TierSpawnChances.T4 == 0 then
					local unit = T2bosses[math_random(1,#T2bosses)]
					for a = 1,math.ceil(baseNumber*4) do
						Spring.CreateUnit(unit, posx+math_random(-300,300), posy, posz+math_random(-300,300), math_random(0,3),GaiaTeamID)
					end
				elseif TierSpawnChances.T3 == 0 and TierSpawnChances.T4 == 0 then
					local unit = T3bosses[math_random(1,#T3bosses)]
					for a = 1,math.ceil(baseNumber*4) do
						Spring.CreateUnit(unit, posx+math_random(-300,300), posy, posz+math_random(-300,300), math_random(0,3),GaiaTeamID)
					end
				elseif TierSpawnChances.T4 == 0 then
					local unit = T4bosses[math_random(1,#T4bosses)]
					for a = 1,math.ceil(baseNumber*4) do
						Spring.CreateUnit(unit, posx+math_random(-300,300), posy, posz+math_random(-300,300), math_random(0,3),GaiaTeamID)
					end
				else
					local unit = T4bosses[math_random(1,#T4bosses)]
					for a = 1,math.ceil(baseNumber*8) do
						Spring.CreateUnit(unit, posx+math_random(-300,300), posy, posz+math_random(-300,300), math_random(0,3),GaiaTeamID)
					end
				end
				ScavSendNotification("scav_eventcloud")
				break
			end
		end
	end
end

return {
	miniboss1,
	miniboss1,
	--miniboss2,
}