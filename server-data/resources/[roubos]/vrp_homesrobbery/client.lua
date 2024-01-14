-----------------------------------------------------------------------------------------------------------------------------------------
-- VRP
-----------------------------------------------------------------------------------------------------------------------------------------
local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")
-----------------------------------------------------------------------------------------------------------------------------------------
-- CONEXÃO
-----------------------------------------------------------------------------------------------------------------------------------------
src = {}
Tunnel.bindInterface("vrp_homesrobbery",src)
vSERVER = Tunnel.getInterface("vrp_homesrobbery")
-----------------------------------------------------------------------------------------------------------------------------------------
-- VARIAVEIS
-----------------------------------------------------------------------------------------------------------------------------------------
local check = {}
local locker = nil
local robberys = false
local houseName = ""
-----------------------------------------------------------------------------------------------------------------------------------------
-- HOUSES
-----------------------------------------------------------------------------------------------------------------------------------------
local houses = {
-----------------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------SAMIR-------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------	
	["LS01"] = {
		["invasion"] = { 1295.84,-590.20,71.74 },
		["evasion"] = { 1296.07,-596.39,67.83 },
		["disneylandia01"] = { 1299.78,-586.13,67.38 },
		["disneylandia02"] = { 1298.58,-586.03,67.21 },
		["disneylandia03"] = { 1297.01,-587.09,67.15 },
		["disneylandia04"] = { 1293.09,-585.51,67.24 },
		["disneylandia05"] = { 1295.17,-576.72,67.20 },
		["disneylandia06"] = { 1302.34,-580.65,67.15 },
		["disneylandia07"] = { 1305.35,-586.40,67.35 },
		["disneylandia08"] = { 1307.16,-586.10,67.21 },
		["disneylandia09"] = { 1305.44,-581.10,67.24 },
		["disneylandia10"] = { 1303.88,-579.68,67.28 },
		["locker"] = { 1306.49,-579.36,67.84,336.50 }
	},
	["LS02"] = {
		["invasion"] = { 1316.2,-598.27,73.25 },
		["evasion"] = { 1314.50,-601.42,67.83 },
		["disneylandia01"] = { 1318.3,-590.95,67.34 },
		["disneylandia02"] = { 1317.11,-590.86,67.22 },
		["disneylandia03"] = { 1315.53,-591.92,67.16 },
		["disneylandia04"] = { 1311.61,-590.34,67.25 },
		["disneylandia05"] = { 1313.69,-581.55,67.20 },
		["disneylandia06"] = { 1320.85,-585.48,67.15 },
		["disneylandia07"] = { 1323.88,-591.23,67.36 },
		["disneylandia08"] = { 1325.68,-590.93,67.22 },
		["disneylandia09"] = { 1323.97,-585.93,67.25 },
		["disneylandia10"] = { 1322.41,-584.51,67.29 },
		["locker"] = { 1325.03,-584.21,67.84,336.10 }
	},
	["LS03"] = {
		["invasion"] = { 1330.84,-608.3,74.51 },
		["evasion"] = { 1330.62,-615.92,67.83 },
		["disneylandia01"] = { 1336.65,-606.41,67.33 },
		["disneylandia02"] = { 1335.51,-606.06,67.21 },
		["disneylandia03"] = { 1333.75,-606.75,67.15 },
		["disneylandia04"] = { 1330.26,-604.37,67.24 },
		["disneylandia05"] = { 1334.20,-596.23,67.20 },
		["disneylandia06"] = { 1340.34,-601.62,67.15 },
		["disneylandia07"] = { 1342.04,-607.89,67.35 },
		["disneylandia08"] = { 1343.87,-607.99,67.21 },
		["disneylandia09"] = { 1343.28,-602.73,67.24 },
		["disneylandia10"] = { 1342.06,-601.01,67.28 },
		["locker"] = { 1344.7,-601.28,67.84,323.59 }
	},
	["LS04"] = {
		["invasion"] = { 1366.98,-623.39,74.72 },
		["evasion"] = { 1367.08,-626.54,67.83 },
		["disneylandia01"] = { 1366.27,-615.35,67.33 },
		["disneylandia02"] = { 1365.15,-615.75,67.21 },
		["disneylandia03"] = { 1364.14,-617.35,67.15 },
		["disneylandia04"] = { 1359.91,-617.50,67.24 },
		["disneylandia05"] = { 1358.25,-608.62,67.20 },
		["disneylandia06"] = { 1366.40,-609.31,67.15 },
		["disneylandia07"] = { 1371.49,-613.35,67.35 },
		["disneylandia08"] = { 1373.01,-612.34,67.21 },
		["disneylandia09"] = { 1369.42,-608.46,67.24 },
		["disneylandia10"] = { 1367.42,-607.79,67.28 },
		["locker"] = { 1369.7,-606.46,67.84,0.0 }
	},
	["LS05"] = {
		["invasion"] = { 1399.4,-603.91,74.49 },
		["evasion"] = { 1381.58,-593.49,67.83 },
		["disneylandia01"] = { 1390.98,-599.85,67.33 },
		["disneylandia02"] = { 1391.36,-598.71,67.21 },
		["disneylandia03"] = { 1390.71,-596.93,67.15 },
		["disneylandia04"] = { 1393.18,-593.50,67.24 },
		["disneylandia05"] = { 1401.22,-597.64,67.20 },
		["disneylandia06"] = { 1395.68,-603.65,67.15 },
		["disneylandia07"] = { 1389.37,-605.20,67.35 },
		["disneylandia08"] = { 1389.23,-607.02,67.21 },
		["disneylandia09"] = { 1394.50,-606.56,67.24 },
		["disneylandia10"] = { 1396.25,-605.39,67.28 },
		["locker"] = { 1395.92,-608.0,67.84,232.21 }
	},
	["LS06"] = {
		["invasion"] = { 1404.51,-563.15,74.5 },
		["evasion"] = { 1386.65,-573.91,67.83 },
		["disneylandia01"] = { 1396.46,-568.43,67.33 },
		["disneylandia02"] = { 1395.62,-567.58,67.21 },
		["disneylandia03"] = { 1393.74,-567.34,67.15 },
		["disneylandia04"] = { 1391.83,-563.57,67.24 },
		["disneylandia05"] = { 1399.19,-558.33,67.20 },
		["disneylandia06"] = { 1401.99,-566.01,67.15 },
		["disneylandia07"] = { 1400.47,-572.32,67.35 },
		["disneylandia08"] = { 1402.02,-573.29,67.21 },
		["disneylandia09"] = { 1404.03,-568.40,67.24 },
		["disneylandia10"] = { 1403.80,-566.30,67.28 },
		["locker"] = { 1405.98,-567.8,67.84,294.86 }
	},
	["LS07"] = {
		["invasion"] = { 1380.71,-542.5,74.5 },
		["evasion"] = { 1370.80,-561.38,67.83 },
		["disneylandia01"] = { 1374.29,-550.69,67.33 },
		["disneylandia02"] = { 1373.10,-550.63,67.21 },
		["disneylandia03"] = { 1371.56,-551.72,67.15 },
		["disneylandia04"] = { 1367.59,-550.24,67.24 },
		["disneylandia05"] = { 1369.48,-541.40,67.20 },
		["disneylandia06"] = { 1376.74,-545.16,67.15 },
		["disneylandia07"] = { 1379.88,-550.85,67.35 },
		["disneylandia08"] = { 1381.68,-550.51,67.21 },
		["disneylandia09"] = { 1379.85,-545.54,67.24 },
		["disneylandia10"] = { 1378.26,-544.16,67.28 },
		["locker"] = { 1380.88,-543.8,67.84,337.40 }
	},
	["LS08"] = {
		["invasion"] = { 1355.15,-531.43,73.9 },
		["evasion"] = { 1351.11,-548.76,67.83 },
		["disneylandia01"] = { 1354.64,-538.17,67.33 },
		["disneylandia02"] = { 1353.45,-538.11,67.21 },
		["disneylandia03"] = { 1351.90,-539.20,67.15 },
		["disneylandia04"] = { 1347.94,-537.72,67.24 },
		["disneylandia05"] = { 1349.82,-528.88,67.20 },
		["disneylandia06"] = { 1357.08,-532.64,67.15 },
		["disneylandia07"] = { 1360.23,-538.32,67.35 },
		["disneylandia08"] = { 1362.03,-537.98,67.21 },
		["disneylandia09"] = { 1360.19,-533.02,67.24 },
		["disneylandia10"] = { 1358.60,-531.63,67.28 },
		["locker"] = { 1361.21,-531.27,67.84,337.47 }
	},
	["LS09"] = {
		["invasion"] = { 1335.65,-522.58,72.25 },
		["evasion"] = { 1328.96,-541.72,67.83 },
		["disneylandia01"] = { 1332.05,-530.72,67.33 },
		["disneylandia02"] = { 1330.85,-530.72,67.21 },
		["disneylandia03"] = { 1329.37,-531.89,67.15 },
		["disneylandia04"] = { 1325.33,-530.62,67.24 },
		["disneylandia05"] = { 1326.74,-521.70,67.20 },
		["disneylandia06"] = { 1334.19,-525.07,67.15 },
		["disneylandia07"] = { 1337.63,-530.57,67.35 },
		["disneylandia08"] = { 1339.41,-530.14,67.21 },
		["disneylandia09"] = { 1337.32,-525.28,67.24 },
		["disneylandia10"] = { 1335.66,-523.98,67.28 },
		["locker"] = { 1338.25,-523.48,67.84,340.47 }
	},
	["LS10"] = {
		["invasion"] = { 1309.14,-511.72,71.47 },
		["evasion"] = { 1306.52,-529.91,67.83 },
		["disneylandia01"] = { 1309.62,-518.91,67.33 },
		["disneylandia02"] = { 1308.42,-518.90,67.21 },
		["disneylandia03"] = { 1306.93,-520.06,67.15 },
		["disneylandia04"] = { 1302.90,-518.76,67.24 },
		["disneylandia05"] = { 1304.38,-509.84,67.20 },
		["disneylandia06"] = { 1311.80,-513.27,67.15 },
		["disneylandia07"] = { 1315.20,-518.80,67.35 },
		["disneylandia08"] = { 1316.98,-518.38,67.21 },
		["disneylandia09"] = { 1314.93,-513.51,67.24 },
		["disneylandia10"] = { 1313.28,-512.20,67.28 },
		["locker"] = { 1315.87,-511.72,67.84,340.47 }
	}
-----------------------------------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------PALETOBAY-------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------	
	--[[["PB01"] = {
		["invasion"] = { -454.94,6197.4,29.56 },
		["evasion"] = { -450.69,6199.0,15.84 },
		["disneylandia01"] = { -461.67,6197.76,15.33 },
		["disneylandia02"] = { -461.19,6196.76,15.23 },
		["disneylandia03"] = { -459.56,6195.19,15.23 },
		["disneylandia04"] = { -459.19,6191.55,15.24 },
		["disneylandia05"] = { -468.01,6189.47,15.22 },
		["disneylandia06"] = { -467.72,6197.67,15.13 },
		["disneylandia07"] = { -463.89,6202.99,15.34 },
		["disneylandia08"] = { -464.87,6204.43,15.16 },
		["disneylandia09"] = { -468.67,6200.59,15.22 },
		["disneylandia10"] = { -469.25,6198.57,15.33 },
		["locker"] = { -470.66,6200.79,15.79,92.77 }
	},
	["PB02"] = {
		["invasion"] = { -383.22,6200.29,32.06 },
		["evasion"] = { -370.27,6189.46,15.84 },
		["disneylandia01"] = { -378.57,6196.43,15.33 },
		["disneylandia02"] = { -378.99,6195.40,15.23 },
		["disneylandia03"] = { -379.04,6193.14,15.23 },
		["disneylandia04"] = { -381.48,6190.41,15.24 },
		["disneylandia05"] = { -388.96,6195.51,15.22 },
		["disneylandia06"] = { -382.71,6200.83,15.13 },
		["disneylandia07"] = { -376.21,6201.60,15.34 },
		["disneylandia08"] = { -375.80,6203.29,15.16 },
		["disneylandia09"] = { -381.20,6203.51,15.22 },
		["disneylandia10"] = { -383.08,6202.57,15.33 },
		["locker"] = { -382.40,6205.11,15.79,45.77 }
	},
	["PB03"] = {
		["invasion"] = { -366.59,6214.16,31.85 },
		["evasion"] = { -353.69,6205.27,15.84 },
		["disneylandia01"] = { -362.15,6212.22,15.33 },
		["disneylandia02"] = { -362.55,6211.18,15.23 },
		["disneylandia03"] = { -362.57,6208.92,15.23 },
		["disneylandia04"] = { -364.96,6206.16,15.24 },
		["disneylandia05"] = { -372.53,6211.13,15.22 },
		["disneylandia06"] = { -366.36,6216.55,15.13 },
		["disneylandia07"] = { -359.88,6217.43,15.34 },
		["disneylandia08"] = { -359.50,6219.13,15.16 },
		["disneylandia09"] = { -364.90,6219.25,15.22 },
		["disneylandia10"] = { -366.76,6218.29,15.33 },
		["locker"] = { -366.12,6220.84,15.79,45.77 }
	},
	["PB04"] = {
		["invasion"] = { -352.55,6231.26,31.49 },
		["evasion"] = { -340.39,6223.84,15.84 },
		["disneylandia01"] = { -348.60,6230.85,15.33 },
		["disneylandia02"] = { -349.02,6229.82,15.23 },
		["disneylandia03"] = { -349.08,6227.56,15.23 },
		["disneylandia04"] = { -351.53,6224.85,15.24 },
		["disneylandia05"] = { -358.99,6229.99,15.22 },
		["disneylandia06"] = { -352.71,6235.28,15.13 },
		["disneylandia07"] = { -346.21,6236.00,15.34 },
		["disneylandia08"] = { -345.79,6237.70,15.16 },
		["disneylandia09"] = { -351.19,6237.94,15.22 },
		["disneylandia10"] = { -353.07,6237.01,15.33 },
		["locker"] = { -352.37,6239.55,15.79,45.77 }
	},
	["PB05"] = {
		["invasion"] = { -387.76,6241.71,31.86 },
		["evasion"] = { -376.93,6258.18,15.84 },
		["disneylandia01"] = { -383.87,6250.00,15.33 },
		["disneylandia02"] = { -382.85,6249.58,15.23 },
		["disneylandia03"] = { -380.58,6249.53,15.23 },
		["disneylandia04"] = { -377.86,6247.09,15.24 },
		["disneylandia05"] = { -382.96,6239.61,15.22 },
		["disneylandia06"] = { -388.28,6245.87,15.13 },
		["disneylandia07"] = { -389.04,6252.37,15.34 },
		["disneylandia08"] = { -390.74,6252.78,15.16 },
		["disneylandia09"] = { -390.95,6247.37,15.22 },
		["disneylandia10"] = { -390.02,6245.49,15.33 },
		["locker"] = { -392.56,6246.18,15.79,135.77 }
	},
	["PB06"] = {
		["invasion"] = { -360.32,6260.7,31.91 },
		["evasion"] = { -356.42,6275.45,15.84 },
		["disneylandia01"] = { -363.38,6267.22,15.33 },
		["disneylandia02"] = { -362.35,6266.80,15.23 },
		["disneylandia03"] = { -360.09,6266.75,15.23 },
		["disneylandia04"] = { -357.36,6264.32,15.24 },
		["disneylandia05"] = { -362.46,6256.83,15.22 },
		["disneylandia06"] = { -367.78,6263.08,15.13 },
		["disneylandia07"] = { -368.55,6269.58,15.34 },
		["disneylandia08"] = { -370.25,6269.99,15.16 },
		["disneylandia09"] = { -370.46,6264.58,15.22 },
		["disneylandia10"] = { -369.52,6262.71,15.33 },
		["locker"] = { -372.06,6263.39,15.79,135.77 }
	},
	["PB07"] = {
		["invasion"] = { -450.99,6269.86,30.05 },
		["evasion"] = { -430.98,6264.44,14.53 },
		["disneylandia01"] = { -441.54,6266.95,14.02 },
		["disneylandia02"] = { -441.45,6265.84,13.93 },
		["disneylandia03"] = { -440.49,6263.79,13.93 },
		["disneylandia04"] = { -441.46,6260.27,13.93 },
		["disneylandia05"] = { -450.43,6261.51,13.91 },
		["disneylandia06"] = { -447.20,6269.05,13.82 },
		["disneylandia07"] = { -441.72,6272.63,14.03 },
		["disneylandia08"] = { -442.11,6274.33,13.86 },
		["disneylandia09"] = { -447.04,6272.12,13.92 },
		["disneylandia10"] = { -448.31,6270.44,14.02 },
		["locker"] = { -448.82,6273.03,14.50,72.77 }
	},]]--
}
-----------------------------------------------------------------------------------------------------------------------------------------
-- INVADIR
-----------------------------------------------------------------------------------------------------------------------------------------
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(5)
		local ped = PlayerPedId()
		if not IsPedInAnyVehicle(ped) then
			local x,y,z = table.unpack(GetEntityCoords(ped))
			for k,v in pairs(houses) do
				if not robberys then
					local distance = Vdist(x,y,z,v["invasion"][1],v["invasion"][2],v["invasion"][3])
					if distance <= 2.5 then
						drawText3D(v["invasion"][1],v["invasion"][2],v["invasion"][3],"~g~E ~w~  INVADIR")
						if distance <= 1.1 and IsControlJustPressed(0,38) then
							houseName = tostring(k)
							vSERVER.checkLockpick(k,v["evasion"][1],v["evasion"][2],v["evasion"][3],v["locker"][1],v["locker"][2],v["locker"][3],v["locker"][4])
						end
					end
				end
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- HOUSEROBBERY
-----------------------------------------------------------------------------------------------------------------------------------------
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(5)
		if robberys then
			local ped = PlayerPedId()
			local x,y,z = table.unpack(GetEntityCoords(ped))
			local bowz,cdz = GetGroundZFor_3dCoord(houses[houseName]["evasion"][1],houses[houseName]["evasion"][2],houses[houseName]["evasion"][3])
			local distance = Vdist(houses[houseName]["evasion"][1],houses[houseName]["evasion"][2],cdz,x,y,z)
			if distance <= 2.5 then
				drawText3D(houses[houseName]["evasion"][1],houses[houseName]["evasion"][2],houses[houseName]["evasion"][3],"~g~E ~w~  EVADIR")
				if distance <= 1.1 and IsControlJustPressed(0,38) then
					if DoesEntityExist(locker) then
						TriggerServerEvent("tryDeleteEntity",ObjToNet(locker))
						locker = nil
					end
					check = {}
					robberys = false
					vRP._teleport(houses[houseName]["invasion"][1],houses[houseName]["invasion"][2],houses[houseName]["invasion"][3])
					TriggerEvent("blockFunctions",false)
				end
			end
			for j,w in pairs(houses[houseName]) do
				if j ~= "invasion" and j ~= "evasion" then
					bowz,cdz = GetGroundZFor_3dCoord(w[1],w[2],w[3])
					distance = Vdist(w[1],w[2],cdz,x,y,z)
					if distance <= 1.5 and not check[j] then
						drawText3D(w[1],w[2],w[3],"~g~E ~w~ PROCURAR")
						if distance <= 1.5 and IsControlJustPressed(0,38) then
							check[j] = true
							TriggerEvent('cancelando',true)
							vRP._playAnim(true,{{"amb@prop_human_parking_meter@female@idle_a","idle_a_female"}},true)
							if j == "locker" and DoesEntityExist(locker) then
								TriggerEvent("mhacking:show")
								TriggerEvent("mhacking:start",3,20,hackLocker)
							else
								TriggerEvent("progress",20000,"procurando")
								SetTimeout(20000,function()
									TriggerEvent('cancelando',false)
									vRP._stopAnim(false)
									vSERVER.checkPayment(houseName,j,houses[houseName]["invasion"][1],houses[houseName]["invasion"][2],houses[houseName]["invasion"][3])
								end)
							end
						end
					end
				end
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- HACKLOCKER
-----------------------------------------------------------------------------------------------------------------------------------------
function hackLocker(success,time)
	TriggerEvent('cancelando',false)
	if success then
		TriggerEvent("mhacking:hide")
		vSERVER.checkPayment(houseName,"locker",houses[houseName]["invasion"][1],houses[houseName]["invasion"][2],houses[houseName]["invasion"][3])
	else
		TriggerEvent("mhacking:hide")
		vSERVER.resetTimer()
	end
	if DoesEntityExist(locker) then
		TriggerServerEvent("trydeleteobj",ObjToNet(locker))
		locker = nil
		vRP._stopAnim(false)
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- DRAWTEXT3D
-----------------------------------------------------------------------------------------------------------------------------------------
function drawText3D(x,y,z,text)
	local onScreen,_x,_y = World3dToScreen2d(x,y,z)
	SetTextFont(4)
	SetTextScale(0.35,0.35)
	SetTextColour(255,255,255,150)
	SetTextEntry("STRING")
	SetTextCentre(1)
	AddTextComponentString(text)
	DrawText(_x,_y)
	local factor = (string.len(text))/370
	DrawRect(_x,_y+0.0125,0.01+factor,0.03,0,0,0,80)
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- CHECKSTATUS
-----------------------------------------------------------------------------------------------------------------------------------------
function src.checkStatus(status)
	robberys = status
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- CREATELOCKER
-----------------------------------------------------------------------------------------------------------------------------------------
function src.createLocker(status,x,y,z,h,home)
	SetPedComponentVariation(PlayerPedId(),5,45,0,2)
	if DoesEntityExist(locker) then
		TriggerServerEvent("trydeleteobj",ObjToNet(locker))
		locker = nil
	end
	if status then
		locker = CreateObject(GetHashKey("prop_ld_int_safe_01"),x,y,z-1,true,false,false)
		FreezeEntityPosition(locker,true)
		SetEntityCollision(locker,true,true)
		SetEntityHeading(locker,h)
	else
		locker = nil
		check["locker"] = true
	end
	TriggerEvent("blockFunctions",true)
end