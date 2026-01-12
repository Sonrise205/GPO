local v0 = require(script.Parent.Promises.Promise);
return {
    PromiseSortedMapSetAsync = function(v1, v2, v3, v4) --[[ Line: 5 ]] --[[ Name: PromiseSortedMapSetAsync ]]
        -- upvalues: v0 (copy)
        return v0.spawn(function(v5, v6) --[[ Line: 6 ]]
            -- upvalues: v1 (copy), v2 (copy), v3 (copy), v4 (copy)
            local l_status_0, l_result_0 = pcall(function() --[[ Line: 8 ]]
                -- upvalues: v1 (ref), v2 (ref), v3 (ref), v4 (ref)
                v1:SetAsync(v2, v3, v4 or 86400);
            end);
            if not l_status_0 then
                v6(l_result_0);
            end;
            v5(true);
        end);
    end, 
    PromiseSortedMapGetAsync = function(v9, v10) --[[ Line: 20 ]] --[[ Name: PromiseSortedMapGetAsync ]]
        -- upvalues: v0 (copy)
        return v0.spawn(function(v11, v12) --[[ Line: 21 ]]
            -- upvalues: v9 (copy), v10 (copy)
            local v13 = nil;
            local l_status_1, l_result_1 = pcall(function() --[[ Line: 23 ]]
                -- upvalues: v13 (ref), v9 (ref), v10 (ref)
                v13 = v9:GetAsync(v10);
            end);
            if not l_status_1 then
                v12(l_result_1);
            end;
            v11(v13);
        end);
    end, 
    PromiseSortedMapRemoveAsync = function(v16, v17) --[[ Line: 35 ]] --[[ Name: PromiseSortedMapRemoveAsync ]]
        -- upvalues: v0 (copy)
        return v0.spawn(function(v18, v19) --[[ Line: 36 ]]
            -- upvalues: v16 (copy), v17 (copy)
            local l_status_2, l_result_2 = pcall(function() --[[ Line: 38 ]]
                -- upvalues: v16 (ref), v17 (ref)
                v16:RemoveAsync(v17);
            end);
            if not l_status_2 then
                v19(l_result_2);
            end;
            v18(true);
        end);
    end, 
    PromiseSortedMapGetRangeAsync = function(v22, v23) --[[ Line: 50 ]] --[[ Name: PromiseSortedMapGetRangeAsync ]]
        -- upvalues: v0 (copy)
        return v0.spawn(function(v24, v25) --[[ Line: 51 ]]
            -- upvalues: v22 (copy), v23 (copy)
            local v26 = nil;
            local l_status_3, l_result_3 = pcall(function() --[[ Line: 54 ]]
                -- upvalues: v26 (ref), v22 (ref), v23 (ref)
                v26 = v22:GetRangeAsync(Enum.SortDirection.Ascending, v23 or 200);
            end);
            if not l_status_3 then
                v25(l_result_3);
            end;
            v24(v26);
        end);
    end, 
    PromiseSortedMapUpdatedAsync = function(v29, v30, v31, v32) --[[ Line: 66 ]] --[[ Name: PromiseSortedMapUpdatedAsync ]]
        -- upvalues: v0 (copy)
        return v0.spawn(function(v33, v34) --[[ Line: 67 ]]
            -- upvalues: v29 (copy), v30 (copy), v31 (copy), v32 (copy)
            local v35 = nil;
            local l_status_4, l_result_4 = pcall(function() --[[ Line: 70 ]]
                -- upvalues: v35 (ref), v29 (ref), v30 (ref), v31 (ref), v32 (ref)
                v35 = v29:UpdateAsync(v30, function(_) --[[ Line: 71 ]]
                    -- upvalues: v31 (ref)
                    return v31;
                end, v32 or 86400);
            end);
            if not l_status_4 then
                v34(l_result_4);
            end;
            v33(v35);
        end);
    end
};