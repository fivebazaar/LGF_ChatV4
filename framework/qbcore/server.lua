local QBCore = exports['qb-core']:GetCoreObject()

local BRIDGE = {}

function BRIDGE:GetPlayerData(src)
    local PlayerData = exports.qbx_core:GetPlayer(src).PlayerData
    local PlayerData = QBCore.Functions.GetPlayer(src)
    if PlayerData then
        return PlayerData
    else
        Utils.DebugPrint(('No player data found for the provided source %s.'):format(src))
    end
end

function BRIDGE:GetPlayerName(src)
    local qboxPlayer = BRIDGE:GetPlayerData(src)
    if not qboxPlayer then return end
    return string.format("%s %s", qboxPlayer.charinfo.firstname, qboxPlayer.charinfo.lastname)
end

function BRIDGE:GetPlayerJob(src)
    local qboxPlayer = BRIDGE:GetPlayerData(src)
    local Job = qboxPlayer.job.label
    if not Job then return end
    return Job
end

function BRIDGE:GetPlayerGroup(src)
    if QBCore.Functions.HasPermission(src, 'admin') then
        return 'admin'
    elseif QBCore.Functions.HasPermission(src, 'god') then
        return 'god'
    elseif QBCore.Functions.HasPermission(src, 'mod') then
        return 'mod'
    end
end

return BRIDGE
