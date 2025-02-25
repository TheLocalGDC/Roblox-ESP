local v1 = game:GetService("Players")
local v2 = game:GetService("RunService")

local function v3(v4)
    if not v4 or not v4:IsA("Model") then return end
    for _, v5 in ipairs(v4:GetDescendants()) do
        if v5:IsA("BasePart") and not v5:FindFirstChild("v6") then
            local v6 = Instance.new("SelectionBox")
            v6.Adornee = v5
            v6.LineThickness = 0.05
            v6.Color3 = Color3.new(1, 0, 0) 
            v6.SurfaceTransparency = 0.5
            v6.Parent = v5
        end
    end
end

local function v7(v8, v9)
    local v10 = v8:FindFirstChild("Head")
    if not v10 or v10:FindFirstChild("v11") then return end

    local v11 = Instance.new("BillboardGui")
    v11.Adornee = v10
    v11.Size = UDim2.new(5, 0, 1, 0) 
    v11.StudsOffset = Vector3.new(0, 2, 0)
    v11.AlwaysOnTop = true

    local v12 = Instance.new("TextLabel")
    v12.Size = UDim2.new(1, 0, 1, 0)
    v12.BackgroundTransparency = 1
    v12.Text = v9
    v12.TextColor3 = Color3.new(1, 0, 0) 
    v12.TextScaled = true
    v12.Font = Enum.Font.SourceSansBold

    v12.Parent = v11
    v11.Parent = v10
end

local function v13()
    for _, v14 in ipairs(v1:GetPlayers()) do
        if v14.Character then
            v7(v14.Character, v14.Name)
            v3(v14.Character)
        end
    end
end

v1.PlayerAdded:Connect(function(v15)
    v15.CharacterAdded:Connect(function(v16)
        v7(v16, v15.Name)
        v3(v16)
    end)
end)

v13()

while true do
    for _, v17 in ipairs(v1:GetPlayers()) do
        local v18 = v17.Character
        if v18 then
            v3(v18)
        end
    end
    task.wait()
end 
