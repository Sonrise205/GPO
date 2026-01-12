local l_LocalPlayer_0 = game.Players.LocalPlayer;
local _ = game:GetService("RunService");
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local v3 = require(game.ReplicatedStorage.Modules.Skills);
local v4 = require(script.Parent.Parent.MobileBase);
local _ = require(l_LocalPlayer_0.PlayerScripts:WaitForChild("PlayerModule"));
local v6 = require(game.ReplicatedStorage.ClientImpacts.SukeTrans);
local _ = l_LocalPlayer_0:GetMouse();
local v8 = setmetatable({}, v4);
v8.__index = v8;
v8.new = function(_) --[[ Line: 20 ]] --[[ Name: new ]]
    -- upvalues: v4 (copy), v8 (copy)
    local v10 = setmetatable(v4.new(script.Name), v8);
    v10.Cooldowns = {
        selfTrans = false, 
        aoeTrans = false, 
        rockThrow = false
    };
    return v10;
end;
v8.SelfInvisibility = function(v11, v12) --[[ Line: 32 ]] --[[ Name: SelfInvisibility ]]
    -- upvalues: l_LocalPlayer_0 (copy), l_ReplicatedStorage_0 (copy), v3 (copy), v6 (copy)
    local l_Character_0 = l_LocalPlayer_0.Character;
    local v14 = l_ReplicatedStorage_0["Stats" .. l_LocalPlayer_0.Name];
    local l_Cooldowns_0 = v11.Cooldowns;
    if l_Character_0:FindFirstChild("Suke") == nil and l_Cooldowns_0.selfTrans == false and _G.check:inspect(l_Character_0) == true and _G.StamCheck("Self Invisibility") == true then
        local v16 = v3.GetM("Self Invisibility");
        local l_cd_0 = v16.cd;
        if _G.StamCheck("Self Invisibility") == false then
            return;
        elseif v16.statreq and _G.MeetReq(v16.statreq) == false then
            return;
        else
            l_Cooldowns_0.selfTrans = true;
            l_Character_0.Humanoid:LoadAnimation(script.selft):Play();
            task.wait(0.25);
            local v18 = v6:start(l_Character_0);
            local v19 = game.ReplicatedStorage.Events.Skill:InvokeServer("Self Invisibility");
            local v20 = nil;
            local v21 = nil;
            local v22 = nil;
            local v23 = tick();
            if v19 then
                local v24, v25, v26 = unpack(v19);
                v20 = v24;
                v21 = v25;
                v22 = v26;
            end;
            if v22 == nil then
                v22 = 0;
            end;
            if v20 == nil then
                v18:Fire();
            end;
            local v27 = false;
            task.wait(0.5);
            do
                local l_v20_0, l_v21_0, l_v22_0, l_v27_0 = v20, v21, v22, v27;
                v11:DoubleCastSkill(v12, {
                    Key = Enum.KeyCode.E, 
                    Button = v12, 
                    SkipTap = true, 
                    CompleteFunction = function() --[[ Line: 70 ]] --[[ Name: CompleteFunction ]]
                        -- upvalues: l_v27_0 (ref)
                        l_v27_0 = true;
                    end, 
                    PassFunction = function() --[[ Line: 73 ]] --[[ Name: PassFunction ]]
                        -- upvalues: v11 (copy), l_Character_0 (copy)
                        return v11.Tool.Parent == l_Character_0;
                    end, 
                    CancelFunction = function() --[[ Line: 76 ]] --[[ Name: CancelFunction ]]
                        -- upvalues: l_v20_0 (ref), v23 (copy), l_v22_0 (ref), l_v21_0 (ref), l_Character_0 (copy), l_v27_0 (ref), v14 (copy)
                        local v32 = true;
                        if l_v20_0 ~= nil then
                            v32 = true;
                            if tick() - v23 < l_v22_0 then
                                v32 = l_v21_0 ~= nil and l_v21_0.Parent ~= l_Character_0 or l_v27_0 == true or l_Character_0.Parent == nil or l_Character_0.Parent ~= workspace.PlayerCharacters or v14.Stamina.Value <= 0;
                            end;
                        end;
                        return v32;
                    end
                });
                repeat
                    task.wait();
                until l_v27_0 == true;
                if l_v20_0 then
                    if v18 then
                        v18:Fire();
                    end;
                    l_v20_0:InvokeServer();
                end;
                task.wait(0.25);
                _G.keysetup:cooldown("Self Invisibility", l_cd_0);
                _G.fw(l_cd_0);
                l_Cooldowns_0.selfTrans = false;
            end;
        end;
    end;
end;
v8.AreaInvisibility = function(v33, v34) --[[ Line: 98 ]] --[[ Name: AreaInvisibility ]]
    -- upvalues: l_LocalPlayer_0 (copy), l_ReplicatedStorage_0 (copy), v3 (copy), v6 (copy)
    local l_Character_1 = l_LocalPlayer_0.Character;
    local v36 = l_ReplicatedStorage_0["Stats" .. l_LocalPlayer_0.Name];
    local l_Cooldowns_1 = v33.Cooldowns;
    if l_Character_1:FindFirstChild("Suke") == nil and l_Cooldowns_1.aoeTrans == false and _G.check:inspect(l_Character_1) == true and _G.StamCheck("Area Invisibility") == true then
        local v38 = v3.GetM("Area Invisibility");
        local l_cd_1 = v38.cd;
        if _G.StamCheck("Area Invisibility") == false then
            return;
        elseif v38.statreq and _G.MeetReq(v38.statreq) == false then
            return;
        else
            l_Cooldowns_1.aoeTrans = true;
            l_Character_1.Humanoid:LoadAnimation(script.aoe):Play();
            task.wait(0.3);
            local v40 = v6:start(l_Character_1);
            local v41 = game.ReplicatedStorage.Events.Skill:InvokeServer("Area Invisibility");
            local v42 = nil;
            local v43 = nil;
            local v44 = nil;
            local v45 = false;
            if v41 then
                local v46, v47, v48 = unpack(v41);
                v42 = v46;
                v43 = v47;
                v44 = v48;
            end;
            if v44 == nil then
                v44 = 0;
            end;
            if v42 == nil then
                v40:Fire();
            end;
            task.wait(0.5);
            local v49 = tick();
            do
                local l_v42_0, l_v43_0, l_v44_0, l_v45_0 = v42, v43, v44, v45;
                v33:DoubleCastSkill(v34, {
                    Key = Enum.KeyCode.R, 
                    Button = v34, 
                    CompleteFunction = function() --[[ Line: 138 ]] --[[ Name: CompleteFunction ]]
                        -- upvalues: l_v45_0 (ref)
                        l_v45_0 = true;
                    end, 
                    SkipTap = true, 
                    PassFunction = function() --[[ Line: 142 ]] --[[ Name: PassFunction ]]
                        -- upvalues: v33 (copy), l_Character_1 (copy)
                        return v33.Tool.Parent == l_Character_1;
                    end, 
                    CancelFunction = function() --[[ Line: 145 ]] --[[ Name: CancelFunction ]]
                        -- upvalues: l_v42_0 (ref), v49 (copy), l_v44_0 (ref), l_v43_0 (ref), l_Character_1 (copy), l_v45_0 (ref), v36 (copy)
                        local v54 = true;
                        if l_v42_0 ~= nil then
                            v54 = true;
                            if tick() - v49 < l_v44_0 then
                                v54 = l_v43_0 ~= nil and l_v43_0.Parent ~= l_Character_1 or l_v45_0 == true or not l_Character_1:FindFirstChild("Suke-Suke") or l_Character_1.Parent == nil or l_Character_1.Parent ~= workspace.PlayerCharacters or v36.Stamina.Value <= 0;
                            end;
                        end;
                        return v54;
                    end
                });
                repeat
                    task.wait();
                until l_v45_0 == true;
                if l_v42_0 then
                    if v40 then
                        v40:Fire();
                    end;
                    l_v42_0:InvokeServer();
                end;
                task.wait(0.25);
                _G.keysetup:cooldown("Area Invisibility", l_cd_1);
                _G.fw(l_cd_1);
                l_Cooldowns_1.aoeTrans = false;
            end;
        end;
    end;
end;
v8.InvisibleRockThrow = function(v55, v56) --[[ Line: 170 ]] --[[ Name: InvisibleRockThrow ]]
    -- upvalues: l_LocalPlayer_0 (copy), l_ReplicatedStorage_0 (copy), v3 (copy)
    local l_Character_2 = l_LocalPlayer_0.Character;
    local v58 = l_ReplicatedStorage_0["Stats" .. l_LocalPlayer_0.Name];
    local l_Cooldowns_2 = v55.Cooldowns;
    if l_Cooldowns_2.rockThrow == false and _G.check:inspect(l_Character_2) == true and _G.StamCheck("Invisible Rock Throw") == true then
        local v60 = v3.GetM("Invisible Rock Throw");
        local l_cd_2 = v60.cd;
        if _G.StamCheck("Invisible Rock Throw") == false then
            return;
        elseif v60.statreq and _G.MeetReq(v60.statreq) == false then
            return;
        else
            local v62 = Ray.new(l_Character_2.HumanoidRootPart.CFrame.p, l_Character_2.HumanoidRootPart.CFrame.upVector * -10);
            local v63, _, _ = _G.raycastIgnoreList(v62, {
                workspace.Effects, 
                workspace.Projectiles, 
                workspace.PlayerCharacters, 
                workspace.NPCs, 
                workspace.Ragdolls
            });
            if v63 == nil then
                return;
            else
                l_Cooldowns_2.rockThrow = true;
                _G.canuse = false;
                local v66 = l_Character_2.Humanoid:LoadAnimation(script.rockthrow);
                v66:Play();
                v66:AdjustWeight(2);
                local v67 = nil;
                do
                    local l_v67_0 = v67;
                    spawn(function() --[[ Line: 195 ]]
                        -- upvalues: l_v67_0 (ref)
                        task.wait(0.1);
                        l_v67_0 = game.ReplicatedStorage.Events.Skill:InvokeServer("Invisible Rock Throw");
                    end);
                    _G.PauseAnim(v66, 0.55, 1);
                    _G.FaceMouse = true;
                    local _ = tick();
                    v55:ChargeSkill(v56, {
                        Key = Enum.KeyCode.Z, 
                        EndFunction = function() --[[ Line: 206 ]] --[[ Name: EndFunction ]]
                            -- upvalues: l_Character_2 (copy), v58 (copy)
                            return not l_Character_2:FindFirstChild("Suke-Suke") or l_Character_2.Parent == nil or l_Character_2.Parent ~= workspace.PlayerCharacters or v58.Stamina.Value <= 0;
                        end
                    });
                    _G.FaceMouse = false;
                    l_Character_2.HumanoidRootPart.Anchored = true;
                    v66:AdjustSpeed(1);
                    task.wait(0.19999999999999996);
                    if l_v67_0 then
                        local l_p_0 = v55:GetMouseCFrame().p;
                        l_v67_0:InvokeServer(l_p_0);
                    end;
                    task.wait(0.1);
                    l_Character_2.HumanoidRootPart.Anchored = false;
                    _G.canuse = true;
                    _G.keysetup:cooldown("Invisible Rock Throw", l_cd_2);
                    _G.fw(l_cd_2);
                    l_Cooldowns_2.rockThrow = false;
                end;
            end;
        end;
    end;
end;
return v8;