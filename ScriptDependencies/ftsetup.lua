local ScreenGui = Instance.new("ScreenGui")
local Frame = Instance.new("Frame")
local TextBox = Instance.new("TextBox")
local UICorner = Instance.new("UICorner")
local TextButton = Instance.new("TextButton")
local UICorner_2 = Instance.new("UICorner")
local TextLabel = Instance.new("TextLabel")
local Module = loadstring(game:HttpGet("https://raw.githubusercontent.com/GrumpyNemo/ScriptDatabase/main/ScriptStuff/whitelists.lua",true))()

ScreenGui.Parent = game.CoreGui
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

Frame.Parent = ScreenGui
Frame.BackgroundColor3 = Color3.fromRGB(58, 58, 58)
Frame.BorderSizePixel = 0
Frame.Position = UDim2.new(0.424585223, 0, 0.442548364, 0)
Frame.Size = UDim2.new(0, 250, 0, 150)

TextBox.Parent = Frame
TextBox.BackgroundColor3 = Color3.fromRGB(74, 74, 74)
TextBox.Position = UDim2.new(0.0480000004, 0, 0.480000019, 0)
TextBox.Size = UDim2.new(0, 225, 0, 35)
TextBox.ClearTextOnFocus = false
TextBox.Font = Enum.Font.SourceSans
TextBox.PlaceholderText = "Key"
TextBox.Text = ""
TextBox.TextColor3 = Color3.fromRGB(0, 0, 0)
TextBox.TextSize = 25.000
TextBox.TextWrapped = true

UICorner.Parent = TextBox

TextButton.Parent = Frame
TextButton.BackgroundColor3 = Color3.fromRGB(74, 74, 74)
TextButton.Position = UDim2.new(0.219999999, 0, 0.769999981, 0)
TextButton.Size = UDim2.new(0, 140, 0, 25)
TextButton.Font = Enum.Font.SourceSansSemibold
TextButton.Text = "Submit"
TextButton.TextColor3 = Color3.fromRGB(255, 85, 0)
TextButton.TextScaled = true
TextButton.TextSize = 14.000
TextButton.TextWrapped = true

UICorner_2.Parent = TextButton

TextLabel.Parent = Frame
TextLabel.BackgroundColor3 = Color3.fromRGB(42, 42, 42)
TextLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
TextLabel.BorderSizePixel = 2
TextLabel.Position = UDim2.new(0.0480000004, 0, 0.0866666734, 0)
TextLabel.Size = UDim2.new(0, 225, 0, 35)
TextLabel.Font = Enum.Font.SourceSansBold
TextLabel.Text = "First Time Setup"
TextLabel.TextColor3 = Color3.fromRGB(255, 85, 0)
TextLabel.TextScaled = true
TextLabel.TextSize = 14.000
TextLabel.TextWrapped = true

TextButton.MouseButton1Down:Connect(function()
    for _,table in pairs(Module.KeySystem) do
        if table[1] == game.Players.LocalPlayer.UserId then
            if string.lower(table[2]) == string.lower(TextBox.Text) then
                writefile("K3Y.nemo",TextBox.Text)
                getgenv().NEMO_Key = TextBox.Text
                getgenv().NEMO_Pass = true
                
                --
                ScreenGui:Destroy()
            end
        end
    end
end)
