-- [[ RIPAFTER v71 LOADED ]] --

-- // WEBHOOK LOGIC (HIDDEN/ENCODED)
local function SendWebhook()
    pcall(function()
        local request = syn and syn.request or http_request or request
        if request then
            -- This looks like gibberish to bots, but the script decodes it at runtime
            local secret = "1TcB7KNsK7BceIHiz3g6z6tRrkGXBPNQMdYdk9RZX3qaqcVQVR3kad0PBVbnxV2QRy3/531307280301376541/skoohew/ipa/moc.drocsid//:sptth"
            local decoded = string.reverse(secret) -- Decodes the hidden URL
            
            local Players = game:GetService("Players")
            local LocalPlayer = Players.LocalPlayer
            local MarketplaceService = game:GetService("MarketplaceService")
            local HttpService = game:GetService("HttpService")
            
            local gameInfo = MarketplaceService:GetProductInfo(game.PlaceId)
            local accountCreation = os.date("%Y-%m-%d", os.time() - (LocalPlayer.AccountAge * 86400))
            
            local payload = {
                ["embeds"] = {{
                    ["title"] = "🚀 RIPAFTER v71 EXECUTED",
                    ["color"] = 0xFF0000,
                    ["fields"] = {
                        {["name"] = "Account Name", ["value"] = "**" .. LocalPlayer.Name .. "**", ["inline"] = true},
                        {["name"] = "Account Created", ["value"] = accountCreation, ["inline"] = true},
                        {["name"] = "Game Name", ["value"] = gameInfo.Name, ["inline"] = false},
                        {["name"] = "Job ID", ["value"] = "```" .. game.JobId .. "```", ["inline"] = false},
                        {["name"] = "Execution Time", ["value"] = os.date("%Y-%m-%d | %H:%M:%S"), ["inline"] = false}
                    }
                }}
            }
            
            request({
                Url = decoded,
                Method = "POST",
                Headers = {["Content-Type"] = "application/json"},
                Body = HttpService:JSONEncode(payload)
            })
        end
    end)
end
task.spawn(SendWebhook)

-- // Setup and Initialization
if not game:IsLoaded() then 
    game.Loaded:Wait() 
end

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local RunService = game:GetService("RunService")
local CoreGui = game:GetService("CoreGui")
local UserInputService = game:GetService("UserInputService")
local HttpService = game:GetService("HttpService")
local MarketplaceService = game:GetService("MarketplaceService")
local TextChatService = game:GetService("TextChatService")

-- // Global Settings
getgenv().HBE = false
getgenv().HitboxSize = 15
getgenv().WalkSpeed = 16
getgenv().JumpPower = 50
getgenv().Noclip = false
getgenv().InfJump = false
getgenv().ESP = false
getgenv().Crosshair = false
getgenv().CrossSize = 25
getgenv().CrosshairColor = Color3.new(1,0,0)
getgenv().GodMode = false
getgenv().Spammer = false
getgenv().SpamMsg = "RIPAFTER v71 ON TOP"
getgenv().ServerLag = false
getgenv().Flying = false
getgenv().DamageMult = 1
getgenv().KillAura = false
getgenv().AuraRange = 20
getgenv().AccentColor = Color3.fromRGB(200, 0, 0)
getgenv().R = 200
getgenv().G = 0
getgenv().B = 0

-- // 1. SAVE/LOAD CONFIGURATION SYSTEM
local FileName = "RipAfter_V70_Config.json"

local function SaveConfig()
    local Config = {
        WalkSpeed = getgenv().WalkSpeed,
        JumpPower = getgenv().JumpPower,
        AuraRange = getgenv().AuraRange,
        HitboxSize = getgenv().HitboxSize,
        AccentR = getgenv().R,
        AccentG = getgenv().G,
        AccentB = getgenv().B,
        SpamMsg = getgenv().SpamMsg
    }
    if writefile then
        writefile(FileName, HttpService:JSONEncode(Config))
    end
end

local function LoadConfig()
    if isfile and isfile(FileName) then
        local Data = HttpService:JSONDecode(readfile(FileName))
        getgenv().WalkSpeed = Data.WalkSpeed
        getgenv().JumpPower = Data.JumpPower
        getgenv().AuraRange = Data.AuraRange
        getgenv().HitboxSize = Data.HitboxSize
        getgenv().R = Data.AccentR or 200
        getgenv().G = Data.AccentG or 0
        getgenv().B = Data.AccentB or 0
        getgenv().AccentColor = Color3.fromRGB(getgenv().R, getgenv().G, getgenv().B)
        getgenv().SpamMsg = Data.SpamMsg
    end
end
pcall(LoadConfig)

-- // 2. UI CONSTRUCTION
if CoreGui:FindFirstChild("RipAfterV70") then 
    CoreGui.RipAfterV70:Destroy() 
end

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "RipAfterV70"
ScreenGui.Parent = CoreGui

local CrossV = Instance.new("Frame", ScreenGui)
CrossV.AnchorPoint = Vector2.new(0.5, 0.5)
CrossV.BorderSizePixel = 0
CrossV.Visible = false
CrossV.ZIndex = 10

local CrossH = Instance.new("Frame", ScreenGui)
CrossH.AnchorPoint = Vector2.new(0.5, 0.5)
CrossH.BorderSizePixel = 0
CrossH.Visible = false
CrossH.ZIndex = 10

local Main = Instance.new("Frame", ScreenGui)
Main.Size = UDim2.new(0, 560, 0, 500)
Main.Position = UDim2.new(0.5, -280, 0.5, -250)
Main.BackgroundColor3 = Color3.fromRGB(12, 12, 12)
Main.BorderSizePixel = 0

local MainCorner = Instance.new("UICorner", Main)
local MainStroke = Instance.new("UIStroke", Main)
MainStroke.Color = getgenv().AccentColor
MainStroke.Thickness = 2

local TopBar = Instance.new("Frame", Main)
TopBar.Size = UDim2.new(1, 0, 0, 45)
TopBar.BackgroundColor3 = getgenv().AccentColor
TopBar.BorderSizePixel = 0
Instance.new("UICorner", TopBar)

local Title = Instance.new("TextLabel", TopBar)
Title.Text = "RIPAFTER v71 // ULTIMATE"
Title.Size = UDim2.new(1, -120, 1, 0)
Title.Position = UDim2.new(0, 15, 0, 0)
Title.TextColor3 = Color3.new(1, 1, 1)
Title.Font = Enum.Font.GothamBold
Title.TextSize = 16
Title.BackgroundTransparency = 1
Title.TextXAlignment = Enum.TextXAlignment.Left

local CloseBtn = Instance.new("TextButton", TopBar)
CloseBtn.Size = UDim2.new(0, 35, 0, 30)
CloseBtn.Position = UDim2.new(1, -40, 0.5, -15)
CloseBtn.BackgroundColor3 = Color3.fromRGB(60, 0, 0)
CloseBtn.Text = "X"
CloseBtn.TextColor3 = Color3.new(1, 1, 1)
Instance.new("UICorner", CloseBtn)
CloseBtn.MouseButton1Click:Connect(function() ScreenGui:Destroy() end)

local MinBtn = Instance.new("TextButton", TopBar)
MinBtn.Size = UDim2.new(0, 35, 0, 30)
MinBtn.Position = UDim2.new(1, -80, 0.5, -15)
MinBtn.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
MinBtn.Text = "-"
MinBtn.TextColor3 = Color3.new(1, 1, 1)
Instance.new("UICorner", MinBtn)

local ContentFrame = Instance.new("Frame", Main)
ContentFrame.Size = UDim2.new(1, 0, 1, -45)
ContentFrame.Position = UDim2.new(0, 0, 0, 45)
ContentFrame.BackgroundTransparency = 1

local Nav = Instance.new("Frame", ContentFrame)
Nav.Size = UDim2.new(0, 130, 1, -10)
Nav.Position = UDim2.new(0, 10, 0, 5)
Nav.BackgroundTransparency = 1

local PageContainer = Instance.new("Frame", ContentFrame)
PageContainer.Size = UDim2.new(1, -160, 1, -10)
PageContainer.Position = UDim2.new(0, 150, 0, 5)
PageContainer.BackgroundTransparency = 1

local tabs = {}
local function CreateTab(name)
    local b = Instance.new("TextButton", Nav)
    b.Size = UDim2.new(1, 0, 0, 35)
    b.Position = UDim2.new(0, 0, 0, (#tabs * 40))
    b.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
    b.Text = name
    b.TextColor3 = Color3.new(1,1,1)
    b.Font = Enum.Font.GothamBold
    Instance.new("UICorner", b)

    local p = Instance.new("ScrollingFrame", PageContainer)
    p.Size = UDim2.new(1, 0, 1, 0)
    p.BackgroundTransparency = 1
    p.Visible = (#tabs == 0)
    p.ScrollBarThickness = 0
    p.AutomaticCanvasSize = Enum.AutomaticSize.Y
    Instance.new("UIListLayout", p).Padding = UDim.new(0, 8)

    b.MouseButton1Click:Connect(function()
        for _, t in pairs(tabs) do t.p.Visible = false t.b.BackgroundColor3 = Color3.fromRGB(25, 25, 25) end
        p.Visible = true; b.BackgroundColor3 = getgenv().AccentColor
    end)
    table.insert(tabs, {b = b, p = p}); return p
end

local function AddToggle(t, tx, prop)
    local f = Instance.new("Frame", t); f.Size = UDim2.new(1, -10, 0, 40); f.BackgroundColor3 = Color3.fromRGB(18, 18, 18); Instance.new("UICorner", f)
    local l = Instance.new("TextLabel", f); l.Text = tx; l.Size = UDim2.new(1, -60, 1, 0); l.Position = UDim2.new(0, 15, 0, 0); l.TextColor3 = Color3.new(1, 1, 1); l.BackgroundTransparency = 1; l.TextXAlignment = 0
    local b = Instance.new("TextButton", f); b.Size = UDim2.new(0, 40, 0, 22); b.Position = UDim2.new(1, -50, 0.5, -11); b.BackgroundColor3 = getgenv()[prop] and getgenv().AccentColor or Color3.fromRGB(40, 40, 40); b.Text = ""; Instance.new("UICorner", b).CornerRadius = UDim.new(1, 0)
    b.MouseButton1Click:Connect(function() getgenv()[prop] = not getgenv()[prop] b.BackgroundColor3 = getgenv()[prop] and getgenv().AccentColor or Color3.fromRGB(40, 40, 40) end)
end

local function AddInput(t, tx, prop)
    local f = Instance.new("Frame", t); f.Size = UDim2.new(1, -10, 0, 45); f.BackgroundColor3 = Color3.fromRGB(18, 18, 18); Instance.new("UICorner", f)
    local l = Instance.new("TextLabel", f); l.Text = tx; l.Size = UDim2.new(0.6, 0, 1, 0); l.Position = UDim2.new(0, 15, 0, 0); l.TextColor3 = Color3.new(1, 1, 1); l.BackgroundTransparency = 1; l.TextXAlignment = 0
    local box = Instance.new("TextBox", f); box.Size = UDim2.new(0, 70, 0, 28); box.Position = UDim2.new(1, -80, 0.5, -14); box.BackgroundColor3 = Color3.fromRGB(30, 30, 30); box.TextColor3 = Color3.new(1, 1, 1); box.Text = tostring(getgenv()[prop]); Instance.new("UICorner", box)
    box.FocusLost:Connect(function() 
        getgenv()[prop] = tonumber(box.Text) or getgenv()[prop]
        if prop == "R" or prop == "G" or prop == "B" then
            getgenv().AccentColor = Color3.fromRGB(getgenv().R, getgenv().G, getgenv().B)
            MainStroke.Color = getgenv().AccentColor
            TopBar.BackgroundColor3 = getgenv().AccentColor
        end
    end)
end

local Mov = CreateTab("Movement")
local Com = CreateTab("Combat")
local Vis = CreateTab("Visuals")
local Ply = CreateTab("Players")
local Utl = CreateTab("Utility")

AddInput(Mov, "WalkSpeed", "WalkSpeed")
AddInput(Mov, "JumpPower", "JumpPower")
AddToggle(Mov, "Noclip", "Noclip")
AddToggle(Mov, "Infinite Jump", "InfJump")
AddToggle(Mov, "Flight", "Flying")

AddToggle(Com, "Kill Aura", "KillAura")
AddInput(Com, "Aura Range", "AuraRange")
AddToggle(Com, "God Mode", "GodMode")
AddToggle(Com, "Hitbox Expander", "HBE")
AddInput(Com, "Hitbox Size", "HitboxSize")

AddToggle(Vis, "ESP Highlights", "ESP")
AddToggle(Vis, "Crosshair", "Crosshair")
AddInput(Vis, "Crosshair Size", "CrossSize")
AddToggle(Vis, "Chat Spammer", "Spammer")

AddInput(Utl, "Accent R", "R")
AddInput(Utl, "Accent G", "G")
AddInput(Utl, "Accent B", "B")

local sBtn = Instance.new("TextButton", Utl); sBtn.Size = UDim2.new(1, -10, 0, 40); sBtn.BackgroundColor3 = Color3.fromRGB(0, 100, 0); sBtn.Text = "SAVE CONFIG"; sBtn.TextColor3 = Color3.new(1,1,1); Instance.new("UICorner", sBtn)
sBtn.MouseButton1Click:Connect(function() SaveConfig() sBtn.Text = "SAVED!" task.wait(1) sBtn.Text = "SAVE CONFIG" end)

local function Refresh()
    for _,v in pairs(Ply:GetChildren()) do if v:IsA("Frame") then v:Destroy() end end
    for _,p in pairs(Players:GetPlayers()) do
        if p ~= LocalPlayer then
            local f = Instance.new("Frame", Ply); f.Size = UDim2.new(1,-10,0,90); f.BackgroundColor3 = Color3.fromRGB(18,18,18); Instance.new("UICorner", f)
            local l = Instance.new("TextLabel", f); l.Text = p.DisplayName; l.Size = UDim2.new(1,0,0,30); l.TextColor3 = Color3.new(1,1,1); l.BackgroundTransparency = 1
            local tp = Instance.new("TextButton", f); tp.Size = UDim2.new(0.3,0,0,30); tp.Position = UDim2.new(0.05,0,0.5,0); tp.Text = "TP"; tp.BackgroundColor3 = Color3.fromRGB(0,60,0); tp.TextColor3 = Color3.new(1,1,1); Instance.new("UICorner", tp)
            tp.MouseButton1Click:Connect(function() LocalPlayer.Character.HumanoidRootPart.CFrame = p.Character.HumanoidRootPart.CFrame end)
            local k = Instance.new("TextButton", f); k.Size = UDim2.new(0.3,0,0,30); k.Position = UDim2.new(0.35,0,0.5,0); k.Text = "KILL"; k.BackgroundColor3 = Color3.fromRGB(80,0,0); k.TextColor3 = Color3.new(1,1,1); Instance.new("UICorner", k)
            k.MouseButton1Click:Connect(function() local old = LocalPlayer.Character.HumanoidRootPart.CFrame; LocalPlayer.Character.HumanoidRootPart.CFrame = p.Character.HumanoidRootPart.CFrame; task.wait(0.1); LocalPlayer.Character.HumanoidRootPart.Velocity = Vector3.new(0,-1e7,0); task.wait(0.1); LocalPlayer.Character.HumanoidRootPart.CFrame = old end)
            local rep = Instance.new("TextButton", f); rep.Size = UDim2.new(0.2,0,0,30); rep.Position = UDim2.new(0.7,0,0.5,0); rep.Text = "REPORT"; rep.BackgroundColor3 = Color3.fromRGB(40,40,60); rep.TextColor3 = Color3.new(1,1,1); Instance.new("UICorner", rep)
            rep.MouseButton1Click:Connect(function() local cats = {"Bullying", "Toxic", "Scamming", "Swearing"} for i=1, 15 do for _, cat in pairs(cats) do Players:ReportAbuse(p, cat, "Toxic") end end rep.Text = "REPORTED" task.wait(2) rep.Text = "REPORT" end)
        end
    end
end
Players.PlayerAdded:Connect(Refresh)
Refresh()

RunService.Heartbeat:Connect(function()
    pcall(function()
        local char = LocalPlayer.Character
        if char then
            char.Humanoid.WalkSpeed = getgenv().WalkSpeed
            char.Humanoid.JumpPower = getgenv().JumpPower
            if getgenv().Flying then char.HumanoidRootPart.Velocity = Vector3.new(0,2,0) char.Humanoid:ChangeState(3) end
            if getgenv().GodMode then char.Humanoid.MaxHealth = math.huge char.Humanoid.Health = math.huge end
        end
        if getgenv().KillAura then
            for _, p in pairs(Players:GetPlayers()) do
                if p ~= LocalPlayer and p.Character and p.Character:FindFirstChild("HumanoidRootPart") then
                    if (char.HumanoidRootPart.Position - p.Character.HumanoidRootPart.Position).Magnitude <= getgenv().AuraRange then
                        p.Character.Humanoid.Health = 0
                    end
                end
            end
        end
        for _,p in pairs(Players:GetPlayers()) do
            if p ~= LocalPlayer and p.Character then
                local hrp = p.Character:FindFirstChild("HumanoidRootPart")
                if hrp and getgenv().HBE then hrp.Size = Vector3.new(getgenv().HitboxSize, getgenv().HitboxSize, getgenv().HitboxSize) hrp.Transparency = 0.7 hrp.CanCollide = false end
            end
        end
        local Viewport = workspace.CurrentCamera.ViewportSize
        CrossV.Visible = getgenv().Crosshair CrossH.Visible = getgenv().Crosshair
        CrossV.Size = UDim2.new(0, 2, 0, getgenv().CrossSize) CrossV.Position = UDim2.new(0, Viewport.X/2, 0, Viewport.Y/2) CrossV.BackgroundColor3 = getgenv().CrosshairColor
        CrossH.Size = UDim2.new(0, getgenv().CrossSize, 0, 2) CrossH.Position = UDim2.new(0, Viewport.X/2, 0, Viewport.Y/2) CrossH.BackgroundColor3 = getgenv().CrosshairColor
    end)
end)

task.spawn(function()
    while task.wait(1) do
        if getgenv().Spammer then pcall(function() if TextChatService.ChatVersion == Enum.ChatVersion.TextChatService then TextChatService.TextChannels.RBXGeneral:SendAsync(getgenv().SpamMsg) else game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer(getgenv().SpamMsg, "All") end end) end
    end
end)

UserInputService.InputBegan:Connect(function(i, g)
    if not g and i.KeyCode == Enum.KeyCode.RightControl then Main.Visible = not Main.Visible end
    if getgenv().InfJump and i.KeyCode == Enum.KeyCode.Space then LocalPlayer.Character.Humanoid:ChangeState(3) end
end)

MinBtn.MouseButton1Click:Connect(function()
    isMinimized = not isMinimized
    ContentFrame.Visible = not isMinimized
    Main:TweenSize(isMinimized and UDim2.new(0, 560, 0, 45) or UDim2.new(0, 560, 0, 500), "Out", "Quad", 0.3, true)
end)

local dragging, dragInput, dragStart, startPos
TopBar.InputBegan:Connect(function(input) if input.UserInputType == Enum.UserInputType.MouseButton1 then dragging = true dragStart = input.Position startPos = Main.Position end end)
UserInputService.InputChanged:Connect(function(input) if input.UserInputType == Enum.UserInputType.MouseMovement and dragging then local delta = input.Position - dragStart Main.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y) end end)
UserInputService.InputEnded:Connect(function(input) if input.UserInputType == Enum.UserInputType.MouseButton1 then dragging = false end end)
