local v0 = require(script.IntervalTree);
local v1 = require(script.GlobalSettings);
local _ = {};
local v3 = v0.new();
local v4 = v3:Serialize();
local v5 = 0;
local function v6() --[[ Line: 18 ]] --[[ Name: GetTree ]]
    -- upvalues: v3 (ref)
    return v3;
end;
local function v7() --[[ Line: 22 ]] --[[ Name: GetVersion ]]
    -- upvalues: v5 (ref)
    return v5;
end;
local function v8() --[[ Line: 26 ]] --[[ Name: GetSerializedTree ]]
    -- upvalues: v4 (ref)
    return v4;
end;
local function v11(v9, v10) --[[ Line: 30 ]] --[[ Name: GetWaveSettings ]]
    -- upvalues: v3 (ref)
    return v3:Search(v9, v10);
end;
local function v17(v12, v13, v14, v15) --[[ Line: 34 ]] --[[ Name: AddSetting ]]
    -- upvalues: v3 (ref), v4 (ref), v5 (ref)
    local v16 = v3:Insert(v13.X, v14.X, v13.Z, v14.Z, v12, v15);
    v4 = v3:Serialize();
    v5 = v5 + 1;
    return v16;
end;
local function v24(v18, v19, v20, v21, v22) --[[ Line: 41 ]] --[[ Name: EditSetting ]]
    -- upvalues: v3 (ref), v4 (ref), v5 (ref)
    local v23 = v3:Update(v18, v20.X, v21.X, v20.Z, v21.Z, v19, v22);
    if v23 then
        v4 = v3:Serialize();
        v5 = v5 + 1;
    end;
    return v23;
end;
local function v27(v25) --[[ Line: 50 ]] --[[ Name: RemoveSetting ]]
    -- upvalues: v3 (ref), v4 (ref), v5 (ref)
    local v26 = v3:Remove(v25);
    if v26 then
        v4 = v3:Serialize();
        v5 = v5 + 1;
    end;
    return v26;
end;
local function v30() --[[ Line: 59 ]] --[[ Name: _AddGlobalSettings ]]
    -- upvalues: v1 (copy), v3 (ref), v4 (ref), v5 (ref)
    for _, v29 in v1 do
        v3:Insert(-99999999, 99999999, -99999999, 99999999, v29, v29.Priority);
    end;
    v4 = v3:Serialize();
    v5 = v5 + 1;
end;
local function v32(v31) --[[ Line: 67 ]] --[[ Name: _UpdateTree ]]
    -- upvalues: v3 (ref), v0 (copy)
    v3 = v0.Deserialize(v31);
end;
v30();
return {
    GetTree = v6, 
    GetSerializedTree = v8, 
    GetVersion = v7, 
    _UpdateTree = v32, 
    GetWaveSettings = v11, 
    AddSetting = v17, 
    EditSetting = v24, 
    RemoveSetting = v27
};