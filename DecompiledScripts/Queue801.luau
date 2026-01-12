local v0 = {
    ClassName = "Queue"
};
v0.__index = v0;
v0.new = function() --[[ Line: 16 ]] --[[ Name: new ]]
    -- upvalues: v0 (copy)
    return (setmetatable({
        _first = 0, 
        _last = -1
    }, v0));
end;
v0.PushLeft = function(v1, v2) --[[ Line: 27 ]] --[[ Name: PushLeft ]]
    v1._first = v1._first - 1;
    v1[v1._first] = v2;
end;
v0.PushRight = function(v3, v4) --[[ Line: 36 ]] --[[ Name: PushRight ]]
    v3._last = v3._last + 1;
    v3[v3._last] = v4;
end;
v0.PopLeft = function(v5) --[[ Line: 45 ]] --[[ Name: PopLeft ]]
    if v5._first > v5._last then
        error("Queue is empty");
    end;
    local v6 = v5[v5._first];
    v5[v5._first] = nil;
    v5._first = v5._first + 1;
    return v6;
end;
v0.PopRight = function(v7) --[[ Line: 61 ]] --[[ Name: PopRight ]]
    if v7._first > v7._last then
        error("Queue is empty");
    end;
    local v8 = v7[v7._last];
    v7[v7._last] = nil;
    v7._last = v7._last - 1;
    return v8;
end;
v0.IsEmpty = function(v9) --[[ Line: 77 ]] --[[ Name: IsEmpty ]]
    return v9._first > v9._last;
end;
return v0;