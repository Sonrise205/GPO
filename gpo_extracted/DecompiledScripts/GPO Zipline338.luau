local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_Players_0 = game:GetService("Players");
local l_UserInputService_0 = game:GetService("UserInputService");
local l_RunService_0 = game:GetService("RunService");
local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
local l_ZipLines_0 = workspace:WaitForChild("ZipLines");
local l_ZiplineRemote_0 = l_ReplicatedStorage_0.Events.ZiplineRemote;
local v7 = game.ReplicatedStorage:WaitForChild("Stats" .. l_LocalPlayer_0.Name);
local v8 = OverlapParams.new();
v8.FilterDescendantsInstances = {
    l_ZipLines_0
};
v8.FilterType = Enum.RaycastFilterType.Include;
local v9 = require(script.Zipline);
local v10 = {
    _currentZipline = nil, 
    _updateThread = nil, 
    _isOnCooldown = false, 
    _cooldown = 0.5, 
    _radius = 5
};
v10._applyCooldown = function() --[[ Line: 29 ]] --[[ Name: _applyCooldown ]]
    -- upvalues: v10 (copy)
    if v10._isOnCooldown and coroutine.status(v10._isOnCooldown) ~= "dead" then
        task.defer(task.cancel, v10._isOnCooldown);
    end;
    v10._isOnCooldown = task.delay(v10._cooldown, function() --[[ Line: 34 ]]
        -- upvalues: v10 (ref)
        v10._isOnCooldown = false;
    end);
end;
v10._exit = function() --[[ Line: 39 ]] --[[ Name: _exit ]]
    -- upvalues: v10 (copy)
    if not v10._currentZipline then
        return;
    else
        v10._currentZipline:Exit();
        return;
    end;
end;
v10._validate = function() --[[ Line: 44 ]] --[[ Name: _validate ]]
    -- upvalues: v10 (copy)
    return not v10._isOnCooldown;
end;
v10._detectZiplinePart = function(_, v12) --[[ Line: 48 ]] --[[ Name: _detectZiplinePart ]]
    -- upvalues: v10 (copy), v8 (copy)
    local l_workspace_PartBoundsInRadius_0 = workspace:GetPartBoundsInRadius(v12.Position, v10._radius, v8);
    local l__radius_0 = v10._radius;
    local v15 = nil;
    for _, v17 in l_workspace_PartBoundsInRadius_0 do
        local l_Magnitude_0 = (v17.Position - v12.Position).Magnitude;
        if l_Magnitude_0 > l__radius_0 then
            l__radius_0 = l_Magnitude_0;
            v15 = v17;
        end;
    end;
    return v15;
end;
local v19 = 0;
v10._update = function(v20) --[[ Line: 67 ]] --[[ Name: _update ]]
    -- upvalues: v10 (copy), l_LocalPlayer_0 (copy), v7 (copy), v19 (ref), v9 (copy), l_ZiplineRemote_0 (copy)
    if not v10._validate() then
        return;
    else
        local l_Character_0 = l_LocalPlayer_0.Character;
        if l_Character_0.PrimaryPart == nil then
            return;
        else
            local l_PrimaryPart_0 = l_Character_0.PrimaryPart;
            if not v10._currentZipline then
                local v23 = v10._detectZiplinePart(l_Character_0, l_PrimaryPart_0);
                local v24 = v23 and v23.Position.Y;
                local l_Y_0 = l_PrimaryPart_0.Position.Y;
                if v23 and _G.canuse == true and _G.check:inspect(l_Character_0) == true and l_Character_0:FindFirstChild("Blocking") == nil and l_Character_0:GetAttribute("flyMode") == nil then
                    local v26 = v7.Stamina.MaxValue * 0.08;
                    if v7.Stamina.Value < v26 then
                        if tick() - v19 >= 1 then
                            _G.StamRed(v26);
                            v19 = tick();
                        end;
                        return;
                    else
                        local v27 = l_Y_0 < v24 and -1 or 1;
                        local v28 = v9.new(l_Character_0, v23, v27);
                        v28:Enter();
                        v28.Destroyed:Connect(function() --[[ Line: 105 ]]
                            -- upvalues: v10 (ref), l_ZiplineRemote_0 (ref)
                            v10._currentZipline = nil;
                            v10._applyCooldown();
                            l_ZiplineRemote_0:InvokeServer("Exit");
                        end);
                        v10._currentZipline = v28;
                        l_ZiplineRemote_0:InvokeServer("Enter", v27, l_PrimaryPart_0.Position);
                        if l_Character_0:GetAttribute("ZiplineBypass") == nil then
                            v10._currentZipline:Exit(true);
                            return;
                        end;
                    end;
                end;
            else
                v10._currentZipline:Update(v20);
            end;
            return;
        end;
    end;
end;
v10._toggleDetection = function(v29) --[[ Line: 123 ]] --[[ Name: _toggleDetection ]]
    -- upvalues: v10 (copy), l_RunService_0 (copy)
    if not v10._updateThread and v29 then
        local v30 = 0;
        v10._updateThread = l_RunService_0.Heartbeat:Connect(function(v31) --[[ Line: 127 ]]
            -- upvalues: v10 (ref), v30 (ref)
            if not v10._currentZipline then
                if tick() - v30 <= 0.06666666666666667 then
                    return;
                else
                    v30 = tick();
                end;
            end;
            v10._update(v31);
        end);
        return;
    else
        if v10._updateThread and not v29 then
            v10._updateThread:Disconnect();
            v10._updateThread = nil;
            if v10._currentZipline then
                v10._currentZipline:Exit();
            end;
        end;
        return;
    end;
end;
v10._handleCharacter = function() --[[ Line: 148 ]] --[[ Name: _handleCharacter ]]
    -- upvalues: v10 (copy), l_LocalPlayer_0 (copy)
    local function v35(v32) --[[ Line: 150 ]] --[[ Name: OnCharacterAdded ]]
        -- upvalues: v10 (ref)
        v10._toggleDetection(false);
        v32:WaitForChild("Humanoid").StateChanged:Connect(function(_, v34) --[[ Line: 154 ]]
            -- upvalues: v10 (ref)
            if v10._currentZipline then
                return;
            elseif v34 == Enum.HumanoidStateType.Landed then
                v10._toggleDetection(false);
                return;
            else
                if v34 == Enum.HumanoidStateType.Jumping or v34 == Enum.HumanoidStateType.Freefall then
                    v10._toggleDetection(true);
                end;
                return;
            end;
        end);
    end;
    local v36 = l_LocalPlayer_0.Character or l_LocalPlayer_0.CharacterAdded:Wait();
    v10._toggleDetection(false);
    v36:WaitForChild("Humanoid").StateChanged:Connect(function(_, v38) --[[ Line: 154 ]]
        -- upvalues: v10 (ref)
        if v10._currentZipline then
            return;
        elseif v38 == Enum.HumanoidStateType.Landed then
            v10._toggleDetection(false);
            return;
        else
            if v38 == Enum.HumanoidStateType.Jumping or v38 == Enum.HumanoidStateType.Freefall then
                v10._toggleDetection(true);
            end;
            return;
        end;
    end);
    l_LocalPlayer_0.CharacterAdded:Connect(v35);
end;
v10._handleInputs = function() --[[ Line: 168 ]] --[[ Name: _handleInputs ]]
    -- upvalues: l_UserInputService_0 (copy), v10 (copy)
    l_UserInputService_0.InputBegan:Connect(function(v39, v40) --[[ Line: 169 ]]
        -- upvalues: v10 (ref)
        if v40 then
            return;
        elseif v39.KeyCode ~= Enum.KeyCode.Space then
            return;
        elseif not v10._currentZipline then
            return;
        else
            v10._currentZipline:Exit(true);
            return;
        end;
    end);
    l_UserInputService_0.JumpRequest:Connect(function() --[[ Line: 179 ]]
        -- upvalues: v10 (ref)
        if _G.mobile == false then
            return;
        elseif not v10._currentZipline then
            return;
        else
            v10._currentZipline:Exit(true);
            return;
        end;
    end);
end;
v10.Initialize = function() --[[ Line: 190 ]] --[[ Name: Initialize ]]
    -- upvalues: v10 (copy)
    print("client init");
    v10._handleCharacter();
    v10._handleInputs();
end;
return v10;