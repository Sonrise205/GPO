local v0 = require(script.Parent.Binding);
local v1 = require(script.Parent.PropMarkers.Children);
local v2 = require(script.Parent.ElementKind);
local v3 = require(script.Parent.SingleEventManager);
local v4 = require(script.Parent.getDefaultInstanceProperty);
local v5 = require(script.Parent.PropMarkers.Ref);
local v6 = require(script.Parent.PropMarkers.Constant);
local v7 = require(script.Parent.Type);
local v8 = require(script.Parent.internalAssert);
local v9 = require(script.Parent.GlobalConfig).get();
local function v10(...) --[[ Line: 33 ]] --[[ Name: identity ]]
    return ...;
end;
local function v13(v11, v12) --[[ Line: 37 ]] --[[ Name: applyRef ]]
    -- upvalues: v7 (copy), v0 (copy)
    if v11 == nil then
        return;
    elseif typeof(v11) == "function" then
        v11(v12);
        return;
    elseif v7.of(v11) == v7.Binding then
        v0.update(v11, v12);
        return;
    else
        error(("Invalid ref: Expected type Binding but got %s"):format((typeof(v11))));
        return;
    end;
end;
local _ = function(v14, v15, v16) --[[ Line: 52 ]] --[[ Name: setRobloxInstanceProperty ]]
    -- upvalues: v4 (copy)
    if v16 == nil then
        local l_ClassName_0 = v14.ClassName;
        local _, v19 = v4(l_ClassName_0, v15);
        v16 = v19;
    end;
    v14[v15] = v16;
end;
local function _(v21, v22) --[[ Line: 65 ]] --[[ Name: removeBinding ]]
    v21.bindings[v22]();
    v21.bindings[v22] = nil;
end;
local function v39(v24, v25, v26) --[[ Line: 71 ]] --[[ Name: attachBinding ]]
    -- upvalues: v6 (copy), v4 (copy), v10 (copy), v0 (copy)
    local function v38(v27) --[[ Line: 72 ]] --[[ Name: updateBoundProperty ]]
        -- upvalues: v6 (ref), v24 (copy), v25 (copy), v4 (ref), v10 (ref)
        if v27 == v6.SkipBindingUpdate then
            return;
        else
            local v34, v35 = xpcall(function() --[[ Line: 77 ]]
                -- upvalues: v24 (ref), v25 (ref), v27 (copy), v4 (ref)
                local l_hostObject_0 = v24.hostObject;
                local l_v25_0 = v25;
                local l_v27_0 = v27;
                if l_v27_0 == nil then
                    local l_ClassName_1 = l_hostObject_0.ClassName;
                    local _, v33 = v4(l_ClassName_1, l_v25_0);
                    l_v27_0 = v33;
                end;
                l_hostObject_0[l_v25_0] = l_v27_0;
            end, v10);
            if not v34 then
                local l_source_0 = v24.currentElement.source;
                if l_source_0 == nil then
                    l_source_0 = "<enable element tracebacks>";
                end;
                local v37 = ("Error updating props:\n\t%s\nIn element:\n%s\n"):format(v35, l_source_0);
                error(v37, 0);
            end;
            return;
        end;
    end;
    if v24.bindings == nil then
        v24.bindings = {};
    end;
    v24.bindings[v25] = v0.subscribe(v26, v38);
    v38(v26:getValue());
end;
local _ = function(v40) --[[ Line: 102 ]] --[[ Name: detachAllBindings ]]
    if v40.bindings ~= nil then
        for _, v42 in pairs(v40.bindings) do
            v42();
        end;
        v40.bindings = nil;
    end;
end;
local function v56(v44, v45, v46, v47) --[[ Line: 111 ]] --[[ Name: applyProp ]]
    -- upvalues: v5 (copy), v1 (copy), v7 (copy), v3 (copy), v39 (copy), v4 (copy)
    if v46 == v47 then
        return;
    elseif v45 == v5 or v45 == v1 then
        return;
    else
        local v48 = v7.of(v45);
        if v48 == v7.HostEvent or v48 == v7.HostChangeEvent then
            if v44.eventManager == nil then
                v44.eventManager = v3.new(v44.hostObject);
            end;
            local l_name_0 = v45.name;
            if v48 == v7.HostChangeEvent then
                v44.eventManager:connectPropertyChange(l_name_0, v46);
                return;
            else
                v44.eventManager:connectEvent(l_name_0, v46);
                return;
            end;
        else
            local v50 = v7.of(v46) == v7.Binding;
            if v7.of(v47) == v7.Binding then
                v44.bindings[v45]();
                v44.bindings[v45] = nil;
            end;
            if v50 then
                v39(v44, v45, v46);
                return;
            else
                local l_hostObject_1 = v44.hostObject;
                local l_v46_0 = v46;
                if l_v46_0 == nil then
                    local l_ClassName_2 = l_hostObject_1.ClassName;
                    local _, v55 = v4(l_ClassName_2, v45);
                    l_v46_0 = v55;
                end;
                l_hostObject_1[v45] = l_v46_0;
                return;
            end;
        end;
    end;
end;
local function v61(v57, v58) --[[ Line: 153 ]] --[[ Name: applyProps ]]
    -- upvalues: v56 (copy)
    for v59, v60 in pairs(v58) do
        v56(v57, v59, v60, nil);
    end;
end;
local function v70(v62, v63, v64) --[[ Line: 159 ]] --[[ Name: updateProps ]]
    -- upvalues: v56 (copy)
    for v65, v66 in pairs(v64) do
        local v67 = v63[v65];
        v56(v62, v65, v66, v67);
    end;
    for v68, v69 in pairs(v63) do
        if v64[v68] == nil then
            v56(v62, v68, nil, v69);
        end;
    end;
end;
return {
    isHostObject = function(v71) --[[ Line: 179 ]] --[[ Name: isHostObject ]]
        return typeof(v71) == "Instance";
    end, 
    mountHostNode = function(v72, v73) --[[ Line: 183 ]] --[[ Name: mountHostNode ]]
        -- upvalues: v9 (copy), v8 (copy), v2 (copy), v61 (copy), v10 (copy), v1 (copy), v13 (copy), v5 (copy)
        local l_currentElement_0 = v73.currentElement;
        local l_hostParent_0 = v73.hostParent;
        local l_hostKey_0 = v73.hostKey;
        if v9.internalTypeChecks then
            v8(v2.of(l_currentElement_0) == v2.Host, "Element at given node is not a host Element");
        end;
        if v9.typeChecks then
            assert(l_currentElement_0.props.Name == nil, "Name can not be specified as a prop to a host component in Roact.");
            assert(l_currentElement_0.props.Parent == nil, "Parent can not be specified as a prop to a host component in Roact.");
        end;
        local v77 = Instance.new(l_currentElement_0.component);
        v73.hostObject = v77;
        local v78, v79 = xpcall(function() --[[ Line: 199 ]]
            -- upvalues: v61 (ref), v73 (copy), l_currentElement_0 (copy)
            v61(v73, l_currentElement_0.props);
        end, v10);
        if not v78 then
            local l_source_1 = l_currentElement_0.source;
            if l_source_1 == nil then
                l_source_1 = "<enable element tracebacks>";
            end;
            local v81 = ("Error applying props:\n\t%s\nIn element:\n%s\n"):format(v79, l_source_1);
            error(v81, 0);
        end;
        v77.Name = tostring(l_hostKey_0);
        local v82 = l_currentElement_0.props[v1];
        if v82 ~= nil then
            v72.updateVirtualNodeWithChildren(v73, v73.hostObject, v82);
        end;
        v77.Parent = l_hostParent_0;
        v73.hostObject = v77;
        v13(l_currentElement_0.props[v5], v77);
        if v73.eventManager ~= nil then
            v73.eventManager:resume();
        end;
    end, 
    unmountHostNode = function(v83, v84) --[[ Line: 232 ]] --[[ Name: unmountHostNode ]]
        -- upvalues: v13 (copy), v5 (copy)
        local l_currentElement_1 = v84.currentElement;
        v13(l_currentElement_1.props[v5], nil);
        for _, v87 in pairs(v84.children) do
            v83.unmountVirtualNode(v87);
        end;
        if v84.bindings ~= nil then
            for _, v89 in pairs(v84.bindings) do
                v89();
            end;
            v84.bindings = nil;
        end;
        v84.hostObject:Destroy();
    end, 
    updateHostNode = function(v90, v91, v92) --[[ Line: 246 ]] --[[ Name: updateHostNode ]]
        -- upvalues: v5 (copy), v13 (copy), v70 (copy), v10 (copy), v1 (copy)
        local l_props_0 = v91.currentElement.props;
        local l_props_1 = v92.props;
        if v91.eventManager ~= nil then
            v91.eventManager:suspend();
        end;
        if l_props_0[v5] ~= l_props_1[v5] then
            v13(l_props_0[v5], nil);
            v13(l_props_1[v5], v91.hostObject);
        end;
        local v95, v96 = xpcall(function() --[[ Line: 260 ]]
            -- upvalues: v70 (ref), v91 (copy), l_props_0 (copy), l_props_1 (copy)
            v70(v91, l_props_0, l_props_1);
        end, v10);
        if not v95 then
            local l_source_2 = v92.source;
            if l_source_2 == nil then
                l_source_2 = "<enable element tracebacks>";
            end;
            local v98 = ("Error updating props:\n\t%s\nIn element:\n%s\n"):format(v96, l_source_2);
            error(v98, 0);
        end;
        local v99 = v92.props[v1];
        if v99 ~= nil or l_props_0[v1] ~= nil then
            v90.updateVirtualNodeWithChildren(v91, v91.hostObject, v99);
        end;
        if v91.eventManager ~= nil then
            v91.eventManager:resume();
        end;
        return v91;
    end
};