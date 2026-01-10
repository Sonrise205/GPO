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
        heal = false, 
        freeze = false
    };
    return v10;
end;
v8.SoulParade = function(v11, _) --[[ Line: 28 ]] --[[ Name: SoulParade ]]
    -- upvalues: l_LocalPlayer_0 (copy), l_ReplicatedStorage_0 (copy), v3 (copy)
    local l_Cooldowns_0 = v11.Cooldowns;
    local l_Character_0 = l_LocalPlayer_0.Character;
    local _ = l_ReplicatedStorage_0["Stats" .. l_LocalPlayer_0.Name];
    if l_Cooldowns_0.heal == false and _G.check:inspect(l_Character_0) == true then
        local v16 = v3.GetM("Soul Parade");
        local l_cd_0 = v16.cd;
        if _G.StamCheck("Soul Parade") == false then
            return;
        elseif v16.statreq and _G.MeetReq(v16.statreq) == false then
            return;
        else
            _G.canuse = false;
            l_Cooldowns_0.heal = true;
            local v18 = l_Character_0.Humanoid.Animator:LoadAnimation(script.counter);
            v18:Play();
            game.ReplicatedStorage.Events.Skill:InvokeServer("Soul Parade");
            task.wait(0.5);
            v18:Stop();
            task.wait(0.5);
            _G.canuse = true;
            _G.keysetup:cooldown("Soul Parade", l_cd_0);
            _G.fw(l_cd_0);
            l_Cooldowns_0.heal = false;
        end;
    end;
end;
v8.DrawingSong = function(v19, v20) --[[ Line: 58 ]] --[[ Name: DrawingSong ]]
    -- upvalues: l_LocalPlayer_0 (copy), l_ReplicatedStorage_0 (copy), v3 (copy)
    local l_Cooldowns_1 = v19.Cooldowns;
    local l_Character_1 = l_LocalPlayer_0.Character;
    local _ = l_ReplicatedStorage_0["Stats" .. l_LocalPlayer_0.Name];
    if l_Cooldowns_1.freeze == false and _G.check:inspect(l_Character_1) == true then
        local v24 = v3.GetM("Drawing Song");
        local l_cd_1 = v24.cd;
        if _G.StamCheck("Drawing Song") == false then
            return;
        elseif v24.statreq and _G.MeetReq(v24.statreq) == false then
            return;
        else
            _G.canuse = false;
            local v26 = l_Character_1.Humanoid.Animator:LoadAnimation(script.freeze);
            v26:Play();
            v26:AdjustWeight(2);
            l_Character_1.Humanoid.WalkSpeed = 4;
            _G.FaceMouse = true;
            local v27 = game.ReplicatedStorage.Events.Skill:InvokeServer("Drawing Song");
            _G.PauseAnim(v26, 0.67, 1);
            local function v28() --[[ Line: 82 ]] --[[ Name: checkFunction ]]

            end;
            local function v29() --[[ Line: 86 ]] --[[ Name: endFunction ]]
                -- upvalues: l_Character_1 (copy)
                if l_Character_1:FindFirstChild(script.Name) == nil then
                    return true;
                else
                    return;
                end;
            end;
            l_Cooldowns_1.freeze = true;
            local l_CFrame_0 = l_Character_1.PrimaryPart.CFrame;
            v19:ChargeSkill(v20, {
                Key = Enum.KeyCode.R, 
                CheckFunction = v28, 
                EndFunction = v29
            });
            _G.FaceMouse = false;
            l_Character_1.HumanoidRootPart.Anchored = true;
            v26:AdjustSpeed(1);
            local v31 = Ray.new(l_Character_1.HumanoidRootPart.CFrame.p, (v19:GetMouseCFrame().p - l_Character_1.HumanoidRootPart.CFrame.p).unit * 45);
            local _, v33 = _G.raycastWhitelist(v31, {
                workspace.Islands, 
                workspace.Ships, 
                workspace.Env
            });
            local l_CFrame_1 = l_Character_1.HumanoidRootPart.CFrame;
            local v35 = CFrame.new(v33, l_CFrame_1.p) * CFrame.Angles(0, 3.141592653589793, 0) * CFrame.new(0, l_Character_1.Humanoid.HipHeight * 1.25, 2);
            l_Character_1.HumanoidRootPart.CFrame = v35;
            if v27 then
                v27:FireServer({
                    cf = l_Character_1.PrimaryPart.CFrame, 
                    old = l_CFrame_0
                });
            end;
            task.wait(0.9);
            l_Character_1.HumanoidRootPart.Anchored = false;
            l_Character_1.Humanoid.WalkSpeed = 16;
            _G.canuse = true;
            _G.keysetup:cooldown("Drawing Song", l_cd_1);
            _G.fw(l_cd_1);
            l_Cooldowns_1.freeze = false;
        end;
    end;
end;
return v8;