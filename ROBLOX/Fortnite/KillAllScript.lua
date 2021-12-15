--Game Link https://www.roblox.com/games/6960145809/Fortnite
local KillPlayer = function(plrName)
    local Player = game.Players:FindFirstChild(plrName)
    local Weapon = game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool")
    local args = {[1] = Weapon,[2] = {["p"] = Vector3.new(0, 0, 0),["pid"] = 1,["part"] = Player.Character.Head,["d"] = 7,["maxDist"] = 0,["h"] = Player.Character.Humanoid,["m"] = Enum.Material.Plastic,["sid"] = 6,["t"] = 0,["n"] = Vector3.new(0, 0, 0)}}
    local Counter = 0
while Counter <= 5 do
    game:GetService("ReplicatedStorage").WeaponsSystem.Network.WeaponHit:FireServer(unpack(args))
    Counter = Counter+1
    
end

end
local KillAll = function()
    local Players = game.Players:GetPlayers()
    for i,AllPlayers in pairs(Players) do
        if AllPlayers.Name ~= game.Players.LocalPlayer.Name then
            KillPlayer(AllPlayers.Name)
        end
    end
end
KillAll()
