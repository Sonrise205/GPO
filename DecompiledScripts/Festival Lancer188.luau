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
        wall = false, 
        crash = false
    };
    return v10;
end;
v8.FrostWall = function(v11, v12) --[[ Line: 28 ]] --[[ Name: FrostWall ]]
    -- upvalues: l_LocalPlayer_0 (copy), l_ReplicatedStorage_0 (copy), v3 (copy)
    local l_Cooldowns_0 = v11.Cooldowns;
    local l_Character_0 = l_LocalPlayer_0.Character;
    local _ = l_ReplicatedStorage_0["Stats" .. l_LocalPlayer_0.Name];
    if l_Cooldowns_0.wall == false and _G.check:inspect(l_Character_0) == true then
        local v16 = v3.GetM("Frost Wall");
        local l_cd_0 = v16.cd;
        if _G.StamCheck("Frost Wall") == false then
            return;
        elseif v16.statreq and _G.MeetReq(v16.statreq) == false then
            return;
        else
            local v18 = l_Character_0.Humanoid.Animator:LoadAnimation(script.wallSummon);
            v18:Play();
            v18:AdjustWeight(4);
            v18:AdjustSpeed(1);
            l_Cooldowns_0.wall = true;
            _G.canuse = false;
            _G.FaceMouse = true;
            _G.PauseAnim(v18, 0.22, 1);
            local v19 = tick();
            v11:ChargeSkill(v12, {
                Key = Enum.KeyCode.E, 
                CheckFunction = function() --[[ Line: 56 ]] --[[ Name: checkFunction ]]
                    -- upvalues: l_Character_0 (copy), v18 (copy)
                    if _G.check:inspect(l_Character_0) == false then
                        v18:Stop();
                        return true;
                    else
                        return;
                    end;
                end, 
                EndFunction = function() --[[ Line: 64 ]] --[[ Name: endFunction ]]
                    -- upvalues: l_Character_0 (copy), v19 (copy)
                    if l_Character_0:FindFirstChild(script.Name) == nil or tick() - v19 >= 10 then
                        return true;
                    else
                        return;
                    end;
                end
            });
            v18:AdjustSpeed(2);
            l_Character_0.HumanoidRootPart.Anchored = true;
            _G.FaceMouse = false;
            task.wait(0.1);
            game.ReplicatedStorage.Events.Skill:InvokeServer("Frost Wall", v11:GetMouseCFrame());
            task.wait(0.35);
            l_Character_0.Humanoid.AutoRotate = true;
            l_Character_0.HumanoidRootPart.Anchored = false;
            l_Character_0.Humanoid.WalkSpeed = 16;
            _G.canuse = true;
            _G.keysetup:cooldown("Frost Wall", l_cd_0);
            _G.fw(l_cd_0);
            l_Cooldowns_0.wall = false;
        end;
    end;
end;
v8.FestivalCrash = function(v20, v21) --[[ Line: 96 ]] --[[ Name: FestivalCrash ]]
    -- upvalues: l_LocalPlayer_0 (copy), l_ReplicatedStorage_0 (copy), v3 (copy)
    local l_Cooldowns_1 = v20.Cooldowns;
    local l_Character_1 = l_LocalPlayer_0.Character;
    local _ = l_ReplicatedStorage_0["Stats" .. l_LocalPlayer_0.Name];
    if l_Cooldowns_1.crash == false and _G.check:inspect(l_Character_1) == true then
        local v25 = v3.GetM("Festival Crash");
        local l_cd_1 = v25.cd;
        if _G.StamCheck("Festival Crash") == false then
            return;
        elseif v25.statreq and _G.MeetReq(v25.statreq) == false then
            return;
        else
            local v27 = l_Character_1.Humanoid.Animator:LoadAnimation(script.windup);
            v27:Play();
            v27:AdjustWeight(2);
            v27:AdjustSpeed(1);
            l_Cooldowns_1.crash = true;
            _G.canuse = false;
            l_Character_1.Humanoid.WalkSpeed = 4;
            local v28 = game.ReplicatedStorage.Events.Skill:InvokeServer("Festival Crash");
            _G.PauseAnim(v27, 0.27, 1);
            local v29 = tick();
            v20:ChargeSkill(v21, {
                Key = Enum.KeyCode.R, 
                CheckFunction = function() --[[ Line: 124 ]] --[[ Name: checkFunction ]]
                    -- upvalues: l_Character_1 (copy), v27 (copy)
                    if _G.check:inspect(l_Character_1) == false then
                        v27:Stop();
                        return true;
                    else
                        l_Character_1.Humanoid.WalkSpeed = 4;
                        return;
                    end;
                end, 
                EndFunction = function() --[[ Line: 133 ]] --[[ Name: endFunction ]]
                    -- upvalues: l_Character_1 (copy), v29 (copy)
                    if l_Character_1:FindFirstChild(script.Name) == nil or tick() - v29 >= 6 then
                        return true;
                    else
                        return;
                    end;
                end
            });
            v27:AdjustSpeed(2);
            local v30 = Instance.new("BodyVelocity", l_Character_1.HumanoidRootPart);
            v30.MaxForce = Vector3.new(100000, 0, 100000, 0);
            v30.Velocity = l_Character_1.HumanoidRootPart.CFrame.lookVector * 100;
            _G.destroy(v30, 0.15);
            if v28 then
                v28:FireServer("sfx");
            end;
            local _ = nil;
            local v32 = false;
            local function v34(v33) --[[ Line: 154 ]] --[[ Name: hitfound ]]
                -- upvalues: v30 (copy), l_Character_1 (copy), v28 (copy)
                v30:Destroy();
                l_Character_1.HumanoidRootPart.Velocity = Vector3.new(0, 0, 0, 0);
                if v28 then
                    v28:FireServer({
                        cf = l_Character_1.PrimaryPart.CFrame, 
                        Target = v33.Parent
                    });
                end;
            end;
            do
                local l_v32_0 = v32;
                local function v36() --[[ Line: 161 ]] --[[ Name: hitinter ]]
                    -- upvalues: v30 (copy), l_v32_0 (ref), v27 (copy)
                    v30:Destroy();
                    l_v32_0 = true;
                    v27:Stop();
                end;
                _G.hitbox:start(l_Character_1, Vector3.new(8, 5, 12, 0), 0.3, CFrame.new(0, 0, -3), v34, v36);
                warn("client finished");
                l_Character_1.Humanoid.WalkSpeed = 16;
                _G.canuse = true;
                _G.keysetup:cooldown("Festival Crash", l_cd_1);
                _G.fw(l_cd_1);
                l_Cooldowns_1.crash = false;
            end;
        end;
    end;
end;
return v8;