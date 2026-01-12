local v0 = {};
local v1, _, v3, _, _ = require(game.ReplicatedStorage.Modules.ScriptSet).get();
local v6 = nil;
local v7 = {
    heal = false, 
    freeze = false
};
local v8 = require(game.ReplicatedStorage.Modules.Skills);
local v9 = nil;
v0.setup = function(_, v11, v12) --[[ Line: 11 ]] --[[ Name: setup ]]
    -- upvalues: v6 (ref), v9 (ref), v7 (copy), v1 (copy), v3 (copy), v8 (copy)
    if v6 then
        v6:Disconnect();
        v6 = nil;
    end;
    if v9 ~= v11 then
        for v13, _ in v7 do
            v7[v13] = false;
        end;
    end;
    v9 = v11;
    local _ = game.ReplicatedStorage:FindFirstChild("Stats" .. v1.Name);
    v6 = v3.InputBegan:Connect(function(v16, v17) --[[ Line: 23 ]]
        -- upvalues: v12 (copy), v11 (copy), v7 (ref), v8 (ref), v3 (ref)
        if v12.Parent ~= v11 or _G.canuse == false or v17 == true then
            return;
        elseif v16.KeyCode == Enum.KeyCode.E and v7.heal == false and _G.check:inspect(v11) == true then
            local v18 = v8.GetM("Sweet Treat");
            local l_cd_0 = v18.cd;
            if _G.StamCheck("Sweet Treat") == false then
                return;
            elseif v18.statreq and _G.MeetReq(v18.statreq) == false then
                return;
            else
                _G.canuse = false;
                v7.heal = true;
                game.ReplicatedStorage.Events.Skill:InvokeServer("Sweet Treat");
                _G.canuse = true;
                _G.keysetup:cooldown("Sweet Treat", l_cd_0);
                _G.fw(l_cd_0);
                v7.heal = false;
                return;
            end;
        else
            if v16.KeyCode == Enum.KeyCode.R and v7.freeze == false and _G.check:inspect(v11) == true then
                local v20 = v8.GetM("Flash Freeze");
                local l_cd_1 = v20.cd;
                if _G.StamCheck("Flash Freeze") == false then
                    return;
                elseif v20.statreq and _G.MeetReq(v20.statreq) == false then
                    return;
                else
                    _G.canuse = false;
                    local v22 = v11.Humanoid.Animator:LoadAnimation(script.freeze);
                    v22:Play();
                    v22:AdjustWeight(2);
                    v11.Humanoid.WalkSpeed = 4;
                    _G.PauseAnim(v22, 0.4, 1);
                    while true do
                        game["Run Service"].RenderStepped:Wait();
                        if _G.check:inspect(v11) == false then
                            v22:Stop();
                            break;
                        else
                            v11.Humanoid.WalkSpeed = 4;
                            if v3:IsKeyDown(Enum.KeyCode.R) == false or v12.Parent ~= v11 then
                                break;
                            end;
                        end;
                    end;
                    v7.freeze = true;
                    v22:AdjustSpeed(1);
                    task.wait(0.2);
                    game.ReplicatedStorage.Events.Skill:InvokeServer("Flash Freeze");
                    task.wait(0.2);
                    v11.Humanoid.WalkSpeed = 16;
                    _G.canuse = true;
                    _G.keysetup:cooldown("Flash Freeze", l_cd_1);
                    _G.fw(l_cd_1);
                    v7.freeze = false;
                end;
            end;
            return;
        end;
    end);
    return weaponCallbacks;
end;
return v0;