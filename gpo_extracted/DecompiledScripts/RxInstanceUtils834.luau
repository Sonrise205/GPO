local v0 = require(script.Parent.loader).load(script);
local v1 = v0("Brio");
local v2 = v0("Maid");
local v3 = v0("Observable");
local v4 = v0("Rx");
local v5 = v0("Symbol").named("unsetValue");
local v61 = {
    observeProperty = function(v6, v7) --[[ Line: 32 ]] --[[ Name: observeProperty ]]
        -- upvalues: v3 (copy), v2 (copy)
        assert(typeof(v6) == "Instance", "'instance' should be of type Instance");
        assert(type(v7) == "string", "'propertyName' should be of type string");
        return v3.new(function(v8) --[[ Line: 36 ]]
            -- upvalues: v2 (ref), v6 (copy), v7 (copy)
            local v9 = v2.new();
            v9:GiveTask(v6:GetPropertyChangedSignal(v7):Connect(function() --[[ Line: 39 ]]
                -- upvalues: v8 (copy), v6 (ref), v7 (ref)
                v8:Fire(v6[v7], v6);
            end));
            v8:Fire(v6[v7], v6);
            return v9;
        end);
    end, 
    observeAncestry = function(v10) --[[ Line: 54 ]] --[[ Name: observeAncestry ]]
        -- upvalues: v4 (copy)
        return v4.start(function() --[[ Line: 55 ]]
            -- upvalues: v10 (copy)
            return v10, v10.Parent;
        end)(v4.fromSignal(v10.AncestryChanged));
    end, 
    observeFirstAncestorBrio = function(v11, v12) --[[ Line: 69 ]] --[[ Name: observeFirstAncestorBrio ]]
        -- upvalues: v3 (copy), v2 (copy), v1 (copy)
        assert(typeof(v11) == "Instance", "Bad instance");
        assert(type(v12) == "string", "Bad className");
        return v3.new(function(v13) --[[ Line: 73 ]]
            -- upvalues: v2 (ref), v11 (copy), v12 (copy), v1 (ref)
            local v14 = v2.new();
            local v15 = nil;
            local function v18() --[[ Line: 77 ]] --[[ Name: handleAncestryChanged ]]
                -- upvalues: v11 (ref), v12 (ref), v15 (ref), v1 (ref), v14 (copy), v13 (copy)
                local l_v11_FirstAncestorWhichIsA_0 = v11:FindFirstAncestorWhichIsA(v12);
                if l_v11_FirstAncestorWhichIsA_0 then
                    if l_v11_FirstAncestorWhichIsA_0 ~= v15 then
                        v15 = l_v11_FirstAncestorWhichIsA_0;
                        local v17 = v1.new(l_v11_FirstAncestorWhichIsA_0);
                        v14._current = v17;
                        v13:Fire(v17);
                        return;
                    end;
                elseif v15 then
                    v14._current = nil;
                    v15 = nil;
                end;
            end;
            v14:GiveTask(v11.AncestryChanged:Connect(v18));
            local l_v11_FirstAncestorWhichIsA_1 = v11:FindFirstAncestorWhichIsA(v12);
            if l_v11_FirstAncestorWhichIsA_1 then
                if l_v11_FirstAncestorWhichIsA_1 ~= v15 then
                    v15 = l_v11_FirstAncestorWhichIsA_1;
                    local v20 = v1.new(l_v11_FirstAncestorWhichIsA_1);
                    v14._current = v20;
                    v13:Fire(v20);
                end;
            elseif v15 then
                v14._current = nil;
                v15 = nil;
            end;
            return v14;
        end);
    end, 
    observePropertyBrio = function(v21, v22, v23) --[[ Line: 108 ]] --[[ Name: observePropertyBrio ]]
        -- upvalues: v3 (copy), v2 (copy), v5 (copy), v1 (copy)
        assert(typeof(v21) == "Instance", "Bad instance");
        assert(type(v22) == "string", "Bad propertyName");
        local v24 = true;
        if type(v23) ~= "function" then
            v24 = v23 == nil;
        end;
        assert(v24, "Bad predicate");
        return v3.new(function(v25) --[[ Line: 113 ]]
            -- upvalues: v2 (ref), v5 (ref), v21 (copy), v22 (copy), v23 (copy), v1 (ref)
            local v26 = v2.new();
            local l_v5_0 = v5;
            local function v30() --[[ Line: 117 ]] --[[ Name: handlePropertyChanged ]]
                -- upvalues: v21 (ref), v22 (ref), l_v5_0 (ref), v23 (ref), v1 (ref), v26 (copy), v25 (copy)
                local v28 = v21[v22];
                if l_v5_0 ~= v28 then
                    l_v5_0 = v28;
                    if not v23 or v23(v28) then
                        local v29 = v1.new(v21[v22]);
                        v26._lastBrio = v29;
                        if v26._lastBrio == v29 then
                            v25:Fire(v29);
                            return;
                        end;
                    else
                        v26._lastBrio = nil;
                    end;
                end;
            end;
            v26:GiveTask(v21:GetPropertyChangedSignal(v22):Connect(v30));
            local v31 = v21[v22];
            if l_v5_0 ~= v31 then
                l_v5_0 = v31;
                if not v23 or v23(v31) then
                    local v32 = v1.new(v21[v22]);
                    v26._lastBrio = v32;
                    if v26._lastBrio == v32 then
                        v25:Fire(v32);
                    end;
                else
                    v26._lastBrio = nil;
                end;
            end;
            return v26;
        end);
    end, 
    observeLastNamedChildBrio = function(v33, v34, v35) --[[ Line: 156 ]] --[[ Name: observeLastNamedChildBrio ]]
        -- upvalues: v3 (copy), v2 (copy), v1 (copy)
        assert(typeof(v33) == "Instance", "Bad parent");
        assert(type(v34) == "string", "Bad className");
        assert(type(v35) == "string", "Bad name");
        return v3.new(function(v36) --[[ Line: 161 ]]
            -- upvalues: v2 (ref), v34 (copy), v35 (copy), v1 (ref), v33 (copy)
            local v37 = v2.new();
            local function v43(v38) --[[ Line: 164 ]] --[[ Name: handleChild ]]
                -- upvalues: v34 (ref), v2 (ref), v35 (ref), v1 (ref), v37 (copy), v36 (copy)
                if not v38:IsA(v34) then
                    return;
                else
                    local v39 = v2.new();
                    local function v41() --[[ Line: 171 ]] --[[ Name: handleNameChanged ]]
                        -- upvalues: v38 (copy), v35 (ref), v1 (ref), v39 (copy), v37 (ref), v36 (ref)
                        if v38.Name == v35 then
                            local v40 = v1.new(v38);
                            v39._brio = v40;
                            v37._lastBrio = v40;
                            v36:Fire(v40);
                            return;
                        else
                            v39._brio = nil;
                            return;
                        end;
                    end;
                    v39:GiveTask(v38:GetPropertyChangedSignal("Name"):Connect(v41));
                    if v38.Name == v35 then
                        local v42 = v1.new(v38);
                        v39._brio = v42;
                        v37._lastBrio = v42;
                        v36:Fire(v42);
                    else
                        v39._brio = nil;
                    end;
                    v37[v38] = v39;
                    return;
                end;
            end;
            v37:GiveTask(v33.ChildAdded:Connect(v43));
            v37:GiveTask(v33.ChildRemoved:Connect(function(v44) --[[ Line: 190 ]]
                -- upvalues: v37 (copy)
                v37[v44] = nil;
            end));
            for _, v46 in pairs(v33:GetChildren()) do
                v43(v46);
            end;
            return v37;
        end);
    end, 
    observeChildrenOfNameBrio = function(v47, v48, v49) --[[ Line: 210 ]] --[[ Name: observeChildrenOfNameBrio ]]
        -- upvalues: v3 (copy), v2 (copy), v1 (copy)
        assert(typeof(v47) == "Instance", "Bad parent");
        assert(type(v48) == "string", "Bad className");
        assert(type(v49) == "string", "Bad name");
        return v3.new(function(v50) --[[ Line: 215 ]]
            -- upvalues: v2 (ref), v48 (copy), v49 (copy), v1 (ref), v47 (copy)
            local v51 = v2.new();
            local function v57(v52) --[[ Line: 218 ]] --[[ Name: handleChild ]]
                -- upvalues: v48 (ref), v2 (ref), v49 (ref), v1 (ref), v50 (copy), v51 (copy)
                if not v52:IsA(v48) then
                    return;
                else
                    local v53 = v2.new();
                    local function v55() --[[ Line: 225 ]] --[[ Name: handleNameChanged ]]
                        -- upvalues: v52 (copy), v49 (ref), v1 (ref), v53 (copy), v50 (ref)
                        if v52.Name == v49 then
                            local v54 = v1.new(v52);
                            v53._brio = v54;
                            v50:Fire(v54);
                            return;
                        else
                            v53._brio = nil;
                            return;
                        end;
                    end;
                    v53:GiveTask(v52:GetPropertyChangedSignal("Name"):Connect(v55));
                    if v52.Name == v49 then
                        local v56 = v1.new(v52);
                        v53._brio = v56;
                        v50:Fire(v56);
                    else
                        v53._brio = nil;
                    end;
                    v51[v52] = v53;
                    return;
                end;
            end;
            v51:GiveTask(v47.ChildAdded:Connect(v57));
            v51:GiveTask(v47.ChildRemoved:Connect(function(v58) --[[ Line: 243 ]]
                -- upvalues: v51 (copy)
                v51[v58] = nil;
            end));
            for _, v60 in pairs(v47:GetChildren()) do
                v57(v60);
            end;
            return v51;
        end);
    end
};
v61.observeChildrenOfClassBrio = function(v62, v63) --[[ Line: 262 ]] --[[ Name: observeChildrenOfClassBrio ]]
    -- upvalues: v61 (copy)
    assert(typeof(v62) == "Instance", "Bad parent");
    assert(type(v63) == "string", "Bad className");
    return v61.observeChildrenBrio(v62, function(v64) --[[ Line: 266 ]]
        -- upvalues: v63 (copy)
        return v64:IsA(v63);
    end);
end;
v61.observeChildrenBrio = function(v65, v66) --[[ Line: 278 ]] --[[ Name: observeChildrenBrio ]]
    -- upvalues: v3 (copy), v2 (copy), v1 (copy)
    assert(typeof(v65) == "Instance", "Bad parent");
    local v67 = true;
    if type(v66) ~= "function" then
        v67 = v66 == nil;
    end;
    assert(v67, "Bad predicate");
    return v3.new(function(v68) --[[ Line: 282 ]]
        -- upvalues: v2 (ref), v66 (copy), v1 (ref), v65 (copy)
        local v69 = v2.new();
        local function v72(v70) --[[ Line: 285 ]] --[[ Name: handleChild ]]
            -- upvalues: v66 (ref), v1 (ref), v69 (copy), v68 (copy)
            if not v66 or v66(v70) then
                local v71 = v1.new(v70);
                v69[v70] = v71;
                v68:Fire(v71);
            end;
        end;
        v69:GiveTask(v65.ChildAdded:Connect(v72));
        v69:GiveTask(v65.ChildRemoved:Connect(function(v73) --[[ Line: 294 ]]
            -- upvalues: v69 (copy)
            v69[v73] = nil;
        end));
        for _, v75 in pairs(v65:GetChildren()) do
            if not v66 or v66(v75) then
                local v76 = v1.new(v75);
                v69[v75] = v76;
                v68:Fire(v76);
            end;
        end;
        return v69;
    end);
end;
v61.observeDescendants = function(v77, v78) --[[ Line: 313 ]] --[[ Name: observeDescendants ]]
    -- upvalues: v3 (copy), v2 (copy)
    assert(typeof(v77) == "Instance", "Bad parent");
    local v79 = true;
    if type(v78) ~= "function" then
        v79 = v78 == nil;
    end;
    assert(v79, "Bad predicate");
    return v3.new(function(v80) --[[ Line: 317 ]]
        -- upvalues: v2 (ref), v78 (copy), v77 (copy)
        local v81 = v2.new();
        local v82 = {};
        local function v84(v83) --[[ Line: 321 ]] --[[ Name: handleDescendant ]]
            -- upvalues: v78 (ref), v82 (copy), v80 (copy)
            if not v78 or v78(v83) then
                v82[v83] = true;
                v80:Fire(v83, true);
            end;
        end;
        v81:GiveTask(v77.DescendantAdded:Connect(v84));
        v81:GiveTask(v77.DescendantRemoving:Connect(function(v85) --[[ Line: 329 ]]
            -- upvalues: v82 (copy), v80 (copy)
            if v82[v85] then
                v82[v85] = nil;
                v80:Fire(v85, false);
            end;
        end));
        for _, v87 in pairs(v77:GetDescendants()) do
            if not v78 or v78(v87) then
                v82[v87] = true;
                v80:Fire(v87, true);
            end;
        end;
        return v81;
    end);
end;
return v61;