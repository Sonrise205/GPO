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
        beat = false
    };
    return v10;
end;
v8.PipeRush = function(v11, v12) --[[ Line: 28 ]] --[[ Name: PipeRush ]]
    -- upvalues: l_LocalPlayer_0 (copy), l_ReplicatedStorage_0 (copy), v3 (copy)
    local l_Cooldowns_0 = v11.Cooldowns;
    local l_Character_0 = l_LocalPlayer_0.Character;
    local v15 = l_ReplicatedStorage_0["Stats" .. l_LocalPlayer_0.Name];
    if l_Cooldowns_0.spin == false and _G.check:inspect(l_Character_0) == true then
        local v16 = v3.GetM("Pipe Rush");
        local l_cd_0 = v16.cd;
        if _G.StamCheck("Pipe Rush") == false then
            return;
        elseif v16.statreq and _G.MeetReq(v16.statreq) == false then
            return;
        else
            local v18 = l_Character_0.Humanoid.Animator:LoadAnimation(script.spin);
            v18:Play();
            v18:AdjustWeight(2);
            l_Cooldowns_0.spin = true;
            _G.canuse = false;
            l_Character_0.Humanoid.WalkSpeed = 4;
            local v19 = game.ReplicatedStorage.Events.Skill:InvokeServer("Pipe Rush");
            _G.PauseAnim(v18, 0.2, 1.5);
            local v20 = tick();
            local function v21() --[[ Line: 56 ]] --[[ Name: checkFunction ]]
                -- upvalues: l_Character_0 (copy)
                l_Character_0.Humanoid.WalkSpeed = 4;
            end;
            do
                local l_v20_0 = v20;
                local function v23() --[[ Line: 61 ]] --[[ Name: endFunction ]]
                    -- upvalues: l_Character_0 (copy), l_v20_0 (ref), v15 (copy)
                    if l_Character_0:FindFirstChild(script.Name) == nil or tick() - l_v20_0 >= 5 or l_Character_0:FindFirstChild("Stun") or v15.Stamina.Value <= 0 then
                        return true;
                    else
                        return;
                    end;
                end;
                v11:ChargeSkill(v12, {
                    Key = Enum.KeyCode.E, 
                    CheckFunction = v21, 
                    EndFunction = v23
                });
                v18:AdjustSpeed(1);
                task.wait(0.2);
                local l_BodyVelocity_0 = Instance.new("BodyVelocity");
                l_BodyVelocity_0.MaxForce = Vector3.new(99999997952, 99999997952, 99999997952, 0);
                l_BodyVelocity_0.Velocity = (l_Character_0.PrimaryPart.CFrame.UpVector * 0.2 + l_Character_0.PrimaryPart.CFrame.LookVector * 1) * 60;
                l_BodyVelocity_0.Name = "geppo";
                l_BodyVelocity_0.Parent = l_Character_0.PrimaryPart;
                _G.destroy(l_BodyVelocity_0, 0.23);
                l_Character_0.Humanoid.WalkSpeed = 16;
                if v19 then
                    v19:FireServer(l_Character_0.PrimaryPart.CFrame);
                    l_v20_0 = tick();
                    repeat
                        task.wait();
                        v19:FireServer("newCF", l_Character_0.PrimaryPart.CFrame);
                    until tick() - l_v20_0 >= 1;
                end;
                _G.keysetup:cooldown("Pipe Rush", l_cd_0);
                _G.canuse = true;
                _G.fw(l_cd_0);
                l_Cooldowns_0.spin = false;
            end;
        end;
    end;
end;
v8.PipeBeatdown = function(v25, v26) --[[ Line: 98 ]] --[[ Name: PipeBeatdown ]]
    -- upvalues: l_LocalPlayer_0 (copy), l_ReplicatedStorage_0 (copy), v3 (copy)
    local l_Cooldowns_1 = v25.Cooldowns;
    local l_Character_1 = l_LocalPlayer_0.Character;
    local v29 = l_ReplicatedStorage_0["Stats" .. l_LocalPlayer_0.Name];
    if l_Cooldowns_1.beat == false and _G.check:inspect(l_Character_1) == true then
        local v30 = v3.GetM("Pipe Beatdown");
        local l_cd_1 = v30.cd;
        if _G.StamCheck("Pipe Beatdown") == false then
            return;
        elseif v30.statreq and _G.MeetReq(v30.statreq) == false then
            return;
        else
            local v32 = l_Character_1.Humanoid.Animator:LoadAnimation(script.wind);
            v32:Play();
            v32:AdjustWeight(2);
            l_Cooldowns_1.beat = true;
            _G.canuse = false;
            l_Character_1.Humanoid.WalkSpeed = 4;
            local v33 = game.ReplicatedStorage.Events.Skill:InvokeServer("Pipe Beatdown");
            _G.PauseAnim(v32, 0.2, 1);
            local v34 = tick();
            v25:ChargeSkill(v26, {
                Key = Enum.KeyCode.R, 
                CheckFunction = function() --[[ Line: 126 ]] --[[ Name: checkFunction ]]
                    -- upvalues: l_Character_1 (copy)
                    l_Character_1.Humanoid.WalkSpeed = 4;
                end, 
                EndFunction = function() --[[ Line: 130 ]] --[[ Name: endFunction ]]
                    -- upvalues: l_Character_1 (copy), v34 (copy), v29 (copy)
                    if l_Character_1:FindFirstChild(script.Name) == nil or tick() - v34 >= 2 or l_Character_1:FindFirstChild("Stun") or v29.Stamina.Value <= 0 then
                        return true;
                    else
                        return;
                    end;
                end
            });
            v32:AdjustSpeed(1.25);
            task.wait(0.22499999999999998);
            l_Character_1.Humanoid.WalkSpeed = 16;
            if v33 then
                v33:FireServer(l_Character_1.PrimaryPart.CFrame);
            end;
            _G.keysetup:cooldown("Pipe Beatdown", l_cd_1);
            task.wait(0.5);
            _G.canuse = true;
            _G.fw(l_cd_1);
            l_Cooldowns_1.beat = false;
        end;
    end;
end;
return v8;