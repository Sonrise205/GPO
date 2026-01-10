local l_RunService_0 = game:GetService("RunService");
local l_Fishman_0 = game.ReplicatedStorage.Refrences.Fishman;
local v2 = require(game:GetService("ReplicatedStorage"):WaitForChild("Util").Tween);
local v3 = require(game:GetService("ReplicatedStorage"):WaitForChild("Util").Spring);
local l_Effects_0 = workspace:WaitForChild("Effects");
local l_CurrentCamera_0 = workspace.CurrentCamera;
local v6 = {};
l_RunService_0:BindToRenderStep(script.Parent.Name .. "-" .. script.Name, Enum.RenderPriority.Last.Value - 1000, function(v7) --[[ Line: 11 ]]
    -- upvalues: l_CurrentCamera_0 (copy), v6 (copy), v2 (copy)
    local v8 = tick();
    local v9 = 0;
    local _ = l_CurrentCamera_0.CFrame.LookVector;
    for v11, v12 in next, v6 do
        if v9 > 0 then
            v12 = v6[v11 - v9];
        end;
        local v13 = v8 - v12.Start;
        do
            local l_v12_0 = v12;
            if l_v12_0.FadeIn + l_v12_0.FadeOut + l_v12_0.Lifetime < v13 then
                spawn(function() --[[ Line: 22 ]]
                    -- upvalues: l_v12_0 (ref)
                    l_v12_0:Destroy();
                end);
                table.remove(v6, v11 - v9);
                v9 = v9 + 1;
            else
                local v15 = 1;
                local v16 = 1;
                if l_v12_0.FadeIn + l_v12_0.Lifetime < v13 then
                    local v17 = (v13 - l_v12_0.FadeIn - l_v12_0.Lifetime) / l_v12_0.FadeOut;
                    local _ = v2.ease["in"].sine(v17, 1, -1, 1);
                    local v19 = v2.ease.inout.quad(v17, 0, 1, 1);
                    v15 = 1;
                    v16 = v2.point(l_v12_0.Transparency, 1, v19);
                elseif l_v12_0.FadeIn < v13 then
                    local _ = (v13 - l_v12_0.FadeIn) / l_v12_0.Lifetime;
                    v16 = l_v12_0.Transparency;
                else
                    local v21 = v13 / l_v12_0.FadeIn;
                    local v22 = v2.ease.out.quad(v21, 0, 1, 1);
                    v15 = v22;
                    v16 = v2.point(1, l_v12_0.Transparency, v22);
                end;
                local v23 = l_v12_0.CFrame.p - l_v12_0.Reference.CFrame.p;
                local v24 = v23.Magnitude > 0.01 and v23 or Vector3.new();
                l_v12_0.Spring:SetGoal(v24 + Vector3.new(math.cos(v8), (math.sin(v8))) * l_v12_0.Scale.Magnitude / 2);
                l_v12_0.Spring2:SetGoal(l_v12_0.Scale.X * v15);
                v24 = l_v12_0.Spring:GetPosition();
                local l_Position_0 = l_v12_0.Spring2:GetPosition();
                local v26 = v24.Magnitude * 0.41421356237309503 * 2;
                l_v12_0.Reference.Beam.CurveSize0 = v26;
                l_v12_0.Reference.Beam.CurveSize1 = -v26;
                l_v12_0.Reference.Beam.Width0 = l_Position_0;
                l_v12_0.Reference.Attachment.Position = Vector3.new(0, 1, 0, 0) * l_v12_0.Scale.Y * v15 + v24;
                l_v12_0.Reference.Beam.Transparency = NumberSequence.new(v16);
                l_v12_0.Spring:Update(v7);
                l_v12_0.Spring2:Update(v7);
                l_v12_0.CFrame = l_v12_0.CFrame:Lerp(l_v12_0.Reference.CFrame, v7 * 12);
            end;
        end;
    end;
end);
local v27 = {};
v27.new = function(v28) --[[ Line: 77 ]] --[[ Name: new ]]
    -- upvalues: v27 (copy)
    return setmetatable({
        CFrame = v28.CFrame or CFrame.new(), 
        Scale = v28.Scale or Vector2.new(1, 2), 
        FadeIn = v28.FadeIn or 0.5, 
        Lifetime = v28.Lifetime or 2, 
        FadeOut = v28.FadeOut or 0.5, 
        Transparency = v28.Transparency or 0.5
    }, {
        __index = v27
    }):__init();
end;
v27.__init = function(v29) --[[ Line: 88 ]] --[[ Name: __init ]]
    -- upvalues: v3 (copy), l_Fishman_0 (copy), l_Effects_0 (copy), v6 (copy)
    if v29.Reference then
        return v29;
    else
        v29.Spring = v3.new(0.25, 2, (Vector3.new()));
        v29.Spring2 = v3.new(0.25, 2, 0);
        v29.Reference = l_Fishman_0.Assets.Strand:Clone();
        v29.Reference.Attachment.Position = Vector3.new();
        v29.Reference.Beam.Width0 = 0;
        v29.Reference.Beam.Transparency = NumberSequence.new(1);
        v29.Reference.CFrame = v29.CFrame;
        v29.Reference.Parent = l_Effects_0;
        v29.Reference.Beam.Enabled = true;
        v29.Start = tick();
        table.insert(v6, v29);
        return v29;
    end;
end;
v27.Destroy = function(v30) --[[ Line: 112 ]] --[[ Name: Destroy ]]
    v30.Reference:Destroy();
end;
return v27;