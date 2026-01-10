local l_CurrentCamera_0 = workspace.CurrentCamera;
local function _(v1, v2) --[[ Line: 18 ]] --[[ Name: toOffset ]]
    return v1.Scale * v2 + v1.Offset;
end;
local function _(v4, v5) --[[ Line: 22 ]] --[[ Name: absoluteSizeFromUDim2 ]]
    local l_new_0 = Vector2.new;
    local l_X_0 = v4.X;
    local l_X_1 = v5.X;
    local v9 = l_X_0.Scale * l_X_1 + l_X_0.Offset;
    l_X_1 = v4.Y;
    local l_Y_0 = v5.Y;
    return l_new_0(v9, l_X_1.Scale * l_Y_0 + l_X_1.Offset);
end;
local function _(v12, v13) --[[ Line: 29 ]] --[[ Name: addConstraint ]]
    local v14 = v12:FindFirstChildOfClass("UIAspectRatioConstraint") or Instance.new("UIAspectRatioConstraint");
    v14.AspectRatio = v13.X / v13.Y;
    v14.Parent = v12;
end;
return function(v16, v17) --[[ Line: 46 ]]
    -- upvalues: l_CurrentCamera_0 (copy)
    local v18 = false;
    if typeof(v16) == "Instance" then
        v18 = v16.ClassName;
    end;
    local v19 = true;
    if v18 ~= "UIGridLayout" then
        v19 = v18 == "UIListLayout";
    end;
    assert(v19, ("bad argument #%d to 'LayoutUtil' (%s expected, got %s)"):format(1, "UIGridLayout or UIListLayout", v18));
    local v20 = v17 or v16.Parent;
    v19 = nil;
    v19 = if v20:IsA("GuiObject") then v20.AbsoluteSize else if typeof(v17) == "Vector2" then v17 else l_CurrentCamera_0.ViewportSize;
    if v16.ClassName == "UIGridLayout" then
        local l_CellSize_0 = v16.CellSize;
        local l_v19_0 = v19;
        local l_new_1 = Vector2.new;
        local l_X_2 = l_CellSize_0.X;
        local l_X_3 = l_v19_0.X;
        local v26 = l_X_2.Scale * l_X_3 + l_X_2.Offset;
        l_X_3 = l_CellSize_0.Y;
        local l_Y_1 = l_v19_0.Y;
        local v28 = l_new_1(v26, l_X_3.Scale * l_Y_1 + l_X_3.Offset);
        l_CellSize_0 = v16:FindFirstChildOfClass("UIAspectRatioConstraint") or Instance.new("UIAspectRatioConstraint");
        l_CellSize_0.AspectRatio = v28.X / v28.Y;
        l_CellSize_0.Parent = v16;
        return;
    else
        for _, v30 in (v20:GetChildren()) do
            if v30:IsA("GuiObject") then
                local l_Size_0 = v30.Size;
                local l_v19_1 = v19;
                local l_new_2 = Vector2.new;
                local l_X_4 = l_Size_0.X;
                local l_X_5 = l_v19_1.X;
                local v36 = l_X_4.Scale * l_X_5 + l_X_4.Offset;
                l_X_5 = l_Size_0.Y;
                local l_Y_2 = l_v19_1.Y;
                local v38 = l_new_2(v36, l_X_5.Scale * l_Y_2 + l_X_5.Offset);
                l_Size_0 = v30:FindFirstChildOfClass("UIAspectRatioConstraint") or Instance.new("UIAspectRatioConstraint");
                l_Size_0.AspectRatio = v38.X / v38.Y;
                l_Size_0.Parent = v30;
            end;
        end;
        return;
    end;
end;