function gadget:GetInfo()
	return {
		name = "Lups Flamethrower Jitter",
		desc = "Flamethrower jitter FX with LUPS",
		author = "jK",
		date = "Apr, 2008",
		license = "GNU GPL, v2 or later",
		layer = 0,
		enabled = true, --  loaded by default?
	}
end


if gadgetHandler:IsSyncedCode() then

	local MIN_EFFECT_INTERVAL = 3

	local SendToUnsynced = SendToUnsynced

	local thisGameFrame = 0
	local lastLupsSpawn = {}

	function FlameShot(unitID, unitDefID, _, weapon)
		lastLupsSpawn[unitID] = lastLupsSpawn[unitID] or {}
		if ((lastLupsSpawn[unitID][weapon] or 0) - thisGameFrame) <= -MIN_EFFECT_INTERVAL then
			lastLupsSpawn[unitID][weapon] = thisGameFrame
			SendToUnsynced("flame_FlameShot", unitID, unitDefID, weapon)
		end
	end

	GG.LUPS = GG.LUPS or {}
	GG.LUPS.FlameShot = FlameShot

	function gadget:GameFrame(n)
		thisGameFrame = n
		SendToUnsynced("flame_GameFrame")
	end

	function gadget:Initialize()
		gadgetHandler:RegisterGlobal("FlameShot", FlameShot)
		--gadgetHandler:RegisterGlobal("FlameSetDir",FlameSetDir)
		--gadgetHandler:RegisterGlobal("FlameSetFirePoint",FlameSetFirePoint)
	end

	function gadget:Shutdown()
		gadgetHandler:DeregisterGlobal("FlameShot")
		--gadgetHandler:DeregisterGlobal("FlameSetDir")
		--gadgetHandler:DeregisterGlobal("FlameSetFirePoint")
	end

else
	-------------------------------------------------------------------------------------
	-- -> UNSYNCED
	-------------------------------------------------------------------------------------

	local particleCnt = 1
	local particleList = {}

	local lastShoot = {}

	local altflametex = {}
	local flameWeaponParticleLife = {}
	for weaponDefID, weaponDef in pairs(WeaponDefs) do
		if weaponDef.type == "Flame" then
			flameWeaponParticleLife[weaponDefID] = (weaponDef.range * weaponDef.duration) / 15
			if weaponDef.customParams.altflametex then
				altflametex[weaponDefID] = weaponDef.customParams.altflametex
			end
		end
	end

	local unitWeapons = {}
	for unitDefID, unitDef in pairs(UnitDefs) do
		local weapons = unitDef.weapons
		if #weapons > 0 then
			unitWeapons[unitDefID] = {}
			for i, _ in pairs(weapons) do
				unitWeapons[unitDefID][i] = weapons[i].weaponDef
			end
		end
	end

	function FlameShot(_, unitID, unitDefID, weapon)
		if Spring.IsUnitIcon(unitID) then
			return
		end
		-- why is this even needed? we limited frequency of fire FX back in synced
		--[[
		local n = Spring.GetGameFrame()
		lastShoot[unitID] = lastShoot[unitID] or {}
		if ((lastShoot[unitID][weapon] or 0) > (n-MIN_EFFECT_INTERVAL) ) then
		  return
		end
		lastShoot[unitID][weapon] = n
		]]--

		local posx, posy, posz, dirx, diry, dirz = Spring.GetUnitWeaponVectors(unitID, weapon)
		local wd = unitWeapons[unitDefID][weapon]
		local particleLife = flameWeaponParticleLife[wd]

		local speedx, speedy, speedz = Spring.GetUnitVelocity(unitID)
		local partpos = "x*delay,y*delay,z*delay|x=" .. speedx .. ",y=" .. speedy .. ",z=" .. speedz

		local altFlameTexture = altflametex[wd]    -- FIXME: more elegant solution when this is actually implemented (as in, one that doesn't rely on different unitdef)

		particleList[particleCnt] = {
			class = 'JitterParticles2',
			colormap = { { 1, 1, 1, 1 }, { 1, 1, 1, 1 } },
			count = 1,
			life = particleLife,
			lifeSpread = 6,
			delaySpread = 3,
			force = { 0, 0.6, 0 },
			--forceExp     = 0.2,

			partpos = partpos,
			pos = { posx, posy, posz },

			emitVector = { dirx, diry, dirz },
			emitRotSpread = 2.5,

			speed = 8,
			speedSpread = 1.5,
			speedExp = 1.5,

			size = 28,
			sizeGrowth = 4.7,

			scale = 1.5,
			strength = 1.0,
			heat = 6,
		}
		particleCnt = particleCnt + 1

		particleList[particleCnt] = {
			class = 'SimpleParticles2',
			colormap = { { 1, 1, 1, 0.01 },
						 { 1, 1, 1, 0.01 },
						 { 0.75, 0.5, 0.5, 0.01 },
						 { 0, 0, 0, 0.01 } },
			count = 1,
			life = particleLife*0.8,
			lifeSpread = 6,
			delaySpread = 3,

			force = { 0, 0.4, 0 },
			--forceExp     = 0.2,

			partpos = partpos,
			pos = { posx, posy, posz },

			emitVector = { dirx, diry, dirz },
			emitRotSpread = 1.5,

			rotSpeed = 1,
			rotSpread = 360,
			rotExp = 9,

			speed = 8,
			speedSpread = 1.5,
			speedExp = -1.5,

			size = 7,
			sizeGrowth = 1.5,
			sizeExp = 0.7,

			--texture     = "bitmaps/smoke/smoke06.tga",
			texture = altFlameTexture and "bitmaps/GPL/flame_alt.tga" or "bitmaps/GPL/flame.tga",
		}
		particleCnt = particleCnt + 1

		particleList[particleCnt] = {
			class = 'SimpleParticles2',
			colormap = { { 1, 1, 1, 0.01 }, { 0, 0, 0, 0.01 } },
			count = 4,
			--delay        = 20,
			life = particleLife*0.6,
			lifeSpread = 6,
			delaySpread = 3,

			force = { 0, 0.4, 0 },
			--forceExp     = 0.2,

			partpos = partpos,
			pos = { posx, posy, posz },

			emitVector = { dirx, diry, dirz },
			emitRotSpread = 1.5,

			rotSpeed = 1,
			rotSpread = 360,
			rotExp = 9,

			speed = 8,
			speedSpread = 1.5,
			speedExp = -1.5,

			size = 9,
			sizeGrowth = 1.5,
			sizeExp = 0.65,

			--texture     = "bitmaps/smoke/smoke06.tga",
			texture = altFlameTexture and "bitmaps/GPL/flame_alt.tga" or "bitmaps/GPL/flame.tga",
		}
		particleCnt = particleCnt + 1

	end

	function GameFrame()
		if particleCnt > 1 then
			particleList.n = particleCnt
			GG.Lups.AddParticlesArray(particleList)
			particleList = {}
			particleCnt = 1
		end
	end

	function gadget:Initialize()
		gl.DeleteTexture("bitmaps/GPL/flame.png")
		gadgetHandler:AddSyncAction("flame_GameFrame", GameFrame)
		gadgetHandler:AddSyncAction("flame_FlameShot", FlameShot)
	end

	function gadget:Shutdown()
		gadgetHandler:RemoveSyncAction("flame_FlameShot")
	end

end
