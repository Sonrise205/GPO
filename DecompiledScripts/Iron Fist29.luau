local l_LocalPlayer_0 = game.Players.LocalPlayer;
local _ = game:GetService("RunService");
local v2 = require(game.ReplicatedStorage.Modules.Skills);
local v3 = require(script.Parent.Parent.MobileBase);
local _ = require(l_LocalPlayer_0.PlayerScripts:WaitForChild("PlayerModule"));
local _ = l_LocalPlayer_0:GetMouse();
local v6 = setmetatable({}, v3);
v6.__index = v6;
v6.new = function(_) --[[ Line: 17 ]] --[[ Name: new ]]
    -- upvalues: v3 (copy), v6 (copy)
    local v8 = setmetatable(v3.new(script.Name), v6);
    v8.Cooldowns = {
        oversizedBall = false, 
        shower = false, 
        FusilladeFist = false, 
        FistOfLove = false, 
        InstantSoru = false, 
        Galaxy = false
    };
    return v8;
end;
local v9 = require(game.ReplicatedStorage.Modules.RotatedRegion3);
local function _(v10, v11, v12) --[[ Line: 27 ]] --[[ Name: getinregion ]]
    -- upvalues: v9 (copy)
    return (v9.new(v11, v12):FindPartsInRegion3WithWhiteList(_G.getTargets(v10), 500));
end;
v6.OversizedIronBall = function(v14, v15) --[[ Line: 33 ]] --[[ Name: OversizedIronBall ]]
    -- upvalues: l_LocalPlayer_0 (copy), v2 (copy)
    local l_Cooldowns_0 = v14.Cooldowns;
    local _ = game.ReplicatedStorage["Stats" .. l_LocalPlayer_0.Name];
    local l_Character_0 = l_LocalPlayer_0.Character;
    if l_Cooldowns_0.oversizedBall == false and _G.check:inspect(l_Character_0) == true then
        local v19 = v2.GetM("Oversized Iron Ball");
        local l_cd_0 = v19.cd;
        if _G.StamCheck("Oversized Iron Ball") == false then
            return;
        elseif v19.statreq and _G.MeetReq(v19.statreq) == false then
            return;
        else
            l_Cooldowns_0.oversizedBall = true;
            _G.canuse = false;
            l_Character_0.Humanoid.WalkSpeed = 4;
            l_Character_0.Humanoid.WalkSpeed = 4;
            local v21 = game.ReplicatedStorage.Events.Skill:InvokeServer("Oversized Iron Ball", {
                cf = l_Character_0.HumanoidRootPart.CFrame
            });
            local v22 = tick();
            v14:ChargeSkill(v15, {
                Key = Enum.KeyCode.E, 
                EndFunction = function() --[[ Line: 63 ]] --[[ Name: endFunction ]]
                    -- upvalues: l_Character_0 (copy), v14 (copy), v21 (copy), v22 (copy)
                    l_Character_0.Humanoid.WalkSpeed = 4;
                    _G.canuse = false;
                    if v14.Tool.Parent ~= l_Character_0 or l_Character_0:FindFirstChild("Stun") or v21 == nil or tick() - v22 >= 2 or _G.check:inspect(l_Character_0) == false then
                        return true;
                    else
                        return;
                    end;
                end, 
                IgnoreInstantCastSetting = true
            });
            if v21 then
                v21:InvokeServer(l_Character_0.PrimaryPart.CFrame);
            end;
            task.wait(0.3);
            l_Character_0.Humanoid.WalkSpeed = 16;
            _G.canuse = true;
            _G.keysetup:cooldown("Oversized Iron Ball", l_cd_0);
            _G.fw(l_cd_0);
            l_Cooldowns_0.oversizedBall = false;
        end;
    end;
end;
v6.MeteorFistShower = function(v23, v24) --[[ Line: 91 ]] --[[ Name: MeteorFistShower ]]
    -- upvalues: l_LocalPlayer_0 (copy), v2 (copy)
    local l_Cooldowns_1 = v23.Cooldowns;
    local _ = game.ReplicatedStorage["Stats" .. l_LocalPlayer_0.Name];
    local l_Character_1 = l_LocalPlayer_0.Character;
    if l_Cooldowns_1.shower == false and _G.check:inspect(l_Character_1) == true then
        local v28 = v2.GetM("Meteor Fist Shower");
        local l_cd_1 = v28.cd;
        if _G.StamCheck("Meteor Fist Shower") == false then
            return;
        elseif v28.statreq and _G.MeetReq(v28.statreq) == false then
            return;
        else
            l_Cooldowns_1.shower = true;
            _G.canuse = false;
            _G.FaceMouse = true;
            local v30 = game.ReplicatedStorage.Events.Skill:InvokeServer("Meteor Fist Shower", v23:GetMouseCFrame());
            local v31 = tick();
            v23:ChargeSkill(v24, {
                Key = Enum.KeyCode.R, 
                EndFunction = function() --[[ Line: 114 ]] --[[ Name: endFunction ]]
                    -- upvalues: v30 (copy), v23 (copy), l_Character_1 (copy), v31 (copy)
                    _G.canuse = false;
                    if v30 then
                        v30:FireServer(v23:GetMouseCFrame());
                    end;
                    if v23.Tool.Parent ~= l_Character_1 or l_Character_1:FindFirstChild("Stun") or v30 == nil or v30 and v30:IsDescendantOf(game) == false or tick() - v31 >= 5 or _G.check:inspect(l_Character_1) == false then
                        return true;
                    else
                        return;
                    end;
                end, 
                IgnoreInstantCastSetting = true
            });
            if v30 then
                v30:FireServer();
            end;
            _G.FaceMouse = false;
            _G.canuse = true;
            _G.keysetup:cooldown("Meteor Fist Shower", l_cd_1);
            _G.fw(l_cd_1);
            l_Cooldowns_1.shower = false;
        end;
    end;
end;
v6.FusilladeFist = function(v32, v33) --[[ Line: 144 ]] --[[ Name: FusilladeFist ]]
    -- upvalues: l_LocalPlayer_0 (copy), v2 (copy)
    local l_Cooldowns_2 = v32.Cooldowns;
    local _ = game.ReplicatedStorage["Stats" .. l_LocalPlayer_0.Name];
    local l_Character_2 = l_LocalPlayer_0.Character;
    if l_Cooldowns_2.FusilladeFist == false and _G.check:inspect(l_Character_2) == true then
        local v37 = v2.GetM("Fusillade Fist");
        local l_cd_2 = v37.cd;
        if _G.StamCheck("Fusillade Fist") == false then
            return;
        elseif v37.statreq and _G.MeetReq(v37.statreq) == false then
            return;
        else
            l_Cooldowns_2.FusilladeFist = true;
            _G.canuse = false;
            local l_BodyVelocity_0 = Instance.new("BodyVelocity");
            l_BodyVelocity_0.MaxForce = Vector3.new(100000, 0, 100000, 0);
            l_BodyVelocity_0.Parent = l_Character_2.LowerTorso;
            local v40 = game.ReplicatedStorage.Events.Skill:InvokeServer("Fusillade Fist", {
                cf = l_Character_2.HumanoidRootPart.CFrame
            });
            local v41 = tick();
            local l_PrimaryPart_0 = l_Character_2.PrimaryPart;
            local v43 = RaycastParams.new();
            v43.FilterType = Enum.RaycastFilterType.Include;
            v43.FilterDescendantsInstances = {
                workspace.Env, 
                workspace.Ships, 
                workspace.Islands
            };
            v32:ChargeSkill(v33, {
                Key = Enum.KeyCode.Z, 
                EndFunction = function() --[[ Line: 177 ]] --[[ Name: endFunction ]]
                    -- upvalues: l_BodyVelocity_0 (copy), l_Character_2 (copy), l_PrimaryPart_0 (copy), v43 (copy), v32 (copy), v40 (copy), v41 (copy)
                    _G.canuse = false;
                    l_BodyVelocity_0.Velocity = l_Character_2.PrimaryPart.CFrame.LookVector * 50;
                    local v44 = workspace:Raycast(l_PrimaryPart_0.Position, l_PrimaryPart_0.CFrame.LookVector * 6, v43);
                    if v44 and v44.Instance then
                        return true;
                    elseif v32.Tool.Parent ~= l_Character_2 or l_Character_2:FindFirstChild("Stun") or v40 == nil or tick() - v41 >= 2 or l_Character_2:GetAttribute("FuissiladeFistHold") == nil then
                        return true;
                    else
                        return;
                    end;
                end, 
                IgnoreInstantCastSetting = true
            });
            l_Character_2.Humanoid.AutoRotate = false;
            l_BodyVelocity_0.MaxForce = Vector3.new(99999997952, 99999997952, 99999997952, 0);
            _G.tween(l_BodyVelocity_0, {
                0.5, 
                "EntranceExpressive", 
                Enum.EasingDirection.Out, 
                0, 
                false, 
                0
            }, {
                Velocity = Vector3.new(0, 0, 0, 0)
            });
            if v40 then
                v40:InvokeServer(l_Character_2.PrimaryPart.CFrame);
            end;
            l_BodyVelocity_0:Destroy();
            l_Character_2.Humanoid.AutoRotate = true;
            _G.canuse = true;
            _G.keysetup:cooldown("Fusillade Fist", l_cd_2);
            _G.fw(l_cd_2);
            l_Cooldowns_2.FusilladeFist = false;
        end;
    end;
end;
v6.FistOfLove = function(v45, v46) --[[ Line: 219 ]] --[[ Name: FistOfLove ]]
    -- upvalues: l_LocalPlayer_0 (copy), v2 (copy)
    local l_Cooldowns_3 = v45.Cooldowns;
    local _ = game.ReplicatedStorage["Stats" .. l_LocalPlayer_0.Name];
    local l_Character_3 = l_LocalPlayer_0.Character;
    if l_Cooldowns_3.FistOfLove == false and _G.check:inspect(l_Character_3) == true then
        local v50 = v2.GetM("Fist Of Love");
        local l_cd_3 = v50.cd;
        if _G.StamCheck("Fist Of Love") == false then
            return;
        elseif v50.statreq and _G.MeetReq(v50.statreq) == false then
            return;
        else
            l_Cooldowns_3.FistOfLove = true;
            _G.canuse = false;
            _G.FaceMouse = true;
            local v52 = game.ReplicatedStorage.Events.Skill:InvokeServer("Fist Of Love", v45:GetMouseCFrame());
            local v53 = tick();
            v45:ChargeSkill(v46, {
                Key = Enum.KeyCode.X, 
                EndFunction = function() --[[ Line: 242 ]] --[[ Name: endFunction ]]
                    -- upvalues: v45 (copy), l_Character_3 (copy), v52 (copy), v53 (copy)
                    _G.canuse = false;
                    if v45.Tool.Parent ~= l_Character_3 or l_Character_3:FindFirstChild("Stun") or v52 == nil or tick() - v53 >= 5 then
                        return true;
                    else
                        return;
                    end;
                end
            });
            _G.FaceMouse = false;
            l_Character_3.PrimaryPart.Anchored = true;
            if v52 then
                v52:InvokeServer(l_Character_3.PrimaryPart.CFrame);
            end;
            l_Character_3.PrimaryPart.Anchored = false;
            _G.canuse = true;
            _G.keysetup:cooldown("Fist Of Love", l_cd_3);
            _G.fw(l_cd_3);
            l_Cooldowns_3.FistOfLove = false;
        end;
    end;
end;
v6.GalaxyImpact = function(v54, _) --[[ Line: 271 ]] --[[ Name: GalaxyImpact ]]
    -- upvalues: l_LocalPlayer_0 (copy), v2 (copy)
    local l_Cooldowns_4 = v54.Cooldowns;
    local _ = game.ReplicatedStorage["Stats" .. l_LocalPlayer_0.Name];
    local l_Character_4 = l_LocalPlayer_0.Character;
    if l_Cooldowns_4.Galaxy == false and _G.check:inspect(l_Character_4) == true then
        local v59 = v2.GetM("Galaxy Impact");
        local l_cd_4 = v59.cd;
        if _G.StamCheck("Galaxy Impact") == false then
            return;
        elseif v59.statreq and _G.MeetReq(v59.statreq) == false then
            return;
        else
            l_Cooldowns_4.Galaxy = true;
            _G.canuse = false;
            local _ = game.ReplicatedStorage.Events.Skill:InvokeServer("Galaxy Impact", l_Character_4.PrimaryPart.CFrame);
            _G.canuse = true;
            _G.keysetup:cooldown("Galaxy Impact", l_cd_4);
            _G.fw(l_cd_4);
            l_Cooldowns_4.Galaxy = false;
        end;
    end;
end;
return v6;