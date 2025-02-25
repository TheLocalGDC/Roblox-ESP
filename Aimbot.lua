--This isnt like your "arsenal aimbot" this just locks onto a players head and combined
-- with the esp script makes it highlight playrs and lock onto them and you have to just fire!
--//Report bugs on discord: localg_new\\

local v1 = game:GetService("Players")
local v2 = game:GetService("RunService")
local v3 = game.Workspace.CurrentCamera
local v4 = v1.LocalPlayer

local function v5()
    local v6 = nil
    local v7 = math.huge  

    for _, v8 in ipairs(v1:GetPlayers()) do
        if v8 ~= v4 and v8.Character then
            local v9 = v8.Character:FindFirstChild("Head")
            if v9 then
                local v10 = (v4.Character.Head.Position - v9.Position).Magnitude
                if v10 < v7 then
                    v7 = v10
                    v6 = v9
                end
            end
        end
    end
    return v6
end

while true do
    local v11 = v5()
    if v11 then
        v3.CFrame = v3.CFrame:Lerp(CFrame.new(v3.CFrame.Position, v11.Position), 0.2)
    end
    task.wait()
end