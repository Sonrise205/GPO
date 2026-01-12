local v0 = {};
v0.__index = v0;
v0.ClassName = "Signal";
v0.new = function() --[[ Line: 20 ]] --[[ Name: new ]]
    -- upvalues: v0 (copy)
    local v1 = setmetatable({}, v0);
    v1._bindableEvent = Instance.new("BindableEvent");
    v1._argData = nil;
    v1._argCount = nil;
    return v1;
end;
v0.Fire = function(v2, ...) --[[ Line: 34 ]] --[[ Name: Fire ]]
    v2._argData = {
        ...
    };
    v2._argCount = select("#", ...);
    v2._bindableEvent:Fire();
    v2._argData = nil;
    v2._argCount = nil;
end;
v0.Connect = function(v3, v4) --[[ Line: 45 ]] --[[ Name: Connect ]]
    if type(v4) ~= "function" then
        error(("connect(%s)"):format((typeof(v4))), 2);
    end;
    return v3._bindableEvent.Event:Connect(function() --[[ Line: 50 ]]
        -- upvalues: v4 (copy), v3 (copy)
        v4(unpack(v3._argData, 1, v3._argCount));
    end);
end;
v0.Wait = function(v5) --[[ Line: 57 ]] --[[ Name: Wait ]]
    v5._bindableEvent.Event:Wait();
    assert(v5._argData, "Missing arg data, likely due to :TweenSize/Position corrupting threadrefs.");
    return unpack(v5._argData, 1, v5._argCount);
end;
v0.Destroy = function(v6) --[[ Line: 65 ]] --[[ Name: Destroy ]]
    if v6._bindableEvent then
        v6._bindableEvent:Destroy();
        v6._bindableEvent = nil;
    end;
    v6._argData = nil;
    v6._argCount = nil;
end;
return v0;