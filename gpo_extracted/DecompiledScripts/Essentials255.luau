local _ = game:GetService("RunService");
local l_TweenService_0 = game:GetService("TweenService");
local v2 = RaycastParams.new();
v2.FilterType = Enum.RaycastFilterType.Include;
v2.FilterDescendantsInstances = {
    workspace.Islands, 
    workspace.Env
};
v2.IgnoreWater = true;
local v3 = {
    RaycastParams = v2, 
    Mouse = require(script.Mouse)
};
local function _(v4, v5) --[[ Line: 16 ]] --[[ Name: Emit ]]
    local v6 = (not not v5 or v4:GetAttribute("EmitCount")) and v5 or v4:GetAttribute("EmitCount") or 10;
    local l_SavedQualityLevel_0 = UserSettings().GameSettings.SavedQualityLevel;
    if l_SavedQualityLevel_0 == Enum.SavedQualitySetting.Automatic then
        v4:Emit(v6 * 0.5);
        return;
    else
        local v8 = l_SavedQualityLevel_0.Value / 10;
        if v4 ~= nil then
            v4:Emit(v6 * v8);
        end;
        return;
    end;
end;
v3.DrawRay = function(v10, v11, v12) --[[ Line: 33 ]] --[[ Name: DrawRay ]]
    local v13 = typeof(v10) == "Vector3";
    local v14 = typeof(v11) == "Vector3";
    local v15 = v13 and v10 or v10.Position;
    local v16 = v14 and v11 or v11.Position;
    local l_Magnitude_0 = (v16 - v15).Magnitude;
    local l_Part_0 = Instance.new("Part");
    l_Part_0.Anchored = true;
    l_Part_0.Color = v12 or Color3.fromRGB(255, 255, 255);
    l_Part_0.Locked = true;
    l_Part_0.CanCollide = false;
    l_Part_0.Size = Vector3.new(0.5, 0.5, l_Magnitude_0);
    l_Part_0.CFrame = CFrame.new(v15, v16) * CFrame.new(0, 0, -l_Magnitude_0 / 2);
    l_Part_0.Parent = workspace.Effects;
end;
v3.BeamToggle = function(v19) --[[ Line: 51 ]] --[[ Name: BeamToggle ]]
    local l_pairs_0 = pairs;
    local v21 = typeof(v19) == "table" and v19 or v19:GetChildren();
    for _, v23 in l_pairs_0(v21) do
        if v23:IsA("Beam") then
            v23.Enabled = not v23.Enabled;
        end;
    end;
end;
v3.Tween = function(v24, v25, v26) --[[ Line: 59 ]] --[[ Name: Tween ]]
    -- upvalues: l_TweenService_0 (copy)
    local v27 = l_TweenService_0:Create(v24, v25, v26);
    v27:Play();
    task.delay(v25.Time * 1.05, function() --[[ Line: 64 ]]
        -- upvalues: v27 (copy)
        if v27 then
            v27:Destroy();
        end;
    end);
    return v27, v25;
end;
v3.Destroy = function(v28, v29) --[[ Line: 73 ]] --[[ Name: Destroy ]]
    local v30 = typeof(v28) == "table" and v28 or {
        v28
    };
    for _, v32 in pairs(v30) do
        task.delay(v29, function() --[[ Line: 77 ]]
            -- upvalues: v32 (copy)
            if typeof(v32) == "Instance" then
                v32:Destroy();
                return;
            else
                if typeof(v32) == "RBXScriptConnection" then
                    v32:Disconnect();
                end;
                return;
            end;
        end);
    end;
end;
v3.GetTime = function(v33, v34) --[[ Line: 87 ]] --[[ Name: GetTime ]]
    return (math.abs(v33 / v34));
end;
v3.Emit = function(v35, v36, v37, _) --[[ Line: 91 ]] --[[ Name: Emit ]]
    if v36 then
        for _, v40 in pairs(v35:GetChildren()) do
            if v40:IsA("ParticleEmitter") then
                v40:Emit(v40:GetAttribute("EmitCount"));
            end;
        end;
        return;
    else
        for _, v42 in pairs(v35:GetChildren()) do
            if v42:IsA("ParticleEmitter") then
                if not v42.Enabled then
                    v42:Emit(v42:GetAttribute("EmitCount"));
                elseif v42.Enabled then

                end;
                v42.Enabled = not v42.Enabled;
                if v37 then
                    task.delay(v37, function() --[[ Line: 112 ]]
                        -- upvalues: v42 (copy)
                        v42.Enabled = not v42.Enabled;
                    end);
                end;
            end;
        end;
        return;
    end;
end;
local v43 = require(game.ReplicatedStorage.Modules.RotatedRegion3);
v3.CreateHitbox = function(v44, v45, v46) --[[ Line: 123 ]] --[[ Name: CreateHitbox ]]
    -- upvalues: v43 (copy)
    local v47 = OverlapParams.new();
    v47.FilterType = Enum.RaycastFilterType.Include;
    v47.FilterDescendantsInstances = v46;
    local v48 = {};
    for _, v50 in (v43.new(v44, v45):FindPartsInRegion3WithWhiteList(v46, 5000)) do
        if not table.find(v48, v50.Parent) then
            table.insert(v48, v50.Parent);
        end;
    end;
    if v48[1] then
        return v48;
    else
        return nil;
    end;
end;
v3.Raycast = function(v51, v52) --[[ Line: 147 ]] --[[ Name: Raycast ]]
    -- upvalues: v2 (copy)
    return workspace:Raycast(v51, v52, v2);
end;
v3.Visualize = v3.DrawRay;
return v3;