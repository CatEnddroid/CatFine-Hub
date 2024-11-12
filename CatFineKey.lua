local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()
local Player = game.Players.LocalPlayer
local Window = OrionLib:MakeWindow({Name = "Kitty Cats Doors /Key System", HidePremium = false, IntroText = "Kitty Cats Doors" , SaveConfig = true, IntroEnabled = false})

OrionLib:MakeNotification({
	Name = "Logged in",
	Content = "You are logged in as "..Player.Name..".",
	Image = "rbxassetid://4483345998",
	Time = 5
})

_G.Key = "test"
_G.KeyInput = "string"

function MakeScriptHub()
print ("EnteredCorrectKey")
local Window = OrionLib:MakeWindow({Name = "Kitty Cats Doors", HidePremium = false, IntroText = "Kitty Cats Doors" , SaveConfig = true, IntroEnabled = true, IntroText = "Kitty Cats Doors"})
end

function CorrectKeyNotification()
OrionLib:MakeNotification({
	Name = "Correct Key",
	Content = "You have entered the correct key!",
	Image = "rbxassetid://4483345998",
	Time = 5
})
end

function IncorrectKeyNotification()
OrionLib:MakeNotification({
	Name = "Incorrect Key",
	Content = "You have entered the incorrect key!",
	Image = "rbxassetid://4483345998",
	Time = 5
})
end


local Tab = Window:MakeTab({
	Name = "Key System",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

Tab:AddTextbox({
	Name = "Enter Key",
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


