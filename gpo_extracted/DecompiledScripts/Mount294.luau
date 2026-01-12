local l_LocalPlayer_0 = game.Players.LocalPlayer;
local _ = game:GetService("RunService");
local _ = require(game.ReplicatedStorage.Modules.Skills);
local v3 = require(script.Parent.Parent.MobileBase);
local _ = require(l_LocalPlayer_0.PlayerScripts:WaitForChild("PlayerModule"));
local _ = l_LocalPlayer_0:GetMouse();
local v6 = setmetatable({}, v3);
v6.__index = v6;
v6.new = function(_) --[[ Line: 18 ]] --[[ Name: new ]]
    -- upvalues: v3 (copy), v6 (copy)
    local v8 = setmetatable(v3.new(script.Name), v6);
    v8.Cooldowns = {
        fear = false
    };
    return v8;
end;
v6.ExitMount = function(v9, _) --[[ Line: 28 ]] --[[ Name: ExitMount ]]
    -- upvalues: l_LocalPlayer_0 (copy)
    local _ = v9.Cooldowns;
    local l_Character_0 = l_LocalPlayer_0.Character;
    local l_SeatPart_0 = l_Character_0.Humanoid.SeatPart;
    if l_SeatPart_0 == nil then
        return;
    else
        local l_Parent_0 = l_SeatPart_0.Parent;
        if l_Parent_0.Info.inRace.Value == true then
            return;
        else
            game:GetService("ContextActionService"):UnbindAction("LockSeat");
            l_Character_0.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Jumping, true);
            l_Character_0.Humanoid.Jump = true;
            l_Parent_0.Seat.unsit:InvokeServer();
            l_Character_0.HumanoidRootPart.Velocity = Vector3.new();
            l_Character_0.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Jumping, true);
            return;
        end;
    end;
end;
return v6;