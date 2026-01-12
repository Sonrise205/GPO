local l_LocalPlayer_0 = game.Players.LocalPlayer;
local _ = game:GetService("RunService");
local v2 = require(game.ReplicatedStorage.Modules.Skills);
local v3 = require(script.Parent.Parent.MobileBase);
local _ = require(l_LocalPlayer_0.PlayerScripts:WaitForChild("PlayerModule"));
local _ = l_LocalPlayer_0:GetMouse();
local v6 = setmetatable({}, v3);
v6.__index = v6;
v6.new = function(_) --[[ Line: 18 ]] --[[ Name: new ]]
    -- upvalues: v3 (copy), v6 (copy)
    local v8 = setmetatable(v3.new(script.Name), v6);
    v8.Cooldowns = {
        summon = false, 
        target = false, 
        move = false, 
        recall = false
    };
    return v8;
end;
v6.SummonBunny = function(v9, _) --[[ Line: 26 ]] --[[ Name: SummonBunny ]]
    -- upvalues: l_LocalPlayer_0 (copy), v2 (copy)
    local l_Cooldowns_0 = v9.Cooldowns;
    local l_Character_0 = l_LocalPlayer_0.Character;
    local function v16() --[[ Line: 30 ]] --[[ Name: getBunnys ]]
        -- upvalues: l_LocalPlayer_0 (ref)
        local v13 = 0;
        local l_Children_0 = workspace.NPCs:GetChildren();
        for v15 = 1, #l_Children_0 do
            if l_Children_0[v15].Name == l_LocalPlayer_0.Name .. "'s Bunny" then
                v13 = v13 + 1;
            end;
        end;
        return v13;
    end;
    local l_FirstChild_0 = game.ReplicatedStorage:FindFirstChild("Stats" .. l_LocalPlayer_0.Name);
    if l_Cooldowns_0.summon == false and _G.check:inspect(l_Character_0) == true and _G.StamCheck("Summon Bunny", nil, l_FirstChild_0.Stamina.MaxValue / 8) == true and v16() < _G.CheckItemAmmount(l_LocalPlayer_0, "Mini Bunny") then
        local v18 = v2.GetM("Summon Bunny");
        local l_cd_0 = v18.cd;
        if v18.statreq and _G.MeetReq(v18.statreq) == false then
            return;
        else
            l_Cooldowns_0.summon = true;
            if game.ReplicatedStorage.Events.Skill:InvokeServer("Summon Bunny") == true then
                l_Character_0.Humanoid:LoadAnimation(script.summon):Play();
            end;
            task.wait(0.24999999999999994);
            task.wait(0.45);
            _G.keysetup:cooldown("Summon Bunny", l_cd_0);
            _G.fw(l_cd_0);
            l_Cooldowns_0.summon = false;
        end;
    end;
end;
v6.BunnyTarget = function(v20, _) --[[ Line: 66 ]] --[[ Name: BunnyTarget ]]
    -- upvalues: l_LocalPlayer_0 (copy), v2 (copy)
    local l_Cooldowns_1 = v20.Cooldowns;
    local l_Character_1 = l_LocalPlayer_0.Character;
    if l_Cooldowns_1.target == false and _G.check:inspect(l_Character_1) == true and _G.StamCheck("Bunny Target") == true then
        local v24 = v2.GetM("Bunny Target");
        local l_cd_1 = v24.cd;
        if _G.StamCheck("Bunny Target") == false then
            return;
        elseif v24.statreq and _G.MeetReq(v24.statreq) == false then
            return;
        else
            l_Cooldowns_1.target = true;
            local v26 = _G.getTargetNearMouse();
            do
                local l_v26_0 = v26;
                if l_v26_0 then
                    l_v26_0 = l_v26_0.Parent;
                    l_Character_1.Humanoid:LoadAnimation(script.target):Play();
                    pcall(function() --[[ Line: 87 ]]
                        -- upvalues: l_v26_0 (ref)
                        local v28 = game.ReplicatedStorage.MiscModels.targetParticle.Attachment:Clone();
                        v28.Parent = l_v26_0.HumanoidRootPart;
                        v28.ParticleEmitter:Emit(1);
                        v28.ParticleEmitter2:Emit(1);
                        _G.destroy(v28, 0.25);
                    end);
                    game.ReplicatedStorage.Events.Skill:InvokeServer("Bunny Target", {
                        target = l_v26_0
                    });
                end;
                _G.keysetup:cooldown("Bunny Target", l_cd_1);
                _G.fw(l_cd_1);
                l_Cooldowns_1.target = false;
            end;
        end;
    end;
end;
v6.BunnyMove = function(v29, v30) --[[ Line: 103 ]] --[[ Name: BunnyMove ]]
    -- upvalues: l_LocalPlayer_0 (copy), v2 (copy)
    local l_Cooldowns_2 = v29.Cooldowns;
    local l_Character_2 = l_LocalPlayer_0.Character;
    if l_Cooldowns_2.move == false and _G.check:inspect(l_Character_2) == true and _G.StamCheck("Bunny Move") == true then
        local v33 = v2.GetM("Bunny Move");
        local l_cd_2 = v33.cd;
        if _G.StamCheck("Bunny Move") == false then
            return;
        elseif v33.statreq and _G.MeetReq(v33.statreq) == false then
            return;
        else
            l_Cooldowns_2.move = true;
            local l_MouseTarget_0 = _G.MouseTarget;
            local v36 = game.ReplicatedStorage.Events.Skill:InvokeServer("Bunny Move");
            if l_MouseTarget_0 and v36 then
                local v37 = 0;
                do
                    local l_v37_0 = v37;
                    v29:ChargeSkill(v30, {
                        Key = Enum.KeyCode.Z, 
                        EndFunction = function() --[[ Line: 124 ]] --[[ Name: EndFunction ]]
                            -- upvalues: l_v37_0 (ref), v36 (copy), v29 (copy)
                            if tick() - l_v37_0 >= 0.016666666666666666 then
                                v36:FireServer({
                                    pos = v29:GetMouseCFrame().p
                                });
                                l_v37_0 = tick();
                            end;
                        end
                    });
                end;
            end;
            if v36 then
                v36:FireServer();
            end;
            _G.keysetup:cooldown("Bunny Move", l_cd_2);
            _G.fw(l_cd_2);
            l_Cooldowns_2.move = false;
        end;
    end;
end;
v6.BunnyRecall = function(v39, _) --[[ Line: 142 ]] --[[ Name: BunnyRecall ]]
    -- upvalues: l_LocalPlayer_0 (copy), v2 (copy)
    local l_Cooldowns_3 = v39.Cooldowns;
    local l_Character_3 = l_LocalPlayer_0.Character;
    if l_Cooldowns_3.recall == false and _G.check:inspect(l_Character_3) == true and _G.StamCheck("Bunny Recall") == true then
        local v43 = v2.GetM("Bunny Recall");
        local l_cd_3 = v43.cd;
        if _G.StamCheck("Bunny Recall") == false then
            return;
        elseif v43.statreq and _G.MeetReq(v43.statreq) == false then
            return;
        else
            l_Cooldowns_3.recall = true;
            l_Character_3.Humanoid:LoadAnimation(script.recall):Play();
            game.ReplicatedStorage.Events.Skill:InvokeServer("Bunny Recall", {
                pos = v39:GetMouseCFrame().p
            });
            _G.keysetup:cooldown("Bunny Recall", l_cd_3);
            _G.fw(l_cd_3);
            l_Cooldowns_3.recall = false;
        end;
    end;
end;
return v6;