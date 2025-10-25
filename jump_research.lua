-- Educational Jump Research - Private Server Only
local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")

local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

-- Create Jump GUI
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "JumpResearchGUI"
screenGui.Parent = playerGui

local mainFrame = Instance.new("Frame")
mainFrame.Size = UDim2.new(0, 200, 0, 120)
mainFrame.Position = UDim2.new(0, 220, 0, 10)
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
title.Text = "Jump Physics Research"
title.Font = Enum.Font.GothamBold
title.TextSize = 12
title.Parent = mainFrame

-- Jump Power Slider
local jumpPowerFrame = Instance.new("Frame")
jumpPowerFrame.Size = UDim2.new(0.9, 0, 0, 40)
jumpPowerFrame.Position = UDim2.new(0.05, 0, 0.3, 0)
jumpPowerFrame.BackgroundTransparency = 1
jumpPowerFrame.Parent = mainFrame

local jumpPowerLabel = Instance.new("TextLabel")
jumpPowerLabel.Size = UDim2.new(1, 0, 0, 15)
jumpPowerLabel.Position = UDim2.new(0, 0, 0, 0)
jumpPowerLabel.BackgroundTransparency = 1
jumpPowerLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
jumpPowerLabel.Text = "Jump Power: 50"
jumpPowerLabel.Font = Enum.Font.Gotham
jumpPowerLabel.TextSize = 11
jumpPowerLabel.TextXAlignment = Enum.TextXAlignment.Left
jumpPowerLabel.Parent = jumpPowerFrame

local jumpPowerSlider = Instance.new("Frame")
jumpPowerSlider.Size = UDim2.new(1, 0, 0, 15)
jumpPowerSlider.Position = UDim2.new(0, 0, 0, 20)
jumpPowerSlider.BackgroundColor3 = Color3.fromRGB(80, 80, 80)
jumpPowerSlider.Parent = jumpPowerFrame

local jumpPowerFill = Instance.new("Frame")
jumpPowerFill.Size = UDim2.new(0.4, 0, 1, 0)
jumpPowerFill.Position = UDim2.new(0, 0, 0, 0)
jumpPowerFill.BackgroundColor3 = Color3.fromRGB(0, 200, 100)
jumpPowerFill.Parent = jumpPowerSlider

local sliderCorner = Instance.new("UICorner")
sliderCorner.CornerRadius = UDim.new(0, 4)
sliderCorner.Parent = jumpPowerSlider

local fillCorner = Instance.new("UICorner")
fillCorner.CornerRadius = UDim.new(0, 4)
fillCorner.Parent = jumpPowerFill

-- Jump Research Variables
local currentJumpPower = 50
local character = player.Character or player.CharacterAdded:Wait()
local humanoid = character:WaitForChild("Humanoid")

-- Update Slider Display
local function updateSlider()
    jumpPowerLabel.Text = "Jump Power: " .. currentJumpPower
    local jumpFill = math.clamp((currentJumpPower - 50) / (200 - 50), 0, 1)
    jumpPowerFill.Size = UDim2.new(jumpFill, 0, 1, 0)
    humanoid.JumpPower = currentJumpPower
end

-- Slider Interaction
jumpPowerSlider.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        local connection
        connection = RunService.Heartbeat:Connect(function()
            local mouse = UserInputService:GetMouseLocation()
            local sliderAbsolutePos = jumpPowerSlider.AbsolutePosition
            local sliderAbsoluteSize = jumpPowerSlider.AbsoluteSize
            
            local relativeX = math.clamp((mouse.X - sliderAbsolutePos.X) / sliderAbsoluteSize.X, 0, 1)
            currentJumpPower = math.floor(50 + (relativeX * (200 - 50)))
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
    humanoid.JumpPower = currentJumpPower
end)

-- Initialize
updateSlider()

print("Educational Jump Research Loaded - For Private Server Study")