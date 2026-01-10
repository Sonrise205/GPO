local v0 = {};
local v1 = 0;
v0.start = function(_, v3, v4, v5, v6) --[[ Line: 4 ]] --[[ Name: start ]]
    -- upvalues: v1 (ref)
    if v4 and v4.Parent == nil then
        return;
    elseif v1 >= 100 then
        warn("too many hits on screen returning", v1);
        return;
    else
        if v3 ~= "Clash" and v3 ~= "Blocked" then
            if v4 == nil then
                return;
            elseif v4.PrimaryPart == nil then
                return;
            elseif not _G.checkRenderDistance(v4.PrimaryPart.Position, 150) then
                return;
            else
                v1 = v1 + 1;
                local v7 = script.Types:FindFirstChild(v3):Clone();
                if v3 == "Sword" then
                    v7.Attachment.Orientation = Vector3.new(0, 0, math.random(-90, 90));
                end;
                local l_PrimaryPart_0 = v4.PrimaryPart;
                if v5 then
                    l_PrimaryPart_0 = v5;
                end;
                v7.CFrame = l_PrimaryPart_0.CFrame;
                v7.Parent = workspace.Effects;
                _G.customEmit(v7);
                _G.destroy(v7, 1);
            end;
        elseif v3 == "Blocked" then
            if v4 == nil then
                return;
            elseif v4.PrimaryPart == nil then
                return;
            elseif not _G.checkRenderDistance(v4.PrimaryPart.Position, 150) then
                return;
            else
                v1 = v1 + 1;
                local v9 = script.BlockParticle:Clone();
                v9.CFrame = v4.HumanoidRootPart.CFrame;
                v9.Size = Vector3.new(1.5, 2.5, 1, 0);
                v9.Attachment.Position = Vector3.new(math.random(-v9.Size.X, v9.Size.X) / 2, math.random(-v9.Size.Y, v9.Size.Y) / 2, math.random(-v9.Size.Z, v9.Size.Z) / 2);
                v9.Parent = workspace.Effects;
                _G.customEmit(v9);
                _G.destroy(v9, 1);
            end;
        elseif not _G.checkRenderDistance(v6.Position, 150) then
            return;
        else
            v1 = v1 + 1;
            local v10 = script.Types.Clash:Clone();
            v10.CFrame = v6 * CFrame.new(0, 0, -1);
            v10.Parent = workspace.Effects;
            _G.customEmit(v10);
            _G.tween(v10.PointLight, {
                0.15, 
                Enum.EasingStyle.Quad, 
                Enum.EasingDirection.Out, 
                0, 
                false, 
                0
            }, {
                Range = 15, 
                Brightness = 0
            });
            _G.destroy(v10, 2);
            _G.PlaySound(v6, script.blocksfx["B" .. math.random(1, 9)]);
            _G.shakenear(v10.Position, 25, 35, 15, -1.5);
            local v11 = Random.new();
            for _ = 1, math.random(4) do
                _G.PlayEffect("Sparks", nil, {
                    Direction = (v6 * CFrame.Angles(math.rad((v11:NextInteger(-90, 90))), math.rad((v11:NextInteger(-45, 45))), 0)).LookVector * v11:NextNumber(15, 35), 
                    Position = v6.Position
                });
            end;
        end;
        task.delay(1, function() --[[ Line: 89 ]]
            -- upvalues: v1 (ref)
            v1 = v1 - 1;
        end);
        return;
    end;
end;
return v0;