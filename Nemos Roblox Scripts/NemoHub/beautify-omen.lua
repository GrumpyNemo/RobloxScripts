--[[ Omen Tab Info ]]--

local TabTitle = ("0M3N-Beautify")
local TabImage = ("6578308123")
local ParagraphTitle = ("Grumpy Nemo's Game Beautificationer 3001!!!")
local ParagraphContent = ('This is a "For funsies!" script more than an official omen plugin.')
local NotifTitle = ("[ Game Beautifier ]")
local NotifContent = ("Plugin already injected!")
local NotifImage = (6793572208)
local vers = "0.420"

--[[ Script ]]--

if not getgenv().BeautifyTab then getgenv().BeautifyTab = getgenv().NemoHubWindow:CreateTab(TabTitle.." | "..vers, TabImage)

local Tab = getgenv().BeautifyTab
local Paragraph = Tab:CreateParagraph({Title = ParagraphTitle, Content = ParagraphContent})
	
----------------------------------------------
--Presets:
--Depth of Field
getgenv().DoF = true
getgenv().DoFFarIntensity = 0
getgenv().DoFFocusDistance = 0
getgenv().DoFInFocusRadius = 0
getgenv().DoFNearIntensity = 0
--Sun Rays
getgenv().SR = true
getgenv().SRIntensity = 0
getgenv().SRSpread = 0
--Bloom
getgenv().BM = true
getgenv().BMIntensity = 0
getgenv().BMSize = 0
getgenv().BMThreshold = 0
----------------------------------------------



----------------------------------------------
local OverallToggle = Tab:CreateToggle({
	Name = "Beautifier",
	CurrentValue = false,
	Flag = "OverallBeautifier", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
	Callback = function(Value)
		getgenv().Beautifier = Value
	end,
})
local SRToggle = Tab:CreateToggle({
	Name = "Sun Rays",
	CurrentValue = getgenv().SR,
	Flag = "SRToggle", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
	Callback = function(Value)
		getgenv().SR = Value
	end,
})
local SRISlider = Tab:CreateSlider({
	Name = "SunRays",
	Range = {0.000, 1},
	Increment = 0.05,
	Suffix = "flesh burning rays",
	CurrentValue = getgenv().SRIntensity,
	Flag = "SunRaySlider", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
	Callback = function(Value)
        getgenv().SRIntensity = Value
	end,
})
local SRSlider = Tab:CreateSlider({
	Name = "SunRays",
	Range = {0.000, 1},
	Increment = 0.05,
	Suffix = "flesh burning rays",
	CurrentValue = getgenv().SRSpread,
	Flag = "SunRaySlider", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
	Callback = function(Value)
        getgenv().SRSpread = Value
	end,
})
----------------------------------------------
else
	getgenv().Rayfield:Notify({
		Title = NotifTitle,
		Content = NotifContent,
		Duration = 6.5,
		Image = NotifImage
	})
end

--[[ End of Script ]]--
