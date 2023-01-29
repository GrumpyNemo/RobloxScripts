if not getgenv().DeadzoneTab then
getgenv().DeadzoneTab = getgenv().NemoHubWindow:CreateTab("Deadzone Classic", 11810057512)
----------------------------------------------
    if not getgenv().WalkSpeed or getgenv().JumpPower then
    getgenv().WalkSpeed = 16 --Players speed
    getgenv().JumpPower = 26 --Players jump power
    end
    getgenv().LegBreakable = false --Disables (or enables) the player's leg to break
    getgenv().PlayerFreezable = false --Disables (or enables) the player being froze upon teleporting
    getgenv().PlayerFreezableTime = 10 --Default is 10
    
    local SpeedSrc = loadstring(game:HttpGet('https://raw.githubusercontent.com/GrumpyNemo/ScriptDatabase/main/Nemos%20Roblox%20Scripts/Games/Deadzone/SpeedSrc.lua'))()

    local function CharPatch()
        local Player = game.Players.LocalPlayer
        local PlayerGui = Player.PlayerGui
        if PlayerGui:FindFirstChild("Input") then PlayerGui.Input:Destroy()spawn(function()SpeedSrc.SpeedHack()end)else end
    end

----------------------------------------------
local Tab = getgenv().DeadzoneTab
local Paragraph = Tab:CreateParagraph({Title = "Grumpy Nemo's Deadzone Classic Script", Content = "Have fun B)"})
local WSSlider = Tab:CreateSlider({
   Name = "Player WalkSpeed",
   Range = {0, 50},
   Increment = 1,
   Suffix = "Studs",
   CurrentValue = 16,
   Flag = "WalkSpeedSlider", 
   Callback = function(Value)
       getgenv().WalkSpeed = Value
       CharPatch()
   end,
})
local JPSlider = Tab:CreateSlider({
   Name = "Player JumpPower",
   Range = {0, 100},
   Increment = 5,
   Suffix = "JumpPower",
   CurrentValue = 26,
   Flag = "JumpPowerSlider", 
   Callback = function(Value)
       getgenv().JumpPower = Value
       CharPatch()
   end,
})

local LegBreakableToggle = Tab:CreateToggle({
   Name = "Player's Leg Breaks",
   CurrentValue = getgenv().LegBreakable,
   Flag = "LegBreakableToggle", 
   Callback = function(Value)
        getgenv().LegBreakable = Value
        CharPatch()
   end,
})

local FreezeToggle = Tab:CreateToggle({
   Name = "Player Freezes while Teleporting",
   CurrentValue = getgenv().PlayerFreezable,
   Flag = "FreezeToggle", 
   Callback = function(Value)
        getgenv().PlayerFreezable = Value
        CharPatch()
   end,
})
local Button = Tab:CreateButton({
   Name = "Char Patch",
   Callback = function()
    CharPatch()
    end,
})
----------------------------------------------
else
getgenv().Rayfield:Notify({
   Title = "[ Deadzone Classic ]",
   Content = "Script already injected!",
   Duration = 6.5,
   Image = 4483362458
})
end
