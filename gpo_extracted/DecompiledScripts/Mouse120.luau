local _ = game:GetService("RunService");
local l_UserInputService_0 = game:GetService("UserInputService");
local l_CurrentCamera_0 = workspace.CurrentCamera;
local v3 = {};
local l_BindableEvent_0 = Instance.new("BindableEvent");
local l_BindableEvent_1 = Instance.new("BindableEvent");
v3.LeftClick = l_BindableEvent_0.Event;
v3.RightClick = l_BindableEvent_1.Event;
v3.GetUnitRay = function() --[[ Line: 31 ]] --[[ Name: GetUnitRay ]]
    -- upvalues: l_UserInputService_0 (copy), l_CurrentCamera_0 (copy)
    local l_X_0 = l_UserInputService_0:GetMouseLocation().X;
    local l_Y_0 = l_UserInputService_0:GetMouseLocation().Y;
    return (l_CurrentCamera_0:ViewportPointToRay(l_X_0, l_Y_0));
end;
v3.Raycast = function(v8) --[[ Line: 41 ]] --[[ Name: Raycast ]]
    -- upvalues: v3 (copy)
    local v9 = v3.GetUnitRay();
    return workspace:Raycast(v9.Origin, v9.Direction * 500, v8), v9;
end;
v3.GetPosition = function(v10, v11) --[[ Line: 51 ]] --[[ Name: GetPosition ]]
    -- upvalues: v3 (copy)
    local v12, v13 = v3.Raycast(v10);
    if v12 then
        return v12.Position;
    elseif v13 then
        return v13.Origin + v13.Direction * (v11 or 500);
    else
        return;
    end;
end;
v3.GetTarget = function(v14) --[[ Line: 65 ]] --[[ Name: GetTarget ]]
    -- upvalues: v3 (copy)
    local v15, _ = v3.Raycast(v14);
    return v15 and v15.Instance;
end;
v3._OnInput = function(v17) --[[ Line: 73 ]] --[[ Name: _OnInput ]]
    -- upvalues: l_BindableEvent_0 (copy), l_BindableEvent_1 (copy)
    if v17.UserInputType == Enum.UserInputType.MouseButton1 then
        l_BindableEvent_0:Fire(v17.UserInputState);
        return;
    else
        if v17.UserInputType == Enum.UserInputType.MouseButton2 then
            l_BindableEvent_1:Fire(v17.UserInputState);
        end;
        return;
    end;
end;
l_UserInputService_0.InputBegan:Connect(v3._OnInput);
l_UserInputService_0.InputEnded:Connect(v3._OnInput);
return v3;