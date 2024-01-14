-----------------------------------------------------------------------------------------------------------------------------------------
-- VRP
-----------------------------------------------------------------------------------------------------------------------------------------
local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
local Tools = module("vrp","lib/Tools")
vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP")
-----------------------------------------------------------------------------------------------------------------------------------------
-- CONEXÃO
-----------------------------------------------------------------------------------------------------------------------------------------
src = {}
Tunnel.bindInterface("vrp_garages",src)
vCLIENT = Tunnel.getInterface("vrp_garages")
local inventory = module("vrp","cfg/inventory")
local idgens = Tools.newIDGenerator()
-----------------------------------------------------------------------------------------------------------------------------------------
-- PREPARE
-----------------------------------------------------------------------------------------------------------------------------------------
vRP._prepare("creative/get_vehicle","SELECT * FROM vrp_user_vehicles WHERE user_id = @user_id")
vRP._prepare("creative/rem_vehicle","DELETE FROM vrp_user_vehicles WHERE user_id = @user_id AND vehicle = @vehicle")
vRP._prepare("creative/get_vehicles","SELECT * FROM vrp_user_vehicles WHERE user_id = @user_id AND vehicle = @vehicle")
vRP._prepare("creative/set_update_vehicles","UPDATE vrp_user_vehicles SET engine = @engine, body = @body, fuel = @fuel WHERE user_id = @user_id AND vehicle = @vehicle")
vRP._prepare("creative/set_detido","UPDATE vrp_user_vehicles SET detido = @detido, time = @time WHERE user_id = @user_id AND vehicle = @vehicle")
vRP._prepare("creative/set_ipva","UPDATE vrp_user_vehicles SET ipva = @ipva WHERE user_id = @user_id AND vehicle = @vehicle")
vRP._prepare("creative/move_vehicle","UPDATE vrp_user_vehicles SET user_id = @nuser_id WHERE user_id = @user_id AND vehicle = @vehicle")
vRP._prepare("creative/add_vehicle","INSERT IGNORE INTO vrp_user_vehicles(user_id,vehicle,ipva) VALUES(@user_id,@vehicle,@ipva)")
vRP._prepare("creative/con_maxvehs","SELECT COUNT(vehicle) as qtd FROM vrp_user_vehicles WHERE user_id = @user_id")
vRP._prepare("creative/rem_srv_data","DELETE FROM vrp_srv_data WHERE dkey = @dkey")
vRP._prepare("creative/get_estoque","SELECT * FROM vrp_estoque WHERE vehicle = @vehicle")
vRP._prepare("creative/set_estoque","UPDATE vrp_estoque SET quantidade = @quantidade WHERE vehicle = @vehicle")
vRP._prepare("creative/get_users","SELECT * FROM vrp_users WHERE id = @user_id")
-----------------------------------------------------------------------------------------------------------------------------------------
-- WEBHOOK
-----------------------------------------------------------------------------------------------------------------------------------------
local webhookadmin = "https://discordapp.com/api/webhooks/762770113258586154/1_AbRXC3pJhqbm1CNuNjxkqnpZASqDCCjPEf-v_gMqN-a1Is9Otb-eMSmR7UorXnfjwt"
local webhookvehs = "https://discord.com/api/webhooks/762770202852327444/mzWT-qm-fk2YN8x6AXbro0O0cbLaeDWC0pBc3BAp-T7Uxjc1qgGfFIXvsOnAJifcW2BA"
local webhookipva = "https://discord.com/api/webhooks/762770202852327444/mzWT-qm-fk2YN8x6AXbro0O0cbLaeDWC0pBc3BAp-T7Uxjc1qgGfFIXvsOnAJifcW2BA"
local webhookdesmanche = "https://discordapp.com/api/webhooks/762770277557338163/4DMNjmyMJICvA7b1RCr58f5mHpV57ctZdm9n1lACdEDRZRIjCCWwcJxjj9768z1F6qef"

function SendWebhookMessage(webhook,message)
	if webhook ~= nil and webhook ~= "" then
		PerformHttpRequest(webhook, function(err, text, headers) end, 'POST', json.encode({content = message}), { ['Content-Type'] = 'application/json' })
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- VARIAVEIS
-----------------------------------------------------------------------------------------------------------------------------------------
local police = {}
local vehlist = {}
local trydoors = {}
trydoors["CLONADOS"] = true
trydoors["CREATIVE"] = true

-----------------------------------------------------------------------------------------------------------------------------------------
-- RETURNVEHICLESEVERYONE
-----------------------------------------------------------------------------------------------------------------------------------------
function src.returnVehicleEveryone(placa)
	return trydoors[placa]
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- SETPLATEEVERYONE
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterServerEvent("setPlateEveryone")
AddEventHandler("setPlateEveryone",function(placa)
	trydoors[placa] = true
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- GARAGES
-----------------------------------------------------------------------------------------------------------------------------------------
local garages = {
-----------------------------------------------------------------------------------------------------------------------------------------
-- GARAGEM PUBLICA
-----------------------------------------------------------------------------------------------------------------------------------------
	[1] =  { ['name'] = "Garagem", ['payment'] = false, ['public'] = true },
	[2] =  { ['name'] = "Garagem", ['payment'] = false, ['public'] = true },
	[3] =  { ['name'] = "Garagem", ['payment'] = false, ['public'] = true },
	[4] =  { ['name'] = "Garagem", ['payment'] = false, ['public'] = true },
	[5] =  { ['name'] = "Garagem", ['payment'] = false, ['public'] = true },
	[6] =  { ['name'] = "Garagem", ['payment'] = false, ['public'] = true },
	[7] =  { ['name'] = "Garagem", ['payment'] = false, ['public'] = true },
	[8] =  { ['name'] = "Garagem", ['payment'] = false, ['public'] = true },
	[9] =  { ['name'] = "Garagem", ['payment'] = false, ['public'] = true },
	[10] = { ['name'] = "Garagem", ['payment'] = false, ['public'] = true },
	[11] = { ['name'] = "Garagem", ['payment'] = false, ['public'] = true },
	[12] = { ['name'] = "Garagem", ['payment'] = false, ['public'] = true },
	[13] = { ['name'] = "Garagem", ['payment'] = false, ['public'] = true },
	[14] = { ['name'] = "Garagem", ['payment'] = false, ['public'] = true },
	[15] = { ['name'] = "Garagem", ['payment'] = false, ['public'] = true },
	[16] = { ['name'] = "Garagem", ['payment'] = false, ['public'] = true },
	[17] = { ['name'] = "Garagem", ['payment'] = false, ['public'] = true },
	[18] = { ['name'] = "Garagem", ['payment'] = false, ['public'] = true },
	[19] = { ['name'] = "Garagem", ['payment'] = false, ['public'] = true },
	[331] = { ['name'] = "Garagem", ['payment'] = false, ['public'] = true },
	[340] = { ['name'] = "Garagem", ['payment'] = false, ['public'] = true },
	[341] = { ['name'] = "Garagem", ['payment'] = false, ['public'] = true },
-----------------------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------FORTHILLS-----------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------
	[40] = { ['name'] = "FH01", ['payment'] = false, ['public'] = false },
	[41] = { ['name'] = "FH04", ['payment'] = false, ['public'] = false },
	[42] = { ['name'] = "FH11", ['payment'] = false, ['public'] = false },
	[43] = { ['name'] = "FH15", ['payment'] = false, ['public'] = false },
	[44] = { ['name'] = "FH19", ['payment'] = false, ['public'] = false },
	[45] = { ['name'] = "FH19", ['payment'] = false, ['public'] = false },
	[46] = { ['name'] = "FH23", ['payment'] = false, ['public'] = false },
	[47] = { ['name'] = "FH24", ['payment'] = false, ['public'] = false },
	[48] = { ['name'] = "FH26", ['payment'] = false, ['public'] = false },
	[49] = { ['name'] = "FH29", ['payment'] = false, ['public'] = false },
	[50] = { ['name'] = "FH31", ['payment'] = false, ['public'] = false },
	[51] = { ['name'] = "FH32", ['payment'] = false, ['public'] = false },
	[52] = { ['name'] = "FH45", ['payment'] = false, ['public'] = false },
	[53] = { ['name'] = "FH48", ['payment'] = false, ['public'] = false },
	[54] = { ['name'] = "FH49", ['payment'] = false, ['public'] = false },
	[55] = { ['name'] = "FH52", ['payment'] = false, ['public'] = false },
	[56] = { ['name'] = "FH54", ['payment'] = false, ['public'] = false },
	[57] = { ['name'] = "FH55", ['payment'] = false, ['public'] = false },
	[58] = { ['name'] = "FH58", ['payment'] = false, ['public'] = false },
	[59] = { ['name'] = "FH59", ['payment'] = false, ['public'] = false },
	[60] = { ['name'] = "FH62", ['payment'] = false, ['public'] = false },
	[61] = { ['name'] = "FH68", ['payment'] = false, ['public'] = false },
	[62] = { ['name'] = "FH81", ['payment'] = false, ['public'] = false },
	[63] = { ['name'] = "FH91", ['payment'] = false, ['public'] = false },
	[64] = { ['name'] = "FH92", ['payment'] = false, ['public'] = false },
	[65] = { ['name'] = "FH93", ['payment'] = false, ['public'] = false },
	[66] = { ['name'] = "FH94", ['payment'] = false, ['public'] = false },
-----------------------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------LUXURY--------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------
	[70] =  { ['name'] = "LX01", ['payment'] = false, ['public'] = false },
	[71] =  { ['name'] = "LX02", ['payment'] = false, ['public'] = false },
	[72] =  { ['name'] = "LX03", ['payment'] = false, ['public'] = false },
	[73] =  { ['name'] = "LX04", ['payment'] = false, ['public'] = false },
	[74] =  { ['name'] = "LX05", ['payment'] = false, ['public'] = false },
	[75] =  { ['name'] = "LX06", ['payment'] = false, ['public'] = false },
	[76] =  { ['name'] = "LX07", ['payment'] = false, ['public'] = false },
	[77] =  { ['name'] = "LX08", ['payment'] = false, ['public'] = false },
	[78] =  { ['name'] = "LX09", ['payment'] = false, ['public'] = false },
	[79] =  { ['name'] = "LX10", ['payment'] = false, ['public'] = false },
	[80] =  { ['name'] = "LX11", ['payment'] = false, ['public'] = false },
	[81] =  { ['name'] = "LX12", ['payment'] = false, ['public'] = false },
	[82] =  { ['name'] = "LX13", ['payment'] = false, ['public'] = false },
	[83] =  { ['name'] = "LX14", ['payment'] = false, ['public'] = false },
	[84] =  { ['name'] = "LX15", ['payment'] = false, ['public'] = false },
	[85] =  { ['name'] = "LX16", ['payment'] = false, ['public'] = false },
	[86] =  { ['name'] = "LX17", ['payment'] = false, ['public'] = false },
	[87] =  { ['name'] = "LX18", ['payment'] = false, ['public'] = false },
	[88] =  { ['name'] = "LX20", ['payment'] = false, ['public'] = false },
	[89] =  { ['name'] = "LX21", ['payment'] = false, ['public'] = false },
	[90] =  { ['name'] = "LX22", ['payment'] = false, ['public'] = false },
	[91] =  { ['name'] = "LX23", ['payment'] = false, ['public'] = false },
	[92] =  { ['name'] = "LX24", ['payment'] = false, ['public'] = false },
	[93] =  { ['name'] = "LX25", ['payment'] = false, ['public'] = false },
	[94] =  { ['name'] = "LX26", ['payment'] = false, ['public'] = false },
	[95] =  { ['name'] = "LX27", ['payment'] = false, ['public'] = false },
	[96] =  { ['name'] = "LX28", ['payment'] = false, ['public'] = false },
	[97] =  { ['name'] = "LX29", ['payment'] = false, ['public'] = false },
	[98] =  { ['name'] = "LX32", ['payment'] = false, ['public'] = false },
	[99] =  { ['name'] = "LX34", ['payment'] = false, ['public'] = false },
	[100] = { ['name'] = "LX35", ['payment'] = false, ['public'] = false },
	[101] = { ['name'] = "LX36", ['payment'] = false, ['public'] = false },
	[102] = { ['name'] = "LX37", ['payment'] = false, ['public'] = false },
	[103] = { ['name'] = "LX38", ['payment'] = false, ['public'] = false },
	[104] = { ['name'] = "LX39", ['payment'] = false, ['public'] = false },
	[105] = { ['name'] = "LX40", ['payment'] = false, ['public'] = false },
	[106] = { ['name'] = "LX41", ['payment'] = false, ['public'] = false },
	[107] = { ['name'] = "LX42", ['payment'] = false, ['public'] = false },
	[108] = { ['name'] = "LX43", ['payment'] = false, ['public'] = false },
	[109] = { ['name'] = "LX44", ['payment'] = false, ['public'] = false },
	[110] = { ['name'] = "LX45", ['payment'] = false, ['public'] = false },
	[111] = { ['name'] = "LX46", ['payment'] = false, ['public'] = false },
	[112] = { ['name'] = "LX47", ['payment'] = false, ['public'] = false },
	[113] = { ['name'] = "LX48", ['payment'] = false, ['public'] = false },
	[114] = { ['name'] = "LX50", ['payment'] = false, ['public'] = false },
	[115] = { ['name'] = "LX51", ['payment'] = false, ['public'] = false },
	[116] = { ['name'] = "LX52", ['payment'] = false, ['public'] = false },
	[117] = { ['name'] = "LX53", ['payment'] = false, ['public'] = false },
	[118] = { ['name'] = "LX54", ['payment'] = false, ['public'] = false },
	[119] = { ['name'] = "LX55", ['payment'] = false, ['public'] = false },
	[120] = { ['name'] = "LX58", ['payment'] = false, ['public'] = false },
	[121] = { ['name'] = "LX59", ['payment'] = false, ['public'] = false },
	[122] = { ['name'] = "LX60", ['payment'] = false, ['public'] = false },
	[123] = { ['name'] = "LX61", ['payment'] = false, ['public'] = false },
	[124] = { ['name'] = "LX62", ['payment'] = false, ['public'] = false },
	[125] = { ['name'] = "LX63", ['payment'] = false, ['public'] = false },
	[126] = { ['name'] = "LX64", ['payment'] = false, ['public'] = false },
	[127] = { ['name'] = "LX65", ['payment'] = false, ['public'] = false },
	[128] = { ['name'] = "LX66", ['payment'] = false, ['public'] = false },
	[129] = { ['name'] = "LX67", ['payment'] = false, ['public'] = false },
	[130] = { ['name'] = "LX68", ['payment'] = false, ['public'] = false },
	[131] = { ['name'] = "LX69", ['payment'] = false, ['public'] = false },
	[132] = { ['name'] = "LX70", ['payment'] = false, ['public'] = false },
-----------------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------SAMIR-------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------
	[150] = { ['name'] = "LS29", ['payment'] = false, ['public'] = false },
	[151] = { ['name'] = "LS30", ['payment'] = false, ['public'] = false },
	[152] = { ['name'] = "LS31", ['payment'] = false, ['public'] = false },
	[153] = { ['name'] = "LS32", ['payment'] = false, ['public'] = false },
	[154] = { ['name'] = "LS33", ['payment'] = false, ['public'] = false },
	[155] = { ['name'] = "LS34", ['payment'] = false, ['public'] = false },
	[156] = { ['name'] = "LS35", ['payment'] = false, ['public'] = false },
	[157] = { ['name'] = "LS36", ['payment'] = false, ['public'] = false },
	[158] = { ['name'] = "LS37", ['payment'] = false, ['public'] = false },
	[159] = { ['name'] = "LS38", ['payment'] = false, ['public'] = false },
	[160] = { ['name'] = "LS39", ['payment'] = false, ['public'] = false },
	[161] = { ['name'] = "LS40", ['payment'] = false, ['public'] = false },
	[162] = { ['name'] = "LS41", ['payment'] = false, ['public'] = false },
	[163] = { ['name'] = "LS42", ['payment'] = false, ['public'] = false },
	[164] = { ['name'] = "LS43", ['payment'] = false, ['public'] = false },
	[165] = { ['name'] = "LS44", ['payment'] = false, ['public'] = false },
	[166] = { ['name'] = "LS45", ['payment'] = false, ['public'] = false },
	[167] = { ['name'] = "LS46", ['payment'] = false, ['public'] = false },
	[168] = { ['name'] = "LS47", ['payment'] = false, ['public'] = false },
	[169] = { ['name'] = "LS48", ['payment'] = false, ['public'] = false },
	[170] = { ['name'] = "LS49", ['payment'] = false, ['public'] = false },
	[171] = { ['name'] = "LS50", ['payment'] = false, ['public'] = false },
	[172] = { ['name'] = "LS51", ['payment'] = false, ['public'] = false },
	[173] = { ['name'] = "LS52", ['payment'] = false, ['public'] = false },
	[174] = { ['name'] = "LS53", ['payment'] = false, ['public'] = false },
	[175] = { ['name'] = "LS54", ['payment'] = false, ['public'] = false },
	[176] = { ['name'] = "LS55", ['payment'] = false, ['public'] = false },
	[177] = { ['name'] = "LS56", ['payment'] = false, ['public'] = false },
	[178] = { ['name'] = "LS57", ['payment'] = false, ['public'] = false },
	[179] = { ['name'] = "LS58", ['payment'] = false, ['public'] = false },
	[180] = { ['name'] = "LS59", ['payment'] = false, ['public'] = false },
	[181] = { ['name'] = "LS60", ['payment'] = false, ['public'] = false },
	[182] = { ['name'] = "LS61", ['payment'] = false, ['public'] = false },
	[183] = { ['name'] = "LS62", ['payment'] = false, ['public'] = false },
	[184] = { ['name'] = "LS63", ['payment'] = false, ['public'] = false },
	[185] = { ['name'] = "LS64", ['payment'] = false, ['public'] = false },
	[186] = { ['name'] = "LS65", ['payment'] = false, ['public'] = false },
	[187] = { ['name'] = "LS66", ['payment'] = false, ['public'] = false },
	[188] = { ['name'] = "LS67", ['payment'] = false, ['public'] = false },
	[189] = { ['name'] = "LS68", ['payment'] = false, ['public'] = false },
	[190] = { ['name'] = "LS69", ['payment'] = false, ['public'] = false },
	[191] = { ['name'] = "LS70", ['payment'] = false, ['public'] = false },
	[192] = { ['name'] = "LS71", ['payment'] = false, ['public'] = false },
	[193] = { ['name'] = "LS72", ['payment'] = false, ['public'] = false },
-----------------------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------KRONDORS------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------
	[200] = { ['name'] = "KR02", ['payment'] = false, ['public'] = false },
	[201] = { ['name'] = "KR03", ['payment'] = false, ['public'] = false },
	[202] = { ['name'] = "KR04", ['payment'] = false, ['public'] = false },
	[203] = { ['name'] = "KR05", ['payment'] = false, ['public'] = false },
	[204] = { ['name'] = "KR06", ['payment'] = false, ['public'] = false },
	[205] = { ['name'] = "KR07", ['payment'] = false, ['public'] = false },
	[206] = { ['name'] = "KR08", ['payment'] = false, ['public'] = false },
	[207] = { ['name'] = "KR09", ['payment'] = false, ['public'] = false },
	[208] = { ['name'] = "KR10", ['payment'] = false, ['public'] = false },
	[209] = { ['name'] = "KR11", ['payment'] = false, ['public'] = false },
	[210] = { ['name'] = "KR12", ['payment'] = false, ['public'] = false },
	[211] = { ['name'] = "KR13", ['payment'] = false, ['public'] = false },
	[212] = { ['name'] = "KR14", ['payment'] = false, ['public'] = false },
	[213] = { ['name'] = "KR15", ['payment'] = false, ['public'] = false },
	[214] = { ['name'] = "KR16", ['payment'] = false, ['public'] = false },
	[215] = { ['name'] = "KR17", ['payment'] = false, ['public'] = false },
	[216] = { ['name'] = "KR18", ['payment'] = false, ['public'] = false },
	[217] = { ['name'] = "KR19", ['payment'] = false, ['public'] = false },
	[218] = { ['name'] = "KR20", ['payment'] = false, ['public'] = false },
	[219] = { ['name'] = "KR21", ['payment'] = false, ['public'] = false },
	[220] = { ['name'] = "KR22", ['payment'] = false, ['public'] = false },
	[221] = { ['name'] = "KR23", ['payment'] = false, ['public'] = false },
	[222] = { ['name'] = "KR24", ['payment'] = false, ['public'] = false },
	[223] = { ['name'] = "KR25", ['payment'] = false, ['public'] = false },
	[224] = { ['name'] = "KR26", ['payment'] = false, ['public'] = false },
	[225] = { ['name'] = "KR27", ['payment'] = false, ['public'] = false },
	[226] = { ['name'] = "KR28", ['payment'] = false, ['public'] = false },
	[227] = { ['name'] = "KR29", ['payment'] = false, ['public'] = false },
	[228] = { ['name'] = "KR30", ['payment'] = false, ['public'] = false },
	[229] = { ['name'] = "KR31", ['payment'] = false, ['public'] = false },
	[230] = { ['name'] = "KR32", ['payment'] = false, ['public'] = false },
	[231] = { ['name'] = "KR33", ['payment'] = false, ['public'] = false },
	[232] = { ['name'] = "KR34", ['payment'] = false, ['public'] = false },
	[233] = { ['name'] = "KR35", ['payment'] = false, ['public'] = false },
	[234] = { ['name'] = "KR36", ['payment'] = false, ['public'] = false },
	[235] = { ['name'] = "KR37", ['payment'] = false, ['public'] = false },
	[236] = { ['name'] = "KR38", ['payment'] = false, ['public'] = false },
	[237] = { ['name'] = "KR39", ['payment'] = false, ['public'] = false },
	[238] = { ['name'] = "KR40", ['payment'] = false, ['public'] = false },
	[239] = { ['name'] = "KR41", ['payment'] = false, ['public'] = false },
-----------------------------------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------PALETOBAY-------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------
	[250] = { ['name'] = "PB01", ['payment'] = false, ['public'] = false },
	[251] = { ['name'] = "PB02", ['payment'] = false, ['public'] = false },
	[252] = { ['name'] = "PB03", ['payment'] = false, ['public'] = false },
	[253] = { ['name'] = "PB04", ['payment'] = false, ['public'] = false },
	[254] = { ['name'] = "PB05", ['payment'] = false, ['public'] = false },
	[255] = { ['name'] = "PB06", ['payment'] = false, ['public'] = false },
	[256] = { ['name'] = "PB07", ['payment'] = false, ['public'] = false },
	[257] = { ['name'] = "PB08", ['payment'] = false, ['public'] = false },
	[258] = { ['name'] = "PB09", ['payment'] = false, ['public'] = false },
	[259] = { ['name'] = "PB10", ['payment'] = false, ['public'] = false },
	[260] = { ['name'] = "PB11", ['payment'] = false, ['public'] = false },
	[261] = { ['name'] = "PB12", ['payment'] = false, ['public'] = false },
	[262] = { ['name'] = "PB13", ['payment'] = false, ['public'] = false },
	[263] = { ['name'] = "PB14", ['payment'] = false, ['public'] = false },
	[264] = { ['name'] = "PB15", ['payment'] = false, ['public'] = false },
	[265] = { ['name'] = "PB16", ['payment'] = false, ['public'] = false },
	[266] = { ['name'] = "PB17", ['payment'] = false, ['public'] = false },
	[267] = { ['name'] = "PB18", ['payment'] = false, ['public'] = false },
	[268] = { ['name'] = "PB19", ['payment'] = false, ['public'] = false },
	[269] = { ['name'] = "PB20", ['payment'] = false, ['public'] = false },
	[270] = { ['name'] = "PB21", ['payment'] = false, ['public'] = false },
	[271] = { ['name'] = "PB22", ['payment'] = false, ['public'] = false },
	[272] = { ['name'] = "PB23", ['payment'] = false, ['public'] = false },
	[273] = { ['name'] = "PB24", ['payment'] = false, ['public'] = false },
	[274] = { ['name'] = "PB25", ['payment'] = false, ['public'] = false },
	[275] = { ['name'] = "PB26", ['payment'] = false, ['public'] = false },
	[276] = { ['name'] = "PB27", ['payment'] = false, ['public'] = false },
	[277] = { ['name'] = "PB28", ['payment'] = false, ['public'] = false },
	[278] = { ['name'] = "PB29", ['payment'] = false, ['public'] = false },
	[279] = { ['name'] = "PB30", ['payment'] = false, ['public'] = false },
	[280] = { ['name'] = "PB31", ['payment'] = false, ['public'] = false },
-----------------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------MANSAO------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------
	[291] = { ['name'] = "MS01", ['payment'] = false, ['public'] = false },
	[292] = { ['name'] = "MS02", ['payment'] = false, ['public'] = false },
	[293] = { ['name'] = "MS03", ['payment'] = false, ['public'] = false },
	[294] = { ['name'] = "MS04", ['payment'] = false, ['public'] = false },
	[295] = { ['name'] = "MS05", ['payment'] = false, ['public'] = false },
	[296] = { ['name'] = "MS09", ['payment'] = false, ['public'] = false },
	[297] = { ['name'] = "SS01", ['payment'] = false, ['public'] = false },
	[298] = { ['name'] = "MS08", ['payment'] = false, ['public'] = false },
-----------------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------EMPREGOS------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------
	[300] = { ['name'] = "Taxista", 	 ['payment'] = false, ['perm'] = "garagetaxi.permissao" 		 },
	[301] = { ['name'] = "Motorista", 	 ['payment'] = false, ['perm'] = "livre" 		 },
	--[332] = { ['name'] = "Motorista2", 	 ['payment'] = false, ['perm'] = "livre" 		 },
	[364] = { ['name'] = "Concreto", 	 ['payment'] = false, ['perm'] = "livre" 		 },
	[302] = { ['name'] = "Lixeiro", 	 ['payment'] = false, ['perm'] = "garagelixeiro.permissao" 		 },
	[303] = { ['name'] = "Minerador", 	 ['payment'] = false, ['perm'] = "livre" 	  	 },
	[304] = { ['name'] = "Lenhador", 	 ['payment'] = false, ['perm'] = "livre" 		 },
	--[305] = { ['name'] = "Leiteiro", 	 ['payment'] = false, ['perm'] = "livre"		 },
	[306] = { ['name'] = "Caminhoneiro", ['payment'] = false, ['perm'] = "livre" 	     },
	[307] = { ['name'] = "Advogado", 	 ['payment'] = false, ['public'] = true 		 },
	[308] = { ['name'] = "Bicicletario", ['payment'] = false, ['perm'] = "livre" 		 },
	[309] = { ['name'] = "Bicicleta",    ['payment'] = false, ['perm'] = "livre"     	 },
	--[310] = { ['name'] = "RioLuz", 		 ['payment'] = false, ['perm'] = "livre" 	     },
	--[311] = { ['name'] = "Heliponto", 	 ['payment'] = false, ['perm'] = "heli.permissao"},
	[311] = { ['name'] = "Heliponto", 	 ['payment'] = false, ['perm'] = "heli.permissao"},
-----------------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------ORGS------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------
	--[313] = { ['name'] = "PMESP", 		  ['payment'] = false, ['perm'] = "policia.permissao"     },
	[314] = { ['name'] = "Policia", 		  ['payment'] = false, ['perm'] = "policia.permissao"  },
	--[315] = { ['name'] = "GAM", 	  ['payment'] = false, ['perm'] = "policia.permissao"     },
	[316] = { ['name'] = "OnibusPolicia", ['payment'] = false, ['perm'] = "policia.permissao"      },
	[317] = { ['name'] = "Hospital",          ['payment'] = false, ['perm'] = "paramedico.permissao" },
	[318] = { ['name'] = "HeliHospital", 	  ['payment'] = false, ['perm'] = "paramedico.permissao" },
	--[319] = { ['name'] = "Viaturas", 	  ['payment'] = false, ['perm'] = "policia.permissao"    },
	[320] = { ['name'] = "HeliPolicia",      	  ['payment'] = false, ['perm'] = "policia.permissao"      },
	[321] = { ['name'] = "Mecanico", 	  ['payment'] = false, ['perm'] = "mecanico.permissao"   },
	--[327] = { ['name'] = "PMESP", 		  ['payment'] = false, ['perm'] = "policia.permissao" 	 },
	--[330] = { ['name'] = "Civil", 		  ['payment'] = false, ['perm'] = "pcivil.permissao" 	 },
-----------------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------FACS------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------
	--[322] = { ['name'] = "Desmanche", ['payment'] = false, ['public'] = true },
-----------------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------NOVOS SLOTS------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------
	[323] = { ['name'] = "Helicopteros",  ['payment'] = false, ['perm'] = "pgeral.permissao"},
	[325] = { ['name'] = "Barcos", 		  ['payment'] = false, ['perm'] = "livre" 	     	},
	[326] = { ['name'] = "Barcos", 		  ['payment'] = false, ['perm'] = "livre" 	     	},
	[326] = { ['name'] = "Barcos2", 	  ['payment'] = false, ['perm'] = "livre" 	     	},
	[329] = { ['name'] = "Caminhoneiro",  ['payment'] = false, ['perm'] = "livre" 	     	},
	[334] = { ['name'] = "Caminhoneiro",  ['payment'] = false, ['perm'] = "livre" 	     	},
	[335] = { ['name'] = "Caminhoneiro",  ['payment'] = false, ['perm'] = "livre" 	     	},
	[336] = { ['name'] = "Caminhoneiro",  ['payment'] = false, ['perm'] = "livre" 	     	},
	[337] = { ['name'] = "TaxiAereo", ['payment'] = false, ['perm'] = "livre" },
	--[338] = { ['name'] = "Civil", ['payment'] = false, ['perm'] = "pcivil.permissao" },
	--[339] = { ['name'] = "PMESP", ['payment'] = false, ['perm'] = "policia.permissao" },
	[342] = { ['name'] = "Mun", ['payment'] = false, ['perm'] = "motoclub.permissao" },
	[343] = { ['name'] = "Barcos2", 		  ['payment'] = false, ['perm'] = "livre" },
	[344] = { ['name'] = "Bicicletario", 	  ['payment'] = false, ['perm'] = "livre" },
	[345] = { ['name'] = "Bicicletario", 	  ['payment'] = false, ['perm'] = "livre" },
	[346] = { ['name'] = "Bicicletario", 	  ['payment'] = false, ['perm'] = "livre" },
	[347] = { ['name'] = "Garagem", 		  ['payment'] = false, ['perm'] = "livre" },
	[348] = { ['name'] = "Garagem", 		  ['payment'] = false, ['perm'] = "livre" },
	[349] = { ['name'] = "Garagem", 		  ['payment'] = false, ['perm'] = "livre" },
	[350] = { ['name'] = "Garagem", 		  ['payment'] = false, ['perm'] = "livre" },
	[351] = { ['name'] = "Garagem", 		  ['payment'] = false, ['perm'] = "livre" },
	[352] = { ['name'] = "Garagem", 		  ['payment'] = false, ['perm'] = "livre" },
	[353] = { ['name'] = "Garagem", 		  ['payment'] = false, ['perm'] = "livre" },
	[354] = { ['name'] = "Jetski", 		  ['payment'] = false, ['perm'] = "heli.permissao" 	     	},
	[355] = { ['name'] = "Hangar", 		  ['payment'] = false, ['perm'] = "heli.permissao" 	     	},
	[356] = { ['name'] = "Barcos", 		  ['payment'] = false, ['perm'] = "heli.permissao" 	     	},
	[357] = { ['name'] = "Helicopteros", 		  ['payment'] = false, ['perm'] = "heli.permissao" 	     	},
	[358] = { ['name'] = "Kart", 		  ['payment'] = false, ['perm'] = "livre" 	     	},
	[359] = { ['name'] = "Bicicletario", 		  ['payment'] = false, ['perm'] = "livre" 	     	},
	[360] = { ['name'] = "Quadriciclos", 		  ['payment'] = false, ['perm'] = "livre" 	     	},
	[361] = { ['name'] = "Quadriciclos", 		  ['payment'] = false, ['perm'] = "livre" 	     	},
	[362] = { ['name'] = "Garagem", 		  ['payment'] = false, ['perm'] = "livre" 	     	},
	[363] = { ['name'] = "Bicicletario", 		  ['payment'] = false, ['perm'] = "livre" 	     	},
}
-----------------------------------------------------------------------------------------------------------------------------------------
-- GARAGENS
-----------------------------------------------------------------------------------------------------------------------------------------
local workgarage = {
	
	--["Civil"] = {
	--	"fbi2",
	--	"police",
	--	"riot"
	--},
	["HeliPolicia"] = {
		"polmav"
	},
	["Mun"] = {
		"mule"
	},
	["Hangar"] = {
		"velum2",
		"nimbus",
		"shamal"
	},
	["Helicopteros"] = {
		"polmav"
	},
	["Policia"] = {
		"fbi",
		"policeb1",
		"policeb2",
		"fbi2",
		"police2",
		"sheriff2"
	},

	--[["Viaturas"] = {
		"pmerj",
		"bpchq",
		"versapmerj",
		"corolla",
		"ram",
		"granger",
		"primo",
		"golg7",
		"bmw1200gs"
	},]]
	--["ViaturasS"] = {
	--	"pmerj",
	--	"bpchq",
	--	"versapmerj",
	--	"ram",
	--	"granger",
	--	"primo",
	--	"golg7",
	--	"bmw1200gs"
	--},
	["OnibusPolicia"] = {
		"pbus"
	},
	["Barcos"] = {
		"tropic"
	},
	["Barcos2"] = {
		"tug",
	},
	["Jetski"] = {
		"seashark3",
	},	
	--[[["HeliCivil"] = {
		"as350pc"
	},]]
	["Hospital"] = {
		"ambulance",
		"police3"
	},
	["HeliHospital"] = {
		"polmav2"
	},
	["Mecanico"] = {
		"towtruck",
		"flatbed",
		"flatbed3",
		"rebel2"
	},
	["Taxista"] = {
		"taxi"
	},
	["Motorista"] = {
		"bus"
	},
	["Concreto"] = {
		"mixer"		
	},
	["Lixeiro"] = {
		"trash"
	},
	["Minerador"] = {
		"tiptruck"
	},
	["Lenhador"] = {
		"ratloader"
	},
	["Caminhoneiro"] = {
		"phantom",
		"packer",
		"hauler"
	},
	["TaxiAereo"] = {
		"velum2"
	},
	["Bicicletario"] = {
		"scorcher",
		"tribike3",
		"cruiser",
		"bmx"
	},
	["Quadriciclos"] = {
		"blazer"
	},
	["Heliponto"] = {
		"volatus",
		"supervolito"
	},
	["Kart"] = {
		"dune"
	},
}
-----------------------------------------------------------------------------------------------------------------------------------------
-- MYVEHICLES
-----------------------------------------------------------------------------------------------------------------------------------------
function src.myVehicles(work)
	local source = source
	local user_id = vRP.getUserId(source)
	local myvehicles = {}
	local ipva = ""
	local status = ""
	if user_id then
		if workgarage[work] then
			for k,v in pairs(workgarage) do
				if k == work then
					for k2,v2 in pairs(v) do
						status = "<span class=\"green\">"..k.."</span>"
						ipva = "<span class=\"green\">Pago</span>"
						table.insert(myvehicles,{ name = v2, name2 = vRP.vehicleName(v2), engine = 100, body = 100, fuel = 100, status = status, ipva = ipva })
					end
				end
			end
			return myvehicles
		else
			local vehicle = vRP.query("creative/get_vehicle",{ user_id = parseInt(user_id) })
			local address = vRP.query("homes/get_homeuserid",{ user_id = parseInt(user_id) })
			if #address > 0 then
				for k,v in pairs(address) do
					if v.home == work then
						for k2,v2 in pairs(vehicle) do
							if parseInt(os.time()) <= parseInt(vehicle[k2].time+24*60*60) then
								--status = "<span class=\"red\">$"..vRP.format(parseInt(vRP.vehiclePrice(vehicle[k2].vehicle)*0.5)).."</span>"
								status = "<span class=\"red\">$"..vRP.format(parseInt(vRP.vehiclePrice(vehicle[k2].vehicle)*0.1)).."</span>"
							elseif vehicle[k2].detido == 1 then
								status = "<span class=\"orange\">$"..vRP.format(parseInt(vRP.vehiclePrice(vehicle[k2].vehicle)*0.01)).."</span>"
							else
								status = "<span class=\"green\">Gratuita</span>"
							end

							if parseInt(os.time()) >= parseInt(vehicle[k2].ipva+24*15*60*60) then
								ipva = "<span class=\"red\">Atrasado</span>"
							else
								ipva = "<span class=\"green\">Pago</span>"
							end
							table.insert(myvehicles,{ name = vehicle[k2].vehicle, name2 = vRP.vehicleName(vehicle[k2].vehicle), engine = parseInt(vehicle[k2].engine*0.1), body = parseInt(vehicle[k2].body*0.1), fuel = parseInt(vehicle[k2].fuel), status = status, ipva = ipva })
						end
						return myvehicles
					else
						for k2,v2 in pairs(vehicle) do
							if parseInt(os.time()) <= parseInt(vehicle[k2].time+24*60*60) then
								--status = "<span class=\"red\">$"..vRP.format(parseInt(vRP.vehiclePrice(vehicle[k2].vehicle)*0.5)).."</span>"
								status = "<span class=\"red\">$"..vRP.format(parseInt(vRP.vehiclePrice(vehicle[k2].vehicle)*0.1)).."</span>"
							elseif vehicle[k2].detido == 1 then
								status = "<span class=\"orange\">$"..vRP.format(parseInt(vRP.vehiclePrice(vehicle[k2].vehicle)*0.05)).."</span>"
							else
								status = "<span class=\"green\">$"..vRP.format(parseInt(vRP.vehiclePrice(vehicle[k2].vehicle)*0.005)).."</span>"
							end

							if parseInt(os.time()) >= parseInt(vehicle[k2].ipva+24*15*60*60) then
								ipva = "<span class=\"red\">Atrasado</span>"
							else
								ipva = "<span class=\"green\">Pago</span>"
							end
							table.insert(myvehicles,{ name = vehicle[k2].vehicle, name2 = vRP.vehicleName(vehicle[k2].vehicle), engine = parseInt(vehicle[k2].engine*0.1), body = parseInt(vehicle[k2].body*0.1), fuel = parseInt(vehicle[k2].fuel), status = status, ipva = ipva })
						end
						return myvehicles
					end
				end
			else
				for k,v in pairs(vehicle) do
					if parseInt(os.time()) <= parseInt(vehicle[k].time+24*60*60) then
						--status = "<span class=\"red\">$"..vRP.format(parseInt(vRP.vehiclePrice(vehicle[k].vehicle)*0.5)).."</span>"
						status = "<span class=\"red\">$"..vRP.format(parseInt(vRP.vehiclePrice(vehicle[k].vehicle)*0.1)).."</span>"
					elseif vehicle[k].detido == 1 then
						status = "<span class=\"orange\">$"..vRP.format(parseInt(vRP.vehiclePrice(vehicle[k].vehicle)*0.05)).."</span>"
					else
						status = "<span class=\"green\">$"..vRP.format(parseInt(vRP.vehiclePrice(vehicle[k].vehicle)*0.005)).."</span>"
					end

					if parseInt(os.time()) >= parseInt(vehicle[k].ipva+24*15*60*60) then
						ipva = "<span class=\"red\">Atrasado</span>"
					else
						ipva = "<span class=\"green\">Pago</span>"
					end
					table.insert(myvehicles,{ name = vehicle[k].vehicle, name2 = vRP.vehicleName(vehicle[k].vehicle), engine = parseInt(vehicle[k].engine*0.1), body = parseInt(vehicle[k].body*0.1), fuel = parseInt(vehicle[k].fuel), status = status, ipva = ipva })
				end
				return myvehicles
			end
		end
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- SPAWNVEHICLES
-----------------------------------------------------------------------------------------------------------------------------------------
function src.spawnVehicles(name,use)
	if name then
		local source = source
		local user_id = vRP.getUserId(source)
		if user_id then
			local identity = vRP.getUserIdentity(user_id)
			local value = vRP.getUData(parseInt(user_id),"vRP:multas")
			local multas = json.decode(value) or 0
			if multas >= 5000 then
				TriggerClientEvent("Notify",source,"negado","Você tem multas pendentes.",10000)
				return true
			end
			if not vCLIENT.returnVehicle(source,name) then
				local vehicle = vRP.query("creative/get_vehicles",{ user_id = parseInt(user_id), vehicle = name })
				local tuning = vRP.getSData("custom:u"..user_id.."veh_"..name) or {}
				local custom = json.decode(tuning) or {}
				if vehicle[1] ~= nil then
					if parseInt(os.time()) <= parseInt(vehicle[1].time+24*60*60) then
						--local ok = vRP.request(source,"Veículo na retenção, deseja acionar o seguro pagando <b>$"..vRP.format(parseInt(vRP.vehiclePrice(name)*0.5)).."</b> dólares ?",60)
						local ok = vRP.request(source,"Veículo na retenção, deseja acionar o seguro pagando <b>R$"..vRP.format(parseInt(vRP.vehiclePrice(name)*0.1)).."</b> reais ?",60)
						if ok then
							if vRP.tryFullPayment(user_id,parseInt(vRP.vehiclePrice(name)*0.1)) then
								vRP.execute("creative/set_detido",{ user_id = parseInt(user_id), vehicle = name, detido = 0, time = 0 })
								TriggerClientEvent("Notify",source,"sucesso","Veículo liberado.",10000)
							else
								TriggerClientEvent("Notify",source,"negado","Dinheiro insuficiente.",10000)
							end
						end
					elseif parseInt(vehicle[1].detido) >= 1 then
						local ok = vRP.request(source,"Veículo na detenção, deseja acionar o seguro pagando <b>R$"..vRP.format(parseInt(vRP.vehiclePrice(name)*0.1)).."</b> reais ?",60)
						if ok then
							if vRP.tryFullPayment(user_id,parseInt(vRP.vehiclePrice(name)*0.1)) then
								vRP.execute("creative/set_detido",{ user_id = parseInt(user_id), vehicle = name, detido = 0, time = 0 })
								TriggerClientEvent("Notify",source,"sucesso","Veículo liberado.",10000)
							else
								TriggerClientEvent("Notify",source,"negado","Dinheiro insuficiente.",10000)
							end
						end
					else
						if parseInt(os.time()) <= parseInt(vehicle[1].ipva+24*15*60*60) then
							if garages[use].payment then
								if vRP.vehicleType(tostring(name)) == "exclusive" or vRP.vehicleType(tostring(name)) == "rental" then
									local spawnveh,vehid = vCLIENT.spawnVehicle(source,name,vehicle[1].engine,vehicle[1].body,vehicle[1].fuel,custom)
									vehlist[vehid] = { parseInt(user_id),name }
									TriggerEvent("setPlateEveryone",identity.registration)
									TriggerClientEvent("Notify",source,"sucesso","Veículo <b>Exclusivo ou Alugado</b>, Não será cobrado a taxa de liberação.",10000)
								end
								if (vRP.getBankMoney(user_id)+vRP.getMoney(user_id)) >= parseInt(vRP.vehiclePrice(name)*0.05 and not vRP.vehicleType(tostring(name)) == "exclusive" or vRP.vehicleType(tostring(name)) == "rental") then
									local spawnveh,vehid = vCLIENT.spawnVehicle(source,name,vehicle[1].engine,vehicle[1].body,vehicle[1].fuel,custom)
									if spawnveh and vRP.tryFullPayment(user_id,parseInt(vRP.vehiclePrice(name)*0.03)) then
										vehlist[vehid] = { parseInt(user_id),name }
										TriggerEvent("setPlateEveryone",identity.registration)
									end
								else
									TriggerClientEvent("Notify",source,"negado","Dinheiro insuficiente.",10000)
								end
							else
								local spawnveh,vehid = vCLIENT.spawnVehicle(source,name,vehicle[1].engine,vehicle[1].body,vehicle[1].fuel,custom,parseInt(vehicle[1].colorR),parseInt(vehicle[1].colorG),parseInt(vehicle[1].colorB),parseInt(vehicle[1].color2R),parseInt(vehicle[1].color2G),parseInt(vehicle[1].color2B),false)
								if spawnveh then
									vehlist[vehid] = { user_id,name }
									TriggerEvent("setPlateEveryone",identity.registration)
								end
							end
						else
							if vRP.vehicleType(tostring(name)) == "exclusive" or vRP.vehicleType(tostring(name)) == "rental" then
								local ok = vRP.request(source,"Deseja pagar o <b>IPVA</b> do veículo <b>"..vRP.vehicleName(name).."</b> por <b>R$"..vRP.format(parseInt(vRP.vehiclePrice(name)*0.00)).."</b> reais?",60)
								if ok then
									if vRP.tryFullPayment(user_id,parseInt(vRP.vehiclePrice(name)*0.00)) then
										vRP.execute("creative/set_ipva",{ user_id = parseInt(user_id), vehicle = name, ipva = parseInt(os.time()) })
										TriggerClientEvent("Notify",source,"sucesso","Pagamento do <b>IPVA</b> conclúido com sucesso.",10000)
										SendWebhookMessage(webhookipva,"```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[IPVA]: "..vname.." [ID]: "..puser_id.." \n[VALOR]: $"..vRP.format(parseInt(vRP.vehiclePrice(vname)*0.1)).." "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
									else
										TriggerClientEvent("Notify",source,"negado","Dinheiro insuficiente.",10000)
									end
								end
							else
								local price_tax = parseInt(vRP.vehiclePrice(name)*0.05)
								--local price_tax = parseInt(vRP.vehiclePrice(name)*0.05) --isenção de Taxa
								if price_tax > 100000 then
									price_tax = 100000
								end
								local ok = vRP.request(source,"Deseja pagar o <b>IPVA</b> do veículo <b>"..vRP.vehicleName(name).."</b> por <b>R$"..vRP.format(price_tax).."</b> reais?",60)
								if ok then
									if vRP.tryFullPayment(user_id,price_tax) then
										vRP.execute("creative/set_ipva",{ user_id = parseInt(user_id), vehicle = name, ipva = parseInt(os.time()) })
										TriggerClientEvent("Notify",source,"sucesso","Pagamento do <b>IPVA</b> conclúido com sucesso.",10000)
										SendWebhookMessage(webhookipva,"```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[IPVA]: "..vname.." [ID]: "..user_id.." \n[VALOR]: $"..vRP.format(parseInt(vRP.vehiclePrice(vname)*0.1)).." "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
									else
										TriggerClientEvent("Notify",source,"negado","Dinheiro insuficiente.",10000)
									end
								end
							end
						end
					end
				else
					local spawnveh,vehid = vCLIENT.spawnVehicle(source,name,1000,1000,100,custom,0,0,0,0,0,0,true)
					if spawnveh then
						vehlist[vehid] = { user_id,name }
						TriggerEvent("setPlateEveryone",identity.registration)
					end
				end
			else
				TriggerClientEvent("Notify",source,"aviso","Já possui um veículo deste modelo fora da garagem.",10000)
			end
		end
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- DELETEVEHICLES
-----------------------------------------------------------------------------------------------------------------------------------------
function src.deleteVehicles()
	local source = source
	local user_id = vRP.getUserId(source)
	if user_id then
		local vehicle = vRPclient.getNearestVehicle(source,30)
		if vehicle then
			vCLIENT.deleteVehicle(source,vehicle)
		end
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- VEHPRICE
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterServerEvent("desmancheVehicles2025")
AddEventHandler("desmancheVehicles2025",function()
	local source = source
	local user_id = vRP.getUserId(source)
	if user_id then
		local vehicle,vnetid,placa,vname,lock,banned = vRPclient.vehList(source,7)
		if vehicle and placa then
			local puser_id = vRP.getUserByRegistration(placa)
			if puser_id then
				vRP.execute("creative/set_detido",{ user_id = parseInt(puser_id), vehicle = vname, detido = 1, time = parseInt(os.time()) })
				vRP.giveInventoryItem(user_id,"dinheirosujo",parseInt(vRP.vehiclePrice(vname)*0.10)) -- % do valor do veiculo que e dado
				vRP.giveInventoryItem(user_id,"chave",1)
				TriggerClientEvent("Notify",source,"sucesso","Você recebeu <b>1</b> chave de carro.")
				vCLIENT.deleteVehicle(source,vehicle)
				local identity = vRP.getUserIdentity(user_id)
				SendWebhookMessage(webhookdesmanche,"```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[DESMANCHOU]: "..vname.." [ID]: "..puser_id.." \n[VALOR]: $"..vRP.format(parseInt(vRP.vehiclePrice(vname)*0.1)).." "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- DV
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('dv',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if vRP.hasPermission(user_id,"admin.permissao") or vRP.hasPermission(user_id,"mecanico.permissao") or vRP.hasPermission(user_id,"conce.permissao") then
		local vehicle = vRPclient.getNearestVehicle(source,7)
		if vehicle then
			vCLIENT.deleteVehicle(source,vehicle)
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- VEHICLELOCK
-----------------------------------------------------------------------------------------------------------------------------------------
function src.vehicleLock()
	local source = source
	local user_id = vRP.getUserId(source)
	if user_id then
		local vehicle,vnetid,placa,vname,lock,banned = vRPclient.vehList(source,7)
		if vehicle and placa then
			local placa_user_id = vRP.getUserByRegistration(placa)
			if user_id == placa_user_id then
				vCLIENT.vehicleClientLock(-1,vnetid,lock)
				TriggerClientEvent("vrp_sound:source",source,'lock',0.5)
				vRPclient.playAnim(source,true,{{"anim@mp_player_intmenu@key_fob@","fob_click"}},false)
				if lock == 1 then
					TriggerClientEvent("Notify",source,"importante","Você <b>TRAVOU</b> o veículo.",8000)
				else
					TriggerClientEvent("Notify",source,"aviso","Você <b>DESTRAVOU</b> o veículo.",8000)
				end
			end
		end
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- TRYDELETE
-----------------------------------------------------------------------------------------------------------------------------------------
function src.tryDelete(vehid,vehengine,vehbody,vehfuel)
	if vehlist[vehid] and vehid ~= 0 then
		local user_id = vehlist[vehid][1]
		local vehname = vehlist[vehid][2]
		local player = vRP.getUserSource(user_id)
		if player then
			vCLIENT.syncNameDelete(player,vehname)
		end

		if vehengine <= 100 then
			vehengine = 100
		end

		if vehbody <= 100 then
			vehbody = 100
		end

		if vehfuel >= 100 then
			vehfuel = 100
		end

		local vehicle = vRP.query("creative/get_vehicles",{ user_id = parseInt(user_id), vehicle = vehname })
		if vehicle[1] ~= nil then
			vRP.execute("creative/set_update_vehicles",{ user_id = parseInt(user_id), vehicle = vehname, engine = parseInt(vehengine), body = parseInt(vehbody), fuel = parseInt(vehfuel) })
		end
	end
	vCLIENT.syncVehicle(-1,vehid)
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- TRYDELETEVEH
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterServerEvent("trydeleteveh")
AddEventHandler("trydeleteveh",function(vehid)
	vCLIENT.syncVehicle(-1,vehid)
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- RETURNHOUSES
-----------------------------------------------------------------------------------------------------------------------------------------
function src.returnHouses(nome,garage)
	local source = source
	local user_id = vRP.getUserId(source)
	if user_id then
		if not vRP.searchReturn(source,user_id) then
			local address = vRP.query("homes/get_homeuserid",{ user_id = parseInt(user_id) })
			if #address > 0 then
				for k,v in pairs(address) do
					if v.home == garages[garage].name then
						if parseInt(v.garage) == 1 then
							local resultOwner = vRP.query("homes/get_homeuseridowner",{ home = tostring(nome) })
							if resultOwner[1] then
								--if not vRP.hasGroup(user_id,"Platina") then
									if parseInt(os.time()) >= parseInt(resultOwner[1].tax+24*15*60*60) then
										TriggerClientEvent("Notify",source,"aviso","O <b>IPTU</b> da residência está atrasada.",10000)
										return false
									else
										vCLIENT.openGarage(source,nome,garage)
									end
								--end
							end
						end
					end
				end
			end
			if garages[garage].perm == "livre" then
				return vCLIENT.openGarage(source,nome,garage)
			elseif garages[garage].perm then
				if vRP.hasPermission(user_id,garages[garage].perm) then
					return vCLIENT.openGarage(source,nome,garage)
				end
			elseif garages[garage].public then
				return vCLIENT.openGarage(source,nome,garage)
			end
		end
		return false
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- VEHICLE ANCORAR
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('travar',function(source,args,rawCommand)
	local source = source
	local user_id = vRP.getUserId(source)
	if user_id then
		if vRP.hasPermission(user_id,"policia.permissao") or vRP.hasPermission(user_id,"conce.permissao") then
			if vRPclient.isInVehicle(source) then
				local vehicle,vnetid,placa,vname,lock,banned = vRPclient.vehList(source,7)
				if vehicle then
					TriggerClientEvent("progress",source,5000,"travar/destravar")
					SetTimeout(5000,function()
						vCLIENT.vehicleAnchor(source,vehicle)
					end)
				end
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- BOAT ANCORAR
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('ancorar',function(source,args,rawCommand)
	local source = source
	local user_id = vRP.getUserId(source)
	if user_id then
		if vRPclient.isInVehicle(source) then
			local vehicle,vnetid,placa,vname,lock,banned = vRPclient.vehList(source,7)
			if vehicle then
				vCLIENT.boatAnchor(source,vehicle)
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- POLICEALERT
-----------------------------------------------------------------------------------------------------------------------------------------
function src.policeAlert()
	local source = source
	local user_id = vRP.getUserId(source)
	if user_id then
		local vehicle,vnetid,placa,vname,lock,banned,trunk,model,street = vRPclient.vehList(source,7)
		if vehicle then
			if math.random(100) >= 50 then
				local policia = vRP.getUsersByPermission("policia.permissao")
				local x,y,z = vRPclient.getPosition(source)
				for k,v in pairs(policia) do
					local player = vRP.getUserSource(parseInt(v))
					if player then
						async(function()
							local id = idgens:gen()
							TriggerClientEvent('chatMessage',player,"911",{64,64,255},"Roubo na ^1"..street.."^0 do veículo ^1"..model.."^0 de placa ^1"..placa.."^0 verifique o ocorrido.")
							police[id] = vRPclient.addBlip(player,x,y,z,304,3,"Ocorrência",0.6,false)
							SetTimeout(60000,function() vRPclient.removeBlip(player,police[id]) idgens:free(id) end)
						end)
					end
				end
			end
		end
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- CAR
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('car',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if user_id then
		local identity = vRP.getUserIdentity(user_id)
		if vRP.hasPermission(user_id,"admin.permissao") then
			if args[1] then
				SendWebhookMessage(webhookcar,"```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[SPAWNOU]: "..(args[1]).." "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
				TriggerClientEvent('spawnarveiculo',source,args[1])
				TriggerEvent("setPlateEveryone",identity.registration)
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- VEHS
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('vehs',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if user_id then
		if args[1] and parseInt(args[2]) > 0 then
			local nplayer = vRP.getUserSource(parseInt(args[2]))
			local myvehicles = vRP.query("creative/get_vehicles",{ user_id = parseInt(user_id), vehicle = tostring(args[1]) })
			if myvehicles[1] then
				if vRP.vehicleType(tostring(args[1])) == "exclusive" or vRP.vehicleType(tostring(args[1])) == "rental" and not vRP.hasPermission(user_id,"admin.permissao") then
					TriggerClientEvent("Notify",source,"negado","<b>"..vRP.vehicleName(tostring(args[1])).."</b> não pode ser transferido por ser um veículo <b>Exclusivo ou Alugado</b>.",10000)
				else
					local identity = vRP.getUserIdentity(parseInt(args[2]))
					local identity2 = vRP.getUserIdentity(user_id)
					local price = tonumber(sanitizeString(vRP.prompt(source,"Valor:",""),"\"[]{}+=?!_()#@%/\\|,.",false))			
					if vRP.request(source,"Deseja vender um <b>"..vRP.vehicleName(tostring(args[1])).."</b> para <b>"..identity.name.." "..identity.firstname.."</b> por <b>$"..vRP.format(parseInt(price)).."</b> reais ?",30) then	
						if vRP.request(nplayer,"Aceita comprar um <b>"..vRP.vehicleName(tostring(args[1])).."</b> de <b>"..identity2.name.." "..identity2.firstname.."</b> por <b>$"..vRP.format(parseInt(price)).."</b> reais ?",30) then
							local vehicle = vRP.query("creative/get_vehicles",{ user_id = parseInt(args[2]), vehicle = tostring(args[1]) })
							if parseInt(price) > 0 then
								if vRP.tryFullPayment(parseInt(args[2]),parseInt(price)) then
									if vehicle[1] then
										TriggerClientEvent("Notify",source,"negado","<b>"..identity.name.." "..identity.firstname.."</b> já possui este modelo de veículo.",10000)
									else
										vRP.execute("creative/move_vehicle",{ user_id = parseInt(user_id), nuser_id = parseInt(args[2]), vehicle = tostring(args[1]) })

										local custom = vRP.getSData("custom:u"..parseInt(user_id).."veh_"..tostring(args[1]))
										local custom2 = json.decode(custom)
										if custom2 then
											vRP.setSData("custom:u"..parseInt(args[2]).."veh_"..tostring(args[1]),json.encode(custom2))
											vRP.execute("creative/rem_srv_data",{ dkey = "custom:u"..parseInt(user_id).."veh_"..tostring(args[1]) })
										end

										local chest = vRP.getSData("chest:u"..parseInt(user_id).."veh_"..tostring(args[1]))
										local chest2 = json.decode(chest)
										if chest2 then
											vRP.setSData("chest:u"..parseInt(args[2]).."veh_"..tostring(args[1]),json.encode(chest2))
											vRP.execute("creative/rem_srv_data",{ dkey = "chest:u"..parseInt(user_id).."veh_"..tostring(args[1]) })
										end

										TriggerClientEvent("Notify",source,"sucesso","Você Vendeu <b>"..vRP.vehicleName(tostring(args[1])).."</b> e Recebeu <b>$"..vRP.format(parseInt(price)).."</b> reais.",20000)
										TriggerClientEvent("Notify",nplayer,"importante","Você recebeu as chaves do veículo <b>"..vRP.vehicleName(tostring(args[1])).."</b> de <b>"..identity2.name.." "..identity2.firstname.."</b> e pagou <b>R$"..vRP.format(parseInt(price)).."</b> reais.",40000)
											vRPclient.playSound(source,"Hack_Success","DLC_HEIST_BIOLAB_PREP_HACKING_SOUNDS")
											vRPclient.playSound(nplayer,"Hack_Success","DLC_HEIST_BIOLAB_PREP_HACKING_SOUNDS")
											vRP.giveMoney(user_id,(parseInt(resultado + price)))
											SendWebhookMessage(webhookvehs,"```prolog\n[ID]: "..user_id.." "..identity2.name.." "..identity2.firstname.." \n[VENDEU]: "..vRP.vehicleName(tostring(args[1])).." \n[PARA]: "..(args[2]).." "..identity.name.." "..identity.firstname.." \n[VALOR]: $"..vRP.format(parseInt(price)).." "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
										end
									else
										TriggerClientEvent("Notify",nplayer,"negado","Dinheiro insuficiente.",8000)
										TriggerClientEvent("Notify",source,"negado","Dinheiro insuficiente.",8000)
									end
								end	
							end
						end
					end
				end
			else
				local vehicle = vRP.query("creative/get_vehicle",{ user_id = parseInt(user_id) })
				if #vehicle > 0 then 
	                local car_names = {}
	                for k,v in pairs(vehicle) do
	                	table.insert(car_names, "<b>" .. vRP.vehicleName(v.vehicle) .. "</b> ("..v.vehicle..")")
	                    --TriggerClientEvent("Notify",source,"importante","<b>Modelo:</b> "..v.vehicle,10000)
	                end
	                car_names = table.concat(car_names, ", ")
	                TriggerClientEvent("Notify",source,"importante","Seus veículos: " .. car_names, 20000)
				else 
					TriggerClientEvent("Notify",source,"importante","Você não possui nenhum veículo.",20000)
				end
			end
		end
	end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- REPARAR
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterServerEvent("tryreparar")
AddEventHandler("tryreparar",function(nveh)
	TriggerClientEvent("syncreparar",-1,nveh)
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- MOTOR
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterServerEvent("trymotor")
AddEventHandler("trymotor",function(nveh)
	TriggerClientEvent("syncmotor",-1,nveh)
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- SAVELIVERY
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('savelivery',function(source,args,rawCommand)
	local source = source
	local user_id = vRP.getUserId(source)
	if vRP.hasPermission(user_id,"admin.permissao") then
		local vehicle,vnetid,placa,vname = vRPclient.vehList(source,7)
		if vehicle and placa then
			local puser_id = vRP.getUserByRegistration(placa)
			if puser_id then
				local custom = json.decode(vRP.getSData("custom:u"..parseInt(puser_id).."veh_"..vname))
				local livery = vCLIENT.returnlivery(source,livery)
				custom.liveries = livery
				print(json.encode(custom))
				vRP.setSData("custom:u"..parseInt(puser_id).."veh_"..vname,json.encode(custom))	
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- CHECK LIVERY PERMISSION
-----------------------------------------------------------------------------------------------------------------------------------------
function src.CheckLiveryPermission()
	local source = source
	local user_id = vRP.getUserId(source)
	return vRP.hasPermission(user_id,"admin.permissao") 
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- HASH
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('hash',function(source,args,rawCommand)
    local user_id = vRP.getUserId(source)
    if vRP.hasPermission(user_id,"admin.permissao") then
        local vehassh = vCLIENT.getHash(source,vehiclehash)
        vRP.prompt(source,"Hash:",""..vehassh)
    end
end)