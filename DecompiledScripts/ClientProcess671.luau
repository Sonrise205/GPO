--!native
local v0 = {};
local l_RunService_0 = game:GetService("RunService");
local l_Util_0 = script.Parent.Parent.Util;
local _ = require(script.Parent.Parent.Type);
local v4 = require(script.Parent.Parent.Event);
local v5 = require(l_Util_0.Spawn);
local v6 = require(l_Util_0.Key);
local v7 = require(l_Util_0.RateLimit);
local v8 = require(l_Util_0.Buffer);
local v9 = {};
local v10 = {};
local v11 = {};
local v12 = {};
local v13 = {};
local v14 = {};
local v15 = {};
local v16 = {};
v15[1] = {};
v15[2] = {};
v16[1] = {};
v16[2] = {};
local l_Reliable_0 = v4.Reliable;
local l_Unreliable_0 = v4.Unreliable;
local l_Request_0 = v4.Request;
v0.insertQueue = function(v20, v21, ...) --[[ Line: 47 ]] --[[ Name: insertQueue ]]
    -- upvalues: v11 (copy), v10 (copy)
    if not v21 then
        if not v11[v20] then
            v11[v20] = {};
        end;
        table.insert(v11[v20], {
            ...
        });
        return;
    else
        if not v10[v20] then
            v10[v20] = {};
        end;
        table.insert(v10[v20], {
            ...
        });
        return;
    end;
end;
v0.insertRequest = function(v22, v23, ...) --[[ Line: 61 ]] --[[ Name: insertRequest ]]
    -- upvalues: v13 (copy), v6 (copy)
    if not v13[v22] then
        v13[v22] = {};
    end;
    local v24 = coroutine.running();
    local v25 = os.clock();
    local v26 = task.delay(v23, function() --[[ Line: 66 ]]
        -- upvalues: v24 (copy)
        task.spawn(v24, nil);
    end);
    table.insert(v13[v22], {
        tostring(v6()), 
        function(...) --[[ Line: 69 ]]
            -- upvalues: v25 (copy), v23 (copy), v26 (copy), v24 (copy)
            if os.clock() - v25 > v23 then
                return;
            else
                task.cancel(v26);
                task.spawn(v24, ...);
                return;
            end;
        end, 
        {
            ...
        }
    });
    return coroutine.yield();
end;
v0.add = function(v27, v28, _) --[[ Line: 77 ]] --[[ Name: add ]]
    -- upvalues: v14 (copy), v9 (copy), v7 (copy), v10 (copy), v11 (copy), v13 (copy), v12 (copy), v16 (copy), v15 (copy)
    if not v14[v27] then
        v14[v27] = true;
        if not v9[v27] then
            v9[v27] = v7.create(v28);
        end;
        if not v10[v27] then
            v10[v27] = {};
        end;
        if not v11[v27] then
            v11[v27] = {};
        end;
        if not v13[v27] then
            v13[v27] = {};
        end;
        if not v12[v27] then
            v12[v27] = {};
        end;
        if not v16[1][v27] then
            v16[1][v27] = {};
        end;
        if not v16[2][v27] then
            v16[2][v27] = {};
        end;
        if not v15[1][v27] then
            v15[1][v27] = {};
        end;
        if not v15[2][v27] then
            v15[2][v27] = {};
        end;
    end;
end;
v0.remove = function(v30) --[[ Line: 112 ]] --[[ Name: remove ]]
    -- upvalues: v14 (copy), v10 (copy), v11 (copy), v13 (copy), v12 (copy), v9 (copy), v16 (copy), v15 (copy)
    if not v14[v30] then
        return;
    else
        v14[v30] = nil;
        v10[v30] = nil;
        v11[v30] = nil;
        v13[v30] = nil;
        v12[v30] = nil;
        v9[v30] = nil;
        v16[1][v30] = nil;
        v16[2][v30] = nil;
        v15[1][v30] = nil;
        v15[2][v30] = nil;
        return;
    end;
end;
v0.addCallback = function(v31, v32, v33) --[[ Line: 126 ]] --[[ Name: addCallback ]]
    -- upvalues: v12 (copy)
    v12[v31][v32] = v33;
end;
v0.removeCallback = function(v34, v35) --[[ Line: 130 ]] --[[ Name: removeCallback ]]
    -- upvalues: v12 (copy)
    v12[v34][v35] = nil;
end;
v0.start = function() --[[ Line: 134 ]] --[[ Name: start ]]
    -- upvalues: l_RunService_0 (copy), v11 (copy), v9 (copy), l_Unreliable_0 (copy), v8 (copy), v10 (copy), l_Reliable_0 (copy), v16 (copy), l_Request_0 (copy), v14 (copy), v13 (copy), v12 (copy), v15 (copy), v5 (copy)
    debug.setmemorycategory("Warp");
    l_RunService_0.PostSimulation:Connect(function() --[[ Line: 136 ]]
        -- upvalues: v11 (ref), v9 (ref), l_Unreliable_0 (ref), v8 (ref), v10 (ref), l_Reliable_0 (ref), v16 (ref), l_Request_0 (ref), v14 (ref), v13 (ref), v12 (ref), v15 (ref), v5 (ref)
        for v36, v37 in v11 do
            if #v37 ~= 0 then
                if v9[v36](#v37) then
                    for _, v39 in v37 do
                        l_Unreliable_0:FireServer(v8.revert(v36), v8.write(v39));
                    end;
                end;
                v11[v36] = nil;
            end;
        end;
        for v40, v41 in v10 do
            if #v41 > 0 then
                if v9[v40](#v41) then
                    for _, v43 in v41 do
                        l_Reliable_0:FireServer(v8.revert(v40), v8.write(v43));
                    end;
                end;
                v10[v40] = nil;
            end;
        end;
        for v44, v45 in v16[1] do
            if #v45 ~= 0 then
                l_Request_0:FireServer(v8.revert(v44), "\001", v45);
                v16[1][v44] = nil;
            end;
        end;
        for v46, v47 in v16[2] do
            if #v47 ~= 0 then
                l_Request_0:FireServer(v8.revert(v46), "\000", v47);
                v16[2][v46] = nil;
            end;
        end;
        for v48 in v14 do
            if v13[v48] then
                for _, v50 in v13[v48] do
                    if v50[3] then
                        if not v16[1][v48] then
                            v16[1][v48] = {};
                        end;
                        table.insert(v16[1][v48], {
                            v50[1], 
                            v50[3]
                        });
                        v50[3] = nil;
                    end;
                end;
            end;
            local v51 = v12[v48] or nil;
            if v51 then
                if v15[1][v48] then
                    for _, v53 in v15[1][v48] do
                        if #v53 ~= 0 then
                            for _, v55 in v51 do
                                for v56 = 1, #v53 do
                                    if v53[v56] then
                                        local v57 = v53[v56][1];
                                        local v58 = v53[v56][2];
                                        do
                                            local l_v57_0, l_v58_0 = v57, v58;
                                            v5(function() --[[ Line: 196 ]]
                                                -- upvalues: v55 (copy), l_v58_0 (ref), v16 (ref), v48 (copy), l_v57_0 (ref)
                                                local v61 = {
                                                    v55(table.unpack(l_v58_0))
                                                };
                                                if not v16[2][v48] then
                                                    v16[2][v48] = {};
                                                end;
                                                table.insert(v16[2][v48], {
                                                    l_v57_0, 
                                                    v61
                                                });
                                                l_v57_0 = nil;
                                                l_v58_0 = nil;
                                            end);
                                        end;
                                    end;
                                end;
                            end;
                        end;
                    end;
                    v15[1][v48] = nil;
                end;
                if v15[2][v48] then
                    if v13[v48] then
                        for _, v63 in v15[2][v48] do
                            for _, v65 in v63 do
                                if #v65 ~= 1 then
                                    for v66 = 1, #v13[v48] do
                                        local v67 = v13[v48][v66];
                                        if v67 and v67[1] == v65[1] then
                                            v5(v67[2], table.unpack(v65[2]));
                                            table.remove(v13[v48], v66);
                                            break;
                                        end;
                                    end;
                                end;
                            end;
                        end;
                    end;
                    v15[2][v48] = nil;
                end;
            end;
        end;
    end);
    local function v75(v68, v69, v70) --[[ Line: 233 ]] --[[ Name: onClientNetworkReceive ]]
        -- upvalues: v8 (ref), v14 (ref), v12 (ref), v5 (ref)
        if not v68 or typeof(v68) ~= "buffer" or not v69 or typeof(v69) ~= "buffer" then
            return;
        else
            v68 = v8.convert(v68);
            if not v14[v68] then
                return;
            else
                local v71 = v8.read(v69, v70);
                if not v71 then
                    return;
                else
                    local v72 = v12[v68];
                    if not v72 then
                        return;
                    else
                        for _, v74 in v72 do
                            v5(v74, table.unpack(v71));
                        end;
                        return;
                    end;
                end;
            end;
        end;
    end;
    l_Reliable_0.OnClientEvent:Connect(v75);
    l_Unreliable_0.OnClientEvent:Connect(v75);
    l_Request_0.OnClientEvent:Connect(function(v76, v77, v78) --[[ Line: 247 ]]
        -- upvalues: v8 (ref), v15 (ref)
        if not v76 or not v78 then
            return;
        else
            v76 = v8.convert(v76);
            if v77 == "\001" then
                if not v15[1][v76] then
                    v15[1][v76] = {};
                end;
                table.insert(v15[1][v76], v78);
                return;
            else
                if not v15[2][v76] then
                    v15[2][v76] = {};
                end;
                table.insert(v15[2][v76], v78);
                return;
            end;
        end;
    end);
end;
return v0;