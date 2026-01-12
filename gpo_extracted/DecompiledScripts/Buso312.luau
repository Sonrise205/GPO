local v0 = {};
v0.__index = v0;
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_LocalPlayer_0 = game.Players.LocalPlayer;
local _ = game:GetService("UserInputService");
local v4 = l_LocalPlayer_0.Character or l_LocalPlayer_0.CharacterAdded:Wait();
v0.new = function(v5) --[[ Line: 9 ]] --[[ Name: new ]]
    -- upvalues: v0 (copy)
    local v6 = setmetatable({}, v0);
    v6.Handler = v5;
    v6.Utils = v5.Utils;
    return v6;
end;
local v7 = false;
v0.PC_Activate = function(_) --[[ Line: 18 ]] --[[ Name: PC_Activate ]]
    -- upvalues: l_ReplicatedStorage_0 (copy), l_LocalPlayer_0 (copy), v4 (copy), v7 (ref)
    local v9 = l_ReplicatedStorage_0["Stats" .. l_LocalPlayer_0.Name];
    if v4:FindFirstChildWhichIsA("Tool") and v7 == false and v9.Stats.BusoMastery.Value > 0 and _G.check:inspect(v4) == true and _G.canuse == true then
        if v9.BusoBar.Value < v9.BusoBar.MaxValue * 0.1 and v4:FindFirstChild("BusoMelee") == nil then
            _G.BusoRed(v9.BusoBar.MaxValue * 0.1);
            return;
        else
            v7 = true;
            game.ReplicatedStorage.Events.Haki:FireServer("Buso");
            task.delay(2, function() --[[ Line: 29 ]]
                -- upvalues: v7 (ref)
                v7 = false;
            end);
        end;
    end;
end;
v0.Mobile_Activate = v0.PC_Activate;
return v0;