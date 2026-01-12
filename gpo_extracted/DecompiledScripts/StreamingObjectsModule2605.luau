local v0 = {};
local v1 = {};
local v2 = {};
local l_ReplicatedStorage_0 = game.ReplicatedStorage;
local v4 = game["Run Service"]:IsServer();
local l_GoodSignal_0 = require(game.ReplicatedStorage:WaitForChild("Modules"):WaitForChild("Shared"):WaitForChild("Signals"):WaitForChild("GoodSignal"));
local l_Trove_0 = require(game.ReplicatedStorage:WaitForChild("Modules"):WaitForChild("Trove"));
local _ = warn;
local l_HumanoidRootPart_0 = workspace:WaitForChild("Holder"):WaitForChild("HumanoidRootPart");
local function v9(v10, v11) --[[ Line: 17 ]] --[[ Name: printTable ]]
    -- upvalues: v9 (copy)
    v11 = v11 or 0;
    local v12 = string.rep(" ", v11);
    for v13, v14 in pairs(v10) do
        if type(v14) == "table" then
            print(v12 .. tostring(v13) .. ":");
            v9(v14, v11 + 4);
        else
            print(v12 .. tostring(v13) .. " = " .. tostring(v14));
        end;
    end;
end;
local function v15(...) --[[ Line: 30 ]] --[[ Name: warn ]]

end;
local function v21(v16) --[[ Line: 36 ]] --[[ Name: getTableType ]]
    if next(v16) == nil then
        return "Empty";
    else
        local v17 = true;
        local v18 = true;
        for v19, _ in next, v16 do
            if typeof(v19) == "number" and v19 % 1 == 0 and v19 > 0 then
                v18 = false;
            else
                v17 = false;
            end;
        end;
        if v17 then
            return "Array";
        elseif v18 then
            return "Dictionary";
        else
            return "Mixed";
        end;
    end;
end;
FillMissingIndexes = function(v22) --[[ Line: 56 ]] --[[ Name: FillMissingIndexes ]]
    local v23 = false;
    local v24 = {};
    for v25, _ in pairs(v22) do
        if type(v25) ~= "number" or v25 % 1 ~= 0 then
            v23 = true;
            break;
        else
            table.insert(v24, v25);
        end;
    end;
    if v23 then
        return v22;
    else
        table.sort(v24);
        local v27 = {};
        for v28, v29 in ipairs(v24) do
            v27[v28] = v22[v29];
        end;
        return v27;
    end;
end;
if v4 == true then
    local function _(v30) --[[ Line: 86 ]] --[[ Name: onInstanceDestroyed ]]
        -- upvalues: v1 (copy), v2 (copy)
        local v31 = v1[v30];
        if v31 then
            v31:Destroy();
            v1[v30] = nil;
            v2[v30] = nil;
        end;
    end;
    local function _(v33, v34) --[[ Line: 95 ]] --[[ Name: scheduleDestroy ]]
        -- upvalues: v2 (copy), v1 (copy)
        if v2[v33] then
            task.cancel(v2[v33]);
        end;
        v2[v33] = task.delay(30, function() --[[ Line: 100 ]]
            -- upvalues: v34 (copy), v1 (ref), v33 (copy), v2 (ref)
            v34:Destroy();
            v1[v33] = nil;
            v2[v33] = nil;
        end);
    end;
    v0.convertToInstance = function(_, v37, v38) --[[ Line: 107 ]] --[[ Name: convertToInstance ]]
        -- upvalues: v1 (copy), l_ReplicatedStorage_0 (copy), v2 (copy), v0 (copy), v21 (copy)
        if v38 == nil then
            v38 = 5;
        end;
        if v37 == nil then
            return "fakeNil";
        elseif typeof(v37) == "Instance" then
            if not v1[v37] then
                if v37:GetAttribute("StreamingObjectValue") then
                    return v37;
                else
                    local l_ObjectValue_0 = Instance.new("ObjectValue");
                    l_ObjectValue_0.Value = v37;
                    if v37:IsA("Model") and v37.PrimaryPart then
                        l_ObjectValue_0:SetAttribute("HasPrimaryPart", true);
                    end;
                    l_ObjectValue_0.Name = v37:GetFullName();
                    l_ObjectValue_0:SetAttribute("StreamingObjectValue", true);
                    l_ObjectValue_0:SetAttribute("Timeout", v38);
                    if #v37:GetDescendants() > 0 then
                        l_ObjectValue_0:SetAttribute("hasDescendants", true);
                    end;
                    l_ObjectValue_0.Parent = l_ReplicatedStorage_0.StreamingEnabledObjectValues;
                    v1[v37] = l_ObjectValue_0;
                    v37.Destroying:Connect(function() --[[ Line: 133 ]]
                        -- upvalues: v37 (copy), v1 (ref), v2 (ref)
                        local l_v37_0 = v37;
                        local v41 = v1[l_v37_0];
                        if v41 then
                            v41:Destroy();
                            v1[l_v37_0] = nil;
                            v2[l_v37_0] = nil;
                        end;
                    end);
                end;
            end;
            local v42 = v1[v37];
            if v2[v37] then
                task.cancel(v2[v37]);
            end;
            v2[v37] = task.delay(30, function() --[[ Line: 100 ]]
                -- upvalues: v42 (copy), v1 (ref), v37 (copy), v2 (ref)
                v42:Destroy();
                v1[v37] = nil;
                v2[v37] = nil;
            end);
            return v1[v37];
        elseif typeof(v37) == "table" then
            if table.find(v37, workspace.Islands) and table.find(v37, workspace.Env) then
                return v37;
            elseif table.find(v37, workspace.Holder.PrimaryPart) then
                return v37;
            else
                local v43 = {};
                for v44, v45 in pairs(v37) do
                    v43[v44] = v0:convertToInstance(v45, v38);
                end;
                if v21(v37) == "Array" then
                    local v46 = 0;
                    for v47, _ in pairs(v37) do
                        v46 = v47;
                    end;
                    for v49 = 1, v46 do
                        if v37[v49] == nil then
                            v37[v49] = "fakeNil";
                        end;
                    end;
                end;
                return v43;
            end;
        else
            return v37;
        end;
    end;
    v0.convertArgs = function(_, v51, v52) --[[ Line: 172 ]] --[[ Name: convertArgs ]]
        -- upvalues: v0 (copy), v21 (copy)
        if typeof(v51) == "Instance" then
            return v0:convertToInstance(v51, v52);
        else
            local v53 = {};
            for v54, v55 in pairs(v51) do
                v53[v54] = v0:convertToInstance(v55, v52);
            end;
            if v21(v53) == "Array" then
                local v56 = 0;
                for v57, _ in pairs(v53) do
                    v56 = v57;
                end;
                for v59 = 1, v56 do
                    if v53[v59] == nil then
                        v53[v59] = "fakeNil";
                    end;
                end;
            end;
            return v53;
        end;
    end;
    return v0;
else
    local v60 = {};
    local function v68(v61) --[[ Line: 200 ]] --[[ Name: waitForValue ]]
        -- upvalues: v60 (copy), v15 (copy), l_Trove_0 (copy), l_GoodSignal_0 (copy)
        local l_v61_Attribute_0 = v61:GetAttribute("Timeout");
        local v63 = tick();
        if v60[v61] then
            v15("object already in queue", v61);
            local _ = tick();
            v60[v61]:Wait();
            if l_v61_Attribute_0 <= tick() - v63 and v61.Value == nil then
                return "TIMED OUT VALUE";
            else
                return v61.Value;
            end;
        elseif v61:GetAttribute("StreamingObjectValue") == nil then
            return v61;
        else
            local v65 = l_Trove_0.new();
            local v66 = l_GoodSignal_0.new();
            local v67 = false;
            v60[v61] = v66;
            v65:Add(task.delay(l_v61_Attribute_0, function() --[[ Line: 226 ]]
                -- upvalues: v67 (ref), v66 (ref)
                v67 = true;
                if v66 then
                    v66:Fire();
                end;
            end));
            v65:Add(v61.Destroying:Connect(function() --[[ Line: 235 ]]
                -- upvalues: v66 (ref)
                if v66 then
                    v66:Fire();
                end;
            end));
            v65:Add(task.defer(function() --[[ Line: 243 ]]
                -- upvalues: v61 (copy), v66 (ref)
                if v61.Value == nil then
                    v61:GetPropertyChangedSignal("Value"):Wait();
                end;
                if v61:GetAttribute("HasPrimaryPart") and v61.Value.PrimaryPart == nil then
                    v61.Value:GetPropertyChangedSignal("PrimaryPart"):Wait();
                end;
                if v61:GetAttribute("hasDescendants") then
                    if #v61.Value:GetDescendants() <= 0 then
                        v61.Value.DescendantAdded:Wait();
                    end;
                    game["Run Service"].RenderStepped:Wait();
                end;
                v66:Fire();
            end));
            v66:Wait();
            v66:Fire();
            v66:DisconnectAll();
            v65:Destroy();
            v65 = nil;
            v60[v61] = nil;
            v66 = nil;
            v15("loaded object", v61);
            if v67 == true then
                return "TIMED OUT VALUE";
            else
                return v61.Value;
            end;
        end;
    end;
    v0.resolveArgs = function(_, v70) --[[ Line: 286 ]] --[[ Name: resolveArgs ]]
        -- upvalues: v15 (copy), v68 (copy), v0 (copy), l_HumanoidRootPart_0 (copy)
        v15("resolving", v70);
        if typeof(v70) == "Instance" then
            local v71 = v68(v70);
            v15("finished revolving", v70);
            return v71;
        elseif typeof(v70) ~= "table" then
            v15("finished revolving", v70);
            return v70;
        else
            local v72 = {};
            for v73, v74 in pairs(v70) do
                if v74 ~= "finishedProcessing" and v73 ~= "finishedProcessing" then
                    if typeof(v74) == "Instance" and v74:IsA("ObjectValue") then
                        v72[v73] = v68(v74);
                    elseif typeof(v74) == "table" then
                        v72[v73] = v0:resolveArgs(v74);
                    elseif v74 == "fakeNil" then
                        v72[v73] = "fakeNil";
                    else
                        v72[v73] = v74;
                    end;
                    if v72[v73] == "TIMED OUT VALUE" then
                        return "TIMED OUT VALUE";
                    end;
                end;
            end;
            for v75, v76 in pairs(v72) do
                if v76 == "fakeNil" then
                    v72[v75] = nil;
                end;
            end;
            local _ = {
                l_HumanoidRootPart_0
            };
            for _, v79 in pairs(v70) do
                if v79 == l_HumanoidRootPart_0 then
                    return (FillMissingIndexes(v72));
                end;
            end;
            return v72;
        end;
    end;
    return v0;
end;