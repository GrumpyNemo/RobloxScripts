local Counter = 0
local x = 0
local z = 0
local StopOnFinish = true
while wait() do
local ohString1 = "Ramp$270$0"
local ohVector3 = Vector3.new(x, Counter, z)
local ohString12 = "Ramp$90$0"
local ohVector32 = Vector3.new(x, Counter, z)

game:GetService("ReplicatedStorage").BuildingSystem.Libraries.Grid.AddGridObject:FireServer(ohString1, ohVector3)
game:GetService("ReplicatedStorage").BuildingSystem.Libraries.Grid.AddGridObject:FireServer(ohString12, ohVector32)
Counter = Counter+1
if Counter >= 25 then
    Counter=0
    x = x
    z = z+1
    print("Update X="..x.." Z="..z)
end
if x >= 25 or x <= -25 then
    if StopOnFinish == true then break; end
    else
    x = 0
end
if z >= 25 or z <= -25 then
    if StopOnFinish == true then break; end
    else
    z = 0
end
end