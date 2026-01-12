local v0 = {};
local v1 = require(game.ReplicatedStorage.Modules.GunHandle);
v0.Rev = function(_, v3, v4, v5) --[[ Line: 3 ]] --[[ Name: Rev ]]
    -- upvalues: v1 (copy)
    if v3 == nil then
        return;
    else
        local l_Parent_0 = v3.Parent;
        v3:WaitForChild("AnimationController", 2);
        v3.AnimationController:WaitForChild("Animator", 2);
        if v5.FireAnims == nil then
            v5.FireAnims = {
                hum = l_Parent_0.Humanoid:LoadAnimation(script.Parent.Parent.Guns.Galt.Fire1), 
                gunA = v3.AnimationController:LoadAnimation(script.Parent.Parent.Guns.Galt.Fire2)
            };
        end;
        if v5.GunModel == nil then
            v5.GunModel = v3;
        end;
        if v5.GunModel ~= v3 then
            if v5.tween then
                v5.tween:Cancel();
                v5.tween = nil;
            end;
            if v5.FireAnims then
                v5.FireAnims.gunA = v3.AnimationController:LoadAnimation(script.Parent.Parent.Guns.Galt.Fire2);
            end;
            v5.GunModel = v3;
        end;
        if v5.tween == nil then
            local v7 = {
                MaxVelocity = 0
            };
            local v8 = TweenInfo.new(4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, false, 0);
            v5.tween = game:GetService("TweenService"):Create(v3.Base.MiddleBarrel, v8, v7);
        end;
        if v5.StartRev ~= nil and v5.StartRev >= v1:getRevsAm()[v5.Name] then
            v5.Reloaded = false;
            script.NOAMMO:Play();
            _G.TurnCharacterToMouse = false;
            v4 = false;
        end;
        if v4 == true then
            if v5.tween.PlaybackState == Enum.PlaybackState.Playing then
                v5.tween:Cancel();
            end;
            local _ = v3.Base.MiddleBarrel.MaxVelocity;
            local _ = false;
            if v5.FireAnims.hum.IsPlaying == false then
                game.ReplicatedStorage.Events.GunManager:FireServer("rev", {
                    Gun = v5.Name
                });
                v5.FireAnims.hum:Play();
            end;
            if v5.FireAnims.gunA.IsPlaying == false then
                v5.FireAnims.gunA:Play();
            end;
            v3.Base.MiddleBarrel.MaxVelocity = v3.Base.MiddleBarrel.MaxVelocity + 0.002;
            local v11 = 2 + v3.Base.MiddleBarrel.MaxVelocity;
            v5.FireAnims.hum:AdjustSpeed(v11);
            v5.FireAnims.gunA:AdjustSpeed(v11);
            if v3.Base.MiddleBarrel.MaxVelocity >= 0.075 then
                if v5.StartRev == nil then
                    v5.StartRev = 0;
                end;
                v5.StartRev = v5.StartRev + 1;
                if v3.Hole.loop.IsPlaying == false then
                    v3.Hole.loop:Play();
                end;
                game.ReplicatedStorage.Events.GunManager:FireServer("fire", {
                    Gun = script.Name, 
                    Position = _G.MouseCF.p, 
                    Start = v3.Hole.CFrame, 
                    go = true
                });
                return;
            end;
        else
            game.ReplicatedStorage.Events.GunManager:FireServer("unrev", {
                Gun = script.Name
            });
            if v3.Hole.loop.IsPlaying == true then
                v3.Hole.loop:Stop();
            end;
            if v5.FireAnims.hum.IsPlaying == true then
                v5.FireAnims.hum:Stop();
            end;
            if v5.FireAnims.gunA.IsPlaying == true then
                v5.FireAnims.gunA:Stop();
            end;
            if v5.Reloaded == false then
                v5.Anims.aimHold:Stop();
                v5.Anims.aim:Stop();
                v5.IsAiming = false;
            end;
            if v5.tween.PlaybackState ~= Enum.PlaybackState.Playing then
                v5.tween:Play();
            end;
        end;
        return;
    end;
end;
v0.Reload = function(_, v13, v14, v15) --[[ Line: 89 ]] --[[ Name: Reload ]]
    local l_v13_FirstChild_0 = v13:FindFirstChild(v14 .. "Gun");
    if l_v13_FirstChild_0 then
        local v17 = v13.Humanoid:LoadAnimation(script.Reload1);
        v17:Play();
        local v18 = l_v13_FirstChild_0.AnimationController:LoadAnimation(script.Reload2);
        v18:Play();
        task.spawn(function() --[[ Line: 96 ]]
            -- upvalues: l_v13_FirstChild_0 (copy), v13 (copy), v17 (copy), v18 (copy), v15 (copy)
            repeat
                task.wait();
                if l_v13_FirstChild_0.Parent ~= v13 then
                    v17:Stop();
                    v18:Stop();
                end;
                v15.Ready = false;
            until v18.IsPlaying == false;
            v15.Ready = true;
        end);
    end;
end;
return v0;