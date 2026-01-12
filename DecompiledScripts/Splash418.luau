return {
    start = function(_, v1) --[[ Line: 2 ]] --[[ Name: start ]]
        local l_obj_0 = v1.obj;
        local l_Strength_0 = v1.Strength;
        local l_Size_0 = v1.Size;
        local l_CFrame_0 = v1.CFrame;
        local l_PSize_0 = v1.PSize;
        if l_CFrame_0 == nil then
            l_CFrame_0 = l_obj_0.CFrame;
        end;
        if _G.checkRenderDistance(l_CFrame_0.p) == false then
            return;
        else
            l_obj_0 = _G.awaitObject(l_obj_0);
            if l_obj_0 == "INVALID" then
                return;
            else
                local l_Y_0 = workspace.Env.WaterStuff.Ocean.Position.Y;
                local v8 = script.Water:Clone();
                v8.Parent = workspace.Effects;
                v8.CFrame = CFrame.new(l_obj_0.CFrame.X, l_Y_0, l_obj_0.CFrame.Z);
                if l_Strength_0 then
                    v8.Splash.Speed = NumberRange.new(l_Strength_0 / 2, l_Strength_0);
                else
                    l_Strength_0 = 0;
                end;
                if l_Size_0 == nil then
                    l_Size_0 = 5;
                end;
                if l_PSize_0 then
                    v8.Splash.Size = l_PSize_0;
                end;
                v8.Splash:Emit(25);
                v8.sfx.EmitterSize = 50 + l_Strength_0 / 2;
                v8.sfx.MaxDistance = v8.sfx.MaxDistance + l_Strength_0 * 4;
                v8.sfx:Play();
                _G.destroy(v8, 3);
                local v9 = script.Rings:Clone();
                v9.Parent = workspace.Effects;
                v9.CFrame = CFrame.new(l_obj_0.Position.X, l_Y_0 + 0.25, l_obj_0.Position.Z);
                v9.Size = Vector3.new(0, 1, 0, 0);
                local v10 = TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, false, 0);
                local v11 = {
                    Size = Vector3.new(l_Size_0, 1, l_Size_0), 
                    Transparency = 1
                };
                game:GetService("TweenService"):Create(v9, v10, v11):Play();
                _G.destroy(v9, 1);
                if l_obj_0:FindFirstChildOfClass("BodyVelocity") then
                    l_obj_0:FindFirstChildOfClass("BodyVelocity").Velocity = l_obj_0:FindFirstChildOfClass("BodyVelocity").Velocity * 0.25;
                end;
                return;
            end;
        end;
    end
};