local l_TweenService_0 = game:GetService("TweenService");
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local v2 = require(l_ReplicatedStorage_0.Modules.ObjectCache);
local v3 = v2.new(script.Part, 200, workspace.Effects);
local v4 = v2.new(script.DustShockwave2, 50, workspace.Effects);
local function v9(v5, v6, _) --[[ Line: 8 ]] --[[ Name: Raycast ]]
    local v8 = RaycastParams.new();
    v8.FilterDescendantsInstances = {
        workspace.Islands, 
        workspace.Env, 
        workspace.Ships
    };
    v8.FilterType = Enum.RaycastFilterType.Include;
    return workspace:Raycast(v5, v6, v8);
end;
return {
    start = function(_, v11) --[[ Line: 17 ]] --[[ Name: start ]]
        -- upvalues: v9 (copy), v4 (copy), v3 (copy), l_TweenService_0 (copy)
        if _G.checkRenderDistance(v11.Position) == false then
            return;
        else
            local v12 = Random.new();
            local l_Position_0 = v11.Position;
            local l_Direction_0 = v11.Direction;
            local v15 = v11.DistanceRandomness or 1;
            local l_Duration_0 = v11.Duration;
            local l_Segments_0 = v11.Segments;
            local l_Radius_0 = v11.Radius;
            local l_TweenDuration_0 = v11.TweenDuration;
            local v20 = v11.IgnoreList or {};
            local v21 = v11.Angle or -0.8726646259971648;
            local v22 = v9(l_Position_0, l_Direction_0, v20);
            if not v22 then
                return;
            else
                if v11.Smoke ~= nil and v22.Instance ~= nil then
                    local l_v4_Part_0 = v4:GetPart(CFrame.new(v22.Position, v22.Position + v22.Normal) * CFrame.Angles(1.5707963267948966, 0, 0));
                    l_v4_Part_0.Transparency = 1;
                    l_v4_Part_0.CanCollide = false;
                    l_v4_Part_0.Anchored = true;
                    l_v4_Part_0.Smoke2.Color = ColorSequence.new(v22.Instance.Color);
                    l_v4_Part_0.Smoke2.Size = NumberSequence.new(l_Radius_0 * 0.6, l_Radius_0);
                    l_v4_Part_0.Size = Vector3.new(l_Radius_0, 1, l_Radius_0);
                    _G.customEmit(l_v4_Part_0);
                    task.delay(5, function() --[[ Line: 49 ]]
                        -- upvalues: v4 (ref), l_v4_Part_0 (copy)
                        v4:ReturnPart(l_v4_Part_0);
                    end);
                end;
                for v24 = 1, l_Segments_0 do
                    local v25 = l_Radius_0 * v12:NextNumber(v15.X, v15.Y);
                    local v26 = CFrame.new(v22.Position, v22.Position + v22.Normal) * CFrame.new(math.sin(6.283185307179586 * v24 / l_Segments_0) * v25, math.cos(6.283185307179586 * v24 / l_Segments_0) * v25, -5).Position;
                    local v27 = v9(v26, v22.Normal * -(6 + l_Radius_0), v20);
                    if v27 then
                        local v28 = Vector3.new(2 * v12:NextNumber(0.5, 1) * math.sin(1 / l_Segments_0 * 2 * 3.141592653589793) * v25, 5, 0.5 * v25 * v12:NextNumber(0.75, 1.5));
                        local v29 = CFrame.lookAt(v27.Position, v22.Position, v27.Normal) * CFrame.Angles(v21 * v25 / l_Radius_0, 0, 0) - v22.Normal * v28.Y / 2;
                        local l_v3_Part_0 = v3:GetPart(v29);
                        l_v3_Part_0.Transparency = 0;
                        l_v3_Part_0.CanCollide = false;
                        l_v3_Part_0.Anchored = true;
                        l_v3_Part_0.Size = v28;
                        _G.matchMaterial(l_v3_Part_0, v27.Instance);
                        local v31 = v29.Position + v22.Normal * -(v28.Magnitude / 2);
                        task.delay(l_Duration_0 * v12:NextNumber(0.65, 1.25), function() --[[ Line: 76 ]]
                            -- upvalues: l_TweenService_0 (ref), l_v3_Part_0 (copy), l_TweenDuration_0 (copy), v31 (copy), v3 (ref)
                            l_TweenService_0:Create(l_v3_Part_0, TweenInfo.new(l_TweenDuration_0, Enum.EasingStyle.Linear), {
                                Position = v31
                            }):Play();
                            task.delay(l_TweenDuration_0 + 0.05, function() --[[ Line: 85 ]]
                                -- upvalues: v3 (ref), l_v3_Part_0 (ref)
                                v3:ReturnPart(l_v3_Part_0);
                            end);
                        end);
                    end;
                end;
                return;
            end;
        end;
    end
};