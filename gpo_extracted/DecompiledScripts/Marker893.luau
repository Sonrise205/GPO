local l_RunService_0 = game:GetService("RunService");
local l_TweenService_0 = game:GetService("TweenService");
local l_CurrentCamera_0 = workspace.CurrentCamera;
local l_LocalPlayer_0 = game.Players.LocalPlayer;
local v4 = {};
local v5 = {};
v5.__index = v5;
v5.new = function(v6) --[[ Line: 11 ]] --[[ Name: new ]]
    -- upvalues: v5 (copy), l_LocalPlayer_0 (copy), v4 (copy)
    local v7 = setmetatable({}, v5);
    local v8 = script.MainFrame:Clone();
    v8.Parent = l_LocalPlayer_0.PlayerGui.IndicatorGui;
    v8.IconImage.ImageColor3 = v6.Color;
    local v9 = script.Part:Clone();
    v9.Position = v6.Position;
    v9.Parent = workspace.Effects;
    for _, v11 in v9.Attachment:GetChildren() do
        v11.Color = ColorSequence.new(v6.Color);
    end;
    v7.UI = v8;
    v7.Part = v9;
    v7.Player = v6.Player;
    v7.Color = v6.Color;
    v7.Duration = 5;
    v7.OnScreen = false;
    v7.Tween = nil;
    v7.DangerPing = nil;
    v4[v7.Player] = v7;
    v7:_main();
    return v7;
end;
local function _(v12, v13, v14) --[[ Line: 41 ]] --[[ Name: lerp ]]
    return v12 + (v13 - v12) * v14;
end;
v5._dangerPing = function(v16, v17) --[[ Line: 45 ]] --[[ Name: _dangerPing ]]
    -- upvalues: l_TweenService_0 (copy)
    if v16.DangerPing and coroutine.status(v16.DangerPing) ~= "dead" then
        task.cancel(v16.DangerPing);
    end;
    v16.DangerPing = task.spawn(function() --[[ Line: 50 ]]
        -- upvalues: v16 (copy), v17 (copy), l_TweenService_0 (ref)
        for _ = 1, 3 do
            local l_Circle_0 = v16.UI.Circle;
            l_Circle_0.BackgroundTransparency = 0;
            l_Circle_0.Size = UDim2.fromOffset(0, 0);
            l_Circle_0.BackgroundColor3 = script.Parent.MarkerMenu[v17].ImageColor3;
            l_Circle_0.UIGradient.Color = script.Parent.MarkerMenu[v17].UIGradient.Color;
            v16.Tween = l_TweenService_0:Create(l_Circle_0, TweenInfo.new(0.5), {
                Size = UDim2.fromScale(1, 1), 
                BackgroundTransparency = 1
            }):Play();
            task.wait(1);
        end;
    end);
end;
v5.Update = function(v20, v21, v22) --[[ Line: 90 ]] --[[ Name: Update ]]
    v20:MoveLocation(v21, v22);
    v20.UI.IconImage.Image = script.Parent.MarkerMenu[v22].Image;
    v20.UI.IconImage.ImageColor3 = script.Parent.MarkerMenu[v22].ImageColor3;
    v20.UI.IconImage.UIGradient.Color = script.Parent.MarkerMenu[v22].UIGradient.Color;
    v20.UI.IconImage.playerName.Text = v22 .. "<br/>-" .. v20.Player.DisplayName;
    v20.UI.IconImage.shadow.Image = script.Parent.MarkerMenu[v22].Image;
    _G.recolorParticles(v20.Part, script.Parent.MarkerMenu[v22].UIGradient.Color);
end;
v5.MoveLocation = function(v23, v24, v25) --[[ Line: 101 ]] --[[ Name: MoveLocation ]]
    local l_Part_0 = v23.Part;
    v23:_dangerPing(v25);
    l_Part_0.Position = v24;
end;
v5.FadeOut = function(v27) --[[ Line: 111 ]] --[[ Name: FadeOut ]]
    -- upvalues: l_TweenService_0 (copy)
    l_TweenService_0:Create(v27.UI.IconImage, TweenInfo.new(1), {
        ImageTransparency = 1
    }):Play();
    l_TweenService_0:Create(v27.UI.IconImage.shadow, TweenInfo.new(1), {
        ImageTransparency = 1
    }):Play();
    l_TweenService_0:Create(v27.UI.IconImage.Distance, TweenInfo.new(1), {
        TextTransparency = 1
    }):Play();
    l_TweenService_0:Create(v27.UI.IconImage.playerName, TweenInfo.new(1), {
        TextTransparency = 1
    }):Play();
    l_TweenService_0:Create(v27.Part.Beam, TweenInfo.new(1), {
        Width0 = 0, 
        Width1 = 0
    }):Play();
    for _, v29 in v27.Part.Attachment:GetChildren() do
        v29.Enabled = false;
    end;
end;
v5._main = function(v30) --[[ Line: 124 ]] --[[ Name: _main ]]
    -- upvalues: l_RunService_0 (copy), l_CurrentCamera_0 (copy), l_TweenService_0 (copy)
    local v31 = 0;
    v30.RunService = l_RunService_0.RenderStepped:Connect(function(v32) --[[ Line: 126 ]]
        -- upvalues: l_CurrentCamera_0 (ref), v30 (copy), l_TweenService_0 (ref), v31 (ref)
        local l_X_0 = l_CurrentCamera_0.ViewportSize.X;
        local l_Y_0 = l_CurrentCamera_0.ViewportSize.Y;
        local v35 = v30.UI.AbsoluteSize.X / 2;
        local v36 = l_X_0 - v35 * 2;
        local v37 = l_Y_0 - v35 * 2;
        local l_CFrame_0 = l_CurrentCamera_0.CFrame;
        local v39 = math.sqrt((v36 / 2) ^ 2 + (v37 / 2) ^ 2);
        local v40 = nil;
        local l_LookVector_0 = l_CurrentCamera_0.CFrame.LookVector;
        v40 = Vector2.new(l_LookVector_0.X, l_LookVector_0.Z).Unit;
        local v42 = v30.Part.Position + Vector3.new(0, 2.5, 0, 0);
        local v43, v44 = l_CurrentCamera_0:WorldToViewportPoint(v42);
        local v45 = math.clamp(v43.X, v35, l_X_0 - v35);
        local v46 = math.clamp(v43.Y, v35, l_Y_0 - v35);
        local v47 = UDim2.fromOffset();
        if v45 == v43.X and v46 == v43.Y and v44 then
            if not v30.OnScreen then
                v30.OnScreen = true;
                v30.Tween = l_TweenService_0:Create(v30.UI.IconImage, TweenInfo.new(0.2), {
                    Rotation = v30.UI.IconImage.Rotation < 180 and 0 or 360
                });
                v30.Tween:Play();
            end;
            v47 = UDim2.fromOffset(0, math.sin(v31 * 3.141592653589793) * 5 - 2.5);
        else
            v30.OnScreen = false;
            if v30.Tween then
                v30.Tween:Cancel();
                v30.Tween = nil;
            end;
            local v48 = l_CFrame_0:VectorToObjectSpace(v42 - l_CFrame_0.Position);
            local l_Unit_0 = Vector2.new(v48.X, v48.Y).Unit;
            local v50 = l_Unit_0 * v39;
            local v51 = math.atan2(l_Unit_0.X, l_Unit_0.Y);
            local v52 = nil;
            v52 = if math.abs(v50.Y) > v37 / 2 then l_Unit_0 * math.abs(v37 / 2 / l_Unit_0.Y) else l_Unit_0 * math.abs(v36 / 2 / l_Unit_0.X);
            v45 = l_X_0 / 2 + v52.X;
            v46 = l_Y_0 / 2 - v52.Y;
            local v53 = (not ((v30.UI.IconImage.Rotation + 15) % 360 >= 15) or (v30.UI.IconImage.Rotation - 15) % 360 > 345) and 1 or 0.25;
            local l_IconImage_0 = v30.UI.IconImage;
            local l_Rotation_0 = v30.UI.IconImage.Rotation;
            l_IconImage_0.Rotation = l_Rotation_0 + (math.deg(v51 + 3.141592653589793) - l_Rotation_0) * v53;
        end;
        v31 = v31 + v32;
        v30.UI.IconImage.Distance.Text = ("%*m"):format((math.ceil((workspace.CurrentCamera.CFrame.Position - v42).Magnitude)));
        v30.UI.IconImage.Distance.Rotation = -v30.UI.IconImage.Rotation;
        v30.UI.Position = UDim2.fromOffset(v45, v46) + v47;
    end);
end;
v5.Destroy = function(v56) --[[ Line: 205 ]] --[[ Name: Destroy ]]
    v56.RunService:Disconnect();
    v56.RunService = nil;
    v56.UI:Destroy();
    v56.Part:Destroy();
    setmetatable(v56, nil);
end;
return v5;