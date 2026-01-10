local v0 = nil;
local v1 = nil;
client = v0;
service = v1;
v0 = function(_) --[[ Line: 3 ]] --[[ Name: ignore ]]
    return false;
end;
v1 = function(v3, _, _) --[[ Line: 15 ]] --[[ Name: CircleClick ]]
    task.spawn(function() --[[ Line: 17 ]]
        -- upvalues: v3 (copy)
        local v6 = Instance.new("ImageLabel", v3);
        v6.AnchorPoint = Vector2.new(0.5, 0.5);
        v6.BorderSizePixel = 0;
        v6.ZIndex = v3.ZIndex + 2;
        v6.BackgroundTransparency = 1;
        v6.ImageTransparency = 0.96;
        v6.Image = "rbxasset://textures/whiteCircle.png";
        Instance.new("UICorner", v6).CornerRadius = UDim.new(0, 8);
        v6.Position = UDim2.new(0.5, 0, 0.5, 0);
        v6:TweenSize(UDim2.new(0, v3.AbsoluteSize.X * 2.5, 0, v3.AbsoluteSize.X * 2.5), Enum.EasingDirection.Out, Enum.EasingStyle.Linear, 0.5);
        wait(0.5);
        for _ = 1, 10 do
            wait(0.04);
            v6.ImageTransparency = v6.ImageTransparency + 0.1;
        end;
        v6:Destroy();
    end);
end;
local function _(v8, v9, v10) --[[ Line: 39 ]] --[[ Name: propChange ]]
    for v11 in next, v10 do
        if v9[v11] ~= v8[v11] then
            v9[v11] = v8[v11];
        end;
    end;
    if v8.ZIndex == 1 then
        v8.ZIndex = 2;
    end;
    v9.ZIndex = v8.ZIndex - 1;
end;
return function(_, v14) --[[ Line: 53 ]]
    -- upvalues: v1 (copy), v0 (copy)
    if v14 then
        setfenv(1, v14);
    end;
    local l_Parent_0 = script.Parent.Parent;
    local function v19(v16) --[[ Line: 61 ]] --[[ Name: apply ]]
        -- upvalues: v1 (ref)
        if not v16 then
            return;
        else
            if v16:IsA("TextButton") or v16:IsA("ImageButton") then
                v16.ClipsDescendants = true;
                v16.AutoButtonColor = false;
                v16.Activated:Connect(function() --[[ Line: 67 ]]
                    -- upvalues: v1 (ref), v16 (copy)
                    v1(v16:GetObject());
                end);
            end;
            if not v16:IsA("TextLabel") and not v16:IsA("ImageLabel") and not v16:FindFirstChildOfClass("UICorner") then
                local _ = service.New("UICorner", {
                    CornerRadius = UDim.new(0, 5), 
                    Parent = v16
                });
            end;
            if v16:IsA("TextLabel") and not v16:FindFirstChildOfClass("UICorner") then
                local _ = service.New("UICorner", {
                    CornerRadius = UDim.new(0, 6), 
                    Parent = v16
                });
                v16.BackgroundColor3 = Color3.fromRGB(18, 18, 18);
            end;
            if v16:IsA("ScrollingFrame") then
                if v16.Parent and v16.Parent.Name == "Frames" then
                    v16.BackgroundTransparency = 1;
                end;
                v16.BottomImage = "rbxasset://textures/ui/Scroll/scroll-bottom.png";
                v16.MidImage = "rbxasset://textures/ui/Scroll/scroll-middle.png";
                v16.TopImage = "rbxasset://textures/ui/Scroll/scroll-top.png";
                v16.ScrollBarImageTransparency = 0.75;
                v16.ScrollBarImageColor3 = Color3.fromRGB(255, 255, 255);
                v16.BackgroundTransparency = 1;
            end;
            return;
        end;
    end;
    l_Parent_0.DescendantAdded:Connect(function(v20) --[[ Line: 131 ]]
        -- upvalues: v0 (ref), v19 (copy)
        if v20:IsA("GuiObject") and not v0(v20) then
            v19(v20);
        end;
    end);
end;