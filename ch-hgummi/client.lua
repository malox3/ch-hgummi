ESX = exports["es_extended"]:getSharedObject()

local savedHair = nil
local wearingGummi = false

RegisterNetEvent("ch-hgummi:useGummi", function(gender)
    local playerPed = PlayerPedId()

    if not wearingGummi then
        -- Standard Haare speichern (was der Spieler aktuell hat)
        local currentHair = GetPedDrawableVariation(playerPed, 2)
        savedHair = currentHair

        -- Neue Haare setzen
        local hairStyle = (gender == "male" and Config.HairMale) or Config.HairFemale
        SetPedComponentVariation(playerPed, 2, hairStyle, 0, 2)

        ESX.ShowNotification("Du hast den Haargummi angezogen.")
        wearingGummi = true
    else
        -- Haare zurücksetzen
        if savedHair ~= nil then
            SetPedComponentVariation(playerPed, 2, savedHair, 0, 2)
            ESX.ShowNotification("Du hast den Haargummi wieder ausgezogen.")
        else
            ESX.ShowNotification("Keine Standard-Frisur gefunden.")
        end
        wearingGummi = false
    end
end)
