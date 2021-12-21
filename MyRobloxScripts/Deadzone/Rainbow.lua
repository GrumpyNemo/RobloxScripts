while true do
	--SKIN-COLOR
	local args = {
		[1] = 2,
		[2] = math.random(1,10)
	}

	game:GetService("ReplicatedStorage").RemoteEvents.Style:FireServer(unpack(args))
	--SKIN-COLOR
	local args = {
		[1] = 1,
		[2] = math.random(1,10)
	}

	game:GetService("ReplicatedStorage").RemoteEvents.Style:FireServer(unpack(args))
	--HAIR-COLOR
	local args = {
		[1] = 0,
		[2] = math.random(1,10)
	}

	game:GetService("ReplicatedStorage").RemoteEvents.Style:FireServer(unpack(args))
	--HAIR-TYPE
	local args = {
		[1] = 3,
		[2] = math.random(1,10)
	}

	game:GetService("ReplicatedStorage").RemoteEvents.Style:FireServer(unpack(args))
	wait(.1)
end
