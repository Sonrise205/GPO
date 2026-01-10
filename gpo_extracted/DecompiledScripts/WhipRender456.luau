local v0 = require(script.Parent.Parent.Modules.Whip);
return function(v1, v2) --[[ Line: 3 ]]
    -- upvalues: v0 (copy)
    if _G.checkRenderDistance(v1.Position) == false then
        return;
    else
        local _ = v0.new(v1, nil, v2);
        return;
    end;
end;