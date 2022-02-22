local HeadOrBody = "body"
local UpdateInterval = 2.5
local Sizing = 14
getgenv().Enabled = true
function TeamCheck(Player)

end
function FetchTeamColor(Player)
    return ("wtv")
end
function ExtendHitbox(Player)
    print(Player.Name)
    local Character = Player.Character
    local HumanoidRootPart = Character:FindFirstChild("HumanoidRootPart")
    local Head = Character:FindFirstChild("Head")
    local Body = Character:FindFirstChild("HumanoidRootPart")
    spawn(function()
        while getgenv().Enabled do
            if Character:FindFirstChild("Humandoid").Health <= 0 then
                Head.Transparency = 1
                Body.Transparency = 1
            end
        end
    end)
    if string.lower(HeadOrBody) == "body" then
        while getgenv().Enabled do
            Body.Size = Vector3.new(Sizing,Sizing,Sizing)
            Body.Transparency = .7
            Body.CanCollide = false
            wait(UpdateInterval)
        end
        else if string.lower(HeadOrBody) == "head" then
            if Sizing > 6 then
                Sizing = 6
            end
            while getgenv().Enabled do
                Head.Size = Vector3.new(Sizing,Sizing,Sizing)
                Head.Transparency = .7
                Head.CanCollide = false
                wait(UpdateInterval)
            end
        end
    end
end
for _,v in pairs(game.Players:GetPlayers()) do
    if v ~= game.Players.LocalPlayer then
        spawn(function()
            ExtendHitbox(v)
        end)
    end
end
game.Players.PlayerAdded:Connect(function(v)
    ExtendHitbox(v)
end)
