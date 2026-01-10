local v0 = {};
local v1 = require(game.ReplicatedStorage.Modules.Skills);
local _ = _G.clientimpacts[game.ReplicatedStorage.ClientImpacts.Soru];
local l_LocalPlayer_0 = game.Players.LocalPlayer;
local l_FirstChild_0 = game.ReplicatedStorage:FindFirstChild("Stats" .. l_LocalPlayer_0.Name);
local _ = require(game.ReplicatedStorage.Modules.FastWait);
local _ = game:GetService("UserInputService");
local _ = require(game.ReplicatedStorage.Modules.LightningBolt);
local _ = require(game.ReplicatedStorage.Modules.LightningBolt.LightningSparks);
v0.start = function(_, v10) --[[ Line: 11 ]] --[[ Name: start ]]
    -- upvalues: v1 (copy), l_FirstChild_0 (copy)
    local l_Character_0 = game.Players.LocalPlayer.Character;
    local v12 = v1.GetM("GoroDash");
    if _G.instantDash == false then
        return;
    elseif v12.stamreq and l_FirstChild_0.Stamina.Value < v12.stamreq then
        v10 = false;
        return;
    elseif v12.statreq and _G.MeetReq(v1.GetM("GoroDash").statreq) == false then
        v10 = false;
        return;
    else
        local v13 = nil;
        local l_MoveDirection_0 = l_Character_0.Humanoid.MoveDirection;
        if l_MoveDirection_0 == Vector3.new(0, 0, 0, 0) then
            l_MoveDirection_0 = l_Character_0.HumanoidRootPart.CFrame.LookVector * 1;
        end;
        v13 = CFrame.new(l_Character_0.HumanoidRootPart.CFrame.p, l_MoveDirection_0 + l_Character_0.HumanoidRootPart.CFrame.p).lookVector * 15;
        local v15 = Ray.new(l_Character_0.HumanoidRootPart.Position, v13);
        local v16, v17 = _G.raycastWhitelist(v15, {
            workspace.Islands, 
            workspace.Ships, 
            workspace.Env
        });
        local l_magnitude_0 = (l_Character_0.HumanoidRootPart.Position - v17).magnitude;
        if l_magnitude_0 < 2 then
            l_magnitude_0 = 0;
        end;
        local l_CFrame_0 = l_Character_0.HumanoidRootPart.CFrame;
        local v20, _, v22, v23, v24, v25, v26, v27, v28, v29, v30, v31 = (CFrame.new(l_CFrame_0.p, v17) * CFrame.new(0, 0, -l_magnitude_0)):components();
        local v32 = CFrame.new(v20, l_CFrame_0.Y, v22, v23, v24, v25, v26, v27, v28, v29, v30, v31);
        if v16 then
            v32 = v32 * CFrame.new(0, 1, 0);
        end;
        if v32 ~= v32 then
            return true;
        else
            if game.ReplicatedStorage.Events.Skill:InvokeServer("GoroDash", {
                old = l_CFrame_0, 
                new = v32
            }) == true then
                l_Character_0:PivotTo(v32);
                _G.PlayEffect("GoroDash", nil, l_CFrame_0, l_Character_0.HumanoidRootPart.CFrame);
            end;
            task.wait(0.75);
            return true;
        end;
    end;
end;
return v0;