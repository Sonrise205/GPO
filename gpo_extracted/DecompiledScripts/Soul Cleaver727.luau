local l_LocalPlayer_0 = game.Players.LocalPlayer;
local l_RunService_0 = game:GetService("RunService");
local v2 = require(game.ReplicatedStorage.Modules.Skills);
local v3 = require(script.Parent.Parent.MobileBase);
local _ = require(l_LocalPlayer_0.PlayerScripts:WaitForChild("PlayerModule"));
local _ = l_LocalPlayer_0:GetMouse();
local v6 = setmetatable({}, v3);
v6.__index = v6;
v6.new = function(_) --[[ Line: 18 ]] --[[ Name: new ]]
    -- upvalues: v3 (copy), v6 (copy), l_LocalPlayer_0 (copy), l_RunService_0 (copy)
    local v8 = setmetatable(v3.new(script.Name), v6);
    v8.Cooldowns = {
        ["Hakai Slash"] = false, 
        Hahaba = false, 
        ["Maser Ray"] = false, 
        ["Blaze Eruption"] = false
    };
    local l_Character_0 = l_LocalPlayer_0.Character;
    v8.ForceEquip = false;
    v8.PlayAnim = function(_, v11, _) --[[ Line: 32 ]] --[[ Name: PlayAnim ]]
        -- upvalues: l_Character_0 (copy)
        local v13 = l_Character_0.Humanoid:LoadAnimation(v11);
        local l_l_Character_0_FirstChild_0 = l_Character_0:FindFirstChild("SoulCleaverAnimationController", true);
        local v15 = nil;
        if l_l_Character_0_FirstChild_0 ~= nil then
            v15 = l_l_Character_0_FirstChild_0:LoadAnimation(v11);
        end;
        v13:Play();
        return v13;
    end;
    local l_Humanoid_0 = l_Character_0.Humanoid;
    v8.ToolForceEquip = l_RunService_0.Heartbeat:Connect(function() --[[ Line: 76 ]]
        -- upvalues: v8 (copy), l_Character_0 (copy), l_Humanoid_0 (copy)
        if v8.ForceEquip == true then
            local l_Tool_0 = v8.Tool;
            if l_Tool_0 then
                local l_Tool_1 = l_Character_0:FindFirstChildWhichIsA("Tool");
                if l_Tool_1 and l_Tool_1 ~= l_Tool_0 then
                    task.defer(function() --[[ Line: 83 ]]
                        -- upvalues: l_Humanoid_0 (ref)
                        l_Humanoid_0:UnequipTools();
                    end);
                end;
                if l_Tool_0.Parent ~= l_Character_0 then
                    task.defer(function() --[[ Line: 89 ]]
                        -- upvalues: l_Humanoid_0 (ref), l_Tool_0 (copy)
                        l_Humanoid_0:EquipTool(l_Tool_0);
                    end);
                end;
            end;
        end;
    end);
    return v8;
end;
v6.HakaiSlash = function(v19, v20) --[[ Line: 99 ]] --[[ Name: HakaiSlash ]]
    -- upvalues: l_LocalPlayer_0 (copy), v2 (copy)
    local l_Cooldowns_0 = v19.Cooldowns;
    local l_Character_1 = l_LocalPlayer_0.Character;
    if l_Cooldowns_0["Hakai Slash"] == false and _G.check:inspect(l_Character_1) == true then
        local v23 = v2.GetM("Hakai Slash");
        local l_cd_0 = v23.cd;
        if _G.StamCheck("Hakai Slash") == false then
            return;
        elseif v23.statreq and _G.MeetReq(v23.statreq) == false then
            return;
        else
            l_Cooldowns_0["Hakai Slash"] = true;
            _G.canuse = false;
            _G.FaceMouse = true;
            v19.ForceEquip = true;
            local v25 = tick();
            local v26 = game.ReplicatedStorage.Events.Skill:InvokeServer("Hakai Slash");
            local v27 = tick() - v25;
            local v28 = v19:PlayAnim(script.HakaiSlash.Start);
            v28:Play();
            local v29 = tick();
            local l_Humanoid_1 = l_Character_1.Humanoid;
            local v31 = false;
            local l_v28_0 = v28;
            local v33 = false;
            do
                local l_v31_0, l_l_v28_0_0, l_v33_0 = v31, l_v28_0, v33;
                v19:ChargeSkill(v20, {
                    Key = Enum.KeyCode.Z, 
                    CheckFunction = function() --[[ Line: 139 ]] --[[ Name: CheckFunction ]]
                        -- upvalues: v29 (copy), v27 (copy), l_v33_0 (ref), l_l_v28_0_0 (ref), v19 (copy)
                        if tick() - v29 >= 1 - v27 and l_v33_0 == false then
                            l_l_v28_0_0:Stop();
                            l_l_v28_0_0 = v19:PlayAnim(script.HakaiSlash.Hold);
                            l_l_v28_0_0:Play();
                            l_v33_0 = true;
                        end;
                    end, 
                    IgnoreInstantCastSetting = true, 
                    EndFunction = function() --[[ Line: 150 ]] --[[ Name: EndFunction ]]
                        -- upvalues: l_Character_1 (copy), l_v31_0 (ref), v19 (copy), v29 (copy)
                        if _G.check:inspect(l_Character_1) == false then
                            l_v31_0 = true;
                            return true;
                        else
                            local v37 = true;
                            if v19.Tool.Parent == l_Character_1 then
                                v37 = tick() - v29 >= 3;
                            end;
                            return v37;
                        end;
                    end, 
                    HoldDuration = 0.4
                });
                l_l_v28_0_0:Stop();
                l_Character_1.PrimaryPart.Anchored = true;
                _G.FaceMouse = false;
                v19:PlayAnim(script.HakaiSlash.Success):Play();
                if v26 then
                    v26:InvokeServer(l_Character_1.PrimaryPart.CFrame, l_v31_0);
                end;
                l_Humanoid_1.AutoRotate = false;
                l_Character_1.PrimaryPart.Anchored = false;
                task.wait(0.1);
                l_Humanoid_1.WalkSpeed = 16;
                l_Humanoid_1.JumpPower = 50;
                l_Humanoid_1.AutoRotate = true;
                v19.ForceEquip = false;
                _G.canuse = true;
                _G.keysetup:cooldown("Hakai Slash", l_cd_0);
                _G.fw(l_cd_0);
                l_Cooldowns_0["Hakai Slash"] = false;
            end;
        end;
    end;
end;
v6.Hahaba = function(v38, v39) --[[ Line: 191 ]] --[[ Name: Hahaba ]]
    -- upvalues: l_LocalPlayer_0 (copy), v2 (copy)
    local l_Cooldowns_1 = v38.Cooldowns;
    local l_Character_2 = l_LocalPlayer_0.Character;
    if l_Cooldowns_1.Hahaba == false and _G.check:inspect(l_Character_2) == true then
        local v42 = v2.GetM("Hahaba");
        local l_cd_1 = v42.cd;
        if _G.StamCheck("Hahaba") == false then
            return;
        elseif v42.statreq and _G.MeetReq(v42.statreq) == false then
            return;
        else
            l_Cooldowns_1.Hahaba = true;
            _G.canuse = false;
            local l_Humanoid_2 = l_Character_2.Humanoid;
            l_Humanoid_2.WalkSpeed = 4;
            local v45 = game.ReplicatedStorage.Events.Skill:InvokeServer("Hahaba");
            local v46 = v38:PlayAnim(script.Hahaba.HoldNew);
            v46:Play();
            task.wait(0.3);
            local v47 = tick();
            local v48 = false;
            do
                local l_v48_0 = v48;
                v38:ChargeSkill(v39, {
                    Key = Enum.KeyCode.R, 
                    CheckFunction = function() --[[ Line: 226 ]] --[[ Name: CheckFunction ]]
                        -- upvalues: l_Humanoid_2 (copy)
                        l_Humanoid_2.WalkSpeed = 4;
                    end, 
                    IgnoreInstantCastSetting = true, 
                    EndFunction = function() --[[ Line: 231 ]] --[[ Name: EndFunction ]]
                        -- upvalues: l_Character_2 (copy), l_v48_0 (ref), v45 (copy), v38 (copy), v47 (copy)
                        if _G.check:inspect(l_Character_2) == false then
                            l_v48_0 = true;
                            return true;
                        elseif v45 == nil then
                            return true;
                        else
                            local v50 = true;
                            if v38.Tool.Parent == l_Character_2 then
                                v50 = tick() - v47 >= 3.75;
                            end;
                            return v50;
                        end;
                    end
                });
                v46:Stop();
                if v45 then
                    local v51 = v38:PlayAnim(script.Hahaba.Success);
                    v51:Play();
                    v51:AdjustWeight(2);
                    l_Humanoid_2.AutoRotate = false;
                    v45:InvokeServer(l_Character_2.PrimaryPart.CFrame, l_v48_0);
                end;
                task.wait(0.5);
                l_Humanoid_2.AutoRotate = true;
                l_Humanoid_2.WalkSpeed = 16;
                _G.canuse = true;
                _G.keysetup:cooldown("Hahaba", l_cd_1);
                _G.fw(l_cd_1);
                l_Cooldowns_1.Hahaba = false;
            end;
        end;
    end;
end;
v6.MaserRay = function(v52, v53) --[[ Line: 267 ]] --[[ Name: MaserRay ]]
    -- upvalues: l_LocalPlayer_0 (copy), v2 (copy)
    local l_Cooldowns_2 = v52.Cooldowns;
    local l_Character_3 = l_LocalPlayer_0.Character;
    if l_Cooldowns_2["Maser Ray"] == false and _G.check:inspect(l_Character_3) == true then
        local v56 = v2.GetM("Maser Ray");
        local l_cd_2 = v56.cd;
        if _G.StamCheck("Maser Ray") == false then
            return;
        elseif v56.statreq and _G.MeetReq(v56.statreq) == false then
            return;
        else
            l_Cooldowns_2["Maser Ray"] = true;
            _G.canuse = false;
            _G.FaceMouse = true;
            local v58 = game.ReplicatedStorage.Events.Skill:InvokeServer("Maser Ray", v52:GetMouseCFrame().Position);
            local v59 = v52:PlayAnim(script.MaserRay.Start);
            v59:Play();
            v59:AdjustSpeed(1);
            task.wait(0.4);
            v59:Stop();
            local v60 = v52:PlayAnim(script.MaserRay.Hold);
            v60:Play();
            local v61 = tick();
            local l_Humanoid_3 = l_Character_3.Humanoid;
            v52:ChargeSkill(v53, {
                Key = Enum.KeyCode.E, 
                CheckFunction = function() --[[ Line: 305 ]] --[[ Name: CheckFunction ]]

                end, 
                IgnoreInstantCastSetting = true, 
                EndFunction = function() --[[ Line: 309 ]] --[[ Name: EndFunction ]]
                    -- upvalues: l_Character_3 (copy), v58 (copy), v52 (copy), v61 (copy)
                    if _G.check:inspect(l_Character_3) == false then
                        return true;
                    else
                        if v58 then
                            v58:FireServer((l_Character_3.PrimaryPart.CFrame * CFrame.new(0, 0, -1000)).Position);
                        end;
                        local v63 = true;
                        if v52.Tool.Parent == l_Character_3 then
                            v63 = tick() - v61 >= 3;
                        end;
                        return v63;
                    end;
                end, 
                HoldDuration = 0.5
            });
            v60:Stop();
            l_Character_3.PrimaryPart.Anchored = true;
            _G.FaceMouse = false;
            v52:PlayAnim(script.MaserRay.Success):Play();
            if v58 then
                v58:FireServer("release", (l_Character_3.PrimaryPart.CFrame * CFrame.new(0, 0, -1000)).Position);
            end;
            task.wait(0.75);
            l_Humanoid_3.AutoRotate = true;
            l_Character_3.PrimaryPart.Anchored = false;
            _G.canuse = true;
            _G.keysetup:cooldown("Maser Ray", l_cd_2);
            _G.fw(l_cd_2);
            l_Cooldowns_2["Maser Ray"] = false;
        end;
    end;
end;
v6.BlazeEruption = function(v64, v65) --[[ Line: 346 ]] --[[ Name: BlazeEruption ]]
    -- upvalues: l_LocalPlayer_0 (copy), v2 (copy)
    local l_Cooldowns_3 = v64.Cooldowns;
    local l_Character_4 = l_LocalPlayer_0.Character;
    if l_Cooldowns_3["Blaze Eruption"] == false and _G.check:inspect(l_Character_4) == true then
        local v68 = v2.GetM("Blaze Eruption");
        local l_cd_3 = v68.cd;
        if _G.StamCheck("Blaze Eruption") == false then
            return;
        elseif v68.statreq and _G.MeetReq(v68.statreq) == false then
            return;
        else
            l_Cooldowns_3["Blaze Eruption"] = true;
            _G.canuse = false;
            _G.FaceMouse = true;
            _G.mouseLevel = true;
            v64.ForceEquip = true;
            local v70 = game.ReplicatedStorage.Events.Skill:InvokeServer("Blaze Eruption", v64:GetMouseCFrame().Position);
            local v71 = v64:PlayAnim(script.Pillar.Start);
            v71:Play();
            v71:AdjustSpeed(1);
            task.wait(0.5);
            v71:Stop();
            local v72 = v64:PlayAnim(script.Pillar.Hold);
            v72:Play();
            local v73 = tick();
            local l_Humanoid_4 = l_Character_4.Humanoid;
            v64:ChargeSkill(v65, {
                Key = Enum.KeyCode.X, 
                CheckFunction = function() --[[ Line: 388 ]] --[[ Name: CheckFunction ]]

                end, 
                EndFunction = function() --[[ Line: 391 ]] --[[ Name: EndFunction ]]
                    -- upvalues: l_Character_4 (copy), v64 (copy), v73 (copy)
                    if _G.check:inspect(l_Character_4) == false then
                        return true;
                    else
                        local v75 = true;
                        if v64.Tool.Parent == l_Character_4 then
                            v75 = tick() - v73 >= 3;
                        end;
                        return v75;
                    end;
                end
            });
            v72:Stop(0);
            l_Character_4.PrimaryPart.Anchored = true;
            _G.FaceMouse = false;
            _G.mouseLevel = false;
            v64:PlayAnim(script.Pillar.Success):Play();
            if v70 then
                v70:InvokeServer(l_Character_4.PrimaryPart.CFrame);
            end;
            task.wait(0.5);
            l_Humanoid_4.AutoRotate = true;
            l_Character_4.PrimaryPart.Anchored = false;
            v64.ForceEquip = false;
            _G.canuse = true;
            _G.keysetup:cooldown("Blaze Eruption", l_cd_3);
            _G.fw(l_cd_3);
            l_Cooldowns_3["Blaze Eruption"] = false;
        end;
    end;
end;
return v6;