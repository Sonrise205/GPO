local v0 = {};
local v1 = require(game.ReplicatedStorage.Modules.LightningModule);
v0.start = function(_, v3, v4, v5) --[[ Line: 4 ]] --[[ Name: start ]]
    -- upvalues: v1 (copy)
    if _G.checkRenderDistance(v4) == false then
        return;
    else
        if _G.fastmode then
            v5.bends = 2;
            v5.fork_chance = 0;
        end;
        v1.new(v3, v4, v5):Draw(workspace.Effects);
        return;
    end;
end;
return v0;