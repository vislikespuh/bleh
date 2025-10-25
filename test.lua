-- Simple Working Movement GUI
local Players = game:GetService("Players")
local UIS = game:GetService("UserInputService")
local RunService = game:GetService("RunService")

local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

-- Clear any existing GUI
for _, gui in ipairs(playerGui:GetChildren()) do
    if gui:IsA("ScreenGui") then
        gui:Destroy()
    end
end

-- Create basic GUI
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "SimpleMovementGUI"
screenGui.Parent = playerGui
screenGui.ResetOnSpawn = false

-- Main frame
local mainFrame = Instance.new("Frame")
mainFrame.Size = UDim2.new(0, 200, 0, 250)
mainFrame.Position = UDim2.new(0, 10, 0, 10)
mainFrame.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
mainFrame.BorderSizePixel = 0
mainFrame.Parent = screenGui

-- Make it draggable
local dragging = false
local dragInput
local dragStart
local startPos

local function update(input)
    local delta = input.Position - dragStart
    mainFrame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
end

mainFrame.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = true
        dragStart = input.Position
        startPos = mainFrame.Position
        
        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then
                dragging = false
            end
        end)
    end
end)

mainFrame.InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseMovement then
        dragInput = input
    end
end)

UIS.InputChanged:Connect(function(input)
    if input == dragInput and dragging then
        update(input)
    end
end)

-- Title
local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, 0, 0, 30)
title.Position = UDim2.new(0, 0, 0, 0)
title.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
title.TextColor3 = Color3.fromRGB(255, 255, 255)
title.Text = "Movement Controls"
title.Font = Enum.Font.GothamBold
title.TextSize = 14
title.Parent = mainFrame

-- Fly button
local flyBtn = Instance.new("TextButton")
flyBtn.Size = UDim2.new(0.9, 0, 0, 35)
flyBtn.Position = UDim2.new(0.05, 0, 0.15, 0)
flyBtn.BackgroundColor3 = Color3.fromRGB(60, 60, 70)
flyBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
flyBtn.Text = "Fly: OFF (F)"
flyBtn.Font = Enum.Font.Gotham
flyBtn.TextSize = 12
flyBtn.Parent = mainFrame

-- Speed button
local speedBtn = Instance.new("TextButton")
speedBtn.Size = UDim2.new(0.9, 0, 0, 35)
speedBtn.Position = UDim2.new(0.05, 0, 0.35, 0)
speedBtn.BackgroundColor3 = Color3.fromRGB(60, 60, 70)
speedBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
speedBtn.Text = "Speed: OFF (G)"
speedBtn.Font = Enum.Font.Gotham
speedBtn.TextSize = 12
speedBtn.Parent = mainFrame

-- Noclip button
local noclipBtn = Instance.new("TextButton")
noclipBtn.Size = UDim2.new(0.9, 0, 0, 35)
noclipBtn.Position = UDim2.new(0.05, 0, 0.55, 0)
noclipBtn.BackgroundColor3 = Color3.fromRGB(60, 60, 70)
noclipBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
noclipBtn.Text = "Noclip: OFF (H)"
noclipBtn.Font = Enum.Font.Gotham
noclipBtn.TextSize = 12
noclipBtn.Parent = mainFrame

-- Status
local status = Instance.new("TextLabel")
status.Size = UDim2.new(0.9, 0, 0, 40)
status.Position = UDim2.new(0.05, 0, 0.75, 0)
status.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
status.TextColor3 = Color3.fromRGB(0, 255, 0)
status.Text = "Ready - Click buttons or use F/G/H"
status.Font = Enum.Font.Gotham
status.TextSize = 10
status.TextWrapped = true
status.Parent = mainFrame

-- Movement variables
local flying = false
local speedEnabled = false
local noclipEnabled = false
local character = player.Character or player.CharacterAdded:Wait()
local humanoid = character:WaitForChild("Humanoid")

-- Fly function
local function toggleFly()
    flying = not flying
    flyBtn.Text = flying and "Fly: ON (F)" or "Fly: OFF (F)"
    flyBtn.BackgroundColor3 = flying and Color3.fromRGB(0, 120, 215) or Color3.fromRGB(60, 60, 70)
    status.Text = flying and "Fly ON - Use WASD+Space+Shift" or "Fly OFF"
end

-- Speed function
local function toggleSpeed()
    speedEnabled = not speedEnabled
    speedBtn.Text = speedEnabled and "Speed: ON (G)" or "Speed: OFF (G)"
    speedBtn.BackgroundColor3 = speedEnabled and Color3.fromRGB(0, 170, 0) or Color3.fromRGB(60, 60, 70)
    humanoid.WalkSpeed = speedEnabled and 50 or 16
    status.Text = speedEnabled and "Speed ON (50)" or "Speed OFF (16)"
end

-- Noclip function
local function toggleNoclip()
    noclipEnabled = not noclipEnabled
    noclipBtn.Text = noclipEnabled and "Noclip: ON (H)" or "Noclip: OFF (H)"
    noclipBtn.BackgroundColor3 = noclipEnabled and Color3.fromRGB(170, 0, 0) or Color3.fromRGB(60, 60, 70)
    status.Text = noclipEnabled and "Noclip ON" or "Noclip OFF"
end

-- Button clicks
flyBtn.MouseButton1Click:Connect(toggleFly)
speedBtn.MouseButton1Click:Connect(toggleSpeed)
noclipBtn.MouseButton1Click:Connect(toggleNoclip)

-- Key binds
UIS.InputBegan:Connect(function(input)
    if input.KeyCode == Enum.KeyCode.F then
        toggleFly()
    elseif input.KeyCode == Enum.KeyCode.G then
        toggleSpeed()
    elseif input.KeyCode == Enum.KeyCode.H then
        toggleNoclip()
    end
end)

-- Fly system
RunService.Heartbeat:Connect(function()
    if flying and character and humanoid then
        humanoid:ChangeState(Enum.HumanoidStateType.Flying)
        local root = character:FindFirstChild("HumanoidRootPart")
        if root then
            root.Velocity = Vector3.new(0, 0, 0)
            local move = Vector3.new(0, 0, 0)
            if UIS:IsKeyDown(Enum.KeyCode.W) then move = move + root.CFrame.LookVector * 50 end
            if UIS:IsKeyDown(Enum.KeyCode.S) then move = move - root.CFrame.LookVector * 50 end
            if UIS:IsKeyDown(Enum.KeyCode.A) then move = move - root.CFrame.RightVector * 50 end
            if UIS:IsKeyDown(Enum.KeyCode.D) then move = move + root.CFrame.RightVector * 50 end
            if UIS:IsKeyDown(Enum.KeyCode.Space) then move = move + Vector3.new(0, 50, 0) end
            if UIS:IsKeyDown(Enum.KeyCode.LeftShift) then move = move - Vector3.new(0, 50, 0) end
            root.Velocity = move
        end
    end
end)

-- Noclip system
RunService.Stepped:Connect(function()
    if character then
        for _, part in pairs(character:GetDescendants()) do
            if part:IsA("BasePart") then
                part.CanCollide = not noclipEnabled
            end
        end
    end
end)

-- Handle respawn
player.CharacterAdded:Connect(function(newCharacter)
    character = newCharacter
    humanoid = character:WaitForChild("Humanoid")
    if speedEnabled then humanoid.WalkSpeed = 50 end
    status.Text = "Character respawned - controls active"
end)

print("✅ Simple Movement GUI Loaded Successfully!")
print("🎮 Controls: F (Fly) | G (Speed) | H (Noclip)")
print("💡 Click and drag the window to move it")