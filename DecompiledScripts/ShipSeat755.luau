local v0 = {};
v0.__index = v0;
local l_LocalPlayer_0 = game.Players.LocalPlayer;
local _ = game:GetService("UserInputService");
local v3 = l_LocalPlayer_0.Character or l_LocalPlayer_0.CharacterAdded:Wait();
v0.new = function(v4) --[[ Line: 9 ]] --[[ Name: new ]]
    -- upvalues: v0 (copy), v3 (copy)
    local v5 = setmetatable({}, v0);
    v5.Handler = v4;
    v5.SeatLoop = nil;
    v5.SitAnim = v3.Humanoid.Animator:LoadAnimation(game.ReplicatedStorage.Util.Movement.Sit);
    v5.SitAnim.Priority = Enum.AnimationPriority.Action4;
    v5.Utils = v4.Utils;
    return v5;
end;
v0.PC_Activate = function(v6) --[[ Line: 21 ]] --[[ Name: PC_Activate ]]
    -- upvalues: v3 (copy)
    local l_SitAnim_0 = v6.SitAnim;
    local l_Humanoid_0 = v3.Humanoid;
    if l_Humanoid_0 and l_Humanoid_0:GetStateEnabled(Enum.HumanoidStateType.Seated) == false then
        return;
    elseif v3:GetAttribute("flyMode") then
        _G.displayMessage("<Color=Red>Cant sit while flying!");
        return;
    else
        local v9, _ = game.ReplicatedStorage.Events.shipSit:InvokeServer();
        v9 = _G.awaitObject(v9);
        if v9 ~= nil and l_SitAnim_0.IsPlaying == false then
            if v6.SeatLoop then
                v6.SeatLoop:Disconnect();
                v6.SeatLoop = nil;
            end;
            v6.SeatLoop = game["Run Service"].Stepped:Connect(function() --[[ Line: 40 ]]
                -- upvalues: v9 (ref), v3 (ref), v6 (copy), l_SitAnim_0 (copy)
                if v9.Occupant ~= v3.Humanoid then
                    if v6.SeatLoop then
                        v6.SeatLoop:Disconnect();
                        v6.SeatLoop = nil;
                    end;
                    l_SitAnim_0:Stop();
                end;
            end);
            l_SitAnim_0:Play();
        else
            if v6.SeatLoop then
                v6.SeatLoop:Disconnect();
                v6.SeatLoop = nil;
            end;
            l_SitAnim_0:Stop();
        end;
        return;
    end;
end;
v0.Mobile_Activate = v0.PC_Activate;
return v0;