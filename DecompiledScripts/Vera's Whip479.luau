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
        slam = false, 
        block = false
    };
    return v10;
end;
v8.TempestuousDefence = function(v11, v12) --[[ Line: 28 ]] --[[ Name: TempestuousDefence ]]
    -- upvalues: l_LocalPlayer_0 (copy), l_ReplicatedStorage_0 (copy), v3 (copy)
    local l_Cooldowns_0 = v11.Cooldowns;
    local l_Character_0 = l_LocalPlayer_0.Character;
    local _ = l_ReplicatedStorage_0["Stats" .. l_LocalPlayer_0.Name];
    if l_Cooldowns_0.block == false and _G.check:inspect(l_Character_0) == true then
        local v16 = v3.GetM("Tempestuous Defence");
        local l_cd_0 = v16.cd;
        if _G.StamCheck("Tempestuous Defence") == false then
            return;
        elseif v16.statreq and _G.MeetReq(v16.statreq) == false then
            return;
        else
            local v18 = nil;
            local v19 = l_Character_0.Humanoid.Animator:LoadAnimation(script.blockloop);
            v19:Play(0);
            v19:AdjustWeight(2);
            local l_l_Character_0_FirstChild_0 = l_Character_0:FindFirstChild(script.Name .. "Sword");
            if l_l_Character_0_FirstChild_0 then
                local l_PlayingAnimationTracks_0 = l_l_Character_0_FirstChild_0.AnimationController.Animator:GetPlayingAnimationTracks();
                for v22 = 1, #l_PlayingAnimationTracks_0 do
                    l_PlayingAnimationTracks_0[v22]:Stop(0);
                end;
                v18 = l_l_Character_0_FirstChild_0.AnimationController.Animator:LoadAnimation(script.blockloop);
                v18:Play(0);
                v18:AdjustWeight(500);
            end;
            l_Cooldowns_0.block = true;
            _G.canuse = false;
            local v23 = game.ReplicatedStorage.Events.Skill:InvokeServer("Tempestuous Defence");
            local v24 = tick();
            local v25 = false;
            do
                local l_v25_0 = v25;
                if v23 then
                    task.spawn(function() --[[ Line: 70 ]]
                        -- upvalues: l_Character_0 (copy), l_v25_0 (ref)
                        local v27 = l_Character_0:WaitForChild("Blocking", 3);
                        local v28 = game.ReplicatedStorage.Util.Melee.BlockGui:Clone();
                        v28.Parent = l_Character_0.HumanoidRootPart;
                        repeat
                            game["Run Service"].RenderStepped:Wait();
                            pcall(function() --[[ Line: 75 ]]
                                -- upvalues: v27 (copy), v28 (copy)
                                local v29 = v27.Value / v27.MaxValue;
                                v28.ImageLabel.Frame.Position = UDim2.new(0, 0, 1 - v29, 0);
                                v28.ImageLabel.Frame.Size = UDim2.new(1, 0, v29, 0);
                                v28.ImageLabel.Frame.ImageLabel.Size = UDim2.new(1, 0, 1 / v29, 0);
                                v28.ImageLabel.Frame.ImageLabel.Position = UDim2.new(0, 0, -(v28.ImageLabel.Frame.Position.Y.Scale / v28.ImageLabel.Frame.Size.Y.Scale), 0);
                            end);
                        until l_v25_0 == true;
                        v28:Destroy();
                    end);
                end;
                v11:ChargeSkill(v12, {
                    Key = Enum.KeyCode.R, 
                    CheckFunction = function() --[[ Line: 87 ]] --[[ Name: checkFunction ]]
                        -- upvalues: l_Character_0 (copy)
                        l_Character_0.Humanoid.WalkSpeed = 4;
                    end, 
                    EndFunction = function() --[[ Line: 91 ]] --[[ Name: endFunction ]]
                        -- upvalues: l_Character_0 (copy), v24 (copy)
                        if l_Character_0:FindFirstChild(script.Name) == nil or tick() - v24 >= 1.5 or l_Character_0:FindFirstChild("Blocking") == nil then
                            return true;
                        else
                            return;
                        end;
                    end, 
                    IgnoreInstantCastSetting = true
                });
                l_v25_0 = true;
                v19:Stop();
                if v18 then
                    v18:Stop();
                end;
                if v23 then
                    v23:FireServer();
                end;
                if l_l_Character_0_FirstChild_0 and l_l_Character_0_FirstChild_0:FindFirstChild("AnimationController") then
                    local v30 = l_l_Character_0_FirstChild_0.AnimationController:LoadAnimation(game.ReplicatedStorage.Modules.SwordHandle.Swords["Vera's Whip"].Idle);
                    v30:Play(0);
                    v30.Priority = Enum.AnimationPriority.Core;
                end;
                l_Character_0.HumanoidRootPart.Anchored = false;
                l_Character_0.Humanoid.WalkSpeed = 16;
                task.wait(0.25);
                _G.canuse = true;
                _G.keysetup:cooldown("Tempestuous Defence", l_cd_0);
                _G.fw(l_cd_0);
                l_Cooldowns_0.block = false;
            end;
        end;
    end;
end;
v8.WhipSlam = function(v31, v32) --[[ Line: 127 ]] --[[ Name: WhipSlam ]]
    -- upvalues: l_LocalPlayer_0 (copy), l_ReplicatedStorage_0 (copy), v3 (copy)
    local l_Cooldowns_1 = v31.Cooldowns;
    local l_Character_1 = l_LocalPlayer_0.Character;
    local v35 = l_ReplicatedStorage_0["Stats" .. l_LocalPlayer_0.Name];
    if l_Cooldowns_1.slam == false and _G.check:inspect(l_Character_1) == true then
        local v36 = v3.GetM("Whip Slam");
        local l_cd_1 = v36.cd;
        if _G.StamCheck("Whip Slam") == false then
            return;
        elseif v36.statreq and _G.MeetReq(v36.statreq) == false then
            return;
        else
            _G.canuse = false;
            local v38 = game.ReplicatedStorage.Events.Skill:InvokeServer("Whip Slam", {
                cf = v31:GetMouseCFrame()
            });
            l_Cooldowns_1.slam = true;
            local v39 = l_Character_1.Humanoid:LoadAnimation(script.windup);
            v39:Play();
            v39:AdjustWeight(5);
            v39.Priority = Enum.AnimationPriority.Action;
            v39:AdjustSpeed(0);
            local v40 = nil;
            local l_l_Character_1_FirstChild_0 = l_Character_1:FindFirstChild(script.Name .. "Sword");
            if l_l_Character_1_FirstChild_0 and l_l_Character_1_FirstChild_0:FindFirstChild("AnimationController") then
                v40 = l_l_Character_1_FirstChild_0.AnimationController:LoadAnimation(script.windup);
                v40:Play();
                v40.Priority = Enum.AnimationPriority.Action;
                v40:AdjustWeight(5);
                v40:AdjustSpeed(0);
            end;
            _G.canuse = false;
            l_Character_1.Humanoid.WalkSpeed = 4;
            local v42 = tick();
            v31:ChargeSkill(v32, {
                Key = Enum.KeyCode.E, 
                CheckFunction = function() --[[ Line: 165 ]] --[[ Name: checkFunction ]]
                    -- upvalues: l_Character_1 (copy)
                    l_Character_1.Humanoid.WalkSpeed = 4;
                end, 
                EndFunction = function() --[[ Line: 170 ]] --[[ Name: endFunction ]]
                    -- upvalues: v42 (copy), l_Character_1 (copy), v35 (copy)
                    if tick() - v42 >= 5 or l_Character_1:FindFirstChild(script.Name) == nil or l_Character_1.Parent == nil or l_Character_1.Parent ~= workspace.PlayerCharacters or v35.Stamina.Value <= 0 or _G.check:inspect(l_Character_1) == false then
                        return true;
                    else
                        return;
                    end;
                end
            });
            v39:AdjustSpeed(0.75);
            if v40 then
                v40:AdjustSpeed(0.75);
            end;
            if v38 then
                v38:FireServer("woosh");
            end;
            task.wait(0.30000000000000004);
            local v43 = nil;
            local _ = false;
            do
                local l_v43_0 = v43;
                local function v47(v46) --[[ Line: 194 ]] --[[ Name: hitfound ]]
                    -- upvalues: v38 (copy), l_Character_1 (copy), l_v43_0 (ref)
                    if v38 then
                        v38:FireServer(l_Character_1.PrimaryPart.CFrame, v46.Parent);
                        l_v43_0 = true;
                    end;
                end;
                _G.hitbox:start(l_Character_1, Vector3.new(10, 10, 18, 0), 0.25, CFrame.new(0, 0, -9), v47);
                task.wait(0.5);
                l_Character_1.Humanoid.WalkSpeed = 16;
                _G.canuse = true;
                _G.keysetup:cooldown("Whip Slam", l_cd_1);
                _G.fw(l_cd_1);
                l_Cooldowns_1.slam = false;
            end;
        end;
    end;
end;
return v8;