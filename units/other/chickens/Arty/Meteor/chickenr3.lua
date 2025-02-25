return {
	chickenr3 = {
		acceleration = 1.15,
		bmcode = "1",
		brakerate = 9.2,
		buildcostenergy = 12320,
		buildcostmetal = 396,
		builder = false,
		buildpic = "chickens/chickenr3.DDS",
		buildtime = 270000,
		canattack = true,
		canguard = true,
		canmove = true,
		canpatrol = true,
		canstop = "1",
		category = "BOT MOBILE WEAPON ALL NOTSUB NOTSHIP NOTAIR NOTHOVER SURFACE CHICKEN EMPABLE",
		collisionvolumeoffsets = "0 -1 0",
		collisionvolumescales = "84 215 84",
		collisionvolumetest = 1,
		collisionvolumetype = "CylY",
		defaultmissiontype = "Standby",
		explodeas = "LOBBER_MORPH",
		footprintx = 4,
		footprintz = 4,
		hidedamage = 1,
		hightrajectory = 1,
		idleautoheal = 20,
		idletime = 300,
		leavetracks = true,
		maneuverleashlength = "640",
		mass = 40000,
		maxdamage = 90000,
		maxslope = 18,
		maxvelocity = 2,
		maxwaterdepth = 0,
		movementclass = "CHICKQUEEN",
		noautofire = false,
		nochasecategory = "VTOL",
		objectname = "Chickens/chicken_colonizer.s3o",
		script = "Chickens/chickenr3.cob",
		seismicsignature = 4,
		selfdestructas = "LOBBER_MORPH",
		side = "THUNDERBIRDS",
		sightdistance = 1250,
		smoothanim = true,
		steeringmode = "2",
		tedclass = "BOT",
		trackoffset = 6,
		trackstrength = 3,
		trackstretch = 1,
		tracktype = "ChickenTrack",
		trackwidth = 100,
		turninplace = true,
		turninplaceanglelimit = 90,
		turnrate = 600,
		unitname = "chickenr3",
		upright = false,
		workertime = 0,
		customparams = {
			subfolder = "other/chickens",			
			model_author = "KDR_11k, Beherith",
			normalmaps = "yes",
			normaltex = "unittextures/chicken_l_normals.png",
			--treeshader = "no",
		},
		sfxtypes = {
			explosiongenerators = {
				[1] = "custom:blood_spray",
				[2] = "custom:blood_explode",
				[3] = "custom:dirt",
			},
			pieceexplosiongenerators = {
				[1] = "blood_spray",
				[2] = "blood_spray",
				[3] = "blood_spray",
			},
		},
		weapondefs = {
			meteorlauncher = {
				areaofeffect = 750,
				avoidfriendly = 0,
				cegtag = "nuketrail-roost",
				collidefriendly = 0,
				craterboost = 0,
				cratermult = 0,
				edgeeffectiveness = 0.3,
				explosiongenerator = "custom:chickennuke",
				firestarter = 70,
				hightrajectory = 1,
				interceptedbyshieldtype = 4,
				model = "Chickens/greyrock2.s3o",
				name = "METEORLAUNCHER",
				proximitypriority = -6,
				range = 14000,
				reloadtime = 15,
				soundhit = "nuke4",
				targetable = 1,
				targetborder = 0.75,
				turret = 1,
				weaponvelocity = 880,
				customparams = {
					expl_light_color = "1 0.9 0.7",
					expl_light_life_mult = 1.6,
					expl_light_mult = 1.3,
					expl_light_radius_mult = 1.5,
				},
				damage = {
					default = 2900,
				},
			},
		},
		weapons = {
			[1] = {
				badtargetcategory = "MOBILE",
				def = "METEORLAUNCHER",
				maindir = "0 0 1",
				onlytargetcategory = "NOTAIR",
			},
		},
	},
}
