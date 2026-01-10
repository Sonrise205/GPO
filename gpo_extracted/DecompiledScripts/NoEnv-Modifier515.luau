service = nil;
client = nil;
local function v1(v0) --[[ Line: 4 ]] --[[ Name: ignore ]]
    if v0.Name == "Title" then
        return true;
    else
        return;
    end;
end;
local function _(v2, v3, v4) --[[ Line: 19 ]] --[[ Name: propChange ]]
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
return function(_, v8) --[[ Line: 33 ]]
    -- upvalues: v1 (copy)
    if v8 then
        setfenv(1, v8);
    end;
    local l_Parent_0 = script.Parent.Parent;
    local function v11(v10) --[[ Line: 40 ]] --[[ Name: apply ]]
        if v10:IsA("TextButton") then
            v10.BackgroundColor3 = Color3.fromRGB(150, 150, 150);
            v10.BorderColor3 = Color3.fromRGB(50, 70, 160);
            v10.BorderSizePixel = 1;
        elseif v10:IsA("GuiObject") then
            v10.BackgroundColor3 = Color3.fromRGB(170, 170, 170);
            v10.BorderColor3 = Color3.fromRGB(100, 100, 100);
            v10.BorderSizePixel = 1;
        end;
        if v10:IsA("TextButton") or v10:IsA("TextLabel") or v10:IsA("TextBox") then
            v10.TextColor3 = Color3.fromRGB(10, 10, 10);
            v10.TextStrokeTransparency = 1;
        end;
        if v10.Parent and v10.Parent.Parent and v10.Parent.Parent.Name == "TabFrame" then
            v10.BackgroundColor3 = Color3.fromRGB(150, 150, 150);
        end;
        if v10:IsA("ScrollingFrame") then

        end;
    end;
    l_Parent_0.DescendantAdded:Connect(function(v12) --[[ Line: 98 ]]
        -- upvalues: v1 (ref), v11 (copy)
        if v12:IsA("GuiObject") and not v1(v12) then
            v11(v12);
        end;
    end);
    for _, v14 in ipairs(l_Parent_0:GetDescendants()) do
        if v14:IsA("GuiObject") and not v1(v14) then
            v11(v14);
        end;
    end;
end;