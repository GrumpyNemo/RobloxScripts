local CreateBrokenLegGui = function(Location)
	local InputScript = Instance.new("LocalScript")
	InputScript.Name = "Input"

	local legbroken = Instance.new("ScreenGui")
	legbroken.Name = "legbroken"
	legbroken.Parent = InputScript
	legbroken.Enabled = false
	legbroken.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

	local legbroken_2 = Instance.new("TextLabel")
	legbroken_2.Name = "legbroken"
	legbroken_2.Parent = legbroken
	legbroken_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	legbroken_2.BackgroundTransparency = 1
	legbroken_2.Position = UDim2.new(0.5, -100, 0.699999988, 60)
	legbroken_2.Size = UDim2.new(0, 200, 0, 50)
	legbroken_2.Font = Enum.Font.ArialBold
	legbroken_2.Text = _G.DZLegBrokeText
	legbroken_2.TextColor3 = Color3.fromRGB(255, 255, 255)
	legbroken_2.TextSize = 18
	legbroken_2.TextStrokeTransparency = 0.5
end
local SpeedHack = function()
	local UserInputService = game:service("UserInputService")
	local ReplicatedStorage = game.ReplicatedStorage
	local RemoteFunctionsFolder = ReplicatedStorage:WaitForChild("RemoteFunctions")
	local BindableEventsFolder = ReplicatedStorage:WaitForChild("BindableEvents")
	while true do
		wait()
		if game.Players.LocalPlayer then
			break
		end
	end
	while true do
		wait()
		if game.Players.LocalPlayer.Character then
			break
		end
	end
	local Humanoid = game.Players.LocalPlayer.Character.Humanoid
	workspace.CurrentCamera.CameraSubject = Humanoid
	local Tick1 = tick()
	local PostureValue = 0
	local RemoteEventFolder = ReplicatedStorage:WaitForChild("RemoteEvents")
	local Tick2 = 0
	UserInputService.InputBegan:connect(function(input, gameProcessed)
		if not gameProcessed and input.UserInputType.Name == "Keyboard" and Humanoid.Health > 0 then
			local Name = input.KeyCode.Name
			if Name == "Space" then
				if tick() - Tick1 >= 0.8 then
					Humanoid.JumpPower = _G.DZPlayerJumpPower
					Humanoid.Jump = true
					Tick1 = tick()
					wait()
					Humanoid.JumpPower = _G.DZPlayerJumpPower
				else
					Humanoid.Jump = false
					Humanoid.JumpPower = _G.DZPlayerJumpPower
				end
			elseif Name == "X" then
				if PostureValue ~= 1 and not UserInputService:IsKeyDown("LeftShift") then
					PostureValue = 1
				else
					PostureValue = 0
				end
				RemoteEventFolder.ChangePosture:FireServer(PostureValue)
			elseif Name == "Z" then
				if PostureValue ~= 2 and not UserInputService:IsKeyDown("LeftShift") then
					PostureValue = 2
				else
					PostureValue = 0
				end
				RemoteEventFolder.ChangePosture:FireServer(PostureValue)
			end
			if tick() - Tick2 > 0.5 then
				if Name == "One" then
					Tick2 = tick()
					RemoteEventFolder.ShortcutEquip:FireServer(1)
					return
				end
				if Name == "Two" then
					Tick2 = tick()
					RemoteEventFolder.ShortcutEquip:FireServer(2)
					return
				end
				if Name == "Three" then
					Tick2 = tick()
					RemoteEventFolder.ShortcutEquip:FireServer(3)
					return
				end
				if Name == "Four" then
					Tick2 = tick()
					RemoteEventFolder.ShortcutEquip:FireServer(4)
				end
			end
		end
	end)
	local Frozen = false
	BindableEventsFolder.Freeze.Event:connect(function()
		Frozen = true
		wait(10)
		Frozen = false
	end)
	local BE = Instance.new("BindableEvent")
	BE.Event:connect(function()
		RemoteEventFolder.Reset:FireServer()
	end)
	game:GetService("StarterGui"):SetCore("ResetButtonCallback", BE)
	local LegBrokenValue = false
	RemoteEventFolder.LegBroken.OnClientEvent:connect(function(var)
		LegBrokenValue = var
		game.Players.LocalPlayer.PlayerGui:WaitForChild("Input").legbroken.Enabled = var
	end)
	game:service("RunService").Stepped:connect(function()
		if Humanoid.Health > 0 and not Frozen then
			if UserInputService:IsKeyDown("LeftShift") and not LegBrokenValue then
				if PostureValue == 0 then
					Humanoid.WalkSpeed = _G.DZPlayerSpeed
					return
				end
				if PostureValue == 1 then
					PostureValue = 0
					RemoteEventFolder.ChangePosture:FireServer(0)
					return
				end
				if PostureValue == 2 then
					PostureValue = 0
					RemoteEventFolder.ChangePosture:FireServer(0)
					return
				end
			elseif LegBrokenValue then
				if PostureValue == 0 then
					Humanoid.WalkSpeed = _G.DZPlayerSpeed
					return
				end
				if PostureValue == 1 then
					Humanoid.WalkSpeed = _G.DZPlayerSpeed
					return
				end
				if PostureValue == 2 then
					Humanoid.WalkSpeed = _G.DZPlayerSpeed
					return
				end
			else
				if PostureValue == 0 then
					Humanoid.WalkSpeed = _G.DZPlayerSpeed
					return
				end
				if PostureValue == 1 then
					Humanoid.WalkSpeed = _G.DZPlayerSpeed
					return
				end
				if PostureValue == 2 then
					Humanoid.WalkSpeed = _G.DZPlayerSpeed
					return
				end
			end
		else
			Humanoid.WalkSpeed = _G.DZPlayerSpeed
			if Humanoid.Health <= 0 and not Frozen then
				Humanoid.AutoRotate = false
			end
			Humanoid.JumpPower = _G.DZPlayerJumpPower
		end
	end)
end
--
local Player = game.Players.LocalPlayer
local PlayerGui = Player.PlayerGui

if PlayerGui:FindFirstChild("Input") then
	PlayerGui.Input:Destroy()

	spawn(function()CreateBrokenLegGui()end)
	spawn(function()SpeedHack()end)

else

	print("fail")

end
