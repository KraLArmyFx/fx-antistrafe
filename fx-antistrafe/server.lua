RegisterServerEvent("fx-antistrafe:kick")
AddEventHandler("fx-antistrafe:kick", function()
    local src = source
    local name = GetPlayerName(src) or "Unknown"
    local id = src

    if Config.Webhook.Enabled then
        sendWebhookLog(string.format("**Player Kicked:** %s (ID: %s)\nReason: Detected using strafe macro.", name, id))
    end

    DropPlayer(src, Config.KickMessage)
end)

RegisterServerEvent("fx-antistrafe:warn")
AddEventHandler("fx-antistrafe:warn", function()
    local src = source
    local name = GetPlayerName(src) or "Unknown"
    local id = src

    if Config.Webhook.Enabled then
        sendWebhookLog(string.format("**Player Detected (Not Kicked):** %s (ID: %s)\nReason: Detected using strafe macro.", name, id))
    end

    print(("[fx-antistrafe] Player %s (%s) triggered a strafe macro detection."):format(id, name))
end)

function sendWebhookLog(message)
    PerformHttpRequest(Config.Webhook.URL, function(err, text, headers) end, 'POST', json.encode({
        username = "fx-antistrafe",
        embeds = {{
            title = Config.Webhook.Title,
            description = message,
            color = Config.Webhook.Color,
            footer = { text = Config.Webhook.Footer },
            timestamp = os.date("!%Y-%m-%dT%H:%M:%SZ")
        }}
    }), { ['Content-Type'] = 'application/json' })
end
