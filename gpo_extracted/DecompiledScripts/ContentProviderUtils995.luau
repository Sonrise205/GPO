local v0 = require(script.Parent.loader).load(script);
local l_ContentProvider_0 = game:GetService("ContentProvider");
local v2 = v0("Promise");
return {
    promisePreload = function(v3) --[[ Line: 23 ]] --[[ Name: promisePreload ]]
        -- upvalues: v2 (copy), l_ContentProvider_0 (copy)
        assert(type(v3) == "table", "Bad contentIdList");
        return v2.spawn(function(v4, v5) --[[ Line: 26 ]]
            -- upvalues: l_ContentProvider_0 (ref), v3 (copy)
            local l_status_0, l_result_0 = pcall(function() --[[ Line: 27 ]]
                -- upvalues: l_ContentProvider_0 (ref), v3 (ref)
                l_ContentProvider_0:PreloadAsync(v3);
            end);
            if not l_status_0 then
                return v5(l_result_0);
            else
                v4();
                return;
            end;
        end);
    end
};