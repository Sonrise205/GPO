local l_LocalizationService_0 = game:GetService("LocalizationService");
local l_HttpService_0 = game:GetService("HttpService");
local l_RunService_0 = game:GetService("RunService");
local v3 = {};
local function v4(v5, v6, v7, v8) --[[ Line: 22 ]] --[[ Name: recurseAdd ]]
    -- upvalues: v4 (copy)
    if v7 ~= "" then
        v7 = v7 .. ".";
    end;
    for v9, v10 in pairs(v8) do
        local v11 = v7 .. v9;
        if type(v10) == "table" then
            v4(v5, v6, v11, v10);
        elseif type(v10) == "string" then
            local v12 = "";
            if v6 == "en" then
                v12 = v10;
            end;
            v5:SetEntryValue(v11, v12, "", v6, v10);
        else
            error("Bad type for value in '" .. v11 .. "'.");
        end;
    end;
end;
v3.localeFromName = function(v13) --[[ Line: 51 ]] --[[ Name: localeFromName ]]
    if v13:sub(-5) == ".json" then
        return v13:sub(1, #v13 - 5);
    else
        return v13;
    end;
end;
v3.getOrCreateLocalizationTable = function() --[[ Line: 59 ]] --[[ Name: getOrCreateLocalizationTable ]]
    -- upvalues: l_LocalizationService_0 (copy), l_RunService_0 (copy)
    local l_GeneratedJSONTable_0 = l_LocalizationService_0:FindFirstChild("GeneratedJSONTable");
    if not l_GeneratedJSONTable_0 then
        l_GeneratedJSONTable_0 = Instance.new("LocalizationTable");
        l_GeneratedJSONTable_0.Name = "GeneratedJSONTable";
        if l_RunService_0:IsRunning() then
            l_GeneratedJSONTable_0.Parent = l_LocalizationService_0;
        end;
    end;
    return l_GeneratedJSONTable_0;
end;
v3.loadFolder = function(v15) --[[ Line: 78 ]] --[[ Name: loadFolder ]]
    -- upvalues: v3 (copy), v4 (copy)
    local v16 = v3.getOrCreateLocalizationTable();
    for _, v18 in pairs(v15:GetDescendants()) do
        if v18:IsA("StringValue") then
            local v19 = v3.localeFromName(v18.Name);
            v3.addJsonToTable(v16, v19, v18.Value);
        elseif v18:IsA("ModuleScript") then
            local v20 = v3.localeFromName(v18.Name);
            v4(v16, v20, "", require(v18));
        end;
    end;
    return v16;
end;
v3.toLocalizationTable = function(v21, v22) --[[ Line: 99 ]] --[[ Name: toLocalizationTable ]]
    -- upvalues: v3 (copy)
    if typeof(v21) == "Instance" then
        return (v3.loadFolder(v21));
    elseif type(v21) == "string" and type(v22) == "table" then
        return (v3.loadTable(v21, v22));
    else
        error("Bad args");
        return;
    end;
end;
v3.loadTable = function(v23, v24) --[[ Line: 118 ]] --[[ Name: loadTable ]]
    -- upvalues: v3 (copy), v4 (copy)
    local v25 = v3.getOrCreateLocalizationTable();
    v4(v25, v23, "", v24);
    return v25;
end;
v3.addJsonToTable = function(v26, v27, v28) --[[ Line: 132 ]] --[[ Name: addJsonToTable ]]
    -- upvalues: l_HttpService_0 (copy), v4 (copy)
    local v29 = l_HttpService_0:JSONDecode(v28);
    v4(v26, v27, "", v29);
end;
return v3;