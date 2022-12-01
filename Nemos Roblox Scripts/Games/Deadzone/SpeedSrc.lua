local SpeedSrc = {}
SpeedSrc.SpeedHack = function()
	-- Decompiled with the Synapse X Luau decompiler.
	local UserInputService = game:service("UserInputService")
	local ReplicatedStorage = game.ReplicatedStorage
	local RemoteFunctions = ReplicatedStorage:WaitForChild("RemoteFunctions")
	local BindableEvents = ReplicatedStorage:WaitForChild("BindableEvents")

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
	local RemoteEvents = ReplicatedStorage:WaitForChild("RemoteEvents")
	local Tick2 = 0

	UserInputService.InputBegan:connect(function(input, gameProcessed)
		if not gameProcessed and input.UserInputType.Name == "Keyboard" and Humanoid.Health > 0 then
			local KeyCodeName = input.KeyCode.Name
			if KeyCodeName == "Space" then
				if tick() - Tick1 >= 0.8 then
					Humanoid.JumpPower = 26
					Humanoid.Jump = true
					Tick1 = tick()
					wait()
					Humanoid.JumpPower = 0
				else
					Humanoid.Jump = false
					Humanoid.JumpPower = 0
				end

			elseif KeyCodeName == "X" then
				if PostureValue ~= 1 and not UserInputService:IsKeyDown("LeftShift") then
					PostureValue = 1
				else
					PostureValue = 0
				end
				RemoteEvents.ChangePosture:FireServer(PostureValue)

			elseif KeyCodeName == "Z" then
				if PostureValue ~= 2 and not UserInputService:IsKeyDown("LeftShift") then
					PostureValue = 2
				else
					PostureValue = 0
				end
				RemoteEvents.ChangePosture:FireServer(PostureValue)
			end

			if tick() - Tick2 > 0.5 then
				if KeyCodeName == "One" then
					Tick2 = tick()
					RemoteEvents.ShortcutEquip:FireServer(1)
					return
				end
				if KeyCodeName == "Two" then
					Tick2 = tick()
					RemoteEvents.ShortcutEquip:FireServer(2)
					return
				end
				if KeyCodeName == "Three" then
					Tick2 = tick()
					RemoteEvents.ShortcutEquip:FireServer(3)
					return
				end
				if KeyCodeName == "Four" then
					Tick2 = tick()
					RemoteEvents.ShortcutEquip:FireServer(4)
				end
			end

		end
	end)
	local PlayerIsFrozen = false
	BindableEvents.Freeze.Event:connect(function()
	    if getgenv().PlayerFreezable then
		    PlayerIsFrozen = true
		    wait(getgenv().PlayerFreezableTime or 10)
		    PlayerIsFrozen = false
		end
	end)
	local BindableEvent = Instance.new("BindableEvent")
	BindableEvent.Event:connect(function()
		RemoteEvents.Reset:FireServer()
	end)
	game:GetService("StarterGui"):SetCore("ResetButtonCallback", BindableEvent)
	local LegBroken = false
	RemoteEvents.LegBroken.OnClientEvent:connect(function(var)
	    if getgenv().LegBreakable then
	        LegBroken = var
	        script:WaitForChild("legbroken").Enabled = var
	    end
	end)
	game:service("RunService").Stepped:connect(function()
		if not PlayerIsFrozen then
			if UserInputService:IsKeyDown("LeftShift") --[[and not LegBroken]] then
				if PostureValue == 0 then
					Humanoid.WalkSpeed = getgenv().WalkSpeed
					return
				end
				if PostureValue == 1 then
					PostureValue = 0
					RemoteEvents.ChangePosture:FireServer(0)
					return
				end
				if PostureValue == 2 then
					PostureValue = 0
					RemoteEvents.ChangePosture:FireServer(0)
					return
				end
			elseif LegBroken then
				if PostureValue == 0 then
					Humanoid.WalkSpeed = getgenv().WalkSpeed
					return
				end
				if PostureValue == 1 then
					Humanoid.WalkSpeed = getgenv().WalkSpeed
					return
				end
				if PostureValue == 2 then
					Humanoid.WalkSpeed = getgenv().WalkSpeed
					return
				end
			else
				if PostureValue == 0 then
					Humanoid.WalkSpeed = getgenv().WalkSpeed
					return
				end
				if PostureValue == 1 then
					Humanoid.WalkSpeed = getgenv().WalkSpeed
					return
				end
				if PostureValue == 2 then
					Humanoid.WalkSpeed = getgenv().WalkSpeed
					return
				end
			end
		else
			Humanoid.WalkSpeed = getgenv().WalkSpeed
			if Humanoid.Health <= 0 and not PlayerIsFrozen then
				Humanoid.AutoRotate = true
			end
			Humanoid.JumpPower = getgenv().JumpPower
		end
	end)
end
return SpeedSrc
