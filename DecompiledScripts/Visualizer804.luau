local l_RunService_0 = game:GetService("RunService");
local v1 = {};
local function v11(v2, v3) --[[ Line: 5 ]] --[[ Name: AlphaColorSequence ]]
    local l_Keypoints_0 = v2.Keypoints;
    local v5 = 1;
    local v6 = #l_Keypoints_0;
    for v7, v8 in ipairs(l_Keypoints_0) do
        if v3 <= v8.Time then
            v6 = v8;
            v5 = l_Keypoints_0[math.max(1, v7 - 1)];
            break;
        end;
    end;
    local l_Time_0 = v5.Time;
    local l_Time_1 = v6.Time;
    return v5.Value:Lerp(v6.Value, (v3 - l_Time_0) / (l_Time_1 - l_Time_0));
end;
v1.new = function(v12, v13) --[[ Line: 25 ]] --[[ Name: new ]]
    -- upvalues: l_RunService_0 (copy), v11 (copy)
    local v14 = math.clamp(type(v13) == "number" and v13 or 41, 11, 601);
    local v15 = math.clamp(v14 / 2, 10, 500);
    if v14 % 2 == 0 then
        v14 = v14 + 1;
    end;
    local v16 = 1 / v14;
    local v17 = math.ceil(v14 / 2);
    local v18 = table.create(v14);
    local v19 = table.create(v14);
    for v20 = 1, v14 do
        v18[v20] = math.abs(v17 - (v20 + (v20 <= v17 and -1 or 1)));
        v19[v20] = 1 - math.clamp(math.abs(v17 - (v20 + (v20 <= v17 and -1 or 1))) / v17, 0.01, 1) ^ 2;
    end;
    local v21 = 1 / v15;
    local v22 = {
        Frame = v12, 
        VolumeBuffer = table.create(v17 + 1), 
        Bars = {}, 
        BufferConnection = nil, 
        PlayingConnection = nil, 
        Sound = nil
    };
    for v23 = 1, v14 do
        local v24 = v12:Add("Frame", {
            BorderSizePixel = 0, 
            BackgroundColor3 = Color3.new(0.98, 0.98, 0.99), 
            AnchorPoint = Vector2.new(0, 0.5), 
            Size = UDim2.new(v16, 0, 0.02, 0), 
            Position = UDim2.new(v16 * (v23 - 1), 0, 0.5, 0)
        });
        v22.Bars[v23] = v24;
    end;
    local function v36() --[[ Line: 72 ]] --[[ Name: HandlePlaying ]]
        -- upvalues: v22 (copy), l_RunService_0 (ref), v17 (copy), v16 (copy), v21 (copy), v18 (copy), v11 (ref)
        if v22.BufferConnection then
            v22.BufferConnection:Disconnect();
            v22.BufferConnection = nil;
        end;
        local l_Sound_0 = v22.Sound;
        if not l_Sound_0 then
            return;
        elseif l_Sound_0.Playing then
            local v26 = os.clock();
            v22.BufferConnection = l_RunService_0.Heartbeat:Connect(function() --[[ Line: 83 ]]
                -- upvalues: v22 (ref), l_Sound_0 (copy), v17 (ref), v16 (ref), v26 (ref), v21 (ref), v18 (ref), v11 (ref)
                local l_status_0, _ = pcall(function() --[[ Line: 84 ]]
                    -- upvalues: v22 (ref), l_Sound_0 (ref), v17 (ref), v16 (ref), v26 (ref), v21 (ref), v18 (ref), v11 (ref)
                    v22.VolumeBuffer[1] = l_Sound_0.PlaybackLoudness;
                    v22.Bars[v17]:TweenSize(UDim2.new(v16, 0, math.clamp(l_Sound_0.PlaybackLoudness / 400, 0.02, 1), 0), Enum.EasingDirection.Out, Enum.EasingStyle.Linear, 0.014, true);
                    if os.clock() - v26 > v21 then
                        v26 = os.clock();
                        table.insert(v22.VolumeBuffer, 1, l_Sound_0.PlaybackLoudness);
                        if #v22.VolumeBuffer > v17 then
                            v22.VolumeBuffer[#v22.VolumeBuffer] = nil;
                        end;
                        local l_Color_0 = v22.Color;
                        local v28 = typeof(l_Color_0);
                        for v29, v30 in ipairs(v22.Bars) do
                            local v31 = math.clamp((v22.VolumeBuffer[v18[v29]] or 0) / 400, 0.02, 1);
                            v30:TweenSize(UDim2.new(v16, 0, v31, 0), Enum.EasingDirection.Out, Enum.EasingStyle.Linear, v21, true);
                            if l_Color_0 then
                                if v28 == "Color3" then
                                    v30.BackgroundColor3 = l_Color_0;
                                elseif v28 == "ColorSequence" then
                                    v30.BackgroundColor3 = v11(l_Color_0, v31);
                                end;
                            end;
                        end;
                    end;
                end);
                if not l_status_0 then
                    v22:UnlinkFromSound();
                end;
            end);
            return;
        else
            table.clear(v22.VolumeBuffer);
            for _, v35 in ipairs(v22.Bars) do
                v35:TweenSize(UDim2.new(v16, 0, 0.02, 0), Enum.EasingDirection.Out, Enum.EasingStyle.Linear, v21, true);
            end;
            return;
        end;
    end;
    v22.LinkToSound = function(_, v38) --[[ Line: 145 ]] --[[ Name: LinkToSound ]]
        -- upvalues: v22 (copy), v36 (copy)
        v22:UnlinkFromSound();
        table.clear(v22.VolumeBuffer);
        v22.Sound = v38;
        v36();
        v22.PlayingConnection = v38:GetPropertyChangedSignal("Playing"):Connect(v36);
    end;
    v22.UnlinkFromSound = function(_) --[[ Line: 157 ]] --[[ Name: UnlinkFromSound ]]
        -- upvalues: v22 (copy), v16 (copy), v21 (copy)
        if v22.PlayingConnection then
            v22.PlayingConnection:Disconnect();
            v22.PlayingConnection = nil;
        end;
        if v22.BufferConnection then
            v22.BufferConnection:Disconnect();
            v22.BufferConnection = nil;
        end;
        v22.Sound = nil;
        for _, v41 in ipairs(v22.Bars) do
            v41:TweenSize(UDim2.new(v16, 0, 0.02, 0), Enum.EasingDirection.Out, Enum.EasingStyle.Linear, v21, true);
        end;
    end;
    v22.Destroy = function(_) --[[ Line: 179 ]] --[[ Name: Destroy ]]
        -- upvalues: v22 (copy)
        if v22.PlayingConnection then
            v22.PlayingConnection:Disconnect();
            v22.PlayingConnection = nil;
        end;
        if v22.BufferConnection then
            v22.BufferConnection:Disconnect();
            v22.BufferConnection = nil;
        end;
        for _, v44 in ipairs(v22.Bars) do
            v44:Destroy();
        end;
        table.clear(v22.VolumeBuffer);
    end;
    return v22;
end;
return v1;