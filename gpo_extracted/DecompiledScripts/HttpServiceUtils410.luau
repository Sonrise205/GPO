local l_HttpService_0 = game:GetService("HttpService");
local v1 = require(script.Parent.Parent.Promises.Promise2);
local v14 = {
    PromiseGetAsync = function(v2, v3, v4) --[[ Line: 17 ]] --[[ Name: PromiseGetAsync ]]
        -- upvalues: v1 (copy), l_HttpService_0 (copy)
        return v1.try(function() --[[ Line: 18 ]]
            -- upvalues: l_HttpService_0 (ref), v2 (copy), v3 (copy), v4 (copy)
            return l_HttpService_0:GetAsync(v2, v3, v4);
        end);
    end, 
    PromisePostAsync = function(v5, v6, v7, v8, v9) --[[ Line: 32 ]] --[[ Name: PromisePostAsync ]]
        -- upvalues: v1 (copy), l_HttpService_0 (copy)
        return v1.try(function() --[[ Line: 39 ]]
            -- upvalues: v6 (copy), l_HttpService_0 (ref), v5 (copy), v7 (copy), v8 (copy), v9 (copy)
            local v10 = if type(v6) == "string" then v6 else l_HttpService_0:JSONEncode(v6);
            return l_HttpService_0:PostAsync(v5, v10, v7, v8, v9);
        end);
    end, 
    PromiseRequestAsync = function(v11) --[[ Line: 50 ]] --[[ Name: PromiseRequestAsync ]]
        -- upvalues: v1 (copy), l_HttpService_0 (copy)
        return v1.try(function() --[[ Line: 56 ]]
            -- upvalues: l_HttpService_0 (ref), v11 (copy)
            return l_HttpService_0:RequestAsync(v11);
        end);
    end, 
    PromiseJSONDecode = function(v12) --[[ Line: 66 ]] --[[ Name: PromiseJSONDecode ]]
        -- upvalues: v1 (copy), l_HttpService_0 (copy)
        return v1.try(function() --[[ Line: 67 ]]
            -- upvalues: l_HttpService_0 (ref), v12 (copy)
            return l_HttpService_0:JSONDecode(v12);
        end);
    end, 
    PromiseJSONEncode = function(v13) --[[ Line: 77 ]] --[[ Name: PromiseJSONEncode ]]
        -- upvalues: v1 (copy), l_HttpService_0 (copy)
        return v1.try(function() --[[ Line: 78 ]]
            -- upvalues: l_HttpService_0 (ref), v13 (copy)
            return l_HttpService_0:JSONEncode(v13);
        end);
    end
};
v14.PromiseGetJSON = function(v15, v16, v17) --[[ Line: 90 ]] --[[ Name: PromiseGetJSON ]]
    -- upvalues: v14 (copy)
    return v14.PromiseGetAsync(v15, v16, v17):andThen(function(v18) --[[ Line: 92 ]]
        -- upvalues: v14 (ref)
        return v14.PromiseJSONDecode(v18);
    end);
end;
v14.PromisePostJSON = function(v19, v20, v21) --[[ Line: 104 ]] --[[ Name: PromisePostJSON ]]
    -- upvalues: v14 (copy)
    local v22 = v21 or {};
    v22["Content-Type"] = v22["Content-Type"] or "application/json";
    return v14.PromisePostAsync(v19, v20, Enum.HttpContentType.ApplicationJson, false, v22):andThen(function(v23) --[[ Line: 114 ]]
        -- upvalues: v14 (ref)
        return v14.PromiseJSONDecode(v23);
    end);
end;
v14.PromiseRequestWithRetry = function(v24, v25, v26) --[[ Line: 126 ]] --[[ Name: PromiseRequestWithRetry ]]
    -- upvalues: v1 (copy), v14 (copy)
    return v1.retry(function() --[[ Line: 137 ]]
        -- upvalues: v14 (ref), v24 (copy)
        return v14.PromiseRequestAsync(v24);
    end, v25 or 3, v26 or 1);
end;
v14.PromiseBatchRequests = function(v27, v28) --[[ Line: 151 ]] --[[ Name: PromiseBatchRequests ]]
    -- upvalues: v14 (copy), v1 (copy)
    local v29 = {};
    for v30, v31 in ipairs(v27) do
        v29[v30] = function() --[[ Line: 160 ]]
            -- upvalues: v14 (ref), v31 (copy)
            return v14.PromiseRequestAsync(v31);
        end;
    end;
    if v28 then
        return v1.new(function(v32, v33) --[[ Line: 167 ]]
            -- upvalues: v28 (copy), v29 (copy)
            local v34 = {};
            local v35 = 0;
            local v36 = 0;
            local v37 = 0;
            local function v38() --[[ Line: 173 ]] --[[ Name: runNext ]]
                -- upvalues: v36 (ref), v28 (ref), v37 (ref), v29 (ref), v34 (copy), v35 (ref), v32 (copy), v38 (copy), v33 (copy)
                while v36 < v28 and v37 < #v29 do
                    v37 = v37 + 1;
                    local l_v37_0 = v37;
                    local v40 = v29[l_v37_0];
                    v36 = v36 + 1;
                    v40():andThen(function(v41) --[[ Line: 181 ]]
                        -- upvalues: v34 (ref), l_v37_0 (copy), v35 (ref), v36 (ref), v29 (ref), v32 (ref), v38 (ref)
                        v34[l_v37_0] = v41;
                        v35 = v35 + 1;
                        v36 = v36 - 1;
                        if v35 == #v29 then
                            v32(v34);
                            return;
                        else
                            v38();
                            return;
                        end;
                    end, function(v42) --[[ Line: 191 ]]
                        -- upvalues: v33 (ref)
                        v33(v42);
                    end);
                end;
            end;
            v38();
        end);
    else
        local v43 = {};
        for v44, v45 in ipairs(v29) do
            v43[v44] = v45();
        end;
        return v1.all(v43);
    end;
end;
return v14;