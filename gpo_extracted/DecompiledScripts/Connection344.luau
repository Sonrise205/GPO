local v0 = {};
v0.__index = v0;
v0.new = function(v1, v2) --[[ Line: 4 ]] --[[ Name: new ]]
    -- upvalues: v0 (copy)
    local v3 = setmetatable({}, v0);
    v3.Signal = v1;
    v3.Callback = v2;
    v3.Connected = true;
    return v3;
end;
v0.Disconnect = function(v4) --[[ Line: 12 ]] --[[ Name: Disconnect ]]
    v4.Connected = false;
    if v4.Signal and v4.Signal._head == v4 then
        v4.Signal._head = v4.Next;
    end;
    if v4.Previous then
        v4.Previous.Next = v4.Next;
    end;
    if v4.Next then
        v4.Next.Previous = v4.Previous;
    end;
    v4.Signal = nil;
end;
return v0;