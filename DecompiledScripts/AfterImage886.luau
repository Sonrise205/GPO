local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_RunService_0 = game:GetService("RunService");
local _ = require(l_ReplicatedStorage_0.Modules.MaidClass);
local l_Effects_0 = workspace.Effects;
local v4 = {};
v4.__index = v4;
v4.new = function(v5) --[[ Line: 10 ]] --[[ Name: new ]]
    -- upvalues: v4 (copy), l_Effects_0 (copy)
    local v6 = setmetatable({}, v4);
    v6.Positions = v5.Positions;
    v6.Index = 1;
    v6.Duration = v5.Duration;
    v6.Start = v5.Start;
    v6.Model = script.AfterImageClone:Clone();
    v6.Model:ScaleTo(v5.Scale);
    v6.Model.Parent = l_Effects_0;
    v6.Fade = v5.Fade;
    v6.Transparency = v5.Transparency;
    local l_Character_0 = v5.Character;
    for _, v9 in pairs(v6.Model:GetChildren()) do
        v9.Transparency = v5.Transparency;
        v9.Material = v5.Material;
        v9.Color = v5.Colour;
        local l_l_Character_0_FirstChild_0 = l_Character_0:FindFirstChild(v9.Name);
        if l_l_Character_0_FirstChild_0 then
            v9.Size = l_l_Character_0_FirstChild_0.Size;
        end;
    end;
    return v6;
end;
v4.Update = function(v11) --[[ Line: 38 ]] --[[ Name: Update ]]
    local v12 = (tick() - v11.Start) / v11.Duration;
    local v13 = v11.Transparency + (v11.Fade and (1 - v11.Transparency) * v12 or 0);
    for _, v15 in pairs(v11.Model:GetChildren()) do
        v15.CFrame = v11.Positions[v11.Index][v15.Name];
        v15.Transparency = v13;
    end;
    v11.Index = v11.Index + 1;
end;
v4.Destroy = function(v16) --[[ Line: 48 ]] --[[ Name: Destroy ]]
    v16.Model:Destroy();
    setmetatable(v16, nil);
    v16 = nil;
end;
return {
    start = function(_, v18) --[[ Line: 56 ]] --[[ Name: start ]]
        -- upvalues: l_RunService_0 (copy), v4 (copy)
        local l_Character_1 = v18.Character;
        if l_Character_1 == nil then
            return;
        elseif l_Character_1:FindFirstChild("LeftHand") == nil or _G.checkRenderDistance(l_Character_1.PrimaryPart.Position) == false then
            return;
        else
            local l_Duration_0 = v18.Duration;
            local l_Fade_0 = v18.Fade;
            local v22 = v18.Colour or Color3.new(1, 1, 1);
            local _ = v18.Transparency or 0.75;
            local v24 = v18.Material or Enum.Material.SmoothPlastic;
            local v25 = 0;
            local l_MaxClones_0 = v18.MaxClones;
            local v27 = {};
            local v28 = {};
            local v29 = tick();
            local v30 = tick();
            local _ = tick();
            local v32 = nil;
            v32 = l_RunService_0.Heartbeat:Connect(function(_) --[[ Line: 81 ]]
                -- upvalues: v30 (copy), l_Duration_0 (copy), v32 (ref), v27 (copy), l_Character_1 (copy), v28 (copy), v25 (ref), l_MaxClones_0 (copy), v29 (ref), v18 (copy), v4 (ref), v22 (copy), l_Fade_0 (copy), v24 (copy)
                if tick() - v30 >= l_Duration_0 then
                    v32:Disconnect();
                    for _, v35 in pairs(v27) do
                        v35:Destroy();
                    end;
                    return;
                else
                    local v36 = {};
                    for _, v38 in pairs(script.AfterImageClone:GetChildren()) do
                        if l_Character_1:FindFirstChild(v38.Name) then
                            v36[v38.Name] = l_Character_1[v38.Name].CFrame;
                        end;
                    end;
                    table.insert(v28, v36);
                    for _, v40 in pairs(v27) do
                        v40:Update();
                    end;
                    if l_MaxClones_0 <= v25 then
                        return;
                    elseif tick() - v29 <= v18.Interval then
                        return;
                    else
                        v25 = v25 + 1;
                        v29 = tick();
                        table.insert(v27, v4.new({
                            Colour = v22, 
                            Positions = v28, 
                            Transparency = l_Fade_0 and (1 - v18.Transparency) * (v25 / l_MaxClones_0) + v18.Transparency or v18.Transparency, 
                            Material = v24, 
                            Duration = l_Duration_0, 
                            Start = v30, 
                            Fade = l_Fade_0, 
                            Scale = l_Character_1:GetScale() or 1, 
                            Character = l_Character_1
                        }));
                        return;
                    end;
                end;
            end);
            return;
        end;
    end
};