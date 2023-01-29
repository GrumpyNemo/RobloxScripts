local vers = "0.0"
if not getgenv().DeadzoneTab then
	getgenv().DeadzoneTab = getgenv().NemoHubWindow:CreateTab("Deadzone Classic".." | "..vers, "2716943887")
	----------------------------------------------
    
	----------------------------------------------
	local Tab = getgenv().DeadzoneTab
	local Paragraph = Tab:CreateParagraph({Title = "Grumpy Nemo's Wolve's Life 3 Script", Content = "Under Construction"})
	----------------------------------------------
else
	getgenv().Rayfield:Notify({
		Title = "[ Wolve's Life 3 ]",
		Content = "Script already injected!",
		Duration = 6.5,
		Image = 4483362458
	})
end
