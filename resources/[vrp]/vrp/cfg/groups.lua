local cfg = {}

cfg.groups = {
	["Admin"] = {
		"admin.permissao",
		"polpar.permissao",
		"ticket.permissao",
		"mod.permissao",
		"player.blips",
		"player.spec",
		"player.noclip",
		"player.secret",
		"player.wall"
	},
	["Mod"] = {
		"mod.permissao",
		"polpar.permissao",
		"ticket.permissao",
		"player.blips",
		"player.spec",
		"player.noclip",
		"player.secret",
		"player.wall"
	},
	["Suporte"] = {
		_config = {
			title = "Suporte",
			gtype = "suporte"
		},
		"suporte.permissao",
		"ticket.permissao",
		"player.blips",
		"player.spec",
		"player.noclip",
		"player.secret"
	},
	["Blips"] = {
		"blips.permissao"
	},
	-----------------------------------------------------
	-- Policial
	["Policial"] = {
		_config = {
			title = "Policial",
			gtype = "job"
		},
		"policia.permissao",
		"polpar.permissao",
		"soldesarg.arsenal",
		"portadp.permissao",
		"player.blips",
		"soldado.servico",
		"pgeral.permissao",
		"sem.permissao"
	},
	["PaisanaPolicial"] = {
		_config = {
			title = "Policial em folga",
			gtype = "job"
		},
		"paisanapolicia.permissao",
		"soldado.folga",
		"player.blips",
		"sem.permissao"
	},
	-- Sargento
	["Sargento"] = {
		_config = {
			title = "Sargento",
			gtype = "job"
		},
		"policia.permissao",
		"polpar.permissao",
		"player.blips",
		"portadp.permissao",
		"soldesarg.arsenal",
		"sargento.servico",
		"pgeral.permissao",
		"sem.permissao"
	},
	["PaisanaSargento"] = {
		_config = {
			title = "Sargento em folga",
			gtype = "job"
		},
		"paisanapolicia.permissao",
		"sargento.folga",
		"player.blips",
		"sem.permissao"
	},
	-- Investigador
	["Investigador"] = {
		_config = {
			title = "Investigador",
			gtype = "job"
		},
		"policia.permissao",
		"polpar.permissao",
		"portadp.permissao",
		"capitaoecoronel.arsenal",
		"capitao.servico",
		"player.blips",
		"pgeral.permissao",
		"sem.permissao"
	},
	["PaisanaInvestigador"] = {
		_config = {
			title = "Investigador em folga",
			gtype = "job"
		},
		"paisanapolicia.permissao",
		"capitao.folga",
		"player.blips",
		"sem.permissao"
	},
	-- Capitão
	["Capitao"] = {
		_config = {
			title = "Capitão",
			gtype = "job"
		},
		"policia.permissao",
		"polpar.permissao",
		"player.blips",
		"portadp.permissao",
		"tencoronelecoronel.arsenal",
		"tencoronel.servico",
		"pgeral.permissao",
		"sem.permissao"
	},
	["PaisanaCapitao"] = {
		_config = {
			title = "Capitão em folga",
			gtype = "job"
		},
		"paisanapolicia.permissao",
		"tencoronel.folga",
		"player.blips",
		"sem.permissao"
	},
	-- Comandante
	["Comandante"] = {
		_config = {
			title = "Comandante",
			gtype = "job"
		},
		"policia.permissao",
		"comandante.permissao",
		"polpar.permissao",
		"player.blips",
		"portadp.permissao",
		"tenenteecoronel.arsenal",
		"coronel.servico",
		"pgeral.permissao",
		"sem.permissao",
	},
	["PaisanaComandante"] = {
		_config = {
			title = "Comandante em folga",
			gtype = "job"
		},
		"paisanapolicia.permissao",
		"coronel.folga",
		"player.blips",
		"sem.permissao"
	},
	-- Pode usar o /add  para recrutar policiais
	--[[["LiderPolicia"] = {
		_config = {
			title = "LiderPolicia",
			gtype = "lider"
		},
		"liderpolicia.permissao",
		"polpar.permissao",
		"portadp.permissao",
		"sem.permissao"
	},]]
	-----------------------------------------------------
	-- HOSPITAL  ---------------------------------------
	-----------------------------------------------------
	["Enfermeiro"] = {
		_config = {
			title = "Enfermeiro",
			gtype = "job"
		},
		"paramedico.permissao",
		"enfermeiro.servico",
		"polpar.permissao",
		"sem.permissao"
	}, 
	["PaisanaEnfermeiro"] = {
		_config = {
			title = "Enfermeiro em folga",
			gtype = "job"
		},
		"paisanaenfermeiro.permissao",
		"enfermeiro.folga",
		"sem.permissao"
	},
	-- Médico
	["Medico"] = {
		_config = {
			title = "Médico",
			gtype = "job"
		},
		"paramedico.permissao",
		"medico.servico",
		"polpar.permissao",
		"sem.permissao"
	}, 
	["PaisanaMedico"] = {
		_config = {
			title = "Médico em folga",
			gtype = "job"
		},
		"paisanamedico.permissao",
		"medico.folga",
		"sem.permissao"
	},
	-- Diretor
	["Diretor"] = {
		_config = {
			title = "Diretor do Hospital",
			gtype = "job"
		},
		"paramedico.permissao",
		"diretor.servico",
		"polpar.permissao",
		"sem.permissao"
	}, 
	["PaisanaDiretor"] = {
		_config = {
			title = "Diretor em folga",
			gtype = "job"
		},
		"diretor.folga",
		"sem.permissao"
	},
	-----------------------------------------------------
	------- MECÂNICA ------------------------------------
	-----------------------------------------------------
	["Chefe"] = {
		_config = {
			title = "Chefe da Mecânica",
			gtype = "job"
		},
		"chefe.permissao",
		"chefe.servico",
		"mecanico.permissao",
		"ls.permissao",
		"reparo.permissao",
		"callmec.permissao",
		"sem.permissao"
	},
	["Mecanico"] = {
		_config = {
			title = "Mecânico",
			gtype = "job"
		},
		"mecanico.permissao",
		"mecanico.servico",
		"ls.permissao",
		"reparo.permissao",
		"callmec.permissao",
		"sem.permissao"
	},
	["PaisanaMecanico"] = {
		_config = {
			title = "Mecânico em folga",
			gtype = "job"
		},
		"mecanico.folga"
	},
	["PaisanaChefe"] = {
		_config = {
			title = "Chefe da Mecânica em folga",
			gtype = "job"
		},
		"chefe.folga"
	},
	-----------------------------------------------------
	-- DK -----------------------------------------------
	-----------------------------------------------------
	["ChefeTuning"] = {
		_config = {
			title = "Chefe Tuning",
			gtype = "job"
		},
		"desmanche.permissao",
		"mecanico.servico",
		"mecanico.permissao",
		"sem.permissao"
	},
	["ChefeTuningFolga"] = {
		_config = {
			title = "Chefe Tuning em folga",
			gtype = "job"
		},
		"mecanico.folga",
		"sem.permissao"
	},
	-----
	-----------------------------------------------------
	-- VANILLA-------------------------------------------
	-----------------------------------------------------
	["Vanilla"] = {
		_config = {
			title = "Vanilla",
			gtype = "job"
		},
		"vanilla.permissao",
		"lavagem.permissao",
		"sem.permissao"
	},
	-----------------------------------------------------
	-- VIPS ---------------------------------------------
	-----------------------------------------------------
	--[[["Bronze"] = {
		_config = {
			title = "Bronze",
			gtype = "vip"
		},
		"bronze.permissao"
	},
	["Prata"] = {
		_config = {
			title = "Prata",
			gtype = "vip"
		},
		"prata.permissao"
	},
	["Ouro"] = {
		_config = {
			title = "Ouro",
			gtype = "vip"
		},
		"ouro.permissao",
		"barcos.permissao",
		"mochila.permissao"
	},
	["Platina"] = {
		_config = {
			title = "Platina",
			gtype = "vip"
		},
		"barcos.permissao",
		"heli.permissao",
		"platina.permissao",
		"mochila.permissao"
	},
	["Diamante"] = {
		_config = {
			title = "Diamante",
			gtype = "vip"
		},
		"barcos.permissao",
		"heli.permissao",
		"diamante.permissao",
		"mochila.permissao"
	},]]
	-----------------------------------------------------
	-- TAXISTAS -----------------------------------------
	-----------------------------------------------------
	["PaisanaConvencional"] = {
		_config = {
			title = "Taxista Convencional em folga",
			gtype = "job"
		},
		"convencional.folga"
	},
	["PaisanaExecutivo"] = {
		_config = {
			title = "Taxista Executivo em folga",
			gtype = "job"
		},
		"executivo.folga"
	},
	["PaisanaChefeTaxista"] = {
		_config = {
			title = "Chefe dos taxistas em folga",
			gtype = "job"
		},
		"chefetaxistas.folga"
	},
	["TaxistaConvencional"] = {
		_config = {
			title = "Taxista Convencional",
			gtype = "job"
		},
		"convencional.servico",
		"taxista.permissao",
		"garagetaxi.permissao"
	},
	["TaxistaExecutivo"] = {
		_config = {
			title = "Taxista Executivo",
			gtype = "job"
		},
		"executivo.servico",
		"taxista.permissao",
		"garagetaxi.permissao"
	},
	["ChefeTaxistas"] = {
		_config = {
			title = "Chefe dos taxistas",
			gtype = "job"
		},
		"chefetaxistas.servico",
		"lavagem.permissao",
		"taxista.permissao",
		"garagetaxi.permissao"
	},
	-----------------------------------------------------
	-- TAXISTAS ILEGAL-----------------------------------
	-----------------------------------------------------
	["PaisanaConvencionalIlegal"] = {
		_config = {
			title = "Taxista Convencional em folga",
			gtype = "job"
		},
		"convencional.folga"
	},
	["PaisanaExecutivoIlegal"] = {
		_config = {
			title = "Taxista Executivo em folga",
			gtype = "job"
		},
		"executivoi.folga"
	},
	["TaxistaConvencionalIlegal"] = {
		_config = {
			title = "Taxista Convencional",
			gtype = "job"
		},
		"convencional.servico",
		"lavagem.permissao",
		"taxista.permissao",
		"garagetaxi.permissao"
	},
	["TaxistaExecutivoIlegal"] = {
		_config = {
			title = "Taxista Executivo",
			gtype = "job"
		},
		"executivoi.servico",
		"lavagem.permissao",
		"taxista.permissao",
		"garagetaxi.permissao"
	},
	-----------------------------------------------------
	-- LIXEIRO -----------------------------------------
	-----------------------------------------------------
	["PaisanaLixeiro"] = {
		_config = {
			title = "Lixeiro em folga",
			gtype = "job"
		},
		"lixeiro.folga"
	},
	["PaisanaChefeLixeiro"] = {
		_config = {
			title = "Chefe dos lixeiros em folga",
			gtype = "job"
		},
		"chefelixeiro.folga"
	},
	["Lixeiro"] = {
		_config = {
			title = "Lixeiro",
			gtype = "job"
		},
		"lixeiro.servico",
		"lixeiro.permissao",
		"garagelixeiro.permissao"
	},
	["ChefeLixeiro"] = {
		_config = {
			title = "Chefe dos lixeiros",
			gtype = "job"
		},
		"chefelixeiro.servico",
		"reciclagem.permissao",
		"lixeiro.permissao",
		"garagelixeiro.permissao"
	},
	-----------------------------------------------------
	-- LIXEIRO ILEGAL-----------------------------------
	-----------------------------------------------------
	["PaisanaLixeiroIlegal"] = {
		_config = {
			title = "Lixeiro em folga",
			gtype = "job"
		},
		"lixeiro.folga"
	},
	["LixeiroIlegal"] = {
		_config = {
			title = "Lixeiro Convencional",
			gtype = "job"
		},
		"lixeiro.servico",
		"lixeiro.permissao",
		"reciclagem.permissao",
		"garagelixeiro.permissao"
	},
	-----------------------------------------------------
	-- CONTRABANDISTAS ----------------------------------
	-----------------------------------------------------
	["Contrabandista"] = { -- Contrabandistas
		_config = {
			title = "Contrabandista",
			gtype = "job"
		},
		"contrabandista.permissao",
		"ilegal.permissao"
	},
	-----------------------------------------------------
	-- FACÇÕES ------------------------------------------
	-----------------------------------------------------
	["Campinho"] = { --Cocaína
		_config = {
			title = "Campinho",
			gtype = "job"
		},
		"campinho.permissao",
		"ilegal.permissao"
	},
}

cfg.users = {
	[1] = { "Admin" }
}

cfg.selectors = {

}

return cfg