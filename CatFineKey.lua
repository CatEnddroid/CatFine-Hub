local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()

local Window = OrionLib:MakeWindow({Name = "Key system", HidePremium = false, SaveConfig = true, IntroText = "Loading..."})

OrionLib:MakeNotification({
	Name = "Get Key",
	Content = "uhhh hello",
	Image = "rbxassetid://4483345998",
	Time = 3
})

_G.Key = "Test"
_G.KeyInput = "string"

function MakeScriptHub()
    loadstring(game:httpget("https://github.com/CatEnddroid/CatFine-Hub/blob/main/CatFineHub.lua"))()
	
end

function CorrectKeyNotification()
    OrionLib:MakeNotification({
	Name = "Correct Key!",
	Content = "you paid yay",
	Image = "rbxassetid://4483345998",
	Time = 3
    })
end

function IncorrectKeyNotification()
    OrionLib:MakeNotification({
	Name = "Incorrect Key",
	Content = "Uhhh pay",
	Image = "rbxassetid://4483345998",
	Time = 3
end

                
local Tab = Window:MakeTab({
	Name = "Key",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

Tab:AddTextbox({
	Name = "Enter key",
	Default = "",
	TextDisappear = true,
	Callback = function(Value)
		_G.KeyInput = Value
	end	  
})

Tab:AddButton({
	Name = "Check Key",
	Callback = function()
      	if _G.KeyInput == _G.Key then
        MakeScriptHub()
        CorrectKeyNotification()
        else
            IncorrectKeyNotification()
        end
  	end    
})