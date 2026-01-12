local v0 = require(script.Parent.loader).load(script);
local v1 = v0("Brio");
local v2 = v0("BrioUtils");
local v3 = v0("Maid");
local v4 = v0("Observable");
local v5 = v0("Rx");
local v57 = {
    toBrio = function() --[[ Line: 24 ]] --[[ Name: toBrio ]]
        -- upvalues: v5 (copy), v1 (copy)
        return v5.map(function(v6) --[[ Line: 25 ]]
            -- upvalues: v1 (ref)
            if v1.isBrio(v6) then
                return v6;
            else
                return v1.new(v6);
            end;
        end);
    end, 
    completeOnDeath = function(v7, v8) --[[ Line: 41 ]] --[[ Name: completeOnDeath ]]
        -- upvalues: v1 (copy), v4 (copy)
        assert(v1.isBrio(v7));
        assert(v4.isObservable(v8));
        return v4.new(function(v9) --[[ Line: 45 ]]
            -- upvalues: v7 (copy), v8 (copy)
            if v7:IsDead() then
                v9:Complete();
                return;
            else
                local v10 = v7:ToMaid();
                v10:GiveTask(function() --[[ Line: 53 ]]
                    -- upvalues: v9 (copy)
                    v9:Complete();
                end);
                v10:GiveTask(v8:Subscribe(v9:GetFireFailComplete()));
                return v10;
            end;
        end);
    end, 
    emitWhileAllDead = function(v11) --[[ Line: 69 ]] --[[ Name: emitWhileAllDead ]]
        -- upvalues: v4 (copy), v3 (copy), v2 (copy), v1 (copy)
        return function(v12) --[[ Line: 70 ]]
            -- upvalues: v4 (ref), v3 (ref), v2 (ref), v1 (ref), v11 (copy)
            return v4.new(function(v13) --[[ Line: 71 ]]
                -- upvalues: v3 (ref), v2 (ref), v1 (ref), v11 (ref), v12 (copy)
                local v14 = v3.new();
                local v15 = true;
                v14:GiveTask(function() --[[ Line: 75 ]]
                    -- upvalues: v15 (ref)
                    v15 = false;
                end);
                local v16 = {};
                local v17 = false;
                local function _() --[[ Line: 81 ]] --[[ Name: updateBrios ]]
                    -- upvalues: v15 (ref), v16 (ref), v2 (ref), v14 (copy), v1 (ref), v11 (ref), v13 (copy), v17 (ref)
                    if not v15 then
                        return;
                    else
                        v16 = v2.aliveOnly(v16);
                        if next(v16) then
                            v14._lastBrio = nil;
                        else
                            local v18 = v1.new(v11);
                            v14._lastBrio = v18;
                            v13:Fire(v18);
                        end;
                        v17 = true;
                        return;
                    end;
                end;
                local function v24(v20) --[[ Line: 98 ]] --[[ Name: handleNewBrio ]]
                    -- upvalues: v3 (ref), v14 (copy), v15 (ref), v16 (ref), v2 (ref), v1 (ref), v11 (ref), v13 (copy), v17 (ref)
                    if v20:IsDead() then
                        return;
                    else
                        local v21 = v3.new();
                        v14[v21] = v21;
                        v21:GiveTask(function() --[[ Line: 107 ]]
                            -- upvalues: v14 (ref), v21 (copy), v15 (ref), v16 (ref), v2 (ref), v1 (ref), v11 (ref), v13 (ref), v17 (ref)
                            v14[v21] = nil;
                            if not v15 then
                                return;
                            else
                                v16 = v2.aliveOnly(v16);
                                if next(v16) then
                                    v14._lastBrio = nil;
                                else
                                    local v22 = v1.new(v11);
                                    v14._lastBrio = v22;
                                    v13:Fire(v22);
                                end;
                                v17 = true;
                                return;
                            end;
                        end);
                        v21:GiveTask(v20:GetDiedSignal():Connect(function() --[[ Line: 111 ]]
                            -- upvalues: v14 (ref), v21 (copy)
                            v14[v21] = nil;
                        end));
                        table.insert(v16, v20);
                        if not v15 then
                            return;
                        else
                            v16 = v2.aliveOnly(v16);
                            if next(v16) then
                                v14._lastBrio = nil;
                            else
                                local v23 = v1.new(v11);
                                v14._lastBrio = v23;
                                v13:Fire(v23);
                            end;
                            v17 = true;
                            return;
                        end;
                    end;
                end;
                v14:GiveTask(v12:Subscribe(function(v25) --[[ Line: 120 ]]
                    -- upvalues: v1 (ref), v14 (copy), v13 (copy), v24 (copy)
                    if not v1.isBrio(v25) then
                        warn(("[RxBrioUtils.emitWhileAllDead] - Not a brio, %q"):format((tostring(v25))));
                        v14._lastBrio = nil;
                        v13:Fail("Not a brio");
                        return;
                    else
                        v24(v25);
                        return;
                    end;
                end, function(...) --[[ Line: 130 ]]
                    -- upvalues: v13 (copy)
                    v13:Fail(...);
                end, function(...) --[[ Line: 133 ]]
                    -- upvalues: v13 (copy)
                    v13:Complete(...);
                end));
                if not v17 and v15 then
                    v16 = v2.aliveOnly(v16);
                    if next(v16) then
                        v14._lastBrio = nil;
                    else
                        local v26 = v1.new(v11);
                        v14._lastBrio = v26;
                        v13:Fire(v26);
                    end;
                    v17 = true;
                end;
                return v14;
            end);
        end;
    end, 
    reduceToAliveList = function(v27) --[[ Line: 153 ]] --[[ Name: reduceToAliveList ]]
        -- upvalues: v4 (copy), v3 (copy), v2 (copy), v1 (copy)
        local v28 = true;
        if type(v27) ~= "function" then
            v28 = v27 == nil;
        end;
        assert(v28, "Bad selectFromBrio");
        return function(v29) --[[ Line: 156 ]]
            -- upvalues: v4 (ref), v3 (ref), v2 (ref), v27 (copy), v1 (ref)
            return v4.new(function(v30) --[[ Line: 157 ]]
                -- upvalues: v3 (ref), v2 (ref), v27 (ref), v29 (copy), v1 (ref)
                local v31 = v3.new();
                local v32 = true;
                v31:GiveTask(function() --[[ Line: 161 ]]
                    -- upvalues: v32 (ref)
                    v32 = false;
                end);
                local v33 = {};
                local v34 = false;
                local function v43() --[[ Line: 167 ]] --[[ Name: updateBrios ]]
                    -- upvalues: v32 (ref), v33 (ref), v2 (ref), v27 (ref), v31 (copy), v34 (ref), v30 (copy)
                    if not v32 then
                        return;
                    else
                        v33 = v2.aliveOnly(v33);
                        local v35 = {};
                        if v27 then
                            for _, v37 in pairs(v33) do
                                local v38 = v27(v37:GetValue());
                                assert(v38 ~= nil, "Bad value");
                                table.insert(v35, v38);
                            end;
                        else
                            for _, v40 in pairs(v33) do
                                local l_v40_Value_0 = v40:GetValue();
                                assert(l_v40_Value_0 ~= nil, "Bad value");
                                table.insert(v35, l_v40_Value_0);
                            end;
                        end;
                        local v42 = v2.first(v33, v35);
                        v31._lastBrio = v42;
                        v34 = true;
                        v30:Fire(v42);
                        return;
                    end;
                end;
                local function v46(v44) --[[ Line: 198 ]] --[[ Name: handleNewBrio ]]
                    -- upvalues: v3 (ref), v31 (copy), v43 (copy), v33 (ref)
                    if v44:IsDead() then
                        return;
                    else
                        local v45 = v3.new();
                        v31[v45] = v45;
                        v45:GiveTask(function() --[[ Line: 207 ]]
                            -- upvalues: v31 (ref), v45 (copy), v43 (ref)
                            v31[v45] = nil;
                            v43();
                        end);
                        v45:GiveTask(v44:GetDiedSignal():Connect(function() --[[ Line: 211 ]]
                            -- upvalues: v31 (ref), v45 (copy)
                            v31[v45] = nil;
                        end));
                        table.insert(v33, v44);
                        v43();
                        return;
                    end;
                end;
                v31:GiveTask(v29:Subscribe(function(v47) --[[ Line: 220 ]]
                    -- upvalues: v1 (ref), v31 (copy), v30 (copy), v46 (copy)
                    if not v1.isBrio(v47) then
                        warn(("[RxBrioUtils.mergeToAliveList] - Not a brio, %q"):format((tostring(v47))));
                        v31._lastBrio = nil;
                        v30:Fail("Not a brio");
                        return;
                    else
                        v46(v47);
                        return;
                    end;
                end, function(...) --[[ Line: 230 ]]
                    -- upvalues: v30 (copy)
                    v30:Fail(...);
                end, function(...) --[[ Line: 233 ]]
                    -- upvalues: v30 (copy)
                    v30:Complete(...);
                end));
                if not v34 then
                    v43();
                end;
                return v31;
            end);
        end;
    end, 
    reemitLastBrioOnDeath = function() --[[ Line: 252 ]] --[[ Name: reemitLastBrioOnDeath ]]
        -- upvalues: v4 (copy), v3 (copy), v1 (copy)
        return function(v48) --[[ Line: 253 ]]
            -- upvalues: v4 (ref), v3 (ref), v1 (ref)
            return v4.new(function(v49) --[[ Line: 254 ]]
                -- upvalues: v3 (ref), v48 (copy), v1 (ref)
                local v50 = v3.new();
                v50:GiveTask(v48:Subscribe(function(v51) --[[ Line: 258 ]]
                    -- upvalues: v50 (copy), v1 (ref), v49 (copy)
                    v50._conn = nil;
                    if not v1.isBrio(v51) then
                        warn(("[RxBrioUtils.reemitLastBrioOnDeath] - Not a brio, %q"):format((tostring(v51))));
                        v49:Fail("Not a brio");
                        return;
                    elseif v51:IsDead() then
                        v49:Fire(v51);
                        return;
                    else
                        v50._conn = v51:GetDiedSignal():Connect(function() --[[ Line: 273 ]]
                            -- upvalues: v49 (ref), v51 (copy)
                            v49:Fire(v51);
                        end);
                        v49:Fire(v51);
                        return;
                    end;
                end, function(...) --[[ Line: 279 ]]
                    -- upvalues: v49 (copy)
                    v49:Fail(...);
                end, function(...) --[[ Line: 282 ]]
                    -- upvalues: v49 (copy)
                    v49:Complete(...);
                end));
                return v50;
            end);
        end;
    end, 
    where = function(v52) --[[ Line: 299 ]] --[[ Name: where ]]
        -- upvalues: v4 (copy), v3 (copy), v1 (copy)
        assert(type(v52) == "function", "Bad predicate");
        return function(v53) --[[ Line: 301 ]]
            -- upvalues: v4 (ref), v3 (ref), v1 (ref), v52 (copy)
            return v4.new(function(v54) --[[ Line: 302 ]]
                -- upvalues: v3 (ref), v53 (copy), v1 (ref), v52 (ref)
                local v55 = v3.new();
                v55:GiveTask(v53:Subscribe(function(v56) --[[ Line: 305 ]]
                    -- upvalues: v1 (ref), v52 (ref), v54 (copy)
                    assert(v1.isBrio(v56), "Not a brio");
                    if v56:IsDead() then
                        return;
                    else
                        if v52(v56:GetValue()) then
                            v54:Fire(v56);
                        end;
                        return;
                    end;
                end, v54:GetFailComplete()));
                return v55;
            end);
        end;
    end
};
v57.filter = v57.where;
v57.combineLatest = function(v58) --[[ Line: 340 ]] --[[ Name: combineLatest ]]
    -- upvalues: v5 (copy), v2 (copy), v57 (copy)
    assert(type(v58) == "table", "Bad observables");
    warn("[RxBrioUtils.combineLatest] - Deprecated since 3.6.0. Use RxBrioUtils.flatCombineLatest");
    return v5.combineLatest(v58):Pipe({
        v5.map(v2.flatten), 
        v57.onlyLastBrioSurvives()
    });
end;
v57.flatMap = function(v59, v60) --[[ Line: 361 ]] --[[ Name: flatMap ]]
    -- upvalues: v5 (copy), v57 (copy)
    assert(type(v59) == "function", "Bad project");
    warn("[RxBrioUtils.flatMap] - Deprecated since 3.6.0. Use RxBrioUtils.flatMapBrio");
    return v5.flatMap(v57.mapBrio(v59), v60);
end;
v57.flatMapBrio = function(v61) --[[ Line: 381 ]] --[[ Name: flatMapBrio ]]
    -- upvalues: v5 (copy), v57 (copy)
    return v5.flatMap(v57.mapBrioBrio(v61));
end;
v57.switchMap = function(v62) --[[ Line: 393 ]] --[[ Name: switchMap ]]
    -- upvalues: v5 (copy), v57 (copy)
    assert(type(v62) == "function", "Bad project");
    warn("[RxBrioUtils.switchMap] - Deprecated since 3.6.0. Use RxBrioUtils.switchMapBrio");
    return v5.switchMap(v57.mapBrio(v62));
end;
v57.switchMapBrio = function(v63) --[[ Line: 413 ]] --[[ Name: switchMapBrio ]]
    -- upvalues: v5 (copy), v57 (copy)
    assert(type(v63) == "function", "Bad project");
    return v5.switchMap(v57.mapBrioBrio(v63));
end;
v57.flatCombineLatest = function(v64) --[[ Line: 437 ]] --[[ Name: flatCombineLatest ]]
    -- upvalues: v4 (copy), v57 (copy), v5 (copy)
    assert(type(v64) == "table", "Bad observables");
    local v65 = {};
    for v66, v67 in pairs(v64) do
        if v4.isObservable(v67) then
            v65[v66] = v57.flattenToValueAndNil(v67);
        else
            v65[v66] = v67;
        end;
    end;
    return v5.combineLatest(v65);
end;
v57.mapBrio = function(v68) --[[ Line: 460 ]] --[[ Name: mapBrio ]]
    -- upvalues: v1 (copy), v5 (copy), v4 (copy), v57 (copy)
    assert(type(v68) == "function", "Bad project");
    warn("[RxBrioUtils.mapBrio] - Deprecated since 3.6.0. Use RxBrioUtils.mapBrioBrio");
    return function(v69) --[[ Line: 465 ]]
        -- upvalues: v1 (ref), v5 (ref), v68 (copy), v4 (ref), v57 (ref)
        assert(v1.isBrio(v69), "Not a brio");
        if v69:IsDead() then
            return v5.EMPTY;
        else
            local v70 = v68(v69:GetValue());
            assert(v4.isObservable(v70), "Not an observable");
            return v57.completeOnDeath(v69, v70);
        end;
    end;
end;
v57.prepend = function(...) --[[ Line: 485 ]] --[[ Name: prepend ]]
    -- upvalues: v5 (copy), v1 (copy), v2 (copy)
    local v71 = table.pack(...);
    return v5.map(function(v72) --[[ Line: 488 ]]
        -- upvalues: v1 (ref), v2 (ref), v71 (copy)
        assert(v1.isBrio(v72), "Bad brio");
        return v2.prepend(v72, table.unpack(v71, 1, v71.n));
    end);
end;
v57.extend = function(...) --[[ Line: 501 ]] --[[ Name: extend ]]
    -- upvalues: v5 (copy), v1 (copy), v2 (copy)
    local v73 = table.pack(...);
    return v5.map(function(v74) --[[ Line: 504 ]]
        -- upvalues: v1 (ref), v2 (ref), v73 (copy)
        assert(v1.isBrio(v74), "Bad brio");
        return v2.extend(v74, table.unpack(v73, 1, v73.n));
    end);
end;
v57.map = function(v75) --[[ Line: 517 ]] --[[ Name: map ]]
    -- upvalues: v5 (copy), v1 (copy), v2 (copy)
    return v5.map(function(...) --[[ Line: 518 ]]
        -- upvalues: v1 (ref), v75 (copy), v2 (ref)
        local v76 = select("#", ...);
        local v77 = {};
        local v78 = nil;
        if v76 == 1 then
            if v1.isBrio(...) then
                table.insert(v77, (...));
                v78 = (...):GetPackedValues();
            else
                v78 = {
                    [1] = ...
                };
            end;
        else
            v78 = {};
            for v79, v80 in pairs({
                ...
            }) do
                if v1.isBrio(v80) then
                    table.insert(v77, v80);
                    v78[v79] = v80:GetValue();
                else
                    v78[v79] = v80;
                end;
            end;
            v78.n = v76;
        end;
        local v81 = table.pack(v75(table.unpack(v78, 1, v78.n)));
        local v82 = {};
        for v83 = 1, v81.n do
            local v84 = v81[v83];
            if v1.isBrio(v84) then
                table.insert(v77, v84);
                v82[v83] = v84:GetValue();
            else
                v82[v83] = v84;
            end;
        end;
        return v2.first(v77, table.unpack(v82, 1, v82.n));
    end);
end;
v57._mapResult = function(v85) --[[ Line: 559 ]] --[[ Name: _mapResult ]]
    -- upvalues: v2 (copy), v1 (copy)
    return function(...) --[[ Line: 560 ]]
        -- upvalues: v2 (ref), v85 (copy), v1 (ref)
        local v86 = select("#", ...);
        if v86 == 0 then
            return v2.withOtherValues(v85);
        elseif v86 == 1 then
            if v1.isBrio(...) then
                return v2.first({
                    v85, 
                    (...)
                }, (...):GetValue());
            else
                return v2.withOtherValues(v85, ...);
            end;
        else
            local v87 = {
                v85
            };
            local v88 = {};
            for v89, v90 in pairs({
                ...
            }) do
                if v1.isBrio(v90) then
                    table.insert(v87, v90);
                    v88[v89] = v90:GetValue();
                else
                    v88[v89] = v90;
                end;
            end;
            return v2.first(v87, unpack(v88, 1, v86));
        end;
    end;
end;
v57.mapBrioBrio = function(v91) --[[ Line: 596 ]] --[[ Name: mapBrioBrio ]]
    -- upvalues: v1 (copy), v5 (copy), v4 (copy), v57 (copy)
    assert(type(v91) == "function", "Bad project");
    return function(v92) --[[ Line: 599 ]]
        -- upvalues: v1 (ref), v5 (ref), v91 (copy), v4 (ref), v57 (ref)
        assert(v1.isBrio(v92), "Not a brio");
        if v92:IsDead() then
            return v5.EMPTY;
        else
            local v93 = v91(v92:GetValue());
            assert(v4.isObservable(v93), "Not an observable");
            return v57.completeOnDeath(v92, v93):Pipe({
                v5.map(v57._mapResult(v92))
            });
        end;
    end;
end;
v57.toEmitOnDeathObservable = function(v94, v95) --[[ Line: 621 ]] --[[ Name: toEmitOnDeathObservable ]]
    -- upvalues: v1 (copy), v5 (copy), v4 (copy)
    if not v1.isBrio(v94) then
        return v5.of(v94);
    else
        return v4.new(function(v96) --[[ Line: 625 ]]
            -- upvalues: v94 (copy), v95 (copy)
            if v94:IsDead() then
                v96:Fire(v95);
                v96:Complete();
                return;
            else
                v96:Fire(v94:GetValue());
                return v94:GetDiedSignal():Connect(function() --[[ Line: 631 ]]
                    -- upvalues: v96 (copy), v95 (ref)
                    v96:Fire(v95);
                    v96:Complete();
                end);
            end;
        end);
    end;
end;
v57.mapBrioToEmitOnDeathObservable = function(v97) --[[ Line: 646 ]] --[[ Name: mapBrioToEmitOnDeathObservable ]]
    -- upvalues: v57 (copy)
    return function(v98) --[[ Line: 647 ]]
        -- upvalues: v57 (ref), v97 (copy)
        return v57.toEmitOnDeathObservable(v98, v97);
    end;
end;
v57.emitOnDeath = function(v99) --[[ Line: 659 ]] --[[ Name: emitOnDeath ]]
    -- upvalues: v5 (copy), v57 (copy)
    return v5.switchMap(v57.mapBrioToEmitOnDeathObservable(v99));
end;
v57.flattenToValueAndNil = v57.emitOnDeath(nil);
v57.onlyLastBrioSurvives = function() --[[ Line: 678 ]] --[[ Name: onlyLastBrioSurvives ]]
    -- upvalues: v4 (copy), v3 (copy), v1 (copy), v2 (copy)
    return function(v100) --[[ Line: 679 ]]
        -- upvalues: v4 (ref), v3 (ref), v1 (ref), v2 (ref)
        return v4.new(function(v101) --[[ Line: 680 ]]
            -- upvalues: v3 (ref), v100 (copy), v1 (ref), v2 (ref)
            local v102 = v3.new();
            v102:GiveTask(v100:Subscribe(function(v103) --[[ Line: 683 ]]
                -- upvalues: v1 (ref), v102 (copy), v101 (copy), v2 (ref)
                if not v1.isBrio(v103) then
                    warn(("[RxBrioUtils.onlyLastBrioSurvives] - Not a brio, %q"):format((tostring(v103))));
                    v102._lastBrio = nil;
                    v101:Fail("Not a brio");
                    return;
                else
                    local v104 = v2.clone(v103);
                    v102._lastBrio = v104;
                    v101:Fire(v104);
                    return;
                end;
            end, v101:GetFailComplete()));
            return v102;
        end);
    end;
end;
v57.switchToBrio = v5.pipe({
    v57.toBrio(), 
    v57.onlyLastBrioSurvives()
});
return v57;