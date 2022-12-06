local CheckIfGui = function()
	if game.Players.LocalPlayer.PlayerGui:FindFirstChild("Nemo") then
		return true
	else
		return false
	end
end
if not CheckIfGui() then
	game:GetObjects("rbxassetid://7567340663")[1].Parent = game.Players.LocalPlayer.PlayerGui
	local gui = game.Players.LocalPlayer.PlayerGui:FindFirstChild("ScreenGui")
	gui.Name = "Nemo"
end
local ScreenGui = game.Players.LocalPlayer.PlayerGui:FindFirstChild("Nemo")

local ColorCodes = {
	White = {R = 255, G = 255, B = 255};
	Black = {R = 0, G = 0, B = 0};
	Grey = {R = 128, G = 128, B = 128};
	Red = {R = 255, G = 0, B = 0};
	Brown = {R = 77, G = 38, B = 0};
	Green = {R = 0,G = 255,B = 0};
	Blue = {R = 0, G = 0, B = 255}

}
local ColorNames = {
	"White",
	"Black",
	"Grey",
	"Red",
	"Brown",
	"Green",
	"Blue"
}
local Materials = {
	Plastic = {Name = "Plastic",BasePart = true,Terrain = false};
	Wood = {Name = "Wood",BasePart = true,Terrain = false};
	Slate = {Name = "Slate",BasePart = true,Terrain = true};
	Concrete = {Name = "Concrete",BasePart = true,Terrain = true};
	CorrodedMetal = {Name = "CorrodedMetal",BasePart = true,Terrain = false};
	DiamondPlate = {Name = "DiamondPlate",BasePart = true,Terrain = false};
	Foil = {Name = "Foil",BasePart = true, Terrain = false};
	Grass = {Name = "Grass",BasePart = true,Terrain = true};
	Ice = {Name = "Ice",BasePart = true,Terrain = true};
	Marble = {Name = "Marble",BasePart = true,Terrain = false};
	Granite = {Name = "Granite",BasePart = true,Terrain = true};
	Brick = {Name = "Brick",BasePart = true,Terrain = true};
	Pebble = {Name = "Pebble",BasePart = true,Terrain = true};
	Sand = {Name = "Sand",BasePart = true,Terrain = true};
	Fabric = {Name = "Fabric",BasePart = true,Terrain = false};
	SmoothPlastic = {Name = "SmoothPlastic",BasePart = true,Terrain = false};
	Metal = {Name = "Metal",BasePart = true,Terrain = false};
	WoodPlanks = {Name = "WoodPlanks",BasePart = true,Terrain = true};
	CobbleStone = {Name = "CobbleStone",BasePart = true,Terrain = true};
	Air = {Name = "Ait",BasePart = false,Terrain = true};
	Water = {Name = "Water",BasePart = false,Terrain = true};
	Rock = {Name = "Rocl",BasePart = false,Terrain = true};
	Glacier = {Name = "Glacier",BasePart = false,Terrain = true};
	Snow = {Name = "Snow",BasePart = false,Terrain = true};
	Sandstone = {Name = "Sandstone",BasePart = false,Terrain = true};
	Mud = {Name = "Mud",BasePart = false,Terrain = true};
	Basalt = {Name = "Basalt",BasePart = false,Terrain = true};
	Ground = {Name = "Ground",BasePart = false,Terrain = true};
	CrackedLava = {Name = "CrackedLava",BasePart = false,Terrain = true};
	Neon = {Name = "Neon",BasePart = true,Terrain = false};
	Glass = {Name = "Glass",BasePart = true,Terrain = false};
	Asphalt = {Name = "Asphalt",BasePart = false,Terrain = true};
	LeafyGrass = {Name = "LeafyGrass",BasePart = false,Terrain = true};
	Salt = {Name = "Salt",BasePart = false,Terrain = true};
	Limestone = {Name = "Limestone",BasePart = false,Terrain = true};
	Pavement = {Name = "Pavement",BasePart = false,Terrain = true};
	ForceField = {Name = "ForceField",BasePart = true,Terrain = false};
}
local MaterialNames = {
	"Plastic",
	"Wood",
	"Slate",
	"Concrete",
	"CorrodedMetal",
	"DiamondPlate",
	"Foil",
	"Grass",
	"Ice",
	"Marble",
	"Granite",
	"Brick",
	"Pebble",
	"Sand",
	"Fabric",
	"SmoothPlastic",
	"Metal",
	"WoodPlanks",
	"CobbleStone",
	"Neon",
	"Glass",
	"ForceField"
}
local BodyParts = {
	"DragonPrimary",
	"DragonSecondary",
	"DragonThird",
	"DragonClaws",
	"OceanPrimary",
	"OceanSecondary",
	"OceanThird",
	"ChubbyCheeks",
	"Fat",
	"EarFluff",
	"JawFluff",
	"ChestFluff",
	"LegFluff",
	"Eyebrow1",
	"Eyebrow2",
	"Secondary",
	"Jaw",
	"RightShoulder",
	"RightLowerLeg",
	"RightLowerArm",
	"RightLeg",
	"RightFootPaw",
	"LeftArm",
	"LeftArmPaw",
	"LeftCarpal",
	"LeftFootPaw",
	"LeftLeg",
	"LeftLowerArm",
	"LeftLowerLeg",
	"LeftShoulder",
	"RightArm",
	"RightArmPaw",
	"RightCarpal",
	"BackFluff",
	"TailFluff",
	"LeftWingStart",
	"LeftWing2",
	"LeftWing3",
	"RightWingStart",
	"RightWing2",
	"RightWing3",
	"EyeLid",
	"Torso",
	"Tail1",
	"Tail2",
	"Tail3",
	"Tail5",
	"Tail6",
	"RightThigh",
	"RightEar",
	"EyeLid",
	"Head",
	"Hip",
	"LeftEar",
	"LeftThigh",
	"Muzzle",
	"Neck",
	"NeckReal"
}
local Accessories = {
	"TorsoF",
	"HairF",
	"PierciingsF",
	"FeetF"
}

local CCMetaTable = {
	__index = function(table,index)
		return {
			R = 255;
			G = 255;
			B = 255;
		}
	end
}setmetatable(ColorCodes,CCMetaTable)
local MatMetaTable = {
	__index = function(table,index)
		return "Ice"
	end
}setmetatable(Materials,MatMetaTable)

local FindColor = function(colorName)
	local Red = ColorCodes[colorName].R
	local Green = ColorCodes[colorName].G
	local Blue = ColorCodes[colorName].B

	return Red,Green,Blue
end

local SetMaterial = function(Type,Material,Part)
	game:GetService("ReplicatedStorage").MasterKey:FireServer(Type, Materials[Material].Name, {[1]=Part})
end
local Setcolor = function(Part,Color,Type2)
	game:GetService("ReplicatedStorage").MasterKey:FireServer(Part, Color, Type2)
end

local DeterminationRemotation = function(PartName)
	if PartName ~= "TorsoF" or PartName ~= "HairF" or PartName ~= "PiercingsF" or PartName ~= "FeetF" then
		return "Advanced"
	end
end

for i,v in pairs(BodyParts) do
	local Button = ScreenGui.ASSETS.SelectionButton
	local BC = Button:Clone()
	BC.Name = v
	BC.Text = v
	BC.Parent = ScreenGui.UpperTab.Background.Parts
	BC.Visible = true
	BC.MouseButton1Down:Connect(function()
		ScreenGui.UpperTab.Background.Settings.Part.Value = v	
	end)
	wait()
end

for i,v in pairs(ColorNames) do
	local Button = ScreenGui.UpperTab.Parent.ASSETS.ColorButton
	local BC = Button:Clone()
	BC.BackgroundColor3 = Color3.fromRGB(FindColor(v))
	BC.Name = v
	BC.Text = " "
	BC.Parent = ScreenGui.UpperTab.Background.ColorFrame
	BC.Visible = true
	BC.MouseButton1Down:Connect(function()
		ScreenGui.UpperTab.Background.Settings.Color.Value = v	
		Setcolor(ScreenGui.UpperTab.Background.Settings.Part.Value,Color3.fromRGB(FindColor(v)),"Advanced")
	end)
	wait()
end
for i,v in pairs(MaterialNames) do
	local Button = ScreenGui.UpperTab.Parent.ASSETS.SelectionButton
	local BC = Button:Clone()
	BC.Name = v
	BC.Text = v
	BC.Parent = ScreenGui.UpperTab.Background.Materials
	BC.Visible = true
	BC.MouseButton1Down:Connect(function()
		ScreenGui.UpperTab.Background.Settings.Material.Value = v
		Setcolor(ScreenGui.UpperTab.Background.Settings.Part.Value,ScreenGui.UpperTab.Background.Settings.Color.Value,"Advanced")
		SetMaterial("Material",ScreenGui.UpperTab.Background.Settings.Material.Value,ScreenGui.UpperTab.Background.Settings.Part.Value)
	end)
	wait()
end


--
local UIS = game:GetService("UserInputService")
function dragify(Frame)
	local dragToggle = nil
	local dragSpeed = 0
	local dragInput = nil
	local dragStart = nil
	local dragPos = nil
	local startPos = nil

	local function updateInput(input)
		local Delta = input.Position - dragStart
		local Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + Delta.X, startPos.Y.Scale, startPos.Y.Offset + Delta.Y)
		game:GetService("TweenService"):Create(Frame, TweenInfo.new(0.25), {Position = Position}):Play()
	end
	Frame.InputBegan:Connect(function(input)
		if (input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch) and UIS:GetFocusedTextBox() == nil then
			dragToggle = true
			dragStart = input.Position
			startPos = Frame.Position
			input.Changed:Connect(function()
				if input.UserInputState == Enum.UserInputState.End then
					dragToggle = false
				end
			end)
		end
	end)
	Frame.InputChanged:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
			dragInput = input
		end
	end)
	game:GetService("UserInputService").InputChanged:Connect(function(input)
		if input == dragInput and dragToggle then
			updateInput(input)
		end
	end)
end
spawn(function()
	dragify(ScreenGui.UpperTab)	
end)
while wait() do
	local a = ScreenGui.UpperTab.Background
	a.Choices.Text = (a.Settings.Part.Value.." -> "..a.Settings.Color.Value.." -> "..a.Settings.Material.Value)
end
