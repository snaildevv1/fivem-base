ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

local DrivingSchools = {
    "PAE31194",
    "TRB56419",
    "UNA59325",
    "LWR55470",
    "APJ79416",
    "FUN28030",
}

ESX.RegisterServerCallback('qb-cityhall:server:getMoney', function(source, cb)
    local ply = ESX.GetPlayerFromId(source)
    local plyMoney = ply.getMoney()

    cb(plyMoney)
end)

ESX.RegisterServerCallback('qb-cityhall:server:getInventoryItem', function(source, cb)
    local ply = ESX.GetPlayerFromId(source)
    local plyItem = ply.getInventoryItem('id_card').count

    cb(plyItem)
end)

RegisterServerEvent('qb-cityhall:server:requestId')
AddEventHandler('qb-cityhall:server:requestId', function(identityData)
    local ply = ESX.GetPlayerFromId(source)
    local plyItem = ply.getInventoryItem('id_card').count
    local info = {}

    MySQL.Async.fetchAll('SELECT * FROM users WHERE identifier = @identifier', {
        ['@identifier'] = GetPlayerIdentifiers(source)[1]
    }, function(information)
        if information[1].firstname ~= nil then
            if identityData.item == "id_card" then
                info.identifier = ply.identifier
                info.firstname = information[1].firstname
                info.lastname = information[1].lastname
                info.birthdate = information[1].brithdate
                info.gender = information[1].sex
                print(json.encode(info))
            end
        else
            if identityData.item == "id_card" then
                info.identifier = 'NULL'
                info.firstname = 'NULL'
                info.lastname = 'NULL'
                info.birthdate = 'NULL'
                info.gender = 'NULL'
                print(json.encode(info))
            end
        end
    end)

    ply.removeMoney(50)
    ply.addInventoryItem(identityData.item, 1)
end)

RegisterServerEvent('qb-cityhall:server:ApplyJob')
AddEventHandler('qb-cityhall:server:ApplyJob', function(job)
    local ply = ESX.GetPlayerFromId(source)
    local plyJob = ply.getJob().label

    ply.setJob(job, 0)
    TriggerClientEvent('qb-notify:client:SendAlert', source, { type = 'inform', text = '¡Felicidades por tu nuevo trabajo! ('..plyJob..')' })
end)