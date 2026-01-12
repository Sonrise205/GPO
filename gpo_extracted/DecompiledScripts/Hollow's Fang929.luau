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
        upper = false, 
        dash = false
    };
    return v10;
end;
v8["Shadow'sMark"] = function(v11, v12) --[[ Line: 28 ]]
    -- upvalues: l_LocalPlayer_0 (copy), l_ReplicatedStorage_0 (copy), v3 (copy)
    local l_Cooldowns_0 = v11.Cooldowns;
    local l_Character_0 = l_LocalPlayer_0.Character;
    local _ = l_ReplicatedStorage_0["Stats" .. l_LocalPlayer_0.Name];
    if l_Cooldowns_0.upper == false and _G.check:inspect(l_Character_0) == true then
        local v16 = v3.GetM("Shadow's Mark");
        local l_cd_0 = v16.cd;
        if _G.StamCheck("Shadow's Mark") == false then
            return;
        elseif v16.statreq and _G.MeetReq(v16.statreq) == false then
            return;
        else
            l_Cooldowns_0.upper = true;
            local v18 = l_Character_0.Humanoid.Animator:LoadAnimation(script.cloneAnim);
            v18:Play();
            v18:AdjustWeight(2);
            v18:AdjustSpeed(2);
            local v19 = nil;
            local v20 = nil;
            do
                local l_v19_0, l_v20_0 = v19, v20;
                pcall(function() --[[ Line: 50 ]]
                    -- upvalues: l_v19_0 (ref), l_v20_0 (ref), l_Character_0 (copy)
                    local v23, v24 = unpack(game.ReplicatedStorage.Events.Skill:InvokeServer("Shadow's Mark", l_Character_0.HumanoidRootPart.CFrame));
                    l_v19_0 = v23;
                    l_v20_0 = v24;
                end);
                if l_v20_0 then
                    l_v20_0 = _G.awaitObject(l_v20_0);
                end;
                local v25 = false;
                local v26 = nil;
                if l_v19_0 then
                    v11:DoubleCastSkill(v12, {
                        Key = Enum.KeyCode.E, 
                        SkipTap = true, 
                        CompleteFunction = function() --[[ Line: 64 ]] --[[ Name: CompleteFunction ]]
                            -- upvalues: l_v20_0 (ref), l_v19_0 (ref), v25 (ref)
                            if l_v20_0 and l_v20_0:IsDescendantOf(workspace) then
                                l_v19_0:FireServer();
                                _G.resetM1();
                            end;
                            v25 = true;
                        end, 
                        PassFunction = function() --[[ Line: 71 ]] --[[ Name: PassFunction ]]
                            -- upvalues: l_Character_0 (copy)
                            return l_Character_0:FindFirstChild(script.Name) and _G.check:inspect(l_Character_0) == true and _G.canuse == true;
                        end
                    });
                else
                    v25 = true;
                end;
                repeat
                    task.wait();
                until v25 == true or l_v20_0 == nil or l_v20_0 and l_v20_0:IsDescendantOf(workspace) == false;
                _G.keysetup:cooldown("Shadow's Mark", l_cd_0);
                if v26 then
                    v26:Disconnect();
                    v26 = nil;
                end;
                _G.fw(l_cd_0);
                l_Cooldowns_0.upper = false;
            end;
        end;
    end;
end;
v8.ThousandStrikes = function(v27, _) --[[ Line: 92 ]] --[[ Name: ThousandStrikes ]]
    -- upvalues: l_LocalPlayer_0 (copy), l_ReplicatedStorage_0 (copy), v3 (copy)
    local l_Cooldowns_1 = v27.Cooldowns;
    local l_Character_1 = l_LocalPlayer_0.Character;
    local _ = l_ReplicatedStorage_0["Stats" .. l_LocalPlayer_0.Name];
    if l_Cooldowns_1.dash == false and _G.check:inspect(l_Character_1) == true then
        local v32 = v3.GetM("Thousand Strikes");
        local l_cd_1 = v32.cd;
        if _G.StamCheck("Thousand Strikes") == false then
            return;
        elseif v32.statreq and _G.MeetReq(v32.statreq) == false then
            return;
        else
            local v34 = l_Character_1.Humanoid.Animator:LoadAnimation(script.slash);
            v34:Play();
            v34:AdjustWeight(2);
            l_Cooldowns_1.dash = true;
            _G.canuse = false;
            l_Character_1.Humanoid.WalkSpeed = 4;
            local v35 = game.ReplicatedStorage.Events.Skill:InvokeServer("Thousand Strikes", l_Character_1.HumanoidRootPart.CFrame);
            task.wait(0.45);
            if v35 then
                v35:FireServer();
                if _G.check:inspect(l_Character_1) == false then
                    v34:Stop();
                end;
            end;
            task.wait(0.4);
            l_Character_1.Humanoid.WalkSpeed = 16;
            _G.canuse = true;
            _G.keysetup:cooldown("Thousand Strikes", l_cd_1);
            _G.fw(l_cd_1);
            l_Cooldowns_1.dash = false;
        end;
    end;
end;
return v8;