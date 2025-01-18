local Players = game:GetService("Players")
local RunService = game:GetService("RunService")

local function highlightCharacter(character)
    if not character or not character:IsA("Model") then return end

    for _, part in ipairs(character:GetDescendants()) do
        if part:IsA("BasePart") then
            if not part:FindFirstChild("SelectionBox") then
                local highlight = Instance.new("SelectionBox")
                highlight.Adornee = part
                highlight.LineThickness = 0.05
                highlight.Color3 = Color3.new(1, 0, 0) -- Set box color to red
                highlight.SurfaceTransparency = 0.5
                highlight.Parent = part
            end
        end
    end
end

local function createNameTag(character, playerName)
    if not character or not playerName then return end

    local head = character:FindFirstChild("Head")
    if not head then return end

    if not head:FindFirstChild("BillboardGui") then
        local billboardGui = Instance.new("BillboardGui")
        billboardGui.Adornee = head
        billboardGui.Size = UDim2.new(5, 0, 1, 0) 
        billboardGui.StudsOffset = Vector3.new(0, 2, 0)
        billboardGui.AlwaysOnTop = true

        local textLabel = Instance.new("TextLabel")
        textLabel.Size = UDim2.new(1, 0, 1, 0)
        textLabel.BackgroundTransparency = 1
        textLabel.Text = playerName
        textLabel.TextColor3 = Color3.new(1, 0, 0) -- Set text color to red
        textLabel.TextScaled = true
        textLabel.Font = Enum.Font.SourceSansBold

        textLabel.Parent = billboardGui
        billboardGui.Parent = head
    end
end

local function addNameTagsAndHighlights()
    for _, player in ipairs(Players:GetPlayers()) do
        if player.Character then
            createNameTag(player.Character, player.Name)
            highlightCharacter(player.Character)
        end
    end
end

Players.PlayerAdded:Connect(function(player)
    player.CharacterAdded:Connect(function(character)
        if character then
            createNameTag(character, player.Name)
            highlightCharacter(character)
        end
    end)
end)

addNameTagsAndHighlights()

RunService.Heartbeat:Connect(function()
    for _, player in ipairs(Players:GetPlayers()) do
        local character = player.Character
        if character then
            local head = character:FindFirstChild("Head")
            if head then
                createNameTag(character, player.Name)
            end
            highlightCharacter(character)
        end
    end
end)
