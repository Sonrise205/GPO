local v0 = require(script.Parent.loader).load(script)("Subscription");
local v1 = {
    ClassName = "Observable"
};
v1.__index = v1;
v1.isObservable = function(v2) --[[ Line: 73 ]] --[[ Name: isObservable ]]
    local v3 = false;
    if type(v2) == "table" then
        v3 = v2.ClassName == "Observable";
    end;
    return v3;
end;
v1.new = function(v4) --[[ Line: 105 ]] --[[ Name: new ]]
    -- upvalues: v1 (copy)
    assert(type(v4) == "function", "Bad onSubscribe");
    return (setmetatable({
        _source = "", 
        _onSubscribe = v4
    }, v1));
end;
v1.Pipe = function(v5, v6) --[[ Line: 134 ]] --[[ Name: Pipe ]]
    -- upvalues: v1 (copy)
    assert(type(v6) == "table", "Bad transformers");
    local l_v5_0 = v5;
    for _, v9 in pairs(v6) do
        assert(type(v9) == "function", "Bad transformer");
        l_v5_0 = v9(l_v5_0);
        assert(v1.isObservable(l_v5_0));
    end;
    return l_v5_0;
end;
v1.Subscribe = function(v10, v11, v12, v13) --[[ Line: 156 ]] --[[ Name: Subscribe ]]
    -- upvalues: v0 (copy)
    local v14 = v0.new(v11, v12, v13);
    local v15 = v10._onSubscribe(v14);
    if v15 then
        v14:_giveCleanup(v15);
    end;
    return v14;
end;
return v1;