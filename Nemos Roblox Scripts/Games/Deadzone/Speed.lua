getgenv().WalkSpeed = 30 --Players speed
getgenv().JumpPower = 76 --Players jump power
getgenv().LegBreakable = false --Disables (or enables) the player's leg to break
getgenv().PlayerFreezable = false --Disables (or enables) the player being froze upon teleporting
getgenv().PlayerFreezableTime = 10 --Default is 10
--SCRIPT--
local SpeedSrc = loadstring(game:HttpGet('https://raw.githubusercontent.com/GrumpyNemo/ScriptDatabase/main/Nemos%20Roblox%20Scripts/Games/Deadzone/SpeedSrc.lua'))()
local Player = game.Players.LocalPlayer
local PlayerGui = Player.PlayerGui

if PlayerGui:FindFirstChild("Input") then
	PlayerGui.Input:Destroy()

	spawn(function()SpeedSrc.SpeedHack()end)

else end
