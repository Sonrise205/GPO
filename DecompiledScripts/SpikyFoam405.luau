local l_RunService_0 = game:GetService("RunService");
local l_Fishman_0 = game.ReplicatedStorage.Refrences.Fishman;
local v2 = require(game:GetService("ReplicatedStorage"):WaitForChild("Util").Tween);
local l_Effects_0 = workspace:WaitForChild("Effects");
local l_CurrentCamera_0 = workspace.CurrentCamera;
local v5 = {};
l_RunService_0:BindToRenderStep(script.Parent.Name .. "-" .. script.Name, Enum.RenderPriority.Last.Value - 1000, function(v6) --[[ Line: 10 ]]
    -- upvalues: l_CurrentCamera_0 (copy), v5 (copy), v2 (copy)
    local v7 = tick();
    local v8 = 0;
    local l_LookVector_0 = l_CurrentCamera_0.CFrame.LookVector;
    for v10, v11 in next, v5 do
        if v8 > 0 then
            v11 = v5[v10 - v8];
        end;
        local v12 = v7 - v11.Start;
        local v13 = (CFrame.new(Vector3.new(), l_LookVector_0) + v11.CFrame.p) * (v11.CFrame - v11.CFrame.p);
        do
            local l_v11_0 = v11;
            if l_v11_0.FadeIn + l_v11_0.FadeOut + l_v11_0.Lifetime < v12 then
                spawn(function() --[[ Line: 22 ]]
                    -- upvalues: l_v11_0 (ref)
                    l_v11_0:Destroy();
                end);
                table.remove(v5, v10 - v8);
                v8 = v8 + 1;
            elseif l_v11_0.FadeIn + l_v11_0.Lifetime < v12 then
                local v15 = (v12 - l_v11_0.FadeIn - l_v11_0.Lifetime) / l_v11_0.FadeOut;
                local v16 = v2.ease.out.sine(v15, 0, 1, 1);
                local v17 = v2.ease["in"].back(v15, 1, -1, 1);
                for v18, v19 in next, l_v11_0.Data do
                    v19.Angle = (v19.Angle or 0) + 1.5707963267948966 * l_v11_0.Speed * v6 % 6.283185307179586;
                    local v20 = v18 % 2 == 0 and math.cos(v19.Angle) or math.sin(v19.Angle);
                    local v21 = v18 % 2 == 0 and math.sin(v19.Angle) or math.cos(v19.Angle);
                    local v22 = CFrame.new(Vector3.new(), v19.Rotation:Lerp(Vector3.new(0, 1, 0, 0), v16));
                    v19.Part.CFrame = v13 * v22;
                    v19.Attachment.Position = v19.Offset * (l_v11_0.Scale + l_v11_0.Scale * 0.5 * v20) * v17;
                    v19.Beam.Width0 = v19.Unit.X * (l_v11_0.Scale + l_v11_0.Scale * 1 - l_v11_0.Scale * 0.25 * v20) * v17;
                    v19.Beam.Width1 = v19.Unit.Y * (l_v11_0.Scale + l_v11_0.Scale * 1 - l_v11_0.Scale * 0.25 * v21) * (1 + v16);
                    v19.Beam.Transparency = NumberSequence.new(v2.point(l_v11_0.Transparency, 1, v16));
                end;
            elseif l_v11_0.FadeIn < v12 then
                local _ = (v12 - l_v11_0.FadeIn) / l_v11_0.Lifetime;
                for v24, v25 in next, l_v11_0.Data do
                    v25.Angle = (v25.Angle or 0) + 1.5707963267948966 * l_v11_0.Speed * v6 % 6.283185307179586;
                    local v26 = v24 % 2 == 0 and math.cos(v25.Angle) or math.sin(v25.Angle);
                    local v27 = v24 % 2 == 0 and math.sin(v25.Angle) or math.cos(v25.Angle);
                    local v28 = CFrame.new(Vector3.new(), v25.Rotation);
                    v25.Part.CFrame = v13 * v28;
                    v25.Attachment.Position = v25.Offset * (l_v11_0.Scale + l_v11_0.Scale * 0.5 * v26);
                    v25.Beam.Width0 = v25.Unit.X * (l_v11_0.Scale + l_v11_0.Scale * 1 - l_v11_0.Scale * 0.25 * v26);
                    v25.Beam.Width1 = v25.Unit.Y * (l_v11_0.Scale + l_v11_0.Scale * 1 - l_v11_0.Scale * 0.25 * v27);
                end;
            else
                local v29 = v12 / l_v11_0.FadeIn;
                local v30 = v2.ease.out.quad(v29, 0, 1, 1);
                local v31 = v2.ease.out.sine(v29, 0, 1, 1);
                local v32 = v2.ease["in"].quint(v29, 0, 1, 1);
                for v33, v34 in next, l_v11_0.Data do
                    v34.Angle = (v34.Angle or 0) + 1.5707963267948966 * l_v11_0.Speed * v6 % 6.283185307179586;
                    local v35 = v33 % 2 == 0 and math.cos(v34.Angle) or math.sin(v34.Angle);
                    local v36 = v33 % 2 == 0 and math.sin(v34.Angle) or math.cos(v34.Angle);
                    local v37 = CFrame.new(Vector3.new(), Vector3.new(0, 1, 0, 0):Lerp(v34.Rotation, v31));
                    v34.Part.CFrame = v13 * CFrame.new(0, -l_v11_0.Scale + l_v11_0.Scale * v30, 0) * v37;
                    v34.Attachment.Position = v34.Offset * (l_v11_0.Scale + l_v11_0.Scale * 0.5 * v35) * v31;
                    v34.Beam.Width0 = v34.Unit.X * (l_v11_0.Scale + l_v11_0.Scale * 1 - l_v11_0.Scale * 0.25 * v35) * v31;
                    v34.Beam.Width1 = v34.Unit.Y * (l_v11_0.Scale + l_v11_0.Scale * 1 - l_v11_0.Scale * 0.25 * v36) * v31;
                    v34.Beam.Transparency = NumberSequence.new(v2.point(1, l_v11_0.Transparency, v32));
                end;
            end;
        end;
    end;
end);
local v38 = {};
v38.new = function(v39) --[[ Line: 86 ]] --[[ Name: new ]]
    -- upvalues: v38 (copy)
    v39 = v39 or {};
    return setmetatable({
        CFrame = v39.CFrame or CFrame.new(), 
        Scale = v39.Scale or 1, 
        FadeIn = v39.FadeIn or 0.5, 
        FadeOut = v39.FadeOut or 0.5, 
        Lifetime = v39.Lifetime or 1, 
        Speed = v39.Speed or 2, 
        Transparency = v39.Transparency or 0.25, 
        Color = v39.Color or Color3.new(1, 1, 1)
    }, {
        __index = v38
    }):__init();
end;
v38.__init = function(v40) --[[ Line: 101 ]] --[[ Name: __init ]]
    -- upvalues: l_Fishman_0 (copy), l_Effects_0 (copy), v5 (copy)
    if v40.Reference then
        return;
    else
        v40.Reference = l_Fishman_0.Assets.SpikyFoam:Clone();
        v40.Reference:PivotTo(v40.CFrame);
        v40.Reference.Parent = l_Effects_0;
        v40.Data = {};
        for _, v42 in next, v40.Reference:GetChildren() do
            if v42 ~= v40.Reference.PrimaryPart then
                table.insert(v40.Data, {
                    Part = v42, 
                    Rotation = v42.CFrame.LookVector, 
                    Beam = v42.AuraSpike, 
                    Attachment = v42.Attachment, 
                    Origin = v42.Origin, 
                    Offset = v42.Attachment.Position / 12, 
                    Unit = Vector2.new(v42.AuraSpike.Width0, v42.AuraSpike.Width1) / 12
                });
            end;
        end;
        for _, v44 in next, v40.Data do
            v44.Part.CFrame = v40.CFrame;
            v44.Attachment.Position = v44.Offset * 0;
            v44.Beam.Width0 = v44.Unit.X * 0;
            v44.Beam.Width1 = v44.Unit.Y * 0;
            v44.Beam.Transparency = NumberSequence.new(1);
            v44.Beam.Color = ColorSequence.new(v40.Color:Lerp(Color3.new(1, 1, 1), 0.5), v40.Color);
        end;
        v40.Start = tick();
        table.insert(v5, v40);
        return v40;
    end;
end;
v38.Destroy = function(v45) --[[ Line: 141 ]] --[[ Name: Destroy ]]
    v45.Reference:Destroy();
end;
return v38;