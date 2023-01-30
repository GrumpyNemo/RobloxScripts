local vers = "0.0"
if not getgenv().TemplateTab then
	getgenv().TemplateTab = getgenv().NemoHubWindow:CreateTab("template".." | "..vers, "2716943887")
	----------------------------------------------
    
	----------------------------------------------
	local Tab = getgenv().TemplateTabe
	local Paragraph = Tab:CreateParagraph({Title = "Grumpy Nemo's template", Content = "This is a Template"})
	
	----------------------------------------------
else
	getgenv().Rayfield:Notify({
		Title = "[ template ]",
		Content = "Script already injected!",
		Duration = 6.5,
		Image = 11401835376
	})
end
