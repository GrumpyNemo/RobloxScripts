local Material = "Neon"

local SkinToneMaterial = {[1]="Material",[2]=Material,[3]={[1]="DragonSecondary",[2]="OceanSecondary",[3]="ChubbyCheeks",[4]="Fat",[5]="EarFluff",[6]="JawFluff",[7]="ChestFluff",[8]="LegFluff",[9]="Eyebrow1",[10]="Eyebrow2",[11]="Secondary",[12]="Jaw",[13]="RightShoulder",[14]="RightLowerLeg",[15]="RightLowerArm",[16]="RightLeg",[17]="RightFootPaw",[18]="LeftArm",[19]="LeftArmPaw",[20]="LeftCarpal",[21]="LeftFootPaw",[22]="LeftLeg",[23]="LeftLowerArm",[24]="LeftLowerLeg",[25]="LeftShoulder",[26]="RightArm",[27]="RightArmPaw",[28]="RightCarpal",[29]="DragonThird",[30]="BackFluff",[31]="TailFluff",[32]="LeftWingStart",[33]="LeftWing2",[34]="LeftWing3",[35]="RightWingStart",[36]="RightWing2",[37]="RightWing3",[38]="EyeLid",[39]="Torso",[40]="Tail1",[41]="Tail2",[42]="Tail3",[43]="Tail5",[44]="Tail6",[45]="RightThigh",[46]="RightEar",[47]="EyeLid",[48]="Head",[49]="Hip",[50]="LeftEar",[51]="LeftThigh",[52]="Muzzle",[53]="Neck",[54]="NeckReal"}}
local DragonThirdMaterial = {[1]="Material",[2]=Material,[3]={[29]="DragonThird"}}
local DragonSecondaryMaterial = {[1]="Material",[2]=Material,[3]={[29]="DragonSecondary"}}
local DragonPrimaryMaterial = {[1]="Material",[2]=Material,[3]={[29]="DragonPrimary"}}
local Torso = {[1] = "AccessoryMaterial",[2] = Material,[3] = "TorsoF"}
local Hair = {[1] = "AccessoryMaterial",[2] = Material,[3] = "HairF"}
local Piercings = {[1] = "AccessoryMaterial",[2] = Material,[3] = "PiercingsF"}
local Feet = {[1] = "AccessoryMaterial",[2] = Material,[3] = "FeetF"}

local Materials = {
    DragonThirdMaterial,
    SkinToneMaterial,
    Torso,
    Hair,
    Piercings,
    Feet,
    DragonSecondaryMaterial,
    DragonPrimaryMaterial,
}

local MasterKeyRemote = function(a)
game:GetService("ReplicatedStorage").MasterKey:FireServer(unpack(a))
end

for i,v in pairs(Materials) do
MasterKeyRemote(v)
end
