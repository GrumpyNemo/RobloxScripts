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
		SaveKey = true,
		Key = "obey"
	}
})
local HomeTab = getgenv().NemoHubWindow:CreateTab("Home", 4483362458)
local Paragraph = HomeTab:CreateParagraph({Title = "Credits to Developers", Content = "Nemo | Forking \nshlex | Designing & Programming \niRay | Programming"})
---
local ToolsTab = getgenv().NemoHubWindow:CreateTab("Tools", 10885640682)
local Button = ToolsTab:CreateButton({
   Name = "Run NemoYield [Fork of Infinite Yield]",
   Callback = function()
   loadstring(game:HttpGet('https://raw.githubusercontent.com/GrumpyNemo/NemoYield/main/source.lua'))()
   end,
})
---
if getgenv().LaunchGames then
    local pre = ("https://raw.githubusercontent.com/GrumpyNemo/RobloxScripts/main/Nemos%20Roblox%20Scripts/NemoHub/")
    local ext = ("-omen.lua")
    local construct = (pre..game.PlaceId..ext)
    wait()
    loadstring(game:HttpGet(tostring(construct)))()
end
