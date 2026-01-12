local _ = game:GetService("RunService");
local _ = require(script.Parent.FrustumCulling);
local v2 = {};
v2.__index = v2;
local _ = script.Parent:GetAttribute("PlaneSize") or 100;
local v4 = script.Parent:GetAttribute("MaxTextureAnimationDistance") or 280;
local v5 = 1;
local v6 = 0;
local v7 = {};
local v8 = false;
local v9 = CFrame.new();
local v10 = {};
v2.AddWavePlane = function(v11) --[[ Line: 23 ]] --[[ Name: AddWavePlane ]]
    -- upvalues: v7 (copy)
    v7[v11] = true;
end;
v2.RemoveWavePlane = function(v12) --[[ Line: 27 ]] --[[ Name: RemoveWavePlane ]]
    -- upvalues: v7 (copy)
    v7[v12] = nil;
end;
local function v15() --[[ Line: 31 ]] --[[ Name: updateClosestVisiblePlanes ]]
    -- upvalues: v9 (ref), v10 (ref), v7 (copy), v4 (copy)
    local l_CFrame_0 = workspace.CurrentCamera.CFrame;
    if v9 == l_CFrame_0 then
        return;
    else
        v9 = l_CFrame_0;
        v10 = {};
        for v14 in pairs(v7) do
            if v14.isInFrustum and ((v14.wavePlane.Position - l_CFrame_0.Position) * Vector3.new(1, 0, 1, 0)).Magnitude <= v4 then
                table.insert(v10, v14);
            end;
        end;
        return true;
    end;
end;
v2.Update = function(v16) --[[ Line: 57 ]] --[[ Name: Update ]]
    -- upvalues: v8 (ref), v6 (ref), v5 (ref), v15 (copy), v10 (ref)
    if not v8 then
        return;
    else
        v6 = v6 + v16;
        if v6 < 0.041666666666666664 then
            return;
        else
            v6 = v6 - 0.041666666666666664;
            v5 = v5 % 240 + 1;
            local v17 = "Water" .. tostring(v5);
            v15();
            for _, v19 in pairs(v10) do
                v19.wavePlane.MaterialVariant = v17;
            end;
            return;
        end;
    end;
end;
v2.SetEnabled = function(v20) --[[ Line: 74 ]] --[[ Name: SetEnabled ]]
    -- upvalues: v8 (ref)
    v8 = v20;
end;
v2.IsEnabled = function() --[[ Line: 78 ]] --[[ Name: IsEnabled ]]
    -- upvalues: v8 (ref)
    return v8;
end;
return v2;