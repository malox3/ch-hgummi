ESX = exports["es_extended"]:getSharedObject()

ESX.RegisterUsableItem(Config.ItemName, function(source)
    local xPlayer = ESX.GetPlayerFromId(source)
    if not xPlayer then return end

    -- Geschlecht vom Spieler abrufen
    local gender = xPlayer.get("sex") -- je nach ESX-Version 'm' oder 'f'

    if gender == "m" then
        TriggerClientEvent("ch-hgummi:useGummi", source, "male")
    else
        TriggerClientEvent("ch-hgummi:useGummi", source, "female")
    end
end)
