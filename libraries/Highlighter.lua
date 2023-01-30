local ModelHighlightModule = {}
local CoreGui = game:GetService("CoreGui")
local Players = game:GetService("Players")
local LP = Players.LocalPlayer
---
ModelHighlightModule.AlreadyHighlighted = {}
---
function ModelHighlightModule.highlightModel(model,RGBColor)
    if model.ClassName == "Model" then
    pcall(function()
            if not ModelHighlightModule.AlreadyHighlighted[target] then
                local ModelHighlight = Instance.new("Highlight", CoreGui)
                ModelHighlight.Name = model.Name
                ModelHighlight.Adornee = model
                ModelHighlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
                ModelHighlight.FillColor = RGBColor
                ModelHighlightModule.AlreadyHighlighted[model] = ModelHighlight
            else
                ModelHighlightModule.AlreadyHighlighted[target].FillColor = RGBColor
            end
    end)
    end
end
return ModelHighlightModule
