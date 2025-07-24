local player = game.Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

local teleportPositions = {
    Cafe = Vector3.new(2295.94, 15.22, 909.98),
    GhostShip = Vector3.new(938.00, 252.39, 32888.00)
}

-- Create main ScreenGui
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "TeleportUI"
screenGui.ResetOnSpawn = false
screenGui.Parent = playerGui

-- Create draggable window frame
local window = Instance.new("Frame")
window.Size = UDim2.new(0, 230, 0, 40) -- Initially collapsed
window.Position = UDim2.new(0.5, -115, 0.3, 0)
window.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
window.BorderSizePixel = 0
window.Active = true
window.Draggable = true
window.Parent = screenGui

-- Title bar
local titleBar = Instance.new("TextLabel")
titleBar.Size = UDim2.new(1, -40, 0, 40)
titleBar.Position = UDim2.new(0, 0, 0, 0)
titleBar.BackgroundTransparency = 1
titleBar.Text = "Teleport Menu"
titleBar.TextColor3 = Color3.fromRGB(255, 255, 255)
titleBar.Font = Enum.Font.SourceSansBold
titleBar.TextSize = 18
titleBar.TextXAlignment = Enum.TextXAlignment.Left
titleBar.TextYAlignment = Enum.TextYAlignment.Center
titleBar.PaddingLeft = UDim.new(0, 10)
titleBar.Parent = window

-- Collapse/Expand button
local toggleButton = Instance.new("TextButton")
toggleButton.Size = UDim2.new(0, 40, 0, 40)
toggleButton.Position = UDim2.new(1, -40, 0, 0)
toggleButton.Text = "▼"
toggleButton.BackgroundTransparency = 1
toggleButton.TextColor3 = Color3.fromRGB(255, 255, 255)
toggleButton.Font = Enum.Font.SourceSansBold
toggleButton.TextSize = 24
toggleButton.Parent = window

-- Container for buttons
local contentFrame = Instance.new("Frame")
contentFrame.Size = UDim2.new(1, 0, 0, 90)
contentFrame.Position = UDim2.new(0, 0, 0, 40)
contentFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
contentFrame.Visible = false
contentFrame.Parent = window

-- Cafe Button
local cafeButton = Instance.new("TextButton")
cafeButton.Size = UDim2.new(1, -20, 0, 35)
cafeButton.Position = UDim2.new(0, 10, 0, 5)
cafeButton.Text = "Cafe"
cafeButton.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
cafeButton.TextColor3 = Color3.fromRGB(255, 255, 255)
cafeButton.Font = Enum.Font.SourceSans
cafeButton.TextSize = 18
cafeButton.Parent = contentFrame

-- Ghost Ship Button
local ghostButton = Instance.new("TextButton")
ghostButton.Size = UDim2.new(1, -20, 0, 35)
ghostButton.Position = UDim2.new(0, 10, 0, 50)
ghostButton.Text = "Ghost Ship"
ghostButton.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
ghostButton.TextColor3 = Color3.fromRGB(255, 255, 255)
ghostButton.Font = Enum.Font.SourceSans
ghostButton.TextSize = 18
ghostButton.Parent = contentFrame

-- Teleport Function
local function teleportTo(position)
	local character = player.Character or player.CharacterAdded:Wait()
	local rootPart = character:WaitForChild("HumanoidRootPart")
	rootPart.CFrame = CFrame.new(position)
end

-- Button Events
cafeButton.MouseButton1Click:Connect(function()
	teleportTo(teleportPositions.Cafe)
end)

ghostButton.MouseButton1Click:Connect(function()
	teleportTo(teleportPositions.GhostShip)
end)

-- Collapse / Expand toggle
local expanded = false
toggleButton.MouseButton1Click:Connect(function()
	expanded = not expanded
	contentFrame.Visible = expanded
	toggleButton.Text = expanded and "▲" or "▼"
	window.Size = expanded and UDim2.new(0, 230, 0, 130) or UDim2.new(0, 230, 0, 40)
end)

