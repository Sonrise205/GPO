local l_Modules_0 = script.Parent.Parent.Modules;
local v1 = require(l_Modules_0.Packages);
local v2 = require(v1.Directory.Roact);
return function(v3) --[[ Line: 9 ]] --[[ Name: TopbarButton ]]
    -- upvalues: v2 (copy)
    return v2.createElement("TextButton", {
        AutoLocalize = false, 
        TextColor3 = v3.Theme.Name == "Light" and Color3.new(0, 0, 0) or Color3.new(1, 1, 1), 
        Size = UDim2.fromOffset(0, 10), 
        BackgroundColor3 = v3.Theme:GetColor("Item"), 
        TextSize = 11, 
        BorderSizePixel = 0, 
        Font = Enum.Font.Code, 
        Text = v3.Text, 
        AutomaticSize = Enum.AutomaticSize.X, 
        TextXAlignment = Enum.TextXAlignment.Left, 
        TextYAlignment = Enum.TextYAlignment.Center, 
        LayoutOrder = v3.LayoutOrder, 
        [v2.Event.Activated] = v3.OnClick
    });
end;