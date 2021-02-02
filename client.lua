local showroom = {
    {-535.75262451172,-220.06228637696,37.649696350098}
}

Citizen.CreateThread(function()
    while true do 
        Wait(0)
        local P = PlayerPedId(-1)
        local PC = GetEntityCoords(P)
        for k, v in pairs(showroom) do
            local dis = GetDistanceBetweenCoords(PC.x, PC.y, PC.z, v[1], v[2], v[3], true)
            if dis < 20 then 
                DrawMarker(20, v[1],v[2],v[3]  - 0.15, 0, 0, 0, 0, 0, 0, 1.5,1.5,1.5,147,147,147,200,0,0,0,true)
                --DrawMarker(25, v[1],v[2],v[3]  - 0.75, 0, 0, 0, 0, 0, 0, 2.0,2.0,2.0, 255,255,255, 255,0,0,0,true)
                --DrawMarker(25, v[1],v[2],v[3] , 0, 0, 0, 0, 0, 0, 2.0,2.0,3.0, 255,255,255, 255,0,0,0,true)
                Draw3DText(v[1],v[2],v[3] + 1, "~p~Apasa ~p~'E' ~p~pentru informatii!", 0.5)
            if dis < 2 then
                if IsControlJustPressed(0, 38) then
                FreezeEntityPosition(P, true)
                SetEntityInvincible(P, true)
                SetEntityAlpha(PlayerPedId(), 170, false)
                SetEntityCoords(P,-536.95574951172,-219.56214904786,44.957962036132,true, false, false,true)
                announcestring = "~p~Bun venit pe SERVER!! \n Aici se afla ~p~Primaria ~p~!"
                Wait(10000)
                announcestring = false
                SetEntityCoords(P,410.34741210938,-982.71337890625,38.993709564208,true, false, false,true)
                announcestring = "~p~Discord: ~p~https://discord.io/invisionrpro \n Aici se afla ~p~Sectia de Politie ~b~!"
                Wait(10000)
                announcestring = false
                SetEntityCoords(P,368.44497680664,-624.1513671875,38.29041671753,true, false, false,true)
                announcestring = "~p~Pentru orice problema contactati membrii ~p~STAFF~p~! \n Aici se afla ~r~Spitalul ~b~!"
                Wait(10000)
                announcestring = false
                SetEntityCoords(P,-62.584423065186,-1116.571899414,36.59342956543,true, false, false,true)
                announcestring = "~p~Daca vrei sa ~p~donezi ~p~contacteaza ~p~Fondatoru~p~! \n Aici se afla ~b~Showroom-ul~p~!"
                Wait(10000)
                announcestring = false
                FreezeEntityPosition(P, false)
                SetEntityInvincible(P, false)
                SetEntityAlpha(PlayerPedId(), 255, false)
                SetEntityCoords(P,-539.43811035156,-213.51908874512,37.649795532226,true, false, false,true)
                announcestring = "~p~Nu raspundem daca donezi altcuiva si iti iei ~p~teapa!"
                Wait(10000)
                announcestring = false
                    end
                end
            end
        end
    end
end)

function Draw3DText(x,y,z, text,scl) 

    local onScreen,_x,_y=World3dToScreen2d(x,y,z)
    local px,py,pz=table.unpack(GetGameplayCamCoords())
    local dist = GetDistanceBetweenCoords(px,py,pz, x,y,z, 1)
 
    local scale = (1/dist)*scl
    local fov = (1/GetGameplayCamFov())*100
    local scale = scale*fov
   
    if onScreen then
        SetTextScale(1.0*scale, 2.1*scale)
        SetTextFont(0)
        SetTextProportional(1)
        SetTextColour(255, 255, 255, 255)
        SetTextDropshadow(0, 0, 0, 0, 255)
        SetTextEdge(2, 0, 0, 0, 150)
        SetTextDropShadow()
        SetTextOutline()
        SetTextEntry("STRING")
        SetTextCentre(1)
        AddTextComponentString(""..text)
        DrawText(_x,_y)
    end
end

--      HACKER GEO START      --    https://github.com/HackerGeo-sp1ne/vRP_Welcome

function Initialize(scaleform)
    local scaleform = RequestScaleformMovie(scaleform)
    while not HasScaleformMovieLoaded(scaleform) do
        Citizen.Wait(0)
    end
    PushScaleformMovieFunction(scaleform, "SHOW_SHARD_WASTED_MP_MESSAGE")
	PushScaleformMovieFunctionParameterString("[ ~p~Invision ~r~ROMANIA~y~-~b~ROLEPLAY ~w~]")
    PushScaleformMovieFunctionParameterString(announcestring)
	PopScaleformMovieFunctionVoid()
    return scaleform
end

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        if announcestring then      
            scaleform = Initialize("mp_big_message_freemode")
            DrawScaleformMovieFullscreen(scaleform, 255, 255, 255, 255, 0)
        end
    end
end)

RegisterNetEvent("startinfo")
AddEventHandler("startinfo", function()
end)

--      HACKER GEO END      --   