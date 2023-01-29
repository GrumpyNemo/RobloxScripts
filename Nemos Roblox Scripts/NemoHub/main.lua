local MatchGame = true
getgenv().Rayfield = loadstring(game:HttpGet('https://raw.githubusercontent.com/GrumpyNemo/RobloxScripts/main/libraries/CustomRayfieldUI.lua'))()
getgenv().NemoHubWindow = getgenv().Rayfield:CreateWindow({
	Name = "Project C0FF1N",
	LoadingTitle = "Loading: Project C0FF1N",
	LoadingSubtitle = '"Who are you?"',
	ConfigurationSaving = {
		Enabled = true,
		FolderName = "C0FF1N",
		FileName = "C0NF1G"
	},
	KeySystem = true,
	KeySettings = {
		Title = "Project C0FF1N | Script Hub",
		Subtitle = "Input Required",
		Note = "Please input the key you have recieved.",
		SaveKey = true,
		Key = "N3M0"
	}
})
local HomeTab = getgenv().NemoHubWindow:CreateTab("Home", 4483362458)
local Paragraph = HomeTab:CreateParagraph({Title = "Credits to Developers", Content = "Nemo | Forking \nshlex | Designing & Programming \niRay | Programming"})
---
local ToolsTab = getgenv().NemoHubWindow:CreateTab("Tools", 4483362458)
local Button = ToolsTab:CreateButton({
   Name = "Run NemoYield [Fork of Infinite Yield]",
   Callback = function()
   loadstring(game:HttpGet('https://raw.githubusercontent.com/GrumpyNemo/NemoYield/main/source.lua'))()
   end,
})
---
if MatchGame then
    local pre = ("https://raw.githubusercontent.com/GrumpyNemo/RobloxScripts/main/Nemos%20Roblox%20Scripts/NemoHub/")
    local ext = ("-omen.lua")
    local construct = (pre..game.PlaceId..ext)
    wait()
    loadstring(game:HttpGet(tostring(construct)))()
end
