local l_Promises_0 = script.Parent.Parent.Promises;
local l_Promise_0 = require(l_Promises_0:WaitForChild("Promise"));
local l_DataStoreService_0 = game:GetService("DataStoreService");
local v69 = {
    promiseDataStore = function(v3, v4) --[[ Line: 10 ]] --[[ Name: promiseDataStore ]]
        -- upvalues: l_Promise_0 (copy), l_DataStoreService_0 (copy)
        assert(type(v3) == "string", "Bad name");
        if v4 ~= nil then
            assert(type(v4) == "string", "Bad scope");
        end;
        return l_Promise_0.new(function(v5, v6) --[[ Line: 14 ]]
            -- upvalues: l_DataStoreService_0 (ref), v3 (copy), v4 (copy)
            local v7 = nil;
            local l_status_0, l_result_0 = pcall(function() --[[ Line: 16 ]]
                -- upvalues: v7 (ref), l_DataStoreService_0 (ref), v3 (ref), v4 (ref)
                v7 = l_DataStoreService_0:GetDataStore(v3, v4);
            end);
            if not l_status_0 then
                return v6(l_result_0);
            else
                return v5(v7);
            end;
        end);
    end, 
    promiseOrderedDataStore = function(v10, v11) --[[ Line: 26 ]] --[[ Name: promiseOrderedDataStore ]]
        -- upvalues: l_Promise_0 (copy), l_DataStoreService_0 (copy)
        assert(type(v10) == "string", "Bad name");
        return l_Promise_0.new(function(v12, v13) --[[ Line: 29 ]]
            -- upvalues: l_DataStoreService_0 (ref), v10 (copy), v11 (copy)
            local v14 = nil;
            local l_status_1, l_result_1 = pcall(function() --[[ Line: 31 ]]
                -- upvalues: v14 (ref), l_DataStoreService_0 (ref), v10 (ref), v11 (ref)
                v14 = l_DataStoreService_0:GetOrderedDataStore(v10, v11);
            end);
            if not l_status_1 then
                return v13(l_result_1);
            else
                return v12(v14);
            end;
        end);
    end, 
    getAsync = function(v17, v18) --[[ Line: 41 ]] --[[ Name: getAsync ]]
        -- upvalues: l_Promise_0 (copy)
        assert(typeof(v17) == "Instance", "Bad robloxDataStore");
        assert(type(v18) == "string", "Bad key");
        return l_Promise_0.spawn(function(v19, v20) --[[ Line: 45 ]]
            -- upvalues: v17 (copy), v18 (copy)
            local v21 = nil;
            local v22 = nil;
            local l_status_2, l_result_2 = pcall(function() --[[ Line: 48 ]]
                -- upvalues: v21 (ref), v22 (ref), v17 (ref), v18 (ref)
                local l_v17_Async_0, v24 = v17:GetAsync(v18);
                v21 = l_v17_Async_0;
                v22 = v24;
            end);
            if not l_status_2 then
                return v20(l_result_2);
            else
                return v19(v21, v22);
            end;
        end);
    end, 
    updateAsync = function(v27, v28, v29) --[[ Line: 58 ]] --[[ Name: updateAsync ]]
        -- upvalues: l_Promise_0 (copy)
        assert(typeof(v27) == "Instance", "Bad robloxDataStore");
        assert(type(v28) == "string", "Bad key");
        assert(type(v29) == "function", "Bad updateFunc");
        return l_Promise_0.spawn(function(v30, v31) --[[ Line: 63 ]]
            -- upvalues: v27 (copy), v28 (copy), v29 (copy)
            local v32 = nil;
            local l_status_3, l_result_3 = pcall(function() --[[ Line: 65 ]]
                -- upvalues: v32 (ref), v27 (ref), v28 (ref), v29 (ref)
                v32 = {
                    v27:UpdateAsync(v28, v29)
                };
            end);
            if not l_status_3 then
                return v31(l_result_3);
            elseif not v32 then
                return v31("No result loaded");
            else
                return v30(unpack(v32));
            end;
        end);
    end, 
    setAsync = function(v35, v36, v37, v38) --[[ Line: 78 ]] --[[ Name: setAsync ]]
        -- upvalues: l_Promise_0 (copy)
        assert(typeof(v35) == "Instance", "Bad robloxDataStore");
        assert(type(v36) == "string", "Bad key");
        local v39 = true;
        if type(v38) ~= "table" then
            v39 = v38 == nil;
        end;
        assert(v39, "Bad userIds");
        return l_Promise_0.spawn(function(v40, v41) --[[ Line: 83 ]]
            -- upvalues: v35 (copy), v36 (copy), v37 (copy), v38 (copy)
            local l_status_4, l_result_4 = pcall(function() --[[ Line: 84 ]]
                -- upvalues: v35 (ref), v36 (ref), v37 (ref), v38 (ref)
                v35:SetAsync(v36, v37, v38);
            end);
            if not l_status_4 then
                return v41(l_result_4);
            else
                return v40(true);
            end;
        end);
    end, 
    promiseIncrementAsync = function(v44, v45, v46) --[[ Line: 94 ]] --[[ Name: promiseIncrementAsync ]]
        -- upvalues: l_Promise_0 (copy)
        assert(typeof(v44) == "Instance", "Bad robloxDataStore");
        assert(type(v45) == "string", "Bad key");
        local v47 = true;
        if type(v46) ~= "number" then
            v47 = v46 == nil;
        end;
        assert(v47, "Bad delta");
        return l_Promise_0.spawn(function(v48, v49) --[[ Line: 99 ]]
            -- upvalues: v44 (copy), v45 (copy), v46 (copy)
            local l_status_5, l_result_5 = pcall(function() --[[ Line: 100 ]]
                -- upvalues: v44 (ref), v45 (ref), v46 (ref)
                v44:IncrementAsync(v45, v46);
            end);
            if not l_status_5 then
                return v49(l_result_5);
            else
                return v48(true);
            end;
        end);
    end, 
    removeAsync = function(v52, v53) --[[ Line: 110 ]] --[[ Name: removeAsync ]]
        -- upvalues: l_Promise_0 (copy)
        assert(typeof(v52) == "Instance", "Bad robloxDataStore");
        assert(type(v53) == "string", "Bad key");
        return l_Promise_0.spawn(function(v54, v55) --[[ Line: 114 ]]
            -- upvalues: v52 (copy), v53 (copy)
            local l_status_6, l_result_6 = pcall(function() --[[ Line: 115 ]]
                -- upvalues: v52 (ref), v53 (ref)
                v52:RemoveAsync(v53);
            end);
            if not l_status_6 then
                return v55(l_result_6);
            else
                return v54(true);
            end;
        end);
    end, 
    promiseSortedPagesAsync = function(v58, v59, v60, v61, v62) --[[ Line: 125 ]] --[[ Name: promiseSortedPagesAsync ]]
        -- upvalues: l_Promise_0 (copy)
        local v63 = false;
        if typeof(v58) == "Instance" then
            v63 = v58:IsA("OrderedDataStore");
        end;
        assert(v63, "Bad orderedDataStore");
        assert(type(v59) == "boolean", "Bad ascending");
        assert(type(v60) == "number", "Bad entries");
        return l_Promise_0.spawn(function(v64, v65) --[[ Line: 130 ]]
            -- upvalues: v58 (copy), v59 (copy), v60 (copy), v61 (copy), v62 (copy)
            local v66 = nil;
            local l_status_7, l_result_7 = pcall(function() --[[ Line: 132 ]]
                -- upvalues: v66 (ref), v58 (ref), v59 (ref), v60 (ref), v61 (ref), v62 (ref)
                v66 = v58:GetSortedAsync(v59, v60, v61, v62);
            end);
            if not l_status_7 then
                return v65(l_result_7);
            elseif typeof(v66) ~= "Instance" then
                return v65(l_result_7);
            else
                return v64(v66);
            end;
        end);
    end
};
v69.promiseOrderedEntries = function(v70, v71, v72, v73, v74, v75) --[[ Line: 146 ]] --[[ Name: promiseOrderedEntries ]]
    -- upvalues: v69 (copy), l_Promise_0 (copy)
    local v76 = false;
    if typeof(v70) == "Instance" then
        v76 = v70:IsA("OrderedDataStore");
    end;
    assert(v76, "Bad orderedDataStore");
    assert(type(v71) == "boolean", "Bad ascending");
    assert(type(v73) == "number", "Bad entries");
    return v69.promiseSortedPagesAsync(v70, v71, v72, v74, v75):Then(function(v77) --[[ Line: 152 ]]
        -- upvalues: l_Promise_0 (ref), v73 (copy)
        return l_Promise_0.spawn(function(v78, v79) --[[ Line: 153 ]]
            -- upvalues: v73 (ref), v77 (copy)
            local v80 = {};
            local v81 = 0;
            while v81 < v73 do
                local l_v81_0 = v81;
                for _, v84 in pairs(v77:GetCurrentPage()) do
                    table.insert(v80, v84);
                    v81 = v81 + 1;
                    if v73 <= v81 then
                        break;
                    end;
                end;
                if l_v81_0 == v81 or v77.IsFinished then
                    break;
                elseif v81 < v73 then
                    local l_status_8, l_result_8 = pcall(function() --[[ Line: 175 ]]
                        -- upvalues: v77 (ref)
                        v77:AdvanceToNextPageAsync();
                    end);
                    if not l_status_8 then
                        return v79(l_result_8);
                    end;
                end;
            end;
            return v78(v80);
        end);
    end);
end;
return v69;