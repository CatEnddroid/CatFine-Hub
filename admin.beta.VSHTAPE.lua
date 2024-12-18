--[[Script made by Fates Admins]]--



--[[
        fates admin - 16/11/2022
]]

local game = game
local GetService = game.GetService
if (not game.IsLoaded(game)) then
    local Loaded = game.Loaded
    Loaded.Wait(Loaded);
end

local _L = {}

_L.start = start or tick();
local Debug = true

do
    local F_A = getgenv().F_A
    if (F_A) then
        local Notify, GetConfig = F_A.Utils.Notify, F_A.GetConfig
        local UserInputService = GetService(game, "UserInputService");
        local CommandBarPrefix = GetConfig().CommandBarPrefix
        local StringKeyCode = UserInputService.GetStringForKeyCode(UserInputService, Enum.KeyCode[CommandBarPrefix]);
        return Notify(nil, "Loaded", "fates admin is already loaded... use 'killscript' to kill", nil),
        Notify(nil, "Your Prefix is", string.format("%s (%s)", StringKeyCode, CommandBarPrefix));
    end
end

--IMPORT [var]
local Services = {
    Workspace = GetService(game, "Workspace");
    UserInputService = GetService(game, "UserInputService");
    ReplicatedStorage = GetService(game, "ReplicatedStorage");
    StarterPlayer = GetService(game, "StarterPlayer");
    StarterPack = GetService(game, "StarterPack");
    StarterGui = GetService(game, "StarterGui");
    TeleportService = GetService(game, "TeleportService");
    CoreGui = GetService(game, "CoreGui");
    TweenService = GetService(game, "TweenService");
    HttpService = GetService(game, "HttpService");
    TextService = GetService(game, "TextService");
    MarketplaceService = GetService(game, "MarketplaceService");
    Chat = GetService(game, "Chat");
    Teams = GetService(game, "Teams");
    SoundService = GetService(game, "SoundService");
    Lighting = GetService(game, "Lighting");
    ScriptContext = GetService(game, "ScriptContext");
    Stats = GetService(game, "Stats");
}

setmetatable(Services, {
    __index = function(Table, Property)
        local Ret, Service = pcall(GetService, game, Property);
        if (Ret) then
            Services[Property] = Service
            return Service
        end
        return nil
    end,
    __mode = "v"
});

local GetChildren, GetDescendants = game.GetChildren, game.GetDescendants
local IsA = game.IsA
local FindFirstChild, FindFirstChildOfClass, FindFirstChildWhichIsA, WaitForChild = 
    game.FindFirstChild,
    game.FindFirstChildOfClass,
    game.FindFirstChildWhichIsA,
    game.WaitForChild

local GetPropertyChangedSignal, Changed = 
    game.GetPropertyChangedSignal,
    game.Changed

local Destroy, Clone = game.Destroy, game.Clone

local Heartbeat, Stepped, RenderStepped;
do
    local RunService = Services.RunService;
    Heartbeat, Stepped, RenderStepped =
        RunService.Heartbeat,
        RunService.Stepped,
        RunService.RenderStepped
end

local Players = Services.Players
local GetPlayers = Players.GetPlayers

local JSONEncode, JSONDecode, GenerateGUID = 
    Services.HttpService.JSONEncode, 
    Services.HttpService.JSONDecode,
    Services.HttpService.GenerateGUID

local Camera = Services.Workspace.CurrentCamera

local Tfind, sort, concat, pack, unpack;
do
    local table = table
    Tfind, sort, concat, pack, unpack = 
        table.find, 
        table.sort,
        table.concat,
        table.pack,
        table.unpack
end

local lower, upper, Sfind, split, sub, format, len, match, gmatch, gsub, byte;
do
    local string = string
    lower, upper, Sfind, split, sub, format, len, match, gmatch, gsub, byte = 
        string.lower,
        string.upper,
        string.find,
        string.split, 
        string.sub,
        string.format,
        string.len,
        string.match,
        string.gmatch,
        string.gsub,
        string.byte
end

local random, floor, round, abs, atan, cos, sin, rad;
do
    local math = math
    random, floor, round, abs, atan, cos, sin, rad = 
        math.random,
        math.floor,
        math.round,
        math.abs,
        math.atan,
        math.cos,
        math.sin,
        math.rad
end

local InstanceNew = Instance.new
local CFrameNew = CFrame.new
local Vector3New = Vector3.new

local Inverse, toObjectSpace, components
do
    local CalledCFrameNew = CFrameNew();
    Inverse = CalledCFrameNew.Inverse
    toObjectSpace = CalledCFrameNew.toObjectSpace
    components = CalledCFrameNew.components
end

local Connection = game.Loaded
local CWait = Connection.Wait
local CConnect = Connection.Connect

local Disconnect;
do
    local CalledConnection = CConnect(Connection, function() end);
    Disconnect = CalledConnection.Disconnect
end

local __H = InstanceNew("Humanoid");
local UnequipTools = __H.UnequipTools
local ChangeState = __H.ChangeState
local SetStateEnabled = __H.SetStateEnabled
local GetState = __H.GetState
local GetAccessories = __H.GetAccessories

local LocalPlayer = Players.LocalPlayer
local PlayerGui =  FindFirstChildWhichIsA(LocalPlayer, "PlayerGui");
local Mouse = LocalPlayer.GetMouse(LocalPlayer);

local CThread;
do
    local wrap = coroutine.wrap
    CThread = function(Func, ...)
        if (type(Func) ~= 'function') then
            return nil
        end
        local Varag = ...
        return function()
            local Success, Ret = pcall(wrap(Func, Varag));
            if (Success) then
                return Ret
            end
            if (Debug) then
                warn("[FA Error]: " .. debug.traceback(Ret));
            end
        end
    end
end

local startsWith = function(str, searchString, rawPos)
    local pos = rawPos or 1
    return searchString == "" and true or sub(str, pos, pos) == searchString
end

local trim = function(str)
    return gsub(str, "^%s*(.-)%s*$", "%1");
end

local tbl_concat = function(...)
    local new = {}
    for i, v in next, {...} do
        for i2, v2 in next, v do
            new[i] = v2
        end
    end
    return new
end

local indexOf = function(tbl, val)
    if (type(tbl) == 'table') then
        for i, v in next, tbl do
            if (v == val) then
                return i
            end
        end
    end
end

local forEach = function(tbl, ret)
    for i, v in next, tbl do
        ret(i, v);
    end
end

local filter = function(tbl, ret)
    if (type(tbl) == 'table') then
        local new = {}
        for i, v in next, tbl do
            if (ret(i, v)) then
                new[#new + 1] = v
            end
        end
        return new
    end
end

local map = function(tbl, ret)
    if (type(tbl) == 'table') then
        local new = {}
        for i, v in next, tbl do
            local Value, Key = ret(i, v);
            new[Key or #new + 1] = Value
        end
        return new
    end
end

local deepsearch;
deepsearch = function(tbl, ret)
    if (type(tbl) == 'table') then
        for i, v in next, tbl do
            if (type(v) == 'table') then
                deepsearch(v, ret);
            end
            ret(i, v);
        end
    end
end

local deepsearchset;
deepsearchset = function(tbl, ret, value)
    if (type(tbl) == 'table') then
        local new = {}
        for i, v in next, tbl do
            new[i] = v
            if (type(v) == 'table') then
                new[i] = deepsearchset(v, ret, value);
            end
            if (ret(i, v)) then
                new[i] = value(i, v);
            end
        end
        return new
    end
end

local flat = function(tbl)
    if (type(tbl) == 'table') then
        local new = {}
        deepsearch(tbl, function(i, v)
            if (type(v) ~= 'table') then
                new[#new + 1] = v
            end
        end)
        return new
    end
end

local flatMap = function(tbl, ret)
    if (type(tbl) == 'table') then
        local new = flat(map(tbl, ret));
        return new
    end
end

local shift = function(tbl)
    if (type(tbl) == 'table') then
        local firstVal = tbl[1]
        tbl = pack(unpack(tbl, 2, #tbl));
        tbl.n = nil
        return tbl
    end
end

local keys = function(tbl)
    if (type(tbl) == 'table') then
        local new = {}
        for i, v in next, tbl do
            new[#new + 1] = i        
        end
        return new
    end
end

local function clone(toClone, shallow)
    if (type(toClone) == 'function' and clonefunction) then
        return clonefunction(toClone);
    end
    local new = {}
    for i, v in pairs(toClone) do
        if (type(v) == 'table' and not shallow) then
            v = clone(v);
        end
        new[i] = v
    end
    return new
end

local setthreadidentity = setthreadidentity or syn_context_set or setthreadcontext or (syn and syn.set_thread_identity)
local getthreadidentity = getthreadidentity or syn_context_get or getthreadcontext or (syn and syn.get_thread_identity)

--END IMPORT [var]



local GetCharacter = GetCharacter or function(Plr)
    return Plr and Plr.Character or LocalPlayer.Character
end

local Utils = {}

--IMPORT [extend]
local Stats = Services.Stats
local ContentProvider = Services.ContentProvider

local firetouchinterest, hookfunction;
do
    local GEnv = getgenv();
    local touched = {}
    firetouchinterest = GEnv.firetouchinterest or function(part1, part2, toggle)
        if (part1 and part2) then
            if (toggle == 0) then
                touched[1] = part1.CFrame
                part1.CFrame = part2.CFrame
            else
                part1.CFrame = touched[1]
                touched[1] = nil
            end
        end
    end
    local newcclosure = newcclosure or function(f)
        return f
    end

    hookfunction = GEnv.hookfunction or function(func, newfunc, applycclosure)
        if (replaceclosure) then
            replaceclosure(func, newfunc);
            return func
        end
        func = applycclosure and newcclosure or newfunc
        return func
    end
end

if (not syn_context_set) then
    local CachedConnections = setmetatable({}, {
        __mode = "v"
    });

    GEnv = getgenv();
    getconnections = function(Connection, FromCache, AddOnConnect)
        local getconnections = GEnv.getconnections
        if (not getconnections) then
            return {}
        end

        local CachedConnection;
        for i, v in next, CachedConnections do
            if (i == Connection) then
                CachedConnection = v
                break;
            end
        end
        if (CachedConnection and FromCache) then
            return CachedConnection
        end

        local Connections = GEnv.getconnections(Connection);
        CachedConnections[Connection] = Connections
        return Connections
    end
end

local getrawmetatable = getrawmetatable or function()
    return setmetatable({}, {});
end

local getnamecallmethod = getnamecallmethod or function()
    return ""
end

local checkcaller = checkcaller or function()
    return false
end

local Hooks = {
    AntiKick = false,
    AntiTeleport = false,
    NoJumpCooldown = false,
}

local mt = getrawmetatable(game);
local OldMetaMethods = {}
setreadonly(mt, false);
for i, v in next, mt do
    OldMetaMethods[i] = v
end
setreadonly(mt, true);
local MetaMethodHooks = {}

local ProtectInstance, SpoofInstance, SpoofProperty;
local pInstanceCount = {0, 0}; -- instancecount, primitivescount
local ProtectedInstances = setmetatable({}, {
    __mode = "v"
});
local FocusedTextBox = nil
do
    local SpoofedInstances = setmetatable({}, {
        __mode = "v"
    });
    local SpoofedProperties = {}
    Hooks.SpoofedProperties = SpoofedProperties

    local otherCheck = function(instance, n)
        if (IsA(instance, "ImageLabel") or IsA(instance, "ImageButton")) then
            ProtectedInstances[#ProtectedInstances + 1] = instance
            return;
        end

        if (IsA(instance, "BasePart")) then
            pInstanceCount[2] = math.max(pInstanceCount[2] + (n or 1), 0);
        end
    end

    ProtectInstance = function(Instance_)
        if (not Tfind(ProtectedInstances, Instance_)) then
            ProtectedInstances[#ProtectedInstances + 1] = Instance_
            local descendants = Instance_:GetDescendants();
            pInstanceCount[1] += 1 + #descendants;
            for i = 1, #descendants do
                otherCheck(descendants[i]);
            end
            local dAdded = Instance_.DescendantAdded:Connect(function(descendant)
                pInstanceCount[1] += 1
                otherCheck(descendant);
            end);
            local dRemoving = Instance_.DescendantRemoving:Connect(function(descendant)
                pInstanceCount[1] = math.max(pInstanceCount[1] - 1, 0);
                otherCheck(descendant, -1);
            end);
            otherCheck(Instance_);

            Instance_.Name = sub(gsub(GenerateGUID(Services.HttpService, false), '-', ''), 1, random(25, 30));
            Instance_.Archivable = false
        end
    end

    SpoofInstance = function(Instance_, Instance2)
        if (not SpoofedInstances[Instance_]) then
            SpoofedInstances[Instance_] = Instance2 and Instance2 or Clone(Instance_);
        end
    end

    UnSpoofInstance = function(Instance_)
        if (SpoofedInstances[Instance_]) then
            SpoofedInstances[Instance_] = nil
        end
    end

    local ChangedSpoofedProperties = {}
    SpoofProperty = function(Instance_, Property, NoClone)
        if (SpoofedProperties[Instance_]) then
            local SpoofedPropertiesForInstance = SpoofedProperties[Instance_]
            local Properties = map(SpoofedPropertiesForInstance, function(i, v)
                return v.Property
            end)
            if (not Tfind(Properties, Property)) then
                SpoofedProperties[Instance_][#SpoofedPropertiesForInstance + 1] = {
                    SpoofedProperty = SpoofedPropertiesForInstance[1].SpoofedProperty,
                    Property = Property,
                };
            end
        else
            local Cloned;
            if (not NoClone and IsA(Instance_, "Instance") and not Services[tostring(Instance_)] and Instance_.Archivable) then
                local Success, Ret = pcall(Clone, Instance_);
                if (Success) then
                    Cloned = Ret
                end
            end
            SpoofedProperties[Instance_] = {{
                SpoofedProperty = Cloned and Cloned or {[Property]=Instance_[Property]},
                Property = Property,
            }}
            ChangedSpoofedProperties[Instance_] = {}
        end
    end

    local GetAllParents = function(Instance_, NIV)
        if (typeof(Instance_) == "Instance") then
            local Parents = {}
            local Current = NIV or Instance_
            if (NIV) then
                Parents[#Parents + 1] = Current
            end
            repeat
                local Parent = Current.Parent
                Parents[#Parents + 1] = Parent
                Current = Parent
            until not Current
            return Parents
        end
        return {}
    end

    local Methods = {
        "FindFirstChild",
        "FindFirstChildWhichIsA",
        "FindFirstChildOfClass",
        "IsA"
    }

    local lockedInstances = {};
    setmetatable(lockedInstances, { __mode = "k" });
    local isProtected = function(instance)
        if (lockedInstances[instance]) then
            return true;
        end

        local good2 = pcall(tostring, instance);
        if (not good2) then
            lockedInstances[instance] = true
            return true;
        end

        for i2 = 1, #ProtectedInstances do
            local pInstance = ProtectedInstances[i2]
            if (pInstance == instance) then
                return true;
            end
        end
        return false;
    end

    MetaMethodHooks.Namecall = function(...)
        local __Namecall = OldMetaMethods.__namecall;
        local Args = {...}
        local self = Args[1]
        local Method = getnamecallmethod() or "";

        if (Method ~= "") then
            local Success, result = pcall(OldMetaMethods.__index, self, Method);
            if (not Success or Success and type(result) ~= "function") then
                return __Namecall(...);
            end
        end

        if (Hooks.AntiKick and lower(Method) == "kick") then
            local Player, Message = self, Args[2]
            if (Hooks.AntiKick and Player == LocalPlayer) then
                local Notify = Utils.Notify
                local Context;
                if (setthreadidentity) then
                    Context = getthreadidentity();
                    setthreadidentity(3);
                end
                if (Notify and Context) then
                    Notify(nil, "Attempt to kick", format("attempt to kick %s", (Message and type(Message) == 'number' or type(Message) == 'string') and ": " .. Message or ""));
                    setthreadidentity(Context);
                end
                return
            end
        end

        if (Hooks.AntiTeleport and Method == "Teleport" or Method == "TeleportToPlaceInstance") then
            local Player, PlaceId = self, Args[2]
            if (Hooks.AntiTeleport and Player == LocalPlayer) then
                local Notify = Utils.Notify
                local Context;
                if (setthreadidentity) then
                    Context = getthreadidentity();
                    setthreadidentity(3);
                end
                if (Notify and Context) then
                    Notify(nil, "Attempt to teleport", format("attempt to teleport to place %s", PlaceId and PlaceId or ""));
                    setthreadidentity(Context);
                end
                return
            end
        end

        if (checkcaller()) then
            return __Namecall(...);
        end

        if (Tfind(Methods, Method)) then
            local ReturnedInstance = __Namecall(...);
            if (Tfind(ProtectedInstances, ReturnedInstance)) then
                return Method == "IsA" and false or nil
            end
        end

        -- ik this is horrible but fates admin v3 has a better way of doing hooks
        if (Method == "children" or Method == "GetChildren" or Method ==  "getChildren" or Method == "GetDescendants" or Method == "getDescendants") then
            return filter(__Namecall(...), function(i, instance)
                return not isProtected(instance);
            end);
        end

        if (self == Services.UserInputService and (Method == "GetFocusedTextBox" or Method == "getFocusedTextBox")) then
            local focused = __Namecall(...);
            if (focused) then
                for i = 1, #ProtectedInstances do
                    local ProtectedInstance = ProtectedInstances[i]
                    local iden = getthreadidentity();
                    setthreadidentity(7);
                    local pInstance = Tfind(ProtectedInstances, focused) or focused.IsDescendantOf(focused, ProtectedInstance);
                    setthreadidentity(iden);
                    if (pInstance) then
                        return nil;
                    end
                end
            end
            return focused;
        end

        if (Hooks.NoJumpCooldown and (Method == "GetState" or Method == "GetStateEnabled")) then
            local State = __Namecall(...);
            if (Method == "GetState" and (State == Enum.HumanoidStateType.Jumping or State == "Jumping")) then
                return Enum.HumanoidStateType.RunningNoPhysics
            end
            if (Method == "GetStateEnabled" and (self == Enum.HumanoidStateType.Jumping or self == "Jumping")) then
                return false
            end
        end

        return __Namecall(...);
    end

    local AllowedIndexes = {
        "RootPart",
        "Parent"
    }
    local AllowedNewIndexes = {
        "Jump"
    }
    MetaMethodHooks.Index = function(...)
        local __Index = OldMetaMethods.__index;
        local called = __Index(...);

        if (checkcaller()) then
            return __Index(...);
        end
        local Instance_, Index = ...

        local SanitisedIndex = Index
        if (typeof(Instance_) == 'Instance' and type(Index) == 'string') then
            SanitisedIndex = gsub(sub(Index, 0, 100), "%z.*", "");
        end
        local SpoofedInstance = SpoofedInstances[Instance_]
        local SpoofedPropertiesForInstance = SpoofedProperties[Instance_]

        if (SpoofedInstance) then
            if (Tfind(AllowedIndexes, SanitisedIndex)) then
                return __Index(Instance_, Index);
            end
            return __Index(SpoofedInstance, Index);
        end

        if (SpoofedPropertiesForInstance) then
            for i, SpoofedProperty in next, SpoofedPropertiesForInstance do
                local SanitisedIndex = gsub(SanitisedIndex, "^%l", upper);
                if (SanitisedIndex == SpoofedProperty.Property) then
                    local ClientChangedData = ChangedSpoofedProperties[Instance_][SanitisedIndex]
                    local IndexedSpoofed = __Index(SpoofedProperty.SpoofedProperty, Index);
                    local Indexed = __Index(Instance_, Index);
                    if (ClientChangedData.Caller and ClientChangedData.Value ~= Indexed) then
                        OldMetaMethods.__newindex(SpoofedProperty.SpoofedProperty, Index, Indexed);
                        OldMetaMethods.__newindex(Instance_, Index, ClientChangedData.Value);
                        return Indexed
                    end
                    return IndexedSpoofed
                end
            end
        end

        if (Hooks.NoJumpCooldown and SanitisedIndex == "Jump") then
            if (IsA(Instance_, "Humanoid")) then
                return false
            end
        end

        if (Instance_ == Stats and (SanitisedIndex == "InstanceCount" or SanitisedIndex == "instanceCount")) then
            return called - pInstanceCount[1];
        end

        if (Instance_ == Stats and (SanitisedIndex == "PrimitivesCount" or SanitisedIndex == "primitivesCount")) then
            return called - pInstanceCount[2];
        end

        return called;
    end

    MetaMethodHooks.NewIndex = function(...)
        local __NewIndex = OldMetaMethods.__newindex;
        local __Index = OldMetaMethods.__index;
        local Instance_, Index, Value = ...

        local SpoofedInstance = SpoofedInstances[Instance_]
        local SpoofedPropertiesForInstance = SpoofedProperties[Instance_]

        if (checkcaller()) then
            if (Index == "Parent" and Value) then
                local ProtectedInstance
                for i = 1, #ProtectedInstances do
                    local ProtectedInstance_ = ProtectedInstances[i]
                    if (Instance_ == ProtectedInstance_ or Instance_.IsDescendantOf(Value, ProtectedInstance_)) then
                        ProtectedInstance = true
                    end
                end
                if (ProtectedInstance) then
                    local Parents = GetAllParents(Instance_, Value);
                    local child1 = getconnections(Parents[1].ChildAdded, true);
                    local descendantconnections = {}
                    for i, v in next, child1 do
                        v.Disable(v);
                    end
                    for i = 1, #Parents do
                        local Parent = Parents[i]
                        for i2, v in next, getconnections(Parent.DescendantAdded, true) do
                            v.Disable(v);
                            descendantconnections[#descendantconnections + 1] = v
                        end
                    end
                    local good, Ret = pcall(__NewIndex, ...);
                    for i, v in pairs(descendantconnections) do
                        v:Enable();
                    end
                    for i, v in next, child1 do
                        v.Enable(v);
                    end
                    if (not good) then
                        return __NewIndex(...);
                    end
                    return Ret;
                end
            end
            if (SpoofedInstance or SpoofedPropertiesForInstance) then
                if (SpoofedPropertiesForInstance) then
                    ChangedSpoofedProperties[Instance_][Index] = {
                        Caller = true,
                        BeforeValue = Instance_[Index],
                        Value = Value
                    }
                end
                local Connections = tbl_concat(
                    -- getconnections(GetPropertyChangedSignal(Instance_, SpoofedPropertiesForInstance and SpoofedPropertiesForInstance.Property or Index), true),
                    -- getconnections(Instance_.Changed, true),
                    getconnections(game.ItemChanged, true)
                )

                if (not next(Connections)) then
                    return __NewIndex(Instance_, Index, Value);
                end
                for i, v in next, Connections do
                    v.Disable(v);
                end
                local Ret = __NewIndex(Instance_, Index, Value);
                for i, v in next, Connections do
                    v.Enable(v);
                end
                return Ret
            end
            return __NewIndex(...);
        end

        local SanitisedIndex = Index
        if (typeof(Instance_) == 'Instance' and type(Index) == 'string') then
            local len = select(2, gsub(Index, "%z", ""));
            if (len > 255) then
                return __Index(...);
            end

            SanitisedIndex = gsub(sub(Index, 0, 100), "%z.*", "");
        end

        if (SpoofedInstance) then
            if (Tfind(AllowedNewIndexes, SanitisedIndex)) then
                return __NewIndex(...);
            end
            return __NewIndex(SpoofedInstance, Index, __Index(SpoofedInstance, Index));
        end

        if (SpoofedPropertiesForInstance) then
            for i, SpoofedProperty in next, SpoofedPropertiesForInstance do
                if (SpoofedProperty.Property == SanitisedIndex and not Tfind(AllowedIndexes, SanitisedIndex)) then
                    ChangedSpoofedProperties[Instance_][SanitisedIndex] = {
                        Caller = false,
                        BeforeValue = Instance_[Index],
                        Value = Value
                    }
                    return __NewIndex(SpoofedProperty.SpoofedProperty, Index, Value);
                end
            end
        end

        return __NewIndex(...);
    end

    local hookmetamethod = hookmetamethod or function(metatable, metamethod, func)
        setreadonly(metatable, false);
        Old = hookfunction(metatable[metamethod], func, true);
        setreadonly(metatable, true);
        return Old
    end

    OldMetaMethods.__index = hookmetamethod(game, "__index", MetaMethodHooks.Index);
    OldMetaMethods.__newindex = hookmetamethod(game, "__newindex", MetaMethodHooks.NewIndex);
    OldMetaMethods.__namecall = hookmetamethod(game, "__namecall", MetaMethodHooks.Namecall);

    Hooks.Destroy = hookfunction(game.Destroy, function(...)
        local instance = ...
        local protected = table.find(ProtectedInstances, instance);
        if (checkcaller() and protected) then
            otherCheck(instance, -1);
            local Parents = GetAllParents(instance);
            for i, v in next, getconnections(Parents[1].ChildRemoved, true) do
                v.Disable(v);
            end
            for i = 1, #Parents do
                local Parent = Parents[i]
                for i2, v in next, getconnections(Parent.DescendantRemoving, true) do
                    v.Disable(v);
                end
            end
            local destroy = Hooks.Destroy(...);
            for i = 1, #Parents do
                local Parent = Parents[i]
                for i2, v in next, getconnections(Parent.DescendantRemoving, true) do
                    v.Enable(v);
                end
            end
            for i, v in next, getconnections(Parents[1].ChildRemoved, true) do
                v.Enable(v);
            end
            table.remove(ProtectedInstances, protected);
            return destroy;
        end
        return Hooks.Destroy(...);
    end);
end

Hooks.OldGetChildren = hookfunction(game.GetChildren, newcclosure(function(...)
    if (not checkcaller()) then
        local Children = Hooks.OldGetChildren(...);
        return filter(Children, function(i, v)
            return not Tfind(ProtectedInstances, v);
        end)
    end
    return Hooks.OldGetChildren(...);
end));

Hooks.OldGetDescendants = hookfunction(game.GetDescendants, newcclosure(function(...)
    if (not checkcaller()) then
        local Descendants = Hooks.OldGetDescendants(...);
        return filter(Descendants, function(i, v)
            local Protected = false
            for i2 = 1, #ProtectedInstances do
                local ProtectedInstance = ProtectedInstances[i2]
                Protected = v and ProtectedInstance == v or v.IsDescendantOf(v, ProtectedInstance)
                if (Protected) then
                    break;
                end
            end
            return not Protected
        end)
    end
    return Hooks.OldGetDescendants(...);
end));

Hooks.FindFirstChild = hookfunction(game.FindFirstChild, newcclosure(function(...)
    if (not checkcaller()) then
        local ReturnedInstance = Hooks.FindFirstChild(...);
        if (ReturnedInstance and Tfind(ProtectedInstances, ReturnedInstance)) then
            return nil
        end
    end
    return Hooks.FindFirstChild(...);
end));
Hooks.FindFirstChildOfClass = hookfunction(game.FindFirstChildOfClass, newcclosure(function(...)
    if (not checkcaller()) then
        local ReturnedInstance = Hooks.FindFirstChildOfClass(...);
        if (ReturnedInstance and Tfind(ProtectedInstances, ReturnedInstance)) then
            return nil
        end
    end
    return Hooks.FindFirstChildOfClass(...);
end));
Hooks.FindFirstChildWhichIsA = hookfunction(game.FindFirstChildWhichIsA, newcclosure(function(...)
    if (not checkcaller()) then
        local ReturnedInstance = Hooks.FindFirstChildWhichIsA(...);
        if (ReturnedInstance and Tfind(ProtectedInstances, ReturnedInstance)) then
            return nil
        end
    end
    return Hooks.FindFirstChildWhichIsA(...);
end));
Hooks.IsA = hookfunction(game.IsA, newcclosure(function(...)
    if (not checkcaller()) then
        local Args = {...}
        local IsACheck = Args[1]
        if (IsACheck) then
            local ProtectedInstance = Tfind(ProtectedInstances, IsACheck);
            if (ProtectedInstance and Args[2]) then
                return false
            end
        end
    end
    return Hooks.IsA(...);
end));

Hooks.OldGetFocusedTextBox = hookfunction(Services.UserInputService.GetFocusedTextBox, newcclosure(function(...)
    if (not checkcaller() and ... == Services.UserInputService) then
        local FocusedTextBox = Hooks.OldGetFocusedTextBox(...);
        if(FocusedTextBox) then
            local Protected = false
            for i = 1, #ProtectedInstances do
                local ProtectedInstance = ProtectedInstances[i]
                Protected = Tfind(ProtectedInstances, FocusedTextBox) or FocusedTextBox.IsDescendantOf(FocusedTextBox, ProtectedInstance);
            end
            if (Protected) then
                return nil
            end
        end
        return FocusedTextBox;
    end
    return Hooks.OldGetFocusedTextBox(...);
end));

Hooks.OldKick = hookfunction(LocalPlayer.Kick, newcclosure(function(...)
    local Player, Message = ...
    if (Hooks.AntiKick and Player == LocalPlayer) then
        local Notify = Utils.Notify
        local Context;
        if (setthreadidentity) then
            Context = getthreadidentity();
            setthreadidentity(3);
        end
        if (Notify and Context) then
            Notify(nil, "Attempt to kick", format("attempt to kick %s", (Message and type(Message) == 'number' or type(Message) == 'string') and ": " .. Message or ""));
            setthreadidentity(Context)
        end
        return
    end
    return Hooks.OldKick(...);
end))

Hooks.OldTeleportToPlaceInstance = hookfunction(Services.TeleportService.TeleportToPlaceInstance, newcclosure(function(...)
    local Player, PlaceId = ...
    if (Hooks.AntiTeleport and Player == LocalPlayer) then
        local Notify = Utils.Notify
        local Context;
        if (setthreadidentity) then
            Context = getthreadidentity();
            setthreadidentity(3);
        end
        if (Notify and Context) then
            Notify(nil, "Attempt to teleport", format("attempt to teleport to place %s", PlaceId and PlaceId or ""));
            setthreadidentity(Context)
        end
        return
    end
    return Hooks.OldTeleportToPlaceInstance(...);
end))
Hooks.OldTeleport = hookfunction(Services.TeleportService.Teleport, newcclosure(function(...)
    local Player, PlaceId = ...
    if (Hooks.AntiTeleport and Player == LocalPlayer) then
        local Notify = Utils.Notify
        local Context;
        if (setthreadidentity) then
            Context = getthreadidentity();
            setthreadidentity(3);
        end
        if (Notify and Context) then
            Notify(nil, "Attempt to teleport", format("attempt to teleport to place \"%s\"", PlaceId and PlaceId or ""));
            setthreadidentity(Context);
        end
        return
    end
    return Hooks.OldTeleport(...);
end))

Hooks.GetState = hookfunction(GetState, function(...)
    local Humanoid, State = ..., Hooks.GetState(...);
    local Parent, Character = Humanoid.Parent, LocalPlayer.Character
    if (Hooks.NoJumpCooldown and (State == Enum.HumanoidStateType.Jumping or State == "Jumping") and Parent and Character and Parent == Character) then
        return Enum.HumanoidStateType.RunningNoPhysics
    end
    return State
end)

Hooks.GetStateEnabled = hookfunction(__H.GetStateEnabled, function(...)
    local Humanoid, State = ...
    local Ret = Hooks.GetStateEnabled(...);
    local Parent, Character = Humanoid.Parent, LocalPlayer.Character
    if (Hooks.NoJumpCooldown and (State == Enum.HumanoidStateType.Jumping or State == "Jumping") and Parent and Character and Parent == Character) then
        return false
    end
    return Ret
end)
--END IMPORT [extend]



local GetRoot = function(Plr, Char)
    local LCharacter = GetCharacter();
    local Character = Char or GetCharacter(Plr);
    return Plr and Character and (FindFirstChild(Character, "HumanoidRootPart") or FindFirstChild(Character, "Torso") or FindFirstChild(Character, "UpperTorso")) or LCharacter and (FindFirstChild(LCharacter, "HumanoidRootPart") or FindFirstChild(LCharacter, "Torso") or FindFirstChild(LCharacter, "UpperTorso"));
end

local GetHumanoid = function(Plr, Char)
    local LCharacter = GetCharacter();
    local Character = Char or GetCharacter(Plr);
    return Plr and Character and FindFirstChildWhichIsA(Character, "Humanoid") or LCharacter and FindFirstChildWhichIsA(LCharacter, "Humanoid");
end

local GetMagnitude = function(Plr, Char)
    local LRoot = GetRoot();
    local Root = GetRoot(Plr, Char);
    return Plr and Root and (Root.Position - LRoot.Position).magnitude or math.huge
end

local Settings = {
    Prefix = "!",
    CommandBarPrefix = "Semicolon",
    ChatPrediction = false,
    Macros = {},
    Aliases = {},
}
local PluginSettings = {
    PluginsEnabled = true,
    PluginDebug = false,
    DisabledPlugins = {
        ["PluginName"] = true
    },
    SafePlugins = false
}

local WriteConfig = function(Destroy)
    local JSON = JSONEncode(Services.HttpService, Settings);
    local PluginJSON = JSONEncode(Services.HttpService, PluginSettings);
    if (isfolder("fates-admin") and Destroy) then
        delfolder("fates-admin");
        writefile("fates-admin/config.json", JSON);
        writefile("fates/admin/pluings/plugin-conf.json", PluginJSON);
    else
        makefolder("fates-admin");
        makefolder("fates-admin/plugins");
        makefolder("fates-admin/chatlogs");
        writefile("fates-admin/config.json", JSON);
        writefile("fates-admin/plugins/plugin-conf.json", PluginJSON);
    end
end

local GetConfig = function()
    if (isfolder("fates-admin") and isfile("fates-admin/config.json")) then
        return JSONDecode(Services.HttpService, readfile("fates-admin/config.json"));
    else
        WriteConfig();
        return JSONDecode(Services.HttpService, readfile("fates-admin/config.json"));
    end
end

local GetPluginConfig = function()
    if (isfolder("fates-admin") and isfolder("fates-admin/plugins") and isfile("fates-admin/plugins/plugin-conf.json")) then
        local JSON = JSONDecode(Services.HttpService, readfile("fates-admin/plugins/plugin-conf.json"));
        return JSON
    else
        WriteConfig();
        return JSONDecode(Services.HttpService, readfile("fates-admin/plugins/plugin-conf.json"));
    end
end

local SetPluginConfig = function(conf)
    if (isfolder("fates-admin") and isfolder("fates-admin/plugins") and isfile("fates-admin/plugins/plugin-conf.json")) then
        WriteConfig();
    end
    local NewConfig = GetPluginConfig();
    for i, v in next, conf do
        NewConfig[i] = v
    end
    writefile("fates-admin/plugins/plugin-conf.json", JSONEncode(Services.HttpService, NewConfig));
end

local SetConfig = function(conf)
    if (not isfolder("fates-admin") and isfile("fates-admin/config.json")) then
        WriteConfig();
    end
    local NewConfig = GetConfig();
    for i, v in next, conf do
        NewConfig[i] = v
    end
    writefile("fates-admin/config.json", JSONEncode(Services.HttpService, NewConfig));
end

local CurrentConfig = GetConfig();
local Prefix = isfolder and CurrentConfig.Prefix or "!"
local Macros = CurrentConfig.Macros or {}
local AdminUsers = AdminUsers or {}
local Exceptions = Exceptions or {}
local Connections = {
    Players = {}
}
_L.CLI = false
_L.ChatLogsEnabled = true
_L.GlobalChatLogsEnabled = false
_L.HttpLogsEnabled = true

local GetPlayer;
GetPlayer = function(str, noerror)
    local CurrentPlayers = filter(GetPlayers(Players), function(i, v)
        return not Tfind(Exceptions, v);
    end)
    if (not str) then
        return {}
    end
    str = lower(trim(str));
    if (Sfind(str, ",")) then
        return flatMap(split(str, ","), function(i, v)
            return GetPlayer(v, noerror);
        end)
    end

    local Magnitudes = map(CurrentPlayers, function(i, v)
        return {v,(GetRoot(v).CFrame.p - GetRoot().CFrame.p).Magnitude}
    end)

    local PlayerArgs = {
        ["all"] = function()
            return filter(CurrentPlayers, function(i, v) -- removed all arg (but not really) due to commands getting messed up and people getting confused
                return v ~= LocalPlayer
            end)
        end,
        ["others"] = function()
            return filter(CurrentPlayers, function(i, v)
                return v ~= LocalPlayer
            end)
        end,
        ["nearest"] = function()
            sort(Magnitudes, function(a, b)
                return a[2] < b[2]
            end)
            return {Magnitudes[2][1]}
        end,
        ["farthest"] = function()
            sort(Magnitudes, function(a, b)
                return a[2] > b[2]
            end)
            return {Magnitudes[2][1]}
        end,
        ["random"] = function()
            return {CurrentPlayers[random(2, #CurrentPlayers)]}
        end,
        ["allies"] = function()
            local LTeam = LocalPlayer.Team
            return filter(CurrentPlayers, function(i, v)
                return v.Team == LTeam
            end)
        end,
        ["enemies"] = function()
            local LTeam = LocalPlayer.Team
            return filter(CurrentPlayers, function(i, v)
                return v.Team ~= LTeam
            end)
        end,
        ["npcs"] = function()
            local NPCs = {}
            local Descendants = GetDescendants(Workspace);
            local GetPlayerFromCharacter = Players.GetPlayerFromCharacter
            for i = 1, #Descendants do
                local Descendant = Descendants[i]
                local DParent = Descendant.Parent
                if (IsA(Descendant, "Humanoid") and IsA(DParent, "Model") and (FindFirstChild(DParent, "HumanoidRootPart") or FindFirstChild(DParent, "Head")) and GetPlayerFromCharacter(Players, DParent) == nil) then
                    local FakePlr = InstanceNew("Player"); -- so it can be compatible with commands
                    FakePlr.Character = DParent
                    FakePlr.Name = format("%s %s", DParent.Name, "- " .. Descendant.DisplayName);
                    NPCs[#NPCs + 1] = FakePlr
                end
            end
            return NPCs
        end,
        ["me"] = function()
            return {LocalPlayer}
        end
    }

    if (PlayerArgs[str]) then
        return PlayerArgs[str]();
    end

    local Players = filter(CurrentPlayers, function(i, v)
        return (sub(lower(v.Name), 1, #str) == str) or (sub(lower(v.DisplayName), 1, #str) == str);
    end)
    if (not next(Players) and not noerror) then
        Utils.Notify(LocalPlayer, "Fail", format("Couldn't find player %s", str));
    end
    return Players
end

local AddConnection = function(Connection, CEnv, TblOnly)
    if (CEnv) then
        CEnv[#CEnv + 1] = Connection
        if (TblOnly) then
            return Connection
        end
    end
    Connections[#Connections + 1] = Connection
    return Connection
end

local LastCommand = {}

--IMPORT [ui]
Guis = {}
ParentGui = function(Gui, Parent)
    Gui.Name = sub(gsub(GenerateGUID(Services.HttpService, false), '-', ''), 1, random(25, 30))
    ProtectInstance(Gui);
    if (syn and syn.protect_gui) then syn.protect_gui(Gui); end -- for preload
    Gui.Parent = Parent or Services.CoreGui
    Guis[#Guis + 1] = Gui
    return Gui
end
UI = Clone(Services.InsertService:LoadLocalAsset("rbxassetid://7882275026"));
UI.Enabled = true

local CommandBarPrefix;

local ConfigUI = UI.Config
local ConfigElements = ConfigUI.GuiElements
local CommandBar = UI.CommandBar
local Commands = UI.Commands
local ChatLogs = UI.ChatLogs
local Console = UI.Console
local GlobalChatLogs = Clone(UI.ChatLogs);
local HttpLogs = Clone(UI.ChatLogs);
local Notification = UI.Notification
local Command = UI.Command
local ChatLogMessage = UI.Message
local GlobalChatLogMessage = Clone(UI.Message);
local NotificationBar = UI.NotificationBar

CommandBarOpen = false
CommandBarTransparencyClone = Clone(CommandBar);
ChatLogsTransparencyClone = Clone(ChatLogs);
ConsoleTransparencyClone = Clone(Console);
GlobalChatLogsTransparencyClone = Clone(GlobalChatLogs);
HttpLogsTransparencyClone = Clone(HttpLogs);
CommandsTransparencyClone = nil
ConfigUIClone = Clone(ConfigUI);
PredictionText = ""
do
    local UIParent = CommandBar.Parent
    GlobalChatLogs.Parent = UIParent
    GlobalChatLogMessage.Parent = UIParent
    GlobalChatLogs.Name = "GlobalChatLogs"
    GlobalChatLogMessage.Name = "GlobalChatLogMessage"

    HttpLogs.Parent = UIParent
    HttpLogs.Name = "HttpLogs"
    HttpLogs.Size = UDim2.new(0, 421, 0, 260);
    HttpLogs.Search.PlaceholderText = "Search"
end
-- position CommandBar
CommandBar.Position = UDim2.new(0.5, -100, 1, 5);

local UITheme, Values;
do
    local BaseBGColor = Color3.fromRGB(32, 33, 36);
    local BaseTransparency = 0.25
    local BaseTextColor = Color3.fromRGB(220, 224, 234);
    local BaseValues = { BackgroundColor = BaseBGColor, Transparency = BaseTransparency, TextColor = BaseTextColor }
    Values = { Background = clone(BaseValues), CommandBar = clone(BaseValues), CommandList = clone(BaseValues), Notification = clone(BaseValues), ChatLogs = clone(BaseValues), Config = clone(BaseValues) }
    local Objects = keys(Values);
    local GetBaseMT = function(Object)
        return setmetatable({}, {
            __newindex = function(self, Index, Value)
                local type = typeof(Value);
                if (Index == "BackgroundColor") then
                    if (Value == "Reset") then
                        Value = BaseBGColor
                        type = "Color3"
                    end
                    assert(type == 'Color3', format("invalid argument #3 (Color3 expected, got %s)", type));
                    if (Object == "Background") then
                        CommandBar.BackgroundColor3 = Value
                        Notification.BackgroundColor3 = Value
                        Command.BackgroundColor3 = Value
                        ChatLogs.BackgroundColor3 = Value
                        ChatLogs.Frame.BackgroundColor3 = Value
                        Console.BackgroundColor3 = Value
                        Console.Frame.BackgroundColor3 = Value
                        HttpLogs.BackgroundColor3 = Value
                        HttpLogs.Frame.BackgroundColor3 = Value
                        UI.ToolTip.BackgroundColor3 = Value
                        ConfigUI.BackgroundColor3 = Value
                        ConfigUI.Container.BackgroundColor3 = Value
                        Commands.BackgroundColor3 = Value
                        Commands.Frame.BackgroundColor3 = Value
                        local Children = GetChildren(UI.NotificationBar);
                        for i = 1, #Children do
                            local Child = Children[i]
                            if (IsA(Child, "GuiObject")) then
                                Child.BackgroundColor3 = Value
                            end
                        end
                        local Children = GetChildren(Commands.Frame.List);
                        for i = 1, #Children do
                            local Child = Children[i]
                            if (IsA(Child, "GuiObject")) then
                                Child.BackgroundColor3 = Value
                            end
                        end
                        for i, v in next, Values do
                            Values[i].BackgroundColor = Value
                        end
                    elseif (Object == "CommandBar") then
                        CommandBar.BackgroundColor3 = Value
                    elseif (Object == "Notification") then
                        Notification.BackgroundColor3 = Value
                        local Children = GetChildren(UI.NotificationBar);
                        for i = 1, #Children do
                            local Child = Children[i]
                            if (IsA(Child, "GuiObject")) then
                                Child.BackgroundColor3 = Value
                            end
                        end
                    elseif (Object == "CommandList") then
                        Commands.BackgroundColor3 = Value
                        Commands.Frame.BackgroundColor3 = Value
                    elseif (Object == "Command") then
                        Command.BackgroundColor3 = Value
                    elseif (Object == "ChatLogs") then
                        ChatLogs.BackgroundColor3 = Value
                        ChatLogs.Frame.BackgroundColor3 = Value
                        HttpLogs.BackgroundColor3 = Value
                        HttpLogs.Frame.BackgroundColor3 = Value
                    elseif (Object == "Console") then
                        Console.BackgroundColor3 = Value
                        Console.Frame.BackgroundColor3 = Value
                    elseif (Object == "Config") then
                        ConfigUI.BackgroundColor3 = Value
                        ConfigUI.Container.BackgroundColor3 = Value
                    end
                    Values[Object][Index] = Value
                elseif (Index == "TextColor") then
                    if (Value == "Reset") then
                        Value = BaseTextColor
                        type = "Color3"
                    end
                    assert(type == 'Color3', format("invalid argument #3 (Color3 expected, got %s)", type));
                    if (Object == "Notification") then
                        Notification.Title.TextColor3 = Value
                        Notification.Message.TextColor3 = Value
                        Notification.Close.TextColor3 = Value
                    elseif (Object == "CommandBar") then
                        CommandBar.Input.TextColor3 = Value
                        CommandBar.Arrow.TextColor3 = Value
                    elseif (Object == "CommandList") then
                        Command.CommandText.TextColor3 = Value
                        local Descendants = GetDescendants(Commands);
                        for i = 1, #Descendants do
                            local Descendant = Descendants[i]
                            local IsText = IsA(Descendant, "TextBox") or IsA(Descendant, "TextLabel") or IsA(Descendant, "TextButton");
                            if (IsText) then
                                Descendant.TextColor3 = Value
                            end
                        end
                    elseif (Object == "ChatLogs") then
                        UI.Message.TextColor3 = Value
                    elseif (Object == "Config") then
                        local Descendants = GetDescendants(ConfigUI);
                        for i = 1, #Descendants do
                            local Descendant = Descendants[i]
                            local IsText = IsA(Descendant, "TextBox") or IsA(Descendant, "TextLabel") or IsA(Descendant, "TextButton");
                            if (IsText) then
                                Descendant.TextColor3 = Value
                            end
                        end
                    elseif (Object == "Background") then
                        Notification.Title.TextColor3 = Value
                        Notification.Message.TextColor3 = Value
                        Notification.Close.TextColor3 = Value
                        CommandBar.Input.TextColor3 = Value
                        CommandBar.Arrow.TextColor3 = Value
                        Command.CommandText.TextColor3 = Value
                        UI.Message.TextColor3 = Value
                        local Descendants = GetDescendants(ConfigUI);
                        for i = 1, #Descendants do
                            local Descendant = Descendants[i]
                            local IsText = IsA(Descendant, "TextBox") or IsA(Descendant, "TextLabel") or IsA(Descendant, "TextButton");
                            if (IsText) then
                                Descendant.TextColor3 = Value
                            end
                        end
                        local Descendants = GetDescendants(Commands);
                        for i = 1, #Descendants do
                            local Descendant = Descendants[i]
                            local IsText = IsA(Descendant, "TextBox") or IsA(Descendant, "TextLabel") or IsA(Descendant, "TextButton");
                            if (IsText) then
                                Descendant.TextColor3 = Value
                            end
                        end
                        for i, v in next, Values do
                            Values[i].TextColor = Value
                        end
                    end
                    Values[Object][Index] = Value
                elseif (Index == "Transparency") then
                    if (Value == "Reset") then
                        Value = BaseTransparency
                        type = "number"
                    end
                    assert(type == 'number', format("invalid argument #3 (Color3 expected, got %s)", type));
                    if (Object == "Background") then
                        CommandBar.Transparency = Value
                        Notification.Transparency = Value
                        Command.Transparency = Value + .5
                        ChatLogs.Transparency = Value
                        ChatLogs.Frame.Transparency = Value
                        HttpLogs.Transparency = Value
                        HttpLogs.Frame.Transparency = Value
                        UI.ToolTip.Transparency = Value
                        ConfigUI.Transparency = Value
                        ConfigUI.Container.Transparency = Value + .5
                        Commands.Transparency = Value
                        Commands.Frame.Transparency = Value + .5
                        Values[Object][Index] = Value
                    elseif (Object == "Notification") then
                        Notification.Transparency = Value
                        local Children = GetChildren(UI.NotificationBar);
                        for i = 1, #Children do
                            local Child = Children[i]
                            if (IsA(Child, "GuiObject")) then
                                Child.Transparency = Value
                            end
                        end
                    end
                    Values[Object][Index] = Value
                end
            end,
            __index = function(self, Index)
                return Values[Object][Index]
            end
        })
    end
    UITheme = setmetatable({}, {
        __index = function(self, Index)
            if (Tfind(Objects, Index)) then
                local BaseMt = GetBaseMT(Index);
                self[Index] = BaseMt
                return BaseMt
            end
        end
    })
end

local IsSupportedExploit = isfile and isfolder and writefile and readfile

local GetThemeConfig
local WriteThemeConfig = function(Conf)
    if (IsSupportedExploit and isfolder("fates-admin")) then
        local ToHSV = Color3.new().ToHSV
        local ValuesToEncode = deepsearchset(Values, function(i, v)
            return typeof(v) == 'Color3'
        end, function(i, v)
            local H, S, V = ToHSV(v);
            return {H, S, V, "Color3"}
        end)
        local Data = JSONEncode(Services.HttpService, ValuesToEncode);
        writefile("fates-admin/Theme.json", Data);
    end
end

GetThemeConfig = function()
    if (IsSupportedExploit and isfolder("fates-admin")) then
        if (isfile("fates-admin/Theme.json")) then
            local Success, Data = pcall(JSONDecode, Services.HttpService, readfile("fates-admin/Theme.json"));
            if (not Success or type(Data) ~= 'table') then
                WriteThemeConfig();
                return Values
            end
            local DecodedData = deepsearchset(Data, function(i, v)
                return type(v) == 'table' and #v == 4 and v[4] == "Color3"
            end, function(i,v)
                return Color3.fromHSV(v[1], v[2], v[3]);
            end)
            return DecodedData            
        else
            WriteThemeConfig();
            return Values
        end
    else
        return Values
    end
end

local LoadTheme;
do
    local Config = GetConfig();
    CommandBarPrefix = isfolder and (Config.CommandBarPrefix and Enum.KeyCode[Config.CommandBarPrefix] or Enum.KeyCode.Semicolon) or Enum.KeyCode.Semicolon

    local Theme = GetThemeConfig();
    LoadTheme = function(Theme)
        UITheme.Background.BackgroundColor = Theme.Background.BackgroundColor
        UITheme.Background.Transparency = Theme.Background.Transparency

        UITheme.ChatLogs.BackgroundColor = Theme.ChatLogs.BackgroundColor
        UITheme.CommandBar.BackgroundColor = Theme.CommandBar.BackgroundColor
        UITheme.Config.BackgroundColor = Theme.Config.BackgroundColor
        UITheme.Notification.BackgroundColor = Theme.Notification.BackgroundColor
        UITheme.CommandList.BackgroundColor = Theme.Notification.BackgroundColor

        UITheme.ChatLogs.TextColor = Theme.ChatLogs.TextColor
        UITheme.CommandBar.TextColor = Theme.CommandBar.TextColor
        UITheme.Config.TextColor = Theme.Config.TextColor
        UITheme.Notification.TextColor = Theme.Notification.TextColor
        UITheme.CommandList.TextColor = Theme.Notification.TextColor

        UITheme.ChatLogs.Transparency = Theme.ChatLogs.Transparency
        UITheme.CommandBar.Transparency = Theme.CommandBar.Transparency
        UITheme.Config.Transparency = Theme.Config.Transparency
        UITheme.Notification.Transparency = Theme.Notification.Transparency
        UITheme.CommandList.Transparency = Theme.Notification.Transparency
    end
    LoadTheme(Theme);
end
--END IMPORT [ui]



--IMPORT [utils]
Utils.Tween = function(Object, Style, Direction, Time, Goal)
    local TweenService = Services.TweenService
    local TInfo = TweenInfo.new(Time, Enum.EasingStyle[Style], Enum.EasingDirection[Direction])
    local Tween = TweenService.Create(TweenService, Object, TInfo, Goal)

    Tween.Play(Tween)

    return Tween
end

Utils.MultColor3 = function(Color, Delta)
    local clamp = math.clamp
    return Color3.new(clamp(Color.R * Delta, 0, 1), clamp(Color.G * Delta, 0, 1), clamp(Color.B * Delta, 0, 1));
end

Utils.Click = function(Object, Goal) -- Utils.Click(Object, "BackgroundColor3")
    local Hover = {
        [Goal] = Utils.MultColor3(Object[Goal], 0.9)
    }

    local Press = {
        [Goal] = Utils.MultColor3(Object[Goal], 1.2)
    }

    local Origin = {
        [Goal] = Object[Goal]
    }

    AddConnection(CConnect(Object.MouseEnter, function()
        Utils.Tween(Object, "Sine", "Out", .5, Hover);
    end));

    AddConnection(CConnect(Object.MouseLeave, function()
        Utils.Tween(Object, "Sine", "Out", .5, Origin);
    end));

    AddConnection(CConnect(Object.MouseButton1Down, function()
        Utils.Tween(Object, "Sine", "Out", .3, Press);
    end));

    AddConnection(CConnect(Object.MouseButton1Up, function()
        Utils.Tween(Object, "Sine", "Out", .4, Hover);
    end));
end

Utils.Blink = function(Object, Goal, Color1, Color2) -- Utils.Click(Object, "BackgroundColor3", NormalColor, OtherColor)
    local Normal = {
        [Goal] = Color1
    }

    local Blink = {
        [Goal] = Color2
    }

    local Tween = Utils.Tween(Object, "Sine", "Out", .5, Blink)
    CWait(Tween.Completed);

    Tween = Utils.Tween(Object, "Sine", "Out", .5, Normal)
    CWait(Tween.Completed);
end

Utils.Hover = function(Object, Goal)
    local Hover = {
        [Goal] = Utils.MultColor3(Object[Goal], 0.9)
    }

    local Origin = {
        [Goal] = Object[Goal]
    }

    AddConnection(CConnect(Object.MouseEnter, function()
        Utils.Tween(Object, "Sine", "Out", .5, Hover);
    end));

    AddConnection(CConnect(Object.MouseLeave, function()
        Utils.Tween(Object, "Sine", "Out", .5, Origin);
    end));
end

Utils.Draggable = function(Ui, DragUi)
    local DragSpeed = 0
    local StartPos
    local DragToggle, DragInput, DragStart, DragPos

    DragUi = Dragui or Ui
    local TweenService = Services.TweenService

    local function UpdateInput(Input)
        local Delta = Input.Position - DragStart
        local Position = UDim2.new(StartPos.X.Scale, StartPos.X.Offset + Delta.X, StartPos.Y.Scale, StartPos.Y.Offset + Delta.Y)

        Utils.Tween(Ui, "Linear", "Out", .25, {
            Position = Position
        });
        local Tween = TweenService.Create(TweenService, Ui, TweenInfo.new(0.25), {Position = Position});
        Tween.Play(Tween);
    end

    AddConnection(CConnect(Ui.InputBegan, function(Input)
        if ((Input.UserInputType == Enum.UserInputType.MouseButton1 or Input.UserInputType == Enum.UserInputType.Touch) and Services.UserInputService.GetFocusedTextBox(Services.UserInputService) == nil) then
            DragToggle = true
            DragStart = Input.Position
            StartPos = Ui.Position

            AddConnection(CConnect(Input.Changed, function()
                if (Input.UserInputState == Enum.UserInputState.End) then
                    DragToggle = false
                end
            end));
        end
    end));

    AddConnection(CConnect(Ui.InputChanged, function(Input)
        if (Input.UserInputType == Enum.UserInputType.MouseMovement or Input.UserInputType == Enum.UserInputType.Touch) then
            DragInput = Input
        end
    end));

    AddConnection(CConnect(Services.UserInputService.InputChanged, function(Input)
        if (Input == DragInput and DragToggle) then
            UpdateInput(Input)
        end
    end));
end

Utils.SmoothScroll = function(content, SmoothingFactor) -- by Elttob
    -- get the 'content' scrolling frame, aka the scrolling frame with all the content inside
    -- if smoothing is enabled, disable scrolling
    content.ScrollingEnabled = false

    -- create the 'input' scrolling frame, aka the scrolling frame which receives user input
    -- if smoothing is enabled, enable scrolling
    local input = Clone(content)

    input.ClearAllChildren(input);
    input.BackgroundTransparency = 1
    input.ScrollBarImageTransparency = 1
    input.ZIndex = content.ZIndex + 1
    input.Name = "_smoothinputframe"
    input.ScrollingEnabled = true
    input.Parent = content.Parent

    -- keep input frame in sync with content frame
    local function syncProperty(prop)
        AddConnection(CConnect(GetPropertyChangedSignal(content, prop), function()
            if prop == "ZIndex" then
                -- keep the input frame on top!
                input[prop] = content[prop] + 1
            else
                input[prop] = content[prop]
            end
        end));
    end

    syncProperty "CanvasSize"
    syncProperty "Position"
    syncProperty "Rotation"
    syncProperty "ScrollingDirection"
    syncProperty "ScrollBarThickness"
    syncProperty "BorderSizePixel"
    syncProperty "ElasticBehavior"
    syncProperty "SizeConstraint"
    syncProperty "ZIndex"
    syncProperty "BorderColor3"
    syncProperty "Size"
    syncProperty "AnchorPoint"
    syncProperty "Visible"

    -- create a render stepped connection to interpolate the content frame position to the input frame position
    local smoothConnection = AddConnection(CConnect(RenderStepped, function()
        local a = content.CanvasPosition
        local b = input.CanvasPosition
        local c = SmoothingFactor
        local d = (b - a) * c + a

        content.CanvasPosition = d
    end));

    AddConnection(CConnect(content.AncestryChanged, function()
        if content.Parent == nil then
            Destroy(input);
            Disconnect(smoothConnection);
        end
    end));
end

Utils.TweenAllTransToObject = function(Object, Time, BeforeObject) -- max transparency is max object transparency, swutched args bc easier command
    local Descendants = GetDescendants(Object);
    local OldDescentants = GetDescendants(BeforeObject);
    local Tween -- to use to wait

    Tween = Utils.Tween(Object, "Sine", "Out", Time, {
        BackgroundTransparency = BeforeObject.BackgroundTransparency
    })

    for i = 1, #Descendants do
        local v = Descendants[i]
        local IsText = IsA(v, "TextBox") or IsA(v, "TextLabel") or IsA(v, "TextButton")
        local IsImage = IsA(v, "ImageLabel") or IsA(v, "ImageButton")
        local IsScrollingFrame = IsA(v, "ScrollingFrame")

        if (IsA(v, "GuiObject")) then
            if (IsText) then
                Utils.Tween(v, "Sine", "Out", Time, {
                    TextTransparency = OldDescentants[i].TextTransparency,
                    TextStrokeTransparency = OldDescentants[i].TextStrokeTransparency,
                    BackgroundTransparency = OldDescentants[i].BackgroundTransparency
                })
            elseif (IsImage) then
                Utils.Tween(v, "Sine", "Out", Time, {
                    ImageTransparency = OldDescentants[i].ImageTransparency,
                    BackgroundTransparency = OldDescentants[i].BackgroundTransparency
                })
            elseif (IsScrollingFrame) then
                Utils.Tween(v, "Sine", "Out", Time, {
                    ScrollBarImageTransparency = OldDescentants[i].ScrollBarImageTransparency,
                    BackgroundTransparency = OldDescentants[i].BackgroundTransparency
                })
            else
                Utils.Tween(v, "Sine", "Out", Time, {
                    BackgroundTransparency = OldDescentants[i].BackgroundTransparency
                })
            end
        end
    end

    return Tween
end

Utils.SetAllTrans = function(Object)
    Object.BackgroundTransparency = 1

    local Descendants = GetDescendants(Object);
    for i = 1, #Descendants do
        local v = Descendants[i]
        local IsText = IsA(v, "TextBox") or IsA(v, "TextLabel") or IsA(v, "TextButton")
        local IsImage = IsA(v, "ImageLabel") or IsA(v, "ImageButton")
        local IsScrollingFrame = IsA(v, "ScrollingFrame")

        if (IsA(v, "GuiObject")) then
            v.BackgroundTransparency = 1

            if (IsText) then
                v.TextTransparency = 1
            elseif (IsImage) then
                v.ImageTransparency = 1
            elseif (IsScrollingFrame) then
                v.ScrollBarImageTransparency = 1
            end
        end
    end
end

Utils.TweenAllTrans = function(Object, Time)
    local Tween -- to use to wait

    Tween = Utils.Tween(Object, "Sine", "Out", Time, {
        BackgroundTransparency = 1
    })

    local Descendants = GetDescendants(Object);
    for i = 1, #Descendants do
        local v = Descendants[i]
        local IsText = IsA(v, "TextBox") or IsA(v, "TextLabel") or IsA(v, "TextButton")
        local IsImage = IsA(v, "ImageLabel") or IsA(v, "ImageButton")
        local IsScrollingFrame = IsA(v, "ScrollingFrame")

        if (IsA(v, "GuiObject")) then
            if (IsText) then
                Utils.Tween(v, "Sine", "Out", Time, {
                    TextTransparency = 1,
                    BackgroundTransparency = 1
                })
            elseif (IsImage) then
                Utils.Tween(v, "Sine", "Out", Time, {
                    ImageTransparency = 1,
                    BackgroundTransparency = 1
                })
            elseif (IsScrollingFrame) then
                Utils.Tween(v, "Sine", "Out", Time, {
                    ScrollBarImageTransparency = 1,
                    BackgroundTransparency = 1
                })
            else
                Utils.Tween(v, "Sine", "Out", Time, {
                    BackgroundTransparency = 1
                })
            end
        end
    end

    return Tween
end

Utils.TextSize = function(Object)
    local TextService = Services.TextService
    return TextService.GetTextSize(TextService, Object.Text, Object.TextSize, Object.Font, Vector2.new(Object.AbsoluteSize.X, 1000)).Y
end

Utils.Notify = function(Caller, Title, Message, Time)
    if (not Caller or Caller == LocalPlayer) then
        local Notification = UI.Notification
        local NotificationBar = UI.NotificationBar

        local Clone = Clone(Notification)

        local function TweenDestroy()
            if (Utils and Clone) then
                local Tween = Utils.TweenAllTrans(Clone, .25)

                CWait(Tween.Completed)
                Destroy(Clone);
            end
        end

        Clone.Message.Text = Message
        Clone.Title.Text = Title or "Notification"
        Utils.SetAllTrans(Clone)
        Utils.Click(Clone.Close, "TextColor3")
        Clone.Visible = true
            Clone.Size = UDim2.fromOffset(Clone.Size.X.Offset, Utils.TextSize(Clone.Message) + Clone.Size.Y.Offset - Clone.Message.TextSize);
        Clone.Parent = NotificationBar

        coroutine.wrap(function()
            local Tween = Utils.TweenAllTransToObject(Clone, .5, Notification)

            CWait(Tween.Completed);
            wait(Time or 5);

            if (Clone) then
                TweenDestroy();
            end
        end)()

        AddConnection(CConnect(Clone.Close.MouseButton1Click, TweenDestroy));
        if (Title ~= "Warning" and Title ~= "Error") then
            Utils.Print(format("%s - %s", Title, Message), Caller, true);
        end

        return Clone
    else
        local ChatRemote = Services.ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest
        ChatRemote.FireServer(ChatRemote, format("/w %s [FA] %s: %s", Caller.Name, Title, Message), "All");
    end
end

Utils.MatchSearch = function(String1, String2)
    return String1 == sub(String2, 1, #String1);
end

Utils.StringFind = function(Table, String)
    for _, v in ipairs(Table) do
        if (Utils.MatchSearch(String, v)) then
            return v
        end
    end
end

Utils.GetPlayerArgs = function(Arg)
    Arg = lower(Arg);
    local SpecialCases = {"all", "others", "random", "me", "nearest", "farthest", "npcs", "allies", "enemies"}
    if (Utils.StringFind(SpecialCases, Arg)) then
        return Utils.StringFind(SpecialCases, Arg);
    end

    local CurrentPlayers = GetPlayers(Players);
    for i, v in next, CurrentPlayers do
        local Name, DisplayName = v.Name, v.DisplayName
        if (Name ~= DisplayName and Utils.MatchSearch(Arg, lower(DisplayName))) then
            return lower(DisplayName);
        end
        if (Utils.MatchSearch(Arg, lower(Name))) then
            return lower(Name);
        end
    end
end

Utils.ToolTip = function(Object, Message)
    local CloneToolTip
    local TextService = Services.TextService

    AddConnection(CConnect(Object.MouseEnter, function()
        if (Object.BackgroundTransparency < 1 and not CloneToolTip) then
            local TextSize = TextService.GetTextSize(TextService, Message, 12, Enum.Font.Gotham, Vector2.new(200, math.huge)).Y > 24

            CloneToolTip = Clone(UI.ToolTip)
            CloneToolTip.Text = Message
            CloneToolTip.TextScaled = TextSize
            CloneToolTip.Visible = true
            CloneToolTip.Parent = UI
        end
    end))

    AddConnection(CConnect(Object.MouseLeave, function()
        if (CloneToolTip) then
            Destroy(CloneToolTip);
            CloneToolTip = nil
        end
    end))

    if (LocalPlayer) then
        AddConnection(CConnect(Mouse.Move, function()
            if (CloneToolTip) then
                CloneToolTip.Position = UDim2.fromOffset(Mouse.X + 10, Mouse.Y + 10)
            end
        end))
    else
        delay(3, function()
            LocalPlayer = Players.LocalPlayer
            AddConnection(CConnect(Mouse.Move, function()
                if (CloneToolTip) then
                    CloneToolTip.Position = UDim2.fromOffset(Mouse.X + 10, Mouse.Y + 10)
                end
            end))
        end)
    end
end

Utils.ClearAllObjects = function(Object)
    local Children = GetChildren(Object);
    for i = 1, #Children do
        local Child = Children[i]
        if (IsA(Child, "GuiObject")) then
            Destroy(Child);
        end
    end
end

Utils.Rainbow = function(TextObject)
    local Text = TextObject.Text
    local Frequency = 1 -- determines how quickly it repeats
    local TotalCharacters = 0
    local Strings = {}

    TextObject.RichText = true

    for Character in gmatch(Text, ".") do
        if match(Character, "%s") then
            Strings[#Strings + 1] = Character
        else
            TotalCharacters = TotalCharacters + 1
            Strings[#Strings + 1] = {'<font color="rgb(%i, %i, %i)">' .. Character .. '</font>'}
        end
    end

    local Connection = AddConnection(CConnect(Heartbeat, function()
        local String = ""
        local Counter = TotalCharacters

        for _, CharacterTable in ipairs(Strings) do
            local Concat = ""

            if (type(CharacterTable) == "table") then
                Counter = Counter - 1
                local Color = Color3.fromHSV(-atan(math.tan((tick() + Counter/math.pi)/Frequency))/math.pi + 0.5, 1, 1)

                CharacterTable = format(CharacterTable[1], floor(Color.R * 255), floor(Color.G * 255), floor(Color.B * 255))
            end

            String = String .. CharacterTable
        end

        TextObject.Text = String .. " "
    end));
    delay(150, function()
        Disconnect(Connection);
    end)

end

Utils.Vector3toVector2 = function(Vector)
    local Tuple = WorldToViewportPoint(Camera, Vector);
    return Vector2New(Tuple.X, Tuple.Y);
end

Utils.AddTag = function(Tag)
    if (not Tag) then
        return
    end
    local PlrCharacter = GetCharacter(Tag.Player)
    if (not PlrCharacter) then
        return
    end
    local Billboard = InstanceNew("BillboardGui");
    Billboard.Parent = UI
    Billboard.Name = GenerateGUID(Services.HttpService);
    Billboard.AlwaysOnTop = true
    Billboard.Adornee = FindFirstChild(PlrCharacter, "Head") or nil
    Billboard.Enabled = FindFirstChild(PlrCharacter, "Head") and true or false
    Billboard.Size = UDim2.new(0, 200, 0, 50)
    Billboard.StudsOffset = Vector3New(0, 4, 0);

    local TextLabel = InstanceNew("TextLabel", Billboard);
    TextLabel.Name = GenerateGUID(Services.HttpService);
    TextLabel.TextStrokeTransparency = 0.6
    TextLabel.BackgroundTransparency = 1
    TextLabel.TextColor3 = Color3.new(0, 255, 0);
    TextLabel.Size = UDim2.new(0, 200, 0, 50);
    TextLabel.TextScaled = false
    TextLabel.TextSize = 15
    TextLabel.Text = format("%s (%s)", Tag.Name, Tag.Tag);

    if (Tag.Rainbow) then
        Utils.Rainbow(TextLabel)
    end
    if (Tag.Colour) then
        local TColour = Tag.Colour
        TextLabel.TextColor3 = Color3.fromRGB(TColour[1], TColour[2], TColour[3]);
    end

    local Added = AddConnection(CConnect(Tag.Player.CharacterAdded, function()
        Billboard.Adornee = WaitForChild(Tag.Player.Character, "Head");
    end));

    AddConnection(CConnect(Players.PlayerRemoving, function(plr)
        if (plr == Tag.Player) then
            Disconnect(Added);
            Destroy(Billboard);
        end
    end))
end

Utils.TextFont = function(Text, RGB)
    RGB = concat(RGB, ",")
    local New = {}
    gsub(Text, ".", function(x)
        New[#New + 1] = x
    end)
    return concat(map(New, function(i, letter)
        return format('<font color="rgb(%s)">%s</font>', RGB, letter)
    end)) .. " "
end

Utils.Thing = function(Object)
    local Container = InstanceNew("Frame");
    local Hitbox = InstanceNew("ImageButton");
    local UDim2fromOffset = UDim2.fromOffset

    Container.Name = "Container"
    Container.Parent = Object.Parent
    Container.BackgroundTransparency = 1.000
    Container.BorderSizePixel = 0
    Container.Position = Object.Position
    Container.ClipsDescendants = true
    Container.Size = UDim2fromOffset(Object.AbsoluteSize.X, Object.AbsoluteSize.Y);
    Container.ZIndex = Object

    Object.AutomaticSize = Enum.AutomaticSize.X
    Object.Size = UDim2.fromScale(1, 1)
    Object.Position = UDim2.fromScale(0, 0)
    Object.Parent = Container
    Object.TextTruncate = Enum.TextTruncate.None
    Object.ZIndex = Object.ZIndex + 2

    Hitbox.Name = "Hitbox"
    Hitbox.Parent = Container.Parent
    Hitbox.BackgroundTransparency = 1.000
    Hitbox.Size = Container.Size
    Hitbox.Position = Container.Position
    Hitbox.ZIndex = Object.ZIndex + 2

    local MouseOut = true

    AddConnection(CConnect(Hitbox.MouseEnter, function()
        if Object.AbsoluteSize.X > Container.AbsoluteSize.X then
            MouseOut = false
            repeat
                local Tween1 = Utils.Tween(Object, "Quad", "Out", .5, {
                    Position = UDim2fromOffset(Container.AbsoluteSize.X - Object.AbsoluteSize.X, 0);
                })
                CWait(Tween1.Completed);
                wait(.5);
                local Tween2 = Utils.Tween(Object, "Quad", "Out", .5, {
                    Position = UDim2fromOffset(0, 0);
                })
                CWait(Tween2.Completed);
                wait(.5);
            until MouseOut
        end
    end))

    AddConnection(CConnect(Hitbox.MouseLeave, function()
        MouseOut = true
        Utils.Tween(Object, "Quad", "Out", .25, {
            Position = UDim2fromOffset(0, 0);
        });
    end))

    return Object
end

function Utils.Intro(Object)
        local Frame = InstanceNew("Frame");
        local UICorner = InstanceNew("UICorner");
        local CornerRadius = FindFirstChild(Object, "UICorner") and Object.UICorner.CornerRadius or UDim.new(0, 0)
    local UDim2fromOffset  = UDim2.fromOffset

        Frame.Name = "IntroFrame"
        Frame.ZIndex = 1000
        Frame.Size = UDim2fromOffset(Object.AbsoluteSize.X, Object.AbsoluteSize.Y)
        Frame.AnchorPoint = Vector2.new(.5, .5)
        Frame.Position = UDim2.new(Object.Position.X.Scale, Object.Position.X.Offset + (Object.AbsoluteSize.X / 2), Object.Position.Y.Scale, Object.Position.Y.Offset + (Object.AbsoluteSize.Y / 2))
        Frame.BackgroundColor3 = Object.BackgroundColor3
        Frame.BorderSizePixel = 0

        UICorner.CornerRadius = CornerRadius
        UICorner.Parent = Frame

        Frame.Parent = Object.Parent

        if (Object.Visible) then
                Frame.BackgroundTransparency = 1

                local Tween = Utils.Tween(Frame, "Quad", "Out", .25, {
                        BackgroundTransparency = 0
                });

                CWait(Tween.Completed);
                Object.Visible = false

                local Tween = Utils.Tween(Frame, "Quad", "Out", .25, {
                        Size = UDim2fromOffset(0, 0);
                });

                Utils.Tween(UICorner, "Quad", "Out", .25, {
                        CornerRadius = UDim.new(1, 0)
                });

                CWait(Tween.Completed);
                Destroy(Frame);
        else
                Frame.Visible = true
                Frame.Size = UDim2fromOffset(0, 0)
                UICorner.CornerRadius = UDim.new(1, 0)

                local Tween = Utils.Tween(Frame, "Quad", "Out", .25, {
                        Size = UDim2fromOffset(Object.AbsoluteSize.X, Object.AbsoluteSize.Y)
                });

                Utils.Tween(UICorner, "Quad", "Out", .25, {
                        CornerRadius = CornerRadius
                });

                CWait(Tween.Completed);
                Object.Visible = true

                local Tween = Utils.Tween(Frame, "Quad", "Out", .25, {
                        BackgroundTransparency = 1
                })

                CWait(Tween.Completed);
                Destroy(Frame);
        end
end

Utils.MakeGradient = function(ColorTable)
        local Table = {}
    local ColorSequenceKeypointNew = ColorSequenceKeypoint.new
        for Time, Color in next, ColorTable do
                Table[#Table + 1] = ColorSequenceKeypointNew(Time - 1, Color);
        end
        return ColorSequence.new(Table)
end

Utils.Debounce = function(Func)
        local Debounce = false

        return function(...)
                if (not Debounce) then
                        Debounce = true
                        Func(...);
                        Debounce = false
                end
        end
end

Utils.ToggleFunction = function(Container, Enabled, Callback) -- fpr color picker
    local Switch = Container.Switch
    local Hitbox = Container.Hitbox
    local Color3fromRGB = Color3.fromRGB
    local UDim2fromOffset = UDim2.fromOffset

    Container.BackgroundColor3 = Color3fromRGB(255, 79, 87);

    if not Enabled then
        Switch.Position = UDim2fromOffset(2, 2)
        Container.BackgroundColor3 = Color3fromRGB(25, 25, 25);
    end

    AddConnection(CConnect(Hitbox.MouseButton1Click, function()
        Enabled = not Enabled

        Utils.Tween(Switch, "Quad", "Out", .25, {
            Position = Enabled and UDim2.new(1, -18, 0, 2) or UDim2fromOffset(2, 2)
        });
        Utils.Tween(Container, "Quad", "Out", .25, {
            BackgroundColor3 = Enabled and Color3fromRGB(255, 79, 87) or Color3fromRGB(25, 25, 25);
        });

        Callback(Enabled);
    end));
end

do
    local AmountPrint, AmountWarn, AmountError = 0, 0, 0;

    Utils.Warn = function(Text, Plr)
        local TimeOutputted = os.date("%X");
        local Clone = Clone(UI.MessageOut);

        Clone.Name = "W" .. tostring(AmountWarn + 1);
        Clone.Text = format("%s -- %s", TimeOutputted, Text);
        Clone.TextColor3 = Color3.fromRGB(255, 218, 68);
        Clone.Visible = true
        Clone.TextTransparency = 1
        Clone.Parent = Console.Frame.List

        Utils.Tween(Clone, "Sine", "Out", .25, {
            TextTransparency = 0
        })

        Console.Frame.List.CanvasSize = UDim2.fromOffset(0, Console.Frame.List.UIListLayout.AbsoluteContentSize.Y);
        AmountWarn = AmountWarn + 1
        Utils.Notify(Plr, "Warning", Text);
    end

    Utils.Error = function(Text, Caller, FromNotif)
        local TimeOutputted = os.date("%X");
        local Clone = Clone(UI.MessageOut);

        Clone.Name = "E" .. tostring(AmountError + 1);
        Clone.Text = format("%s -- %s", TimeOutputted, Text);
        Clone.TextColor3 = Color3.fromRGB(215, 90, 74);
        Clone.Visible = true
        Clone.TextTransparency = 1
        Clone.Parent = Console.Frame.List

        Utils.Tween(Clone, "Sine", "Out", .25, {
            TextTransparency = 0
        })

        Console.Frame.List.CanvasSize = UDim2.fromOffset(0, Console.Frame.List.UIListLayout.AbsoluteContentSize.Y);
        AmountError = AmountError + 1
    end

    Utils.Print = function(Text, Caller, FromNotif)
        local TimeOutputted = os.date("%X");
        local Clone = Clone(UI.MessageOut);

        Clone.Name = "P" .. tostring(AmountPrint + 1);
        Clone.Text = format("%s -- %s", TimeOutputted, Text);
        Clone.Visible = true
        Clone.TextTransparency = 1
        Clone.Parent = Console.Frame.List

        Utils.Tween(Clone, "Sine", "Out", .25, {
            TextTransparency = 0
        })

        Console.Frame.List.CanvasSize = UDim2.fromOffset(0, Console.Frame.List.UIListLayout.AbsoluteContentSize.Y);
        AmountPrint = AmountPrint + 1
        if (len(Text) <= 35 and not FromNotif) then
            Utils.Notify(Caller, "Output", Text);
        end
    end
end
--END IMPORT [utils]



-- commands table
local CommandsTable = {}
local RespawnTimes = {}

local HasTool = function(plr)
    plr = plr or LocalPlayer
    local CharChildren, BackpackChildren = GetChildren(GetCharacter(plr)), GetChildren(plr.Backpack);
    local ToolFound = false
    local tbl = tbl_concat(CharChildren, BackpackChildren);
    for i = 1, #tbl do
        local v = tbl[i]
        if (IsA(v, "Tool")) then
            ToolFound = true
            break;
        end
    end
    return ToolFound
end

local isR6 = function(plr)
    plr = plr or LocalPlayer
    local Humanoid = GetHumanoid(plr);
    if (Humanoid) then
        return Humanoid.RigType == Enum.HumanoidRigType.R6
    end
    return false
end

local isSat = function(plr)
    plr = plr or LocalPlayer
    local Humanoid = GetHumanoid(plr)
    if (Humanoid) then
        return Humanoid.Sit
    end
end

local DisableAnimate = function()
    local Animate = GetCharacter().Animate
    Animate = IsA(Animate, "LocalScript") and Animate or nil
    if (Animate) then
        SpoofProperty(Animate, "Disabled");
        Animate.Disabled = true
    end
end

local GetCorrectToolWithHandle = function()
    local Tools = filter(tbl_concat(GetChildren(LocalPlayer.Backpack), GetChildren(LocalPlayer.Character)), function(i, Tool)
        local Correct = IsA(Tool, "Tool");
        if (Correct and (Tool.RequiresHandle or FindFirstChild(Tool, "Handle"))) then
            local Descendants = GetDescendants(Tool);
            for i = 1, #Descendants do
                local Descendant = Descendants[i]
                if (IsA(Descendant, "Sound") or IsA(Descendant, "Camera") or IsA(Descendant, "LocalScript")) then
                    Destroy(Descendant);
                end
            end
            return true
        end
        return false
    end)

    return Tools[1]
end

local CommandRequirements = {
    [1] = {
        Func = HasTool,
        Message = "You need a tool for this command"
    },
    [2] = {
        Func = isR6,
        Message = "You need to be R6 for this command"
    },
    [3] = {
        Func = function()
            return GetCharacter() ~= nil
        end,
        Message = "You need to be spawned for this command"
    }
}

local AddCommand = function(name, aliases, description, options, func, isplugin)
    local Cmd = {
        Name = name,
        Aliases = aliases,
        Description = description,
        Options = options,
        Function = function()
            for i, v in next, options do
                if (type(v) == 'function' and v() == false) then
                    Utils.Warn("You are missing something that is needed for this command", LocalPlayer);
                    return nil
                elseif (type(v) == 'number' and CommandRequirements[v].Func() == false) then
                    Utils.Warn(CommandRequirements[v].Message, LocalPlayer);
                    return nil
                end
            end
            return func
        end,
        ArgsNeeded = tonumber(filter(options, function(i,v)
            return type(v) == "string"
        end)[1]) or 0,
        Args = filter(options, function(i, v)
            return type(v) == "table"
        end)[1] or {},
        CmdEnv = {},
        IsPlugin = isplugin == true
    }

    CommandsTable[name] = Cmd
    if (type(aliases) == 'table') then
        for i, v in next, aliases do
            CommandsTable[v] = Cmd
        end
    end
    return Success
end

local RemoveCommand = function(Name)
    local Command = LoadCommand(Name);
    if (Command) then
        CommandsTable[Name] = nil
        local CommandsList = Commands.Frame.List
        local CommandLabel = FindFirstChild(CommandsList, Name);
        if (CommandLabel) then
            Destroy(CommandLabel);
        end
        return true
    end
    return false
end

local LoadCommand = function(Name)
    return rawget(CommandsTable, Name);
end

local PluginConf;
local ExecuteCommand = function(Name, Args, Caller)
    local Command = LoadCommand(Name);
    if (Command) then
        if (Command.ArgsNeeded > #Args) then
            return Utils.Warn(format("Insuficient Args (you need %d)", Command.ArgsNeeded), LocalPlayer);
        end

        local Context;
        local sett, gett = syn and syn_context_set or setidentity, syn and syn_context_get or getidentity
        if (Command.IsPlugin and sett and gett and PluginConf.SafePlugins) then
            Context = gett();
            sett(2);
        end
        local Success, Ret = xpcall(function()
            local Func = Command.Function();
            if (Func) then
                local Executed = Func(Caller, Args, Command.CmdEnv);
                if (Executed) then
                    Utils.Notify(Caller, "Command", Executed);
                end
                if (Command.Name ~= "lastcommand") then
                    if (#LastCommand == 3) then
                        LastCommand = shift(LastCommand);
                    end
                    LastCommand[#LastCommand + 1] = {Command.Name, Args, Caller, Command.CmdEnv}
                end
            end
            Success = true
        end, function(Err)
            if (Debug) then
                Utils.Error(format("[FA CMD Error]: Command = '%s' Traceback = '%s'", Name, debug.traceback(Err)), Caller);
                Utils.Notify(Caller, "Error", format("error in the '%s' command, more info shown in console", Name));
            end
        end);
        if (Command.IsPlugin and sett and PluginConf.SafePlugins and Context) then
            sett(Context);
        end
    else
        Utils.Warn("couldn't find the command " .. Name, Caller);
    end
end

local ReplaceHumanoid = function(Hum, R)
    local Humanoid = Hum or GetHumanoid();
    local NewHumanoid = Clone(Humanoid);
    if (R) then
        NewHumanoid.Name = "1"
    end
    NewHumanoid.Parent = Humanoid.Parent
    NewHumanoid.Name = Humanoid.Name
    Services.Workspace.Camera.CameraSubject = NewHumanoid
    Destroy(Humanoid);
    SpoofInstance(NewHumanoid);
    return NewHumanoid
end

local ReplaceCharacter = function()
    local Char = LocalPlayer.Character
    local Model = InstanceNew("Model");
    LocalPlayer.Character = Model
    LocalPlayer.Character = Char
    Destroy(Model);
    return Char
end

local CFrameTool = function(tool, pos)
    local RightArm = FindFirstChild(GetCharacter(), "RightLowerArm") or FindFirstChild(GetCharacter(), "Right Arm");
    local Arm = RightArm.CFrame * CFrameNew(0, -1, 0, 1, 0, 0, 0, 0, 1, 0, -1, 0);
    local Frame = Inverse(toObjectSpace(Arm, pos));

    tool.Grip = Frame
end

local Sanitize = function(value)
    if typeof(value) == 'CFrame' then
        local components = {components(value)}
        for i,v in pairs(components) do
            components[i] = floor(v * 10000 + .5) / 10000
        end
        return 'CFrame.new('..concat(components, ', ')..')'
    end
end

local AddPlayerConnection = function(Player, Connection, CEnv)
    if (CEnv) then
        CEnv[#CEnv + 1] = Connection
    else
        Connections.Players[Player.Name].Connections[#Connections.Players[Player.Name].Connections + 1] = Connection
    end
    return Connection
end


local DisableAllCmdConnections = function(Cmd)
    local Command = LoadCommand(Cmd)
    if (Command and Command.CmdEnv) then
        for i, v in next, flat(Command.CmdEnv) do
            if (type(v) == 'userdata' and v.Disconnect) then
                Disconnect(v);
            end
        end
    end
    return Command
end

local Keys = {}

do
    local UserInputService = Services.UserInputService
    local IsKeyDown = UserInputService.IsKeyDown
    local WindowFocused = true
    AddConnection(CConnect(UserInputService.WindowFocusReleased, function()
        WindowFocused = false
    end));
    AddConnection(CConnect(UserInputService.WindowFocused, function()
        WindowFocused = true
    end));
    local GetFocusedTextBox = UserInputService.GetFocusedTextBox
    AddConnection(CConnect(UserInputService.InputBegan, function(Input, GameProcessed)
        Keys["GameProcessed"] = GameProcessed and WindowFocused and not (not GetFocusedTextBox(UserInputService));
        Keys["LastEntered"] = Input.KeyCode
        if (GameProcessed) then return end
        local KeyCode = split(tostring(Input.KeyCode), ".")[3]
        Keys[KeyCode] = true
        for i = 1, #Macros do
            local Macro = Macros[i]
            if (Tfind(Macro.Keys, Input.KeyCode)) then
                if (#Macro.Keys == 2) then
                    if (IsKeyDown(UserInputService, Macro.Keys[1]) and IsKeyDown(UserInputService, Macro.Keys[2]) --[[and Macro.Keys[1] == Input.KeyCode]]) then
                        ExecuteCommand(Macro.Command, Macro.Args);
                    end
                else
                    ExecuteCommand(Macro.Command, Macro.Args);
                end
            end
        end

        if (Input.KeyCode == Enum.KeyCode.F8) then
            if (Console.Visible) then
                local Tween = Utils.TweenAllTrans(Console, .25)
                CWait(Tween.Completed);
                Console.Visible = false
            else
                local MessageClone = Clone(Console.Frame.List);

                Utils.ClearAllObjects(Console.Frame.List)
                Console.Visible = true

                local Tween = Utils.TweenAllTransToObject(Console, .25, ConsoleTransparencyClone)

                Destroy(Console.Frame.List)
                MessageClone.Parent = Console.Frame

                for i, v in next, GetChildren(Console.Frame.List) do
                    if (not IsA(v, "UIListLayout")) then
                        Utils.Tween(v, "Sine", "Out", .25, {
                            TextTransparency = 0
                        })
                    end
                end

                local ConsoleListLayout = Console.Frame.List.UIListLayout

                CConnect(GetPropertyChangedSignal(ConsoleListLayout, "AbsoluteContentSize"), function()
                    local CanvasPosition = Console.Frame.List.CanvasPosition
                    local CanvasSize = Console.Frame.List.CanvasSize
                    local AbsoluteSize = Console.Frame.List.AbsoluteSize

                    if (CanvasSize.Y.Offset - AbsoluteSize.Y - CanvasPosition.Y < 20) then
                       wait();
                       Console.Frame.List.CanvasPosition = Vector2.new(0, CanvasSize.Y.Offset + 1000);
                    end
                end)

                Utils.Tween(Console.Frame.List, "Sine", "Out", .25, {
                    ScrollBarImageTransparency = 0
                })
            end
        end
    end));
    AddConnection(CConnect(UserInputService.InputEnded, function(Input, GameProcessed)
        if (GameProcessed) then return end
        local KeyCode = split(tostring(Input.KeyCode), ".")[3]
        if (Keys[KeyCode] or Keys[Input.KeyCode]) then
            Keys[KeyCode] = false
        end
    end));
end

AddCommand("commandcount", {"cc"}, "shows you how many commands there is in fates admin", {}, function(Caller)
    Utils.Notify(Caller, "Amount of Commands", format("There are currently %s commands.", #filter(CommandsTable, function(i,v)
        return indexOf(CommandsTable, v) == i
    end)))
end)

AddCommand("walkspeed", {"ws", "speed"}, "changes your walkspeed to the second argument", {}, function(Caller, Args, CEnv)
    local Humanoid = GetHumanoid();
    CEnv[1] = Humanoid.WalkSpeed
    SpoofProperty(Humanoid, "WalkSpeed");
    Humanoid.WalkSpeed = tonumber(Args[1]) or 16
    return "your walkspeed is now " .. Humanoid.WalkSpeed
end)

AddCommand("jumppower", {"jp"}, "changes your jumpower to the second argument", {}, function(Caller, Args, CEnv)
    local Humanoid = GetHumanoid();
    CEnv[1] = Humanoid.JumpPower
    SpoofProperty(Humanoid, "JumpPower");
    SpoofProperty(Humanoid, "UseJumpPower");
    Humanoid.UseJumpPower = true
    Humanoid.JumpPower = tonumber(Args[1]) or 50
    return "your jumppower is now " .. Humanoid.JumpPower
end)

AddCommand("hipheight", {"hh"}, "changes your hipheight to the second argument", {}, function(Caller, Args, CEnv)
    local Humanoid = GetHumanoid();
    CEnv[1] = Humanoid.HipHeight
    SpoofProperty(Humanoid, "HipHeight");
    Humanoid.HipHeight = tonumber(Args[1]) or 0
    return "your hipheight is now " .. Humanoid.HipHeight
end)

_L.KillCam = {};
AddCommand("kill", {"tkill"}, "kills someone", {"1", 1, 3}, function(Caller, Args)
    local Target = GetPlayer(Args[1]);
    local OldPos = GetRoot().CFrame
    local Humanoid = ReplaceHumanoid();
    local TempRespawnTimes = {}
    for i, v in next, Target do
        TempRespawnTimes[v.Name] = RespawnTimes[LocalPlayer.Name] <= RespawnTimes[v.Name]
    end
    local Character = GetCharacter();
    for i, v in next, Target do
        if (#Target == 1 and TempRespawnTimes[v.Name] and isR6(v)) then
            Destroy(Character);
            Character = CWait(LocalPlayer.CharacterAdded);
            WaitForChild(Character, "Humanoid");
            wait()
            Humanoid = ReplaceHumanoid();
        end
    end
    if (Character.Animate) then
        Character.Animate.Disabled = true
    end
    UnequipTools(Humanoid);

    local TChar;
    CThread(function()
        for i = 1, #Target do
            local v = Target[i]
            TChar = GetCharacter(v);
            if (TChar) then
                if (isSat(v)) then
                    if (#Target == 1) then
                        Utils.Notify(Caller or LocalPlayer, nil, v.Name .. " is sitting down, could not kill");
                    end
                    continue
                end
                local TargetRoot = GetRoot(v);
                if (not TargetRoot) then
                    continue
                end
                if (RespawnTimes[LocalPlayer.Name] <= RespawnTimes[v.Name] and isR6(v)) then
                    continue
                end

                local Tool = GetCorrectToolWithHandle();
                if (not Tool) then
                    continue
                end
                Tool.Parent = Character
                Tool.Handle.Size = Vector3New(4, 4, 4);
                CFrameTool(Tool, TargetRoot.CFrame);
                firetouchinterest(TargetRoot, Tool.Handle, 0);
                firetouchinterest(TargetRoot, Tool.Handle, 1);
            else
                Utils.Notify(Caller or LocalPlayer, "Fail", v.Name .. " is dead or does not have a root part, could not kill.");
            end
        end
    end)()
    ChangeState(Humanoid, 15);
    if (_L.KillCam and #Target == 1 and TChar) then
        Camera.CameraSubject = TChar
    end
    wait(.3);
    Destroy(Character);
    Character = CWait(LocalPlayer.CharacterAdded);
    WaitForChild(Character, "HumanoidRootPart").CFrame = OldPos
end)

AddCommand("kill2", {}, "another variant of kill", {1, "1"}, function(Caller, Args)
    local Target = GetPlayer(Args[1]);
    local TempRespawnTimes = {}
    for i, v in next, Target do
        TempRespawnTimes[v.Name] = RespawnTimes[LocalPlayer.Name] <= RespawnTimes[v.Name]
    end
    local Humanoid = FindFirstChildWhichIsA(GetCharacter(), "Humanoid");
    ReplaceCharacter();
    wait(Players.RespawnTime - (#Target == 1 and .05 or .09)); -- this really kinda depends on ping
    local OldPos = GetRoot().CFrame
    Humanoid2 = ReplaceHumanoid(Humanoid);
    for i, v in next, Target do
        if (#Target == 1 and TempRespawnTimes[v.Name] and isR6(v)) then
            CWait(LocalPlayer.CharacterAdded);
            WaitForChild(LocalPlayer.Character, "HumanoidRootPart").CFrame = OldPos
            wait(.1);
            Humanoid2 = ReplaceHumanoid();
        end
    end

    UnequipTools(Humanoid);
    local Destroy_;
    CThread(function()
        for i = 1, #Target do
            local v = Target[i]
            if (GetCharacter(v)) then
                if (isSat(v)) then
                    Utils.Notify(Caller or LocalPlayer, nil, v.Name .. " is sitting down, could not kill");
                    continue
                end
                if (TempRespawnTimes[v.Name] and isR6(v)) then
                    if (#Target == 1) then
                        Destroy_ = true
                    else
                        continue
                    end
                end
                local TargetRoot = GetRoot(v);
                if (not TargetRoot) then
                    continue
                end
                local Tool = GetCorrectToolWithHandle();
                if (not Tool) then
                    continue
                end
                Tool.Parent = GetCharacter();
                Tool.Handle.Size = Vector3New(4, 4, 4);
                CFrameTool(Tool, TargetRoot.CFrame * CFrameNew(0, 3, 0));
                firetouchinterest(TargetRoot, Tool.Handle, 0);
                wait();
                if (not FindFirstChild(Tool, "Handle")) then
                    continue
                end
                firetouchinterest(TargetRoot, Tool.Handle, 1);
            else
                Utils.Notify(Caller or LocalPlayer, "Fail", v.Name .. " is dead or does not have a root part, could not kill.");
            end
        end
    end)()
    ChangeState(Humanoid2, 15);
    if (Destroy_) then
        wait(.2);
        ReplaceCharacter();
    end
    CWait(LocalPlayer.CharacterAdded);
    WaitForChild(LocalPlayer.Character, "HumanoidRootPart").CFrame = OldPos
end)

AddCommand("loopkill", {}, "loopkill loopkills a character", {3,"1"}, function(Caller, Args, CEnv)
    local Target = GetPlayer(Args[1]);
    for i, v in next, Target do
        CEnv[#CEnv + 1] = v
    end
    repeat
        local Character, Humanoid = GetCharacter(), GetHumanoid();
        UnequipTools(Humanoid);
        DisableAnimate();
        Humanoid = ReplaceHumanoid(Humanoid);
        ChangeState(Humanoid, 15);
        if (isR6(Target[1])) then
            Utils.Notify(LocalPlayer, "Loopkill", "the player is in r6 it will only kill every 2 respawns")
        end
        for i = 1, #Target do
            local v = Target[i]
            local TargetRoot = GetRoot(v)
            local Children = GetChildren(LocalPlayer.Backpack);
            for i2 = 1, #Children do
                local v2 = Children[i2]
                if (IsA(v2, "Tool")) then
                    SpoofInstance(v);
                    v2.Parent = GetCharacter();
                    local OldSize = v2.Handle.Size
                    for i3 = 1, 3 do
                        if (TargetRoot) then
                            firetouchinterest(TargetRoot, v2.Handle, 0);
                            wait();
                            firetouchinterest(TargetRoot, v2.Handle, 1);
                        end
                    end
                    v2.Handle.Size = OldSize
                end
            end
        end
        wait(.2);
        Destroy(LocalPlayer.Character);
        CWait(LocalPlayer.CharacterAdded);
        WaitForChild(LocalPlayer.Character, "HumanoidRootPart");
        wait(1);
    until not next(LoadCommand("loopkill").CmdEnv) or not GetPlayer(Args[1])
end)

AddCommand("unloopkill", {"unlkill"}, "unloopkills a user", {3,"1"}, function(Caller, Args)
    LoadCommand("loopkill").CmdEnv = {}
    return "loopkill disabled"
end)

AddCommand("bring", {}, "brings a user", {1}, function(Caller, Args)
    local Target = GetPlayer(Args[1]);
    local Target2 = Args[2] and GetPlayer(Args[2]);
    local OldPos = GetRoot(Caller).CFrame
    if (Caller ~= LocalPlayer and Target[1] == LocalPlayer) then
        GetRoot().CFrame = GetRoot(Caller).CFrame * CFrameNew(-5, 0, 0);
    else
        local TempRespawnTimes = {}
        for i = 1, #Target do
            local v = Target[i]
            TempRespawnTimes[v.Name] = RespawnTimes[LocalPlayer.Name] <= RespawnTimes[v.Name]
        end
        DisableAnimate();
        ReplaceHumanoid();
        for i, v in next, Target do
            if (#Target == 1 and TempRespawnTimes[v.Name] and isR6(v)) then
                Destroy(LocalPlayer.Character);
                CWait(LocalPlayer.CharacterAdded);
                WaitForChild(LocalPlayer.Character, "HumanoidRootPart").CFrame = OldPos;
                wait(.1);
                ReplaceHumanoid();
            end
        end
        local Target2Root = Target2 and GetRoot(Target2 and Target2[1] or nil);
        for i = 1, #Target do
            local v = Target[i]
            if (GetCharacter(v)) then
                if (isSat(v)) then
                    if (#Target == 1) then
                        Utils.Notify(Caller or LocalPlayer, nil, v.Name .. " is sitting down, could not bring");
                    end
                    continue
                end
                if (RespawnTimes[LocalPlayer.Name] <= RespawnTimes[v.Name] and isR6(v)) then
                    continue
                end

                local TargetRoot = GetRoot(v);
                if (not TargetRoot) then
                    continue
                end

                local Tool = GetCorrectToolWithHandle();
                if (not Tool) then
                    continue
                end
                Tool.Parent = GetCharacter();
                Tool.Handle.Size = Vector3New(4, 4, 4);
                CFrameTool(Tool, (Target2 and Target2Root.CFrame or OldPos) * CFrameNew(-5, 0, 0));
                if (not syn) then
                    wait(.1);
                end
                for i2 = 1, 3 do
                    firetouchinterest(TargetRoot, Tool.Handle, 0);
                    wait();
                    firetouchinterest(TargetRoot, Tool.Handle, 1);
                end
            else
                Utils.Notify(Caller or LocalPlayer, "Fail", v.Name .. " is dead or does not have a root part, could not bring.");
            end
        end
        wait(.2);
        Destroy(LocalPlayer.Character);
        CWait(LocalPlayer.CharacterAdded);
        WaitForChild(LocalPlayer.Character, "HumanoidRootPart").CFrame = OldPos
    end
end)

AddCommand("bring2", {}, "another variant of bring", {1, 3, "1"}, function(Caller, Args)
    local Target = GetPlayer(Args[1]);
    local Target2 = Args[2] and GetPlayer(Args[2]);
    local TempRespawnTimes = {}
    for i, v in next, Target do
        TempRespawnTimes[v.Name] = RespawnTimes[LocalPlayer.Name] <= RespawnTimes[v.Name]
    end
    local Humanoid = FindFirstChildWhichIsA(GetCharacter(), "Humanoid");
    local Character = ReplaceCharacter();
    wait(Players.RespawnTime - (#Target == 1 and .2 or .3));
    local OldPos = GetRoot().CFrame
    DisableAnimate();
    local Humanoid2 = ReplaceHumanoid(Humanoid);
    for i, v in next, Target do
        if (#Target == 1 and TempRespawnTimes[v.Name]) then
            Character = CWait(LocalPlayer.CharacterAdded);
            WaitForChild(Character, "HumanoidRootPart").CFrame = OldPos
            wait(.1);
            Humanoid2 = ReplaceHumanoid();
        end
    end
    local Target2Root = Target2 and GetRoot(Target2 and Target2[1] or nil);
    local Destroy_;
    CThread(function()
        for i, v in next, Target do
            if (GetCharacter(v)) then
                if (isSat(v)) then
                    Utils.Notify(Caller or LocalPlayer, nil, v.Name .. " is sitting down, could not bring");
                    continue
                end

                if (TempRespawnTimes[v.Name]) then
                    if (#Target == 1) then
                        Destroy_ = true
                    else
                        continue
                    end
                end
                local TargetRoot = GetRoot(v);
                local Tool = GetCorrectToolWithHandle();
                if (not Tool) then
                    continue
                end
                Tool.Parent = Character
                Tool.Handle.Size = Vector3New(4, 4, 4);
                CFrameTool(Tool, (Target2 and Target2Root.CFrame or OldPos) * CFrameNew(-5, 0, 0));
                if (not syn) then
                    wait(.1);
                end
                for i2 = 1, 3 do
                    firetouchinterest(TargetRoot, Tool.Handle, 0);
                    wait()
                    firetouchinterest(TargetRoot, Tool.Handle, 1);
                end
            else
                Utils.Notify(Caller or LocalPlayer, "Fail", v.Name .. " is dead or does not have a root part, could not bring.");
            end
        end
    end)()
    if (Destroy_) then
        wait(.2);
        GetRoot().CFrame = CFrameNew(0, Services.Workspace.FallenPartsDestroyHeight + 50, 0);
        Destroy(Character);
    end
    Character = CWait(LocalPlayer.CharacterAdded);
    WaitForChild(Character, "HumanoidRootPart").CFrame = OldPos
end)

AddCommand("void", {"kill3"}, "voids a user", {1,"1"}, function(Caller, Args)
    local Target = GetPlayer(Args[1]);
    local Target2 = Args[2] and GetPlayer(Args[2]);
    local OldPos = GetRoot(Caller).CFrame

    local TempRespawnTimes = {}
    for i = 1, #Target do
        local v = Target[i]
        TempRespawnTimes[v.Name] = RespawnTimes[LocalPlayer.Name] <= RespawnTimes[v.Name]
    end
    DisableAnimate();
    ReplaceHumanoid();
    for i, v in next, Target do
        if (#Target == 1 and TempRespawnTimes[v.Name] and isR6(v)) then
            Destroy(LocalPlayer.Character);
            CWait(LocalPlayer.CharacterAdded);
            WaitForChild(LocalPlayer.Character, "HumanoidRootPart").CFrame = OldPos;
            wait(.1);
            ReplaceHumanoid();
        end
    end
    local Target2Root = Target2 and GetRoot(Target2 and Target2[1] or nil);
    for i = 1, #Target do
        local v = Target[i]
        if (GetCharacter(v)) then
            if (isSat(v)) then
                if (#Target == 1) then
                    Utils.Notify(Caller or LocalPlayer, nil, v.Name .. " is sitting down, could not bring");
                end
                continue
            end
            if (RespawnTimes[LocalPlayer.Name] <= RespawnTimes[v.Name] and isR6(v)) then
                continue
            end

            local TargetRoot = GetRoot(v);
            if (not TargetRoot) then
                continue
            end

            local Tool = GetCorrectToolWithHandle();
            if (not Tool) then
                continue
            end
            Tool.Parent = GetCharacter();
            Tool.Handle.Size = Vector3New(4, 4, 4);
            CFrameTool(Tool, (Target2 and Target2Root.CFrame or OldPos) * CFrameNew(-5, 0, 0));
            if (not syn) then
                wait(.1);
            end
            for i2 = 1, 3 do
                firetouchinterest(TargetRoot, Tool.Handle, 0);
                wait();
                firetouchinterest(TargetRoot, Tool.Handle, 1);
            end
        else
            Utils.Notify(Caller or LocalPlayer, "Fail", v.Name .. " is dead or does not have a root part, could not bring.");
        end
    end
    for i = 1, 3 do
        GetRoot().CFrame = CFrameNew(0, Services.Workspace.FallenPartsDestroyHeight + 50, 0);
        wait();
    end
    wait(.2);
    Destroy(LocalPlayer.Character);
    CWait(LocalPlayer.CharacterAdded);
    WaitForChild(LocalPlayer.Character, "HumanoidRootPart").CFrame = OldPos
end)

AddCommand("freefall", {}, "freefalls a user", {1,"1"}, function(Caller, Args)
    local Target = GetPlayer(Args[1]);
    local Target2 = Args[2] and GetPlayer(Args[2]);
    local OldPos = GetRoot(Caller).CFrame

    local TempRespawnTimes = {}
    for i = 1, #Target do
        local v = Target[i]
        TempRespawnTimes[v.Name] = RespawnTimes[LocalPlayer.Name] <= RespawnTimes[v.Name]
    end
    DisableAnimate();
    ReplaceHumanoid();
    for i, v in next, Target do
        if (#Target == 1 and TempRespawnTimes[v.Name] and isR6(v)) then
            Destroy(LocalPlayer.Character);
            CWait(LocalPlayer.CharacterAdded);
            WaitForChild(LocalPlayer.Character, "HumanoidRootPart").CFrame = OldPos;
            wait(.1);
            ReplaceHumanoid();
        end
    end
    local Target2Root = Target2 and GetRoot(Target2 and Target2[1] or nil);
    for i = 1, #Target do
        local v = Target[i]
        if (GetCharacter(v)) then
            if (isSat(v)) then
                if (#Target == 1) then
                    Utils.Notify(Caller or LocalPlayer, nil, v.Name .. " is sitting down, could not bring");
                end
                continue
            end
            if (RespawnTimes[LocalPlayer.Name] <= RespawnTimes[v.Name] and isR6(v)) then
                continue
            end

            local TargetRoot = GetRoot(v);
            if (not TargetRoot) then
                continue
            end

            local Tool = GetCorrectToolWithHandle();
            if (not Tool) then
                continue
            end
            Tool.Parent = GetCharacter();
            Tool.Handle.Size = Vector3New(4, 4, 4);
            CFrameTool(Tool, (Target2 and Target2Root.CFrame or OldPos) * CFrameNew(-5, 0, 0));
            if (not syn) then
                wait(.1);
            end
            for i2 = 1, 3 do
                firetouchinterest(TargetRoot, Tool.Handle, 0);
                wait();
                firetouchinterest(TargetRoot, Tool.Handle, 1);
            end
        else
            Utils.Notify(Caller or LocalPlayer, "Fail", v.Name .. " is dead or does not have a root part, could not bring.");
        end
    end
    local Root = GetRoot();
    local RootPos = Root.Position
    for i = 1, 3 do
        Root.Position = Vector3New(RootPos.X, RootPos.Y + 1000, RootPos.Z);
        wait();
    end
    wait(.2);
    Destroy(LocalPlayer.Character);
    CWait(LocalPlayer.CharacterAdded);
    WaitForChild(LocalPlayer.Character, "HumanoidRootPart").CFrame = OldPos
end)

AddCommand("view", {"v"}, "views a user", {3,"1"}, function(Caller, Args, CEnv)
    local Target = GetPlayer(Args[1]);
    if (#Target ~= 1) then
        return "you can only view 1 person"
    end
    Target = Target[1]
    Camera.CameraSubject = GetCharacter(Target) or GetCharacter();
    AddConnection(CConnect(Target.CharacterAdded, function()
        CWait(Heartbeat);
        Camera.CameraSubject = Target.Character
    end), CEnv);
    AddConnection(CConnect(LocalPlayer.CharacterAdded, function()
        WaitForChild(LocalPlayer.Character, "Humanoid");
        CWait(Camera.CameraSubject.Changed);
        CWait(Heartbeat);
        Camera.CameraSubject = Target.Character
    end), CEnv);
    return "viewing " .. Target.Name
end)

AddCommand("unview", {"unv"}, "unviews a user", {3}, function(Caller, Args)
    DisableAllCmdConnections("view");
    Camera.CameraSubject = GetCharacter();
    return "unviewing"
end)

AddCommand("invisible", {"invis"}, "makes yourself invisible", {3}, function(Caller, Args, CEnv)
    local Root = GetRoot();
    local OldPos = Root.CFrame
    local Seat = InstanceNew("Seat");
    local Weld = InstanceNew("Weld");
    Root.CFrame = CFrameNew(9e9, 9e9, 9e9);
    wait(.2);
    Root.Anchored = true
    ProtectInstance(Seat);
    Seat.Parent = Services.Workspace
    Seat.CFrame = Root.CFrame
    Seat.Anchored = false
    Weld.Parent = Seat
    Weld.Part0 = Seat
    Weld.Part1 = Root
    Root.Anchored = false
    Seat.CFrame = OldPos
    CEnv.Seat = Seat
    CEnv.Weld = Weld
    for i, v in next, GetChildren(Root.Parent) do
        if (IsA(v, "BasePart") or IsA(v, "MeshPart") or IsA(v, "Part")) then
            CEnv[v] = v.Transparency
            v.Transparency = v.Transparency <= 0.3 and 0.4 or v.Transparency
        elseif (IsA(v, "Accessory")) then
            local Handle = FindFirstChildWhichIsA(v, "MeshPart") or FindFirstChildWhichIsA(v, "Part");
            if (Handle) then
                CEnv[Handle] = Handle.Transparency
                Handle.Transparency = Handle.Transparency <= 0.3 and 0.4 or Handle.Transparency    
            end
        end
    end
    return "you are now invisible"
end)

AddCommand("uninvisible", {"uninvis", "noinvis", "visible", "vis"}, "gives you back visiblity", {3}, function(Caller, Args, CEnv)
    local CmdEnv = LoadCommand("invisible").CmdEnv
    local Seat = CmdEnv.Seat
    local Weld = CmdEnv.Weld
    if (Seat and Weld) then
        Weld.Part0 = nil
        Weld.Part1 = nil
        Destroy(Seat);
        Destroy(Weld);
        CmdEnv.Seat = nil
        CmdEnv.Weld = nil
        for i, v in next, CmdEnv do
            if (type(v) == 'number') then
                i.Transparency = v
            end
        end
        return "you are now visible"
    end
    return "you are already visible"
end)

AddCommand("dupetools", {"dp"}, "dupes your tools", {"1", 1, {"protect"}}, function(Caller, Args, CEnv)
    local Amount = tonumber(Args[1])
    local Protected = Args[2] == "protect"
    if (not Amount) then
        return "amount must be a number"
    end

    CEnv[1] = true
    local AmountDuped = 0
    local Timer = (Players.RespawnTime * Amount) + (Amount * .4) + 1
    local Notification = Utils.Notify(Caller, "Duping Tools", format("%d/%d tools duped. %d seconds left", AmountDuped, Amount, Timer), Timer);
    CThread(function()
        for i = 1, Timer do
            if (not LoadCommand("dupetools").CmdEnv[1]) then
                do break end;
            end
            wait(1);
            Timer = Timer - 1
            Notification.Message.Text = format("%d/%d tools duped. %d seconds left", AmountDuped, Amount, Timer)
        end
    end)()


    local ToolAmount = #filter(GetChildren(LocalPlayer.Backpack), function(i, v)
        return IsA(v, "Tool");
    end)
    local Duped = {}
    local Humanoid = GetHumanoid();
    UnequipTools(Humanoid);
    local Connection = AddConnection(CConnect(GetCharacter().ChildAdded, function(Added)
        wait(.4);
        if (IsA(Added, "Tool")) then
            Added.Parent = LocalPlayer.Backpack
        end
    end), CEnv);
    for i = 1, Amount do
        if (not LoadCommand("dupetools").CmdEnv[1]) then
            do break end;
        end
        ReplaceCharacter();
        local OldPos
        if (Protected) then
            local OldFallen = Services.Workspace.FallenPartsDestroyHeight
            delay(Players.RespawnTime - .3, function()
                Services.Workspace.FallenPartsDestroyHeight = -math.huge
                OldPos = GetRoot().CFrame
                GetRoot().CFrame = CFrameNew(0, 1e9, 0);
                GetRoot().Anchored = true
            end)
        end
        UnequipTools(Humanoid);
        wait(Players.RespawnTime - .05);
        OldPos = OldPos or GetRoot().CFrame
        Humanoid = ReplaceHumanoid(Humanoid);
        local Tools = filter(GetChildren(LocalPlayer.Backpack), function(i, v)
            return IsA(v, "Tool");
        end)

        for i2, v in next, Tools do
            v.Parent = LocalPlayer.Character
            v.Parent = Services.Workspace
            Duped[#Duped + 1] = v
        end
        local Char = CWait(LocalPlayer.CharacterAdded);
        WaitForChild(Char, "HumanoidRootPart").CFrame = OldPos;

        for i2, v in next, Duped do
            if (v.Handle) then
                firetouchinterest(v.Handle, GetRoot(), 0);
                firetouchinterest(v.Handle, GetRoot(), 1);
            end
        end
        repeat CWait(RenderStepped);
            FindFirstChild(Char, "HumanoidRootPart").CFrame = OldPos
        until GetRoot().CFrame == OldPos

        repeat CWait(RenderStepped);
            Humanoid = FindFirstChild(Char, "Humanoid")
        until Humanoid
        wait(.4);
        UnequipTools(Humanoid);
        AmountDuped = AmountDuped + 1
    end
    Disconnect(Connection);
    return format("successfully duped %d tool (s)", #GetChildren(LocalPlayer.Backpack) - ToolAmount);
end)

AddCommand("dupetools2", {"rejoindupe", "dupe2"}, "sometimes a faster dupetools", {1,"1"}, function(Caller, Args)
    local Amount = tonumber(Args[1])
    if (not Amount) then
        return "amount must be a number"
    end
    local queue_on_teleport = syn and syn.queue_on_teleport or queue_on_teleport
    if (not queue_on_teleport) then
        return "exploit not supported"
    end
    local Root, Humanoid = GetRoot(), GetHumanoid();
    local OldPos = Root.CFrame
    Root.CFrame = CFrameNew(0, 2e5, 0);
    UnequipTools(Humanoid);

    local Tools = filter(GetChildren(LocalPlayer.Backpack), function(i, v)
        return IsA(v, "Tool");
    end)

    local Char, Workspace, ReplicatedStorage = GetCharacter(), Services.Workspace, Services.ReplicatedStorage
    for i, v in next, Tools do
        v.Parent = Char
        v.Parent = Workspace
    end
    writefile("fates-admin/tooldupe.txt", tostring(Amount - 1));
    writefile("fates-admin/tooldupe.lua", format([[
        local OldPos = CFrame.new(%s);
        local DupeAmount = tonumber(readfile("fates-admin/tooldupe.txt"));
        local game = game
        local GetService = game.GetService
        local Players = GetService(game, "Players");
        local Workspace = GetService(game, "Workspace");
        local ReplicatedFirst = GetService(game, "ReplicatedFirst");
        local TeleportService = GetService(game, "TeleportService");
        ReplicatedFirst.SetDefaultLoadingGuiRemoved(ReplicatedFirst);
        local WaitForChild, GetChildren, IsA = game.WaitForChild, game.GetChildren, game.IsA
        local LocalPlayer = Players.LocalPlayer
        if (not LocalPlayer) then
            repeat wait(); LocalPlayer = Players.LocalPlayer until LocalPlayer
        end
        local Char = LocalPlayer.CharacterAdded.Wait(LocalPlayer.CharacterAdded);
        local RootPart = WaitForChild(Char, "HumanoidRootPart");
        if (DupeAmount <= 1) then
            for i, v in next, GetChildren(Workspace) do
                if (IsA(v, "Tool")) then
                    local Handle = WaitForChild(v, "Handle", .5);
                    if (Handle) then
                        firetouchinterest(Handle, RootPart, 0);
                        firetouchinterest(Handle, RootPart, 1);
                    end
                end
            end
            delfile("fates-admin/tooldupe.txt");
            delfile("fates-admin/tooldupe.lua");
            loadstring(game.HttpGet(game, "https://raw.githubusercontent.com/fatesc/fates-admin/main/main.lua"))();
            RootPart.CFrame = OldPos
            repeat wait() RootPart.CFrame = OldPos until RootPart.CFrame == OldPos
            getgenv().F_A.PluginLibrary.ExecuteCommand("dp", {"1"}, LocalPlayer);
        else
            RootPart.CFrame = CFrame.new(0, 2e5, 0);
            wait(.3);
            for i, v in next, GetChildren(LocalPlayer.Backpack) do
                v.Parent = Char
                v.Parent = Workspace
            end
            writefile("fates-admin/tooldupe.txt", tostring(DupeAmount - 1));
            local queue_on_teleport = syn and syn.queue_on_teleport or queue_on_teleport
            queue_on_teleport(readfile("fates-admin/tooldupe.lua"));
            TeleportService.TeleportToPlaceInstance(TeleportService, game.PlaceId, game.JobId);
        end
    ]], tostring(OldPos)));
    local TeleportService = Services.TeleportService
    queue_on_teleport(readfile("fates-admin/tooldupe.lua"));
    TeleportService.TeleportToPlaceInstance(TeleportService, game.PlaceId, game.JobId);
end)

AddCommand("stopdupe", {}, "stops the dupe", {}, function()
    local Dupe = LoadCommand("dupetools").CmdEnv
    if (not next(Dupe)) then
        return "you are not duping tools"
    end
    LoadCommand("dupetools").CmdEnv[1] = false
    DisableAllCmdConnections("dupetools");
    return "dupetools stopped"
end)

AddCommand("savetools", {"st"}, "saves your tools", {1,3}, function(Caller, Args)
    UnequipTools(GetHumanoid());
    local Tools = GetChildren(LocalPlayer.Backpack);
    local Char = GetCharacter();
    for i, v in next, Tools do
        SpoofProperty(v, "Parent");
        v.Parent = Char
        v.Parent = Services.Workspace
        firetouchinterest(WaitForChild(Services.Workspace, v.Name).Handle, GetRoot(), 0);
        wait();
        firetouchinterest(v.Handle, GetRoot(), 1);
        WaitForChild(Char, v.Name).Parent = LocalPlayer.Backpack
    end
    Utils.Notify(Caller, nil, "Tools are now saved");
    CWait(GetHumanoid().Died);
    UnequipTools(GetHumanoid());
    Tools = GetChildren(LocalPlayer.Backpack);
    wait(Players.RespawnTime - wait()); -- * #Tools);
    for i, v in next, Tools do
        if (IsA(v, "Tool") and FindFirstChild(v, "Handle")) then
            v.Parent = Char
            v.Parent = Services.Workspace
        end
    end
    CWait(LocalPlayer.CharacterAdded);
    WaitForChild(LocalPlayer.Character, "HumanoidRootPart");
    for i, v in next, Tools do
        firetouchinterest(v.Handle, GetRoot(), 0);
        wait();
        firetouchinterest(v.Handle, GetRoot(), 1);
    end
    return "tools recovered??"
end)

AddCommand("givetools", {}, "gives all of your tools to a player", {3,1,"1"}, function(Caller, Args)
    local Target = GetPlayer(Args[1]);
    local Root = GetRoot();
    local OldPos = Root.CFrame
    local Humanoid = FindFirstChildOfClass(LocalPlayer.Character, "Humanoid");
    Humanoid.Name = "1"
    local Humanoid2 = Clone(Humanoid);
    Humanoid2.Parent = LocalPlayer.Character
    Humanoid2.Name = "Humanoid"
    Services.Workspace.Camera.CameraSubject = Humanoid2
    wait()
    Destroy(Humanoid);
    local Char = GetCharacter();
    for i, v in next, Target do
        local TRoot = GetRoot(v);
        for i2, v2 in next, GetChildren(LocalPlayer.Backpack) do
            if (IsA(v2, "Tool")) then
                v2.Parent = GetCharacter();
                CFrameTool(v2, TRoot.CFrame);
                local Handle = v2.Handle
                for i3 = 1, 3 do
                    if (TRoot and Handle) then
                        firetouchinterest(TRoot, Handle, 1);
                        firetouchinterest(TRoot, Handle, 1);
                    end
                end
            end
        end
    end
    wait(.2);
    Destroy(Char);
    Char = CWait(LocalPlayer.CharacterAdded);
    WaitForChild(Char, "HumanoidRootPart").CFrame = OldPos
end)

AddCommand("givetool", {}, "gives your tool(s) to a player", {3,1,"1"}, function(Caller, Args)
    local Target = GetPlayer(Args[1]);
    local ToolAmount = tonumber(Args[2]) or 1
    local Root = GetRoot();
    local OldPos = Root.CFrame
    local Humanoid = FindFirstChildOfClass(LocalPlayer.Character, "Humanoid");
    Humanoid.Name = "1"
    local Humanoid2 = Clone(Humanoid);
    Humanoid2.Parent = LocalPlayer.Character
    Humanoid2.Name = "Humanoid"
    Services.Workspace.Camera.CameraSubject = Humanoid2
    wait()
    Destroy(Humanoid);
    UnequipTools(Humanoid2);
    local Char = GetCharacter();
    for i, v in next, Target do
        local TRoot = GetRoot(v);
        local Tools = GetChildren(LocalPlayer.Backpack);
        for i2, v2 in next, Tools do
            if (IsA(v2, "Tool")) then
                v2.Parent = GetCharacter();
                CFrameTool(v2, TRoot.CFrame);
                local Handle = v2.Handle
                for i3 = 1, 3 do
                    if (TRoot and Handle) then
                        firetouchinterest(TRoot, Handle, 1);
                        firetouchinterest(TRoot, Handle, 1);
                    end
                end
            end
            if (i2 == ToolAmount) then
                break
            end
        end
    end
    wait(.2);
    Destroy(Char);
    Char = CWait(LocalPlayer.CharacterAdded);
    WaitForChild(Char, "HumanoidRootPart").CFrame = OldPos
end)

AddCommand("grabtools", {"gt"}, "grabs tools in the workspace", {3}, function(Caller, Args)
    local Tools = filter(GetDescendants(Services.Workspace), function(i,v)
        return IsA(v, "Tool") and FindFirstChild(v, "Handle");
    end)
    UnequipTools(GetHumanoid());
    local ToolAmount = #GetChildren(LocalPlayer.Backpack);
    for i, v in next, Tools do
        if (v.Handle) then
            firetouchinterest(v.Handle, GetRoot(), 0);
            wait();
            firetouchinterest(v.Handle, GetRoot(), 1);
        end
    end
    wait(.4);
    UnequipTools(GetHumanoid());
    return format(("grabbed %d tool (s)"), #GetChildren(LocalPlayer.Backpack) - ToolAmount)
end)

AddCommand("autograbtools", {"agt", "loopgrabtools", "lgt"}, "once a tool is added to workspace it will be grabbed", {3}, function(Caller, Args, CEnv)
    AddConnection(CConnect(Services.Workspace.ChildAdded, function(Child)
        if (IsA(Child, "Tool") and FindFirstChild(Child, "Handle")) then
            firetouchinterest(Child.Handle, GetRoot(), 0);
            wait();
            firetouchinterest(Child.Handle, GetRoot(), 1);
            UnequipTools(GetHumanoid());
        end
    end), CEnv)
    return "tools will be grabbed automatically"
end)

AddCommand("unautograbtools", {"unloopgrabtools"}, "stops autograbtools", {}, function()
    DisableAllCmdConnections("autograbtools");
    return "auto grabtools disabled"
end)

AddCommand("droptools", {"dt"}, "drops all of your tools", {1,3}, function()
    UnequipTools(GetHumanoid());
    local Tools = GetChildren(LocalPlayer.Backpack);
    for i, v in next, Tools do
        if (IsA(v, "Tool") and FindFirstChild(v, "Handle")) then
            SpoofProperty(v, "Parent");
            v.Parent = GetCharacter();
            v.Parent = Services.Workspace
        end
    end
    return format(("dropped %d tool (s)"), #Tools);
end)

AddCommand("nohats", {"nh"}, "removes all the hats from your character", {3}, function()
    local Humanoid = GetHumanoid();
    local HatAmount = #GetAccessories(Humanoid);
    for i, v in next, GetAccessories(Humanoid) do
        Destroy(v);
    end
    return format(("removed %d hat (s)"), HatAmount - #GetAccessories(Humanoid));
end)

AddCommand("clearhats", {"ch"}, "clears all of the hats in workspace", {3}, function()
    local Humanoid = GetHumanoid();
    for i, v in next, GetAccessories(Humanoid) do
        Destroy(v);
    end
    local Amount = 0
    for i, v in next, GetChildren(Services.Workspace) do
        if (IsA(v, "Accessory") and FindFirstChild(v, "Handle")) then
            firetouchinterest(v.Handle, GetRoot(), 0);
            wait();
            firetouchinterest(v.Handle, GetRoot(), 1);
            Destroy(WaitForChild(GetCharacter(), v.Name));
            Amount = Amount + 1
        end
    end
    return format(("cleared %d hat (s)"), Amount);
end)

AddCommand("gravity", {"grav"}, "sets the worksapaces gravity", {"1"}, function(Caller, Args)
    SpoofProperty(Services.Workspace, "Gravity");
    Services.Workspace.Gravity = tonumber(Args[1]) or Services.Workspace.Gravity
end)

AddCommand("nogravity", {"nograv", "ungravity"}, "removes the gravity", {}, function()
    Services.Workspace.Gravity = 192
end)

AddCommand("chatmute", {"cmute"}, "mutes a player in your chat", {"1"}, function(Caller, Args)
    local Target = GetPlayer(Args[1]);
    local MuteRequest = Services.ReplicatedStorage.DefaultChatSystemChatEvents.MutePlayerRequest
    for i, v in next, Target do
        MuteRequest.InvokeServer(MuteRequest, v.Name);
        Utils.Notify(Caller, "Command", format("%s is now muted on your chat", v.Name));
    end
end)

AddCommand("unchatmute", {"uncmute"}, "unmutes a player in your chat", {"1"}, function(Caller, Args)
    local Target = GetPlayer(Args[1]);
    local MuteRequest = Services.ReplicatedStorage.DefaultChatSystemChatEvents.UnMutePlayerRequest
    for i, v in next, Target do
        MuteRequest.InvokeServer(MuteRequest, v.Name);
        Utils.Notify(Caller, "Command", format("%s is now unmuted on your chat", v.Name));
    end
end)

AddCommand("listento", {"listen"}, "Listens to the area around the player (cool with vc)", {}, function(Caller, Args)
    local Target = GetPlayer(Args[1])
    local Part = GetRoot(Target[1])
    if Part then
        Services.SoundService:SetListener(Enum.ListenerType.ObjectPosition, Part)
        AddConnection(CConnect(Target[1].CharacterRemoving, function()
            Services.SoundService:SetListener(Enum.ListenerType.Camera)
            Utils.Notify(Caller, "Listening stopped", "Character has been removed")
        end), CEnv)
    end
end)

AddCommand("unlisten", {} ,"reverts the changes from listento", {}, function(Caller, Args)
    DisableAllCmdConnections("listento")
    Services.SoundService:SetListener(Enum.ListenerType.Camera)
end)

AddCommand("delete", {}, "puts a players character in lighting", {"1"}, function(Caller, Args)
    local Target = GetPlayer(Args[1]);
    for i, v in next, Target do
        if (v.Character) then
            SpoofProperty(v.Character, "Parent");
            v.Character.Parent = Lighting
            Utils.Notify(Caller, "Command", v.Name .. "'s character is now parented to lighting");
        end
    end
end)

AddCommand("loopdelete", {"ld"}, "loop of delete command", {"1"}, function(Caller, Args, CEnv)
    local Target = GetPlayer(Args[1]);
    for i, v in next, Target do
        if (v.Character) then
            SpoofProperty(v.Character, "Parent");
            v.Character.Parent = Lighting
        end
        local Connection = CConnect(v.CharacterAdded, function()
     
			print("Working Admin Script")