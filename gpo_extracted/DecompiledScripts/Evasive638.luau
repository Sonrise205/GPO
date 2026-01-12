local v0 = {};
v0.__index = v0;
local l_LocalPlayer_0 = game.Players.LocalPlayer;
local _ = game:GetService("UserInputService");
local v3 = l_LocalPlayer_0.Character or l_LocalPlayer_0.CharacterAdded:Wait();
v0.new = function(v4) --[[ Line: 8 ]] --[[ Name: new ]]
    -- upvalues: v0 (copy)
    local v5 = setmetatable({}, v0);
    v5.Utils = v4.Utils;
    return v5;
end;
local function _() --[[ Line: 14 ]] --[[ Name: getMaxBar ]]
    -- upvalues: v3 (copy)
    return v3.Humanoid.MaxHealth * v3:GetAttribute("healthPercentEvasive") + v3:GetAttribute("baseEvasiveReq");
end;
local v7 = false;
v0.PC_Activate = function(v8) --[[ Line: 20 ]] --[[ Name: PC_Activate ]]
    -- upvalues: v3 (copy), v7 (ref)
    if v8.Utils.hitStunned(v3) >= 1 then
        if v3:GetAttribute("evasiveBar") >= v3.Humanoid.MaxHealth * v3:GetAttribute("healthPercentEvasive") + v3:GetAttribute("baseEvasiveReq") then
            if v3:FindFirstChild("GrabTag") == nil and _G.canuse == true and game.ReplicatedStorage.Events.Skill:InvokeServer("BasicEvasive") == true then
                v7 = true;
                task.delay(0.75, function() --[[ Line: 27 ]]
                    _G.canuse = false;
                    task.wait(0.3);
                    _G.canuse = true;
                end);
                return;
            end;
        else
            script.EvasiveSFX.EvasiveOnCooldown:Play();
        end;
    end;
end;
local v9 = false;
local function v12() --[[ Line: 41 ]] --[[ Name: evasive ]]
    -- upvalues: v3 (copy), v7 (ref), v9 (ref), l_LocalPlayer_0 (copy)
    local v10 = v3.Humanoid.MaxHealth * v3:GetAttribute("healthPercentEvasive") + v3:GetAttribute("baseEvasiveReq");
    if v7 == true and v10 <= v3:GetAttribute("evasiveBar") and v3:GetAttribute("evasiveBar") ~= 12345678 then
        if v9 == false then
            script.EvasiveSFX.EvasiveReady:Play();
            local v11 = script.Flash:Clone();
            v11.Parent = l_LocalPlayer_0.PlayerGui;
            _G.tween(v11.Frame, {
                0.75, 
                "Quad", 
                Enum.EasingDirection.Out
            }, {
                BackgroundTransparency = 1
            });
            _G.destroy(v11, 0.75);
        end;
        v9 = true;
        return;
    else
        v9 = false;
        return;
    end;
end;
v3:GetAttributeChangedSignal("evasiveBar"):Connect(v12);
v0.Mobile_Activate = v0.PC_Activate;
return v0;