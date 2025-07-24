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

-- Draggable container (includes title + content)
local container = Instance.new("Frame")
container.Size = UDim2.new(0, 230, 0, 130)
container.Position = UDim2.new(0.5, -115, 0.3, 0)
container.BackgroundColor3 = Color3.fromRGB(10, 10, 10)
container.BorderSizePixel = 0
container.Active = true
container.Draggable = true
container.Parent = screenGui

-- Top bar (Title + Toggle)
local topBar = Instance.new("Frame")
topBar.Size = UDim2.new(1, 0, 0, 40)
topBar.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
topBar.BorderSizePixel = 0
topBar.Parent = container

-- Title Text
local titleLabel = Instance.new("TextLabel")
titleLabel.Size = UDim2.new(1, -40, 1, 0)
titleLabel.Position = UDim2.new(0, 0, 0, 0)
titleLabel.BackgroundTransparency = 1
titleLabel.Text = "Teleport Menu"
titleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
titleLabel.Font = Enum.Font.SourceSansBold
titleLabel.TextSize = 18
titleLabel.TextXAlignment = Enum.TextXAlignment.Left
titleLabel.PaddingLeft = UDim.new(0, 10)
titleLabel.Parent = topBar

-- Toggle Button
local toggleButton = Instance.new("TextButton")
toggleButton.Size = UDim2.new(0, 40, 1, 0)
toggleButton.Position = UDim2.new(1, -40, 0, 0)
toggleButton.Text = "▲"
toggleButton.BackgroundTransparency = 1
toggleButton.TextColor3 = Color3.fromRGB(255, 255, 255)
toggleButton.Font = Enum.Font.SourceSansBold
toggleButton.TextSize = 24
toggleButton.Parent = topBar

-- Content area
local contentFrame = Instance.new("Frame")
contentFrame.Size = UDim2.new(1, 0, 0, 90)
contentFrame.Position = UDim2.new(0, 0, 0, 40)
contentFrame.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
contentFrame.BorderSizePixel = 0
contentFrame.Parent = container

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

-- Button logic
cafeButton.MouseButton1Click:Connect(function()
	teleportTo(teleportPositions.Cafe)
end)

ghostButton.MouseButton1Click:Connect(function()
	teleportTo(teleportPositions.GhostShip)
end)

-- Toggle show/hide
local expanded = true
local function updateUI()
	if expanded then
		container.Size = UDim2.new(0, 230, 0, 130)
		toggleButton.Text = "▲"
	else
		container.Size = UDim2.new(0, 230, 0, 40)
		toggleButton.Text = "▼"
	end
	contentFrame.Visible = expanded
end

toggleButton.MouseButton1Click:Connect(function()
	expanded = not expanded
	updateUI()
end)

-- Initial state
updateUI()
