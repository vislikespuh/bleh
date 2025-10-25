-- Educational Flight Research - Private Server Only
local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")

local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

-- Create Flight GUI
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "FlightResearchGUI"
screenGui.Parent = playerGui

local mainFrame = Instance.new("Frame")
mainFrame.Size = UDim2.new(0, 200, 0, 80)
mainFrame.Position = UDim2.new(0, 10, 0, 10)
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
title.Text = "Flight Research"
title.Font = Enum.Font.GothamBold
title.TextSize = 12
title.Parent = mainFrame

local flightButton = Instance.new("TextButton")
flightButton.Size = UDim2.new(0.9, 0, 0, 40)
flightButton.Position = UDim2.new(0.05, 0, 0.4, 0)
flightButton.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
flightButton.TextColor3 = Color3.fromRGB(255, 255, 255)
flightButton.Text = "Flight: OFF"
flightButton.Font = Enum.Font.Gotham
flightButton.TextSize = 12
flightButton.Parent = mainFrame

local buttonCorner = Instance.new("UICorner")
buttonCorner.CornerRadius = UDim.new(0, 6)
buttonCorner.Parent = flightButton

-- Flight Research Variables
local flying = false
local character = player.Character or player.CharacterAdded:Wait()
local humanoid = character:WaitForChild("Humanoid")

-- Flight Research System
flightButton.MouseButton1Click:Connect(function()
    flying = not flying
    flightButton.Text = flying and "Flight: ON" or "Flight: OFF"
    flightButton.BackgroundColor3 = flying and Color3.fromRGB(0, 120, 215) or Color3.fromRGB(60, 60, 60)
end)

-- Flight Research Implementation
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

-- Handle Character Respawn
player.CharacterAdded:Connect(function(newCharacter)
    character = newCharacter
    humanoid = character:WaitForChild("Humanoid")
end)

print("Educational Flight Research Loaded - For Private Server Study")