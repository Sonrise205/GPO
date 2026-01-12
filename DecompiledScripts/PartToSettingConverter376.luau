local l_CollectionService_0 = game:GetService("CollectionService");
local v1 = script:GetAttribute("TagName") or "WaveSetting";
local v2 = require(script.Parent.WaveSettings);
local v3 = {};
local function v15(v4) --[[ Line: 9 ]] --[[ Name: getMinMaxCorners ]]
    local l_Size_0 = v4.Size;
    local l_CFrame_0 = v4.CFrame;
    local v7 = {
        Vector3.new(-l_Size_0.X / 2, 0, -l_Size_0.Z / 2), 
        Vector3.new(-l_Size_0.X / 2, 0, l_Size_0.Z / 2), 
        Vector3.new(l_Size_0.X / 2, 0, -l_Size_0.Z / 2), 
        (Vector3.new(l_Size_0.X / 2, 0, l_Size_0.Z / 2))
    };
    local v8 = {};
    for _, v10 in ipairs(v7) do
        table.insert(v8, l_CFrame_0:ToWorldSpace(CFrame.new(v10)).Position);
    end;
    local v11 = v8[1];
    local v12 = v8[1];
    for _, v14 in ipairs(v8) do
        if v14.X < v11.X and v14.Z < v11.Z then
            v11 = v14;
        end;
        if v14.X > v12.X and v14.Z > v12.Z then
            v12 = v14;
        end;
    end;
    return v11, v12;
end;
local function v23(v16) --[[ Line: 46 ]] --[[ Name: EditWaveSetting ]]
    -- upvalues: v15 (copy), v3 (copy), v2 (copy)
    local v17 = {
        Direction = v16:GetAttribute("Direction") or Vector3.new(0, 0, 0, 0), 
        WaveLength = v16:GetAttribute("WaveLength"), 
        Steepness = v16:GetAttribute("Steepness"), 
        Gravity = v16:GetAttribute("Gravity"), 
        Cancel = v16:GetAttribute("Cancel") or false
    };
    local v18 = v16:GetAttribute("Priority") or 0;
    if typeof(v18) ~= "number" then
        return false;
    elseif not v17.WaveLength or not v17.Steepness or not v17.Gravity then
        return false;
    elseif typeof(v17.Direction) ~= "Vector3" then
        return false;
    elseif typeof(v17.WaveLength) ~= "number" then
        return false;
    elseif typeof(v17.Steepness) ~= "number" then
        return false;
    elseif typeof(v17.Gravity) ~= "number" then
        return false;
    elseif typeof(v17.Cancel) ~= "boolean" then
        return false;
    else
        local v19, v20 = v15(v16);
        local l_id_0 = v3[v16].id;
        if l_id_0 then
            return v2.EditSetting(l_id_0, v17, Vector3.new(v19.X, 0, v19.Z), Vector3.new(v20.X, 0, v20.Z), v18);
        else
            local v22 = v2.AddSetting(v17, Vector3.new(v19.X, 0, v19.Y), Vector3.new(v20.X, 0, v20.Z), v18);
            v3[v16].id = v22;
            return true;
        end;
    end;
end;
local _ = function(v24) --[[ Line: 72 ]] --[[ Name: RemoveWaveSetting ]]
    -- upvalues: v2 (copy), v3 (copy)
    v2.RemoveSetting(v3[v24].id or "");
    for _, v26 in v3[v24].connectionList do
        v26:Disconnect();
    end;
    v3[v24] = nil;
end;
local function v32(v28) --[[ Line: 80 ]] --[[ Name: AddWaveSetting ]]
    -- upvalues: v3 (copy), v23 (copy), v2 (copy)
    if not v3[v28] then
        v3[v28] = {
            connectionList = {}
        };
    end;
    v23(v28);
    table.insert(v3[v28].connectionList, v28.AttributeChanged:Connect(function() --[[ Line: 87 ]]
        -- upvalues: v23 (ref), v28 (copy)
        v23(v28);
    end));
    table.insert(v3[v28].connectionList, v28:GetPropertyChangedSignal("Position"):Connect(function() --[[ Line: 90 ]]
        -- upvalues: v23 (ref), v28 (copy)
        v23(v28);
    end));
    table.insert(v3[v28].connectionList, v28:GetPropertyChangedSignal("Size"):Connect(function() --[[ Line: 93 ]]
        -- upvalues: v23 (ref), v28 (copy)
        v23(v28);
    end));
    table.insert(v3[v28].connectionList, v28.Destroying:Connect(function() --[[ Line: 96 ]]
        -- upvalues: v28 (copy), v2 (ref), v3 (ref)
        local l_v28_0 = v28;
        v2.RemoveSetting(v3[l_v28_0].id or "");
        for _, v31 in v3[l_v28_0].connectionList do
            v31:Disconnect();
        end;
        v3[l_v28_0] = nil;
    end));
end;
l_CollectionService_0:GetInstanceAddedSignal(v1):Connect(v32);
l_CollectionService_0:GetInstanceRemovedSignal(v1):Connect(function(v33) --[[ Line: 103 ]]
    -- upvalues: v2 (copy), v3 (copy)
    v2.RemoveSetting(v3[v33].id or "");
    v2.RemoveSetting(v3[v33].id or "");
    for _, v35 in v3[v33].connectionList do
        v35:Disconnect();
    end;
    v3[v33] = nil;
end);
return {
    Setup = function() --[[ Line: 108 ]] --[[ Name: Setup ]]
        -- upvalues: l_CollectionService_0 (copy), v1 (copy), v32 (copy)
        for _, v37 in l_CollectionService_0:GetTagged(v1) do
            v32(v37);
        end;
    end
};