--Scripted by TheLocalG @ discord.gg/gogames
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")

local function createNameTag(character, playerName)
    if not character or not playerName then return end

    local head = character:FindFirstChild("Head")
    if not head then return end

    local billboardGui = Instance.new("BillboardGui")
    billboardGui.Adornee = head
    billboardGui.Size = UDim2.new(5, 0, 1, 0) 
    billboardGui.StudsOffset = Vector3.new(0, 2, 0)
    billboardGui.AlwaysOnTop = true

    local textLabel = Instance.new("TextLabel")
    textLabel.Size = UDim2.new(1, 0, 1, 0)
    textLabel.BackgroundTransparency = 1
    textLabel.Text = playerName
    textLabel.TextColor3 = Color3.new(1, 1, 1) 
    textLabel.TextScaled = true
    textLabel.Font = Enum.Font.SourceSansBold

    textLabel.Parent = billboardGui

    billboardGui.Parent = head
end

local function addNameTags()
    for _, player in ipairs(Players:GetPlayers()) do
        if player.Character then
            createNameTag(player.Character, player.Name)
        end
    end
end

Players.PlayerAdded:Connect(function(player)
    player.CharacterAdded:Connect(function(character)
        createNameTag(character, player.Name)
    end)
end)

addNameTags()

RunService.Heartbeat:Connect(function()
    for _, player in ipairs(Players:GetPlayers()) do
        if player.Character and not player.Character:FindFirstChild("Head"):FindFirstChild("BillboardGui") then
            createNameTag(player.Character, player.Name)
        end
    end
end)
