--!native
local v0 = nil;
local function v3(v1, ...) --[[ Line: 6 ]] --[[ Name: passer ]]
    -- upvalues: v0 (ref)
    local l_v0_0 = v0;
    v0 = nil;
    v1(...);
    v0 = l_v0_0;
end;
local function v4() --[[ Line: 13 ]] --[[ Name: newThread ]]
    -- upvalues: v0 (ref), v3 (copy)
    v0 = coroutine.running();
    while true do
        v3(coroutine.yield());
    end;
end;
return function(v5, ...) --[[ Line: 18 ]]
    -- upvalues: v0 (ref), v4 (copy)
    if not v0 then
        task.spawn(v4);
    end;
    task.spawn(v0, v5, ...);
end;