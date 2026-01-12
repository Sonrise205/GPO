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
        slash = false, 
        slices = false, 
        tackle = false, 
        Counter = false
    };
    return v10;
end;
v8["World'sStrongestSlash"] = function(v11, v12) --[[ Line: 28 ]]
    -- upvalues: l_LocalPlayer_0 (copy), l_ReplicatedStorage_0 (copy), v3 (copy)
    local l_Cooldowns_0 = v11.Cooldowns;
    local l_Character_0 = l_LocalPlayer_0.Character;
    local v15 = l_ReplicatedStorage_0["Stats" .. l_LocalPlayer_0.Name];
    if l_Cooldowns_0.slash == false and _G.check:inspect(l_Character_0) == true then
        local v16 = v3.GetM("World's Strongest Slash");
        local l_cd_0 = v16.cd;
        if _G.StamCheck("World's Strongest Slash") == false then
            return;
        elseif v16.statreq and _G.MeetReq(v16.statreq) == false then
            return;
        else
            l_Cooldowns_0.slash = true;
            _G.canuse = false;
            _G.FaceMouse = true;
            _G.mouseLevel = true;
            local v18 = l_Character_0.Humanoid.Animator:LoadAnimation(script.holdSlash);
            v18:Play();
            v18:AdjustWeight(2);
            v18.Priority = Enum.AnimationPriority.Action4;
            local v19 = game.ReplicatedStorage.Events.Skill:InvokeServer("World's Strongest Slash");
            local v20 = tick();
            _G.PauseAnim(v18, 0.4, 0.33);
            local v21 = false;
            do
                local l_v18_0, l_v21_0 = v18, v21;
                local function v24() --[[ Line: 60 ]] --[[ Name: checkFunction ]]
                    -- upvalues: v20 (copy), l_v21_0 (ref), v15 (copy), v19 (copy), l_v18_0 (ref), l_Character_0 (copy)
                    if tick() - v20 >= 2 and l_v21_0 == false and v15.Skills.DarkBladeTripleSlash.Value == true then
                        l_v21_0 = true;
                        if v19 then
                            v19:FireServer("Triple");
                            l_v18_0:Stop();
                            l_v18_0:Destroy();
                            l_v18_0 = l_Character_0.Humanoid:LoadAnimation(script.tripleHold);
                            l_v18_0:Play();
                        end;
                    end;
                end;
                v11:ChargeSkill(v12, {
                    Key = Enum.KeyCode.X, 
                    CheckFunction = v24, 
                    IgnoreInstantCastSetting = true, 
                    EndFunction = function() --[[ Line: 73 ]] --[[ Name: endFunction ]]
                        -- upvalues: v11 (copy), l_Character_0 (copy), v20 (copy)
                        if v11.Tool.Parent ~= l_Character_0 or tick() - v20 >= 10 then
                            return true;
                        else
                            return;
                        end;
                    end
                });
                l_v18_0:Stop();
                _G.FaceMouse = false;
                _G.mouseLevel = false;
                l_Character_0.HumanoidRootPart.Anchored = true;
                if v19 then
                    v19:FireServer("slashSfx");
                end;
                if l_v21_0 == false then
                    local v25 = l_Character_0.Humanoid.Animator:LoadAnimation(script.slashRelease);
                    v25:Play();
                    v25:AdjustSpeed(1.25);
                    v25:AdjustWeight(2);
                    task.wait(0.64);
                else
                    local v26 = l_Character_0.Humanoid:LoadAnimation(script.triple);
                    v26:Play();
                    v26:AdjustWeight(2);
                    v26:AdjustSpeed(1.25);
                    task.wait(0.48);
                end;
                if v19 then
                    v19:FireServer(l_Character_0.PrimaryPart.CFrame);
                end;
                l_v18_0:AdjustSpeed(1);
                task.wait(0.4);
                l_Character_0.HumanoidRootPart.Anchored = false;
                l_Character_0.Humanoid.WalkSpeed = 16;
                _G.canuse = true;
                _G.keysetup:cooldown("World's Strongest Slash", l_cd_0);
                _G.fw(l_cd_0);
                l_Cooldowns_0.slash = false;
            end;
        end;
    end;
end;
v8.ThousandSlices = function(v27, _) --[[ Line: 128 ]] --[[ Name: ThousandSlices ]]
    -- upvalues: l_LocalPlayer_0 (copy), l_ReplicatedStorage_0 (copy), v3 (copy)
    local l_Cooldowns_1 = v27.Cooldowns;
    local l_Character_1 = l_LocalPlayer_0.Character;
    local _ = l_ReplicatedStorage_0["Stats" .. l_LocalPlayer_0.Name];
    if l_Cooldowns_1.slices == false and _G.check:inspect(l_Character_1) == true then
        local v32 = v3.GetM("Thousand Slices");
        local l_cd_1 = v32.cd;
        if _G.StamCheck("Thousand Slices") == false then
            return;
        elseif v32.statreq and _G.MeetReq(v32.statreq) == false then
            return;
        else
            l_Cooldowns_1.slices = true;
            _G.canuse = false;
            l_Character_1.Humanoid.AutoRotate = false;
            local _ = game.ReplicatedStorage.Events.Skill:InvokeServer("Thousand Slices", l_Character_1.PrimaryPart.CFrame);
            l_Character_1.Humanoid.AutoRotate = true;
            task.wait(0.4);
            l_Character_1.Humanoid.WalkSpeed = 16;
            _G.canuse = true;
            _G.keysetup:cooldown("Thousand Slices", l_cd_1);
            _G.fw(l_cd_1);
            l_Cooldowns_1.slices = false;
        end;
    end;
end;
v8.NightfallRush = function(v35, _) --[[ Line: 163 ]] --[[ Name: NightfallRush ]]
    -- upvalues: l_LocalPlayer_0 (copy), l_ReplicatedStorage_0 (copy), v3 (copy)
    local l_Cooldowns_2 = v35.Cooldowns;
    local l_Character_2 = l_LocalPlayer_0.Character;
    local _ = l_ReplicatedStorage_0["Stats" .. l_LocalPlayer_0.Name];
    if l_Cooldowns_2.tackle == false and _G.check:inspect(l_Character_2) == true then
        local v40 = v3.GetM("Nightfall Rush");
        local l_cd_2 = v40.cd;
        if _G.StamCheck("Nightfall Rush") == false then
            return;
        elseif v40.statreq and _G.MeetReq(v40.statreq) == false then
            return;
        else
            l_Cooldowns_2.tackle = true;
            _G.canuse = false;
            local _ = game.ReplicatedStorage.Events.Skill:InvokeServer("Nightfall Rush", l_Character_2.PrimaryPart.CFrame);
            task.wait(0.5);
            l_Character_2.Humanoid.WalkSpeed = 16;
            _G.canuse = true;
            _G.keysetup:cooldown("Nightfall Rush", l_cd_2);
            _G.fw(l_cd_2);
            l_Cooldowns_2.tackle = false;
        end;
    end;
end;
v8.NightfallCounter = function(v43, _) --[[ Line: 193 ]] --[[ Name: NightfallCounter ]]
    -- upvalues: l_LocalPlayer_0 (copy), l_ReplicatedStorage_0 (copy), v3 (copy)
    local l_Cooldowns_3 = v43.Cooldowns;
    local l_Character_3 = l_LocalPlayer_0.Character;
    local _ = l_ReplicatedStorage_0["Stats" .. l_LocalPlayer_0.Name];
    if l_Cooldowns_3.Counter == false and _G.check:inspect(l_Character_3) == true then
        local v48 = v3.GetM("Nightfall Counter");
        local l_cd_3 = v48.cd;
        if _G.StamCheck("Nightfall Counter") == false then
            return;
        elseif v48.statreq and _G.MeetReq(v48.statreq) == false then
            return;
        else
            l_Cooldowns_3.Counter = true;
            _G.canuse = false;
            local _ = game.ReplicatedStorage.Events.Skill:InvokeServer("Nightfall Counter", l_Character_3.PrimaryPart.CFrame);
            task.wait(0.4);
            l_Character_3.Humanoid.WalkSpeed = 16;
            _G.canuse = true;
            _G.keysetup:cooldown("Nightfall Counter", l_cd_3);
            _G.fw(l_cd_3);
            l_Cooldowns_3.Counter = false;
        end;
    end;
end;
return v8;