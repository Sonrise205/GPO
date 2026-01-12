local v0 = require(game.ReplicatedStorage.Modules.FastWait);
return function(v1, v2) --[[ Line: 5 ]]
    -- upvalues: v0 (copy)
    pcall(function() --[[ Line: 6 ]]
        -- upvalues: v0 (ref), v2 (ref), v1 (ref)
        task.spawn(function() --[[ Line: 7 ]]
            -- upvalues: v0 (ref), v2 (ref), v1 (ref)
            v0(v2);
            if v1 then
                if game["Run Service"]:IsStudio() == true then
                    local v3 = setmetatable({
                        v1
                    }, {
                        __mode = "v"
                    });
                    delay(5, function() --[[ Line: 12 ]]
                        -- upvalues: v3 (copy)
                        if v3[1] then
                            warn("MEMORY LEAK?! for " .. v3[1]:GetFullName());
                        end;
                    end);
                end;
                v1:ClearAllChildren();
                v1:Destroy();
                v1 = nil;
                v2 = nil;
            end;
        end);
    end);
end;