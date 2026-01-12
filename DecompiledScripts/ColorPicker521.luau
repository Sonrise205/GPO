local v0 = nil;
local v1 = nil;
client = v0;
service = v1;
return function(v2, v3) --[[ Line: 3 ]]
    if v3 then
        setfenv(1, v3);
    end;
    local v4 = v2.Color or Color3.new(1, 1, 1);
    local l_r_0 = v4.r;
    local l_g_0 = v4.g;
    local l_b_0 = v4.b;
    local v8 = nil;
    local v9 = nil;
    local v10 = nil;
    local v11 = nil;
    local v12 = nil;
    local v13 = nil;
    local v14 = nil;
    local v15 = nil;
    local v16 = nil;
    local v17 = nil;
    local v18 = nil;
    local v19 = client.UI.Make("Window", {
        Name = "ColorPicker", 
        Title = v2.Title or "Color Picker", 
        Icon = client.MatIcons.Create, 
        Size = {
            250, 
            230
        }, 
        MinSize = {
            150, 
            230
        }, 
        MaxSize = {
            math.huge, 
            230
        }, 
        SizeLocked = true, 
        OnClose = function() --[[ Line: 26 ]] --[[ Name: OnClose ]]
            -- upvalues: v17 (ref), v4 (ref)
            if not v17 then
                v17 = v4;
            end;
        end
    });
    local v20 = v19:Add("Frame", {
        Size = UDim2.new(1, -10, 0, 20), 
        Position = UDim2.new(0, 5, 0, 150), 
        BackgroundColor3 = v4
    });
    local _ = v19:Add("TextButton", {
        Text = "Accept", 
        Size = UDim2.new(1, -10, 0, 20), 
        Position = UDim2.new(0, 5, 0, 175), 
        Events = {
            MouseButton1Down = function() --[[ Line: 44 ]] --[[ Name: MouseButton1Down ]]
                -- upvalues: v17 (ref), v4 (ref), v19 (copy)
                v17 = v4;
                v19:Close();
            end
        }
    });
    local function v22() --[[ Line: 51 ]] --[[ Name: updateColors ]]
        -- upvalues: v4 (ref), l_r_0 (ref), l_g_0 (ref), l_b_0 (ref), v20 (copy), v11 (ref), v14 (ref), v8 (ref), v12 (ref), v15 (ref), v9 (ref), v13 (ref), v16 (ref), v10 (ref)
        v4 = Color3.new(l_r_0, l_g_0, l_b_0);
        v20.BackgroundColor3 = v4;
        v11:SetValue((math.floor(l_r_0 * 255)));
        v14.Color = ColorSequence.new(Color3.new(0, l_g_0, l_b_0), Color3.new(1, l_g_0, l_b_0));
        v8:SetValue(l_r_0);
        v12:SetValue((math.floor(l_g_0 * 255)));
        v15.Color = ColorSequence.new(Color3.new(l_r_0, 0, l_b_0), Color3.new(l_r_0, 1, l_b_0));
        v9:SetValue(l_g_0);
        v13:SetValue((math.floor(l_b_0 * 255)));
        v16.Color = ColorSequence.new(Color3.new(l_r_0, l_g_0, 0), Color3.new(l_r_0, l_g_0, 1));
        v10:SetValue(l_b_0);
    end;
    v11 = v19:Add("StringEntry", {
        Text = "Red: ", 
        BoxText = l_r_0 * 255, 
        BackgroundTransparency = 1, 
        TextSize = 20, 
        Size = UDim2.new(1, -20, 0, 20), 
        Position = UDim2.new(0, 10, 0, 0), 
        TextChanged = function(v23, v24, _) --[[ Line: 75 ]] --[[ Name: TextChanged ]]
            -- upvalues: l_r_0 (ref), v22 (copy)
            if tonumber(v23) then
                local v26 = nil;
                v23 = math.floor((tonumber(v23)));
                if v23 < 0 then
                    v26 = true;
                    v23 = 0;
                elseif v23 > 255 then
                    v26 = true;
                    v23 = 255;
                end;
                l_r_0 = v23 / 255;
                v22();
                if v26 then
                    return v23;
                end;
            elseif v24 then
                return l_r_0 * 255;
            end;
        end
    });
    v12 = v19:Add("StringEntry", {
        Text = "Green: ", 
        BoxText = l_g_0 * 255, 
        BackgroundTransparency = 1, 
        TextSize = 20, 
        Size = UDim2.new(1, -20, 0, 20), 
        Position = UDim2.new(0, 10, 0, 50), 
        TextChanged = function(v27, v28, _) --[[ Line: 103 ]] --[[ Name: TextChanged ]]
            -- upvalues: l_g_0 (ref), v22 (copy)
            if tonumber(v27) then
                local v30 = false;
                v27 = math.floor((tonumber(v27)));
                if v27 < 0 then
                    v30 = true;
                    v27 = 0;
                elseif v27 > 255 then
                    v30 = true;
                    v27 = 255;
                end;
                l_g_0 = v27 / 255;
                v22();
                if v30 then
                    return v27;
                end;
            elseif v28 then
                return l_g_0 * 255;
            end;
        end
    });
    v13 = v19:Add("StringEntry", {
        Text = "Blue: ", 
        BoxText = l_b_0 * 255, 
        BackgroundTransparency = 1, 
        TextSize = 20, 
        Size = UDim2.new(1, -20, 0, 20), 
        Position = UDim2.new(0, 10, 0, 100), 
        TextChanged = function(v31, v32, _) --[[ Line: 131 ]] --[[ Name: TextChanged ]]
            -- upvalues: l_b_0 (ref), v22 (copy)
            if tonumber(v31) then
                local v34 = false;
                v31 = math.floor((tonumber(v31)));
                if v31 < 0 then
                    v34 = true;
                    v31 = 0;
                elseif v31 > 255 then
                    v34 = true;
                    v31 = 255;
                end;
                l_b_0 = v31 / 255;
                v22();
                if v34 then
                    return v31;
                end;
            elseif v32 then
                return l_b_0 * 255;
            end;
        end
    });
    v8 = v19:Add("Slider", {
        Percent = v4.r, 
        Size = UDim2.new(1, -20, 0, 20), 
        Position = UDim2.new(0, 10, 0, 25), 
        OnSlide = function(v35) --[[ Line: 156 ]] --[[ Name: OnSlide ]]
            -- upvalues: l_r_0 (ref), v22 (copy)
            l_r_0 = v35;
            v22();
        end
    });
    v9 = v19:Add("Slider", {
        Percent = v4.r, 
        Size = UDim2.new(1, -20, 0, 20), 
        Position = UDim2.new(0, 10, 0, 75), 
        OnSlide = function(v36) --[[ Line: 166 ]] --[[ Name: OnSlide ]]
            -- upvalues: l_g_0 (ref), v22 (copy)
            l_g_0 = v36;
            v22();
        end
    });
    v10 = v19:Add("Slider", {
        Percent = v4.r, 
        Size = UDim2.new(1, -20, 0, 20), 
        Position = UDim2.new(0, 10, 0, 125), 
        OnSlide = function(v37) --[[ Line: 176 ]] --[[ Name: OnSlide ]]
            -- upvalues: l_b_0 (ref), v22 (copy)
            l_b_0 = v37;
            v22();
        end
    });
    v14 = service.New("UIGradient", v8.SliderBar);
    v15 = service.New("UIGradient", v9.SliderBar);
    v16 = service.New("UIGradient", v10.SliderBar);
    v22();
    v18 = v19.gTable;
    v19:ResizeCanvas();
    v19:Ready();
    repeat
        task.wait();
    until v17 or not v18.Active;
    return v17;
end;