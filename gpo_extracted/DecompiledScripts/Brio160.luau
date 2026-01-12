local v0 = require(script.Parent.loader).load(script)("Maid");
local v1 = {
    ClassName = "Brio"
};
v1.__index = v1;
v1.isBrio = function(v2) --[[ Line: 76 ]] --[[ Name: isBrio ]]
    local v3 = false;
    if type(v2) == "table" then
        v3 = v2.ClassName == "Brio";
    end;
    return v3;
end;
v1.new = function(...) --[[ Line: 91 ]] --[[ Name: new ]]
    -- upvalues: v1 (copy)
    return (setmetatable({
        _values = table.pack(...)
    }, v1));
end;
v1.delayed = function(v4, ...) --[[ Line: 105 ]] --[[ Name: delayed ]]
    -- upvalues: v1 (copy)
    local v5 = v1.new(...);
    task.delay(v4, function() --[[ Line: 107 ]]
        -- upvalues: v5 (copy)
        v5:Kill();
    end);
    return v5;
end;
v1.GetDiedSignal = function(v6) --[[ Line: 133 ]] --[[ Name: GetDiedSignal ]]
    if v6:IsDead() then
        error("Brio is dead");
    end;
    if v6._diedEvent then
        return v6._diedEvent.Event;
    else
        v6._diedEvent = Instance.new("BindableEvent");
        return v6._diedEvent.Event;
    end;
end;
v1.IsDead = function(v7) --[[ Line: 160 ]] --[[ Name: IsDead ]]
    return v7._values == nil;
end;
v1.ErrorIfDead = function(v8) --[[ Line: 171 ]] --[[ Name: ErrorIfDead ]]
    if not v8._values then
        error("[Brio.ErrorIfDead] - Brio is dead");
    end;
end;
v1.ToMaid = function(v9) --[[ Line: 196 ]] --[[ Name: ToMaid ]]
    -- upvalues: v0 (copy)
    assert(v9._values ~= nil, "Brio is dead");
    local v10 = v0.new();
    v10:GiveTask(v9:GetDiedSignal():Connect(function() --[[ Line: 201 ]]
        -- upvalues: v10 (copy)
        v10:DoCleaning();
    end));
    return v10;
end;
v1.GetValue = function(v11) --[[ Line: 226 ]] --[[ Name: GetValue ]]
    assert(v11._values, "Brio is dead");
    return unpack(v11._values, 1, v11._values.n);
end;
v1.GetPackedValues = function(v12) --[[ Line: 238 ]] --[[ Name: GetPackedValues ]]
    assert(v12._values, "Brio is dead");
    return v12._values;
end;
v1.Destroy = function(v13) --[[ Line: 259 ]] --[[ Name: Destroy ]]
    if not v13._values then
        return;
    else
        v13._values = nil;
        if v13._diedEvent then
            v13._diedEvent:Fire();
            v13._diedEvent:Destroy();
            v13._diedEvent = nil;
        end;
        return;
    end;
end;
v1.Kill = v1.Destroy;
v1.DEAD = v1.new();
v1.DEAD:Kill();
return v1;