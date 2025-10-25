-- Educational Noclip Research - Private Server Only
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")

local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

-- Create Noclip GUI
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "NoclipResearchGUI"
screenGui.Parent = playerGui

local mainFrame = Instance.new("Frame")
mainFrame.Size = UDim2.new(0, 200, 0, 80)
mainFrame.Position = UDim2.new(0, 10, 0, 100)
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
title.Text = "Collision Research"
title.Font = Enum.Font.GothamBold
title.TextSize = 12
title.Parent = mainFrame

local noclipButton = Instance.new("TextButton")
noclipButton.Size = UDim2.new(0.9, 0, 0, 40)
noclipButton.Position = UDim2.new(0.05, 0, 0.4, 0)
noclipButton.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
noclipButton.TextColor3 = Color3.fromRGB(255, 255, 255)
noclipButton.Text = "Noclip: OFF"
noclipButton.Font = Enum.Font.Gotham
noclipButton.TextSize = 12
noclipButton.Parent = mainFrame

local buttonCorner = Instance.new("UICorner")
buttonCorner.CornerRadius = UDim.new(0, 6)
buttonCorner.Parent = noclipButton

-- Noclip Research Variables
local noclip = false
local character = player.Character or player.CharacterAdded:Wait()

-- Noclip Research System
noclipButton.MouseButton1Click:Connect(function()
    noclip = not noclip
    noclipButton.Text = noclip and "Noclip: ON" or "Noclip: OFF"
    noclipButton.BackgroundColor3 = noclip and Color3.fromRGB(215, 0, 0) or Color3.fromRGB(60, 60, 60)
end)

-- Noclip Research Implementation
RunService.Stepped:Connect(function()
    if character then
        for _, part in pairs(character:GetDescendants()) do
            if part:IsA("BasePart") then
                part.CanCollide = not noclip
            end
        end
    end
end)

-- Handle Character Respawn
player.CharacterAdded:Connect(function(newCharacter)
    character = newCharacter
end)

print("Educational Noclip Research Loaded - For Private Server Study")