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

-- Window frame
local windowHeight = 130
local collapsedHeight = 40

local window = Instance.new("Frame")
window.Size = UDim2.new(0, 230, 0, windowHeight)
window.Position = UDim2.new(0.5, -115, 0.4, 0)
window.BackgroundColor3 = Color3.fromRGB(10, 10, 10)
window.BorderSizePixel = 0
window.Active = true
window.Draggable = true
window.Parent = screenGui

-- Top bar
local topBar = Instance.new("Frame")
topBar.Size = UDim2.new(1, 0, 0, 40)
topBar.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
topBar.BorderSizePixel = 0
topBar.Parent = window

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
title.Parent = topBar

-- Toggle button
local toggleButton = Instance.new("TextButton")
toggleButton.Size = UDim2.new(0, 40, 1, 0)
toggleButton.Position = UDim2.new(1, -40, 0, 0)
toggleButton.Text = "▲"
toggleButton.BackgroundTransparency = 1
toggleButton.TextColor3 = Color3.fromRGB(255, 255, 255)
toggleButton.Font = Enum.Font.SourceSansBold
toggleButton.TextSize = 24
toggleButton.Parent = topBar

-- Content
local contentFrame = Instance.new("Frame")
contentFrame.Size = UDim2.new(1, 0, 0, 90)
contentFrame.Position = UDim2.new(0, 0, 0, 40)
contentFrame.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
contentFrame.BorderSizePixel = 0
contentFrame.Parent = window

-- Cafe Button
local cafeButton = Instance.new("TextButton")
cafeButton.Size = UDim2.new(1, -20, 0, 35)
cafeButton.Position = UDim2.new(0, 10, 0, 5)
cafeButton.Text = "Cafe"
cafeButton.BackgroundColor3 = Color3.fromRGB(0, 120, 0)
cafeButton.TextColor3 = Color3.new(1, 1, 1)
cafeButton.Font = Enum.Font.SourceSans
cafeButton.TextSize = 18
cafeButton.Parent = contentFrame

-- Ghost Ship Button
local ghostButton = Instance.new("TextButton")
ghostButton.Size = UDim2.new(1, -20, 0, 35)
ghostButton.Position = UDim2.new(0, 10, 0, 50)
ghostButton.Text = "Ghost Ship"
ghostButton.BackgroundColor3 = Color3.fromRGB(150, 0, 0)
ghostButton.TextColor3 = Color3.new(1, 1, 1)
ghostButton.Font = Enum.Font.SourceSans
ghostButton.TextSize = 18
ghostButton.Parent = contentFrame

-- Teleport function
local function teleportTo(position)
	local character = player.Character or player.CharacterAdded:Wait()
	local rootPart = character:WaitForChild("HumanoidRootPart")
	rootPart.CFrame = CFrame.new(position)
end

-- Button actions
cafeButton.MouseButton1Click:Connect(function()
	teleportTo(teleportPositions.Cafe)
end)

ghostButton.MouseButton1Click:Connect(function()
	teleportTo(teleportPositions.GhostShip)
end)

-- Toggle visibility
local expanded = true
local function updateUI()
	if expanded then
		window.Size = UDim2.new(0, 230, 0, windowHeight)
		toggleButton.Text = "▲"
		contentFrame.Visible = true
	else
		window.Size = UDim2.new(0, 230, 0, collapsedHeight)
		toggleButton.Text = "▼"
		contentFrame.Visible = false
	end
end

toggleButton.MouseButton1Click:Connect(function()
	expanded = not expanded
	updateUI()
end)

updateUI()
