local test = messagebox("Choose your answer.","Activate AutoExecute scripts?",4)
if test == 6 then
    if isfolder("autoex") and isfile("autoex/main.lua") then
       local a = loadfile("autoex/main.lua")a()
    else
        makefolder("autoex")
        writefile("autoex/main.lua",[[local ScriptNames = {}
local FileType = "lua"
local Directory = "autoex"

for _,all in pairs(ScriptNames) do
	if all ~= "main" then
		local RunScript = loadfile(Directory.."/"..all.."."..FileType)RunScript()
		wait()
	end
end]])
    end
end
