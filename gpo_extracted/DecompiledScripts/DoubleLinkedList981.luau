local v0 = {};
v0.__index = v0;
v0.__meta = "DLL";
local v1 = {};
v1.__index = v1;
v1.new = function(v2, v3, v4) --[[ Line: 11 ]] --[[ Name: new ]]
    -- upvalues: v1 (copy)
    local v5 = setmetatable({}, v1);
    v5.data = v2;
    v5.prev = v4;
    v5.next = v3;
    return v5;
end;
v1.setnext = function(v6, v7) --[[ Line: 21 ]] --[[ Name: setnext ]]
    v6.next = v7;
end;
v1.setprev = function(v8, v9) --[[ Line: 25 ]] --[[ Name: setprev ]]
    v8.prev = v9;
end;
v1.Destroy = function(v10) --[[ Line: 29 ]] --[[ Name: Destroy ]]
    for v11, _ in v10 do
        v10[v11] = nil;
    end;
    setmetatable(v10, nil);
end;
v0.new = function() --[[ Line: 40 ]] --[[ Name: new ]]
    -- upvalues: v0 (copy)
    local v13 = setmetatable({}, v0);
    v13.snode = nil;
    v13.enode = nil;
    v13.count = 0;
    return v13;
end;
v0.IsReal = function(_) --[[ Line: 51 ]] --[[ Name: IsReal ]]

end;
v0.AddStart = function(v15, v16) --[[ Line: 56 ]] --[[ Name: AddStart ]]
    -- upvalues: v1 (copy)
    local l_snode_0 = v15.snode;
    local v18 = v1.new(v16);
    v18:setprev(nil);
    if not l_snode_0 then
        v15.enode = v18;
    else
        l_snode_0:setprev(v18);
    end;
    v18:setnext(l_snode_0);
    v15.snode = v18;
    v15.count = v15.count + 1;
end;
v0.AddEnd = function(v19, v20) --[[ Line: 73 ]] --[[ Name: AddEnd ]]
    -- upvalues: v1 (copy)
    local l_enode_0 = v19.enode;
    local v22 = v1.new(v20);
    v22:setnext(nil);
    if not l_enode_0 then
        v19.snode = v22;
    else
        l_enode_0:setNext(v22);
    end;
    v22:setprev(l_enode_0);
    v19.enode = v22;
    v19.count = v19.count + 1;
end;
v0.AddToStartAndRemoveEndIfEnd = function(v23, v24, v25) --[[ Line: 90 ]] --[[ Name: AddToStartAndRemoveEndIfEnd ]]
    v23:AddStart(v24);
    if v25 < v23.count and v23.enode then
        v23:RemoveNode(v23.enode);
    end;
end;
v0.AddBetweenNodes = function(v26, v27, v28, v29) --[[ Line: 97 ]] --[[ Name: AddBetweenNodes ]]
    -- upvalues: v1 (copy)
    if not v28 or not v29 then
        return false;
    else
        local v30 = v1.new(v27);
        v30:setnext();
        v30:setprev();
        v28:setnext(v30);
        v29:setprev(v30);
        v26.count = v26.count + 1;
        return;
    end;
end;
v0.RemoveNode = function(v31, v32) --[[ Line: 114 ]] --[[ Name: RemoveNode ]]
    local l_prev_0 = v32.prev;
    local l_next_0 = v32.next;
    if v31.snode == v32 then
        v31.snode = l_next_0;
    end;
    if v31.enode == v32 then
        v31.enode = l_prev_0;
    end;
    if l_next_0 then
        l_next_0:setprev(l_prev_0);
    end;
    if l_prev_0 then
        l_prev_0:setnext(l_next_0);
    end;
    v32:setnext(nil);
    v32:setprev(nil);
    v32:Destroy();
    v31.count = v31.count - 1;
end;
v0.Get = function(v35, v36) --[[ Line: 143 ]] --[[ Name: Get ]]
    local v37 = {};
    local l_snode_1 = v35.snode;
    local l_insert_0 = table.insert;
    while l_snode_1 and type(l_snode_1) == "table" do
        if v36 then
            if type(v36) == "function" then
                local l_status_0, l_result_0 = pcall(v36, l_snode_1);
                if l_status_0 and l_result_0 then
                    l_insert_0(v37, l_snode_1);
                end;
            elseif l_snode_1.data == v36 then
                l_insert_0(v37, l_snode_1);
            end;
        else
            l_insert_0(v37, l_snode_1);
        end;
        l_snode_1 = l_snode_1.next;
    end;
    return v37;
end;
v0.GetAsTable = function(v42, v43) --[[ Line: 178 ]] --[[ Name: GetAsTable ]]
    local v44 = {};
    local l_snode_2 = v42.snode;
    local l_insert_1 = table.insert;
    while l_snode_2 and type(l_snode_2) == "table" do
        if v43 then
            if type(v43) == "function" then
                local l_status_1, l_result_1 = pcall(v43, l_snode_2);
                if l_status_1 and l_result_1 then
                    l_insert_1(v44, l_snode_2.data);
                end;
            elseif l_snode_2.data == v43 then
                l_insert_1(v44, l_snode_2.data);
            end;
        else
            l_insert_1(v44, l_snode_2.data);
        end;
        l_snode_2 = l_snode_2.next;
    end;
    return v44;
end;
v0.Destroy = function(v49) --[[ Line: 212 ]] --[[ Name: Destroy ]]
    for v50, _ in v49 do
        v49[v50] = nil;
    end;
    setmetatable(v49, nil);
end;
return v0;