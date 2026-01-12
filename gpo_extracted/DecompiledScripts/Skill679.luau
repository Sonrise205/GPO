local v0 = {};
local v1, _, v3, _, _ = require(game.ReplicatedStorage.Modules.ScriptSet).get();
local v6 = nil;
local v7 = {
    spin = false, 
    smash = false, 
    Throw = false
};
local _ = require(game.ReplicatedStorage.Modules.RotatedRegion3);
local v9 = require(game.ReplicatedStorage.Modules.Skills);
local v10 = nil;
v0.setup = function(_, v12, v13) --[[ Line: 12 ]] --[[ Name: setup ]]
    -- upvalues: v6 (ref), v10 (ref), v7 (copy), v1 (copy), v3 (copy), v9 (copy)
    if v6 then
        v6:Disconnect();
    end;
    if v10 ~= v12 then
        for v14, _ in v7 do
            v7[v14] = false;
        end;
    end;
    v10 = v12;
    local l_FirstChild_0 = game.ReplicatedStorage:FindFirstChild("Stats" .. v1.Name);
    v6 = v3.InputBegan:Connect(function(v17, v18) --[[ Line: 23 ]]
        -- upvalues: v13 (copy), v12 (copy), v7 (ref), v9 (ref), l_FirstChild_0 (copy)
        if v13.Parent ~= v12 or _G.canuse == false or v18 == true then
            return;
        elseif v17.KeyCode == Enum.KeyCode.E and v7.spin == false and _G.check:inspect(v12) == true then
            local v19 = v9.GetM("Kiribachi Frenzy");
            local l_cd_0 = v19.cd;
            if _G.StamCheck("Kiribachi Frenzy") == false then
                return;
            elseif v19.statreq and _G.MeetReq(v19.statreq) == false then
                return;
            else
                local v21 = v12.Humanoid.Animator:LoadAnimation(script.windup);
                v21:Play();
                v21:AdjustWeight(2);
                v7.spin = true;
                _G.canuse = false;
                _G.PauseAnim(v21, 0.4, 1);
                v21:Stop();
                local v22 = v12.Humanoid.Animator:LoadAnimation(script.loop);
                v22:Play();
                v22:AdjustSpeed(1);
                local v23 = game.ReplicatedStorage.Events.Skill:InvokeServer("Kiribachi Frenzy");
                local v24 = tick();
                local v25 = Instance.new("BodyVelocity", v12.HumanoidRootPart);
                v25.MaxForce = Vector3.new(1000000, 0, 1000000, 0);
                local function v26() --[[ Line: 54 ]] --[[ Name: checkFunction ]]
                    -- upvalues: v12 (ref), v22 (copy), v25 (copy)
                    if _G.check:inspect(v12) == false then
                        v22:Stop();
                        return true;
                    else
                        v25.Velocity = v12.HumanoidRootPart.CFrame.lookVector * 30;
                        return;
                    end;
                end;
                local function v27() --[[ Line: 63 ]] --[[ Name: endFunction ]]
                    -- upvalues: v13 (ref), v12 (ref), v24 (copy), l_FirstChild_0 (ref)
                    if v13.Parent ~= v12 or tick() - v24 >= 3 or v12:FindFirstChild("Stun") or l_FirstChild_0.Stamina.Value <= 0 then
                        return true;
                    else
                        return;
                    end;
                end;
                _G.holdSkill(Enum.KeyCode.E, v26, v27);
                v25:Destroy();
                v22:Stop();
                if v23 then
                    v23:FireServer();
                end;
                v12.Humanoid.WalkSpeed = 16;
                _G.canuse = true;
                _G.keysetup:cooldown("Kiribachi Frenzy", l_cd_0);
                _G.fw(l_cd_0);
                v7.spin = false;
                return;
            end;
        else
            if v17.KeyCode == Enum.KeyCode.R and v7.smash == false and _G.check:inspect(v12) == true then
                local v28 = v9.GetM("Kiribachi Smash");
                local l_cd_1 = v28.cd;
                if _G.StamCheck("Kiribachi Smash") == false then
                    return;
                elseif v28.statreq and _G.MeetReq(v28.statreq) == false then
                    return;
                else
                    local v30 = v12.Humanoid.Animator:LoadAnimation(script.smash);
                    v30:Play();
                    v30:AdjustWeight(2);
                    v12.Humanoid.WalkSpeed = 4;
                    v7.smash = true;
                    _G.canuse = false;
                    local v31 = game.ReplicatedStorage.Events.Skill:InvokeServer("Kiribachi Smash");
                    _G.PauseAnim(v30, 0.5, 1);
                    local function v32() --[[ Line: 103 ]] --[[ Name: checkFunction ]]
                        -- upvalues: v12 (ref), v30 (copy)
                        if _G.check:inspect(v12) == false then
                            v30:Stop();
                            return true;
                        else
                            v12.Humanoid.WalkSpeed = 4;
                            return;
                        end;
                    end;
                    local function v33() --[[ Line: 111 ]] --[[ Name: endFunction ]]
                        -- upvalues: v13 (ref), v12 (ref)
                        if v13.Parent ~= v12 then
                            return true;
                        else
                            return;
                        end;
                    end;
                    _G.holdSkill(Enum.KeyCode.R, v32, v33);
                    v30:AdjustSpeed(1);
                    if v31 then
                        v31:FireServer();
                    end;
                    task.wait(0.15);
                    v12.Humanoid.WalkSpeed = 16;
                    _G.canuse = true;
                    _G.keysetup:cooldown("Kiribachi Smash", l_cd_1);
                    _G.fw(l_cd_1);
                    v7.smash = false;
                end;
            end;
            return;
        end;
    end);
    return weaponCallbacks;
end;
return v0;