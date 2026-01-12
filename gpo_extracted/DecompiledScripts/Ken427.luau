local v0 = {};
v0.__index = v0;
local _ = game:GetService("ReplicatedStorage");
local l_LocalPlayer_0 = game.Players.LocalPlayer;
local _ = game:GetService("UserInputService");
if not l_LocalPlayer_0.Character then
    local _ = l_LocalPlayer_0.CharacterAdded:Wait();
end;
local _, _, _, _, v9 = require(game.ReplicatedStorage.Modules.ScriptSet).get();
local _ = game:GetService("UserInputService");
local v11 = require(game.ReplicatedStorage.KenHaki);
local v12 = false;
v0.new = function(v13) --[[ Line: 19 ]] --[[ Name: new ]]
    -- upvalues: v0 (copy)
    local v14 = setmetatable({}, v0);
    v14.Handler = v13;
    v14.Utils = v13.Utils;
    return v14;
end;
v0.PC_Activate = function(_) --[[ Line: 26 ]] --[[ Name: PC_Activate ]]
    -- upvalues: v9 (copy), v12 (ref), v11 (copy)
    if v9.Stats.KenMastery.Value >= 1 then
        if v12 == true then
            if v11.On == false then
                local v16 = false;
                if string.find(v9.Stats.DF.Value, "Mochi") ~= nil and v9.Stats.KenMastery.Value >= 700 then
                    v16 = true;
                end;
                if v9.Skills.KenV2.Value == true then
                    game.ReplicatedStorage.KenHaki.v2fail:Play();
                    return;
                elseif v16 == false then
                    game.ReplicatedStorage.KenHaki.fail:Play();
                    return;
                else
                    game.ReplicatedStorage.KenHaki.fail2:Play();
                end;
            end;
            return;
        else
            v12 = true;
            if v11.On == false and _G.canuse == true then
                v11:Enable();
            elseif v11.On == true then
                v11:Disable();
            end;
            task.wait(1);
            v12 = false;
        end;
    end;
end;
v0.Mobile_Activate = v0.PC_Activate;
return v0;