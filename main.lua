-- GUI Setup
local screenGui = Instance.new("ScreenGui", game.CoreGui)
screenGui.Name = "ControlGui"

-- Main Frame (Yellow GUI)
local mainFrame = Instance.new("Frame", screenGui)
mainFrame.Size = UDim2.new(0, 170, 0, 305)
mainFrame.Position = UDim2.new(0, 20, 0, 20)
mainFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 0)
mainFrame.Active = true
mainFrame.Draggable = true
mainFrame.BorderSizePixel = 0

-- Title Bar
local titleBar = Instance.new("TextLabel", mainFrame)
titleBar.Size = UDim2.new(1, 0, 0, 30)
titleBar.Position = UDim2.new(0, 0, 0, 0)
titleBar.BackgroundColor3 = Color3.fromRGB(200, 200, 0)
titleBar.Text = "x00cgui v1.1"
titleBar.TextColor3 = Color3.new(0, 0, 0)
titleBar.Font = Enum.Font.SourceSansBold
titleBar.TextSize = 18
titleBar.BorderSizePixel = 0

-- Minimize Button
local minimizeButton = Instance.new("TextButton", titleBar)
minimizeButton.Size = UDim2.new(0, 30, 1, 0)
minimizeButton.Position = UDim2.new(1, -30, 0, 0)
minimizeButton.Text = "-"
minimizeButton.BackgroundColor3 = Color3.fromRGB(200, 200, 0)
minimizeButton.TextColor3 = Color3.new(0, 0, 0)
minimizeButton.Font = Enum.Font.SourceSansBold
minimizeButton.TextSize = 20
minimizeButton.BorderSizePixel = 0

-- Container for Buttons
local buttonFrame = Instance.new("Frame", mainFrame)
buttonFrame.Size = UDim2.new(1, 0, 1, -30)
buttonFrame.Position = UDim2.new(0, 0, 0, 30)
buttonFrame.BackgroundTransparency = 1

-- Toggle Minimize
local minimized = false
minimizeButton.MouseButton1Click:Connect(function()
    minimized = not minimized
    buttonFrame.Visible = not minimized
    if minimized then
        mainFrame.Size = UDim2.new(0, 170, 0, 30)
    else
        mainFrame.Size = UDim2.new(0, 170, 0, 305)
    end
end)

-- Button Creator
local function createButton(name, posY, callback)
    local btn = Instance.new("TextButton", buttonFrame)
    btn.Size = UDim2.new(1, -20, 0, 30)
    btn.Position = UDim2.new(0, 10, 0, posY)
    btn.BackgroundColor3 = Color3.fromRGB(255, 200, 0)
    btn.TextColor3 = Color3.new(0, 0, 0)
    btn.Font = Enum.Font.SourceSansBold
    btn.TextSize = 16
    btn.Text = name
    btn.BorderSizePixel = 0
    btn.MouseButton1Click:Connect(callback)
end

-- Decal Spam (all faces + skybox)
createButton("Decal Spam", 0, function()
    for _, obj in pairs(workspace:GetDescendants()) do
        pcall(function()
            if obj:IsA("BasePart") then
                for _, face in pairs(Enum.NormalId:GetEnumItems()) do
                    local decal = Instance.new("Decal")
                    decal.Texture = "rbxassetid://10111107769"
                    decal.Face = face
                    decal.Parent = obj
                end
            end
        end)
    end
    local lighting = game:GetService("Lighting")
    local sky = Instance.new("Sky", lighting)
    for _, faceProp in pairs({"SkyboxBk","SkyboxDn","SkyboxFt","SkyboxLf","SkyboxRt","SkyboxUp"}) do
        sky[faceProp] = "rbxassetid://10111107769"
    end
end)

-- Music
createButton("Music", 35, function()
    local sound = Instance.new("Sound", workspace)
    sound.SoundId = "rbxassetid://1839246711"
    sound.Looped = true
    sound.Volume = 5
    sound:Play()
end)

-- Disco
createButton("Disco", 70, function()
    for _, obj in pairs(workspace:GetDescendants()) do
        pcall(function()
            if obj:IsA("BasePart") then
                obj.Color = Color3.new(math.random(), math.random(), math.random())
            end
        end)
    end
end)

-- Fog
createButton("Fog", 105, function()
    local lighting = game:GetService("Lighting")
    lighting.FogColor = Color3.new(1, 1, 1)
    lighting.FogStart = 0
    lighting.FogEnd = 100
end)

-- Clear Workspace
createButton("NUKE", 140, function()
    for _, child in pairs(workspace:GetChildren()) do
        if not child:IsA("Terrain") and not child:IsA("Camera") then
            child:Destroy()
        end
    end
end)

-- Antileave
createButton("Antileave", 175, function()
    game:BindToClose(function()
        while true do end
    end)
end)

-- Message (Grey)
createButton("Message", 210, function()
       msg = Instance.new("Message",workspace)
		   msg.Text = "x00ckidd WAS HERE"
end)

-- Particles (10111107769)
createButton("Particles", 245, function()
    for _, player in pairs(game.Players:GetPlayers()) do
        local ch = player.Character
        if ch then
            local root = ch:FindFirstChild("HumanoidRootPart") or ch:FindFirstChild("Torso") or ch:FindFirstChild("UpperTorso")
            if root then
                local emitter = Instance.new("ParticleEmitter")
                emitter.Texture = "rbxassetid://10111107769"
                emitter.Rate = 20
                emitter.Lifetime = NumberRange.new(1)
                emitter.Speed = NumberRange.new(5)
                emitter.Parent = root
            end
        end
    end
end)
