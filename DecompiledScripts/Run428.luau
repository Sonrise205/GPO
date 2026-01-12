local v0 = {};
v0.__index = v0;
local l_LocalPlayer_0 = game.Players.LocalPlayer;
local _ = game:GetService("UserInputService");
if not l_LocalPlayer_0.Character then
    local _ = l_LocalPlayer_0.CharacterAdded:Wait();
end;
local l_Character_0 = l_LocalPlayer_0.Character;
local l_Humanoid_0 = l_Character_0:WaitForChild("Humanoid");
local v6 = l_Humanoid_0.Animator:LoadAnimation(script.run);
_G.runAnim = v6;
local v7 = nil;
v0.new = function(v8) --[[ Line: 18 ]] --[[ Name: new ]]
    -- upvalues: v0 (copy), v7 (ref), v6 (ref), l_Character_0 (ref)
    local v9 = setmetatable({}, v0);
    v9.Handler = v8;
    v9.Utils = v8.Utils;
    v9.HoldingRun = false;
    v9.hookRun = function() --[[ Line: 24 ]]
        -- upvalues: v7 (ref), v6 (ref), v9 (copy), l_Character_0 (ref)
        if v7 then
            v7:Disconnect();
            v7 = nil;
        end;
        v7 = v6.KeyframeReached:Connect(function(v10) --[[ Line: 29 ]]
            -- upvalues: v9 (ref), l_Character_0 (ref)
            if v9.Utils.checkHoldingWeapon() == true then
                return;
            elseif l_Character_0.PrimaryPart.Anchored == true then
                return;
            else
                if v10:match("step") and v10 ~= "step" and _G.footstep then
                    _G.footstep(v10);
                end;
                return;
            end;
        end);
    end;
    return v9;
end;
local v11 = 0;
v0.PC_Activate = function(v12) --[[ Line: 48 ]] --[[ Name: PC_Activate ]]
    -- upvalues: v6 (ref), l_Character_0 (ref), l_LocalPlayer_0 (copy), l_Humanoid_0 (copy), v11 (ref)
    v6 = _G.runAnim;
    local l_checkHoldingWeapon_0 = v12.Utils.checkHoldingWeapon;
    if (_G.check:inspect(l_Character_0) == false or _G.canuse == false) and l_Character_0:FindFirstChild("ragcarry") == nil and l_Character_0:findFirstChild("kenTrain") == nil then
        repeat
            task.wait();
        until v12.HoldingRun == false or _G.check:inspect(l_Character_0) == true and _G.canuse == true;
        if _G.check:inspect(l_Character_0) == false or v12.HoldingRun == false then
            return;
        end;
    end;
    local v14 = 25;
    if game.ReplicatedStorage:FindFirstChild("Stats" .. l_LocalPlayer_0.Name).Customization.Race.Value:match("Fishman") == nil then
        v12.Handler.Fishman = false;
    else
        v12.Handler.Fishman = true;
    end;
    if v12.Handler.Fishman == true and _G.swimming == true then
        v14 = 35;
    end;
    if l_Character_0:GetAttribute("sulongTransformed") == true then
        v14 = 35;
    end;
    l_Humanoid_0.WalkSpeed = v14;
    if l_checkHoldingWeapon_0() == false then
        v6:Play();
        v6:AdjustSpeed(2);
        v6.TimePosition = v11;
    end;
    v12.hookRun();
    _G.running = true;
    local _ = v6;
    repeat
        if l_Character_0:GetAttribute("customM1") == "BuddhaMode" and l_Character_0:FindFirstChild("inCombat") == nil then
            v14 = 32.5;
        end;
        if l_Humanoid_0.Health >= l_Humanoid_0.MaxHealth / 4 and _G.canuse == true then
            if _G.swimming == false and v14 ~= 25 then
                v14 = 25;
                l_Humanoid_0.WalkSpeed = v14;
            elseif _G.swimming == true and v14 ~= 35 and v12.Handler.Fishman == true then
                v14 = 35;
                l_Humanoid_0.WalkSpeed = v14;
            end;
            if l_Character_0:GetAttribute("sulongTransformed") == true then
                v14 = 35;
            end;
            local l_l_Character_0_Attribute_0 = l_Character_0:GetAttribute("CustomRunSpeed");
            if l_l_Character_0_Attribute_0 then
                v14 = l_l_Character_0_Attribute_0;
            end;
            local l_ObjectValue_0 = l_Character_0:FindFirstChildWhichIsA("ObjectValue");
            if (l_ObjectValue_0 == nil or l_ObjectValue_0 and l_ObjectValue_0.Name == "kenTrain") and l_Humanoid_0.WalkSpeed < v14 and _G.canuse == true then
                l_Humanoid_0.WalkSpeed = v14;
            end;
        end;
        if l_checkHoldingWeapon_0() == false and v14 <= l_Humanoid_0.WalkSpeed and l_Character_0:FindFirstChild("Blocking") == nil then
            if l_Humanoid_0.FloorMaterial == Enum.Material.Air or l_Humanoid_0.MoveDirection == Vector3.new(0, 0, 0, 0) then
                v11 = v6.TimePosition;
                v6:Stop();
            elseif v6.IsPlaying == false then
                v6:Play();
                v6:AdjustSpeed(2);
                v6.TimePosition = v11;
            end;
        else
            v11 = v6.TimePosition;
            v6:Stop();
        end;
        game["Run Service"].Heartbeat:Wait();
    until _G.running == false or v12.HoldingRun == false;
    _G.running = false;
    v6:Stop();
    game.ReplicatedStorage.Events.sprint:FireServer(v6.Animation.AnimationId);
    if _G.canuse == false then
        repeat
            task.wait();
        until _G.canuse == true;
    end;
    l_Humanoid_0.WalkSpeed = 16;
end;
return v0;