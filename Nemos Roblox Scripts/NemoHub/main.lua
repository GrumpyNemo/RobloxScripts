getgenv().Rayfield = loadstring(game:HttpGet('https://raw.githubusercontent.com/GrumpyNemo/RobloxScripts/main/libraries/CustomRayfieldUI.lua'))()
getgenv().NemoHubWindow = getgenv().Rayfield:CreateWindow({
	Name = "0M3N | GUI",
	LoadingTitle = "Loading: 0M3N'S RES0URCES & M0DULES.",
	LoadingSubtitle = '"Who are you?"',
	ConfigurationSaving = {
		Enabled = true,
		FolderName = "0M3N",
		FileName = "C0NF1G"
	},
	KeySystem = true,
	KeySettings = {
		Title = "Project 0M3N | Key Identifier",
		Subtitle = "Input Required",
		Note = "Please input the 0M3N key you have recieved.",
		FileName = "0M3N_Key",
		SaveKey = true,
		GrabKeyFromSite = false,
		Key = loadstring(game:HttpGet('https://raw.githubusercontent.com/GrumpyNemo/RobloxScripts/main/Nemos%20Roblox%20Scripts/NemoHub/thisisnothere.lua'))()
	}
})
---
getgenv().OmenPrint2Console = function(type,text)
	local typesimplf = string.lower(type)
	if type == "warn" then
		warn('[W4RN] 0M3N - "'..tostring(text)..'"')
	else if type == "blue" then
			game:GetService('TestService'):Message('[C0NSOLE] 0M3N - "'..tostring(text)..'"')
		else
			print('[PR1NT] 0M3N - "'..tostring(text)..'"')
		end
	end
end
local function getchildrenofclass(a, b)
	local c = {}
	for i, v in ipairs(a:GetChildren()) do
		if v.ClassName == b then
			table.insert(c, v)
		end
	end
	return c
end
local highlightLib = loadstring(game:HttpGet('https://raw.githubusercontent.com/GrumpyNemo/RobloxScripts/main/libraries/Highlighter.lua'))()
local function HighlightPlayer(TBH,color)
	if TBH.ClassName == "Player" then
		TBHChar = TBH.Character
		if not color then
			if TBH.TeamColor.Color then
				Color = TBH.TeamColor.Color
			else
				Color = Color3.fromRGB(255,255,255)
			end
		end

		highlightLib.highlightModel(TBHChar,Color)

	end
end
getgenv().ESPInterval = .2
---
local HomeTab = getgenv().NemoHubWindow:CreateTab("Home", 4483362458)
local Paragraph = HomeTab:CreateParagraph({Title = "Credits to Developers", Content = "Nemo | Using UI Library \nshlex & iRay | Making Rayfield UI"})
spawn(function()
	while true do
		if game:GetService("UserInputService").MouseIconEnabled == false then
			local MouseIconToggle = HomeTab:CreateToggle({
				Name = "Mouse Visibility",
				CurrentValue = false,
				Flag = "MouseIconToggle",
				Callback = function(Value)
					--
					if not getgenv().MouseIconToggle then
						getgenv().MouseIconToggle = true
						spawn(function()
							while getgenv().MouseIconToggle do
								game:GetService("UserInputService").MouseIconEnabled = getgenv().MouseIconToggle
								wait()
							end
						end)
					else
						getgenv().MouseIconToggle = Value
						game:GetService("UserInputService").MouseIconEnabled = Value
					end
					--
				end,
			})
			break
		end
		wait(15)
	end
end)
---
local ToolsTab = getgenv().NemoHubWindow:CreateTab("Tools", 10885640682)
local Section = ToolsTab:CreateSection('Resources I use to "enchance my exploiting."')
local Button = ToolsTab:CreateButton({
	Name = "NemoYield [Fork of Infinite Yield]",
	Callback = function()
		loadstring(game:HttpGet('https://raw.githubusercontent.com/GrumpyNemo/NemoYield/main/source.lua'))()
	end,
})
local Button = ToolsTab:CreateButton({
	Name = "Hydroxide",
	Callback = function()
		local owner = "Upbolt"
		local branch = "revision"

		local function webImport(file)
			return loadstring(game:HttpGetAsync(("https://raw.githubusercontent.com/%s/Hydroxide/%s/%s.lua"):format(owner, branch, file)), file .. '.lua')()
		end

		webImport("init")
		webImport("ui/main")
	end,
})
local Section = ToolsTab:CreateSection("Universal Scripts")
local UniversalSAim = ToolsTab:CreateButton({
	Name = "Universal (tweaks needed) Silent-Aim By Averiias",
	Callback = function()
		loadstring(game:HttpGet('https://raw.githubusercontent.com/Averiias/Universal-SilentAim/main/main.lua'))()
	end,
})
if not getgenv().SecureMode then
local UniESPSlider = ToolsTab:CreateSlider({
	Name = "Nemo's Uni-ESP Interval",
	Range = {0, 10},
	Increment = .1,
	Suffix = "seconds",
	CurrentValue = getgenv().ESPInterval,
	Flag = "UniEspSlider",
	Callback = function(Value)
		getgenv().ESPInterval = Value
	end,
})
local UniESPToggle = ToolsTab:CreateToggle({
	Name = "Nemo's Uni-ESP",
	CurrentValue = false,
	Flag = "UniEspToggle", 
	Callback = function(Value)
		getgenv().UniversalESP = true

		spawn(function()

			while getgenv().ESPInterval+.01 do

				for a,P in pairs(game.Players:GetPlayers()) do

					if not table.find(getchildrenofclass(game.CoreGui,"Highlight"),P.Name) and P.Character and P ~= game.Players.LocalPlayer and getgenv().UniversalESP then

						HighlightPlayer(P)

					end

					wait()

				end

			end
			while getgenv().UniversalESP do

				local Players = game:GetService("Players"):GetPlayers()

				for _,P in pairs(Players) do

					if P.ClassName == "Player" and P.Character and P ~= game.Players.LocalPlayer and getgenv().UniversalESP then

						HighlightPlayer(P)

					end

					wait()

				end

				wait(getgenv().ESPInterval)

			end

		end)
		if not getgenv().UniversalESP then

			getgenv().UniversalESP = true
			local Players = game:GetService("Players"):GetPlayers()

			for _,P in pairs(Players) do

				if P.ClassName == "Player" and P.Character and P ~= game.Players.LocalPlayer then

					HighlightPlayer(P)

				end

			end

		else

			getgenv().UniversalESP = Value
			wait()
			spawn(function()

				for i,v in pairs(game.CoreGui:GetChildren()) do
					if v.ClassName == "Highlight" then
						if Value ~= "true" and not getgenv().UniversalESP then
							v:Destroy()
						end
					end
				end

			end)

		end
	end,
})
end
local Section = ToolsTab:CreateSection("Other")
---
if getgenv().SecureMode then
	
	local PhraseGen = loadstring(game:HttpGet('https://raw.githubusercontent.com/GrumpyNemo/RobloxScripts/main/libraries/PhraseGen.lua'))()
	
	local Dictionary = {
		-- Origin: The starting point of every random text. Picks one of these phrases seperated by commas.
		origin = {"#phraseExclaim#", "#phraseDemand#"},
		-- Phrases that can be used
		phraseExclaim = "#verb.capitalize# our #productAdjective# #noun.s# #timeCommand#!",
		phraseDemand = "You #verbCommand# #noun.s# in your #emotionAdjective# life #timeCommand#!",

		-- General purpose words for any phrase. Used between all phrases. 
		productAdjective = {"hot & sexy", "brand-new", "redesigned", "upgraded", "chic-magnet", "modern", "hoe-stealer", "steroid free", "new-fangled"},
		emotionAdjective = {"sad", "miserable", "sorrow-filled", "empty"},
		verbCommand = {"need", "miss", "lack","crave","desire","want"},
		verb = {"taste", "fear", "adore", "eat", "buy", "consume", "steal"},
		noun = {"serverside", "prenup", "std", "tardis", "lightsaber", "gun","dildo","cryo-chamber","US Federal Currency Printer","death"},
		timeCommand = {"right now", " today", "this instant", "forever", "now","instantly","in a min","slowly in 2 minutes"}
	}
	
	local Gui = game.CoreGui:FindFirstChild("Rayfield")
	
	if Gui then
		spawn(function()
			while getgenv().SecureMode do
				Gui.Name = PhraseGen.GetPhrase(nil,Dictionary,true)
			wait(1.5)end
		end)
	end
end
if getgenv().LaunchGames then
	if getgenv().omen_advrefresh then
		getgenv().DeadzoneTab = nil
		getgenv().WolvesLife3Tab = nil
		getgenv().MnSTab = nil
	end
	local pre = ("https://raw.githubusercontent.com/GrumpyNemo/RobloxScripts/main/Nemos%20Roblox%20Scripts/NemoHub/")
	local ext = ("-omen.lua")
	local construct = (pre..game.PlaceId..ext)
	wait()
	pcall(function()loadstring(game:HttpGet(tostring(construct)))()end)
end
if getgenv().printcreds and not getgenv().SecureMode then
	getgenv().OmenPrint2Console("blue","Hi, I'm Nemo. I used the Rayfield UI Library and made scripts for it, so Omen. My GUI.")
	getgenv().OmenPrint2Console("warn","V")
	getgenv().OmenPrint2Console("warn","V")
	getgenv().OmenPrint2Console("warn","V")
	getgenv().OmenPrint2Console("warn","V")
	getgenv().OmenPrint2Console("warn","V")
	getgenv().OmenPrint2Console("warn","V")
	getgenv().OmenPrint2Console("warn","V")
	getgenv().OmenPrint2Console("warn","V")
	getgenv().OmenPrint2Console("print","PS.")
	getgenv().OmenPrint2Console("blue","Thank you for using my script.")
end
