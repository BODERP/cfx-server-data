local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")
emP = {}
Tunnel.bindInterface("emp_caminhao",emP)
-----------------------------------------------------------------------------------------------------------------------------------------
-- VARIAVEIS
-----------------------------------------------------------------------------------------------------------------------------------------
local gasolina = 1
local carros = 1
local show = 1
local madeira = 1
local diesel = 1
-----------------------------------------------------------------------------------------------------------------------------------------
-- PAYLIST
-----------------------------------------------------------------------------------------------------------------------------------------
local paylist = {
	["diesel"] = {
		[1] = { pay = math.random(1250,1350) },
		[2] = { pay = math.random(1200,1300) },
		[3] = { pay = math.random(1200,1300) },
		[4] = { pay = math.random(1380,1480) },
		[5] = { pay = math.random(2150,2250) },
		[6] = { pay = math.random(1150,1250) }
	},
	["gasolina"] = {
		[1] = { pay = math.random(1500,1600) },
		[2] = { pay = math.random(940,1040) },
		[3] = { pay = math.random(800,900) },
		[4] = { pay = math.random(490,590) },
		[5] = { pay = math.random(450,550) },
		[6] = { pay = math.random(600,700) },
		[7] = { pay = math.random(900,1000) }
		--[8] = { pay = math.random(360,460) },  -- Sem Valor Alterado
		--[9] = { pay = math.random(430,500) },
		--[10] = { pay = math.random(1040,1150) },
		--[11] = { pay = math.random(1090,1190) },
		--[12] = { pay = math.random(870,970) }
	},
	["carros"] = {
		[1] = { pay = math.random(720,820) },
		[2] = { pay = math.random(520,620) },
		[3] = { pay = math.random(660,760) },
		[4] = { pay = math.random(560,660) },
		[5] = { pay = math.random(1150,1250) },
		[6] = { pay = math.random(500,600) }
	},
	["madeira"] = {
		[1] = { pay = math.random(1850,1950) },
		[2] = { pay = math.random(1320,1420) },
		[3] = { pay = math.random(450,550) },
		[4] = { pay = math.random(660,760) }
	},
	["show"] = {
		[1] = { pay = math.random(1280,1380) },
		[2] = { pay = math.random(740,840) },
		[3] = { pay = math.random(800,900) },
		[4] = { pay = math.random(460,500) }
	}
}
-----------------------------------------------------------------------------------------------------------------------------------------
-- CHECKPAYMENT
-----------------------------------------------------------------------------------------------------------------------------------------
function emP.checkPayment(id,mod,health)
	local source = source
	local user_id = vRP.getUserId(source)
	if user_id then
		vRP.giveMoney(user_id,parseInt(paylist[mod][id].pay+(health-700)))
		TriggerClientEvent("vrp_sound:source",source,'coins',0.5)
		TriggerClientEvent("Notify",source,"sucesso","Você recebeu <b>$"..vRP.format(parseInt(paylist[mod][id].pay+(health-700))).." dólares</b>.")
		if mod == "carros" then
			local value = vRP.getSData("meta:concessionaria")
			local metas = json.decode(value) or 0
			if metas then
				vRP.setSData("meta:concessionaria",json.encode(parseInt(metas+1)))
			end
		end
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- TIMERS
-----------------------------------------------------------------------------------------------------------------------------------------
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(300000)
		diesel = math.random(#paylist["diesel"])
		gasolina = math.random(#paylist["gasolina"])
		carros = math.random(#paylist["carros"])
		madeira = math.random(#paylist["madeira"])
		show = math.random(#paylist["show"])
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- GETTRUCKPOINT
-----------------------------------------------------------------------------------------------------------------------------------------
function emP.getTruckpoint(point)
	if point == "diesel" then
		return parseInt(diesel)
	elseif point == "gasolina" then
		return parseInt(gasolina)
	elseif point == "carros" then
		return parseInt(carros)
	elseif point == "madeira" then
		return parseInt(madeira)
	elseif point == "show" then
		return parseInt(show)
	end
end