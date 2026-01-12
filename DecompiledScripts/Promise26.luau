local l_RunService_0 = game:GetService("RunService");
local v1 = nil;
local v2 = nil;
local v3 = {
    ClassName = "Promise"
};
v3.__index = v3;
v3.isPromise = function(v4) --[[ Line: 11 ]] --[[ Name: isPromise ]]
    local v5 = false;
    if type(v4) == "table" then
        v5 = v4.ClassName == "Promise";
    end;
    return v5;
end;
v3.new = function(v6) --[[ Line: 15 ]] --[[ Name: new ]]
    -- upvalues: v3 (copy)
    local v7 = setmetatable({
        _pendingExecuteList = {}, 
        _unconsumedException = true, 
        _source = ""
    }, v3);
    if type(v6) == "function" then
        v6(v7:_getResolveReject());
    end;
    return v7;
end;
v3.spawn = function(v8) --[[ Line: 29 ]] --[[ Name: spawn ]]
    -- upvalues: v3 (copy)
    local v9 = v3.new();
    task.spawn(v8, v9:_getResolveReject());
    return v9;
end;
v3.defer = function(v10) --[[ Line: 37 ]] --[[ Name: defer ]]
    -- upvalues: v3 (copy)
    local v11 = v3.new();
    task.defer(v10, v11:_getResolveReject());
    return v11;
end;
v3.resolved = function(...) --[[ Line: 45 ]] --[[ Name: resolved ]]
    -- upvalues: v2 (ref), v3 (copy)
    local v12 = select("#", ...);
    if v12 == 0 then
        return v2;
    else
        if v12 == 1 and v3.isPromise(...) then
            local v13 = ...;
            if not v13._pendingExecuteList then
                return v13;
            end;
        end;
        local v14 = v3.new();
        v14:Resolve(...);
        return v14;
    end;
end;
v3.rejected = function(...) --[[ Line: 62 ]] --[[ Name: rejected ]]
    -- upvalues: v1 (ref), v3 (copy)
    local v15 = select("#", ...);
    if v15 == 0 then
        return v1;
    else
        local v16 = v3.new();
        v16:_reject({
            ...
        }, v15);
        return v16;
    end;
end;
v3.IsPending = function(v17) --[[ Line: 73 ]] --[[ Name: IsPending ]]
    return v17._pendingExecuteList ~= nil;
end;
v3.IsFulfilled = function(v18) --[[ Line: 77 ]] --[[ Name: IsFulfilled ]]
    return v18._fulfilled ~= nil;
end;
v3.IsRejected = function(v19) --[[ Line: 81 ]] --[[ Name: IsRejected ]]
    return v19._rejected ~= nil;
end;
v3.Wait = function(v20) --[[ Line: 85 ]] --[[ Name: Wait ]]
    if v20._fulfilled then
        return unpack(v20._fulfilled, 1, v20._valuesLength);
    elseif v20._rejected then
        return error(tostring(v20._rejected[1]), 2);
    else
        local l_BindableEvent_0 = Instance.new("BindableEvent");
        v20:Then(function() --[[ Line: 93 ]]
            -- upvalues: l_BindableEvent_0 (copy)
            l_BindableEvent_0:Fire();
        end, function() --[[ Line: 95 ]]
            -- upvalues: l_BindableEvent_0 (copy)
            l_BindableEvent_0:Fire();
        end);
        l_BindableEvent_0.Event:Wait();
        l_BindableEvent_0:Destroy();
        if v20._rejected then
            return error(tostring(v20._rejected[1]), 2);
        else
            return unpack(v20._fulfilled, 1, v20._valuesLength);
        end;
    end;
end;
v3.Yield = function(v22) --[[ Line: 110 ]] --[[ Name: Yield ]]
    if v22._fulfilled then
        return true, unpack(v22._fulfilled, 1, v22._valuesLength);
    elseif v22._rejected then
        return false, unpack(v22._rejected, 1, v22._valuesLength);
    else
        local l_BindableEvent_1 = Instance.new("BindableEvent");
        v22:Then(function() --[[ Line: 118 ]]
            -- upvalues: l_BindableEvent_1 (copy)
            l_BindableEvent_1:Fire();
        end, function() --[[ Line: 120 ]]
            -- upvalues: l_BindableEvent_1 (copy)
            l_BindableEvent_1:Fire();
        end);
        l_BindableEvent_1.Event:Wait();
        l_BindableEvent_1:Destroy();
        if v22._fulfilled then
            return true, unpack(v22._fulfilled, 1, v22._valuesLength);
        elseif v22._rejected then
            return false, unpack(v22._rejected, 1, v22._valuesLength);
        else
            return;
        end;
    end;
end;
v3.Resolve = function(v24, ...) --[[ Line: 135 ]] --[[ Name: Resolve ]]
    -- upvalues: v3 (copy)
    if not v24._pendingExecuteList then
        return;
    else
        local v25 = select("#", ...);
        if v25 == 0 then
            v24:_fulfill({}, 0);
            return;
        elseif v24 == ... then
            v24:Reject("TypeError: Resolved to self");
            return;
        elseif v3.isPromise(...) then
            if v25 > 1 then
                local v26 = ("When resolving a promise, extra arguments are discarded! See:\n\n%s"):format(v24._source);
                warn(v26);
            end;
            local v27 = ...;
            if v27._pendingExecuteList then
                v27._unconsumedException = false;
                v27._pendingExecuteList[#v27._pendingExecuteList + 1] = {
                    function(...) --[[ Line: 156 ]]
                        -- upvalues: v24 (copy)
                        v24:Resolve(...);
                    end, 
                    function(...) --[[ Line: 159 ]]
                        -- upvalues: v24 (copy)
                        if v24._pendingExecuteList then
                            v24:_reject({
                                ...
                            }, select("#", ...));
                        end;
                    end, 
                    nil
                };
                return;
            elseif v27._rejected then
                v27._unconsumedException = false;
                v24:_reject(v27._rejected, v27._valuesLength);
                return;
            elseif v27._fulfilled then
                v24:_fulfill(v27._fulfilled, v27._valuesLength);
                return;
            else
                error("[Promise.Resolve] - Bad promise2 state");
                return;
            end;
        elseif type(...) == "function" then
            if v25 > 1 then
                local v28 = ("When resolving a function, extra arguments are discarded! See:\n\n%s"):format(v24._source);
                warn(v28);
            end;
            ({
                ...
            })(v24:_getResolveReject());
            return;
        else
            v24:_fulfill({
                ...
            }, v25);
            return;
        end;
    end;
end;
v3._fulfill = function(v29, v30, v31) --[[ Line: 191 ]] --[[ Name: _fulfill ]]
    if not v29._pendingExecuteList then
        return;
    else
        v29._fulfilled = v30;
        v29._valuesLength = v31;
        local l__pendingExecuteList_0 = v29._pendingExecuteList;
        v29._pendingExecuteList = nil;
        for _, v34 in pairs(l__pendingExecuteList_0) do
            v29:_executeThen(unpack(v34));
        end;
        return;
    end;
end;
v3.Reject = function(v35, ...) --[[ Line: 206 ]] --[[ Name: Reject ]]
    v35:_reject({
        ...
    }, select("#", ...));
end;
v3._reject = function(v36, v37, v38) --[[ Line: 210 ]] --[[ Name: _reject ]]
    -- upvalues: l_RunService_0 (copy)
    if not v36._pendingExecuteList then
        return;
    else
        v36._rejected = v37;
        v36._valuesLength = v38;
        local l__pendingExecuteList_1 = v36._pendingExecuteList;
        v36._pendingExecuteList = nil;
        for _, v41 in pairs(l__pendingExecuteList_1) do
            v36:_executeThen(unpack(v41));
        end;
        if v36._unconsumedException and v36._valuesLength > 0 then
            coroutine.resume(coroutine.create(function() --[[ Line: 225 ]]
                -- upvalues: l_RunService_0 (ref), v36 (copy)
                l_RunService_0.Heartbeat:Wait();
                if v36._unconsumedException then
                    warn(("[Promise] - Uncaught exception in promise: %q"):format((tostring(v36._rejected[1]))));
                end;
            end));
        end;
        return;
    end;
end;
v3.Then = function(v42, v43, v44) --[[ Line: 241 ]] --[[ Name: Then ]]
    -- upvalues: v3 (copy)
    if type(v44) == "function" then
        v42._unconsumedException = false;
    end;
    if v42._pendingExecuteList then
        local v45 = v3.new();
        v42._pendingExecuteList[#v42._pendingExecuteList + 1] = {
            v43, 
            v44, 
            v45
        };
        return v45;
    else
        return v42:_executeThen(v43, v44, nil);
    end;
end;
v3.Tap = function(v46, v47, v48) --[[ Line: 255 ]] --[[ Name: Tap ]]
    local v49 = v46:Then(v47, v48);
    if v49 == v46 then
        return v49;
    elseif v49._fulfilled then
        return v46;
    elseif v49._rejected then
        return v46;
    elseif v49._pendingExecuteList then
        local function v50() --[[ Line: 267 ]] --[[ Name: returnSelf ]]
            -- upvalues: v46 (copy)
            return v46;
        end;
        return v49:Then(v50, v50);
    else
        error("Bad result state");
        return;
    end;
end;
v3.Finally = function(v51, v52) --[[ Line: 277 ]] --[[ Name: Finally ]]
    return v51:Then(v52, v52);
end;
v3.Catch = function(v53, v54) --[[ Line: 281 ]] --[[ Name: Catch ]]
    return v53:Then(nil, v54);
end;
v3.Destroy = function(v55) --[[ Line: 285 ]] --[[ Name: Destroy ]]
    v55:_reject({}, 0);
end;
v3.GetResults = function(v56) --[[ Line: 289 ]] --[[ Name: GetResults ]]
    if v56._rejected then
        return false, unpack(v56._rejected, 1, v56._valuesLength);
    elseif v56._fulfilled then
        return true, unpack(v56._fulfilled, 1, v56._valuesLength);
    else
        error("Still pending");
        return;
    end;
end;
v3._getResolveReject = function(v57) --[[ Line: 299 ]] --[[ Name: _getResolveReject ]]
    return function(...) --[[ Line: 300 ]]
        -- upvalues: v57 (copy)
        v57:Resolve(...);
    end, function(...) --[[ Line: 302 ]]
        -- upvalues: v57 (copy)
        v57:_reject({
            ...
        }, select("#", ...));
    end;
end;
v3._executeThen = function(v58, v59, v60, v61) --[[ Line: 307 ]] --[[ Name: _executeThen ]]
    -- upvalues: v2 (ref), v3 (copy)
    if v58._fulfilled then
        if type(v59) == "function" then
            if v61 then
                v61:Resolve(v59(unpack(v58._fulfilled, 1, v58._valuesLength)));
                return v61;
            else
                local v62 = table.pack(v59(unpack(v58._fulfilled, 1, v58._valuesLength)));
                if v62.n == 0 then
                    return v2;
                elseif v62.n == 1 and v3.isPromise(v62[1]) then
                    return v62[1];
                else
                    local v63 = v3.new();
                    v63:Resolve(table.unpack(v62, 1, v62.n));
                    return v63;
                end;
            end;
        elseif v61 then
            v61:_fulfill(v58._fulfilled, v58._valuesLength);
            return v61;
        else
            return v58;
        end;
    elseif v58._rejected then
        if type(v60) == "function" then
            if v61 then
                v61:Resolve(v60(unpack(v58._rejected, 1, v58._valuesLength)));
                return v61;
            else
                local v64 = table.pack(v60(unpack(v58._rejected, 1, v58._valuesLength)));
                if v64.n == 0 then
                    return v2;
                elseif v64.n == 1 and v3.isPromise(v64[1]) then
                    return v64[1];
                else
                    local v65 = v3.new();
                    v65:Resolve(table.unpack(v64, 1, v64.n));
                    return v65;
                end;
            end;
        elseif v61 then
            v61:_reject(v58._rejected, v58._valuesLength);
            return v61;
        else
            return v58;
        end;
    else
        error("Internal error: still pending");
        return;
    end;
end;
v2 = v3.new();
v2:_fulfill({}, 0);
v1 = v3.new();
v1:_reject({}, 0);
return v3;