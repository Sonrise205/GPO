local v0 = {
    __mode = "k"
};
local function _(v1) --[[ Line: 10 ]] --[[ Name: isCallable ]]
    if type(v1) == "function" then
        return true;
    else
        if type(v1) == "table" then
            local v2 = getmetatable(v1);
            if v2 and type((rawget(v2, "__call"))) == "function" then
                return true;
            end;
        end;
        return false;
    end;
end;
local function v11(v4, v5) --[[ Line: 28 ]] --[[ Name: makeEnum ]]
    local v6 = {};
    for _, v8 in ipairs(v5) do
        v6[v8] = v8;
    end;
    return (setmetatable(v6, {
        __index = function(_, v10) --[[ Line: 36 ]] --[[ Name: __index ]]
            -- upvalues: v4 (copy)
            error(string.format("%s is not in %s!", v10, v4), 2);
        end, 
        __newindex = function() --[[ Line: 39 ]] --[[ Name: __newindex ]]
            -- upvalues: v4 (copy)
            error(string.format("Creating new members in %s is not allowed!", v4), 2);
        end
    }));
end;
local v12 = nil;
v12 = {
    Kind = v11("Promise.Error.Kind", {
        "ExecutionError", 
        "AlreadyCancelled", 
        "NotResolvedInTime", 
        "TimedOut"
    })
};
v12.__index = v12;
v12.new = function(v13, v14) --[[ Line: 64 ]] --[[ Name: new ]]
    -- upvalues: v12 (ref)
    v13 = v13 or {};
    return (setmetatable({
        error = tostring(v13.error) or "[This error has no error text.]", 
        trace = v13.trace, 
        context = v13.context, 
        kind = v13.kind, 
        parent = v14, 
        createdTick = os.clock(), 
        createdTrace = debug.traceback()
    }, v12));
end;
v12.is = function(v15) --[[ Line: 77 ]] --[[ Name: is ]]
    if type(v15) == "table" then
        local v16 = getmetatable(v15);
        if type(v16) == "table" then
            local v17 = false;
            if rawget(v15, "error") ~= nil then
                v17 = type((rawget(v16, "extend"))) == "function";
            end;
            return v17;
        end;
    end;
    return false;
end;
v12.isKind = function(v18, v19) --[[ Line: 89 ]] --[[ Name: isKind ]]
    -- upvalues: v12 (ref)
    assert(v19 ~= nil, "Argument #2 to Promise.Error.isKind must not be nil");
    return v12.is(v18) and v18.kind == v19;
end;
v12.extend = function(v20, v21) --[[ Line: 95 ]] --[[ Name: extend ]]
    -- upvalues: v12 (ref)
    v21 = v21 or {};
    v21.kind = v21.kind or v20.kind;
    return v12.new(v21, v20);
end;
v12.getErrorChain = function(v22) --[[ Line: 103 ]] --[[ Name: getErrorChain ]]
    local v23 = {
        v22
    };
    while v23[#v23].parent do
        table.insert(v23, v23[#v23].parent);
    end;
    return v23;
end;
v12.__tostring = function(v24) --[[ Line: 113 ]] --[[ Name: __tostring ]]
    local v25 = {
        string.format("-- Promise.Error(%s) --", v24.kind or "?")
    };
    for _, v27 in ipairs(v24:getErrorChain()) do
        table.insert(v25, table.concat({
            v27.trace or v27.error, 
            v27.context
        }, "\n"));
    end;
    return table.concat(v25, "\n");
end;
local function v28(...) --[[ Line: 137 ]] --[[ Name: pack ]]
    return select("#", ...), {
        ...
    };
end;
local function v30(v29, ...) --[[ Line: 144 ]] --[[ Name: packResult ]]
    return v29, select("#", ...), {
        ...
    };
end;
local function _(v31) --[[ Line: 148 ]] --[[ Name: makeErrorHandler ]]
    -- upvalues: v12 (ref)
    assert(v31 ~= nil, "traceback is nil");
    return function(v32) --[[ Line: 151 ]]
        -- upvalues: v12 (ref), v31 (copy)
        if type(v32) == "table" then
            return v32;
        else
            return v12.new({
                error = v32, 
                kind = v12.Kind.ExecutionError, 
                trace = debug.traceback(tostring(v32), 2), 
                context = "Promise created at:\n\n" .. v31
            });
        end;
    end;
end;
local function v40(v34, v35, ...) --[[ Line: 171 ]] --[[ Name: runExecutor ]]
    -- upvalues: v30 (copy), v12 (ref)
    local l_v30_0 = v30;
    local l_xpcall_0 = xpcall;
    local l_v35_0 = v35;
    assert(v34 ~= nil, "traceback is nil");
    return l_v30_0(l_xpcall_0(l_v35_0, function(v39) --[[ Line: 151 ]]
        -- upvalues: v12 (ref), v34 (copy)
        if type(v39) == "table" then
            return v39;
        else
            return v12.new({
                error = v39, 
                kind = v12.Kind.ExecutionError, 
                trace = debug.traceback(tostring(v39), 2), 
                context = "Promise created at:\n\n" .. v34
            });
        end;
    end, ...));
end;
local function _(v41, v42, v43, v44) --[[ Line: 179 ]] --[[ Name: createAdvancer ]]
    -- upvalues: v40 (copy)
    return function(...) --[[ Line: 180 ]]
        -- upvalues: v40 (ref), v41 (copy), v42 (copy), v43 (copy), v44 (copy)
        local v45, v46, v47 = v40(v41, v42, ...);
        if v45 then
            v43(unpack(v47, 1, v46));
            return;
        else
            v44(v47[1]);
            return;
        end;
    end;
end;
local function _(v49) --[[ Line: 191 ]] --[[ Name: isEmpty ]]
    return next(v49) == nil;
end;
local v51 = {
    Error = v12, 
    Status = v11("Promise.Status", {
        "Started", 
        "Resolved", 
        "Rejected", 
        "Cancelled"
    }), 
    _getTime = os.clock, 
    _timeEvent = game:GetService("RunService").Heartbeat, 
    _unhandledRejectionCallbacks = {}, 
    prototype = {}
};
v51.__index = v51.prototype;
v51._new = function(v52, v53, v54) --[[ Line: 230 ]] --[[ Name: _new ]]
    -- upvalues: v51 (copy), v0 (copy), v40 (copy)
    if v54 ~= nil and not v51.is(v54) then
        error("Argument #2 to Promise.new must be a promise or nil", 2);
    end;
    local v55 = {
        _thread = nil, 
        _source = v52, 
        _status = v51.Status.Started, 
        _values = nil, 
        _valuesLength = -1, 
        _unhandledRejection = true, 
        _queuedResolve = {}, 
        _queuedReject = {}, 
        _queuedFinally = {}, 
        _cancellationHook = nil, 
        _parent = v54, 
        _consumers = setmetatable({}, v0)
    };
    if v54 and v54._status == v51.Status.Started then
        v54._consumers[v55] = true;
    end;
    setmetatable(v55, v51);
    local function v56(...) --[[ Line: 278 ]] --[[ Name: resolve ]]
        -- upvalues: v55 (copy)
        v55:_resolve(...);
    end;
    local function v57(...) --[[ Line: 282 ]] --[[ Name: reject ]]
        -- upvalues: v55 (copy)
        v55:_reject(...);
    end;
    local function v59(v58) --[[ Line: 286 ]] --[[ Name: onCancel ]]
        -- upvalues: v55 (copy), v51 (ref)
        if v58 then
            if v55._status == v51.Status.Cancelled then
                v58();
            else
                v55._cancellationHook = v58;
            end;
        end;
        return v55._status == v51.Status.Cancelled;
    end;
    v55._thread = coroutine.create(function() --[[ Line: 298 ]]
        -- upvalues: v40 (ref), v55 (copy), v53 (copy), v56 (copy), v57 (copy), v59 (copy)
        local v60, _, v62 = v40(v55._source, v53, v56, v57, v59);
        if not v60 then
            v57(v62[1]);
        end;
    end);
    task.spawn(v55._thread);
    return v55;
end;
v51.new = function(v63) --[[ Line: 349 ]] --[[ Name: new ]]
    -- upvalues: v51 (copy)
    return v51._new(debug.traceback(nil, 2), v63);
end;
v51.__tostring = function(v64) --[[ Line: 353 ]] --[[ Name: __tostring ]]
    return string.format("Promise(%s)", v64._status);
end;
v51.defer = function(v65) --[[ Line: 375 ]] --[[ Name: defer ]]
    -- upvalues: v51 (copy), v40 (copy)
    local v66 = debug.traceback(nil, 2);
    local _ = nil;
    return (v51._new(v66, function(v68, v69, v70) --[[ Line: 378 ]]
        -- upvalues: v40 (ref), v66 (copy), v65 (copy)
        task.defer(function() --[[ Line: 379 ]]
            -- upvalues: v40 (ref), v66 (ref), v65 (ref), v68 (copy), v69 (copy), v70 (copy)
            local v71, _, v73 = v40(v66, v65, v68, v69, v70);
            if not v71 then
                v69(v73[1]);
            end;
        end);
    end));
end;
v51.async = v51.defer;
v51.resolve = function(...) --[[ Line: 416 ]] --[[ Name: resolve ]]
    -- upvalues: v28 (copy), v51 (copy)
    local v74, v75 = v28(...);
    return v51._new(debug.traceback(nil, 2), function(v76) --[[ Line: 418 ]]
        -- upvalues: v75 (copy), v74 (copy)
        v76(unpack(v75, 1, v74));
    end);
end;
v51.reject = function(...) --[[ Line: 433 ]] --[[ Name: reject ]]
    -- upvalues: v28 (copy), v51 (copy)
    local v77, v78 = v28(...);
    return v51._new(debug.traceback(nil, 2), function(_, v80) --[[ Line: 435 ]]
        -- upvalues: v78 (copy), v77 (copy)
        v80(unpack(v78, 1, v77));
    end);
end;
v51._try = function(v81, v82, ...) --[[ Line: 444 ]] --[[ Name: _try ]]
    -- upvalues: v28 (copy), v51 (copy)
    local v83, v84 = v28(...);
    return v51._new(v81, function(v85) --[[ Line: 447 ]]
        -- upvalues: v82 (copy), v84 (copy), v83 (copy)
        v85(v82(unpack(v84, 1, v83)));
    end);
end;
v51.try = function(v86, ...) --[[ Line: 475 ]] --[[ Name: try ]]
    -- upvalues: v51 (copy)
    return v51._try(debug.traceback(nil, 2), v86, ...);
end;
v51._all = function(v87, v88, v89) --[[ Line: 484 ]] --[[ Name: _all ]]
    -- upvalues: v51 (copy)
    if type(v88) ~= "table" then
        error(string.format("Please pass a list of promises to %s", "Promise.all"), 3);
    end;
    for v90, v91 in pairs(v88) do
        if not v51.is(v91) then
            error(string.format("Non-promise value passed into %s at index %s", "Promise.all", (tostring(v90))), 3);
        end;
    end;
    if #v88 == 0 or v89 == 0 then
        return v51.resolve({});
    else
        return v51._new(v87, function(v92, v93, v94) --[[ Line: 502 ]]
            -- upvalues: v89 (copy), v88 (copy)
            local v95 = {};
            local v96 = {};
            local v97 = 0;
            local v98 = 0;
            local v99 = false;
            local function v102() --[[ Line: 513 ]] --[[ Name: cancel ]]
                -- upvalues: v96 (copy)
                for _, v101 in ipairs(v96) do
                    v101:cancel();
                end;
            end;
            local function v106(v103, ...) --[[ Line: 520 ]] --[[ Name: resolveOne ]]
                -- upvalues: v99 (ref), v97 (ref), v89 (ref), v95 (copy), v88 (ref), v92 (copy), v96 (copy)
                if v99 then
                    return;
                else
                    v97 = v97 + 1;
                    if v89 == nil then
                        v95[v103] = ...;
                    else
                        v95[v97] = ...;
                    end;
                    if v97 >= (v89 or #v88) then
                        v99 = true;
                        v92(v95);
                        for _, v105 in ipairs(v96) do
                            v105:cancel();
                        end;
                    end;
                    return;
                end;
            end;
            v94(v102);
            for v107, v108 in ipairs(v88) do
                v96[v107] = v108:andThen(function(...) --[[ Line: 545 ]]
                    -- upvalues: v106 (copy), v107 (copy)
                    v106(v107, ...);
                end, function(...) --[[ Line: 547 ]]
                    -- upvalues: v98 (ref), v89 (ref), v88 (ref), v96 (copy), v99 (ref), v93 (copy)
                    v98 = v98 + 1;
                    if v89 == nil or #v88 - v98 < v89 then
                        for _, v110 in ipairs(v96) do
                            v110:cancel();
                        end;
                        v99 = true;
                        v93(...);
                    end;
                end);
            end;
            if v99 then
                for _, v112 in ipairs(v96) do
                    v112:cancel();
                end;
            end;
        end);
    end;
end;
v51.all = function(v113) --[[ Line: 589 ]] --[[ Name: all ]]
    -- upvalues: v51 (copy)
    return v51._all(debug.traceback(nil, 2), v113);
end;
v51.fold = function(v114, v115, v116) --[[ Line: 618 ]] --[[ Name: fold ]]
    -- upvalues: v51 (copy)
    local v117 = false;
    assert(type(v114) == "table", "Bad argument #1 to Promise.fold: must be a table");
    local v118;
    if type(v115) == "function" then
        v118 = true;
    else
        if type(v115) == "table" then
            local v119 = getmetatable(v115);
            if v119 and type((rawget(v119, "__call"))) == "function" then
                v118 = true;
                v117 = true;
            end;
        end;
        if not v117 then
            v118 = false;
        end;
    end;
    v117 = false;
    assert(v118, "Bad argument #2 to Promise.fold: must be a function");
    local v120 = v51.resolve(v116);
    return v51.each(v114, function(v121, v122) --[[ Line: 623 ]]
        -- upvalues: v120 (ref), v115 (copy)
        v120 = v120:andThen(function(v123) --[[ Line: 624 ]]
            -- upvalues: v115 (ref), v121 (copy), v122 (copy)
            return v115(v123, v121, v122);
        end);
    end):andThen(function() --[[ Line: 627 ]]
        -- upvalues: v120 (ref)
        return v120;
    end);
end;
v51.some = function(v124, v125) --[[ Line: 651 ]] --[[ Name: some ]]
    -- upvalues: v51 (copy)
    assert(type(v125) == "number", "Bad argument #2 to Promise.some: must be a number");
    return v51._all(debug.traceback(nil, 2), v124, v125);
end;
v51.any = function(v126) --[[ Line: 675 ]] --[[ Name: any ]]
    -- upvalues: v51 (copy)
    return v51._all(debug.traceback(nil, 2), v126, 1):andThen(function(v127) --[[ Line: 676 ]]
        return v127[1];
    end);
end;
v51.allSettled = function(v128) --[[ Line: 697 ]] --[[ Name: allSettled ]]
    -- upvalues: v51 (copy)
    if type(v128) ~= "table" then
        error(string.format("Please pass a list of promises to %s", "Promise.allSettled"), 2);
    end;
    for v129, v130 in pairs(v128) do
        if not v51.is(v130) then
            error(string.format("Non-promise value passed into %s at index %s", "Promise.allSettled", (tostring(v129))), 2);
        end;
    end;
    if #v128 == 0 then
        return v51.resolve({});
    else
        return v51._new(debug.traceback(nil, 2), function(v131, _, v133) --[[ Line: 715 ]]
            -- upvalues: v128 (copy)
            local v134 = {};
            local v135 = {};
            local v136 = 0;
            local function v138(v137, ...) --[[ Line: 725 ]] --[[ Name: resolveOne ]]
                -- upvalues: v136 (ref), v134 (copy), v128 (ref), v131 (copy)
                v136 = v136 + 1;
                v134[v137] = ...;
                if v136 >= #v128 then
                    v131(v134);
                end;
            end;
            v133(function() --[[ Line: 735 ]]
                -- upvalues: v135 (copy)
                for _, v140 in ipairs(v135) do
                    v140:cancel();
                end;
            end);
            for v141, v142 in ipairs(v128) do
                v135[v141] = v142:finally(function(...) --[[ Line: 744 ]]
                    -- upvalues: v138 (copy), v141 (copy)
                    v138(v141, ...);
                end);
            end;
        end);
    end;
end;
v51.race = function(v143) --[[ Line: 775 ]] --[[ Name: race ]]
    -- upvalues: v51 (copy)
    assert(type(v143) == "table", string.format("Please pass a list of promises to %s", "Promise.race"));
    for v144, v145 in pairs(v143) do
        assert(v51.is(v145), string.format("Non-promise value passed into %s at index %s", "Promise.race", (tostring(v144))));
    end;
    return v51._new(debug.traceback(nil, 2), function(v146, v147, v148) --[[ Line: 782 ]]
        -- upvalues: v143 (copy)
        local v149 = {};
        local v150 = false;
        local _ = function() --[[ Line: 786 ]] --[[ Name: cancel ]]
            -- upvalues: v149 (copy)
            for _, v152 in ipairs(v149) do
                v152:cancel();
            end;
        end;
        local _ = function(v154) --[[ Line: 792 ]] --[[ Name: finalize ]]
            -- upvalues: v149 (copy), v150 (ref)
            return function(...) --[[ Line: 793 ]]
                -- upvalues: v149 (ref), v150 (ref), v154 (copy)
                for _, v156 in ipairs(v149) do
                    v156:cancel();
                end;
                v150 = true;
                return v154(...);
            end;
        end;
        if v148(function(...) --[[ Line: 793 ]]
            -- upvalues: v149 (copy), v150 (ref), v147 (copy)
            for _, v159 in ipairs(v149) do
                v159:cancel();
            end;
            v150 = true;
            return v147(...);
        end) then
            return;
        else
            for v160, v161 in ipairs(v143) do
                v149[v160] = v161:andThen(function(...) --[[ Line: 793 ]]
                    -- upvalues: v149 (copy), v150 (ref), v146 (copy)
                    for _, v163 in ipairs(v149) do
                        v163:cancel();
                    end;
                    v150 = true;
                    return v146(...);
                end, function(...) --[[ Line: 793 ]]
                    -- upvalues: v149 (copy), v150 (ref), v147 (copy)
                    for _, v165 in ipairs(v149) do
                        v165:cancel();
                    end;
                    v150 = true;
                    return v147(...);
                end);
            end;
            if v150 then
                for _, v167 in ipairs(v149) do
                    v167:cancel();
                end;
            end;
            return;
        end;
    end);
end;
v51.each = function(v168, v169) --[[ Line: 870 ]] --[[ Name: each ]]
    -- upvalues: v51 (copy), v12 (ref)
    local v170 = false;
    assert(type(v168) == "table", string.format("Please pass a list of promises to %s", "Promise.each"));
    local v171;
    if type(v169) == "function" then
        v171 = true;
    else
        if type(v169) == "table" then
            local v172 = getmetatable(v169);
            if v172 and type((rawget(v172, "__call"))) == "function" then
                v171 = true;
                v170 = true;
            end;
        end;
        if not v170 then
            v171 = false;
        end;
    end;
    v170 = false;
    assert(v171, string.format("Please pass a handler function to %s!", "Promise.each"));
    return v51._new(debug.traceback(nil, 2), function(v173, v174, v175) --[[ Line: 874 ]]
        -- upvalues: v168 (copy), v51 (ref), v12 (ref), v169 (copy)
        local v176 = {};
        local v177 = {};
        local v178 = false;
        local _ = function() --[[ Line: 880 ]] --[[ Name: cancel ]]
            -- upvalues: v177 (copy)
            for _, v180 in ipairs(v177) do
                v180:cancel();
            end;
        end;
        v175(function() --[[ Line: 886 ]]
            -- upvalues: v178 (ref), v177 (copy)
            v178 = true;
            for _, v183 in ipairs(v177) do
                v183:cancel();
            end;
        end);
        local v184 = {};
        for v185, v186 in ipairs(v168) do
            if v51.is(v186) then
                if v186:getStatus() == v51.Status.Cancelled then
                    for _, v188 in ipairs(v177) do
                        v188:cancel();
                    end;
                    return v174(v12.new({
                        error = "Promise is cancelled", 
                        kind = v12.Kind.AlreadyCancelled, 
                        context = string.format("The Promise that was part of the array at index %d passed into Promise.each was already cancelled when Promise.each began.\n\nThat Promise was created at:\n\n%s", v185, v186._source)
                    }));
                elseif v186:getStatus() == v51.Status.Rejected then
                    for _, v190 in ipairs(v177) do
                        v190:cancel();
                    end;
                    return v174(select(2, v186:await()));
                else
                    local v191 = v186:andThen(function(...) --[[ Line: 919 ]]
                        return ...;
                    end);
                    table.insert(v177, v191);
                    v184[v185] = v191;
                end;
            else
                v184[v185] = v186;
            end;
        end;
        for v192, v193 in ipairs(v184) do
            if v51.is(v193) then
                local v194 = nil;
                local v195, v196 = v193:await();
                v194 = v195;
                v193 = v196;
                if not v194 then
                    for _, v198 in ipairs(v177) do
                        v198:cancel();
                    end;
                    return v174(v193);
                end;
            end;
            if v178 then
                return;
            else
                local v199 = v51.resolve(v169(v193, v192));
                table.insert(v177, v199);
                local v200, v201 = v199:await();
                if not v200 then
                    for _, v203 in ipairs(v177) do
                        v203:cancel();
                    end;
                    return v174(v201);
                else
                    v176[v192] = v201;
                end;
            end;
        end;
        v173(v176);
    end);
end;
v51.is = function(v204) --[[ Line: 969 ]] --[[ Name: is ]]
    -- upvalues: v51 (copy)
    local v205 = false;
    if type(v204) ~= "table" then
        return false;
    else
        local v206 = getmetatable(v204);
        if v206 == v51 then
            return true;
        elseif v206 == nil then
            local l_andThen_0 = v204.andThen;
            if type(l_andThen_0) == "function" then
                return true;
            else
                if type(l_andThen_0) == "table" then
                    local v208 = getmetatable(l_andThen_0);
                    if v208 and type((rawget(v208, "__call"))) == "function" then
                        return true;
                    end;
                end;
                return false;
            end;
        else
            if type(v206) == "table" and type((rawget(v206, "__index"))) == "table" then
                local v209 = rawget(rawget(v206, "__index"), "andThen");
                local v210;
                if type(v209) == "function" then
                    v210 = true;
                else
                    if type(v209) == "table" then
                        local v211 = getmetatable(v209);
                        if v211 and type((rawget(v211, "__call"))) == "function" then
                            v210 = true;
                            v205 = true;
                        end;
                    end;
                    if not v205 then
                        v210 = false;
                    end;
                end;
                v205 = false;
                if v210 then
                    return true;
                end;
            end;
            return false;
        end;
    end;
end;
v51.promisify = function(v212) --[[ Line: 1018 ]] --[[ Name: promisify ]]
    -- upvalues: v51 (copy)
    return function(...) --[[ Line: 1019 ]]
        -- upvalues: v51 (ref), v212 (copy)
        return v51._try(debug.traceback(nil, 2), v212, ...);
    end;
end;
v51.delay = function(v213) --[[ Line: 1042 ]] --[[ Name: delay ]]
    -- upvalues: v51 (copy)
    assert(type(v213) == "number", "Bad argument #1 to Promise.delay, must be a number.");
    local v214 = v51._getTime();
    return v51._new(debug.traceback(nil, 2), function(v215) --[[ Line: 1045 ]]
        -- upvalues: v213 (copy), v51 (ref), v214 (copy)
        task.delay(v213, function() --[[ Line: 1046 ]]
            -- upvalues: v215 (copy), v51 (ref), v214 (ref)
            v215(v51._getTime() - v214);
        end);
    end);
end;
local function v220(v216, v217, v218) --[[ Line: 1090 ]] --[[ Name: timeout ]]
    -- upvalues: v51 (copy), v12 (ref)
    local v219 = debug.traceback(nil, 2);
    return v51.race({
        v51.delay(v217):andThen(function() --[[ Line: 1094 ]]
            -- upvalues: v51 (ref), v218 (copy), v12 (ref), v217 (copy), v219 (copy)
            return v51.reject(v218 == nil and v12.new({
                kind = v12.Kind.TimedOut, 
                error = "Timed out", 
                context = string.format("Timeout of %d seconds exceeded.\n:timeout() called at:\n\n%s", v217, v219)
            }) or v218);
        end), 
        v216
    });
end;
v51.prototype.timeout = v220;
v51.prototype.getStatus = function(v221) --[[ Line: 1114 ]] --[[ Name: getStatus ]]
    return v221._status;
end;
v51.prototype._andThen = function(v222, v223, v224, v225) --[[ Line: 1123 ]] --[[ Name: _andThen ]]
    -- upvalues: v51 (copy), v40 (copy)
    v222._unhandledRejection = false;
    if v222._status == v51.Status.Cancelled then
        local v226 = v51.new(function() --[[ Line: 1128 ]]

        end);
        v226:cancel();
        return v226;
    else
        return v51._new(v223, function(v227, v228, v229) --[[ Line: 1135 ]]
            -- upvalues: v224 (copy), v223 (copy), v40 (ref), v225 (copy), v222 (copy), v51 (ref)
            local l_v227_0 = v227;
            if v224 then
                local l_v223_0 = v223;
                local l_v224_0 = v224;
                local l_l_v223_0_0 = l_v223_0 --[[ copy: 4 -> 7 ]];
                local l_l_v224_0_0 = l_v224_0 --[[ copy: 5 -> 8 ]];
                l_v227_0 = function(...) --[[ Line: 180 ]]
                    -- upvalues: v40 (ref), l_l_v223_0_0 (copy), l_l_v224_0_0 (copy), v227 (copy), v228 (copy)
                    local v235, v236, v237 = v40(l_l_v223_0_0, l_l_v224_0_0, ...);
                    if v235 then
                        v227(unpack(v237, 1, v236));
                        return;
                    else
                        v228(v237[1]);
                        return;
                    end;
                end;
            end;
            local l_v228_0 = v228;
            if v225 then
                local l_v223_1 = v223;
                local l_v225_0 = v225;
                l_v228_0 = function(...) --[[ Line: 180 ]]
                    -- upvalues: v40 (ref), l_v223_1 (copy), l_v225_0 (copy), v227 (copy), v228 (copy)
                    local v241, v242, v243 = v40(l_v223_1, l_v225_0, ...);
                    if v241 then
                        v227(unpack(v243, 1, v242));
                        return;
                    else
                        v228(v243[1]);
                        return;
                    end;
                end;
            end;
            if v222._status == v51.Status.Started then
                table.insert(v222._queuedResolve, l_v227_0);
                table.insert(v222._queuedReject, l_v228_0);
                v229(function() --[[ Line: 1154 ]]
                    -- upvalues: v222 (ref), v51 (ref), l_v227_0 (ref), l_v228_0 (ref)
                    if v222._status == v51.Status.Started then
                        table.remove(v222._queuedResolve, table.find(v222._queuedResolve, l_v227_0));
                        table.remove(v222._queuedReject, table.find(v222._queuedReject, l_v228_0));
                    end;
                end);
            elseif v222._status == v51.Status.Resolved then
                l_v227_0(unpack(v222._values, 1, v222._valuesLength));
            elseif v222._status == v51.Status.Rejected then
                l_v228_0(unpack(v222._values, 1, v222._valuesLength));
            end;
        end, v222);
    end;
end;
v51.prototype.andThen = function(v244, v245, v246) --[[ Line: 1193 ]] --[[ Name: andThen ]]
    local v247 = false;
    local v248 = false;
    local v249 = true;
    if v245 ~= nil then
        if type(v245) == "function" then
            v249 = true;
        else
            if type(v245) == "table" then
                local v250 = getmetatable(v245);
                if v250 and type((rawget(v250, "__call"))) == "function" then
                    v249 = true;
                    v247 = true;
                end;
            end;
            if not v247 then
                v249 = false;
            end;
        end;
    end;
    v247 = false;
    assert(v249, string.format("Please pass a handler function to %s!", "Promise:andThen"));
    v249 = true;
    if v246 ~= nil then
        if type(v246) == "function" then
            v249 = true;
        else
            if type(v246) == "table" then
                local v251 = getmetatable(v246);
                if v251 and type((rawget(v251, "__call"))) == "function" then
                    v249 = true;
                    v248 = true;
                end;
            end;
            if not v248 then
                v249 = false;
            end;
        end;
    end;
    v248 = false;
    assert(v249, string.format("Please pass a handler function to %s!", "Promise:andThen"));
    return v244:_andThen(debug.traceback(nil, 2), v245, v246);
end;
v51.prototype.catch = function(v252, v253) --[[ Line: 1220 ]] --[[ Name: catch ]]
    local v254 = false;
    local v255 = true;
    if v253 ~= nil then
        if type(v253) == "function" then
            v255 = true;
        else
            if type(v253) == "table" then
                local v256 = getmetatable(v253);
                if v256 and type((rawget(v256, "__call"))) == "function" then
                    v255 = true;
                    v254 = true;
                end;
            end;
            if not v254 then
                v255 = false;
            end;
        end;
    end;
    v254 = false;
    assert(v255, string.format("Please pass a handler function to %s!", "Promise:catch"));
    return v252:_andThen(debug.traceback(nil, 2), nil, v253);
end;
v51.prototype.tap = function(v257, v258) --[[ Line: 1241 ]] --[[ Name: tap ]]
    -- upvalues: v51 (copy), v28 (copy)
    local v259 = false;
    local v260;
    if type(v258) == "function" then
        v260 = true;
    else
        if type(v258) == "table" then
            local v261 = getmetatable(v258);
            if v261 and type((rawget(v261, "__call"))) == "function" then
                v260 = true;
                v259 = true;
            end;
        end;
        if not v259 then
            v260 = false;
        end;
    end;
    v259 = false;
    assert(v260, string.format("Please pass a handler function to %s!", "Promise:tap"));
    return v257:_andThen(debug.traceback(nil, 2), function(...) --[[ Line: 1243 ]]
        -- upvalues: v258 (copy), v51 (ref), v28 (ref)
        local v262 = v258(...);
        if v51.is(v262) then
            local v263, v264 = v28(...);
            return v262:andThen(function() --[[ Line: 1248 ]]
                -- upvalues: v264 (copy), v263 (copy)
                return unpack(v264, 1, v263);
            end);
        else
            return ...;
        end;
    end);
end;
v51.prototype.andThenCall = function(v265, v266, ...) --[[ Line: 1276 ]] --[[ Name: andThenCall ]]
    -- upvalues: v28 (copy)
    local v267 = false;
    local v268;
    if type(v266) == "function" then
        v268 = true;
    else
        if type(v266) == "table" then
            local v269 = getmetatable(v266);
            if v269 and type((rawget(v269, "__call"))) == "function" then
                v268 = true;
                v267 = true;
            end;
        end;
        if not v267 then
            v268 = false;
        end;
    end;
    v267 = false;
    assert(v268, string.format("Please pass a handler function to %s!", "Promise:andThenCall"));
    local v270;
    v270, v268 = v28(...);
    return v265:_andThen(debug.traceback(nil, 2), function() --[[ Line: 1279 ]]
        -- upvalues: v266 (copy), v268 (copy), v270 (copy)
        return v266(unpack(v268, 1, v270));
    end);
end;
v51.prototype.andThenReturn = function(v271, ...) --[[ Line: 1306 ]] --[[ Name: andThenReturn ]]
    -- upvalues: v28 (copy)
    local v272, v273 = v28(...);
    return v271:_andThen(debug.traceback(nil, 2), function() --[[ Line: 1308 ]]
        -- upvalues: v273 (copy), v272 (copy)
        return unpack(v273, 1, v272);
    end);
end;
v51.prototype.cancel = function(v274) --[[ Line: 1324 ]] --[[ Name: cancel ]]
    -- upvalues: v51 (copy)
    if v274._status ~= v51.Status.Started then
        return;
    else
        v274._status = v51.Status.Cancelled;
        if v274._cancellationHook then
            v274._cancellationHook();
        end;
        coroutine.close(v274._thread);
        if v274._parent then
            v274._parent:_consumerCancelled(v274);
        end;
        for v275 in pairs(v274._consumers) do
            v275:cancel();
        end;
        v274:_finalize();
        return;
    end;
end;
v51.prototype._consumerCancelled = function(v276, v277) --[[ Line: 1352 ]] --[[ Name: _consumerCancelled ]]
    -- upvalues: v51 (copy)
    if v276._status ~= v51.Status.Started then
        return;
    else
        v276._consumers[v277] = nil;
        if next(v276._consumers) == nil then
            v276:cancel();
        end;
        return;
    end;
end;
v51.prototype._finally = function(v278, v279, v280) --[[ Line: 1368 ]] --[[ Name: _finally ]]
    -- upvalues: v51 (copy), v40 (copy)
    v278._unhandledRejection = false;
    return (v51._new(v279, function(v281, v282, v283) --[[ Line: 1371 ]]
        -- upvalues: v278 (copy), v280 (copy), v40 (ref), v279 (copy), v51 (ref)
        local v284 = nil;
        v283(function() --[[ Line: 1374 ]]
            -- upvalues: v278 (ref), v284 (ref)
            v278:_consumerCancelled(v278);
            if v284 then
                v284:cancel();
            end;
        end);
        local l_v281_0 = v281;
        if v280 then
            l_v281_0 = function(...) --[[ Line: 1387 ]]
                -- upvalues: v40 (ref), v279 (ref), v280 (ref), v282 (copy), v51 (ref), v284 (ref), v281 (copy), v278 (ref)
                local v286, _, v288 = v40(v279, v280, ...);
                local v289 = v288[1];
                if not v286 then
                    return v282(v289);
                elseif v51.is(v289) then
                    v284 = v289;
                    v289:finally(function(v290) --[[ Line: 1398 ]]
                        -- upvalues: v51 (ref), v281 (ref), v278 (ref)
                        if v290 ~= v51.Status.Rejected then
                            v281(v278);
                        end;
                    end):catch(function(...) --[[ Line: 1403 ]]
                        -- upvalues: v282 (ref)
                        v282(...);
                    end);
                    return;
                else
                    v281(v278);
                    return;
                end;
            end;
        end;
        if v278._status == v51.Status.Started then
            table.insert(v278._queuedFinally, l_v281_0);
        else
            l_v281_0(v278._status);
        end;
    end));
end;
v51.prototype.finally = function(v291, v292) --[[ Line: 1473 ]] --[[ Name: finally ]]
    local v293 = false;
    local v294 = true;
    if v292 ~= nil then
        if type(v292) == "function" then
            v294 = true;
        else
            if type(v292) == "table" then
                local v295 = getmetatable(v292);
                if v295 and type((rawget(v295, "__call"))) == "function" then
                    v294 = true;
                    v293 = true;
                end;
            end;
            if not v293 then
                v294 = false;
            end;
        end;
    end;
    v293 = false;
    assert(v294, string.format("Please pass a handler function to %s!", "Promise:finally"));
    return v291:_finally(debug.traceback(nil, 2), v292);
end;
v51.prototype.finallyCall = function(v296, v297, ...) --[[ Line: 1487 ]] --[[ Name: finallyCall ]]
    -- upvalues: v28 (copy)
    local v298 = false;
    local v299;
    if type(v297) == "function" then
        v299 = true;
    else
        if type(v297) == "table" then
            local v300 = getmetatable(v297);
            if v300 and type((rawget(v300, "__call"))) == "function" then
                v299 = true;
                v298 = true;
            end;
        end;
        if not v298 then
            v299 = false;
        end;
    end;
    v298 = false;
    assert(v299, string.format("Please pass a handler function to %s!", "Promise:finallyCall"));
    local v301;
    v301, v299 = v28(...);
    return v296:_finally(debug.traceback(nil, 2), function() --[[ Line: 1490 ]]
        -- upvalues: v297 (copy), v299 (copy), v301 (copy)
        return v297(unpack(v299, 1, v301));
    end);
end;
v51.prototype.finallyReturn = function(v302, ...) --[[ Line: 1513 ]] --[[ Name: finallyReturn ]]
    -- upvalues: v28 (copy)
    local v303, v304 = v28(...);
    return v302:_finally(debug.traceback(nil, 2), function() --[[ Line: 1515 ]]
        -- upvalues: v304 (copy), v303 (copy)
        return unpack(v304, 1, v303);
    end);
end;
v51.prototype.awaitStatus = function(v305) --[[ Line: 1527 ]] --[[ Name: awaitStatus ]]
    -- upvalues: v51 (copy)
    v305._unhandledRejection = false;
    if v305._status == v51.Status.Started then
        local v306 = coroutine.running();
        v305:finally(function() --[[ Line: 1534 ]]
            -- upvalues: v306 (copy)
            task.spawn(v306);
        end):catch(function() --[[ Line: 1540 ]]

        end);
        coroutine.yield();
    end;
    if v305._status == v51.Status.Resolved then
        return v305._status, unpack(v305._values, 1, v305._valuesLength);
    elseif v305._status == v51.Status.Rejected then
        return v305._status, unpack(v305._values, 1, v305._valuesLength);
    else
        return v305._status;
    end;
end;
v220 = function(v307, ...) --[[ Line: 1555 ]] --[[ Name: awaitHelper ]]
    -- upvalues: v51 (copy)
    return v307 == v51.Status.Resolved, ...;
end;
v51.prototype.await = function(v308) --[[ Line: 1580 ]] --[[ Name: await ]]
    -- upvalues: v220 (copy)
    return v220(v308:awaitStatus());
end;
local function v310(v309, ...) --[[ Line: 1584 ]] --[[ Name: expectHelper ]]
    -- upvalues: v51 (copy)
    if v309 ~= v51.Status.Resolved then
        error(... == nil and "Expected Promise rejected with no value." or ..., 3);
    end;
    return ...;
end;
v51.prototype.expect = function(v311) --[[ Line: 1617 ]] --[[ Name: expect ]]
    -- upvalues: v310 (copy)
    return v310(v311:awaitStatus());
end;
v51.prototype.awaitValue = v51.prototype.expect;
v51.prototype._unwrap = function(v312) --[[ Line: 1631 ]] --[[ Name: _unwrap ]]
    -- upvalues: v51 (copy)
    if v312._status == v51.Status.Started then
        error("Promise has not resolved or rejected.", 2);
    end;
    return v312._status == v51.Status.Resolved, unpack(v312._values, 1, v312._valuesLength);
end;
local function v322(v313, ...) --[[ Line: 1641 ]] --[[ Name: _resolve ]]
    -- upvalues: v51 (copy), v12 (ref), v28 (copy)
    if v313._status ~= v51.Status.Started then
        if v51.is((...)) then
            (...):_consumerCancelled(v313);
        end;
        return;
    elseif v51.is((...)) then
        if select("#", ...) > 1 then
            local v314 = string.format("When returning a Promise from andThen, extra arguments are discarded! See:\n\n%s", v313._source);
            warn(v314);
        end;
        local v315 = ...;
        local v317 = v315:andThen(function(...) --[[ Line: 1662 ]]
            -- upvalues: v313 (copy)
            v313:_resolve(...);
        end, function(...) --[[ Line: 1664 ]]
            -- upvalues: v315 (copy), v12 (ref), v313 (copy)
            local v316 = v315._values[1];
            if v315._error then
                v316 = v12.new({
                    error = v315._error, 
                    kind = v12.Kind.ExecutionError, 
                    context = "[No stack trace available as this Promise originated from an older version of the Promise library (< v2)]"
                });
            end;
            if v12.isKind(v316, v12.Kind.ExecutionError) then
                return v313:_reject(v316:extend({
                    error = "This Promise was chained to a Promise that errored.", 
                    trace = "", 
                    context = string.format("The Promise at:\n\n%s\n...Rejected because it was chained to the following Promise, which encountered an error:\n", v313._source)
                }));
            else
                v313:_reject(...);
                return;
            end;
        end);
        if v317._status == v51.Status.Cancelled then
            v313:cancel();
            return;
        else
            if v317._status == v51.Status.Started then
                v313._parent = v317;
                v317._consumers[v313] = true;
            end;
            return;
        end;
    else
        v313._status = v51.Status.Resolved;
        local v318, v319 = v28(...);
        v313._valuesLength = v318;
        v313._values = v319;
        for _, v321 in ipairs(v313._queuedResolve) do
            coroutine.wrap(v321)(...);
        end;
        v313:_finalize();
        return;
    end;
end;
v51.prototype._resolve = v322;
v51.prototype._reject = function(v323, ...) --[[ Line: 1712 ]] --[[ Name: _reject ]]
    -- upvalues: v51 (copy), v28 (copy)
    if v323._status ~= v51.Status.Started then
        return;
    else
        v323._status = v51.Status.Rejected;
        local v324, v325 = v28(...);
        v323._valuesLength = v324;
        v323._values = v325;
        v325 = v323._queuedReject;
        if not (next(v325) == nil) then
            for _, v327 in ipairs(v323._queuedReject) do
                coroutine.wrap(v327)(...);
            end;
        else
            v324 = tostring((...));
            coroutine.wrap(function() --[[ Line: 1734 ]]
                -- upvalues: v51 (ref), v323 (copy), v324 (copy)
                v51._timeEvent:Wait();
                if not v323._unhandledRejection then
                    return;
                else
                    local v328 = string.format("Unhandled Promise rejection:\n\n%s\n\n%s", v324, v323._source);
                    for _, v330 in ipairs(v51._unhandledRejectionCallbacks) do
                        task.spawn(v330, v323, unpack(v323._values, 1, v323._valuesLength));
                    end;
                    if v51.TEST then
                        return;
                    else
                        warn(v328);
                        return;
                    end;
                end;
            end)();
        end;
        v323:_finalize();
        return;
    end;
end;
v51.prototype._finalize = function(v331) --[[ Line: 1766 ]] --[[ Name: _finalize ]]
    -- upvalues: v51 (copy)
    for _, v333 in ipairs(v331._queuedFinally) do
        coroutine.wrap(v333)(v331._status);
    end;
    v331._queuedFinally = nil;
    v331._queuedReject = nil;
    v331._queuedResolve = nil;
    if not v51.TEST then
        v331._parent = nil;
        v331._consumers = nil;
    end;
    task.defer(coroutine.close, v331._thread);
end;
v322 = function(v334, v335) --[[ Line: 1803 ]] --[[ Name: now ]]
    -- upvalues: v51 (copy), v12 (ref)
    local v336 = debug.traceback(nil, 2);
    if v334._status == v51.Status.Resolved then
        return v334:_andThen(v336, function(...) --[[ Line: 1806 ]]
            return ...;
        end);
    else
        return v51.reject(v335 == nil and v12.new({
            kind = v12.Kind.NotResolvedInTime, 
            error = "This Promise was not resolved in time for :now()", 
            context = ":now() was called at:\n\n" .. v336
        }) or v335);
    end;
end;
v51.prototype.now = v322;
v51.retry = function(v337, v338, ...) --[[ Line: 1848 ]] --[[ Name: retry ]]
    -- upvalues: v51 (copy)
    local v339 = false;
    local v340;
    if type(v337) == "function" then
        v340 = true;
    else
        if type(v337) == "table" then
            local v341 = getmetatable(v337);
            if v341 and type((rawget(v341, "__call"))) == "function" then
                v340 = true;
                v339 = true;
            end;
        end;
        if not v339 then
            v340 = false;
        end;
    end;
    v339 = false;
    assert(v340, "Parameter #1 to Promise.retry must be a function");
    assert(type(v338) == "number", "Parameter #2 to Promise.retry must be a number");
    local v342 = {
        ...
    };
    v340 = select("#", ...);
    return v51.resolve(v337(...)):catch(function(...) --[[ Line: 1854 ]]
        -- upvalues: v338 (copy), v51 (ref), v337 (copy), v342 (copy), v340 (copy)
        if v338 > 0 then
            return v51.retry(v337, v338 - 1, unpack(v342, 1, v340));
        else
            return v51.reject(...);
        end;
    end);
end;
v51.retryWithDelay = function(v343, v344, v345, ...) --[[ Line: 1876 ]] --[[ Name: retryWithDelay ]]
    -- upvalues: v51 (copy)
    local v346 = false;
    local v347;
    if type(v343) == "function" then
        v347 = true;
    else
        if type(v343) == "table" then
            local v348 = getmetatable(v343);
            if v348 and type((rawget(v348, "__call"))) == "function" then
                v347 = true;
                v346 = true;
            end;
        end;
        if not v346 then
            v347 = false;
        end;
    end;
    v346 = false;
    assert(v347, "Parameter #1 to Promise.retry must be a function");
    assert(type(v344) == "number", "Parameter #2 (times) to Promise.retry must be a number");
    assert(type(v345) == "number", "Parameter #3 (seconds) to Promise.retry must be a number");
    local v349 = {
        ...
    };
    v347 = select("#", ...);
    return v51.resolve(v343(...)):catch(function(...) --[[ Line: 1883 ]]
        -- upvalues: v344 (copy), v51 (ref), v345 (copy), v343 (copy), v349 (copy), v347 (copy)
        if v344 > 0 then
            v51.delay(v345):await();
            return v51.retryWithDelay(v343, v344 - 1, v345, unpack(v349, 1, v347));
        else
            return v51.reject(...);
        end;
    end);
end;
v51.fromEvent = function(v350, v351) --[[ Line: 1918 ]] --[[ Name: fromEvent ]]
    -- upvalues: v51 (copy)
    v351 = v351 or function() --[[ Line: 1919 ]]
        return true;
    end;
    return v51._new(debug.traceback(nil, 2), function(v352, _, v354) --[[ Line: 1923 ]]
        -- upvalues: v350 (copy), v351 (ref)
        local v355 = nil;
        local v356 = false;
        local function v357() --[[ Line: 1927 ]] --[[ Name: disconnect ]]
            -- upvalues: v355 (ref)
            v355:Disconnect();
            v355 = nil;
        end;
        v355 = v350:Connect(function(...) --[[ Line: 1936 ]]
            -- upvalues: v351 (ref), v352 (copy), v355 (ref), v356 (ref)
            local v358 = v351(...);
            if v358 == true then
                v352(...);
                if v355 then
                    v355:Disconnect();
                    v355 = nil;
                    return;
                else
                    v356 = true;
                    return;
                end;
            else
                if type(v358) ~= "boolean" then
                    error("Promise.fromEvent predicate should always return a boolean");
                end;
                return;
            end;
        end);
        if v356 and v355 then
            return v357();
        else
            v354(v357);
            return;
        end;
    end);
end;
v51.onUnhandledRejection = function(v359) --[[ Line: 1970 ]] --[[ Name: onUnhandledRejection ]]
    -- upvalues: v51 (copy)
    table.insert(v51._unhandledRejectionCallbacks, v359);
    return function() --[[ Line: 1973 ]]
        -- upvalues: v51 (ref), v359 (copy)
        local v360 = table.find(v51._unhandledRejectionCallbacks, v359);
        if v360 then
            table.remove(v51._unhandledRejectionCallbacks, v360);
        end;
    end;
end;
return v51;