-- Educational GUI and Movement Research - Private Server Only
local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local TweenService = game:GetService("TweenService")

local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

-- Create main educational GUI
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "EducationalResearchGUI"
screenGui.Parent = playerGui

-- Main frame
local mainFrame = Instance.new("Frame")
mainFrame.Size = UDim2.new(0, 300, 0, 400)
mainFrame.Position = UDim2.new(0, 10, 0, 10)
mainFrame.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
mainFrame.BorderSizePixel = 0
mainFrame.Parent = screenGui

-- Corner for smooth edges
local corner = Instance.new("UICorner")
corner.CornerRadius = UDim.new(0, 8)
corner.Parent = mainFrame

-- Title
local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, 0, 0, 40)
title.Position = UDim2.new(0, 0, 0, 0)
title.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
title.TextColor3 = Color3.fromRGB(255, 255, 255)
title.Text = "Educational Movement Research"
title.Font = Enum.Font.GothamBold
title.TextSize = 14
title.Parent = mainFrame

-- Flight toggle button
local flightButton = Instance.new("TextButton")
flightButton.Size = UDim2.new(0.9, 0, 0, 40)
flightButton.Position = UDim2.new(0.05, 0, 0.1, 0)
flightButton.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
flightButton.TextColor3 = Color3.fromRGB(255, 255, 255)
flightButton.Text = "Flight: OFF"
flightButton.Font = Enum.Font.Gotham
flightButton.TextSize = 12
flightButton.Parent = mainFrame

local flightCorner = Instance.new("UICorner")
flightCorner.CornerRadius = UDim.new(0, 6)
flightCorner.Parent = flightButton

-- WalkSpeed slider
local walkSpeedFrame = Instance.new("Frame")
walkSpeedFrame.Size = UDim2.new(0.9, 0, 0, 60)
walkSpeedFrame.Position = UDim2.new(0.05, 0, 0.25, 0)
walkSpeedFrame.BackgroundTransparency = 1
walkSpeedFrame.Parent = mainFrame

local walkSpeedLabel = Instance.new("TextLabel")
walkSpeedLabel.Size = UDim2.new(1, 0, 0, 20)
walkSpeedLabel.Position = UDim2.new(0, 0, 0, 0)
walkSpeedLabel.BackgroundTransparency = 1
walkSpeedLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
walkSpeedLabel.Text = "Walk Speed: 16"
walkSpeedLabel.Font = Enum.Font.Gotham
walkSpeedLabel.TextSize = 12
walkSpeedLabel.TextXAlignment = Enum.TextXAlignment.Left
walkSpeedLabel.Parent = walkSpeedFrame

local walkSpeedSlider = Instance.new("Frame")
walkSpeedSlider.Size = UDim2.new(1, 0, 0, 20)
walkSpeedSlider.Position = UDim2.new(0, 0, 0, 25)
walkSpeedSlider.BackgroundColor3 = Color3.fromRGB(80, 80, 80)
walkSpeedSlider.Parent = walkSpeedFrame

local walkSpeedFill = Instance.new("Frame")
walkSpeedFill.Size = UDim2.new(0.2, 0, 1, 0)
walkSpeedFill.Position = UDim2.new(0, 0, 0, 0)
walkSpeedFill.BackgroundColor3 = Color3.fromRGB(0, 170, 255)
walkSpeedFill.Parent = walkSpeedSlider

local sliderCorner = Instance.new("UICorner")
sliderCorner.CornerRadius = UDim.new(0, 4)
sliderCorner.Parent = walkSpeedSlider

local fillCorner = Instance.new("UICorner")
fillCorner.CornerRadius = UDim.new(0, 4)
fillCorner.Parent = walkSpeedFill

-- JumpPower slider
local jumpPowerFrame = Instance.new("Frame")
jumpPowerFrame.Size = UDim2.new(0.9, 0, 0, 60)
jumpPowerFrame.Position = UDim2.new(0.05, 0, 0.45, 0)
jumpPowerFrame.BackgroundTransparency = 1
jumpPowerFrame.Parent = mainFrame

local jumpPowerLabel = Instance.new("TextLabel")
jumpPowerLabel.Size = UDim2.new(1, 0, 0, 20)
jumpPowerLabel.Position = UDim2.new(0, 0, 0, 0)
jumpPowerLabel.BackgroundTransparency = 1
jumpPowerLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
jumpPowerLabel.Text = "Jump Power: 50"
jumpPowerLabel.Font = Enum.Font.Gotham
jumpPowerLabel.TextSize = 12
jumpPowerLabel.TextXAlignment = Enum.TextXAlignment.Left
jumpPowerLabel.Parent = jumpPowerFrame

local jumpPowerSlider = Instance.new("Frame")
jumpPowerSlider.Size = UDim2.new(1, 0, 0, 20)
jumpPowerSlider.Position = UDim2.new(0, 0, 0, 25)
jumpPowerSlider.BackgroundColor3 = Color3.fromRGB(80, 80, 80)
jumpPowerSlider.Parent = jumpPowerFrame

local jumpPowerFill = Instance.new("Frame")
jumpPowerFill.Size = UDim2.new(0.4, 0, 1, 0)
jumpPowerFill.Position = UDim2.new(0, 0, 0, 0)
jumpPowerFill.BackgroundColor3 = Color3.fromRGB(0, 200, 100)
jumpPowerFill.Parent = jumpPowerSlider

local jumpSliderCorner = Instance.new("UICorner")
jumpSliderCorner.CornerRadius = UDim.new(0, 4)
jumpSliderCorner.Parent = jumpPowerSlider

local jumpFillCorner = Instance.new("UICorner")
jumpFillCorner.CornerRadius = UDim.new(0, 4)
jumpFillCorner.Parent = jumpPowerFill

-- Noclip toggle
local noclipButton = Instance.new("TextButton")
noclipButton.Size = UDim2.new(0.9, 0, 0, 40)
noclipButton.Position = UDim2.new(0.05, 0, 0.65, 0)
noclipButton.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
noclipButton.TextColor3 = Color3.fromRGB(255, 255, 255)
noclipButton.Text = "Noclip: OFF"
noclipButton.Font = Enum.Font.Gotham
noclipButton.TextSize = 12
noclipButton.Parent = mainFrame

local noclipCorner = Instance.new("UICorner")
noclipCorner.CornerRadius = UDim.new(0, 6)
noclipCorner.Parent = noclipButton

-- Status label
local statusLabel = Instance.new("TextLabel")
statusLabel.Size = UDim2.new(0.9, 0, 0, 40)
statusLabel.Position = UDim2.new(0.05, 0, 0.85, 0)
statusLabel.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
statusLabel.TextColor3 = Color3.fromRGB(200, 200, 200)
statusLabel.Text = "Research Ready"
statusLabel.Font = Enum.Font.Gotham
statusLabel.TextSize = 11
statusLabel.Parent = mainFrame

local statusCorner = Instance.new("UICorner")
statusCorner.CornerRadius = UDim.new(0, 6)
statusCorner.Parent = statusLabel

-- Research Variables
local flying = false
local noclip = false
local currentWalkSpeed = 16
local currentJumpPower = 50

-- Initialize character
local character = player.Character or player.CharacterAdded:Wait()
local humanoid = character:WaitForChild("Humanoid")

-- Update sliders function
local function updateSliders()
    walkSpeedLabel.Text = "Walk Speed: " .. currentWalkSpeed
    jumpPowerLabel.Text = "Jump Power: " .. currentJumpPower
    
    local walkFill = math.clamp((currentWalkSpeed - 16) / (100 - 16), 0, 1)
    local jumpFill = math.clamp((currentJumpPower - 50) / (200 - 50), 0, 1)
    
    walkSpeedFill.Size = UDim2.new(walkFill, 0, 1, 0)
    jumpPowerFill.Size = UDim2.new(jumpFill, 0, 1, 0)
end

-- Flight research system
flightButton.MouseButton1Click:Connect(function()
    flying = not flying
    flightButton.Text = flying and "Flight: ON" or "Flight: OFF"
    flightButton.BackgroundColor3 = flying and Color3.fromRGB(0, 120, 215) or Color3.fromRGB(60, 60, 60)
    statusLabel.Text = flying and "Flight Research: Active" or "Flight Research: Inactive"
end)

-- Noclip research system
noclipButton.MouseButton1Click:Connect(function()
    noclip = not noclip
    noclipButton.Text = noclip and "Noclip: ON" or "Noclip: OFF"
    noclipButton.BackgroundColor3 = noclip and Color3.fromRGB(215, 0, 0) or Color3.fromRGB(60, 60, 60)
    statusLabel.Text = noclip and "Collision Research: Active" or "Collision Research: Inactive"
end)

-- Slider interaction for WalkSpeed
walkSpeedSlider.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        local connection
        connection = RunService.Heartbeat:Connect(function()
            local mouse = UserInputService:GetMouseLocation()
            local sliderAbsolutePos = walkSpeedSlider.AbsolutePosition
            local sliderAbsoluteSize = walkSpeedSlider.AbsoluteSize
            
            local relativeX = math.clamp((mouse.X - sliderAbsolutePos.X) / sliderAbsoluteSize.X, 0, 1)
            currentWalkSpeed = math.floor(16 + (relativeX * (100 - 16)))
            humanoid.WalkSpeed = currentWalkSpeed
            updateSliders()
            
            if not UserInputService:IsMouseButtonPressed(Enum.UserInputType.MouseButton1) then
                connection:Disconnect()
            end
        end)
    end
end)

-- Slider interaction for JumpPower
jumpPowerSlider.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        local connection
        connection = RunService.Heartbeat:Connect(function()
            local mouse = UserInputService:GetMouseLocation()
            local sliderAbsolutePos = jumpPowerSlider.AbsolutePosition
            local sliderAbsoluteSize = jumpPowerSlider.AbsoluteSize
            
            local relativeX = math.clamp((mouse.X - sliderAbsolutePos.X) / sliderAbsoluteSize.X, 0, 1)
            currentJumpPower = math.floor(50 + (relativeX * (200 - 50)))
            humanoid.JumpPower = currentJumpPower
            updateSliders()
            
            if not UserInputService:IsMouseButtonPressed(Enum.UserInputType.MouseButton1) then
                connection:Disconnect()
            end
        end)
    end
end)

-- Flight research implementation
RunService.Heartbeat:Connect(function()
    if flying and character and humanoid then
        humanoid:ChangeState(Enum.HumanoidStateType.Flying)
        
        local root = character:FindFirstChild("HumanoidRootPart")
        if root then
            root.Velocity = Vector3.new(0, 0, 0)
            
            local flyVelocity = Vector3.new(0, 0, 0)
            if UserInputService:IsKeyDown(Enum.KeyCode.W) then
                flyVelocity = flyVelocity + root.CFrame.LookVector * 50
            end
            if UserInputService:IsKeyDown(Enum.KeyCode.S) then
                flyVelocity = flyVelocity - root.CFrame.LookVector * 50
            end
            if UserInputService:IsKeyDown(Enum.KeyCode.A) then
                flyVelocity = flyVelocity - root.CFrame.RightVector * 50
            end
            if UserInputService:IsKeyDown(Enum.KeyCode.D) then
                flyVelocity = flyVelocity + root.CFrame.RightVector * 50
            end
            if UserInputService:IsKeyDown(Enum.KeyCode.Space) then
                flyVelocity = flyVelocity + Vector3.new(0, 50, 0)
            end
            if UserInputService:IsKeyDown(Enum.KeyCode.LeftShift) then
                flyVelocity = flyVelocity - Vector3.new(0, 50, 0)
            end
            
            root.Velocity = flyVelocity
        end
    end
end)

-- Noclip research implementation
RunService.Stepped:Connect(function()
    if noclip and character then
        for _, part in pairs(character:GetDescendants()) do
            if part:IsA("BasePart") then
                part.CanCollide = false
            end
        end
    end
end)

-- Handle character respawn
player.CharacterAdded:Connect(function(newCharacter)
    character = newCharacter
    humanoid = character:WaitForChild("Humanoid")
    
    -- Reapply research settings
    humanoid.WalkSpeed = currentWalkSpeed
    humanoid.JumpPower = currentJumpPower
    
    statusLabel.Text = "Character Reloaded - Research Active"
end)

-- Initialize
updateSliders()
humanoid.WalkSpeed = currentWalkSpeed
humanoid.JumpPower = currentJumpPower

print("Educational Movement Research GUI Loaded - For Private Server Study Only")