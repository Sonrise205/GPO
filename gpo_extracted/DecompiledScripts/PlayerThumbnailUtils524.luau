local v0 = require(script.Parent.loader).load(script);
local l_Players_0 = game:GetService("Players");
local v2 = v0("Promise");
return {
    promiseUserThumbnail = function(v3, v4, v5) --[[ Line: 31 ]] --[[ Name: promiseUserThumbnail ]]
        -- upvalues: v2 (copy), l_Players_0 (copy)
        assert(type(v3) == "number", "Bad userId");
        v4 = v4 or Enum.ThumbnailType.HeadShot;
        v5 = v5 or Enum.ThumbnailSize.Size100x100;
        local v6 = nil;
        v6 = v2.spawn(function(v7, v8) --[[ Line: 37 ]]
            -- upvalues: l_Players_0 (ref), v3 (copy), v4 (ref), v5 (ref), v6 (ref)
            local v9 = 0;
            while true do
                v9 = v9 + 1;
                local v10 = nil;
                local v11 = nil;
                local l_status_0, l_result_0 = pcall(function() --[[ Line: 42 ]]
                    -- upvalues: v10 (ref), v11 (ref), l_Players_0 (ref), v3 (ref), v4 (ref), v5 (ref)
                    local l_l_Players_0_UserThumbnailAsync_0, v13 = l_Players_0:GetUserThumbnailAsync(v3, v4, v5);
                    v10 = l_l_Players_0_UserThumbnailAsync_0;
                    v11 = v13;
                end);
                if not l_status_0 then
                    return v8(l_result_0);
                elseif v11 then
                    return v7(v10);
                else
                    task.wait(0.05);
                    if v9 < 5 and v6:IsPending() then
                        --[[ close >= 3 ]]
                    else
                        --[[ close >= 3 ]]
                        v8();
                        return;
                    end;
                end;
            end;
        end);
        return v6;
    end, 
    promiseUserName = function(v16) --[[ Line: 68 ]] --[[ Name: promiseUserName ]]
        -- upvalues: v2 (copy), l_Players_0 (copy)
        assert(type(v16) == "number", "Bad userId");
        local v17 = nil;
        v17 = v2.spawn(function(v18, v19) --[[ Line: 72 ]]
            -- upvalues: l_Players_0 (ref), v16 (copy), v17 (ref)
            local v20 = 0;
            while true do
                v20 = v20 + 1;
                local v21 = nil;
                local l_status_1, l_result_1 = pcall(function() --[[ Line: 77 ]]
                    -- upvalues: v21 (ref), l_Players_0 (ref), v16 (ref)
                    v21 = l_Players_0:GetNameFromUserIdAsync(v16);
                end);
                if not l_status_1 then
                    return v19(l_result_1);
                elseif type(v21) == "string" then
                    return v18(v21);
                else
                    task.wait(0.05);
                    if v20 < 5 and v17:IsPending() then
                        --[[ close >= 3 ]]
                    else
                        --[[ close >= 3 ]]
                        v19();
                        return;
                    end;
                end;
            end;
        end);
        return v17;
    end
};