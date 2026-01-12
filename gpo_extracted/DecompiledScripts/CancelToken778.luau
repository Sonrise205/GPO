local v0 = require(script.Parent.loader).load(script);
local v1 = v0("Promise");
local v2 = v0("Signal");
local v3 = {
    ClassName = "CancelToken"
};
v3.__index = v3;
v3.new = function(v4) --[[ Line: 21 ]] --[[ Name: new ]]
    -- upvalues: v3 (copy), v1 (copy), v2 (copy)
    local v5 = setmetatable({}, v3);
    assert(type(v4) == "function", "Bad executor");
    v5.PromiseCancelled = v1.new();
    v5.Cancelled = v2.new();
    v5.PromiseCancelled:Then(function() --[[ Line: 30 ]]
        -- upvalues: v5 (copy)
        v5.Cancelled:Fire();
        v5.Cancelled:Destroy();
    end);
    v4(function() --[[ Line: 35 ]]
        -- upvalues: v5 (copy)
        v5:_cancel();
    end);
    return v5;
end;
local function v6() --[[ Line: 42 ]]

end;
v3.fromMaid = function(v7) --[[ Line: 50 ]] --[[ Name: fromMaid ]]
    -- upvalues: v3 (copy), v6 (copy)
    local v8 = v3.new(v6);
    local v9 = v7:GiveTask(function() --[[ Line: 53 ]]
        -- upvalues: v8 (copy)
        v8:_cancel();
    end);
    v8.PromiseCancelled:Then(function() --[[ Line: 57 ]]
        -- upvalues: v7 (copy), v9 (copy)
        v7[v9] = nil;
    end);
    return v8;
end;
v3.ErrorIfCancelled = function(v10) --[[ Line: 67 ]] --[[ Name: ErrorIfCancelled ]]
    if not v10.PromiseCancelled:IsPending() then
        error("[CancelToken.ErrorIfCancelled] - Cancelled");
    end;
end;
v3.IsCancelled = function(v11) --[[ Line: 77 ]] --[[ Name: IsCancelled ]]
    return v11.PromiseCancelled:IsFulfilled();
end;
v3._cancel = function(v12) --[[ Line: 81 ]] --[[ Name: _cancel ]]
    v12.PromiseCancelled:Resolve();
end;
return v3;