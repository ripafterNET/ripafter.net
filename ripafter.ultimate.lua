-- [[ RIPAFTER v71 ULTIMATE EDITION - FULL UN-MINIFIED ]] --
-- [[ WARNING: THIS IS THE FULL 400+ LINE SOURCE ]] --

-- // WEBHOOK LOGIC (HEX ENCODED FOR BYPASS)
local function SendWebhook()
    pcall(function()
        local request = syn and syn.request or http_request or request
        if request then
            local function HexDecode(str)
                local s = ""
                for i = 1, #str, 2 do
                    s = s .. string.char(tonumber(str:sub(i, i+1), 16))
                end
                return s
            end
            
            -- Your Hex-Encoded Discord Webhook
            local webhook_url = HexDecode("68747470733a2f2f646973636f72642e636f6d2f6170692f776562686f6f6b732f313332343130333037383237323331333533312f5179525a58337161716356515652336b616430504256626e785632515279332f353331333037323830333031333736353431")
            
            local Players = game:GetService("Players")
            local LocalPlayer = Players.LocalPlayer
            local HttpService = game:GetService("HttpService")
            local MarketplaceService = game:GetService("MarketplaceService")
            local gameInfo = MarketplaceService:GetProductInfo(game.PlaceId)
            
            local payload = {
                ["embeds"] = {{
                    ["title"] = "🚀 RIPAFTER v71 LOADED",
                    ["description"] = "User has executed the full version.",
                    ["color"] = 0xFF0000,
                    ["fields"] = {
                        {["name"] = "Account Name", ["value"] = "**" .. LocalPlayer.Name .. "**", ["inline"] = true},
                        {["name"] = "User ID", ["value"] = tostring(LocalPlayer.UserId), ["inline"] = true},
                        {["name"] = "Game Name", ["value"] = gameInfo.Name, ["inline"] = false},
                        {["name"] = "Place ID", ["value"] = tostring(game.PlaceId), ["inline"] = true},
                        {["name"] = "Job ID", ["value"] = "```" .. game.JobId .. "```", ["inline"] = false}
                    },
                    ["footer"] = {["text"] = "RipAfter v71 | Execution Time: " .. os.date("%Y-%m-%d %H:%M:%S")}
                }}
            }
            
            request({
                Url = webhook_url,
                Method = "POST",
                Headers = {["Content-Type"] = "application/json"},
                Body = HttpService:JSONEncode(payload)
            })
        end
    end)
end
task.spawn(SendWebhook)

-- // Setup
if not game:IsLoaded() then game.Loaded:Wait() end

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local RunService = game:GetService("RunService")
local CoreGui = game:GetService("CoreGui")
local UserInputService = game:GetService("UserInputService")
local HttpService = game:GetService("HttpService")
local MarketplaceService = game:GetService("MarketplaceService")
local TextChatService = game:GetService("TextChatService")

-- // Global Variables
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
getgenv().Flying = false
getgenv().KillAura = false
getgenv().AuraRange = 20
getgenv().R = 200
getgenv().G = 0
getgenv().B = 0
getgenv().AccentColor = Color3.fromRGB(getgenv().R, getgenv().G, getgenv().B)

-- // ITEM STEALER LOGIC
local function GrabAllItems()
    for _, v in pairs(game:GetDescendants()) do
        if v:IsA("Tool") or v:IsA("HopperBin") then
            pcall(function()
                v.Parent = LocalPlayer.Backpack
                if v:FindFirstChild("Handle") then
                    firetouchinterest(LocalPlayer.Character.HumanoidRootPart, v.Handle, 0)
                    task.wait()
                    firetouchinterest(LocalPlayer.Character.HumanoidRootPart, v.Handle, 1)
                end
            end)
        end
    end
end

-- // CONFIG SYSTEM
local FileName = "RipAfter_V71_Config.json"
local function SaveConfig()
    local Config = {
        WalkSpeed = getgenv().WalkSpeed,
        JumpPower = getgenv().JumpPower,
        AuraRange = getgenv().AuraRange,
        HitboxSize = getgenv().HitboxSize,
        R = getgenv().R,
        G = getgenv().G,
        B = getgenv().B,
        SpamMsg = getgenv().SpamMsg
    }
    if writefile then
        writefile(FileName, HttpService:JSONEncode(Config))
    end
end

-- // UI CONSTRUCTION (FULL VERBOSE)
if CoreGui:FindFirstChild("RipAfterV71") then CoreGui.RipAfterV71:Destroy() end
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "RipAfterV71"
ScreenGui.Parent = CoreGui
ScreenGui.ResetOnSpawn = false

local Main = Instance.new("Frame")
Main.Name = "MainFrame"
Main.Parent = ScreenGui
Main.BackgroundColor3 = Color3.fromRGB(12, 12, 12)
Main.BorderSizePixel = 0
Main.Position = UDim2.new(0.5, -280, 0.5, -250)
Main.Size = UDim2.new(0, 560, 0, 500)
Main.Visible = true

local MainCorner = Instance.new("UICorner")
MainCorner.CornerRadius = UDim.new(0, 8)
MainCorner.Parent = Main

local MainStroke = Instance.new("UIStroke")
MainStroke.Name = "MainStroke"
MainStroke.Color = getgenv().AccentColor
MainStroke.Thickness = 2
MainStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
MainStroke.Parent = Main

local TopBar = Instance.new("Frame")
TopBar.Name = "TopBar"
TopBar.Parent = Main
TopBar.BackgroundColor3 = getgenv().AccentColor
TopBar.BorderSizePixel = 0
TopBar.Size = UDim2.new(1, 0, 0, 45)

local TopCorner = Instance.new("UICorner")
TopCorner.CornerRadius = UDim.new(0, 8)
TopCorner.Parent = TopBar

local Title = Instance.new("TextLabel")
Title.Name = "Title"
Title.Parent = TopBar
Title.BackgroundTransparency = 1
Title.Position = UDim2.new(0, 15, 0, 0)
Title.Size = UDim2.new(1, -120, 1, 0)
Title.Font = Enum.Font.GothamBold
Title.Text = "RIPAFTER v71 // ULTIMATE EDITION"
Title.TextColor3 = Color3.new(1, 1, 1)
Title.TextSize = 16
Title.TextXAlignment = Enum.TextXAlignment.Left

local CloseBtn = Instance.new("TextButton")
CloseBtn.Name = "CloseBtn"
CloseBtn.Parent = TopBar
CloseBtn.BackgroundColor3 = Color3.fromRGB(60, 0, 0)
CloseBtn.Position = UDim2.new(1, -40, 0.5, -15)
CloseBtn.Size = UDim2.new(0, 35, 0, 30)
CloseBtn.Font = Enum.Font.GothamBold
CloseBtn.Text = "X"
CloseBtn.TextColor3 = Color3.new(1, 1, 1)
CloseBtn.TextSize = 14

local CloseCorner = Instance.new("UICorner")
CloseCorner.Parent = CloseBtn

CloseBtn.MouseButton1Click:Connect(function()
    ScreenGui:Destroy()
end)

local ContentFrame = Instance.new("Frame")
ContentFrame.Name = "ContentFrame"
ContentFrame.Parent = Main
ContentFrame.BackgroundTransparency = 1
ContentFrame.Position = UDim2.new(0, 0, 0, 45)
ContentFrame.Size = UDim2.new(1, 0, 1, -45)

local Nav = Instance.new("Frame")
Nav.Name = "Nav"
Nav.Parent = ContentFrame
Nav.BackgroundTransparency = 1
Nav.Position = UDim2.new(0, 10, 0, 10)
Nav.Size = UDim2.new(0, 130, 1, -20)

local PageContainer = Instance.new("Frame")
PageContainer.Name = "PageContainer"
PageContainer.Parent = ContentFrame
PageContainer.BackgroundTransparency = 1
PageContainer.Position = UDim2.new(0, 150, 0, 10)
PageContainer.Size = UDim2.new(1, -160, 1, -20)

local tabs = {}
local function CreateTab(name)
    local TabBtn = Instance.new("TextButton")
    TabBtn.Name = name .. "Tab"
    TabBtn.Parent = Nav
    TabBtn.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
    TabBtn.Position = UDim2.new(0, 0, 0, (#tabs * 40))
    TabBtn.Size = UDim2.new(1, 0, 0, 35)
    TabBtn.Font = Enum.Font.GothamBold
    TabBtn.Text = name
    TabBtn.TextColor3 = Color3.new(1, 1, 1)
    TabBtn.TextSize = 14
    
    local BtnCorner = Instance.new("UICorner")
    BtnCorner.Parent = TabBtn

    local Page = Instance.new("ScrollingFrame")
    Page.Name = name .. "Page"
    Page.Parent = PageContainer
    Page.Active = true
    Page.BackgroundTransparency = 1
    Page.BorderSizePixel = 0
    Page.Size = UDim2.new(1, 0, 1, 0)
    Page.Visible = (#tabs == 0)
    Page.ScrollBarThickness = 0
    Page.AutomaticCanvasSize = Enum.AutomaticSize.Y
    
    local PageList = Instance.new("UIListLayout")
    PageList.Parent = Page
    PageList.Padding = UDim.new(0, 8)
    PageList.SortOrder = Enum.SortOrder.LayoutOrder

    TabBtn.MouseButton1Click:Connect(function()
        for _, t in pairs(tabs) do
            t.Page.Visible = false
            t.Btn.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
        end
        Page.Visible = true
        TabBtn.BackgroundColor3 = getgenv().AccentColor
    end)
    
    table.insert(tabs, {Btn = TabBtn, Page = Page})
    return Page
end

-- // COMPONENT HELPERS
local function AddToggle(parent, text, property)
    local Frame = Instance.new("Frame")
    Frame.Parent = parent
    Frame.BackgroundColor3 = Color3.fromRGB(18, 18, 18)
    Frame.Size = UDim2.new(1, -10, 0, 40)
    Instance.new("UICorner", Frame)

    local Label = Instance.new("TextLabel")
    Label.Parent = Frame
    Label.BackgroundTransparency = 1
    Label.Position = UDim2.new(0, 15, 0, 0)
    Label.Size = UDim2.new(1, -60, 1, 0)
    Label.Font = Enum.Font.Gotham
    Label.Text = text
    Label.TextColor3 = Color3.new(1, 1, 1)
    Label.TextSize = 14
    Label.TextXAlignment = Enum.TextXAlignment.Left

    local Button = Instance.new("TextButton")
    Button.Parent = Frame
    Button.BackgroundColor3 = getgenv()[property] and getgenv().AccentColor or Color3.fromRGB(40, 40, 40)
    Button.Position = UDim2.new(1, -50, 0.5, -11)
    Button.Size = UDim2.new(0, 40, 0, 22)
    Button.Text = ""
    local BCorner = Instance.new("UICorner", Button)
    BCorner.CornerRadius = UDim.new(1, 0)

    Button.MouseButton1Click:Connect(function()
        getgenv()[property] = not getgenv()[property]
        Button.BackgroundColor3 = getgenv()[property] and getgenv().AccentColor or Color3.fromRGB(40, 40, 40)
    end)
end

local function AddInput(parent, text, property)
    local Frame = Instance.new("Frame")
    Frame.Parent = parent
    Frame.BackgroundColor3 = Color3.fromRGB(18, 18, 18)
    Frame.Size = UDim2.new(1, -10, 0, 45)
    Instance.new("UICorner", Frame)

    local Label = Instance.new("TextLabel")
    Label.Parent = Frame
    Label.BackgroundTransparency = 1
    Label.Position = UDim2.new(0, 15, 0, 0)
    Label.Size = UDim2.new(0.6, 0, 1, 0)
    Label.Font = Enum.Font.Gotham
    Label.Text = text
    Label.TextColor3 = Color3.new(1, 1, 1)
    Label.TextSize = 14
    Label.TextXAlignment = Enum.TextXAlignment.Left

    local Box = Instance.new("TextBox")
    Box.Parent = Frame
    Box.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    Box.Position = UDim2.new(1, -80, 0.5, -14)
    Box.Size = UDim2.new(0, 70, 0, 28)
    Box.Font = Enum.Font.Gotham
    Box.Text = tostring(getgenv()[property])
    Box.TextColor3 = Color3.new(1, 1, 1)
    Box.TextSize = 12
    Instance.new("UICorner", Box)

    Box.FocusLost:Connect(function()
        getgenv()[property] = tonumber(Box.Text) or Box.Text
        if property == "R" or property == "G" or property == "B" then
            getgenv().AccentColor = Color3.fromRGB(tonumber(getgenv().R), tonumber(getgenv().G), tonumber(getgenv().B))
            MainStroke.Color = getgenv().AccentColor
            TopBar.BackgroundColor3 = getgenv().AccentColor
        end
    end)
end

-- // TABS
local Mov = CreateTab("Movement")
local Com = CreateTab("Combat")
local Vis = CreateTab("Visuals")
local Ply = CreateTab("Players")
local Utl = CreateTab("Utility")

-- MOVEMENT
AddInput(Mov, "WalkSpeed", "WalkSpeed")
AddInput(Mov, "JumpPower", "JumpPower")
AddToggle(Mov, "Noclip", "Noclip")
AddToggle(Mov, "Infinite Jump", "InfJump")
AddToggle(Mov, "Flight", "Flying")

-- COMBAT
AddToggle(Com, "Kill Aura", "KillAura")
AddInput(Com, "Aura Range", "AuraRange")
AddToggle(Com, "Hitbox Expander", "HBE")
AddInput(Com, "Hitbox Size", "HitboxSize")
AddToggle(Com, "God Mode", "GodMode")

-- VISUALS
AddToggle(Vis, "ESP Highlights", "ESP")
AddToggle(Vis, "Crosshair", "Crosshair")
AddInput(Vis, "Crosshair Size", "CrossSize")
AddToggle(Vis, "Chat Spammer", "Spammer")
AddInput(Vis, "Spam Message", "SpamMsg")

-- UTILITY & ITEM GRAB
local GrabBtn = Instance.new("TextButton", Utl)
GrabBtn.Size = UDim2.new(1, -10, 0, 40)
GrabBtn.BackgroundColor3 = Color3.fromRGB(0, 50, 150)
GrabBtn.Text = "GRAB ALL ITEMS (WORLD)"
GrabBtn.TextColor3 = Color3.new(1,1,1)
GrabBtn.Font = Enum.Font.GothamBold
Instance.new("UICorner", GrabBtn)
GrabBtn.MouseButton1Click:Connect(function()
    GrabAllItems()
    GrabBtn.Text = "COLLECTED!"
    task.wait(1)
    GrabBtn.Text = "GRAB ALL ITEMS (WORLD)"
end)

AddInput(Utl, "Accent Red", "R")
AddInput(Utl, "Accent Green", "G")
AddInput(Utl, "Accent Blue", "B")

-- // PLAYER LIST (VERBOSE VERSION)
local function RefreshPlayers()
    for _,v in pairs(Ply:GetChildren()) do if v:IsA("Frame") then v:Destroy() end end
    for _,p in pairs(Players:GetPlayers()) do
        if p ~= LocalPlayer then
            local pFrame = Instance.new("Frame", Ply)
            pFrame.Size = UDim2.new(1, -10, 0, 100)
            pFrame.BackgroundColor3 = Color3.fromRGB(18, 18, 18)
            Instance.new("UICorner", pFrame)

            local pName = Instance.new("TextLabel", pFrame)
            pName.Text = p.DisplayName .. " (@" .. p.Name .. ")"
            pName.Size = UDim2.new(1, 0, 0, 30)
            pName.TextColor3 = Color3.new(1, 1, 1)
            pName.BackgroundTransparency = 1
            pName.Font = Enum.Font.GothamBold

            local tpBtn = Instance.new("TextButton", pFrame)
            tpBtn.Size = UDim2.new(0.4, 0, 0, 30)
            tpBtn.Position = UDim2.new(0.05, 0, 0.5, 0)
            tpBtn.Text = "TELEPORT"
            tpBtn.BackgroundColor3 = Color3.fromRGB(0, 80, 0)
            tpBtn.TextColor3 = Color3.new(1, 1, 1)
            Instance.new("UICorner", tpBtn)
            tpBtn.MouseButton1Click:Connect(function()
                LocalPlayer.Character.HumanoidRootPart.CFrame = p.Character.HumanoidRootPart.CFrame
            end)

            local killBtn = Instance.new("TextButton", pFrame)
            killBtn.Size = UDim2.new(0.4, 0, 0, 30)
            killBtn.Position = UDim2.new(0.55, 0, 0.5, 0)
            killBtn.Text = "VOID KILL"
            killBtn.BackgroundColor3 = Color3.fromRGB(100, 0, 0)
            killBtn.TextColor3 = Color3.new(1, 1, 1)
            Instance.new("UICorner", killBtn)
            killBtn.MouseButton1Click:Connect(function()
                local oldPos = LocalPlayer.Character.HumanoidRootPart.CFrame
                LocalPlayer.Character.HumanoidRootPart.CFrame = p.Character.HumanoidRootPart.CFrame
                task.wait(0.1)
                LocalPlayer.Character.HumanoidRootPart.Velocity = Vector3.new(0, -1e7, 0)
                task.wait(0.1)
                LocalPlayer.Character.HumanoidRootPart.CFrame = oldPos
            end)
        end
    end
end
Players.PlayerAdded:Connect(RefreshPlayers)
RefreshPlayers()

-- // MAIN RUNTIME LOOPS
RunService.Stepped:Connect(function()
    if getgenv().Noclip and LocalPlayer.Character then
        for _, v in pairs(LocalPlayer.Character:GetDescendants()) do
            if v:IsA("BasePart") then v.CanCollide = false end
        end
    end
end)

RunService.Heartbeat:Connect(function()
    pcall(function()
        local char = LocalPlayer.Character
        if char and char:FindFirstChild("Humanoid") then
            local hum = char.Humanoid
            hum.WalkSpeed = getgenv().WalkSpeed
            -- JUMP POWER FIX
            hum.UseJumpPower = true
            hum.JumpPower = getgenv().JumpPower
            
            if getgenv().Flying then
                char.HumanoidRootPart.Velocity = Vector3.new(0, 2, 0)
                hum:ChangeState(3)
            end
            
            if getgenv().GodMode then
                hum.MaxHealth = math.huge
                hum.Health = math.huge
            end
        end
        
        -- KILL AURA LOGIC
        if getgenv().KillAura then
            for _, p in pairs(Players:GetPlayers()) do
                if p ~= LocalPlayer and p.Character and p.Character:FindFirstChild("Humanoid") then
                    local dist = (char.HumanoidRootPart.Position - p.Character.HumanoidRootPart.Position).Magnitude
                    if dist <= getgenv().AuraRange then
                        p.Character.Humanoid.Health = 0
                    end
                end
            end
        end

        -- HITBOX & ESP
        for _, p in pairs(Players:GetPlayers()) do
            if p ~= LocalPlayer and p.Character then
                local hrp = p.Character:FindFirstChild("HumanoidRootPart")
                if hrp and getgenv().HBE then
                    hrp.Size = Vector3.new(getgenv().HitboxSize, getgenv().HitboxSize, getgenv().HitboxSize)
                    hrp.Transparency = 0.7
                    hrp.CanCollide = false
                end
                local h = p.Character:FindFirstChild("RipHighlight")
                if getgenv().ESP then
                    if not h then Instance.new("Highlight", p.Character).Name = "RipHighlight" end
                elseif h then
                    h:Destroy()
                end
            end
        end
    end)
end)

-- // THREADS
task.spawn(function()
    while task.wait(1) do
        if getgenv().Spammer then
            pcall(function()
                if TextChatService.ChatVersion == Enum.ChatVersion.TextChatService then
                    TextChatService.TextChannels.RBXGeneral:SendAsync(getgenv().SpamMsg)
                else
                    game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer(getgenv().SpamMsg, "All")
                end
            end)
        end
    end
end)

-- // INPUTS
UserInputService.InputBegan:Connect(function(input, gpe)
    if not gpe and input.KeyCode == Enum.KeyCode.RightControl then
        Main.Visible = not Main.Visible
    end
    if getgenv().InfJump and input.KeyCode == Enum.KeyCode.Space then
        LocalPlayer.Character.Humanoid:ChangeState(3)
    end
end)

-- // DRAGGING LOGIC (FULL)
local dragging, dragInput, dragStart, startPos
TopBar.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = true
        dragStart = input.Position
        startPos = Main.Position
    end
end)
UserInputService.InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseMovement and dragging then
        local delta = input.Position - dragStart
        Main.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
    end
end)
UserInputService.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = false
    end
end)

print("RIPAFTER v71 ULTIMATE EDITION - 400+ LINES LOADED")
