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

if not getgenv().BeautifyTab then
	getgenv().BeautifyTab = getgenv().NemoHubWindow:CreateTab(TabTitle.." | "..vers, TabImage)
	----------------------------------------------
    
    
    
	----------------------------------------------
	local Tab = getgenv().BeautifyTab
	local Paragraph = Tab:CreateParagraph({Title = ParagraphTitle, Content = ParagraphContent})
	----------------------------------------------
	
	
	
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
