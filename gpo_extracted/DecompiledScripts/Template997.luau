local v0 = {};
v0.__index = v0;
local l_LocalPlayer_0 = game.Players.LocalPlayer;
local _ = game:GetService("UserInputService");
if not l_LocalPlayer_0.Character then
    local _ = l_LocalPlayer_0.CharacterAdded:Wait();
end;
v0.new = function(v4) --[[ Line: 9 ]] --[[ Name: new ]]
    -- upvalues: v0 (copy)
    local v5 = setmetatable({}, v0);
    v5.Handler = v4;
    v5.Utils = v4.Utils;
    return v5;
end;
v0.PC_Activate = function(_) --[[ Line: 16 ]] --[[ Name: PC_Activate ]]

end;
v0.Mobile_Activate = v0.PC_Activate;
return v0;