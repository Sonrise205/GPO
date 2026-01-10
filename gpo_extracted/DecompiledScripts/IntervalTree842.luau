local l_HttpService_0 = game:GetService("HttpService");
local v1 = {};
v1.__index = v1;
local v2 = {};
v2.__index = v2;
v1.new = function(v3, v4, v5, v6, v7, v8) --[[ Line: 83 ]] --[[ Name: new ]]
    -- upvalues: v1 (copy)
    return (setmetatable({
        uid = game:GetService("HttpService"):GenerateGUID(false), 
        minX = v3, 
        maxX = v4, 
        minZ = v5, 
        maxXZ = math.max(v3, v4, v5, v6), 
        right = nil, 
        left = nil, 
        maxZ = v6, 
        data = v7, 
        priority = v8
    }, v1));
end;
v1.UpdateMaxXZ = function(v9) --[[ Line: 102 ]] --[[ Name: UpdateMaxXZ ]]
    local v10 = math.max(v9.minX, v9.maxX, v9.minZ, v9.maxZ);
    if v9.left then
        v10 = math.max(v10, v9.left.maxXZ);
    end;
    if v9.right then
        v10 = math.max(v10, v9.right.maxXZ);
    end;
    v9.maxXZ = v10;
    return v9.maxXZ;
end;
v2.new = function() --[[ Line: 116 ]] --[[ Name: new ]]
    -- upvalues: v2 (copy)
    return (setmetatable({
        root = nil
    }, v2));
end;
v2.Insert = function(v11, v12, v13, v14, v15, v16, v17) --[[ Line: 132 ]] --[[ Name: Insert ]]
    local v18 = v11:_InsertRecursive(v11.root, v12, v13, v14, v15, v16, v17);
    v11.root = v18;
    return v18.uid;
end;
v2._InsertRecursive = function(v19, v20, v21, v22, v23, v24, v25, v26) --[[ Line: 147 ]] --[[ Name: _InsertRecursive ]]
    -- upvalues: v1 (copy)
    if not v20 then
        return v1.new(v21, v22, v23, v24, v25, v26);
    else
        if v21 < v20.minX then
            v20.left = v19:_InsertRecursive(v20.left, v21, v22, v23, v24, v25, v26);
        else
            v20.right = v19:_InsertRecursive(v20.right, v21, v22, v23, v24, v25, v26);
        end;
        v20:UpdateMaxXZ();
        local v27 = v19:_Rebalance(v20);
        if v27 then
            return v27;
        else
            return v20;
        end;
    end;
end;
v2.Search = function(v28, v29, v30, v31) --[[ Line: 171 ]] --[[ Name: Search ]]
    local v32, _ = v28:_SearchRecursive(v28.root, v29, v30, {}, -1e999, v31);
    return v32;
end;
v2._SearchRecursive = function(v34, v35, v36, v37, v38, v39, v40) --[[ Line: 183 ]] --[[ Name: _SearchRecursive ]]
    if not v35 then
        return v38, v39;
    else
        if v35.minX <= v36 and v36 <= v35.maxX and v35.minZ <= v37 and v37 <= v35.maxZ then
            if v39 < v35.priority then
                v38 = if v40 then {
                    {
                        uid = v35.uid, 
                        data = v35.data
                    }
                } else {
                    v35.data
                };
                v39 = v35.priority;
            elseif v35.priority == v39 then
                if v40 then
                    table.insert(v38, {
                        uid = v35.uid, 
                        data = v35.data
                    });
                else
                    table.insert(v38, v35.data);
                end;
            end;
        end;
        if v35.left and v36 <= v35.left.maxXZ then
            local v41, v42 = v34:_SearchRecursive(v35.left, v36, v37, v38, v39);
            v38 = v41;
            v39 = v42;
        end;
        if v35.right and v35.minX <= v36 then
            local v43, v44 = v34:_SearchRecursive(v35.right, v36, v37, v38, v39);
            v38 = v43;
            v39 = v44;
        end;
        return v38, v39;
    end;
end;
v2.Remove = function(v45, v46) --[[ Line: 219 ]] --[[ Name: Remove ]]
    local _ = nil;
    local v48, v49 = v45:_RemoveRecursive(v45.root, v46);
    v45.root = v48;
    return v49;
end;
v2._RemoveRecursive = function(v50, v51, v52) --[[ Line: 229 ]] --[[ Name: _RemoveRecursive ]]
    if not v51 then
        return nil, false;
    elseif v51.uid == v52 then
        if not v51.left then
            return v51.right, true;
        elseif not v51.right then
            return v51.left, true;
        else
            local v53 = v50:_FindMin(v51.right);
            v51.uid = v53.uid;
            v51.minX = v53.minX;
            v51.maxX = v53.maxX;
            v51.minZ = v53.minZ;
            v51.maxZ = v53.maxZ;
            v51.data = v53.data;
            v51.priority = v53.priority;
            v51.right = v50:_RemoveRecursive(v51.right, v53.uid);
            v51:UpdateMaxXZ();
            return v51, true;
        end;
    else
        local v54 = nil;
        local v55, v56 = v50:_RemoveRecursive(v51.left, v52);
        v51.left = v55;
        v54 = v56;
        if not v54 then
            v55, v56 = v50:_RemoveRecursive(v51.right, v52);
            v51.right = v55;
            v54 = v56;
        end;
        if v54 then
            v51:UpdateMaxXZ();
        end;
        return v51, v54;
    end;
end;
v2._FindMin = function(_, v58) --[[ Line: 269 ]] --[[ Name: _FindMin ]]
    while v58.left do
        v58 = v58.left;
    end;
    return v58;
end;
v2.Update = function(v59, v60, v61, v62, v63, v64, v65, v66) --[[ Line: 285 ]] --[[ Name: Update ]]
    local v67 = false;
    local v68, v69 = v59:_UpdateRecursive(v59.root, v60, v61, v62, v63, v64, v65, v66);
    v59.root = v68;
    v67 = v69;
    if v67 then
        v68 = v59:_Rebalance(v59.root);
        if v68 then
            v59.root = v68;
        end;
    end;
    return v67;
end;
v2._UpdateRecursive = function(v70, v71, v72, v73, v74, v75, v76, v77, v78) --[[ Line: 307 ]] --[[ Name: _UpdateRecursive ]]
    if not v71 then
        return nil, false;
    elseif v71.uid == v72 then
        v71.minX = v73;
        v71.maxX = v74;
        v71.minZ = v75;
        v71.maxZ = v76;
        v71.data = v77;
        v71.priority = v78;
        v71:UpdateMaxXZ();
        return v71, true;
    else
        local v79 = nil;
        local v80, v81 = v70:_UpdateRecursive(v71.left, v72, v73, v74, v75, v76, v77, v78);
        v71.left = v80;
        v79 = v81;
        if not v79 then
            v80, v81 = v70:_UpdateRecursive(v71.right, v72, v73, v74, v75, v76, v77, v78);
            v71.right = v80;
            v79 = v81;
        end;
        if v79 then
            v71:UpdateMaxXZ();
        end;
        return v71, v79;
    end;
end;
v2._Rebalance = function(v82, v83) --[[ Line: 339 ]] --[[ Name: _Rebalance ]]
    if not v83 then
        return nil;
    else
        local v84 = v82:_GetBalance(v83);
        if v84 > 1 then
            if v83.left and v82:_GetBalance(v83.left) < 0 then
                v83.left = v82:_RotateLeft(v83.left);
            end;
            if v83.left then
                return v82:_RotateRight(v83);
            else
                return v83;
            end;
        elseif v84 < -1 then
            if v83.right and v82:_GetBalance(v83.right) > 0 then
                v83.right = v82:_RotateRight(v83.right);
            end;
            if v83.right then
                return v82:_RotateLeft(v83);
            else
                return v83;
            end;
        else
            return v83;
        end;
    end;
end;
v2._GetBalance = function(v85, v86) --[[ Line: 372 ]] --[[ Name: _GetBalance ]]
    if not v86 then
        return 0;
    else
        return v85:_GetHeight(v86.left) - v85:_GetHeight(v86.right);
    end;
end;
v2._GetHeight = function(v87, v88) --[[ Line: 382 ]] --[[ Name: _GetHeight ]]
    if not v88 then
        return 0;
    else
        return math.max(v87:_GetHeight(v88.left), v87:_GetHeight(v88.right)) + 1;
    end;
end;
v2._RotateLeft = function(_, v90) --[[ Line: 392 ]] --[[ Name: _RotateLeft ]]
    local l_right_0 = v90.right;
    if not l_right_0 then
        return v90;
    else
        local l_left_0 = l_right_0.left;
        l_right_0.left = v90;
        v90.right = l_left_0;
        v90:UpdateMaxXZ();
        l_right_0:UpdateMaxXZ();
        return l_right_0;
    end;
end;
v2._RotateRight = function(_, v94) --[[ Line: 411 ]] --[[ Name: _RotateRight ]]
    local l_left_1 = v94.left;
    if not l_left_1 then
        return v94;
    else
        local l_right_1 = l_left_1.right;
        l_left_1.right = v94;
        v94.left = l_right_1;
        v94:UpdateMaxXZ();
        l_left_1:UpdateMaxXZ();
        return l_left_1;
    end;
end;
v2.Serialize = function(v97) --[[ Line: 429 ]] --[[ Name: Serialize ]]
    -- upvalues: l_HttpService_0 (copy)
    local function v98(v99) --[[ Line: 430 ]] --[[ Name: serializeValue ]]
        -- upvalues: v98 (copy)
        if typeof(v99) == "Vector3" then
            return {
                __type = "Vector3", 
                x = v99.X, 
                y = v99.Y, 
                z = v99.Z
            };
        elseif typeof(v99) == "table" then
            local v100 = {};
            for v101, v102 in pairs(v99) do
                v100[v101] = v98(v102);
            end;
            return v100;
        else
            return v99;
        end;
    end;
    local function v103(v104) --[[ Line: 444 ]] --[[ Name: serializeNode ]]
        -- upvalues: v98 (copy), v103 (copy)
        if not v104 then
            return nil;
        else
            return {
                uid = v104.uid, 
                minX = v104.minX, 
                maxX = v104.maxX, 
                minZ = v104.minZ, 
                maxZ = v104.maxZ, 
                priority = v104.priority, 
                data = v98(v104.data), 
                left = v103(v104.left), 
                right = v103(v104.right)
            };
        end;
    end;
    local v105 = v103(v97.root);
    return l_HttpService_0:JSONEncode(v105);
end;
v2.Deserialize = function(v106) --[[ Line: 465 ]] --[[ Name: Deserialize ]]
    -- upvalues: l_HttpService_0 (copy), v1 (copy), v2 (copy)
    local v107 = l_HttpService_0:JSONDecode(v106);
    local function v108(v109) --[[ Line: 468 ]] --[[ Name: deserializeValue ]]
        -- upvalues: v108 (copy)
        if typeof(v109) == "table" and v109.__type == "Vector3" then
            return (Vector3.new(v109.x, v109.y, v109.z));
        elseif typeof(v109) == "table" then
            local v110 = {};
            for v111, v112 in pairs(v109) do
                v110[v111] = v108(v112);
            end;
            return v110;
        else
            return v109;
        end;
    end;
    local function v113(v114) --[[ Line: 482 ]] --[[ Name: deserializeNode ]]
        -- upvalues: v108 (copy), v113 (copy), v1 (ref)
        if not v114 then
            return nil;
        else
            local v115 = setmetatable({
                uid = v114.uid, 
                minX = tonumber(v114.minX), 
                maxX = tonumber(v114.maxX), 
                minZ = tonumber(v114.minZ), 
                maxZ = tonumber(v114.maxZ), 
                priority = tonumber(v114.priority), 
                data = v108(v114.data), 
                left = v113(v114.left), 
                right = v113(v114.right)
            }, v1);
            v115:UpdateMaxXZ();
            return v115;
        end;
    end;
    local v116 = v2.new();
    v116.root = v113(v107);
    return v116;
end;
return table.freeze(v2);