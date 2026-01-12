local v0 = require(script.Parent.Promises.Promise);
local l_HttpService_0 = game:GetService("HttpService");
return {
    PromiseGetAsync = function(v2, v3, v4) --[[ Line: 7 ]] --[[ Name: PromiseGetAsync ]]
        -- upvalues: v0 (copy), l_HttpService_0 (copy)
        return v0.spawn(function(v5, v6) --[[ Line: 8 ]]
            -- upvalues: l_HttpService_0 (ref), v2 (copy), v3 (copy), v4 (copy)
            local v7 = nil;
            local l_status_0, l_result_0 = pcall(function() --[[ Line: 11 ]]
                -- upvalues: v7 (ref), l_HttpService_0 (ref), v2 (ref), v3 (ref), v4 (ref)
                v7 = l_HttpService_0:GetAsync(v2, v3, v4);
            end);
            if not l_status_0 then
                v6(l_result_0);
            end;
            v5(v7);
        end);
    end, 
    PromiseJSONDecode = function(v10) --[[ Line: 23 ]] --[[ Name: PromiseJSONDecode ]]
        -- upvalues: v0 (copy), l_HttpService_0 (copy)
        return v0.spawn(function(v11, v12) --[[ Line: 24 ]]
            -- upvalues: l_HttpService_0 (ref), v10 (copy)
            local v13 = nil;
            local l_status_1, l_result_1 = pcall(function() --[[ Line: 27 ]]
                -- upvalues: v13 (ref), l_HttpService_0 (ref), v10 (ref)
                v13 = l_HttpService_0:JSONDecode(v10);
            end);
            if not l_status_1 then
                v12(l_result_1);
            end;
            v11(v13);
        end);
    end, 
    PromisePostAsync = function(v16, v17, _, _, _) --[[ Line: 39 ]] --[[ Name: PromisePostAsync ]]
        -- upvalues: v0 (copy), l_HttpService_0 (copy)
        return v0.spawn(function(v21, v22) --[[ Line: 40 ]]
            -- upvalues: l_HttpService_0 (ref), v16 (copy), v17 (copy)
            local v23 = nil;
            local l_status_2, l_result_2 = pcall(function() --[[ Line: 43 ]]
                -- upvalues: v23 (ref), l_HttpService_0 (ref), v16 (ref), v17 (ref)
                v23 = l_HttpService_0:PostAsync(v16, l_HttpService_0:JSONEncode(v17));
            end);
            if not l_status_2 then
                v22(l_result_2);
            end;
            v21(v23);
        end);
    end, 
    PromiseRequestAsync = function(v26) --[[ Line: 63 ]] --[[ Name: PromiseRequestAsync ]]
        -- upvalues: v0 (copy), l_HttpService_0 (copy)
        return v0.spawn(function(v27, v28) --[[ Line: 64 ]]
            -- upvalues: l_HttpService_0 (ref), v26 (copy)
            local v29 = nil;
            local l_status_3, l_result_3 = pcall(function() --[[ Line: 67 ]]
                -- upvalues: v29 (ref), l_HttpService_0 (ref), v26 (ref)
                v29 = l_HttpService_0:RequestAsync(v26);
            end);
            if not l_status_3 then
                v28(l_result_3);
            end;
            v27(v29);
        end);
    end
};