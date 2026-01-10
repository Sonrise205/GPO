local l_RunService_0 = game:GetService("RunService");
local l_Phoenix_0 = game.ReplicatedStorage.Refrences.Phoenix;
local v2 = require(script.Parent.Parent.Modules.Slash);
local v3 = require(game.ReplicatedStorage.Util.Misc);
local v4 = require(l_Phoenix_0.Modules.Trail);
local l_CurrentCamera_0 = workspace.CurrentCamera;
return function(v6, v7, v8, v9) --[[ Line: 10 ]]
    -- upvalues: l_CurrentCamera_0 (copy), v3 (copy), l_Phoenix_0 (copy), v4 (copy), v2 (copy), l_RunService_0 (copy)
    local v10 = v7 or 10;
    local v11 = v8 or 1;
    local function _(v12, v13) --[[ Line: 16 ]] --[[ Name: CanRender ]]
        -- upvalues: l_CurrentCamera_0 (ref), v10 (copy)
        local v14 = v12 or Vector3.new();
        local v15 = v13 or 7;
        return (l_CurrentCamera_0.CFrame.p - v14).Magnitude < v15 * 5 + v10 * v15;
    end;
    if v9 then
        local v17 = math.max(0.6, v11);
        local _ = v3.PlaySound(v6, l_Phoenix_0.Sounds["Audio/PhoUltFinalWhoosh"], {
            PlaybackSpeed = 1 / v17
        });
    else
        local v19 = math.max(0.6, v11);
        local _ = v3.PlaySound(v6, l_Phoenix_0.Sounds["Audio/PhoUltWhoosh1"], {
            PlaybackSpeed = 1 / v19
        });
    end;
    v4.new({
        Anchor = v6, 
        Scale = v10 * 0.4, 
        Lifetime = v11 * (v9 and 1.5 or 1.25)
    }):Emit();
    local v21 = v6.Position - Vector3.new(0, 0, 1, 0);
    local l_v21_0 = v21;
    local v23 = nil;
    local v24 = 0.016666666666666666;
    while true do
        local v25 = tick();
        if not v23 then
            v23 = v25;
        end;
        if v6 and v6.Parent then
            local v26 = math.min(1, (v25 - v23) / v11);
            local l_Position_0 = v6.Position;
            v21 = v21:Lerp(l_Position_0, v24 * 8);
            local v28 = CFrame.new(l_Position_0, v21);
            local v29 = v28.p or Vector3.new();
            if (l_CurrentCamera_0.CFrame.p - v29).Magnitude < 25 + v10 * 5 and (v28.p - l_v21_0).Magnitude > v10 * 0.25 then
                if v9 then
                    v2.new(5, {
                        CFrame = v28 * CFrame.Angles(1.5707963267948966, 0, 0), 
                        Scale = v10, 
                        Accent = Color3.fromRGB(255, 170, 0), 
                        Offset = CFrame.new(0, -v10, 0), 
                        Color = Color3.fromRGB(0, 170, 255), 
                        Transparency = 0.3, 
                        Duration = 0.5, 
                        RotationDirection = 2
                    }):Emit();
                    for v30 = 1, 3 do
                        v2.new(math.random(1, 3), {
                            CFrame = v28 * CFrame.Angles(-1.5707963267948966, 0, 0), 
                            Scale = v10 * (v30 / 3), 
                            Offset = CFrame.new(0, v10 * (v30 / 3), 0), 
                            Color = Color3.fromRGB(255, 170, 0), 
                            Transparency = 0.01, 
                            Duration = 0.4, 
                            RotationDirection = 2
                        }):Emit();
                    end;
                end;
                l_v21_0 = v28.p;
            end;
            if v26 ~= 1 then
                l_RunService_0.RenderStepped:Wait();
                v24 = tick() - v25;
            else
                break;
            end;
        else
            break;
        end;
    end;
end;