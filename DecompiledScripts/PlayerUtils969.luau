local l_Players_0 = game:GetService("Players");
local l_Promises_0 = script.Parent.Parent.Promises;
local v2 = require(l_Promises_0.Promise);
local v3 = {};
local v4 = {};
v3.PromiseUserThumbnail = function(v5) --[[ Line: 12 ]] --[[ Name: PromiseUserThumbnail ]]
    -- upvalues: v2 (copy), v4 (copy), l_Players_0 (copy)
    return v2.spawn(function(v6, v7) --[[ Line: 13 ]]
        -- upvalues: v4 (ref), v5 (copy), l_Players_0 (ref)
        if v4[v5] ~= nil then
            v6(v4[v5]);
            return;
        else
            local v8 = nil;
            local l_status_0, l_result_0 = pcall(function() --[[ Line: 21 ]]
                -- upvalues: v8 (ref), l_Players_0 (ref), v5 (ref)
                v8 = l_Players_0:GetUserThumbnailAsync(v5, Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size100x100);
            end);
            if not l_status_0 then
                v7(l_result_0);
            end;
            if v4[v5] ~= nil then
                v4[v5] = v8;
            end;
            v6(v8);
            return;
        end;
    end);
end;
v3.Initialize = function() --[[ Line: 41 ]] --[[ Name: Initialize ]]
    -- upvalues: l_Players_0 (copy), v4 (copy)
    l_Players_0.PlayerRemoving:Connect(function(v11) --[[ Line: 42 ]]
        -- upvalues: v4 (ref)
        if v4[v11.UserId] ~= nil then
            v4[v11.UserId] = nil;
        end;
    end);
end;
return v3;