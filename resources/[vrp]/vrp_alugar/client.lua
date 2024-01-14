local pos = {x=267.55,y=-1162.6,z=29.24}
----------------------------------------------------------------------------------

----------------------------------------------------------------------------------
Citizen.CreateThread(function()
  while true do
    Citizen.Wait(1)
    local distance = GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()),267.55,-1162.6,29.24,true)
      if distance <= 5 then
        DrawMarker(6, pos.x,pos.y,pos.z+0.25, 0, 0, 0, 0, 0, 0, 1.0,1.0,1.0, 30,30,30, 200, 1, 1, 0, 1, 0, 0, 0)
        DrawMarker(36, pos.x,pos.y,pos.z+0.25, 0, 0, 0, 0, 0, 0, 1.0,1.0,1.0, 255,255,255, 200, 1, 1, 0, 1, 0, 0, 0)
        text_overflow(pos.x,pos.y, pos.z + 1, "Preço: R$600,00 | 10 Minutos")
        text_overflow(pos.x,pos.y, pos.z + 1.25, "Alugar um veículo Blista")
        if distance <= 3 then
          license_text("Pressiona ~INPUT_CONTEXT~ para ALUGAR um carro!")
          if IsControlJustPressed(1, 51) then
            if IsInVehicle() then
              TriggerEvent("Notify","importante","Você já está em um veículo!")
            else
              TriggerServerEvent('vRP_rent: payment')
            end
          end
        end
      end
  end
end)
----------------------------------------------------------------------------------

----------------------------------------------------------------------------------
RegisterNetEvent('vRP_Rent: spawncar')
AddEventHandler('vRP_Rent: spawncar', function()
  local myPed = GetPlayerPed(-1)
  local player = PlayerId()
  local vehicle = GetHashKey('blista')
  RequestModel(vehicle)
  while not HasModelLoaded(vehicle) do
    Wait(1)
  end
  --local coords = GetOffsetFromEntityInWorldCoords(GetPlayerPed(-1), 0, 5.0, 0)
  --259.52, ['y'] = -1162.21, ['z'] = 29.01 -- 357.51
  local spawned_car = CreateVehicle(vehicle, 259.52,-1162.21,29.01,357.51, GetEntityHeading(myPed), true, false)
  SetVehicleOnGroundProperly(spawned_car)
  SetVehicleNumberPlateText(spawned_car, "ALUGADO")
  SetModelAsNoLongerNeeded(vehicle)
  SetPedIntoVehicle(myPed,spawned_car,-1)
  Citizen.InvokeNative(0xB736A491E64A32CF,Citizen.PointerValueIntInitialized(spawned_car))
  TriggerEvent("Notify","importante","Você alugou um Blista por <b>R$600</b>, você tem <b>10 minutos</b> para utilizá-lo!")
end)

RegisterNetEvent('vRP_Rent: message')
AddEventHandler('vRP_Rent: message', function()
    SetNotificationTextEntry("STRING")
    DrawNotification(false, true)
end)

RegisterNetEvent('vRP_Rent: notenough')
  AddEventHandler('vRP_Rent: notenough', function()
      SetNotificationTextEntry("STRING")
      AddTextComponentString("Você não tem dinheiro suficiente!")
      SetNotificationMessage("CHAR_CARSITE", "CHAR_CARSITE", true, 1, "Panelinha | Compre agora!")
      DrawNotification(false, true)
  end)

RegisterNetEvent( 'vRP_Rent: deleteveh' )
AddEventHandler( 'vRP_Rent: deleteveh', function()
    local ped = GetPlayerPed( -1 )

    if ( DoesEntityExist( ped ) and not IsEntityDead( ped ) ) then 
        local pos = GetEntityCoords( ped )

        if ( IsPedSittingInAnyVehicle( ped ) ) then 
            local vehicle = GetVehiclePedIsIn( ped, false )        
            local licenseplate = GetVehicleNumberPlateText(vehicle)

                  if licenseplate == "  LOCADORA  " then
                    SetEntityAsMissionEntity( vehicle, true, true )
                    deleteCar( vehicle )
                  end

                if ( DoesEntityExist( vehicle ) ) then 
                  ShowNotification( "~r~Não encontramos seu carro alugado!" )
                else 
                  ShowNotification( "O seu tempo de locação acabou!" )
                end 
        else
            local playerPos = GetEntityCoords( ped, 1 )
            local inFrontOfPlayer = GetOffsetFromEntityInWorldCoords( ped, 0.0, 5.0, 0.0 )
            local vehicle = GetVehicleInDirection( playerPos, inFrontOfPlayer )
            local licenseplate = GetVehicleNumberPlateText(vehicle)

            if ( DoesEntityExist( vehicle ) ) then 

                  if licenseplate == "  RENT  " then
                    SetEntityAsMissionEntity( vehicle, true, true )
                    deleteCar( vehicle )
                  end

                if ( DoesEntityExist( vehicle ) ) then 
                  ShowNotification( "~r~Não encontramos o seu carro alugado!" )
                else 
                  ShowNotification( "O seu tempo de aluguel acabou!" )
                end 
            else 
                ShowNotification( "Precisas estar próximo ao veíoculo!" )
            end 
        end 
    end 
end ) 
----------------------------------------------------------------------------------

----------------------------------------------------------------------------------
function text_overflow(x,y,z, text) 
    local onScreen,_x,_y=World3dToScreen2d(x,y,z)
    local px,py,pz=table.unpack(GetGameplayCamCoords())
    local dist = GetDistanceBetweenCoords(px,py,pz, x,y,z, 1)

    local scale = (1/dist)*2
    local fov = (1/GetGameplayCamFov())*130
    local scale = scale*fov
    
    if onScreen then
        SetTextScale(0.2*scale, 0.5*scale)
        SetTextFont(6)
        SetTextProportional(1)
    SetTextColour( 255, 255, 255, 255 )
        SetTextDropshadow(0, 0, 0, 0, 255)
        SetTextEdge(2, 0, 0, 0, 150)
        SetTextDropShadow()
        SetTextOutline()
        SetTextEntry("STRING")
        SetTextCentre(1)
        AddTextComponentString(text)
      World3dToScreen2d(x,y,z, 0) --Added Here
        DrawText(_x,_y)
    end
end

function ShowNotification( text )
    SetNotificationTextEntry( "STRING" )
    AddTextComponentString( text )
    DrawNotification( false, false )
end

function deleteCar( entity )
    Citizen.InvokeNative( 0xEA386986E786A54F, Citizen.PointerValueIntInitialized( entity ) )
end

function GetVehicleInDirection( coordFrom, coordTo )
    local rayHandle = CastRayPointToPoint( coordFrom.x, coordFrom.y, coordFrom.z, coordTo.x, coordTo.y, coordTo.z, 10, GetPlayerPed( -1 ), 0 )
    local _, _, _, _, vehicle = GetRaycastResult( rayHandle )
    return vehicle
end

function timp(x,y ,width,height,scale, text, r,g,b,a, outline)
    SetTextFont(4)
    SetTextProportional(0)
    SetTextScale(scale, scale)
  SetTextColour( 0,0,0, 255 )
    SetTextDropShadow(0, 0, 0, 0,255)
    SetTextEdge(1, 0, 0, 0, 255)
    SetTextDropShadow()
  SetTextOutline()
    SetTextEntry("STRING")
    AddTextComponentString(text)
    DrawText(x - width/2, y - height/2 + 0.005)
end

function IsInVehicle()
  local ply = GetPlayerPed(-1)
  if IsPedSittingInAnyVehicle(ply) then
    return true
  else
    return false
  end
end

function license_text(str)
  SetTextComponentFormat("STRING")
  AddTextComponentString(str)
  DisplayHelpTextFromStringLabel(0, 0, 1, -1)
end
