--Settings;
--What you're probably wanting;
local Unlock_Everything = false --Unlocks every gamepass for free
--Enable certain in-game features;
local Unlock_VIW = false --Just puts the viw tag above the User's wolf
local Unlock_VIW_Music = false --allows the User to play music without VIW
local Unlock_VIW_Name_Color =  false --allows the User to change their name and description color without VIW
local Unlock_PlayerCustomization_Gamepasses = false
--Other Features;
local ViewPlayersPoints = false --allows the User to view other wolves/players "paw coins" (and uses math to caculate the hours they put in to collect it, Example: D:0 H:1 M:55 < They spent rounded up to 1 hour or 55 minutes of game time to get 550 or so points (I think the math is a bit off tho tbh)(the numbers r rounded up))
--Main Script  (don't mess with this unless you know what you're doing.)
--Locals or wtv
local LocalPlayer = game.Players.LocalPlayer
local PlayerGui = LocalPlayer.PlayerGui
local CoreGui = game.CoreGui
--Local Functions
local AddVIW = function()
	local Key = ("\230\139\154\230\136\172i\235\156\146(\238\138\155\201\172XD")
	game.ReplicatedStorage.MasterKey:FireServer("AddVIWTag", nil, Key)
end
local UnlockViwMusic = function()
	local Main = game.Players.LocalPlayer.PlayerGui:WaitForChild("Pc")
	Main.Radio:WaitForChild("VIWMusic").Visible = true
	Main.Radio:WaitForChild("BuyVIWMusic").Visible = false
end
local UnlockNameColor = function()
	local Main = game.Players.LocalPlayer.PlayerGui:WaitForChild("Pc")
	local NameS = Main["NameS"]
	local ColorScreen = Main["Colors"]

	local ColorsButton = NameS["Colors"]
	ColorsButton:FindFirstChildOfClass("LocalScript"):Destroy()
	ColorsButton.MouseButton1Click:connect(function()
		if ColorsButton.Text == "Name Color" then
			ColorScreen:TweenPosition(UDim2.new(0.3, 0, 0.75, 0), "InOut", "Quad", 1, true);
			ColorsButton.Text = "Close";
		else
			if ColorsButton.Text then
				ColorScreen:TweenPosition(UDim2.new(0.3, 0, 1.2, 0), "InOut", "Quad", 1, true);
				ColorsButton.Text = "Name Color";
			end
		end
	end)
end
local UnlockGamepasses = function()
	local Dir = game.Players.LocalPlayer.PlayerGui["MorphGUI"]
	local Gamepasses = Dir.Custom.Frame2.Gamepasses
	Dir.Custom.Accessories.Coloring.Material.Neon.Robux.Text = "N3M0 R$"
	if Gamepasses:FindFirstChild("LocalScript") then
		Gamepasses.LocalScript:Destroy()
	end

	local Des = Gamepasses:GetDescendants()
	for i,v in pairs(Des) do
		if v.ClassName == "ImageButton" then
			v.Parent.Robux.Text = "N3M0 R$"
			v.MouseButton1Down:Connect(function()
				local GamepassName = v.Parent.Name
				if v.SelectImg.Visible == true then
					v.SelectImg.Visible = not v.SelectImg.Visible
					game.ReplicatedStorage.MasterKey:FireServer(GamepassName, 1, "\230\139\154\230\136\172i\235\156\146(\238\138\155\201\172XD")
				else
					v.SelectImg.Visible = not v.SelectImg.Visible
					game.ReplicatedStorage.MasterKey:FireServer(GamepassName, 0, "\230\139\154\230\136\172i\235\156\146(\238\138\155\201\172XD")

				end
			end)
		end
	end
	Dir.Custom.Opener:Destroy()
	Dir.Custom:WaitForChild("Extra").MouseButton1Click:connect(function()
		local l__LocalPlayer__1 = game.Players.LocalPlayer;
		if Dir.Custom.Extra.Text == "Extra Colors"  then
			Dir.Custom.AdvaOpen.Text = "Advanced";
			Dir.Custom.Frame1.Normal.Visible = false;
			Dir.Custom.Frame1.Extra.Visible = true;
			Dir.Custom.Frame1.Advanced.Visible = false;
			Dir.Custom.Frame1.AdvancedExtra.Visible = false;
			Dir.Custom.Extra.Text = "Normal Colors";
			return;
		end;
		if Dir.Custom.Extra.Text ~= "Normal Colors" then
			local u1 = nil;
			u1 = game:GetService("MarketplaceService").PromptPurchaseFinished:connect(function(p1, p2, p3)
				if p1 == l__LocalPlayer__1 then
					u1:Disconnect();
					if p2 == 1344824646 and p3 then
						Dir.Custom.AdvaOpen.Text = "Advanced";
						Dir.Custom.Frame1.Normal.Visible = false;
						Dir.Custom.Frame1.Extra.Visible = true;
						Dir.Custom.Frame1.Advanced.Visible = false;
						Dir.Custom.Frame1.AdvancedExtra.Visible = false;
						Dir.Custom.Extra.Text = "Normal Colors";
					end;
				end
			end)
			return;
		end;
		Dir.Custom.AdvaOpen.Text = "Advanced";
		Dir.Custom.Frame1.Normal.Visible = true;
		Dir.Custom.Frame1.Extra.Visible = false;
		Dir.Custom.Frame1.Advanced.Visible = false;
		Dir.Custom.Frame1.AdvancedExtra.Visible = false;
		Dir.Custom.Extra.Text = "Extra Colors";
	end);
	Dir.Custom:WaitForChild("AdvaOpen").MouseButton1Click:connect(function()
		if Dir.Custom.AdvaOpen.Text == "Advanced" then
			if Dir.Custom.Frame1.Normal.Visible == true and Dir.Custom.Frame1.Extra.Visible == false then
				Dir.Custom.Frame1.Advanced.Visible = true;
				Dir.Custom.Frame1.Normal.Visible = false;
			elseif Dir.Custom.Frame1.Extra.Visible == true then
				Dir.Custom.Frame1.AdvancedExtra.Visible = true;
				Dir.Custom.Frame1.Extra.Visible = false;
			end;
			Dir.Custom.AdvaOpen.Text = "Normal";
			return;
		end;
		if Dir.Custom.Frame1.Normal.Visible == false and Dir.Custom.Frame1.AdvancedExtra.Visible == false then
			Dir.Custom.Frame1.Advanced.Visible = false;
			Dir.Custom.Frame1.Normal.Visible = true;
		elseif Dir.Custom.Frame1.Extra.Visible == false then
			Dir.Custom.Frame1.AdvancedExtra.Visible = false;
			Dir.Custom.Frame1.Extra.Visible = true;
		end;
		Dir.Custom.AdvaOpen.Text = "Advanced";
	end);
	Dir.Custom:WaitForChild("AccOpen").MouseButton1Click:connect(function()
		if Dir.Custom.AccOpen.Text == "Accessories" then
			Dir.Custom.Accessories:TweenPosition(UDim2.new(0, 0, 0, 0), "InOut", "Quad", 1, true);
			Dir.Custom.Frame1:TweenPosition(UDim2.new(0, 0, 1, 0), "InOut", "Quad", 1, true);
			Dir.Custom.Frame2:TweenPosition(UDim2.new(0.775, 0, 1, 0), "InOut", "Quad", 1, true);
			Dir.Custom.AccOpen.Text = "Coloring";
			return;
		end;
		Dir.Custom.Accessories:TweenPosition(UDim2.new(0, 0, -1, 0), "InOut", "Quad", 1, true);
		Dir.Custom.Frame1:TweenPosition(UDim2.new(0, 0, 0, 0), "InOut", "Quad", 1, true);
		Dir.Custom.Frame2:TweenPosition(UDim2.new(0.775, 0, 0, 0), "InOut", "Quad", 1, true);
		Dir.Custom.AccOpen.Text = "Accessories";
	end);
end
local VPP = function()
	local function RoundNumber(num)
		return(math.floor(num+0.5))
	end
	local Calc = function(a)
		local minutes = a/10
		local hours = minutes/60
		local days = hours/24

		return ("(!ESTIMATE!) D: "..RoundNumber(days).." H: "..RoundNumber(hours).." M: "..RoundNumber(minutes))
	end
	local LocalPlayer = game.Players.LocalPlayer;
	while true do
		wait();
		if LocalPlayer.PlayerGui.Pc.Enabled and LocalPlayer.Character then
			break;
		end;
	end;
	if LocalPlayer.PlayerGui.Pc:FindFirstChild("GameData") then
		LocalPlayer.PlayerGui.Pc.GameData:Destroy()
	end

	local LOCALMOUSE = LocalPlayer:GetMouse();
	local SELECTEDCHARACTER = nil;
	local MOUSEHOVER = LocalPlayer.PlayerGui.Pc:WaitForChild("MouseHover");
	LOCALMOUSE.Move:connect(function()
		if LocalPlayer.PlayerGui.Pc.Enabled and LOCALMOUSE.Target and (game.Players:GetPlayerFromCharacter(LOCALMOUSE.Target.Parent) and game.Players[LOCALMOUSE.Target.Parent.Name] ~= LocalPlayer) then
			SELECTEDCHARACTER = LOCALMOUSE.Target.Parent;
			if game.Players:GetPlayerFromCharacter(LOCALMOUSE.Target.Parent):GetRankInGroup(5618499) > 0 then
				MOUSEHOVER.TextColor3 = Color3.fromRGB(0, 255, 0)
			end
			MOUSEHOVER.Text = ("~| Username: '"..SELECTEDCHARACTER.Name.."' | DisplayName: '"..game.Players:GetPlayerFromCharacter(LOCALMOUSE.Target.Parent).DisplayName.."' | Gender: "..game.Players:GetPlayerFromCharacter(LOCALMOUSE.Target.Parent).GameData.Gender.Value.." | Coins: "..game.Players:GetPlayerFromCharacter(LOCALMOUSE.Target.Parent).Saving.Coins.Value.." | Time Wasted: "..Calc(game.Players:GetPlayerFromCharacter(LOCALMOUSE.Target.Parent).Saving.Coins.Value).." |~")

			MOUSEHOVER.Position = UDim2.new(0, LOCALMOUSE.X+30, 0, LOCALMOUSE.Y-20);
			MOUSEHOVER.Visible = true;
			return;
		end;
		SELECTEDCHARACTER = nil;
		MOUSEHOVER.TextColor3 = Color3.new(1, 1, 1);
		MOUSEHOVER.Visible = false;
		MOUSEHOVER.Text = "Player";
		MOUSEHOVER.Size = UDim2.new(0,250,0,50)
	end);
end

--Script
if Unlock_Everything then
	spawn(function()while wait(.5) do
		if PlayerGui:FindFirstChild("Loading") then else
			spawn(function()UnlockGamepasses()end)
			spawn(function()while wait(.5) do
				if PlayerGui:FindFirstChild("MorphGUI") then else
					spawn(function()AddVIW()end)
					spawn(function()UnlockViwMusic()end)
					spawn(function()UnlockNameColor()end)
					break;
				end
			end end)
			break;
		end
	end end)
end
if not Unlock_Everything then
    if Unlock_PlayerCustomization_Gamepasses then
			spawn(function() while wait(.5) do
			if PlayerGui:FindFirstChild("Loading") then else
				spawn(function()UnlockGamepasses()end)
				break;
			end
		end end)
	end
	if Unlock_VIW then
		spawn(function() while wait(.5) do
			if PlayerGui:FindFirstChild("MorphGUI") then else
				spawn(function()AddVIW()end)
			end
		end end)
	end
	if Unlock_VIW_Music then
		spawn(function() while wait(.5) do
			if PlayerGui:FindFirstChild("MorphGUI") then else
				spawn(function()UnlockViwMusic()end)
				break;
			end
		end end)
	end
	if Unlock_VIW_Name_Color then
		spawn(function() while wait(.5) do
			if PlayerGui:FindFirstChild("MorphGUI") then else
				spawn(function()UnlockNameColor()end)
				break;
			end
		end end)
	end
end
if ViewPlayersPoints then
	spawn(function() while wait(.5) do
		if PlayerGui:FindFirstChild("MorphGUI") then else
			spawn(function()VPP()end)
			break;
		end
	end end)
end
