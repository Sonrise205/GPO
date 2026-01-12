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
    local v10 = v1.GetM("PikaDashV2");
    if _G.instantDash == false then
        return;
    elseif v10.stamreq and l_FirstChild_0.Stamina.Value < v10.stamreq then
        v8 = false;
        return;
    elseif v10.statreq and _G.MeetReq(v1.GetM("PikaDashV2").statreq) == false then
        v8 = false;
        return;
    else
        local v11 = nil;
        local v12 = 25;
        if l_Character_0.Humanoid.Health / l_Character_0.Humanoid.MaxHealth <= 0.75 then
            v12 = 15;
        end;
        local l_MoveDirection_0 = l_Character_0.Humanoid.MoveDirection;
        if l_MoveDirection_0 == Vector3.new(0, 0, 0, 0) then
            l_MoveDirection_0 = l_Character_0.HumanoidRootPart.CFrame.LookVector * 1;
        end;
        v11 = CFrame.new(l_Character_0.HumanoidRootPart.CFrame.p, l_MoveDirection_0 + l_Character_0.HumanoidRootPart.CFrame.p).lookVector * v12;
        local v14 = Ray.new(l_Character_0.HumanoidRootPart.Position, v11);
        local v15, v16 = _G.raycastWhitelist(v14, {
            workspace.Islands, 
            workspace.Ships, 
            workspace.Env
        });
        local l_magnitude_0 = (l_Character_0.HumanoidRootPart.Position - v16).magnitude;
        if l_magnitude_0 < 2 then
            l_magnitude_0 = 0;
        end;
        local l_CFrame_0 = l_Character_0.HumanoidRootPart.CFrame;
        local v19, _, v21, v22, v23, v24, v25, v26, v27, v28, v29, v30 = (CFrame.new(l_CFrame_0.p, v16) * CFrame.new(0, 0, -l_magnitude_0)):components();
        local v31 = CFrame.new(v19, l_CFrame_0.Y, v21, v22, v23, v24, v25, v26, v27, v28, v29, v30);
        if v15 then
            v31 = v31 * CFrame.new(0, 1, 0);
        end;
        if v31 ~= v31 then
            return true;
        else
            if game.ReplicatedStorage.Events.Skill:InvokeServer("PikaDashV2", {
                old = l_CFrame_0, 
                new = v31
            }) == true then
                l_Character_0:PivotTo(v31);
                _G.PlayEffect("PikaDashV2", nil, l_CFrame_0, l_Character_0.HumanoidRootPart.CFrame);
            end;
            task.wait(0.75);
            return true;
        end;
    end;
end;
return v0;