--[[ Omen Tab Info ]]--

local TabTitle = ("template")
local TabImage = ("2716943887")
local ParagraphTitle = ("Grumpy Nemo's template")
local ParagraphContent = ("This is a Template")
local NotifTitle = ("[ template ]")
local NotifContent = ("Script already injected!")
local NotifImage = (11401835376)
local vers = "0.0"

--[[ Script ]]--

if not getgenv().TemplateTab then
	getgenv().TemplateTab = getgenv().NemoHubWindow:CreateTab(TabTitle.." | "..vers, TabImage)
	----------------------------------------------
    
    
    
	----------------------------------------------
	local Tab = getgenv().TemplateTabe
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
