local v0 = {};
v0.__index = v0;
local l_LocalPlayer_0 = game.Players.LocalPlayer;
local _ = game:GetService("UserInputService");
local v3 = l_LocalPlayer_0.Character or l_LocalPlayer_0.CharacterAdded:Wait();
local v4 = require(game.ReplicatedStorage.Util.Movement.GpoClimbing);
v0.new = function(v5) --[[ Line: 9 ]] --[[ Name: new ]]
    -- upvalues: v0 (copy), v4 (copy), v3 (copy)
    local v6 = setmetatable({}, v0);
    v6.Handler = v5;
    v6.Utils = v5.Utils;
    v5.climbCD = false;
    v6.ClimbingObject = v4:setup(v3);
    return v6;
end;
local v7 = RaycastParams.new();
v7.FilterDescendantsInstances = {
    workspace.Islands, 
    workspace.Env, 
    workspace.Ships
};
v7.FilterType = Enum.RaycastFilterType.Include;
v0.PC_Activate = function(v8) --[[ Line: 24 ]] --[[ Name: PC_Activate ]]
    -- upvalues: l_LocalPlayer_0 (copy), v3 (copy), v7 (copy)
    local l_Character_0 = l_LocalPlayer_0.Character;
    local _ = l_Character_0.Humanoid;
    if l_Character_0.PrimaryPart == nil then
        return;
    else
        local l_ClimbingObject_0 = v8.ClimbingObject;
        if v3:GetAttribute("Grounded") == nil and _G.swimming == false and (_G.check:inspect(v3) == true or l_ClimbingObject_0 and l_ClimbingObject_0.Enabled == true) and v3:findFirstChild("kenTrain") == nil then
            if _G.canuse == false and l_ClimbingObject_0.Enabled == false then
                return;
            elseif v8.climbCD == true then
                return;
            elseif game.ReplicatedStorage:FindFirstChild("Matchinfo") and game.ReplicatedStorage.Matchinfo.matchStarted.Value == false then
                return;
            elseif v3:GetAttribute("flyMode") then
                return;
            else
                local v12 = 2 + v3.PrimaryPart.Size.Y * 2;
                local l_Z_0 = v3.PrimaryPart.Size.Z;
                local v14 = v3.HumanoidRootPart.CFrame * CFrame.new(0, 0, l_Z_0);
                if not workspace:Raycast(v14.Position, v14.LookVector * (v12 + l_Z_0 - 0.5), v7) then
                    return;
                elseif l_Character_0:FindFirstChild("ragcarry") == nil and _G.check:inspect(l_Character_0) == false and l_ClimbingObject_0.Enabled == false then
                    return;
                elseif l_ClimbingObject_0.Enabled == false and l_Character_0.PrimaryPart.CollisionGroupId == 1 then
                    return;
                else
                    if l_ClimbingObject_0.Enabled == false then
                        l_ClimbingObject_0.AlreadyStopped = false;
                    end;
                    if not l_ClimbingObject_0.Enabled == true and (l_ClimbingObject_0.climbingtime < 1 or _G.canuse == false) then
                        return;
                    else
                        local v15 = not l_ClimbingObject_0.Enabled;
                        warn(v15, l_ClimbingObject_0.Enabled);
                        if v15 == true then
                            if not _G.canuse or l_ClimbingObject_0.climbingtime < 1 then
                                return;
                            else
                                _G.canuse = false;
                                print("START CLIMBING");
                                game.ReplicatedStorage.Events.climb:InvokeServer(true);
                                l_ClimbingObject_0.Enabled = true;
                                l_ClimbingObject_0.AlreadyStopped = false;
                                l_ClimbingObject_0:step();
                                if l_ClimbingObject_0.Enabled == false then
                                    v8.climbCD = true;
                                    task.delay(1, function() --[[ Line: 94 ]]
                                        -- upvalues: v8 (copy)
                                        v8.climbCD = false;
                                    end);
                                    return;
                                else
                                    return;
                                end;
                            end;
                        else
                            _G.canuse = true;
                            l_ClimbingObject_0.Enabled = false;
                            l_ClimbingObject_0:stop();
                            v8.climbCD = true;
                            task.delay(1, function() --[[ Line: 103 ]]
                                -- upvalues: v8 (copy)
                                v8.climbCD = false;
                            end);
                            print("CLIMB STOP");
                            for _, v17 in l_Character_0:GetChildren() do
                                if v17:IsA("BasePart") then
                                    v17.CollisionGroup = "Players";
                                end;
                            end;
                            return;
                        end;
                    end;
                end;
            end;
        else
            return;
        end;
    end;
end;
v0.Mobile_Activate = v0.PC_Activate;
return v0;