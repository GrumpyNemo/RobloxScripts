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
local Paragraph = HomeTab:CreateParagraph({Title = "Credits to Developers", Content = "Nemo | Using UI Library \nshlex & iRay | Making Rayfield UI"})
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
local Section = ToolsTab:CreateSection("Other")
---
if getgenv().LaunchGames then
    local pre = ("https://raw.githubusercontent.com/GrumpyNemo/RobloxScripts/main/Nemos%20Roblox%20Scripts/NemoHub/")
    local ext = ("-omen.lua")
    local construct = (pre..game.PlaceId..ext)
    wait()
    loadstring(game:HttpGet(tostring(construct)))()
end
