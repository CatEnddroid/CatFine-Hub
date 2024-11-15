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

function MakeScriptHub()
print ("EnteredCorrectKey")
local Fluent = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()
local SaveManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/SaveManager.lua"))()
local InterfaceManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/InterfaceManager.lua"))()

local Window = Fluent:CreateWindow({
    Title = "Kitty Cats Doors " .. Fluent.Version,
    SubTitle = "UI by Jake Brocks",
    TabWidth = 160,
    Size = UDim2.fromOffset(580, 460),
    Acrylic = true, -- The blur may be detectable, setting this to false disables blur entirely
    Theme = "Dark",
    MinimizeKey = Enum.KeyCode.LeftControl -- Used when theres no MinimizeKeybind
})

--Fluent provides Lucide Icons https://lucide.dev/icons/ for the tabs, icons are optional
local Tabs = {
    Main = Window:AddTab({ Title = "Main", Icon = "" }),
    Settings = Window:AddTab({ Title = "Settings", Icon = "settings" })
}

local HubTabs = {
    Main = Window:AddTab({ Title = "Hub", Icon = "" }),
}

local CredTabs = {
    Main = Window:AddTab({ Title = "Credits", Icon = "" }),
}

local Options = Fluent.Options

do
    Fluent:Notify({
        Title = "Notification",
        Content = "Some Hubs/Script may not work",
        SubContent = "so yea have fun", -- Optional
        Duration = 5 -- Set to nil to make the notification not disappear
    })
    

    Tabs.Main:AddParagraph({
        Title = "Items",
        Content = "Some Cool Items"
    })



    Tabs.Main:AddButton({
        Title = "Speed Barrel",
        Description = "Makes you very fast",
        Callback = function()
            Window:Dialog({
                Title = "Confirm?",
                Content = "Are you sure?",
                Buttons = {
                    {
                        Title = "Get Item",
                        Callback = function()
                            print("Confirmed the dialog.")
loadstring(game:HttpGet("https://raw.githubusercontent.com/CatEnddroid/CatFine-Hub/refs/heads/main/Speed%20Barrel.lua"))()
                        end
                    },
                    {
                        Title = "Something else",
                        Callback = function()
                            print("Cancelled the dialog.")
                        end
                    }
                }
            })
        end
    })

Tabs.Main:AddButton({
        Title = "Shears",
        Description = "Deletes Anything",
        Callback = function()
            Window:Dialog({
                Title = "Confirm?",
                Content = "Are you sure?",
                Buttons = {
                    {
                        Title = "Get Item",
                        Callback = function()
                            print("Confirmed the dialog.")
loadstring(game:HttpGet("https://raw.githubusercontent.com/MrNeRD0/Doors-Hack/main/shears_done.lua"))()
                        end
                    },
                    {
                        Title = "Something else",
                        Callback = function()
                            print("Cancelled the dialog.")
                        end
                    }
                }
            })
        end
    })

    Tabs.Main:AddButton({
        Title = "Guiding Scanner",
        Description = "Just a Scanner",
        Callback = function()
            Window:Dialog({
                Title = "Confirm?",
                Content = "Are you sure?",
                Buttons = {
                    {
                        Title = "Get Item",
                        Callback = function()
                            print("Confirmed the dialog.")
loadstring(game:HttpGet("https://pastebin.com/raw/iBBqfYzn"))()
                        end
                    },
                    {
                        Title = "Something else",
                        Callback = function()
                            print("Cancelled the dialog.")
                        end
                    }
                }
            })
        end
    })

    Tabs.Main:AddButton({
        Title = "Grass Scanner",
        Description = "Just a Scanner",
        Callback = function()
            Window:Dialog({
                Title = "Confirm?",
                Content = "Are you sure?",
                Buttons = {
                    {
                        Title = "Get Item",
                        Callback = function()
                            print("Confirmed the dialog.")
loadstring(game:HttpGet("https://raw.githubusercontent.com/Matthew201322/Doors-Scriptee/refs/heads/main/grass%20tablet.lua"))()
                        end
                    },
                    {
                        Title = "Something else",
                        Callback = function()
                            print("Cancelled the dialog.")
                        end
                    }
                }
            })
        end
    })

 Tabs.Main:AddButton({
        Title = "Golden Scanner",
        Description = "Just a Scanner",
        Callback = function()
            Window:Dialog({
                Title = "Confirm?",
                Content = "Are you sure?",
                Buttons = {
                    {
                        Title = "Get Item",
                        Callback = function()
                            print("Confirmed the dialog.")
loadstring(game:HttpGet("https://pastebin.com/raw/umRteEPy"))()
                        end
                    },
                    {
                        Title = "Something else",
                        Callback = function()
                            print("Cancelled the dialog.")
                        end
                    }
                }
            })
        end
    })

Tabs.Main:AddButton({
        Title = "Scanner",
        Description = "Normal Scanner",
        Callback = function()
            Window:Dialog({
                Title = "Confirm?",
                Content = "Are you sure?",
                Buttons = {
                    {
                        Title = "Get Item",
                        Callback = function()
                            print("Confirmed the dialog.")
  _G.scanner_fps = 30
              _G.disable_static = false
              loadstring(game:HttpGet("https://raw.githubusercontent.com/notpoiu/Scripts/main/Scanner.lua"))()
                        end
                    },
                    {
                        Title = "Something else",
                        Callback = function()
                            print("Cancelled the dialog.")
                        end
                    }
                }
            })
        end
    })

Tabs.Main:AddButton({
        Title = "Holy Hand Grenade",
        Description = "Explodes Everything",
        Callback = function()
            Window:Dialog({
                Title = "Confirm?",
                Content = "Are you sure?",
                Buttons = {
                    {
                        Title = "Get Item",
                        Callback = function()
                            print("Confirmed the dialog.")
loadstring(game:HttpGet(('https://raw.githubusercontent.com/CatEnddroid/HolyhandGrenade/refs/heads/main/HolyHandGrenadescript.lua')))()
                        end
                    },
                    {
                        Title = "Something else",
                        Callback = function()
                            print("Cancelled the dialog.")
                        end
                    }
                }
            })
        end
    })

Tabs.Main:AddButton({
        Title = "Moon Bottle|Indexell",
        Description = "Guiding Moon?",
        Callback = function()
            Window:Dialog({
                Title = "Confirm?",
                Content = "Are you sure?",
                Buttons = {
                    {
                        Title = "Get Item",
                        Callback = function()
                            print("Confirmed the dialog.")
loadstring(game:HttpGet(('https://gist.githubusercontent.com/IdkMyNameLoll/04d7dd5e02688624b958b8c2604b924c/raw/9e86b34249f44ed2dd433176e67daaf3db30cde8/MoonBottle')))()
                        end
                    },
                    {
                        Title = "Something else",
                        Callback = function()
                            print("Cancelled the dialog.")
                        end
                    }
                }
            })
        end
    })

Tabs.Main:AddButton({
        Title = "Spiral Bottle|Indexell",
        Description = "Red Sqaure?",
        Callback = function()
            Window:Dialog({
                Title = "Confirm?",
                Content = "Are you sure?",
                Buttons = {
                    {
                        Title = "Get Item",
                        Callback = function()
                            print("Confirmed the dialog.")
loadstring(game:HttpGet('https://gist.githubusercontent.com/IdkMyNameLoll/8b05c837bea9effac2554340465b4be1/raw/3f3be0ee72e7f153db39a16a40fa63dce6cde72d/SpiralBottle'))()
                        end
                    },
                    {
                        Title = "Something else",
                        Callback = function()
                            print("Cancelled the dialog.")
                        end
                    }
                }
            })
        end
    })

Tabs.Main:AddButton({
        Title = "Star Jug",
        Description = "A-1000 Suprise",
        Callback = function()
            Window:Dialog({
                Title = "Confirm?",
                Content = "Are you sure?",
                Buttons = {
                    {
                        Title = "Get Item",
                        Callback = function()
                            print("Confirmed the dialog.")
loadstring(game:HttpGet("https://raw.githubusercontent.com/notpoiu/Scripts/refs/heads/main/StarJug.lua"))()
                        end
                    },
                    {
                        Title = "Something else",
                        Callback = function()
                            print("Cancelled the dialog.")
                        end
                    }
                }
            })
        end
    })

Tabs.Main:AddButton({
        Title = "Seek Gun",
        Description = "Infects Anything",
        Callback = function()
            Window:Dialog({
                Title = "Confirm?",
                Content = "Are you sure?",
                Buttons = {
                    {
                        Title = "Get Item",
                        Callback = function()
                            print("Confirmed the dialog.")
loadstring(game:HttpGet("https://raw.githubusercontent.com/notpoiu/Scripts/main/seekgun.lua"))()
                        end
                    },
                    {
                        Title = "Something else",
                        Callback = function()
                            print("Cancelled the dialog.")
                        end
                    }
                }
            })
        end
    })

Tabs.Main:AddButton({
        Title = "Seek Plushie",
        Description = "Squish",
        Callback = function()
            Window:Dialog({
                Title = "Confirm?",
                Content = "Are you sure?",
                Buttons = {
                    {
                        Title = "Get Item",
                        Callback = function()
                            print("Confirmed the dialog.")
loadstring(game:HttpGet("https://raw.githubusercontent.com/CatEnddroid/Seek-Plushie/refs/heads/main/SeekPlushie.lua"))()
                        end
                    },
                    {
                        Title = "Something else",
                        Callback = function()
                            print("Cancelled the dialog.")
                        end
                    }
                }
            })
        end
    })

Tabs.Main:AddButton({
        Title = "Supspace Tripmine",
        Description = "KABOOOM",
        Callback = function()
            Window:Dialog({
                Title = "Confirm?",
                Content = "Are you sure?",
                Buttons = {
                    {
                        Title = "Get Item",
                        Callback = function()
                            print("Confirmed the dialog.")
loadstring(game:HttpGet("https://raw.githubusercontent.com/CatEnddroid/Subs-Space-Tripmine/refs/heads/main/SubspacesTripmine.lua"))()
                        end
                    },
                    {
                        Title = "Something else",
                        Callback = function()
                            print("Cancelled the dialog.")
                        end
                    }
                }
            })
        end
    })

Tabs.Main:AddButton({
        Title = "Rocket Launcher",
        Description = "Rocket do boom",
        Callback = function()
            Window:Dialog({
                Title = "Confirm?",
                Content = "Are you sure?",
                Buttons = {
                    {
                        Title = "Get Item",
                        Callback = function()
                            print("Confirmed the dialog.")
loadstring(game:HttpGet("https://raw.githubusercontent.com/notpoiu/Scripts/main/rocketLauncher.lua"))()
                        end
                    },
                    {
                        Title = "Something else",
                        Callback = function()
                            print("Cancelled the dialog.")
                        end
                    }
                }
            })
        end
    })

Tabs.Main:AddButton({
        Title = "Crucfix On Anything",
        Description = "Doesnt Work",
        Callback = function()
            Window:Dialog({
                Title = "Confirm?",
                Content = "Are you sure?",
                Buttons = {
                    {
                        Title = "Get Item",
                        Callback = function()
                            print("Confirmed the dialog.")
  _G.Uses = 414141414141
_G.Range = 30
_G.OnAnything = true
_G.Fail = false
_G.Variant = "Electric"
loadstring(game:HttpGet('https://raw.githubusercontent.com/PenguinManiack/Crucifix/main/Crucifix.lua'))()
                        end
                    },
                    {
                        Title = "Something else",
                        Callback = function()
                            print("Cancelled the dialog.")
                        end
                    }
                }
            })
        end
    })

Tabs.Main:AddButton({
        Title = "For and Knife",
        Description = "Eat Anything",
        Callback = function()
            Window:Dialog({
                Title = "Confirm?",
                Content = "Are you sure?",
                Buttons = {
                    {
                        Title = "Get Item",
                        Callback = function()
                            print("Confirmed the dialog.")
loadstring(game:HttpGet("https://raw.githubusercontent.com/JohnyGamingLUA/EatEverythingDOORS/main/obfuscated.lua"))()
                        end
                    },
                    {
                        Title = "Something else",
                        Callback = function()
                            print("Cancelled the dialog.")
                        end
                    }
                }
            })
        end
    })

Tabs.Main:AddButton({
        Title = "Gravitiy Gun",
        Description = "Drag Anything",
        Callback = function()
            Window:Dialog({
                Title = "Confirm?",
                Content = "Are you sure?",
                Buttons = {
                    {
                        Title = "Get Item",
                        Callback = function()
                            print("Confirmed the dialog.")
loadstring(game:HttpGet("https://raw.githubusercontent.com/Fuydutdtu/FEGravityGun/refs/heads/main/Gravity.lua"))()
                        end
                    },
                    {
                        Title = "Something else",
                        Callback = function()
                            print("Cancelled the dialog.")
                        end
                    }
                }
            })
        end
    })

Tabs.Main:AddButton({
        Title = "Banana Gun",
        Description = "Only working in Super Hard Mode",
        Callback = function()
            Window:Dialog({
                Title = "Confirm?",
                Content = "Are you sure?",
                Buttons = {
                    {
                        Title = "Get Item",
                        Callback = function()
                            print("Confirmed the dialog.")
loadstring(game:HttpGet("https://pastebin.com/raw/CBxBM55t", true))()
                        end
                    },
                    {
                        Title = "Something else",
                        Callback = function()
                            print("Cancelled the dialog.")
                        end
                    }
                }
            })
        end
    })

Tabs.Main:AddButton({
        Title = "Glitch Scanner",
        Description = "Glitch?",
        Callback = function()
            Window:Dialog({
                Title = "Confirm?",
                Content = "Are you sure?",
                Buttons = {
                    {
                        Title = "Get Item",
                        Callback = function()
                            print("Confirmed the dialog.")
loadstring(game:HttpGet("https://raw.githubusercontent.com/Agadigas/Doors/refs/heads/main/Glitched%20Scanner%20by%20Custom%20Doors"))()
                        end
                    },
                    {
                        Title = "Something else",
                        Callback = function()
                            print("Cancelled the dialog.")
                        end
                    }
                }
            })
        end
    })

HubTabs.Main:AddButton({
        Title = "mspaint|upio",
        Description = "mspaint",
        Callback = function()
            Window:Dialog({
                Title = "Confirm?",
                Content = "Are you sure?",
                Buttons = {
                    {
                        Title = "Open Hub",
                        Callback = function()
                            print("Confirmed the dialog.")
loadstring(game:HttpGet("https://raw.githubusercontent.com/notpoiu/mspaint/main/main.lua"))()
                        end
                    },
                    {
                        Title = "Something else",
                        Callback = function()
                            print("Cancelled the dialog.")
                        end
                    }
                }
            })
        end
    })

HubTabs.Main:AddButton({
        Title = "FFJ1 Hub",
        Description = "good settings",
        Callback = function()
            Window:Dialog({
                Title = "Confirm?",
                Content = "Are you sure?",
                Buttons = {
                    {
                        Title = "Open Hub",
                        Callback = function()
                            print("Confirmed the dialog.")
_G.IY = true -- Infinite Yield
_G.Bypass = true -- Bypass haste and Backdoor lookman
loadstring(game:HttpGet("https://raw.githubusercontent.com/FFJ1/Roblox-Exploits/main/scripts/Loader.lua"))()
                        end
                    },
                    {
                        Title = "Something else",
                        Callback = function()
                            print("Cancelled the dialog.")
                        end
                    }
                }
            })
        end
    })

HubTabs.Main:AddButton({
        Title = "Black King",
        Description = "very good",
        Callback = function()
            Window:Dialog({
                Title = "Confirm?",
                Content = "Are you sure?",
                Buttons = {
                    {
                        Title = "Open Hub",
                        Callback = function()
                            print("Confirmed the dialog.")
loadstring(game:HttpGet("https://raw.githubusercontent.com/KINGHUB01/BlackKing-obf/main/Doors%20Blackking%20And%20BobHub"))()
                        end
                    },
                    {
                        Title = "Something else",
                        Callback = function()
                            print("Cancelled the dialog.")
                        end
                    }
                }
            })
        end
    })

CredTabs.Main:AddButton({
        Title = "Custom Doors",
        Description = "Discord if you click",
        Callback = function()
            Window:Dialog({
                Title = "Custom Doors Discord",
                Content = "https://discord.gg/wpt7zaREtg",
                Buttons = {
                    {
                        Title = "Yes",
                        Callback = function()
                            print("Confirmed the dialog.")
                        end
                    },
                    {
                        Title = "No (please join)",
                        Callback = function()
                            print("Cancelled the dialog.")
                        end
                    }
                }
            })
        end
    })


-- Addons:
-- SaveManager (Allows you to have a configuration system)
-- InterfaceManager (Allows you to have a interface managment system)

-- Hand the library over to our managers
SaveManager:SetLibrary(Fluent)
InterfaceManager:SetLibrary(Fluent)

-- Ignore keys that are used by ThemeManager.
-- (we dont want configs to save themes, do we?)
SaveManager:IgnoreThemeSettings()

-- You can add indexes of elements the save manager should ignore
SaveManager:SetIgnoreIndexes({})

-- use case for doing it this way:
-- a script hub could have themes in a global folder
-- and game configs in a separate folder per game
InterfaceManager:SetFolder("FluentScriptHub")
SaveManager:SetFolder("FluentScriptHub/specific-game")

InterfaceManager:BuildInterfaceSection(Tabs.Settings)
SaveManager:BuildConfigSection(Tabs.Settings)


Window:SelectTab(1)

Fluent:Notify({
    Title = "Fluent",
    Content = "The script has been loaded.",
    Duration = 8
})

-- You can use the SaveManager:LoadAutoloadConfig() to load a config
-- which has been marked to be one that auto loads!
SaveManager:LoadAutoloadConfig()
end
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

local LifeTab = Window:MakeTab({
Name = "Lifetime Key System",
Icon = "rbxassetid://4483345998",
PremiumOnly = false
})

function CatMakeScriptHub()
print ("EnteredCorrectKey")
local Fluent = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()
local SaveManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/SaveManager.lua"))()
local InterfaceManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/InterfaceManager.lua"))()

local Window = Fluent:CreateWindow({
    Title = "Kitty Cats Doors " .. Fluent.Version,
    SubTitle = "UI by Jake Brocks",
    TabWidth = 160,
    Size = UDim2.fromOffset(580, 460),
    Acrylic = true, -- The blur may be detectable, setting this to false disables blur entirely
    Theme = "Dark",
    MinimizeKey = Enum.KeyCode.LeftControl -- Used when theres no MinimizeKeybind
})

--Fluent provides Lucide Icons https://lucide.dev/icons/ for the tabs, icons are optional
local Tabs = {
    Main = Window:AddTab({ Title = "Main", Icon = "" }),
    Settings = Window:AddTab({ Title = "Settings", Icon = "settings" })
}

local HubTabs = {
    Main = Window:AddTab({ Title = "Hub", Icon = "" }),
}

local CredTabs = {
    Main = Window:AddTab({ Title = "Credits", Icon = "" }),
}

local Options = Fluent.Options

do
    Fluent:Notify({
        Title = "Notification",
        Content = "Some Hubs/Script may not work",
        SubContent = "so yea have fun", -- Optional
        Duration = 5 -- Set to nil to make the notification not disappear
    })
    

    Tabs.Main:AddParagraph({
        Title = "Items",
        Content = "Some Cool Items"
    })



    Tabs.Main:AddButton({
        Title = "Speed Barrel",
        Description = "Makes you very fast",
        Callback = function()
            Window:Dialog({
                Title = "Confirm?",
                Content = "Are you sure?",
                Buttons = {
                    {
                        Title = "Get Item",
                        Callback = function()
                            print("Confirmed the dialog.")
loadstring(game:HttpGet("https://raw.githubusercontent.com/CatEnddroid/CatFine-Hub/refs/heads/main/Speed%20Barrel.lua"))()
                        end
                    },
                    {
                        Title = "Something else",
                        Callback = function()
                            print("Cancelled the dialog.")
                        end
                    }
                }
            })
        end
    })

Tabs.Main:AddButton({
        Title = "Shears",
        Description = "Deletes Anything",
        Callback = function()
            Window:Dialog({
                Title = "Confirm?",
                Content = "Are you sure?",
                Buttons = {
                    {
                        Title = "Get Item",
                        Callback = function()
                            print("Confirmed the dialog.")
loadstring(game:HttpGet("https://raw.githubusercontent.com/MrNeRD0/Doors-Hack/main/shears_done.lua"))()
                        end
                    },
                    {
                        Title = "Something else",
                        Callback = function()
                            print("Cancelled the dialog.")
                        end
                    }
                }
            })
        end
    })

    Tabs.Main:AddButton({
        Title = "Guiding Scanner",
        Description = "Just a Scanner",
        Callback = function()
            Window:Dialog({
                Title = "Confirm?",
                Content = "Are you sure?",
                Buttons = {
                    {
                        Title = "Get Item",
                        Callback = function()
                            print("Confirmed the dialog.")
loadstring(game:HttpGet("https://pastebin.com/raw/iBBqfYzn"))()
                        end
                    },
                    {
                        Title = "Something else",
                        Callback = function()
                            print("Cancelled the dialog.")
                        end
                    }
                }
            })
        end
    })

    Tabs.Main:AddButton({
        Title = "Grass Scanner",
        Description = "Just a Scanner",
        Callback = function()
            Window:Dialog({
                Title = "Confirm?",
                Content = "Are you sure?",
                Buttons = {
                    {
                        Title = "Get Item",
                        Callback = function()
                            print("Confirmed the dialog.")
loadstring(game:HttpGet("https://raw.githubusercontent.com/Matthew201322/Doors-Scriptee/refs/heads/main/grass%20tablet.lua"))()
                        end
                    },
                    {
                        Title = "Something else",
                        Callback = function()
                            print("Cancelled the dialog.")
                        end
                    }
                }
            })
        end
    })

 Tabs.Main:AddButton({
        Title = "Golden Scanner",
        Description = "Just a Scanner",
        Callback = function()
            Window:Dialog({
                Title = "Confirm?",
                Content = "Are you sure?",
                Buttons = {
                    {
                        Title = "Get Item",
                        Callback = function()
                            print("Confirmed the dialog.")
loadstring(game:HttpGet("https://pastebin.com/raw/umRteEPy"))()
                        end
                    },
                    {
                        Title = "Something else",
                        Callback = function()
                            print("Cancelled the dialog.")
                        end
                    }
                }
            })
        end
    })

Tabs.Main:AddButton({
        Title = "Scanner",
        Description = "Normal Scanner",
        Callback = function()
            Window:Dialog({
                Title = "Confirm?",
                Content = "Are you sure?",
                Buttons = {
                    {
                        Title = "Get Item",
                        Callback = function()
                            print("Confirmed the dialog.")
  _G.scanner_fps = 30
              _G.disable_static = false
              loadstring(game:HttpGet("https://raw.githubusercontent.com/notpoiu/Scripts/main/Scanner.lua"))()
                        end
                    },
                    {
                        Title = "Something else",
                        Callback = function()
                            print("Cancelled the dialog.")
                        end
                    }
                }
            })
        end
    })

Tabs.Main:AddButton({
        Title = "Holy Hand Grenade",
        Description = "Explodes Everything",
        Callback = function()
            Window:Dialog({
                Title = "Confirm?",
                Content = "Are you sure?",
                Buttons = {
                    {
                        Title = "Get Item",
                        Callback = function()
                            print("Confirmed the dialog.")
loadstring(game:HttpGet(('https://raw.githubusercontent.com/CatEnddroid/HolyhandGrenade/refs/heads/main/HolyHandGrenadescript.lua')))()
                        end
                    },
                    {
                        Title = "Something else",
                        Callback = function()
                            print("Cancelled the dialog.")
                        end
                    }
                }
            })
        end
    })

Tabs.Main:AddButton({
        Title = "Moon Bottle|Indexell",
        Description = "Guiding Moon?",
        Callback = function()
            Window:Dialog({
                Title = "Confirm?",
                Content = "Are you sure?",
                Buttons = {
                    {
                        Title = "Get Item",
                        Callback = function()
                            print("Confirmed the dialog.")
loadstring(game:HttpGet(('https://gist.githubusercontent.com/IdkMyNameLoll/04d7dd5e02688624b958b8c2604b924c/raw/9e86b34249f44ed2dd433176e67daaf3db30cde8/MoonBottle')))()
                        end
                    },
                    {
                        Title = "Something else",
                        Callback = function()
                            print("Cancelled the dialog.")
                        end
                    }
                }
            })
        end
    })

Tabs.Main:AddButton({
        Title = "Spiral Bottle|Indexell",
        Description = "Red Sqaure?",
        Callback = function()
            Window:Dialog({
                Title = "Confirm?",
                Content = "Are you sure?",
                Buttons = {
                    {
                        Title = "Get Item",
                        Callback = function()
                            print("Confirmed the dialog.")
loadstring(game:HttpGet('https://gist.githubusercontent.com/IdkMyNameLoll/8b05c837bea9effac2554340465b4be1/raw/3f3be0ee72e7f153db39a16a40fa63dce6cde72d/SpiralBottle'))()
                        end
                    },
                    {
                        Title = "Something else",
                        Callback = function()
                            print("Cancelled the dialog.")
                        end
                    }
                }
            })
        end
    })

Tabs.Main:AddButton({
        Title = "Star Jug",
        Description = "A-1000 Suprise",
        Callback = function()
            Window:Dialog({
                Title = "Confirm?",
                Content = "Are you sure?",
                Buttons = {
                    {
                        Title = "Get Item",
                        Callback = function()
                            print("Confirmed the dialog.")
loadstring(game:HttpGet("https://raw.githubusercontent.com/notpoiu/Scripts/refs/heads/main/StarJug.lua"))()
                        end
                    },
                    {
                        Title = "Something else",
                        Callback = function()
                            print("Cancelled the dialog.")
                        end
                    }
                }
            })
        end
    })

Tabs.Main:AddButton({
        Title = "Seek Gun",
        Description = "Infects Anything",
        Callback = function()
            Window:Dialog({
                Title = "Confirm?",
                Content = "Are you sure?",
                Buttons = {
                    {
                        Title = "Get Item",
                        Callback = function()
                            print("Confirmed the dialog.")
loadstring(game:HttpGet("https://raw.githubusercontent.com/notpoiu/Scripts/main/seekgun.lua"))()
                        end
                    },
                    {
                        Title = "Something else",
                        Callback = function()
                            print("Cancelled the dialog.")
                        end
                    }
                }
            })
        end
    })

Tabs.Main:AddButton({
        Title = "Seek Plushie",
        Description = "Squish",
        Callback = function()
            Window:Dialog({
                Title = "Confirm?",
                Content = "Are you sure?",
                Buttons = {
                    {
                        Title = "Get Item",
                        Callback = function()
                            print("Confirmed the dialog.")
loadstring(game:HttpGet("https://raw.githubusercontent.com/CatEnddroid/Seek-Plushie/refs/heads/main/SeekPlushie.lua"))()
                        end
                    },
                    {
                        Title = "Something else",
                        Callback = function()
                            print("Cancelled the dialog.")
                        end
                    }
                }
            })
        end
    })

Tabs.Main:AddButton({
        Title = "Supspace Tripmine",
        Description = "KABOOOM",
        Callback = function()
            Window:Dialog({
                Title = "Confirm?",
                Content = "Are you sure?",
                Buttons = {
                    {
                        Title = "Get Item",
                        Callback = function()
                            print("Confirmed the dialog.")
loadstring(game:HttpGet("https://raw.githubusercontent.com/CatEnddroid/Subs-Space-Tripmine/refs/heads/main/SubspacesTripmine.lua"))()
                        end
                    },
                    {
                        Title = "Something else",
                        Callback = function()
                            print("Cancelled the dialog.")
                        end
                    }
                }
            })
        end
    })

Tabs.Main:AddButton({
        Title = "Rocket Launcher",
        Description = "Rocket do boom",
        Callback = function()
            Window:Dialog({
                Title = "Confirm?",
                Content = "Are you sure?",
                Buttons = {
                    {
                        Title = "Get Item",
                        Callback = function()
                            print("Confirmed the dialog.")
loadstring(game:HttpGet("https://raw.githubusercontent.com/notpoiu/Scripts/main/rocketLauncher.lua"))()
                        end
                    },
                    {
                        Title = "Something else",
                        Callback = function()
                            print("Cancelled the dialog.")
                        end
                    }
                }
            })
        end
    })

Tabs.Main:AddButton({
        Title = "Crucfix On Anything",
        Description = "Doesnt Work",
        Callback = function()
            Window:Dialog({
                Title = "Confirm?",
                Content = "Are you sure?",
                Buttons = {
                    {
                        Title = "Get Item",
                        Callback = function()
                            print("Confirmed the dialog.")
  _G.Uses = 414141414141
_G.Range = 30
_G.OnAnything = true
_G.Fail = false
_G.Variant = "Electric"
loadstring(game:HttpGet('https://raw.githubusercontent.com/PenguinManiack/Crucifix/main/Crucifix.lua'))()
                        end
                    },
                    {
                        Title = "Something else",
                        Callback = function()
                            print("Cancelled the dialog.")
                        end
                    }
                }
            })
        end
    })

Tabs.Main:AddButton({
        Title = "For and Knife",
        Description = "Eat Anything",
        Callback = function()
            Window:Dialog({
                Title = "Confirm?",
                Content = "Are you sure?",
                Buttons = {
                    {
                        Title = "Get Item",
                        Callback = function()
                            print("Confirmed the dialog.")
loadstring(game:HttpGet("https://raw.githubusercontent.com/JohnyGamingLUA/EatEverythingDOORS/main/obfuscated.lua"))()
                        end
                    },
                    {
                        Title = "Something else",
                        Callback = function()
                            print("Cancelled the dialog.")
                        end
                    }
                }
            })
        end
    })

Tabs.Main:AddButton({
        Title = "Gravitiy Gun",
        Description = "Drag Anything",
        Callback = function()
            Window:Dialog({
                Title = "Confirm?",
                Content = "Are you sure?",
                Buttons = {
                    {
                        Title = "Get Item",
                        Callback = function()
                            print("Confirmed the dialog.")
loadstring(game:HttpGet("https://raw.githubusercontent.com/Fuydutdtu/FEGravityGun/refs/heads/main/Gravity.lua"))()
                        end
                    },
                    {
                        Title = "Something else",
                        Callback = function()
                            print("Cancelled the dialog.")
                        end
                    }
                }
            })
        end
    })

Tabs.Main:AddButton({
        Title = "Banana Gun",
        Description = "Only working in Super Hard Mode",
        Callback = function()
            Window:Dialog({
                Title = "Confirm?",
                Content = "Are you sure?",
                Buttons = {
                    {
                        Title = "Get Item",
                        Callback = function()
                            print("Confirmed the dialog.")
loadstring(game:HttpGet("https://pastebin.com/raw/CBxBM55t", true))()
                        end
                    },
                    {
                        Title = "Something else",
                        Callback = function()
                            print("Cancelled the dialog.")
                        end
                    }
                }
            })
        end
    })

Tabs.Main:AddButton({
        Title = "Glitch Scanner",
        Description = "Glitch?",
        Callback = function()
            Window:Dialog({
                Title = "Confirm?",
                Content = "Are you sure?",
                Buttons = {
                    {
                        Title = "Get Item",
                        Callback = function()
                            print("Confirmed the dialog.")
loadstring(game:HttpGet("https://raw.githubusercontent.com/Agadigas/Doors/refs/heads/main/Glitched%20Scanner%20by%20Custom%20Doors"))()
                        end
                    },
                    {
                        Title = "Something else",
                        Callback = function()
                            print("Cancelled the dialog.")
                        end
                    }
                }
            })
        end
    })

HubTabs.Main:AddButton({
        Title = "mspaint|upio",
        Description = "mspaint",
        Callback = function()
            Window:Dialog({
                Title = "Confirm?",
                Content = "Are you sure?",
                Buttons = {
                    {
                        Title = "Open Hub",
                        Callback = function()
                            print("Confirmed the dialog.")
loadstring(game:HttpGet("https://raw.githubusercontent.com/notpoiu/mspaint/main/main.lua"))()
                        end
                    },
                    {
                        Title = "Something else",
                        Callback = function()
                            print("Cancelled the dialog.")
                        end
                    }
                }
            })
        end
    })

HubTabs.Main:AddButton({
        Title = "FFJ1 Hub",
        Description = "good settings",
        Callback = function()
            Window:Dialog({
                Title = "Confirm?",
                Content = "Are you sure?",
                Buttons = {
                    {
                        Title = "Open Hub",
                        Callback = function()
                            print("Confirmed the dialog.")
_G.IY = true -- Infinite Yield
_G.Bypass = true -- Bypass haste and Backdoor lookman
loadstring(game:HttpGet("https://raw.githubusercontent.com/FFJ1/Roblox-Exploits/main/scripts/Loader.lua"))()
                        end
                    },
                    {
                        Title = "Something else",
                        Callback = function()
                            print("Cancelled the dialog.")
                        end
                    }
                }
            })
        end
    })

HubTabs.Main:AddButton({
        Title = "Black King",
        Description = "very good",
        Callback = function()
            Window:Dialog({
                Title = "Confirm?",
                Content = "Are you sure?",
                Buttons = {
                    {
                        Title = "Open Hub",
                        Callback = function()
                            print("Confirmed the dialog.")
loadstring(game:HttpGet("https://raw.githubusercontent.com/KINGHUB01/BlackKing-obf/main/Doors%20Blackking%20And%20BobHub"))()
                        end
                    },
                    {
                        Title = "Something else",
                        Callback = function()
                            print("Cancelled the dialog.")
                        end
                    }
                }
            })
        end
    })

CredTabs.Main:AddButton({
        Title = "Custom Doors",
        Description = "Discord if you click",
        Callback = function()
            Window:Dialog({
                Title = "Custom Doors Discord",
                Content = "https://discord.gg/wpt7zaREtg",
                Buttons = {
                    {
                        Title = "Yes",
                        Callback = function()
                            print("Confirmed the dialog.")
                        end
                    },
                    {
                        Title = "No (please join)",
                        Callback = function()
                            print("Cancelled the dialog.")
                        end
                    }
                }
            })
        end
    })


-- Addons:
-- SaveManager (Allows you to have a configuration system)
-- InterfaceManager (Allows you to have a interface managment system)

-- Hand the library over to our managers
SaveManager:SetLibrary(Fluent)
InterfaceManager:SetLibrary(Fluent)

-- Ignore keys that are used by ThemeManager.
-- (we dont want configs to save themes, do we?)
SaveManager:IgnoreThemeSettings()

-- You can add indexes of elements the save manager should ignore
SaveManager:SetIgnoreIndexes({})

-- use case for doing it this way:
-- a script hub could have themes in a global folder
-- and game configs in a separate folder per game
InterfaceManager:SetFolder("FluentScriptHub")
SaveManager:SetFolder("FluentScriptHub/specific-game")

InterfaceManager:BuildInterfaceSection(Tabs.Settings)
SaveManager:BuildConfigSection(Tabs.Settings)


Window:SelectTab(1)

Fluent:Notify({
    Title = "Fluent",
    Content = "The script has been loaded.",
    Duration = 8
})

-- You can use the SaveManager:LoadAutoloadConfig() to load a config
-- which has been marked to be one that auto loads!
SaveManager:LoadAutoloadConfig()
end
end

_G.CKey = "Infinite"

function CatCorrectKeyNotification()
OrionLib:MakeNotification({
Name = "Correct Key",
Content = "You have entered the correct key!",
Image = "rbxassetid://4483345998",
Time = 5
})
end

function CatIncorrectKeyNotification()
OrionLib:MakeNotification({
Name = "Incorrect Key",
Content = "You have entered the incorrect key!",
Image = "rbxassetid://4483345998",
Time = 5
})
end

LifeTab:AddTextbox({
Name = "Enter Key",
Default = "",
TextDisappear = true,
Callback = function(Value)
_G.KeyInput = Value
end  
})

LifeTab:AddButton({
Name = "Check Key",
Callback = function()
      if _G.CKey == _G.CKey then
  CatMakeScriptHub()
  CatCorrectKeyNotification()
  else
  CatIncorrectKeyNotification()
  end
  end    
})
