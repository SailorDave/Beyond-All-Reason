return {
	raptormasterhive = {
		acceleration = 0,
		activatewhenbuilt = true,
		autoheal = 1.8,
		bmcode = "0",
		brakerate = 0,
		buildcostenergy = 25000,
		buildcostmetal = 400,
		builddistance = 300,
		builder = true,
		buildpic = "chickens/roost.PNG",
		buildtime = 10500,
		category = "BOT MOBILE WEAPON ALL NOTSUB NOTSHIP NOTAIR NOTHOVER SURFACE CHICKEN EMPABLE",
		collisionvolumeoffsets = "0 0 0",
		collisionvolumescales = "56 11 56",
		collisionvolumetype = "box",
		energystorage = 1000,
		explodeas = "ROOST_DEATH",
		footprintx = 2,
		footprintz = 2,
		idleautoheal = 10,
		idletime = 90,
		levelground = false,
		mass = 165.75,
		maxdamage = 1800,
		maxvelocity = 0,
		noautofire = false,
		objectname = "Chickens/chicken_hive.s3o",
		radardistance = 900,
		script = "Chickens/chicken_hive.cob",
		seismicsignature = 4,
		selfdestructas = "ROOST_DEATH",
		sightdistance = 450,
		side = "THUNDERBIRDS",
		smoothanim = true,
		tedclass = "ENERGY",
		turninplace = true,
		turninplaceanglelimit = 90,
		turnrate = 0,
		unitname = "raptormasterhive",
		upright = false,
		waterline = 0,
		workertime = 1500,
		buildoptions = {
			"raptorbasic",
		},
		yardmap = "oo oo",
		customparams = {
			isairbase = true,
			subfolder = "other/chickens",
			model_author = "LathanStanley, Beherith",
			normalmaps = "yes",
			normaltex = "unittextures/chicken_hive_normals.tga",
			--treeshader = "yes",
		},
		featuredefs = {},
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
			weapon = {
				areaofeffect = 450,
				avoidfriendly = 0,
				cegtag = "nuketrail-roost",
				collidefriendly = 0,
				craterboost = 0,
				cratermult = 0,
				edgeeffectiveness = 0.3,
				explosiongenerator = "custom:genericshellexplosion-meteor",
				firestarter = 70,
				flighttime = 100,
				impulsefactor = 0.1,
				interceptedbyshieldtype = 4,
				metalpershot = 0,
				model = "Chickens/greyrock2.s3o",
				name = "Asteroid",
				range = 29999,
				reloadtime = 5,
				smoketrail = 1,
				soundhit = "nuke4",
				soundhitvolume = 10,
				startvelocity = 2000,
				targetborder = 0.75,
				turret = 1,
				weaponacceleration = 120,
				weapontimer = 10,
				weaponvelocity = 2000,
				wobble = 0,
				customparams = {
					expl_light_color = "1 0.6 0.3",
					expl_light_life_mult = 1.2,
					expl_light_mult = 1.2,
					expl_light_radius_mult = 1.2,
				},
				damage = {
					chicken = 0.1,
					default = 0.1,
				},
			},
		},
		weapons = {
			[1] = {
				def = "WEAPON",
			},
		},
	},
}
