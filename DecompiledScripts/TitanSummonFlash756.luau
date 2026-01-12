local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local v1 = {};
local v2 = require(l_ReplicatedStorage_0.Modules.VFXUtility.highlight_emit);
local function v10(v3, v4, v5, _, _) --[[ Line: 6 ]] --[[ Name: flash ]]
    local v8 = {
        PulseSpeed = 6, 
        AnimationSpeed = 35, 
        PulseLength = 5, 
        FadeLength = 0.1, 
        Thickness = v4, 
        Color = BrickColor.new("Neon orange").Color, 
        Frequency = 3, 
        MinThicknessMultiplier = 0.5, 
        MaxThicknessMultiplier = 4, 
        MinRadius = 15 * v4, 
        MaxRadius = 35 * v4, 
        ContractFrom = 0.4
    };
    local v9 = {
        MaxDistance = v5, 
        MinDistance = v5 / 3, 
        MaxSparkCount = 5, 
        MaxSpeed = 5
    };
    _G.PlayEffect("LightningV2", nil, CFrame.new((v3.HumanoidRootPart.CFrame * CFrame.new(0, 1000, 0)).p), v3.Head, v8, 15, v9);
end;
local function v18(v11, v12, v13, v14, v15) --[[ Line: 33 ]] --[[ Name: flash2 ]]
    local v16 = {
        PulseSpeed = 6, 
        AnimationSpeed = 35, 
        PulseLength = 5, 
        FadeLength = 0.1, 
        Thickness = v12, 
        Color = BrickColor.new("Neon orange").Color, 
        Frequency = 4, 
        MinThicknessMultiplier = 0.1, 
        MaxThicknessMultiplier = 3, 
        MinRadius = v15 * 2, 
        MaxRadius = v15 * 4, 
        ContractFrom = 0.1
    };
    local v17 = {
        MaxDistance = v13, 
        MinDistance = v13 / 3, 
        MaxSparkCount = 5, 
        MaxSpeed = 5
    };
    _G.PlayEffect("LightningV2", nil, v11.HumanoidRootPart.CFrame * CFrame.new(0, -v14, 0), v11.Head, v16, 15, v17);
end;
v1.start = function(_, v20) --[[ Line: 59 ]] --[[ Name: start ]]
    -- upvalues: v10 (copy), v18 (copy), v2 (copy)
    local v21 = v20.scale or 40;
    local v22 = v20.height or 200;
    local v23 = v20.big or 600;
    local v24 = v20.thick or 1;
    local l_startTime_0 = v20.startTime;
    local l_char_0 = v20.char;
    local l_charPosition_0 = v20.charPosition;
    local v28 = l_startTime_0 - workspace:GetServerTimeNow();
    v10(l_char_0, v24, v23, v22, v21);
    v18(l_char_0, v24, v23, v22, v21);
    task.wait(v28);
    v2.tweenHighlight(l_char_0, Color3.fromRGB(255, 128, 17), Color3.fromRGB(255, 128, 17), 0.25, Enum.HighlightDepthMode.Occluded, "Out", 0.25);
    pcall(function() --[[ Line: 85 ]]
        -- upvalues: l_charPosition_0 (copy), v24 (copy), v23 (copy)
        local v29 = script.Part:Clone();
        v29.CFrame = CFrame.new(l_charPosition_0);
        v29.Mesh.Scale = Vector3.new(65 * v24, 10000, 65 * v24);
        v29.Parent = workspace.Effects;
        _G.tween(v29.Mesh, {
            0.1, 
            "EntranceProductive", 
            Enum.EasingDirection.Out, 
            0, 
            false, 
            0
        }, {
            Scale = Vector3.new(0, 10000, 0, 0)
        });
        _G.tween(v29.PointLight, {
            0.1, 
            "EntranceProductive", 
            Enum.EasingDirection.Out, 
            0, 
            false, 
            0
        }, {
            Range = 500, 
            Brightness = 0
        });
        _G.destroy(v29, 0.2);
        local v30 = script.Part2:Clone();
        v30.CFrame = CFrame.new(l_charPosition_0);
        v30.Mesh.Scale = Vector3.new(v23, v23, v23) / 2;
        v30.Parent = workspace.Effects;
        local l_v23_0 = v23;
        _G.tween(v30.Mesh, {
            0.25, 
            "EntranceProductive", 
            Enum.EasingDirection.Out, 
            0, 
            false, 
            0
        }, {
            Scale = Vector3.new(l_v23_0, l_v23_0, l_v23_0)
        });
        _G.tween(v30, {
            0.25, 
            "EntranceProductive", 
            Enum.EasingDirection.Out, 
            0, 
            false, 
            0
        }, {
            Transparency = 1
        });
        _G.destroy(v30, 0.25);
    end);
end;
return v1;