local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Roact);
local l_createElement_0 = v1.createElement;
local v3 = v1.PureComponent:extend(script.Name);
local v4 = {
    Frame = Color3.new(1, 0, 0), 
    TextLabel = Color3.new(0, 1, 0), 
    TextButton = Color3.new(0, 0.5, 0.5)
};
v3.init = function(v5) --[[ Line: 15 ]] --[[ Name: init ]]
    -- upvalues: v1 (copy)
    v5.Ref = v1.createRef();
end;
v3.didMount = function(v6) --[[ Line: 19 ]] --[[ Name: didMount ]]
    -- upvalues: v4 (copy)
    local v7 = v6.Ref:getValue();
    for _, v9 in pairs(v7:GetDescendants()) do
        if v9:IsA("GuiBase") then
            local l_Frame_0 = Instance.new("Frame");
            l_Frame_0.BackgroundTransparency = 1;
            l_Frame_0.Size = UDim2.new(1, -2, 1, -2);
            local v11 = v9:FindFirstChildOfClass("UIStroke") or Instance.new("UIStroke");
            v11.ApplyStrokeMode = Enum.ApplyStrokeMode.Border;
            v11.Color = v4[v9.ClassName] or Color3.new(1, 0, 1);
            v11.Transparency = 0;
            v11.Parent = v9;
        end;
    end;
end;
v3.render = function(v12) --[[ Line: 38 ]] --[[ Name: render ]]
    -- upvalues: l_createElement_0 (copy), v1 (copy)
    return l_createElement_0("Frame", {
        AutomaticSize = "XY", 
        BackgroundTransparency = 1, 
        Size = v12.props.Size, 
        [v1.Ref] = v12.Ref
    }, v12.props[v1.Children]);
end;
return v3;