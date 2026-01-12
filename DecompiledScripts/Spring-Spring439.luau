local v0 = {};
local v1 = require(game.ReplicatedStorage.Modules.Skills);
local _ = _G.clientimpacts[game.ReplicatedStorage.ClientImpacts.Soru];
local l_LocalPlayer_0 = game.Players.LocalPlayer;
local l_FirstChild_0 = game.ReplicatedStorage:FindFirstChild("Stats" .. l_LocalPlayer_0.Name);
local _ = require(game.ReplicatedStorage.Modules.FastWait);
local _ = game:GetService("UserInputService");
v0.start = function(_, v8) --[[ Line: 8 ]] --[[ Name: start ]]
    -- upvalues: v1 (copy), l_FirstChild_0 (copy)
    local l_Character_0 = game.Players.LocalPlayer.Character;
    local v10 = v1.GetM("Spring Dash");
    if _G.instantDash == false then
        return;
    elseif v10.stamreq and l_FirstChild_0.Stamina.Value < v10.stamreq then
        v8 = false;
        return;
    elseif v10.statreq and _G.MeetReq(v1.GetM("Spring Dash").statreq) == false then
        v8 = false;
        return;
    else
        if l_Character_0.Humanoid.MoveDirection == Vector3.new(0, 0, 0, 0) then
            local _ = l_Character_0.HumanoidRootPart.CFrame.LookVector * 1;
        end;
        if game.ReplicatedStorage.Events.Skill:InvokeServer("Spring Dash") == true then
            _G.PlayEffect("SpringDash", nil, l_Character_0);
        end;
        task.wait(0.5);
        return true;
    end;
end;
return v0;