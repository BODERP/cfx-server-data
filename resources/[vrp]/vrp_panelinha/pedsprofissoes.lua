local pedlist = {
	
	{ ['x'] = 103.89, ['y'] = -1292.14, ['z'] = 29.26, ['h'] = 289.69, ['hash'] = 0x52580019, ['hash2'] = "s_f_y_stripper_01" }, -- stripper vanilla
	{ ['x'] = 2432.78, ['y'] = 4802.78, ['z'] = 34.82, ['h'] = 128.22, ['hash'] = 0xFCFA9E1E, ['hash2'] = "A_C_Cow" }, -- Vaca emprego Leiteiro
	{ ['x'] = 2440.98, ['y'] = 4794.38, ['z'] = 34.66, ['h'] = 128.22, ['hash'] = 0xFCFA9E1E, ['hash2'] = "A_C_Cow" }, -- Vaca emprego Leiteiro
	{ ['x'] = 2449.0, ['y'] = 4786.67, ['z'] = 34.65, ['h'] = 128.22, ['hash'] = 0xFCFA9E1E, ['hash2'] = "A_C_Cow" }, -- Vaca emprego Leitero
	{ ['x'] = 149.45, ['y'] = -1042.15, ['z'] = 29.37, ['h'] = 334.59, ['hash'] = 0xC306D6F5, ['hash2'] = "u_m_m_bankman" }, -- Atendente do banco da praça
	{ ['x'] = 73.96, ['y'] = -1392.87, ['z'] = 29.38, ['h'] = 269.40, ['hash'] = 0x3EECBA5D, ['hash2'] = "s_f_y_shop_mid" }, -- Atendente da Loja de Roupas 2
	{ ['x'] = 268.39, ['y'] = -1162.45, ['z'] = 29.26, ['h'] = 97.480, ['hash'] = 0x04430687, ['hash2'] = "csb_car3guy1" } -- Atendente da Locadora de Carros
}

Citizen.CreateThread(function()
	for k,v in pairs(pedlist) do
		RequestModel(GetHashKey(v.hash2))
		while not HasModelLoaded(GetHashKey(v.hash2)) do
			Citizen.Wait(10000)
		end

		local ped = CreatePed(4,v.hash,v.x,v.y,v.z-1,v.h,false,true)
		FreezeEntityPosition(ped,true)
		SetEntityInvincible(ped,true)
		SetBlockingOfNonTemporaryEvents(ped,true)
        SetPedSeeingRange(ped,0.0)
        SetPedHearingRange(ped,0.0)
        SetPedFleeAttributes(ped,0,false)
        SetPedKeepTask(ped,true)
        SetPedCanRagdoll(ped,false)
        SetPedDiesWhenInjured(ped,false)
        SetPedCombatMovement(ped,false)

	end
end)