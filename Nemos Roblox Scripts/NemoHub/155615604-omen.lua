local vers = "0.0"
getgenv().PrisonLifeTab = nil
if not getgenv().PrisonLifeTab then
	getgenv().PrisonLifeTab = getgenv().NemoHubWindow:CreateTab("Prison Life".." | "..vers, "4833010476")
	----------------------------------------------
    
	----------------------------------------------
	local Tab = getgenv().PrisonLifeTab
	local Paragraph = Tab:CreateParagraph({Title = "Grumpy Nemo's Prison Life Script", Content = "This is all my scripts for Prison Life"})
local FadeGuiRemoveButton = Tab:CreateButton({
   Name = "Delete fadeFrame (dark transparent black gui that gets stuck)",
   Flag = "FadeGuiButton",
   Callback = function(Value)
        game.Players.LocalPlayer.PlayerGui.Home.fadeFrame:Destroy()
   end,
})
	----------------------------------------------
else
	getgenv().Rayfield:Notify({
		Title = "[ template ]",
		Content = "Script already injected!",
		Duration = 6.5,
		Image = 11401835376
	})
end
