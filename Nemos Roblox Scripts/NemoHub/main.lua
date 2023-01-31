if getgenv().omen_advrefresh then
	getgenv().DeadzoneTab = nil
	getgenv().WolvesLife3Tab = nil
	getgenv().MnSTab = nil
end
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
getgenv().OmenPrint2Console = function(type,text)
	local typesimplf = string.lower(type)
	if type == "warn" then
	warn('[W4RN] 0M3N - "'..tostring(text)..'"')
	else if type == "error" then
	error('[3RR0R] 0M3N - "'..tostring(text)..'"')
	else
	print('[PR1NT] 0M3N - "'..tostring(text)..'"')
	end
end
local HomeTab = getgenv().NemoHubWindow:CreateTab("Home", 4483362458)
local Paragraph = HomeTab:CreateParagraph({Title = "Credits to Developers", Content = "Nemo | Using UI Library \nshlex & iRay | Making Rayfield UI"})
spawn(function()
	while true do
		if game:GetService("UserInputService").MouseIconEnabled == false then
		local MouseIconToggle = HomeTab:CreateToggle({
		Name = "Mouse Visibility",
		CurrentValue = false,
		Flag = "MouseIconToggle", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
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
local ESPToggle = ToolsTab:CreateToggle({
Name = "Nemo's Universal ESP",
CurrentValue = false,
Flag = "UniversalEspToggle", 
Callback = function(Value)
    
spawn(function()
        
    while getgenv().MnSESP do
        
        for i,v in pairs(game.Players:GetPlayers()) do
            
            if v ~= game.Players.LocalPlayer then
                
                HighlightPlayer(v)
                
            end
            
        end
        
    wait()
        
    end
        
end)

if not getgenv().MnSESP then
    
    getgenv().MnSESP = true
    
    else
    
    getgenv().MnSESP = Value
    spawn(function()
        
    for i,v in pairs(game.CoreGui:GetChildren()) do
        if v.ClassName == "Highlight" then
            if Value ~= "true" then
                v:Destroy()
            end
        end
    end
    
    end)
    
end

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
if getgenv().printcreds then
getgenv().OmenPrint2Console("warn","Hi, I'm Nemo. I used the Rayfield UI Library and made scripts for it, so Omen. My GUI.")
getgenv().OmenPrint2Console("error","V")
getgenv().OmenPrint2Console("error","V")
getgenv().OmenPrint2Console("error","V")
getgenv().OmenPrint2Console("error","V")
getgenv().OmenPrint2Console("error","V")
getgenv().OmenPrint2Console("error","V")
getgenv().OmenPrint2Console("error","V")
getgenv().OmenPrint2Console("error","V")
getgenv().OmenPrint2Console("print","PS.")
getgenv().OmenPrint2Console("print","Thank you for using my script.")
end
