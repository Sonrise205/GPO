local l_RunService_0 = game:GetService("RunService");
local l_Fishman_0 = game.ReplicatedStorage.Refrences.Fishman;
local v2 = require(game:GetService("ReplicatedStorage"):WaitForChild("Util").Tween);
local _ = require(game:GetService("ReplicatedStorage"):WaitForChild("Util").Misc);
local v4 = require(game:GetService("ReplicatedStorage"):WaitForChild("Util").Spring);
local l_Effects_0 = workspace:WaitForChild("Effects");
local v6 = require(l_Fishman_0.Effects.Portal);
local v7 = {};
l_RunService_0:BindToRenderStep(script.Parent.Name .. "-" .. script.Name, Enum.RenderPriority.Last.Value - 1000, function(v8) --[[ Line: 11 ]]
    -- upvalues: v7 (copy), v2 (copy)
    local v9 = tick();
    local v10 = 0;
    for v11, v12 in next, v7 do
        if v10 > 0 then
            v12 = v7[v11 - v10];
        end;
        local v13 = v9 - v12.Start;
        if not v12.Reference.Parent or v12.Splatted or v12.FadeIn + v12.FadeOut + v12.Lifetime < v13 then
            v12:Destroy();
            table.remove(v7, v11 - v10);
            v10 = v10 + 1;
        else
            local v14 = 1;
            local v15 = 1;
            if v12.FadeIn + v12.Lifetime < v13 then
                local v16 = (v13 - v12.FadeIn - v12.Lifetime) / v12.FadeOut;
                local v17 = v2.ease["in"].sine(v16, 1, -1, 1);
                local v18 = v2.ease.inout.quad(v16, 0, 1, 1);
                v14 = v17;
                v15 = v2.point(v12.Transparency, 1, v18);
            elseif v12.FadeIn < v13 then
                local _ = (v13 - v12.FadeIn) / v12.Lifetime;
                v15 = v12.Transparency;
            else
                local v20 = v13 / v12.FadeIn;
                local v21 = v2.ease.out.quad(v20, 0, 1, 1);
                v14 = v21;
                v15 = v2.point(1, v12.Transparency, v21);
                if v20 < 0.25 then

                end;
            end;
            v12.CFrame = v12.Reference.CFrame;
            local v22 = v12.LastCFrame:Lerp(v12.CFrame, v8 * 12);
            local v23 = v12.CFrame.p - v12.LastCFrame.p;
            v12.Spring:SetGoal(v23.Magnitude);
            local l_Position_0 = v12.Spring:GetPosition();
            v12.Part.Size = Vector3.new(1, 1, 1, 0) * v14 + Vector3.new(l_Position_0, l_Position_0, l_Position_0) * v14 * v12.Scale * 0.075;
            v12.Part.Transparency = v15;
            v12.Part.CFrame = v22 * CFrame.new(Vector3.new(), v12.Reference.RotVelocity.Magnitude > 0.01 and v12.Reference.RotVelocity.Unit or Vector3.new(0, 1, 0, 0));
            v12.Spring:Update(v8);
            v12.LastCFrame = v12.Part.CFrame;
            v12.LastVelocity = v12.LastCFrame.p - v12.CFrame.p;
            if v12.FadeIn < v13 and v23.Y < 0 and not v12.Splatted then
                local v25 = Ray.new(v22.p - v23.Unit * 0.5, v23.Unit * v12.Scale * 0.75 + v23.Unit * 0.5);
                local v26, v27, v28 = _G.raycastWhitelist(v25, {
                    workspace.Islands, 
                    workspace.Env, 
                    workspace.Ships
                });
                if v26 then
                    v12:Splat(CFrame.new(v27, v27 + v28) * CFrame.Angles(-1.5707963267948966, 0, 0));
                end;
            end;
        end;
    end;
end);
local v29 = {};
v29.new = function(v30, v31) --[[ Line: 85 ]] --[[ Name: new ]]
    -- upvalues: v29 (copy)
    local v32 = {
        Reference = v30
    };
    v32.CFrame = v31.CFrame or v32.Reference.CFrame;
    v32.Scale = v31.Scale or Vector2.new(1, 2);
    v32.FadeIn = v31.FadeIn or 0.3;
    v32.Lifetime = v31.Lifetime or 2;
    v32.FadeOut = v31.FadeOut or 0.75;
    v32.Transparency = v31.Transparency or 0.55;
    v32.Velocity = v30.Velocity;
    return setmetatable(v32, {
        __index = v29
    }):__init();
end;
v29.__init = function(v33) --[[ Line: 99 ]] --[[ Name: __init ]]
    -- upvalues: v4 (copy), l_Fishman_0 (copy), l_Effects_0 (copy), v7 (copy)
    if v33.Part then
        return v33;
    else
        v33.LastVelocity = v33.Velocity;
        v33.LastCFrame = v33.CFrame;
        v33.Spring = v4.new(0.5, 2, 1);
        v33.Part = l_Fishman_0.Assets.WaterBlob:Clone();
        v33.Part.Size = Vector3.new(0, 0, 0, 0);
        v33.Part.Transparency = v33.Transparency;
        v33.Mass = v33.Part:GetMass();
        v33.Part.A.Position = Vector3.new(0, 0, -0.5, 0) * v33.Scale;
        v33.Part.B.Position = Vector3.new(0, 0, 0.5, 0) * v33.Scale;
        v33.Part.CFrame = v33.CFrame;
        v33.Part.Anchored = true;
        v33.Part.Parent = l_Effects_0;
        local v34 = script.MiniWaterBallFall:Clone();
        v34.Parent = v33.Part.A;
        v34:Play();
        v33.SoundLoop = v34;
        v33.Start = tick();
        table.insert(v7, v33);
        return v33;
    end;
end;
v29.Splat = function(v35, v36) --[[ Line: 139 ]] --[[ Name: Splat ]]
    -- upvalues: v6 (copy)
    v35.Splatted = true;
    spawn(function() --[[ Line: 141 ]]
        -- upvalues: v35 (copy), v6 (ref), v36 (copy)
        local _ = tick() - v35.Start;
        v6({
            CFrame = v36 or CFrame.new(v35.LastCFrame.p), 
            FadeIn = v35.FadeIn * 1.125, 
            Lifetime = 0.9, 
            FadeOut = v35.FadeOut, 
            Scale = v35.Scale * 2, 
            Surface = v36, 
            Special2 = true, 
            Shake = false, 
            Small = true
        });
    end);
end;
v29.Destroy = function(v38) --[[ Line: 159 ]] --[[ Name: Destroy ]]
    if not v38.Splatted then
        v38:Splat();
    end;
    spawn(function() --[[ Line: 166 ]]
        -- upvalues: v38 (copy)
        v38.Part.Transparency = 1;
        task.wait(2);
        v38.Part:Destroy();
    end);
end;
return v29;