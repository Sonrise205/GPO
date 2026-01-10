--!native
local v0 = {};
local l_RunService_0 = game:GetService("RunService");
local l_Players_0 = game:GetService("Players");
local l_Util_0 = script.Parent.Parent.Util;
local _ = require(script.Parent.Parent.Type);
local v5 = require(script.Parent.Parent.Event);
local v6 = require(l_Util_0.Spawn);
local v7 = require(l_Util_0.Key);
local v8 = require(l_Util_0.RateLimit);
local v9 = require(l_Util_0.Buffer);
local v10 = {};
local v11 = {};
local v12 = {};
local v13 = {};
local v14 = {};
local v15 = {};
local v16 = {};
local v17 = {};
v16[1] = {};
v16[2] = {};
v17[1] = {};
v17[2] = {};
local l_Reliable_0 = v5.Reliable;
local l_Unreliable_0 = v5.Unreliable;
local l_Request_0 = v5.Request;
v8.Protect();
local function v23(v21) --[[ Line: 54 ]] --[[ Name: initializeEachPlayer ]]
    -- upvalues: v15 (copy), v14 (copy), v13 (copy), v17 (copy), v16 (copy)
    if not v21 then
        return;
    else
        if not v15[v21] then
            v15[v21] = {};
        end;
        for v22 in v14 do
            if v21 then
                if not v15[v21][v22] then
                    v15[v21][v22] = {};
                end;
                if not v13[v22] then
                    v13[v22] = {};
                end;
                if not v13[v22][v21] then
                    v13[v22][v21] = {};
                end;
                if not v17[1][v22] then
                    v17[1][v22] = {};
                end;
                if not v17[2][v22] then
                    v17[2][v22] = {};
                end;
                if not v16[1][v22][v21] then
                    v16[1][v22][v21] = {};
                    v16[2][v22][v21] = {};
                end;
                if not v17[1][v22][v21] then
                    v17[1][v22][v21] = {};
                    v17[2][v22][v21] = {};
                end;
            else
                break;
            end;
        end;
        return;
    end;
end;
l_Players_0.PlayerAdded:Connect(v23);
l_Players_0.PlayerRemoving:Connect(function(v24) --[[ Line: 88 ]]
    -- upvalues: v15 (copy), v10 (copy), v11 (copy), v13 (copy), v16 (copy), v17 (copy)
    if not v24 then
        return;
    else
        if v15[v24] then
            v15[v24] = nil;
        end;
        for _, v26 in {
            v10, 
            v11, 
            v13
        } do
            for v27 in v26 do
                v26[v27][v24] = nil;
            end;
        end;
        for v28 = 1, 2 do
            for v29 in v16[v28] do
                if v16[v28][v29][v24] then
                    v16[v28][v29][v24] = nil;
                end;
            end;
            for v30 in v17[v28] do
                if v17[v28][v30][v24] then
                    v17[v28][v30][v24] = nil;
                end;
            end;
        end;
        return;
    end;
end);
v0.insertQueue = function(v31, v32, v33, ...) --[[ Line: 112 ]] --[[ Name: insertQueue ]]
    -- upvalues: v11 (copy), v10 (copy)
    if not v32 then
        if not v11[v31] then
            v11[v31] = {};
        end;
        if not v11[v31][v33] then
            v11[v31][v33] = {};
        end;
        table.insert(v11[v31][v33], {
            ...
        });
        return;
    else
        if not v10[v31] then
            v10[v31] = {};
        end;
        if not v10[v31][v33] then
            v10[v31][v33] = {};
        end;
        table.insert(v10[v31][v33], {
            ...
        });
        return;
    end;
end;
v0.insertRequest = function(v34, v35, v36, ...) --[[ Line: 132 ]] --[[ Name: insertRequest ]]
    -- upvalues: v13 (copy), v7 (copy)
    if not v13[v34] then
        v13[v34] = {};
    end;
    if not v13[v34][v36] then
        v13[v34][v36] = {};
    end;
    local v37 = coroutine.running();
    local v38 = os.clock();
    local v39 = task.delay(v35, function() --[[ Line: 140 ]]
        -- upvalues: v37 (copy)
        task.spawn(v37, nil);
    end);
    table.insert(v13[v34][v36], {
        tostring(v7()), 
        function(...) --[[ Line: 143 ]]
            -- upvalues: v38 (copy), v35 (copy), v39 (copy), v37 (copy)
            if os.clock() - v38 > v35 then
                return;
            else
                task.cancel(v39);
                task.spawn(v37, ...);
                return;
            end;
        end, 
        {
            ...
        }
    });
    return coroutine.yield();
end;
v0.add = function(v40, v41, v42) --[[ Line: 151 ]] --[[ Name: add ]]
    -- upvalues: v14 (copy), v8 (copy), v10 (copy), v13 (copy), v12 (copy), v11 (copy), v16 (copy), v17 (copy), l_Players_0 (copy), v23 (copy)
    if not v14[v40] then
        v14[v40] = true;
        v8.create(v41, v42.rateLimit and v42.rateLimit.maxEntrance or 200, v42.rateLimit and v42.rateLimit.interval or 2);
        if not v10[v40] then
            v10[v40] = {};
        end;
        if not v13[v40] then
            v13[v40] = {};
        end;
        if not v12[v40] then
            v12[v40] = {};
        end;
        if not v11[v40] then
            v11[v40] = {};
        end;
        if not v16[1][v40] then
            v16[1][v40] = {};
        end;
        if not v16[2][v40] then
            v16[2][v40] = {};
        end;
        if not v17[1][v40] then
            v17[1][v40] = {};
        end;
        if not v17[2][v40] then
            v17[2][v40] = {};
        end;
        for _, v44 in ipairs(l_Players_0:GetPlayers()) do
            task.spawn(v23, v44);
        end;
    end;
end;
v0.remove = function(v45) --[[ Line: 189 ]] --[[ Name: remove ]]
    -- upvalues: v14 (copy), v10 (copy), v13 (copy), v12 (copy), v11 (copy), v16 (copy), v17 (copy)
    if not v14[v45] then
        return;
    else
        v14[v45] = nil;
        v10[v45] = nil;
        v13[v45] = nil;
        v12[v45] = nil;
        v11[v45] = nil;
        v16[1][v45] = nil;
        v16[2][v45] = nil;
        v17[1][v45] = nil;
        v17[2][v45] = nil;
        return;
    end;
end;
v0.addCallback = function(v46, v47, v48) --[[ Line: 202 ]] --[[ Name: addCallback ]]
    -- upvalues: v12 (copy)
    v12[v46][v47] = v48;
end;
v0.removeCallback = function(v49, v50) --[[ Line: 206 ]] --[[ Name: removeCallback ]]
    -- upvalues: v12 (copy)
    v12[v49][v50] = nil;
end;
v0.start = function() --[[ Line: 210 ]] --[[ Name: start ]]
    -- upvalues: l_RunService_0 (copy), v11 (copy), l_Unreliable_0 (copy), v9 (copy), v10 (copy), v15 (copy), l_Reliable_0 (copy), v17 (copy), l_Request_0 (copy), v14 (copy), v13 (copy), v12 (copy), v16 (copy), v6 (copy)
    debug.setmemorycategory("Warp");
    l_RunService_0.PostSimulation:Connect(function() --[[ Line: 212 ]]
        -- upvalues: v11 (ref), l_Unreliable_0 (ref), v9 (ref), v10 (ref), v15 (ref), l_Reliable_0 (ref), v17 (ref), l_Request_0 (ref), v14 (ref), v13 (ref), v12 (ref), v16 (ref), v6 (ref)
        for v51, v52 in v11 do
            for v53, v54 in v52 do
                if #v54 ~= 0 then
                    for _, v56 in v54 do
                        l_Unreliable_0:FireClient(v53, v9.revert(v51), v9.write(v56));
                    end;
                    v11[v51][v53] = nil;
                end;
            end;
            v11[v51] = nil;
        end;
        for v57, v58 in v10 do
            for v59, v60 in v58 do
                if #v60 > 0 and v15[v59] then
                    for _, v62 in v60 do
                        l_Reliable_0:FireClient(v59, v9.revert(v57), v9.write(v62));
                    end;
                end;
                v10[v57][v59] = nil;
            end;
            v10[v57] = nil;
        end;
        for v63, v64 in v17[1] do
            for v65, v66 in v64 do
                if #v66 > 0 then
                    l_Request_0:FireClient(v65, v9.revert(v63), "\001", v66);
                end;
                v17[1][v63][v65] = nil;
            end;
            v17[1][v63] = nil;
        end;
        for v67, v68 in v17[2] do
            for v69, v70 in v68 do
                if #v70 > 0 then
                    l_Request_0:FireClient(v69, v9.revert(v67), "\000", v70);
                end;
                v17[2][v67][v69] = nil;
            end;
            v17[2][v67] = nil;
        end;
        for v71 in v14 do
            if v13[v71] then
                for v72, v73 in v13[v71] do
                    if #v73 == 0 then
                        v13[v71][v72] = nil;
                    else
                        for _, v75 in v73 do
                            if v75[3] then
                                if not v17[1][v71] then
                                    v17[1][v71] = {};
                                end;
                                if not v17[1][v71][v72] then
                                    v17[1][v71][v72] = {};
                                end;
                                table.insert(v17[1][v71][v72], {
                                    v75[1], 
                                    v75[3]
                                });
                                v75[3] = nil;
                            end;
                        end;
                    end;
                end;
            end;
            local v76 = v12[v71] or nil;
            if v76 then
                for v77, v78 in v16[1][v71] do
                    if v76 then
                        for _, v80 in v78 do
                            if v76 then
                                if #v80 ~= 0 then
                                    for _, v82 in v76 do
                                        for v83 = 1, #v80 do
                                            if v80[v83] then
                                                local v84 = v80[v83][1];
                                                local v85 = v80[v83][2];
                                                do
                                                    local l_v84_0, l_v85_0 = v84, v85;
                                                    v6(function() --[[ Line: 289 ]]
                                                        -- upvalues: v82 (copy), v77 (copy), l_v85_0 (ref), v17 (ref), v71 (copy), l_v84_0 (ref)
                                                        local v88 = {
                                                            v82(v77, table.unpack(l_v85_0))
                                                        };
                                                        if not v17[2][v71] then
                                                            v17[2][v71] = {};
                                                        end;
                                                        if not v17[2][v71][v77] then
                                                            v17[2][v71][v77] = {};
                                                        end;
                                                        table.insert(v17[2][v71][v77], {
                                                            l_v84_0, 
                                                            v88
                                                        });
                                                        l_v84_0 = nil;
                                                        l_v85_0 = nil;
                                                    end);
                                                end;
                                            end;
                                        end;
                                    end;
                                end;
                            else
                                break;
                            end;
                        end;
                        v16[1][v71][v77] = nil;
                    else
                        break;
                    end;
                end;
                for v89, v90 in v16[2][v71] do
                    if v76 then
                        for _, v92 in v90 do
                            for _, v94 in v92 do
                                if v76 then
                                    if #v94 ~= 1 then
                                        local v95 = v13[v71][v89];
                                        for v96 = 1, #v95 do
                                            local v97 = v95[v96];
                                            if v97 and v97[1] == v94[1] then
                                                v6(v97[2], table.unpack(v94[2]));
                                                table.remove(v95, v96);
                                                break;
                                            end;
                                        end;
                                    end;
                                else
                                    break;
                                end;
                            end;
                        end;
                        v16[2][v71][v89] = nil;
                    else
                        break;
                    end;
                end;
            end;
        end;
    end);
    local function v106(v98, v99, v100, v101) --[[ Line: 330 ]] --[[ Name: onServerNetworkReceive ]]
        -- upvalues: v9 (ref), v14 (ref), v12 (ref), v6 (ref)
        if not v99 or typeof(v99) ~= "buffer" or not v100 or typeof(v100) ~= "buffer" then
            return;
        else
            v99 = v9.convert(v99);
            if not v14[v99] then
                return;
            else
                local v102 = v9.read(v100, v101);
                if not v102 then
                    return;
                else
                    local v103 = v12[v99];
                    if not v103 then
                        return;
                    else
                        for _, v105 in v103 do
                            v6(v105, v98, table.unpack(v102));
                        end;
                        return;
                    end;
                end;
            end;
        end;
    end;
    l_Reliable_0.OnServerEvent:Connect(v106);
    l_Unreliable_0.OnServerEvent:Connect(v106);
    l_Request_0.OnServerEvent:Connect(function(v107, v108, v109, v110) --[[ Line: 344 ]]
        -- upvalues: v9 (ref), v16 (ref), v10 (ref)
        if not v108 or not v110 then
            return;
        else
            v108 = v9.convert(v108);
            if not v16[1][v108][v107] then
                v16[1][v108][v107] = {};
            end;
            if not v16[2][v108][v107] then
                v16[2][v108][v107] = {};
            end;
            if not v10[v108] then
                v10[v108] = {};
            end;
            if not v10[v108][v107] then
                v10[v108][v107] = {};
            end;
            if v109 == "\001" then
                table.insert(v16[1][v108][v107], v110);
                return;
            else
                table.insert(v16[2][v108][v107], v110);
                return;
            end;
        end;
    end);
end;
for _, v112 in ipairs(l_Players_0:GetPlayers()) do
    task.spawn(v23, v112);
end;
return v0;