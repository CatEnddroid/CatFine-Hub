local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()
local Window = OrionLib:MakeWindow({Name = "Kitty Cats Doors| Key System", HidePremium = false, SaveConfig = true, ConfigFolder = "OrionTest", IntroText = "Key System"})

OrionLib:MakeNotification({
	Name = "You need Key",
	Content = "hi get key",
	Image = "rbxassetid://4483345998",
	Time = 5
})


_G.Key = "Test"
_G.KeyInput = "string"

function MakeScriptHub()
loadstring(game:httpget(("https://github.com/CatEnddroid/CatFine-Hub/blob/main/CatFineHub.lua"))()
end

local Tab = Window:MakeTab({
	Name = "Key",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

  
Tab:AddTextbox({
  Name = "Enter Key",
  Default = "Key",
  TextDisappear = true,
  Callback = function(Value)
    print(Value)
   _G.KeyInput = Value
  end	  
})

Tab:AddButton({
  Name = "Check Key",
  Callback = function()
  if _G.KeyInput == _G.Key then     
          MakeScriptHub()
        end
    end    
})

