local v0 = {};
local _ = _G.clientimpacts[game.ReplicatedStorage.ClientImpacts.Sparks];
local _ = _G.clientimpacts[game.ReplicatedStorage.ClientImpacts.RockDebs];
v0.start = function(_, v4) --[[ Line: 6 ]] --[[ Name: start ]]
    local l_obj_0 = v4.obj;
    local l_cf_0 = v4.cf;
    local l_hit_0 = v4.hit;
    if _G.checkRenderDistance(l_cf_0.p) == false then
        return;
    else
        l_obj_0.Transparency = 1;
        l_obj_0.Attachment.ParticleEmitter.Size = NumberSequence.new({
            NumberSequenceKeypoint.new(0, 0, 0), 
            NumberSequenceKeypoint.new(0.5, 2, 1.5), 
            NumberSequenceKeypoint.new(1, 0, 0)
        });
        l_obj_0.Attachment.ParticleEmitter:Emit(15);
        local v8 = nil;
        pcall(function() --[[ Line: 18 ]]
            -- upvalues: l_hit_0 (copy), v8 (ref)
            if l_hit_0 and l_hit_0.Parent:FindFirstChild("Humanoid") or l_hit_0.Parent.Parent:FindFirstChild("Humanoid") or l_hit_0.Parent.Parent.Parent:FindFirstChild("Humanoid") then
                v8 = true;
            end;
        end);
        if l_hit_0 and v8 == nil then
            l_obj_0.Attachment.Smoke.Color = ColorSequence.new(l_hit_0.Color);
            l_obj_0.Attachment.Smoke:Emit(25);
            local v9, v10, v11 = Color3.toHSV(l_hit_0.Color);
            local v12 = Color3.fromHSV(v9, v10, v11 * 0.75);
            l_obj_0.Attachment.rock.Color = ColorSequence.new(v12);
            l_obj_0.Attachment.rock:Emit(25);
        elseif v8 then
            l_obj_0.Attachment2.WorldPosition = l_hit_0.Position;
            l_obj_0.Attachment2.Blood:Emit(25);
        end;
        local v13 = TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, false, 0);
        local v14 = {
            Range = 0, 
            Brightness = 2
        };
        game:GetService("TweenService"):Create(l_obj_0.PointLight, v13, v14):Play();
        l_obj_0.Attachment.ParticleEmitter2.Acceleration = l_cf_0.rightVector * -300;
        l_obj_0.Attachment.ParticleEmitter3.Acceleration = l_cf_0.rightVector * -300;
        l_obj_0.Attachment.ParticleEmitter2:Emit(25);
        l_obj_0.Attachment.ParticleEmitter3:Emit(25);
        l_obj_0.Parent = workspace.Effects;
        return;
    end;
end;
return v0;