local ModelHighlightModule = {}


local CoreGui = game:GetService("CoreGui")
local Players = game:GetService("Players")
local LP = Players.LocalPlayer

---

function ModelHighlightModule.highlightModel(model,RGBColor)
        if model.ClassName and model.ClassName == "Model" then
    pcall(function()
            if not CoreGui:FindFirstChild(model.Name) then
                
                local ModelHighlight = Instance.new("Highlight", CoreGui)
                ModelHighlight.Name = model.Name
                ModelHighlight.Adornee = model
                ModelHighlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
                ModelHighlight.FillColor = RGBColor
                
            else
                
                CoreGui:FindFirstChild(model.Name).FillColor = RGBColor
                CoreGui:FindFirstChild(model.Name).Adornee = model
                
            end
            
    end)
    end
end


return ModelHighlightModule
