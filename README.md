# fx-antistrafe

A powerful FiveM anti-strafe macro detection script developed by **KraLArmyFx**.  
Blocks unfair "strafing" mechanics used with macros or keyboard abuse (e.g. A/D spam teleporting).

---

## 🚫 What is Strafe?

Strafing is an exploit where players repeatedly tap **A/D (left/right)** keys rapidly using:
- Keyboard macros
- AutoHotKey scripts
- Hardware-level repeaters

This gives an unfair edge in PvP.  
**`fx-antistrafe` blocks that behavior entirely.**

---

## ✅ Features

- Detects and prevents unnatural strafe patterns (macro-based)
- Configurable detection thresholds
- **Kick or warn** on detection
- Discord **webhook log support**
- Lightweight, client-server based
- Framework-agnostic: runs standalone or can be integrated into QBCore/ESX/Ox

---

## ⚙️ Configuration (`config.lua`)

```lua
Config.Framework = "standalone" -- reserved for future use: "qbcore", "esx", "ox"

Config.StrafeThreshold = 250      -- Time (ms) between opposite key presses
Config.StrafeDetectCount = 5      -- How many rapid switches to trigger detection
Config.StrafeWindow = 1000        -- Max time window (ms) for detection to trigger
Config.KickOnDetection = true     -- true = kicks player, false = just logs
Config.KickMessage = "[fx-antistrafe] You were kicked for using illegal strafe macro behavior."

Config.Webhook = {
    Enabled = true,
    URL = "https://discord.com/api/webhooks/YOUR_WEBHOOK",
    Title = "🚨 Anti-Strafe Detection",
    Color = 16711680,
    Footer = "fx-antistrafe by KraLArmyFx"
}
