local v0 = {};
local function v4(v1) --[[ Line: 3 ]] --[[ Name: trans ]]
    local l_v1_Descendants_0 = v1:GetDescendants();
    for v3 = 1, #l_v1_Descendants_0 do
        if l_v1_Descendants_0[v3]:IsA("BasePart") then
            l_v1_Descendants_0[v3].Transparency = 1;
        end;
    end;
end;
local function _(v5, v6, v7) --[[ Line: 12 ]] --[[ Name: lerp ]]
    return v5 + (v6 - v5) * v7;
end;
local v9 = Random.new();
local function _() --[[ Line: 17 ]] --[[ Name: randomColor ]]
    -- upvalues: v9 (copy)
    return Color3.new(v9:NextNumber(), v9:NextNumber(), v9:NextNumber());
end;
local function v20(v11, v12, v13, v14, v15) --[[ Line: 21 ]] --[[ Name: cubicBezierPos ]]
    local v16 = v11 + (v12 - v11) * v15;
    local v17 = v12 + (v13 - v12) * v15;
    local v18 = v13 + (v14 - v13) * v15;
    local v19 = v16 + (v17 - v16) * v15;
    return v19 + (v17 + (v18 - v17) * v15 - v19) * v15;
end;
v0.start = function(_, v22, v23, v24, v25) --[[ Line: 32 ]] --[[ Name: start ]]
    -- upvalues: v9 (copy), v20 (copy), v4 (copy), v0 (copy)
    if _G.fastmode and _G.fastmode == true then
        return;
    elseif _G.checkRenderDistance(v22.p) == false then
        return;
    else
        task.spawn(function() --[[ Line: 39 ]]
            -- upvalues: v25 (copy), v22 (copy), v23 (ref), v9 (ref), v20 (ref), v4 (ref), v24 (copy), v0 (ref)
            local v26 = script.FireworkModels["firework" .. math.random(1, 7)]:Clone();
            if v26.Name == "firework2" and math.random(1, 2) == 1 then
                v26:Destroy();
                v26 = script.FireworkModels.firework1:Clone();
            end;
            if v25 then
                v26:Destroy();
                v26 = script.FireworkModels:FindFirstChild("firework" .. v25):Clone();
            end;
            v26:PivotTo(v22 * CFrame.new(0, v26.PrimaryPart.Size.Y / 2, 0) * CFrame.Angles(0, math.rad((math.random(0, 360))), 0));
            local l_PrimaryPart_0 = v26.PrimaryPart;
            l_PrimaryPart_0.Anchored = true;
            l_PrimaryPart_0.Firework.PointLight.Enabled = false;
            v26.Parent = workspace.Effects;
            if v23 == nil then
                v23 = {
                    min = 50, 
                    max = 100
                };
            end;
            local l_customR_0 = v23.customR;
            local l_hole_0 = v23.hole;
            local v30 = 25;
            if l_customR_0 then
                v30 = l_customR_0;
            end;
            local v31 = math.random(v23.min, v23.max);
            local l_Position_0 = l_PrimaryPart_0.Position;
            local v33 = v22 * CFrame.new(math.random(-v30, v30), v31 * 0.25, math.random(-v30, v30));
            local v34 = v22 * CFrame.new(math.random(-v30, v30), v31 * 0.5, math.random(-v30, v30));
            local v35 = v22 * CFrame.new(math.random(-v30, v30), v31 * 0.7, math.random(-v30, v30));
            v30 = 0;
            local v36 = v22 * CFrame.new(math.random(-v30, v30), v31, math.random(-v30, v30));
            local _ = l_PrimaryPart_0.Position;
            local v38 = 0.05;
            if v23.customInterval ~= nil then
                v38 = v23.customInterval;
            end;
            local v39 = Color3.new(v9:NextNumber(), v9:NextNumber(), v9:NextNumber());
            v26.PriColor.Color = v39;
            local v40 = script.Trail:Clone();
            v40.Attachment0 = l_PrimaryPart_0.Trail1;
            v40.Attachment1 = l_PrimaryPart_0.Trail2;
            v40.Parent = l_PrimaryPart_0;
            local l_l_PrimaryPart_0_Descendants_0 = l_PrimaryPart_0:GetDescendants();
            for v42 = 1, #l_l_PrimaryPart_0_Descendants_0 do
                if l_l_PrimaryPart_0_Descendants_0[v42]:IsA("ParticleEmitter") or l_l_PrimaryPart_0_Descendants_0[v42]:IsA("Trail") then
                    l_l_PrimaryPart_0_Descendants_0[v42].Color = ColorSequence.new(v39);
                elseif l_l_PrimaryPart_0_Descendants_0[v42]:IsA("PointLight") then
                    l_l_PrimaryPart_0_Descendants_0[v42].Color = v39;
                end;
            end;
            if v23.instant ~= nil then
                v38 = 1;
            end;
            local v43 = CFrame.Angles(0, math.rad((math.random(-360, 360))), 0);
            local v44 = {};
            for v45 = 0, v38 + 1, v38 do
                local l_v45_0 = v45;
                if l_v45_0 == v38 then
                    l_v45_0 = 0;
                end;
                v44[l_v45_0] = CFrame.new((v20(l_Position_0, v33.p, v34.p, v35.p, l_v45_0)));
            end;
            if v23.delayTime ~= nil then
                task.wait(v23.delayTime);
            end;
            if l_hole_0 ~= nil then
                local v47 = script.Hole.Attachment:Clone();
                v47.Burst.Color = ColorSequence.new(v39);
                v47.Parent = l_hole_0;
                v47.WorldCFrame = CFrame.new(l_hole_0.Position, v44[v38 * 2].Position) * CFrame.new(0, 0, -l_hole_0.Size.Y / 2) * CFrame.Angles(-1.5707963267948966, 0, 0);
                _G.customEmit(v47);
                _G.destroy(v47, 2);
            end;
            _G.PlaySound(l_PrimaryPart_0, script.Shoots:GetChildren()[math.random(1, #script.Shoots:GetDescendants())]).Parent = l_PrimaryPart_0;
            l_PrimaryPart_0.Firework.PointLight.Enabled = true;
            for v48 = 0, v38 + 1, v38 do
                local l_v48_0 = v48;
                if l_v48_0 == v38 then
                    l_v48_0 = 0;
                end;
                local l_Position_2 = v36.Position;
                if v44[l_v48_0 + v38] ~= nil then
                    l_Position_2 = v44[l_v48_0 + v38].Position;
                end;
                l_PrimaryPart_0.CFrame = CFrame.new(v44[l_v48_0].p, l_Position_2) * CFrame.Angles(-1.5707963267948966, 0, 0) * v43;
                task.wait();
            end;
            local v51 = 125;
            if v25 == "BIG" then
                v51 = 300;
            end;
            local v52 = _G.PlaySound(l_PrimaryPart_0, script.Booms:GetChildren()[math.random(1, #script.Booms:GetDescendants())], {
                RollOffMinDistance = v51
            });
            local v53 = 30;
            if v25 == "Big" then
                v52.Volume = 0.8;
                v53 = 60;
            else
                v52.Volume = 0.4;
            end;
            v26.PrimaryPart.Firework.PointLight.Brightness = 5;
            _G.tween(v26.PrimaryPart.Firework.PointLight, {
                0.5, 
                Enum.EasingStyle.Quad, 
                Enum.EasingDirection.Out, 
                0, 
                false, 
                0
            }, {
                Range = v53, 
                Brightness = 0
            });
            _G.destroy(v26, 5);
            v4(v26);
            v26:PivotTo(CFrame.new(l_PrimaryPart_0.Position, workspace.CurrentCamera.CFrame.Position) * CFrame.Angles(0, 1.5707963267948966, 0));
            _G.customEmit(v26);
            if v24 and v24 == "Blitz" then
                for _ = 1, math.random(3, 6) do
                    v0:start(l_PrimaryPart_0.CFrame * CFrame.Angles(math.rad((math.random(0, 360))), math.rad((math.random(0, 360))), (math.rad((math.random(0, 360))))), {
                        min = 100, 
                        max = 175, 
                        customInterval = 0.05
                    });
                end;
            end;
        end);
        return;
    end;
end;
return v0;