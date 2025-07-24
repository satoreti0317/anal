local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

-- Lavaという名前のPartをすべて検索して削除
for _, obj in pairs(game:GetDescendants()) do
	if obj:IsA("BasePart") and obj.Name:lower() == "lava" then
		print("削除: " .. obj:GetFullName())
		obj:Destroy()
	end
end

-- "lava" を含む名前のPartを削除
for _, obj in pairs(workspace:GetDescendants()) do
	if obj:IsA("BasePart") and obj.Name:lower():find("lava") then
		obj:Destroy()
	end
end

-- 新しく追加される lava の Touch を無効化
workspace.DescendantAdded:Connect(function(desc)
	if desc:IsA("BasePart") and desc.Name:lower():find("lava") then
		wait()
		for _, conn in ipairs(getconnections(desc.Touched)) do
			conn:Disable()
		end
		desc.CanTouch = false
		desc.CanCollide = false
	end
end)

-- 既にある lava Part の Touch を無効化
for _, part in pairs(workspace:GetDescendants()) do
	if part:IsA("BasePart") and part.Name:lower():find("lava") then
		for _, conn in ipairs(getconnections(part.Touched)) do
			conn:Disable()
		end
		part.CanTouch = false
		part.CanCollide = false
	end
end

-- サーバースクリプト内のLava関連スクリプトを削除
for _, scr in pairs(game:GetDescendants()) do
	if (scr:IsA("Script") or scr:IsA("ModuleScript")) and scr:IsDescendantOf(game) then
		local src = scr.Source
		if src and src:lower():find("touched") and src:lower():find("lava") then
			warn("Lava処理スクリプト削除: " .. scr:GetFullName())
			scr:Destroy()
		end
	end
end
-- ローカルスクリプト

local player = game.Players.LocalPlayer

local teleportPosition = Vector3.new(2295.94, 15.22, 909.98) -- 新しいテレポート先の座標

-- UIを動的に作成
local mouse = player:GetMouse()
local playerGui = player:WaitForChild("PlayerGui")

-- ScreenGuiの作成
local screenGui = Instance.new("ScreenGui")
screenGui.Parent = playerGui

-- ボタンの作成
local teleportButton = Instance.new("TextButton")
teleportButton.Size = UDim2.new(0, 200, 0, 50)  -- ボタンのサイズ
teleportButton.Position = UDim2.new(0, 25, 0.5, -25)  -- ボタンを画面の左側かつ中央に配置
teleportButton.Text = "カフェ"  -- ボタンのテキスト
teleportButton.BackgroundColor3 = Color3.fromRGB(0, 255, 0)  -- ボタンの色（緑）
teleportButton.TextColor3 = Color3.fromRGB(255, 255, 255)  -- テキストの色（白）
teleportButton.Parent = screenGui  -- ボタンをScreenGuiに追加

-- ボタンがクリックされたときの処理
teleportButton.MouseButton1Click:Connect(function()
    local character = player.Character or player.CharacterAdded:Wait()  -- プレイヤーのキャラクター
    local humanoidRootPart = character:WaitForChild("HumanoidRootPart")  -- キャラクターの位置
    humanoidRootPart.CFrame = CFrame.new(teleportPosition)
end)

-- 次のテレポートボタンの作成
local targetPosition = Vector3.new(938.00, 252.39, 32888.00) -- 2番目のテレポート先の座標

local screenGui2 = Instance.new("ScreenGui")
screenGui2.Parent = playerGui

local teleportButton2 = Instance.new("TextButton")
teleportButton2.Size = UDim2.new(0, 200, 0, 50)
teleportButton2.Position = UDim2.new(1, -225, 0, 25)
teleportButton2.Text = "幽霊船ゴー"
teleportButton2.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
teleportButton2.TextColor3 = Color3.fromRGB(255, 255, 255)
teleportButton2.Parent = screenGui2

teleportButton2.MouseButton1Click:Connect(function()
    local character = player.Character or player.CharacterAdded:Wait()
    local humanoidRootPart = character:WaitForChild("HumanoidRootPart")
    humanoidRootPart.CFrame = CFrame.new(targetPosition)
end)
