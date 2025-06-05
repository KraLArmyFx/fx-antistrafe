Config = {}

Config.Framework = "standalone"

Config.StrafeThreshold = 250
Config.StrafeDetectCount = 5
Config.StrafeWindow = 1000
Config.KickOnDetection = true
Config.KickMessage = "[fx-antistrafe] You were kicked for using illegal strafe macro behavior."

Config.Webhook = {
    Enabled = true,
    URL = "https://discord.com/api/webhooks/YOUR_WEBHOOK_URL",
    Title = "🚨 Anti-Strafe Detection",
    Color = 16711680,
    Footer = "fx-antistrafe by KraLArmyFx"
}
