-- Educational Speed Research - Private Server Only
local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")

local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

-- Create Speed GUI
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "SpeedResearchGUI"
screenGui.Parent = playerGui

local mainFrame = Instance.new("Frame")
mainFrame.Size = UDim2.new(0, 200, 0, 120)
mainFrame.Position = UDim2.new(0, 10, 0, 190)
mainFrame.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
mainFrame.BorderSizePixel = 0
mainFrame.Parent = screenGui

local corner = Instance.new("UICorner")
corner.CornerRadius = UDim.new(0, 8)
corner.Parent = mainFrame

local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, 0, 0, 25)
title.Position = UDim2.new(0, 0, 0, 0)
title.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
title.TextColor3 = Color3.fromRGB(255, 255, 255)
title.Text = "Movement Research"
title.Font = Enum.Font.GothamBold
title.TextSize = 12
title.Parent = mainFrame

-- Walk Speed Slider
local walkSpeedFrame = Instance.new("Frame")
walkSpeedFrame.Size = UDim2.new(0.9, 0, 0, 40)
walkSpeedFrame.Position = UDim2.new(0.05, 0, 0.3, 0)
walkSpeedFrame.BackgroundTransparency = 1
walkSpeedFrame.Parent = mainFrame

local walkSpeedLabel = Instance.new("TextLabel")
walkSpeedLabel.Size = UDim2.new(1, 0, 0, 15)
walkSpeedLabel.Position = UDim2.new(0, 0, 0, 0)
walkSpeedLabel.BackgroundTransparency = 1
walkSpeedLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
walkSpeedLabel.Text = "Walk Speed: 16"
walkSpeedLabel.Font = Enum.Font.Gotham
walkSpeedLabel.TextSize = 11
walkSpeedLabel.TextXAlignment = Enum.TextXAlignment.Left
walkSpeedLabel.Parent = walkSpeedFrame

local walkSpeedSlider = Instance.new("Frame")
walkSpeedSlider.Size = UDim2.new(1, 0, 0, 15)
walkSpeedSlider.Position = UDim2.new(0, 0, 0, 20)
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

-- Speed Research Variables
local currentWalkSpeed = 16
local character = player.Character or player.CharacterAdded:Wait()
local humanoid = character:WaitForChild("Humanoid")

-- Update Slider Display
local function updateSlider()
    walkSpeedLabel.Text = "Walk Speed: " .. currentWalkSpeed
    local walkFill = math.clamp((currentWalkSpeed - 16) / (100 - 16), 0, 1)
    walkSpeedFill.Size = UDim2.new(walkFill, 0, 1, 0)
    humanoid.WalkSpeed = currentWalkSpeed
end

-- Slider Interaction
walkSpeedSlider.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        local connection
        connection = RunService.Heartbeat:Connect(function()
            local mouse = UserInputService:GetMouseLocation()
            local sliderAbsolutePos = walkSpeedSlider.AbsolutePosition
            local sliderAbsoluteSize = walkSpeedSlider.AbsoluteSize
            
            local relativeX = math.clamp((mouse.X - sliderAbsolutePos.X) / sliderAbsoluteSize.X, 0, 1)
            currentWalkSpeed = math.floor(16 + (relativeX * (100 - 16)))
            updateSlider()
            
            if not UserInputService:IsMouseButtonPressed(Enum.UserInputType.MouseButton1) then
                connection:Disconnect()
            end
        end)
    end
end)

-- Handle Character Respawn
player.CharacterAdded:Connect(function(newCharacter)
    character = newCharacter
    humanoid = character:WaitForChild("Humanoid")
    humanoid.WalkSpeed = currentWalkSpeed
end)

-- Initialize
updateSlider()

print("Educational Speed Research Loaded - For Private Server Study")