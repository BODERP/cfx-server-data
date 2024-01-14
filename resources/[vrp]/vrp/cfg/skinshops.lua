local cfg = {}

local parts = {
	["Mascara"] = 1,
	["Mochila"] = 5,
	["Acessorios"] = 7,
	["Maos"] = 3,
	["Calcas"] = 4,
	["Camisa"] = 8,
	["Sapatos"] = 6,
	["Jaqueta"] = 11,
	["Chapeu"] = "p0",
	["Oculos"] = "p1",
	["Orelhas"] = "p2",
	["Braco Esquerdo"] = "p6",
	["Braco Direito"] = "p7",
	["Colete"] = 9
}

local parts2 = {
	["Adesivo"] = 10,
	["Mascara"] = 1,
	["Mochila"] = 5,
	["Acessorios"] = 7,
	["Maos"] = 3,
	["Calcas"] = 4,
	["Camisa"] = 8,
	["Sapatos"] = 6,
	["Colete"] = 9,
	["Jaqueta"] = 11,
	["Chapeu"] = "p0",
	["Oculos"] = "p1",
	["Orelhas"] = "p2",
	["Braco Esquerdo"] = "p6",
	["Braco Direito"] = "p7",
	["Colete"] = 9
}

cfg.skinshops = {
	{ parts,  	},
	{ parts,105.37,-1303.18,28.76 	}, -- CRASHANDO
	{ parts,-709.40,-153.66,37.41 	},
	{ parts,-163.20,-302.03,39.73 	},
	{ parts,425.58,-806.23,29.49  	},
	{ parts,-822.34,-1073.49,11.32	},
	{ parts,-1193.81,-768.49,17.31	},
	{ parts,-1450.85,-238.15,49.81	},
	{ parts,4.90,6512.47,31.87    	},
	{ parts,1693.95,4822.67,42.06 	},
	{ parts,126.05,-223.10,54.55  	},
	{ parts,614.26,2761.91,42.08  	},
	{ parts,1196.74,2710.21,38.22 	},
	{ parts,-3170.18,1044.54,20.86	},
	{ parts,-1093.54,-832.39,14.28	},
	{ parts,-1101.46,2710.57,19.10	},
	{ parts,-1887.30,2070.09,145.57	},--23681641,10644531,38067627
	{ parts,-1181.98,297.67,73.64	},--54736328,7734375,5721435547
	{ parts,-2674.98,1304.52,152.01	},-- 53515625,70996094,373291016
	--{ parts2,452.57,-990.80,30.68 	}, -- CIVIL
	{ parts2,301.28,-600.06,43.28 	}
	--{ parts2,268.78,-1363.42,24.54	}
	--{ parts2,128.62,-755.65,242.15	}
	--{ parts2,-2038.90,-465.88,16.42	}
	--{ parts2,814.36,157.90,89.94	}
	--{ parts2,821.61,153.38,89.94	}
} 

return cfg