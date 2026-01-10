return {
    start = function(_, v1, v2, v3) --[[ Line: 7 ]] --[[ Name: start ]]
        if not _G.checkRenderDistance(v2.Position) then
            return;
        else
            local v4 = math.floor(v3 / 50);
            if v4 < 1 then
                v4 = 1;
            end;
            if v4 >= 25 then
                v4 = 25;
            end;
            if (v1.HumanoidRootPart.Position - v2.p).magnitude > 200 then
                return;
            else
                local v5 = 1;
                local v6 = 0.1;
                for v7 = 1, v4 do
                    task.wait();
                    local v8 = script.Orb:Clone();
                    v8.CFrame = v2 * CFrame.Angles(math.rad((math.random(-360, 360))), math.rad((math.random(-360, 360))), (math.rad((math.random(-360, 360)))));
                    v8.Rocket.Target = v1.HumanoidRootPart;
                    if v7 % 2 == 0 then
                        v8.Color = Color3.fromRGB(239, 184, 56);
                    end;
                    v8.Trail.Color = ColorSequence.new(v8.Color);
                    v8.Velocity = Vector3.new(math.random(-75, 75), math.random(25, 75), math.random(-75, 75));
                    v8.Rocket.MaxSpeed = math.random(75, 125);
                    v8.Parent = workspace.Effects;
                    task.spawn(function() --[[ Line: 36 ]]
                        -- upvalues: v8 (copy), v5 (ref), v6 (ref)
                        task.wait(0.2);
                        if v8:FindFirstChild("Rocket") then
                            v8.Rocket:Fire();
                        end;
                        local v9 = nil;
                        v9 = v8.Rocket.ReachedTarget:Connect(function() --[[ Line: 43 ]]
                            -- upvalues: v8 (ref), v5 (ref), v6 (ref), v9 (ref)
                            v8.Trail.Enabled = false;
                            v8.Transparency = 1;
                            v8.sfx.Pitch = v5;
                            v8.sfx.Volume = v6;
                            v8.sfx:Play();
                            v9:Disconnect();
                            v9 = nil;
                            v6 = v6 + 0.05;
                            v5 = v5 + 0.01;
                            _G.destroy(v8, 2);
                        end);
                    end);
                end;
                return;
            end;
        end;
    end
};