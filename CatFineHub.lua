local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()
local Window = OrionLib:MakeWindow({Name = "Cat Fine", HidePremium = false, IntroText = "Cat Fine" , SaveConfig = true, ConfigFolder = "OrionTest"})

print("Succes")

OrionLib:MakeNotification({
Name = "Notice",
Content = "Some Scripts/Hubs may not work or even break",
Image = "rbxassetid://4483345998",
Time = 10
})

local Tab = Window:MakeTab({
Name = "Doors",
Icon = "rbxassetid://4483345998",
PremiumOnly = false
})

local PremTab = Window:MakeTab({
Name = "Premium Only",
Icon = "rbxassetid://4483345998",
PremiumOnly = true
})

local SlapTab = Window:MakeTab({
Name = "Slap Battles",
Icon = "rbxassetid://4483345998",
PremiumOnly = false
})

local pressureTab = Window:MakeTab({
Name = "Pressure",
Icon = "rbxassetid://4483345998",
PremiumOnly = false
})

local TSBTab = Window:MakeTab({
Name = "TSB",
Icon = "rbxassetid://4483345998",
PremiumOnly = false
})

local CreditsTab = Window:MakeTab({
Name = "Credits",
Icon = "rbxassetid://4483345998",
PremiumOnly = false
})

local SpeedTab = Window:MakeTab({
Name = "Legends of Speed",
Icon = "rbxassetid://4483345998",
PremiumOnly = false
})

local EvadeTab = Window:MakeTab({
Name = "Evade",
Icon = "rbxassetid://4483345998",
PremiumOnly = false
})

local UniversalTab = Window:MakeTab({
Name = "Universal Scripts",
Icon = "rbxassetid://4483345998",
PremiumOnly = false
})

local MM2Tab = Window:MakeTab({
Name = "MM2",
Icon = "rbxassetid://4483345998",
PremiumOnly = false
})

local Section = CreditsTab:AddSection({
Name = "Credits"
})

local Section = SlapTab:AddSection({
Name = "Hubs"
})

local Section = Tab:AddSection({
Name = "Items (Scroll for More)"
})

local Section = EvadeTab:AddSection({
Name = "Hubs"
})

local Section = pressureTab:AddSection({
Name = "Hubs"
})

local Section = TSBTab:AddSection({
Name = "Hubs"
})


local Section = MM2Tab:AddSection({
Name = "Hubs"
})

local Ikea3008Tab = Window:MakeTab({
Name = "3008",
Icon = "rbxassetid://4483345998",
PremiumOnly = false
})


Tab:AddButton({
Name = "Shears",
Callback = function()
      print("Executed Shears")
  loadstring(game:HttpGet(('https://raw.githubusercontent.com/MrNeRD0/Doors-Hack/main/shears_done.lua')))()
  end    
})

Tab:AddButton({
Name = "Guiding Scanner",
Callback = function()
      print("Executed Guiding Scanner")
  loadstring(game:HttpGet("https://pastebin.com/raw/iBBqfYzn"))()
  end    
})

Tab:AddButton({
Name = "Golden Scanner",
Callback = function()
      print("Executed Golden Scanner")
  loadstring(game:HttpGet("https://pastebin.com/raw/umRteEPy"))()
  end    
})

Tab:AddButton({
Name = "Eat Everything (fork and knife to eat)",
Callback = function()
      print("Executed Eat Everything")
  loadstring(game:HttpGet("https://raw.githubusercontent.com/JohnyGamingLUA/EatEverythingDOORS/main/obfuscated.lua"))()
  end    
})

Tab:AddButton({
Name = "Crucifix on anything (does not work Right now)",
Callback = function()
      print("Executed Crucifix (does not work)")
  _G.Uses = 414141414141
_G.Range = 30
_G.OnAnything = true
_G.Fail = false
_G.Variant = "Electric"
loadstring(game:HttpGet('https://raw.githubusercontent.com/PenguinManiack/Crucifix/main/Crucifix.lua'))()
  end    
})

Tab:AddButton({
Name = "Holy Hand Grenade",
Callback = function()
      print("Executed Holy Hand Grenade")
loadstring(game:HttpGet(('https://raw.githubusercontent.com/CatEnddroid/HolyhandGrenade/refs/heads/main/HolyHandGrenadescript.lua')))()
  end    
})

Tab:AddButton({
Name = "Moon Bottle",
Callback = function()
      print("Executed Moon Bottle")
loadstring(game:HttpGet(('https://gist.githubusercontent.com/IdkMyNameLoll/04d7dd5e02688624b958b8c2604b924c/raw/9e86b34249f44ed2dd433176e67daaf3db30cde8/MoonBottle')))()
  end    
})

Tab:AddButton({
Name = "Spiral Bottle",
Callback = function()
      print("Executed Spiral Bottle")
loadstring(game:HttpGet('https://gist.githubusercontent.com/IdkMyNameLoll/8b05c837bea9effac2554340465b4be1/raw/3f3be0ee72e7f153db39a16a40fa63dce6cde72d/SpiralBottle'))()
  end    
})

Tab:AddButton({
Name = "Star Jug",
Callback = function()
      print("Executed Star Jug")
 loadstring(game:HttpGet("https://raw.githubusercontent.com/notpoiu/Scripts/refs/heads/main/StarJug.lua"))() 
  end    
})

Tab:AddButton({
Name = "Scanner",
Callback = function()
      print("Executed Scanner")
  _G.scanner_fps = 30
              _G.disable_static = false
              loadstring(game:HttpGet("https://raw.githubusercontent.com/notpoiu/Scripts/main/Scanner.lua"))()
  end    
})

Tab:AddButton({
Name = "Seek Gun",
Callback = function()
      print("Executed Seek Gun")
loadstring(game:HttpGet("https://raw.githubusercontent.com/notpoiu/Scripts/main/seekgun.lua"))()
  end    
})

Tab:AddButton({
Name = "Seek Plushie",
Callback = function()
      print("Executed Seek Plushie")
loadstring(game:HttpGet("https://raw.githubusercontent.com/CatEnddroid/Seek-Plushie/refs/heads/main/SeekPlushie.lua"))()
  end    
})

Tab:AddButton({
Name = "Subspace Tripmine",
Callback = function()
      print("Executed Subspaces Tripmine")
loadstring(game:HttpGet("https://raw.githubusercontent.com/CatEnddroid/Subs-Space-Tripmine/refs/heads/main/SubspacesTripmine.lua"))()
  end    
})

Tab:AddButton({
Name = "Rocket Launcher",
Callback = function()
      print("Executed Rocket Launcher")
loadstring(game:HttpGet("https://raw.githubusercontent.com/notpoiu/Scripts/main/rocketLauncher.lua"))()
  end    
})

local Section = Tab:AddSection({
Name = "Hubs"
})

Tab:AddButton({
Name = "Backdoor helper",
Callback = function()
      print("Executed Backdoor helper")
_G.IY = true -- Infinite Yield
_G.Bypass = true -- Bypass haste and Backdoor lookman
loadstring(game:HttpGet("https://raw.githubusercontent.com/iimateiYT/Scripts/main/Backdoors.lua"))()
  end    
})

Tab:AddButton({
Name = "FFJ1 Hub",
Callback = function()
      print("Executed FFJ1 Hub")
_G.IY = true -- Infinite Yield
_G.Bypass = true -- Bypass haste and Backdoor lookman
loadstring(game:HttpGet("https://raw.githubusercontent.com/FFJ1/Roblox-Exploits/main/scripts/Loader.lua"))()
  end    
})


Tab:AddButton({
Name = "mspaint v3 (no longer gets updates)",
Callback = function()
      print("Executed mspaint")
loadstring(game:HttpGet("https://raw.githubusercontent.com/notpoiu/mspaint/main/main.lua"))()
  end    
})

Tab:AddButton({
Name = "Black King (sometimes breaks)",
Callback = function()
      print("Executed Black King")
loadstring(game:HttpGet("https://raw.githubusercontent.com/KINGHUB01/BlackKing-obf/main/Doors%20Blackking%20And%20BobHub"))()
  end    
})


CreditsTab:AddButton({
Name = "Everything Made by Catend5 (for now)",
Callback = function()
      print("join my discord")
  end    
})

CreditsTab:AddButton({
Name = "discord: https://discord.gg/qkXK8Pfzuz",
Callback = function()
  end    
})

UniversalTab:AddButton({
Name = "Infinite Yield",
Callback = function()
      print("Executed Infinite Yield")
  loadstring(game:HttpGet('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'))()
  end    
})

UniversalTab:AddButton({
Name = "Fling GUI",
Callback = function()
      print("Executed FLING GUI")
  loadstring(game:HttpGet('https://raw.githubusercontent.com/CatEnddroid/Fling-GUI/refs/heads/main/FLINGGUI.lua'))()
  end    
})

MM2Tab:AddButton({
Name = "xHub3000MM2",
Callback = function()
      print("Executed xHub3000MM2")
  loadstring(game:HttpGet("https://raw.githubusercontent.com/Au0yX/Community/main/XhubMM2"))()
  end    
})



local Section = Tab:AddSection({
Name = "Modes"
})

Tab:AddButton({
Name = "Impossible Mode (will maybe be replaced with something)",
Callback = function()
      print("Executed Impossible Mode")
loadstring(game:HttpGet("https://raw.githubusercontent.com/Ukazix/impossible-mode/main/Protected_79.lua.txt"))()
  end    
})

Tab:AddButton({
Name = "Horror Mode (execute before door 1 opend)",
Callback = function()
      print("Executed Horror Mode")
loadstring(game:HttpGet("https://raw.githubusercontent.com/ChronoAcceleration/Comet-Development/refs/heads/main/Doors/Game/Horror.lua"))()
  end    
})

Ikea3008Tab:AddButton({
Name = "Wulphram",
Callback = function()
      print("Executed Wulpharm")
loadstring(game:HttpGet('https://raw.githubusercontent.com/502Development/502Lua/main/games/3008.lua'))()
  end    
})


SpeedTab:AddButton({
Name = "Hub ",
Callback = function()
      print("Executed Hub")
loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Sim-Hub-Keyless-9825"))()
  end    
})

TSBTab:AddButton({
Name = "cheate",
Callback = function()
      print("Executed cheate")
loadstring(game:HttpGet("https://raw.githubusercontent.com/sandwichk/RobloxScripts/main/Scripts/BadWare/Hub/Load.lua", true))()
  end    
})

pressureTab:AddButton({
Name = "cheate",
Callback = function()
      print("Executed Personal Hub")
loadstring(game:HttpGet("https://raw.githubusercontent.com/LordEyes2/Script/main/PersonalHub"))()
  end    
})

EvadeTab:AddButton({
Name = "Evade Hub (on this mouse is invisible)",
Callback = function()
      print("Executed Evade Hub")
loadstring(game:HttpGet('https://raw.githubusercontent.com/9Strew/roblox/main/gamescripts/evade.lua'))()
  end    
})

SlapTab:AddButton({
Name = "Forge Hub (does have a key system)",
Callback = function()
      print("Executed Forge Hub")
loadstring(game:HttpGet('https://raw.githubusercontent.com/Skzuppy/forge-hub/main/loader.lua'))()
  end    
})
