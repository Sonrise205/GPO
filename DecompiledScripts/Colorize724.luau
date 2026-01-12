service = nil;
client = nil;
return function(v0, _, v2, v3) --[[ Line: 71 ]]
    if v3 then
        setfenv(1, v3);
    end;
    local v4 = {
        Color3.fromRGB(255, 85, 88), 
        Color3.fromRGB(78, 140, 255), 
        Color3.fromRGB(78, 255, 149)
    };
    local v5 = {
        Frame = true, 
        TextBox = true, 
        TextLabel = true, 
        TextButton = true, 
        ImageLabel = true, 
        ImageButton = true, 
        ScrollingFrame = true
    };
    local v6 = {};
    local v7 = {};
    local function v8(v9) --[[ Line: 93 ]] --[[ Name: getCont ]]
        -- upvalues: v5 (copy), v7 (copy), v6 (copy), v8 (copy)
        for _, v11 in v9:GetChildren() do
            if v5[v11.ClassName] then
                local v12 = {
                    Background = v11.BackgroundColor3
                };
                if v11:IsA("ImageLabel") or v11:IsA("ImageButton") then
                    v12.Image = v11.ImageColor3;
                end;
                v7[v11] = v12;
                table.insert(v6, v11);
                v8(v11);
            end;
        end;
    end;
    v8(v0);
    if v2.Name == "List" then
        v0.Drag.Main.BackgroundTransparency = 0;
    end;
    local function v20(v13, v14, v15) --[[ Line: 114 ]] --[[ Name: tweenToColor ]]
        -- upvalues: v6 (copy), v7 (copy)
        local v16 = TweenInfo.new(v15, Enum.EasingStyle.Linear);
        for _, v18 in v6 do
            local v19 = v7[v18];
            v18.BackgroundColor3 = v13:lerp(v19.Background, 0.75);
            if v19.Image then
                v18.ImageColor3 = v13:lerp(v19.Image, 0.75);
                service.TweenService:Create(v18, v16, {
                    BackgroundColor3 = v14:lerp(v19.Background, 0.75), 
                    ImageColor3 = v14:lerp(v19.Image, 0.75)
                }):Play();
            else
                service.TweenService:Create(v18, v16, {
                    BackgroundColor3 = v14:lerp(v19.Background, 0.75)
                }):Play();
            end;
        end;
        task.wait(v15);
    end;
    service.TrackTask(("Thread: Colorize_%*"):format(v2.Name), function() --[[ Line: 134 ]]
        -- upvalues: v4 (copy), v20 (copy), v2 (copy)
        repeat
            for v21 in v4 do
                local v22 = v4[v21];
                local v23 = v4[v21 + 1] or v4[1];
                v20(v22, v23, 2);
            end;
        until not task.wait(v2.Active and 0 or 1) and v2.Destroyed;
    end);
end;