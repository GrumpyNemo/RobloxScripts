-- Script created by Grumpy Nemo#4815
-- Using "Request" instead of "Send" makes the game practically unplayable for yourself, to stop the script just add new script tab and put "getgenv().Enabled = false"
-- Leave WaitTime at 30 seconds, there's a cool down for the morph Send & Request and 30 seconds does fine.
local Players = game.Players:GetChildren()
local SendOrRequest = "Send" --"Request" or "Send"

getgenv().Enabled = true
getgenv().WaitTime = 30

while getgenv().Enabled do
    for _,v in pairs(Players) do
        PlayerName = v.Name
            if v.Name ~= game.Players.LocalPlayer.Name then
                game:GetService("ReplicatedStorage").RemoteEvents.ExchangeEvent:FireServer(SendOrRequest, PlayerName)
            end
        end
    wait(getgenv().WaitTime)
end
