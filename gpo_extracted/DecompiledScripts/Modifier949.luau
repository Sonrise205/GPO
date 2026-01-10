service = nil;
client = nil;
local function v1(v0) --[[ Line: 4 ]] --[[ Name: ignore ]]
    if not v0.Parent or not v0.Parent.Parent or v0.Parent.Parent.Name == "TabFrame" then

    end;
    if v0.BackgroundTransparency == 1 then
        return true;
    else
        return;
    end;
end;
local function _(v2, v3, v4) --[[ Line: 16 ]] --[[ Name: propChange ]]
    for v5 in next, v4 do
        if v3[v5] ~= v2[v5] then
            v3[v5] = v2[v5];
        end;
    end;
    if v2.ZIndex == 1 then
        v2.ZIndex = 2;
    end;
    v3.ZIndex = v2.ZIndex - 1;
end;
return function(_, v8) --[[ Line: 30 ]]
    -- upvalues: v1 (copy)
    if v8 then
        setfenv(1, v8);
    end;
    local l_Parent_0 = script.Parent.Parent;
    local function v12(v10) --[[ Line: 37 ]] --[[ Name: apply ]]
        local v11 = service.New("UICorner", {
            CornerRadius = UDim.new(0, 8), 
            Parent = v10
        });
        if v10.Name == "__TITLEBUTTON" then
            v11.CornerRadius = UDim.new(1, 0);
            return;
        else
            if v10:IsA("ScrollingFrame") then
                v10.BackgroundTransparency = 1;
            end;
            return;
        end;
    end;
    l_Parent_0.DescendantAdded:Connect(function(v13) --[[ Line: 74 ]]
        -- upvalues: v1 (ref), v12 (copy)
        if v13:IsA("GuiObject") and not v13:FindFirstChildOfClass("UICorner") and not v1(v13) then
            v12(v13);
        end;
    end);
end;