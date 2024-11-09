local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()
local Window = OrionLib:MakeWindow({Name = "Kitty Cats Doors", HidePremium = false, IntroText = "Kitty Cats Doors" , SaveConfig = true, ConfigFolder = "OrionTest"})

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

local Section = Tab:AddSection({
Name = "Items"
})

Tab:AddButton({
Name = "Shears",
Callback = function()
      print("Executed Shears")
  loadstring(game:HttpGet(('https://raw.githubusercontent.com/MrNeRD0/Doors-Hack/main/shears_done.lua')))()
  end    
})

Tab:AddButton({
Name = "Guiding Scanner|Crossroads person",
Callback = function()
      print("Executed Guiding Scanner")
  loadstring(game:HttpGet("https://pastebin.com/raw/iBBqfYzn"))()
  end    
})

Tab:AddButton({
Name = "Grass Scanner|Crossroads person",
Callback = function()
      print("Executed Grass Scanner")
  loadstring(game:HttpGet("https://raw.githubusercontent.com/Matthew201322/Doors-Scriptee/refs/heads/main/grass%20tablet.lua"))()
  end    
})

Tab:AddButton({
Name = "Golden Scanner|Crossroads person",
Callback = function()
      print("Executed Golden Scanner")
  loadstring(game:HttpGet("https://pastebin.com/raw/umRteEPy"))()
  end    
})

Tab:AddButton({
Name = "Gravity Gun",
Callback = function()
      print("Executed Gravity Gun(NEW!)")
  loadstring(game:HttpGet("https://raw.githubusercontent.com/Fuydutdtu/FEGravityGun/refs/heads/main/Gravity.lua"))()
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
Name = "Holy Hand Grenade",
Callback = function()
      print("Executed Holy Hand Grenade")
loadstring(game:HttpGet(('https://raw.githubusercontent.com/CatEnddroid/HolyhandGrenade/refs/heads/main/HolyHandGrenadescript.lua')))()
  end    
})

Tab:AddButton({
Name = "Moon Bottle|Indexell",
Callback = function()
      print("Executed Moon Bottle")
loadstring(game:HttpGet(('https://gist.githubusercontent.com/IdkMyNameLoll/04d7dd5e02688624b958b8c2604b924c/raw/9e86b34249f44ed2dd433176e67daaf3db30cde8/MoonBottle')))()
  end    
})

Tab:AddButton({
Name = "Spiral Bottle|Indexell",
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
Name = "Models"
})

Tab:AddButton({
Name = "Curious Portal (NEW!)",
Callback = function()
      print("Executed Curious Portal")
loadstring(game:HttpGet("https://pastebin.com/raw/HT8jgqAY"))()
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
Name = "Custom Item Giver (some items are already here)",
Callback = function()
      print("Executed Custom Items")
loadstring(game:HttpGet("https://raw.githubusercontent.com/Darli17/DOORS-REBOUNCES/refs/heads/main/main-ig"))()
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
Name = "mspaint v3|upio (no longer gets updates)",
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

UniversalTab:AddButton({
Name = "Guiding Hack|Guiding Light",
Callback = function()
      print("Executed Guiding Hack")
  loadstring("\108\111\97\100\115\116\114\105\110\103\40\103\97\109\101\58\72\116\116\112\71\101\116\40\40\39\104\116\116\112\115\58\47\47\103\105\115\116\46\103\105\116\104\117\98\117\115\101\114\99\111\110\116\101\110\116\46\99\111\109\47\109\101\111\122\111\110\101\89\84\47\98\102\48\51\55\100\102\102\57\102\48\97\55\48\48\49\55\51\48\52\100\100\100\54\55\102\100\99\100\51\55\48\47\114\97\119\47\101\49\52\101\55\52\102\52\50\53\98\48\54\48\100\102\53\50\51\51\52\51\99\102\51\48\98\55\56\55\48\55\52\101\98\51\99\53\100\50\47\97\114\99\101\117\115\37\50\53\50\48\120\37\50\53\50\48\102\108\121\37\50\53\50\48\50\37\50\53\50\48\111\98\102\108\117\99\97\116\111\114\39\41\44\116\114\117\101\41\41\40\41\10\10")()
  end    
})

local SetTab = Window:MakeTab({
Name = "Settings",
Icon = "rbxassetid://4483345998",
PremiumOnly = false
})

SetTab:AddColorpicker({
      Name = "Colorpicker",
      Default = Color5.fromRGB(255, 0, 0),
      Callback = function(Value)
            print(Value)
      end	  
})
ColorPicker:Set(Color3.fromRGB(255,255,255))