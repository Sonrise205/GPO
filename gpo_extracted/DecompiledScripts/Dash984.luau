local v0 = {};
v0.__index = v0;
local l_LocalPlayer_0 = game.Players.LocalPlayer;
local _ = game:GetService("UserInputService");
local v3 = l_LocalPlayer_0.Character or l_LocalPlayer_0.CharacterAdded:Wait();
local v4 = require(game.ReplicatedStorage.Util.Movement.DashTypes);
v0.new = function(v5) --[[ Line: 9 ]] --[[ Name: new ]]
    -- upvalues: v0 (copy)
    local v6 = setmetatable({}, v0);
    v6.Handler = v5;
    v6.Utils = v5.Utils;
    v5.dashcd = false;
    return v6;
end;
v0.PC_Activate = function(v7) --[[ Line: 18 ]] --[[ Name: PC_Activate ]]
    -- upvalues: v3 (copy), v4 (copy)
    if v3:GetAttribute("Grounded") then
        print("Grounded");
        return;
    elseif not _G.check:inspect(v3, true) then
        print("Inspect");
        return;
    elseif v7.Handler.dashcd == true then
        print("DashCD");
        return;
    elseif v3:FindFirstChild("Block") then
        print("Blocking");
        return;
    elseif _G.canuse ~= true and _G.blocking ~= true then
        print("blocking?");
        return;
    elseif _G.swimming ~= false and (_G.swimming ~= true or v7.Handler.Fishman ~= true) then
        print("Swimming");
        return;
    else
        local _ = v3:FindFirstChild("inCombat");
        v7.Handler.dashcd = true;
        local _ = v4:dash(v7.Handler.dashcd);
        v7.Handler.dashcd = false;
        return;
    end;
end;
v0.Mobile_Activate = v0.PC_Activate;
return v0;