local l_LocalPlayer_0 = game:GetService("Players").LocalPlayer;
local l_l_LocalPlayer_0_Mouse_0 = l_LocalPlayer_0:GetMouse();
local l_PlayerGui_0 = l_LocalPlayer_0.PlayerGui;
if l_PlayerGui_0:FindFirstChild("MarkerMenu") == nil then
    script.MarkerMenu:Clone().Parent = l_PlayerGui_0;
    script.IndicatorGui:Clone().Parent = l_PlayerGui_0;
end;
local l_MarkerMenu_0 = l_PlayerGui_0:WaitForChild("MarkerMenu");
local l_MouseFollower_0 = l_MarkerMenu_0:WaitForChild("MouseFollower");
local v5 = {};
v5.__index = v5;
v5.new = function() --[[ Line: 21 ]] --[[ Name: new ]]
    -- upvalues: v5 (copy)
    local v6 = setmetatable({}, v5);
    v6.Radius = 75;
    v6.Options = v6:_createOptions();
    return v6;
end;
v5._scaleUI = function(_, v8) --[[ Line: 29 ]] --[[ Name: _scaleUI ]]
    -- upvalues: l_MarkerMenu_0 (copy)
    local l_Main_0 = l_MarkerMenu_0.Main;
    local function v16() --[[ Line: 32 ]] --[[ Name: Scale ]]
        -- upvalues: l_Main_0 (copy), v8 (copy)
        local v10 = l_Main_0.AbsoluteSize.X / 2;
        for _, v12 in v8 do
            local l_v12_Attribute_0 = v12:GetAttribute("Angle");
            if v12.Name == "Divider" then
                local v14 = v10 / 2;
                v12.Size = UDim2.fromOffset(1, v14 * 2);
                v12.Position = UDim2.new(0.5, math.cos(l_v12_Attribute_0) * v14, 0.5, math.sin(l_v12_Attribute_0) * v14);
            else
                local v15 = v10 * 0.75;
                v12.Position = UDim2.fromScale(0.5, 0.5) + UDim2.fromOffset(math.cos(l_v12_Attribute_0) * v15, math.sin(l_v12_Attribute_0) * v15);
            end;
        end;
    end;
    v16();
    l_Main_0:GetPropertyChangedSignal("AbsoluteSize"):Connect(v16);
end;
v5._createOptions = function(v17) --[[ Line: 55 ]] --[[ Name: _createOptions ]]
    -- upvalues: l_MarkerMenu_0 (copy)
    local v18 = {
        "On my way!", 
        "Help", 
        "Question", 
        "Danger"
    };
    local v19 = {};
    for v20, v21 in v18 do
        local v22 = (v20 - 1) / #v18 * 6.283185307179586 + 3.141592653589793 / #v18;
        local v23 = script[v21]:Clone();
        v23.AnchorPoint = Vector2.new(0.5, 0.5);
        v23:SetAttribute("Angle", v22);
        v23.Parent = l_MarkerMenu_0.Main;
        local v24 = script.Divider:Clone();
        v22 = v22 - 3.141592653589793 / #v18;
        v24.Rotation = math.deg(v22 + 1.5707963267948966);
        v24:SetAttribute("Angle", v22);
        v24.Parent = l_MarkerMenu_0.Main;
        table.insert(v19, v24);
        table.insert(v19, v23);
    end;
    v17:_scaleUI(v19);
    return v18;
end;
v5._updateSelection = function(v25, v26) --[[ Line: 82 ]] --[[ Name: _updateSelection ]]
    -- upvalues: l_MarkerMenu_0 (copy)
    if v25.Options[v26] then
        v25.Selected = v25.Options[v26];
    else
        v25.Selected = "Ping";
    end;
    l_MarkerMenu_0.Main.Center.TextLabel.Text = v25.Selected;
end;
v5._updateMouseFollower = function(_, v28, v29) --[[ Line: 92 ]] --[[ Name: _updateMouseFollower ]]
    -- upvalues: l_l_LocalPlayer_0_Mouse_0 (copy), l_MouseFollower_0 (copy), l_MarkerMenu_0 (copy)
    local _ = Vector2.new(l_l_LocalPlayer_0_Mouse_0.X, l_l_LocalPlayer_0_Mouse_0.Y);
    local v31 = v29.Magnitude / 2;
    l_MouseFollower_0.Size = UDim2.fromOffset(1, v29.Magnitude);
    l_MouseFollower_0.Position = l_MarkerMenu_0.Main.Position + UDim2.fromOffset(math.cos(v28) * v31, math.sin(v28) * v31);
    l_MouseFollower_0.Rotation = math.deg(v28 + 1.5707963267948966);
end;
v5.Choose = function(v32) --[[ Line: 101 ]] --[[ Name: Choose ]]
    -- upvalues: l_MarkerMenu_0 (copy), l_l_LocalPlayer_0_Mouse_0 (copy)
    l_MarkerMenu_0.Enabled = true;
    local v33 = Vector2.new(l_l_LocalPlayer_0_Mouse_0.X, l_l_LocalPlayer_0_Mouse_0.Y);
    v32.MousePosition = v33;
    l_MarkerMenu_0.Main.Position = UDim2.fromOffset(v33.X, v33.Y);
    v32.Selecting = task.spawn(function() --[[ Line: 109 ]]
        -- upvalues: l_l_LocalPlayer_0_Mouse_0 (ref), v33 (copy), v32 (copy), l_MarkerMenu_0 (ref)
        while true do
            local v34 = Vector2.new(l_l_LocalPlayer_0_Mouse_0.X, l_l_LocalPlayer_0_Mouse_0.Y);
            local v35 = v33 - v34;
            local v36 = math.atan2(v35.Y, v35.X) + 3.141592653589793;
            local v37 = math.ceil(v36 / (6.283185307179586 / #v32.Options));
            v32:_updateMouseFollower(v36, v35);
            if v35.Magnitude >= l_MarkerMenu_0.Main.Center.AbsoluteSize.X / 2 then
                v32:_updateSelection(v37);
            else
                v32:_updateSelection(5);
            end;
            task.wait();
        end;
    end);
end;
v5.Select = function(v38) --[[ Line: 128 ]] --[[ Name: Select ]]
    -- upvalues: l_MarkerMenu_0 (copy)
    l_MarkerMenu_0.Enabled = false;
    if v38.Selecting then
        task.cancel(v38.Selecting);
        v38.Selecting = nil;
    end;
end;
return v5;