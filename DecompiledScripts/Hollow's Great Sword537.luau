local l_LocalPlayer_0 = game.Players.LocalPlayer;
local _ = game:GetService("RunService");
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local v3 = require(game.ReplicatedStorage.Modules.Skills);
local v4 = require(script.Parent.Parent.MobileBase);
local l_PlayerModule_0 = require(l_LocalPlayer_0.PlayerScripts:WaitForChild("PlayerModule"));
local _ = l_LocalPlayer_0:GetMouse();
local _ = l_PlayerModule_0:GetControls();
local v8 = setmetatable({}, v4);
v8.__index = v8;
v8.new = function(_) --[[ Line: 20 ]] --[[ Name: new ]]
    -- upvalues: v4 (copy), v8 (copy)
    local v10 = setmetatable(v4.new(script.Name), v8);
    v10.Cooldowns = {
        spin = false, 
        sweep = false
    };
    return v10;
end;
local v11 = "First";
local v12 = false;
v8.GhostBarrage = function(v13, v14) --[[ Line: 32 ]] --[[ Name: GhostBarrage ]]
    -- upvalues: l_LocalPlayer_0 (copy), l_ReplicatedStorage_0 (copy), v3 (copy)
    local l_Cooldowns_0 = v13.Cooldowns;
    local l_Character_0 = l_LocalPlayer_0.Character;
    local _ = l_ReplicatedStorage_0["Stats" .. l_LocalPlayer_0.Name];
    if l_Cooldowns_0.spin == false and _G.check:inspect(l_Character_0) == true then
        local v18 = v3.GetM("Ghost Barrage");
        local l_cd_0 = v18.cd;
        if _G.StamCheck("Ghost Barrage") == false then
            return;
        elseif v18.statreq and _G.MeetReq(v18.statreq) == false then
            return;
        else
            l_Cooldowns_0.spin = true;
            _G.canuse = false;
            local v20 = tick();
            local v21 = l_Character_0.Humanoid:LoadAnimation(script.floorLand);
            v21:Play();
            v21:AdjustWeight(5);
            l_Character_0.Humanoid.WalkSpeed = 4;
            _G.PauseAnim(v21, 0.4, 1);
            v13:ChargeSkill(v14, {
                Key = Enum.KeyCode.R, 
                CheckFunction = function() --[[ Line: 59 ]] --[[ Name: checkFunction ]]
                    -- upvalues: l_Character_0 (copy)
                    l_Character_0.Humanoid.WalkSpeed = 4;
                    if _G.check:inspect(l_Character_0) == false then
                        return true;
                    else
                        return;
                    end;
                end, 
                EndFunction = function() --[[ Line: 66 ]] --[[ Name: endFunction ]]
                    -- upvalues: l_Character_0 (copy), v20 (copy)
                    if l_Character_0:FindFirstChild(script.Name) == nil or tick() - v20 >= 10 then
                        return true;
                    else
                        return;
                    end;
                end
            });
            v21:AdjustSpeed(1);
            l_Character_0.HumanoidRootPart.Anchored = true;
            task.wait(0.2);
            local v22 = game.ReplicatedStorage.Events.Skill:InvokeServer("Ghost Barrage", {
                l_Character_0.PrimaryPart.CFrame
            });
            if v22 == nil or v22 and v22 <= 0 then
                task.wait(0.75);
            else
                task.wait(1.4);
            end;
            l_Character_0.HumanoidRootPart.Anchored = false;
            l_Character_0.Humanoid.WalkSpeed = 16;
            _G.canuse = true;
            _G.keysetup:cooldown("Ghost Barrage", l_cd_0);
            _G.fw(l_cd_0);
            l_Cooldowns_0.spin = false;
        end;
    end;
end;
v8.SpiritPierce = function(v23, v24) --[[ Line: 99 ]] --[[ Name: SpiritPierce ]]
    -- upvalues: l_LocalPlayer_0 (copy), l_ReplicatedStorage_0 (copy), v3 (copy), v12 (ref), v11 (ref)
    local l_Cooldowns_1 = v23.Cooldowns;
    local l_Character_1 = l_LocalPlayer_0.Character;
    local _ = l_ReplicatedStorage_0["Stats" .. l_LocalPlayer_0.Name];
    if l_Cooldowns_1.sweep == false and _G.check:inspect(l_Character_1) == true then
        local v28 = v3.GetM("Spirit Pierce");
        local l_cd_1 = v28.cd;
        if _G.StamCheck("Spirit Pierce") == false then
            return;
        elseif v28.statreq and _G.MeetReq(v28.statreq) == false then
            return;
        else
            l_Cooldowns_1.sweep = true;
            _G.canuse = false;
            l_Character_1.Humanoid.AutoRotate = false;
            local l_BodyVelocity_0 = Instance.new("BodyVelocity");
            l_BodyVelocity_0.MaxForce = Vector3.new(100000, 100000, 100000, 0);
            l_BodyVelocity_0.P = 500000;
            l_BodyVelocity_0.Parent = l_Character_1.HumanoidRootPart;
            l_BodyVelocity_0.Velocity = l_Character_1.HumanoidRootPart.CFrame.lookVector * 75;
            _G.destroy(l_BodyVelocity_0, 0.25);
            v12 = false;
            local v31 = l_Character_1.Humanoid:LoadAnimation(script["Slash" .. v11]);
            v31:Play();
            v31:AdjustWeight(5);
            task.wait(0.1);
            l_BodyVelocity_0.Velocity = Vector3.new();
            local v32 = game.ReplicatedStorage.Events.Skill:InvokeServer("Spirit Pierce", {
                l_Character_1.PrimaryPart.CFrame, 
                v11
            });
            task.spawn(function() --[[ Line: 135 ]]
                -- upvalues: v23 (copy), v24 (copy), v32 (copy), l_Character_1 (copy), v11 (ref), v12 (ref)
                v23:DoubleCastSkill(v24, {
                    Key = Enum.KeyCode.E, 
                    SkipTap = true, 
                    CompleteFunction = function() --[[ Line: 139 ]] --[[ Name: CompleteFunction ]]
                        -- upvalues: v32 (ref), l_Character_1 (ref), v11 (ref), v12 (ref)
                        if v32 then
                            local v33 = l_Character_1.Humanoid:LoadAnimation(script["Slash" .. v11]);
                            v33:Play();
                            v33:AdjustWeight(5);
                            local l_BodyVelocity_1 = Instance.new("BodyVelocity");
                            l_BodyVelocity_1.MaxForce = Vector3.new(100000, 100000, 100000, 0);
                            l_BodyVelocity_1.P = 500000;
                            l_BodyVelocity_1.Parent = l_Character_1.HumanoidRootPart;
                            l_BodyVelocity_1.Velocity = l_Character_1.HumanoidRootPart.CFrame.lookVector * 75;
                            _G.destroy(l_BodyVelocity_1, 0.25);
                            task.wait(0.1);
                            l_BodyVelocity_1.Velocity = Vector3.new();
                            v32:FireServer({
                                l_Character_1.PrimaryPart.CFrame, 
                                v11
                            });
                            v11 = "First";
                            v12 = true;
                        end;
                    end, 
                    PassFunction = function() --[[ Line: 158 ]] --[[ Name: PassFunction ]]
                        -- upvalues: l_Character_1 (ref)
                        return l_Character_1:FindFirstChild(script.Name) and _G.check:inspect(l_Character_1) == true and _G.canuse == true;
                    end
                });
            end);
            task.wait(0.5);
            if v11 == "First" then
                v11 = "Second";
            else
                v11 = "First";
            end;
            l_Character_1.Humanoid.AutoRotate = true;
            _G.canuse = true;
            repeat
                task.wait(0.1);
            until v12 == true or v32 == nil;
            _G.keysetup:cooldown("Spirit Pierce", l_cd_1);
            _G.fw(l_cd_1);
            l_Cooldowns_1.sweep = false;
        end;
    end;
end;
return v8;