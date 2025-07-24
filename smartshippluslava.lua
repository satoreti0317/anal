local player = game.Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

local teleportPositions = {
	Cafe = Vector3.new(2295.94, 15.22, 909.98),
	GhostShip = Vector3.new(938.00, 252.39, 32888.00)
}

-- Create main GUI
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "TeleportUI"
screenGui.ResetOnSpawn = false
screenGui.Parent = playerGui

-- Draggable black window
local window = Instance.new("Frame")
window.Size = UDim2.new(0, 230, 0, 40) -- Collapsed by default
window.Position = UDim2.new(0.5, -115, 0.3, 0)
window.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
window.BorderSizePixel = 0
window.Active = true
window.Draggable = true
window.Parent = screenGui

-- Title
local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, -40, 1, 0)
title.Position = UDim2.new(0, 0, 0, 0)
title.BackgroundTransparency = 1
title.Text = "Teleport Menu"
title.TextColor3 = Color3.fromRGB(255, 255, 255)
title.Font = Enum.Font.SourceSansBold
title.TextSize = 18
title.TextXAlignment = Enum.TextXAlignment.Left
title.TextYAlignment = Enum.TextYAlignment.Center
title.PaddingLeft = UDim.new(0, 10)
title.Parent = window

-- Collapse/Expand toggle button
local toggleButton = Instance.new("TextButton")
toggleButton.Size = UDim2.new(0, 40, 1, 0)
toggleButton.Position = UDim2.new(1, -40, 0, 0)
toggleButton.Text = "▼"
toggleButton.BackgroundTransparency = 1
toggleButton.TextColor3 = Color3.fromRGB(255, 255, 255)
toggleButton.Font = Enum.Font.SourceSansBold
toggleButton.TextSize = 24
toggleButton.Parent = window

-- Content frame (holds buttons)
local contentFrame = Instance.new("Frame")
contentFrame.Size = UDim2.new(1, 0, 0, 90)
contentFrame.Position = UDim2.new(0, 0, 1, 0)
contentFrame.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
contentFrame.Visible = false
contentFrame.Parent = window

-- Cafe button (dark green)
local cafeButton = Instance.new("TextButton")
cafeButton.Size = UDim2.new(1, -20, 0, 35)
cafeButton.Position = UDim2.new(0, 10, 0, 5)
cafeButton.Text = "Cafe"
cafeButton.BackgroundColor3 = Color3.fromRGB(0, 100, 0)
cafeButton.TextColor3 = Color3.fromRGB(255, 255, 255)
cafeButton.Font = Enum.Font.SourceSans
cafeButton.TextSize = 18
cafeButton.Parent = contentFrame

-- Ghost Ship button (dark red)
local ghostButton = Instance.new("TextButton")
ghostButton.Size = UDim2.new(1, -20, 0, 35)
ghostButton.Position = UDim2.new(0, 10, 0, 50)
ghostButton.Text = "Ghost Ship"
ghostButton.BackgroundColor3 = Color3.fromRGB(120, 0, 0)
ghostButton.TextColor3 = Color3.fromRGB(255, 255, 255)
ghostButton.Font = Enum.Font.SourceSans
ghostButton.TextSize = 18
ghostButton.Parent = contentFrame

-- Teleport function
local function teleportTo(position)
	local character = player.Character or player.CharacterAdded:Wait()
	local rootPart = character:WaitForChild("HumanoidRootPart")
	rootPart.CFrame = CFrame.new(position)
end

-- Button events
cafeButton.MouseButton1Click:Connect(function()
	teleportTo(teleportPositions.Cafe)
end)

ghostButton.MouseButton1Click:Connect(function()
	teleportTo(teleportPositions.GhostShip)
end)

-- Toggle button event
local expanded = false
toggleButton.MouseButton1Click:Connect(function()
	expanded = not expanded
	contentFrame.Visible = expanded
	toggleButton.Text = expanded and "▲" or "▼"
	window.Size = expanded and UDim2.new(0, 230, 0, 130) or UDim2.new(0, 230, 0, 40)
end)
