return function(v0, v1, ...) --[[ Line: 14 ]] --[[ Name: cancellableDelay ]]
    assert(type(v0) == "number", "Bad timeoutInSeconds");
    assert(type(v1) == "function", "Bad func");
    local v2 = table.pack(...);
    local v3 = nil;
    task.spawn(function() --[[ Line: 21 ]]
        -- upvalues: v3 (ref), v0 (copy), v2 (ref), v1 (copy)
        v3 = coroutine.running();
        task.wait(v0);
        local l_v2_0 = v2;
        v3 = nil;
        v2 = nil;
        v1(table.unpack(l_v2_0, 1, l_v2_0.n));
    end);
    return function() --[[ Line: 30 ]]
        -- upvalues: v3 (ref), v2 (ref)
        if v3 then
            coroutine.close(v3);
            v3 = nil;
            v2 = nil;
        end;
    end;
end;