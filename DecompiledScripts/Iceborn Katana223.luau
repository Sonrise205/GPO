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
        triple = false
    };
    return v10;
end;
v8.FrostFlash = function(v11, v12) --[[ Line: 28 ]] --[[ Name: FrostFlash ]]
    -- upvalues: l_LocalPlayer_0 (copy), l_ReplicatedStorage_0 (copy), v3 (copy)
    local l_Cooldowns_0 = v11.Cooldowns;
    local l_Character_0 = l_LocalPlayer_0.Character;
    local _ = l_ReplicatedStorage_0["Stats" .. l_LocalPlayer_0.Name];
    if l_Cooldowns_0.slash == false and _G.check:inspect(l_Character_0) == true then
        local v16 = v3.GetM("Frost Flash");
        local l_cd_0 = v16.cd;
        if _G.StamCheck("Frost Flash") == false then
            return;
        elseif v16.statreq and _G.MeetReq(v16.statreq) == false then
            return;
        else
            local v18 = l_Character_0.Humanoid.Animator:LoadAnimation(script.slash);
            v18:Play();
            v18:AdjustWeight(2);
            l_Cooldowns_0.slash = true;
            _G.FaceMouse = true;
            _G.canuse = false;
            l_Character_0:SetPrimaryPartCFrame(CFrame.new(l_Character_0.PrimaryPart.Position, v11:GetMouseCFrame().p));
            _G.PauseAnim(v18, 0.15, 0.3);
            local v19 = game.ReplicatedStorage.Events.Skill:InvokeServer("Frost Flash", l_Character_0.PrimaryPart.CFrame);
            local v20 = tick();
            v11:ChargeSkill(v12, {
                Key = Enum.KeyCode.E, 
                CheckFunction = function() --[[ Line: 55 ]] --[[ Name: checkFunction ]]
                    -- upvalues: l_Character_0 (copy)
                    l_Character_0.Humanoid.AutoRotate = false;
                end, 
                EndFunction = function() --[[ Line: 60 ]] --[[ Name: endFunction ]]
                    -- upvalues: l_Character_0 (copy), v20 (copy)
                    if l_Character_0:FindFirstChild(script.Name) == nil or tick() - v20 >= 10 then
                        return true;
                    else
                        return;
                    end;
                end
            });
            v18:AdjustSpeed(1);
            if v19 then
                v19:FireServer("slash");
            end;
            _G.FaceMouse = false;
            l_Character_0.HumanoidRootPart.Anchored = true;
            l_Character_0.Humanoid.AutoRotate = false;
            task.wait(0.15);
            if v19 then
                v19:FireServer(l_Character_0.PrimaryPart.CFrame);
            end;
            task.wait(0.5);
            if l_Character_0:GetAttribute("frostSlashHit") ~= nil then
                repeat
                    task.wait();
                until l_Character_0:GetAttribute("frostSlashHit") == nil;
            end;
            l_Character_0.Humanoid.AutoRotate = true;
            l_Character_0.HumanoidRootPart.Anchored = false;
            l_Character_0.Humanoid.WalkSpeed = 16;
            _G.canuse = true;
            _G.keysetup:cooldown("Frost Flash", l_cd_0);
            _G.fw(l_cd_0);
            l_Cooldowns_0.slash = false;
        end;
    end;
end;
v8.FrostfallCascade = function(v21, v22) --[[ Line: 104 ]] --[[ Name: FrostfallCascade ]]
    -- upvalues: l_LocalPlayer_0 (copy), l_ReplicatedStorage_0 (copy), v3 (copy)
    local l_Cooldowns_1 = v21.Cooldowns;
    local l_Character_1 = l_LocalPlayer_0.Character;
    local _ = l_ReplicatedStorage_0["Stats" .. l_LocalPlayer_0.Name];
    if l_Cooldowns_1.triple == false and _G.check:inspect(l_Character_1) == true then
        local v26 = v3.GetM("Frostfall Cascade");
        local l_cd_1 = v26.cd;
        if _G.StamCheck("Frostfall Cascade") == false then
            return;
        elseif v26.statreq and _G.MeetReq(v26.statreq) == false then
            return;
        else
            local v28 = l_Character_1.Humanoid.Animator:LoadAnimation(script.triple);
            v28:Play();
            v28:AdjustWeight(5);
            l_Cooldowns_1.triple = true;
            _G.FaceMouse = true;
            _G.canuse = false;
            l_Character_1:SetPrimaryPartCFrame(CFrame.new(l_Character_1.PrimaryPart.Position, v21:GetMouseCFrame().p));
            local v29 = game.ReplicatedStorage.Events.Skill:InvokeServer("Frostfall Cascade", l_Character_1.PrimaryPart.CFrame);
            _G.PauseAnim(v28, 0.15, 0.5);
            local v30 = tick();
            local v31 = false;
            local function v32() --[[ Line: 133 ]] --[[ Name: checkFunction ]]
                -- upvalues: l_Character_1 (copy)
                l_Character_1.Humanoid.AutoRotate = false;
            end;
            do
                local l_v31_0 = v31;
                local function v35() --[[ Line: 138 ]] --[[ Name: endFunction ]]
                    -- upvalues: l_Character_1 (copy), v30 (copy), l_v31_0 (ref)
                    if l_Character_1:FindFirstChild(script.Name) == nil or tick() - v30 >= 2 then
                        return true;
                    else
                        if tick() - v30 >= 1.5 and l_v31_0 == false then
                            l_v31_0 = true;
                            local l_Highlight_0 = Instance.new("Highlight");
                            l_Highlight_0.FillColor = Color3.fromRGB(255, 255, 255);
                            l_Highlight_0.FillTransparency = 0;
                            l_Highlight_0.OutlineTransparency = 1;
                            l_Highlight_0.Parent = l_Character_1;
                            _G.tween(l_Highlight_0, {
                                0.5, 
                                "Cubic", 
                                Enum.EasingDirection.Out
                            }, {
                                FillTransparency = 1
                            });
                            _G.destroy(l_Highlight_0, 0.5);
                            script.IceKatanaChargeFull:Play();
                        end;
                        return;
                    end;
                end;
                v21:ChargeSkill(v22, {
                    Key = Enum.KeyCode.R, 
                    CheckFunction = v32, 
                    IgnoreInstantCastSetting = true, 
                    EndFunction = v35
                });
                v28:AdjustSpeed(1);
                if v29 then
                    v29:FireServer("slash");
                end;
                _G.FaceMouse = false;
                l_Character_1.HumanoidRootPart.Anchored = true;
                l_Character_1.Humanoid.AutoRotate = false;
                task.wait(0.1);
                if v29 then
                    v29:FireServer(l_Character_1.PrimaryPart.CFrame, l_v31_0);
                end;
                task.wait(0.65);
                l_Character_1.Humanoid.AutoRotate = true;
                l_Character_1.HumanoidRootPart.Anchored = false;
                l_Character_1.Humanoid.WalkSpeed = 16;
                _G.canuse = true;
                _G.keysetup:cooldown("Frostfall Cascade", l_cd_1);
                _G.fw(l_cd_1);
                l_Cooldowns_1.triple = false;
            end;
        end;
    end;
end;
return v8;