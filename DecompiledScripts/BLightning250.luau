local v0 = {};
local v1 = require(game.ReplicatedStorage.Modules.BLightning);
v0.start = function(_, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12) --[[ Line: 4 ]] --[[ Name: start ]]
    -- upvalues: v1 (copy)
    if _G.checkRenderDistance(v5) == false then
        return;
    else
        local v13 = v1:Fire(v3, v4, v5, v6, v7, v8, v9, v10, v11, v12);
        _G.destroy(v13, v12);
        return;
    end;
end;
return v0;