local v0 = require(script.Parent.loader).load(script);
local v1 = v0("Maid");
local v2 = v0("Observable");
local v3 = v0("Promise");
local v4 = v0("Symbol");
local v5 = v0("Table");
local v6 = v0("ThrottledFunction");
local v7 = v0("cancellableDelay");
local v8 = v0("CancelToken");
local v9 = v4.named("unsetValue");
local v22 = {
    EMPTY = v2.new(function(v10) --[[ Line: 40 ]]
        v10:Complete();
    end), 
    NEVER = v2.new(function(_) --[[ Line: 43 ]]

    end), 
    pipe = function(v12) --[[ Line: 55 ]] --[[ Name: pipe ]]
        assert(type(v12) == "table", "Bad transformers");
        for v13, v14 in pairs(v12) do
            if type(v14) ~= "function" then
                error(("[Rx.pipe] Bad pipe value of type %q at index %q, expected function"):format(type(v14), (tostring(v13))));
            end;
        end;
        return function(v15) --[[ Line: 64 ]]
            -- upvalues: v12 (copy)
            assert(v15, "Bad source");
            local l_v15_0 = v15;
            for v17, v18 in pairs(v12) do
                l_v15_0 = v18(l_v15_0);
                if type(l_v15_0) ~= "table" or l_v15_0.ClassName ~= "Observable" then
                    error(("[Rx.pipe] - Failed to transform %q in pipe, made %q (%s)"):format(tostring(v17), tostring(l_v15_0), (tostring(type(l_v15_0) == "table" and l_v15_0.ClassName or ""))));
                end;
            end;
            return l_v15_0;
        end;
    end, 
    of = function(...) --[[ Line: 93 ]] --[[ Name: of ]]
        -- upvalues: v2 (copy)
        local v19 = table.pack(...);
        return v2.new(function(v20) --[[ Line: 96 ]]
            -- upvalues: v19 (copy)
            for v21 = 1, v19.n do
                v20:Fire(v19[v21]);
            end;
            v20:Complete();
        end);
    end
};
v22.from = function(v23) --[[ Line: 112 ]] --[[ Name: from ]]
    -- upvalues: v3 (copy), v22 (copy)
    if v3.isPromise(v23) then
        return v22.fromPromise(v23);
    elseif type(v23) == "table" then
        return v22.of(unpack(v23));
    else
        error("[Rx.from] - cannot convert");
        return;
    end;
end;
v22.toPromise = function(v24, v25) --[[ Line: 129 ]] --[[ Name: toPromise ]]
    -- upvalues: v1 (copy), v8 (copy), v3 (copy)
    local v26 = v1.new();
    local v28 = v8.new(function(v27) --[[ Line: 132 ]]
        -- upvalues: v26 (copy), v25 (copy)
        v26:GiveTask(v27);
        if v25 then
            if v25:IsCancelled() then
                v27();
                return;
            else
                v26:GiveTask(v25.Cancelled:Connect(v27));
            end;
        end;
    end);
    local v31 = v3.new(function(v29, v30) --[[ Line: 143 ]]
        -- upvalues: v28 (copy), v26 (copy), v24 (copy)
        if v28:IsCancelled() then
            v30();
            return;
        else
            v26:GiveTask(v28.Cancelled:Connect(function() --[[ Line: 149 ]]
                -- upvalues: v30 (copy)
                v30();
            end));
            v26:GiveTask(v24:Subscribe(v29, v30, v30));
            return;
        end;
    end);
    v31:Finally(function() --[[ Line: 156 ]]
        -- upvalues: v26 (copy)
        v26:DoCleaning();
    end);
    return v31;
end;
v22.merge = function(v32) --[[ Line: 169 ]] --[[ Name: merge ]]
    -- upvalues: v2 (copy), v1 (copy)
    assert(type(v32) == "table", "Bad observables");
    for _, v34 in pairs(v32) do
        assert(v2.isObservable(v34), "Not an observable");
    end;
    return v2.new(function(v35) --[[ Line: 176 ]]
        -- upvalues: v1 (ref), v32 (copy)
        local v36 = v1.new();
        for _, v38 in pairs(v32) do
            v36:GiveTask(v38:Subscribe(v35:GetFireFailComplete()));
        end;
        return v36;
    end);
end;
v22.fromSignal = function(v39) --[[ Line: 194 ]] --[[ Name: fromSignal ]]
    -- upvalues: v2 (copy)
    return v2.new(function(v40) --[[ Line: 195 ]]
        -- upvalues: v39 (copy)
        return v39:Connect(function(...) --[[ Line: 197 ]]
            -- upvalues: v40 (copy)
            v40:Fire(...);
        end);
    end);
end;
v22.fromPromise = function(v41) --[[ Line: 210 ]] --[[ Name: fromPromise ]]
    -- upvalues: v3 (copy), v2 (copy), v1 (copy)
    assert(v3.isPromise(v41));
    return v2.new(function(v42) --[[ Line: 213 ]]
        -- upvalues: v41 (copy), v1 (ref)
        if v41:IsFulfilled() then
            v42:Fire(v41:Wait());
            v42:Complete();
            return nil;
        else
            local v43 = v1.new();
            local v44 = true;
            v43:GiveTask(function() --[[ Line: 223 ]]
                -- upvalues: v44 (ref)
                v44 = false;
            end);
            v41:Then(function(...) --[[ Line: 228 ]]
                -- upvalues: v44 (ref), v42 (copy)
                if v44 then
                    v42:Fire(...);
                    v42:Complete();
                end;
            end, function(...) --[[ Line: 234 ]]
                -- upvalues: v44 (ref), v42 (copy)
                if v44 then
                    v42:Fail(...);
                    v42:Complete();
                end;
            end);
            return v43;
        end;
    end);
end;
v22.tap = function(v45, v46, v47) --[[ Line: 256 ]] --[[ Name: tap ]]
    -- upvalues: v2 (copy)
    local v48 = true;
    if type(v45) ~= "function" then
        v48 = v45 == nil;
    end;
    assert(v48, "Bad onFire");
    v48 = true;
    if type(v46) ~= "function" then
        v48 = v46 == nil;
    end;
    assert(v48, "Bad onError");
    v48 = true;
    if type(v47) ~= "function" then
        v48 = v47 == nil;
    end;
    assert(v48, "Bad onComplete");
    return function(v49) --[[ Line: 261 ]]
        -- upvalues: v2 (ref), v45 (copy), v46 (copy), v47 (copy)
        assert(v2.isObservable(v49), "Bad observable");
        return v2.new(function(v50) --[[ Line: 264 ]]
            -- upvalues: v49 (copy), v45 (ref), v46 (ref), v47 (ref)
            return v49:Subscribe(function(...) --[[ Line: 266 ]]
                -- upvalues: v45 (ref), v50 (copy)
                if v45 then
                    v45(...);
                end;
                if v50:IsPending() then
                    v50:Fire(...);
                end;
            end, function(...) --[[ Line: 274 ]]
                -- upvalues: v46 (ref), v50 (copy)
                if v46 then
                    v46(...);
                end;
                v50:Error(...);
            end, function(...) --[[ Line: 280 ]]
                -- upvalues: v47 (ref), v50 (copy)
                if v47 then
                    v47(...);
                end;
                v50:Complete(...);
            end);
        end);
    end;
end;
v22.start = function(v51) --[[ Line: 298 ]] --[[ Name: start ]]
    -- upvalues: v2 (copy)
    return function(v52) --[[ Line: 299 ]]
        -- upvalues: v2 (ref), v51 (copy)
        assert(v2.isObservable(v52), "Bad observable");
        return v2.new(function(v53) --[[ Line: 302 ]]
            -- upvalues: v51 (ref), v52 (copy)
            v53:Fire(v51());
            return v52:Subscribe(v53:GetFireFailComplete());
        end);
    end;
end;
v22.startFrom = function(v54) --[[ Line: 316 ]] --[[ Name: startFrom ]]
    -- upvalues: v2 (copy)
    assert(type(v54) == "function", "Bad callback");
    return function(v55) --[[ Line: 318 ]]
        -- upvalues: v2 (ref), v54 (copy)
        assert(v2.isObservable(v55), "Bad observable");
        return v2.new(function(v56) --[[ Line: 321 ]]
            -- upvalues: v54 (ref), v55 (copy)
            for _, v58 in pairs(v54()) do
                v56:Fire(v58);
            end;
            return v55:Subscribe(v56:GetFireFailComplete());
        end);
    end;
end;
v22.startWith = function(v59) --[[ Line: 338 ]] --[[ Name: startWith ]]
    -- upvalues: v2 (copy)
    assert(type(v59) == "table", "Bad values");
    return function(v60) --[[ Line: 341 ]]
        -- upvalues: v2 (ref), v59 (copy)
        assert(v2.isObservable(v60), "Bad observable");
        return v2.new(function(v61) --[[ Line: 344 ]]
            -- upvalues: v59 (ref), v60 (copy)
            for _, v63 in pairs(v59) do
                v61:Fire(v63);
            end;
            return v60:Subscribe(v61:GetFireFailComplete());
        end);
    end;
end;
v22.defaultsTo = function(v64) --[[ Line: 366 ]] --[[ Name: defaultsTo ]]
    -- upvalues: v2 (copy), v1 (copy)
    return function(v65) --[[ Line: 367 ]]
        -- upvalues: v2 (ref), v1 (ref), v64 (copy)
        assert(v2.isObservable(v65), "Bad observable");
        return v2.new(function(v66) --[[ Line: 370 ]]
            -- upvalues: v1 (ref), v65 (copy), v64 (ref)
            local v67 = v1.new();
            local v68 = false;
            v67:GiveTask(v65:Subscribe(function(...) --[[ Line: 376 ]]
                -- upvalues: v68 (ref), v66 (copy)
                v68 = true;
                v66:Fire(...);
            end, v66:GetFailComplete()));
            if not v68 then
                v66:Fire(v64);
            end;
            return v67;
        end);
    end;
end;
v22.defaultsToNil = v22.defaultsTo(nil);
v22.endWith = function(v69) --[[ Line: 416 ]] --[[ Name: endWith ]]
    -- upvalues: v2 (copy), v1 (copy)
    return function(v70) --[[ Line: 417 ]]
        -- upvalues: v2 (ref), v1 (ref), v69 (copy)
        assert(v2.isObservable(v70), "Bad observable");
        return v2.new(function(v71) --[[ Line: 420 ]]
            -- upvalues: v1 (ref), v70 (copy), v69 (ref)
            local v72 = v1.new();
            v72:GiveTask(v70:Subscribe(function(...) --[[ Line: 424 ]]
                -- upvalues: v71 (copy)
                v71:Fire(...);
            end, function(...) --[[ Line: 427 ]]
                -- upvalues: v69 (ref), v71 (copy)
                for _, v74 in pairs(v69) do
                    v71:Fire(v74);
                end;
                v71:Fail(...);
            end), function() --[[ Line: 433 ]]
                -- upvalues: v69 (ref), v71 (copy)
                for _, v76 in pairs(v69) do
                    v71:Fire(v76);
                end;
                v71:Complete();
            end);
            return v72;
        end);
    end;
end;
v22.where = function(v77) --[[ Line: 460 ]] --[[ Name: where ]]
    -- upvalues: v2 (copy)
    assert(type(v77) == "function", "Bad predicate callback");
    return function(v78) --[[ Line: 463 ]]
        -- upvalues: v2 (ref), v77 (copy)
        assert(v2.isObservable(v78), "Bad observable");
        return v2.new(function(v79) --[[ Line: 466 ]]
            -- upvalues: v78 (copy), v77 (ref)
            return v78:Subscribe(function(...) --[[ Line: 468 ]]
                -- upvalues: v77 (ref), v79 (copy)
                if v77(...) then
                    v79:Fire(...);
                end;
            end, v79:GetFailComplete());
        end);
    end;
end;
v22.distinct = function() --[[ Line: 491 ]] --[[ Name: distinct ]]
    -- upvalues: v2 (copy), v9 (copy)
    return function(v80) --[[ Line: 492 ]]
        -- upvalues: v2 (ref), v9 (ref)
        assert(v2.isObservable(v80), "Bad observable");
        return v2.new(function(v81) --[[ Line: 495 ]]
            -- upvalues: v9 (ref), v80 (copy)
            local l_v9_0 = v9;
            return v80:Subscribe(function(v83) --[[ Line: 499 ]]
                -- upvalues: l_v9_0 (ref), v81 (copy)
                if l_v9_0 == v83 then
                    return;
                else
                    l_v9_0 = v83;
                    v81:Fire(l_v9_0);
                    return;
                end;
            end, v81:GetFailComplete());
        end);
    end;
end;
v22.mapTo = function(...) --[[ Line: 519 ]] --[[ Name: mapTo ]]
    -- upvalues: v2 (copy)
    local v84 = table.pack(...);
    return function(v85) --[[ Line: 521 ]]
        -- upvalues: v2 (ref), v84 (copy)
        assert(v2.isObservable(v85), "Bad observable");
        return v2.new(function(v86) --[[ Line: 524 ]]
            -- upvalues: v85 (copy), v84 (ref)
            return v85:Subscribe(function() --[[ Line: 525 ]]
                -- upvalues: v86 (copy), v84 (ref)
                v86:Fire(table.unpack(v84, 1, v84.n));
            end, v86:GetFailComplete());
        end);
    end;
end;
v22.map = function(v87) --[[ Line: 548 ]] --[[ Name: map ]]
    -- upvalues: v2 (copy)
    assert(type(v87) == "function", "Bad project callback");
    return function(v88) --[[ Line: 551 ]]
        -- upvalues: v2 (ref), v87 (copy)
        assert(v2.isObservable(v88), "Bad observable");
        return v2.new(function(v89) --[[ Line: 554 ]]
            -- upvalues: v88 (copy), v87 (ref)
            return v88:Subscribe(function(...) --[[ Line: 555 ]]
                -- upvalues: v89 (copy), v87 (ref)
                v89:Fire(v87(...));
            end, v89:GetFailComplete());
        end);
    end;
end;
v22.mergeAll = function() --[[ Line: 579 ]] --[[ Name: mergeAll ]]
    -- upvalues: v2 (copy), v1 (copy)
    return function(v90) --[[ Line: 580 ]]
        -- upvalues: v2 (ref), v1 (ref)
        assert(v2.isObservable(v90), "Bad observable");
        return v2.new(function(v91) --[[ Line: 583 ]]
            -- upvalues: v1 (ref), v90 (copy), v2 (ref)
            local v92 = v1.new();
            local v93 = 0;
            local v94 = false;
            v92:GiveTask(v90:Subscribe(function(v95) --[[ Line: 590 ]]
                -- upvalues: v2 (ref), v93 (ref), v1 (ref), v91 (copy), v94 (ref), v92 (copy)
                assert(v2.isObservable(v95), "Not an observable");
                v93 = v93 + 1;
                local v96 = v1.new();
                v96:GiveTask(v95:Subscribe(function(...) --[[ Line: 598 ]]
                    -- upvalues: v91 (ref)
                    v91:Fire(...);
                end, function(...) --[[ Line: 602 ]]
                    -- upvalues: v91 (ref)
                    v91:Fail(...);
                end, function() --[[ Line: 606 ]]
                    -- upvalues: v96 (copy), v93 (ref), v94 (ref), v91 (ref), v92 (ref)
                    v96:DoCleaning();
                    v93 = v93 - 1;
                    if v93 == 0 and v94 then
                        v91:Complete();
                        v92:DoCleaning();
                    end;
                end));
                local v97 = v92:GiveTask(v96);
                v96:GiveTask(function() --[[ Line: 618 ]]
                    -- upvalues: v92 (ref), v97 (copy)
                    v92[v97] = nil;
                end);
            end, function(...) --[[ Line: 622 ]]
                -- upvalues: v91 (copy), v92 (copy)
                v91:Fail(...);
                v92:DoCleaning();
            end, function() --[[ Line: 626 ]]
                -- upvalues: v94 (ref), v93 (ref), v91 (copy), v92 (copy)
                v94 = true;
                if v93 == 0 then
                    v91:Complete();
                    v92:DoCleaning();
                end;
            end));
            return v92;
        end);
    end;
end;
v22.switchAll = function() --[[ Line: 650 ]] --[[ Name: switchAll ]]
    -- upvalues: v2 (copy), v1 (copy)
    return function(v98) --[[ Line: 651 ]]
        -- upvalues: v2 (ref), v1 (ref)
        assert(v2.isObservable(v98), "Bad observable");
        return v2.new(function(v99) --[[ Line: 654 ]]
            -- upvalues: v1 (ref), v98 (copy), v2 (ref)
            local v100 = v1.new();
            local v101 = false;
            local v102 = false;
            local v103 = nil;
            v100:GiveTask(function() --[[ Line: 660 ]]
                -- upvalues: v100 (copy)
                v100._innerSub = nil;
                v100._outerSuber = nil;
            end);
            v100._outerSuber = v98:Subscribe(function(v104) --[[ Line: 669 ]]
                -- upvalues: v2 (ref), v102 (ref), v103 (ref), v100 (copy), v99 (copy), v101 (ref)
                assert(v2.isObservable(v104), "Bad observable");
                v102 = false;
                v103 = v104;
                v100._innerSub = nil;
                v100._innerSub = v104:Subscribe(function(...) --[[ Line: 677 ]]
                    -- upvalues: v99 (ref)
                    v99:Fire(...);
                end, function(...) --[[ Line: 680 ]]
                    -- upvalues: v103 (ref), v104 (copy), v99 (ref)
                    if v103 == v104 then
                        v99:Fail(...);
                    end;
                end, function() --[[ Line: 685 ]]
                    -- upvalues: v103 (ref), v104 (copy), v102 (ref), v101 (ref), v99 (ref), v100 (ref)
                    if v103 == v104 then
                        v102 = true;
                        if v102 and v101 then
                            v99:Complete();
                            v100:DoCleaning();
                        end;
                    end;
                end);
            end, function(...) --[[ Line: 695 ]]
                -- upvalues: v99 (copy), v100 (copy)
                v99:Fail(...);
                v100:DoCleaning();
            end, function() --[[ Line: 699 ]]
                -- upvalues: v101 (ref), v102 (ref), v99 (copy), v100 (copy)
                v101 = true;
                if v102 and v101 then
                    v99:Complete();
                    v100:DoCleaning();
                end;
            end);
            return v100;
        end);
    end;
end;
v22.flatMap = function(v105, v106) --[[ Line: 721 ]] --[[ Name: flatMap ]]
    -- upvalues: v2 (copy), v1 (copy)
    assert(type(v105) == "function", "Bad project");
    return function(v107) --[[ Line: 724 ]]
        -- upvalues: v2 (ref), v1 (ref), v105 (copy), v106 (copy)
        assert(v2.isObservable(v107), "Bad observable");
        return v2.new(function(v108) --[[ Line: 727 ]]
            -- upvalues: v1 (ref), v107 (copy), v105 (ref), v2 (ref), v106 (ref)
            local v109 = v1.new();
            local v110 = 0;
            local v111 = false;
            v109:GiveTask(v107:Subscribe(function(...) --[[ Line: 734 ]]
                -- upvalues: v105 (ref), v2 (ref), v110 (ref), v1 (ref), v106 (ref), v108 (copy), v111 (ref), v109 (copy)
                local v112 = ...;
                local v113 = v105(...);
                assert(v2.isObservable(v113), "Bad observable from project");
                v110 = v110 + 1;
                local v114 = v1.new();
                v114:GiveTask(v113:Subscribe(function(...) --[[ Line: 745 ]]
                    -- upvalues: v106 (ref), v108 (ref), v112 (copy)
                    if v106 then
                        v108:Fire(v106(v112, ...));
                        return;
                    else
                        v108:Fire(...);
                        return;
                    end;
                end, function(...) --[[ Line: 753 ]]
                    -- upvalues: v108 (ref)
                    v108:Fail(...);
                end, function() --[[ Line: 756 ]]
                    -- upvalues: v114 (copy), v110 (ref), v111 (ref), v108 (ref), v109 (ref)
                    v114:DoCleaning();
                    v110 = v110 - 1;
                    if v110 == 0 and v111 then
                        v108:Complete();
                        v109:DoCleaning();
                    end;
                end));
                local v115 = v109:GiveTask(v114);
                v114:GiveTask(function() --[[ Line: 768 ]]
                    -- upvalues: v109 (ref), v115 (copy)
                    v109[v115] = nil;
                end);
            end, function(...) --[[ Line: 772 ]]
                -- upvalues: v108 (copy), v109 (copy)
                v108:Fail(...);
                v109:DoCleaning();
            end, function() --[[ Line: 776 ]]
                -- upvalues: v111 (ref), v110 (ref), v108 (copy), v109 (copy)
                v111 = true;
                if v110 == 0 then
                    v108:Complete();
                    v109:DoCleaning();
                end;
            end));
            return v109;
        end);
    end;
end;
v22.switchMap = function(v116) --[[ Line: 789 ]] --[[ Name: switchMap ]]
    -- upvalues: v22 (copy)
    return v22.pipe({
        v22.map(v116), 
        v22.switchAll()
    });
end;
v22.takeUntil = function(v117) --[[ Line: 796 ]] --[[ Name: takeUntil ]]
    -- upvalues: v2 (copy), v1 (copy)
    assert(v2.isObservable(v117));
    return function(v118) --[[ Line: 799 ]]
        -- upvalues: v2 (ref), v1 (ref), v117 (copy)
        assert(v2.isObservable(v118), "Bad observable");
        return v2.new(function(v119) --[[ Line: 802 ]]
            -- upvalues: v1 (ref), v117 (ref), v118 (copy)
            local v120 = v1.new();
            local v121 = false;
            local function v122() --[[ Line: 806 ]] --[[ Name: cancel ]]
                -- upvalues: v120 (copy), v121 (ref)
                v120:DoCleaning();
                v121 = true;
            end;
            v120:GiveTask(v117:Subscribe(v122, v122, nil));
            if v121 then
                v120:DoCleaning();
                return nil;
            else
                v120:GiveTask(v118:Subscribe(v119:GetFireFailComplete()));
                return v120;
            end;
        end);
    end;
end;
v22.packed = function(...) --[[ Line: 842 ]] --[[ Name: packed ]]
    -- upvalues: v2 (copy)
    local v123 = table.pack(...);
    return v2.new(function(v124) --[[ Line: 845 ]]
        -- upvalues: v123 (copy)
        v124:Fire(unpack(v123, 1, v123.n));
        v124:Complete();
    end);
end;
v22.unpacked = function(v125) --[[ Line: 856 ]] --[[ Name: unpacked ]]
    -- upvalues: v2 (copy)
    assert(v2.isObservable(v125), "Bad observable");
    return v2.new(function(v126) --[[ Line: 859 ]]
        -- upvalues: v125 (copy)
        return v125:Subscribe(function(v127) --[[ Line: 860 ]]
            -- upvalues: v126 (copy)
            if type(v127) == "table" then
                v126:Fire(unpack(v127));
                return;
            else
                warn(("[Rx.unpacked] - Observable didn't return a table got type %q"):format((type(v127))));
                return;
            end;
        end, v126:GetFailComplete());
    end);
end;
v22.finalize = function(v128) --[[ Line: 889 ]] --[[ Name: finalize ]]
    -- upvalues: v2 (copy), v1 (copy)
    assert(type(v128) == "function", "Bad finalizerCallback");
    return function(v129) --[[ Line: 892 ]]
        -- upvalues: v2 (ref), v1 (ref), v128 (copy)
        assert(v2.isObservable(v129), "Bad observable");
        return v2.new(function(v130) --[[ Line: 895 ]]
            -- upvalues: v1 (ref), v129 (copy), v128 (ref)
            local v131 = v1.new();
            v131:GiveTask(v129:Subscribe(v130:GetFireFailComplete()));
            v131:GiveTask(v128);
            return v131;
        end);
    end;
end;
v22.combineLatestAll = function() --[[ Line: 916 ]] --[[ Name: combineLatestAll ]]
    -- upvalues: v2 (copy), v1 (copy), v22 (copy)
    return function(v132) --[[ Line: 917 ]]
        -- upvalues: v2 (ref), v1 (ref), v22 (ref)
        assert(v2.isObservable(v132), "Bad observable");
        return v2.new(function(v133) --[[ Line: 920 ]]
            -- upvalues: v1 (ref), v132 (copy), v2 (ref), v22 (ref)
            local v134 = {};
            local v135 = v1.new();
            local v136 = true;
            v135:GiveTask(function() --[[ Line: 925 ]]
                -- upvalues: v136 (ref)
                v136 = false;
            end);
            v135:GiveTask(v132:Subscribe(function(v137) --[[ Line: 930 ]]
                -- upvalues: v2 (ref), v134 (copy)
                assert(v2.isObservable(v137));
                table.insert(v134, v137);
            end, function(...) --[[ Line: 935 ]]
                -- upvalues: v133 (copy)
                v133:Fail(...);
            end), function() --[[ Line: 938 ]]
                -- upvalues: v136 (ref), v135 (copy), v22 (ref), v134 (copy), v133 (copy)
                if not v136 then
                    return;
                else
                    v135:GiveTask(v22.combineLatest(v134)):Subscribe(v133:GetFireFailComplete());
                    return;
                end;
            end);
            return v135;
        end);
    end;
end;
v22.combineAll = v22.combineLatestAll;
v22.catchError = function(v138) --[[ Line: 975 ]] --[[ Name: catchError ]]
    -- upvalues: v2 (copy), v1 (copy)
    assert(type(v138) == "function", "Bad callback");
    return function(v139) --[[ Line: 978 ]]
        -- upvalues: v2 (ref), v1 (ref), v138 (copy)
        assert(v2.isObservable(v139), "Bad observable");
        return v2.new(function(v140) --[[ Line: 981 ]]
            -- upvalues: v1 (ref), v139 (copy), v138 (ref), v2 (ref)
            local v141 = v1.new();
            local v142 = true;
            v141:GiveTask(function() --[[ Line: 986 ]]
                -- upvalues: v142 (ref)
                v142 = false;
            end);
            v141:GiveTask(v139:Subscribe(function(...) --[[ Line: 991 ]]
                -- upvalues: v140 (copy)
                v140:Fire(...);
            end, function(...) --[[ Line: 994 ]]
                -- upvalues: v142 (ref), v138 (ref), v2 (ref), v141 (copy), v140 (copy)
                if not v142 then
                    return;
                else
                    local v143 = v138(...);
                    assert(v2.isObservable(v143), "Bad observable");
                    v141:GiveTask(v143:Subscribe(v140:GetFireFailComplete()));
                    return;
                end;
            end, function() --[[ Line: 1008 ]]
                -- upvalues: v140 (copy)
                v140:Complete();
            end));
            return v141;
        end);
    end;
end;
v22.combineLatest = function(v144) --[[ Line: 1043 ]] --[[ Name: combineLatest ]]
    -- upvalues: v2 (copy), v9 (copy), v1 (copy), v5 (copy)
    assert(type(v144) == "table", "Bad observables");
    return v2.new(function(v145) --[[ Line: 1046 ]]
        -- upvalues: v144 (copy), v2 (ref), v9 (ref), v1 (ref), v5 (ref)
        local v146 = 0;
        local v147 = {};
        for v148, v149 in pairs(v144) do
            if v2.isObservable(v149) then
                v146 = v146 + 1;
                v147[v148] = v9;
            else
                v147[v148] = v149;
            end;
        end;
        if v146 == 0 then
            v145:Fire(v147);
            v145:Complete();
            return;
        else
            local v150 = v1.new();
            local _ = function() --[[ Line: 1067 ]] --[[ Name: fireIfAllSet ]]
                -- upvalues: v147 (copy), v9 (ref), v145 (copy), v5 (ref)
                for _, v152 in pairs(v147) do
                    if v152 == v9 then
                        return;
                    end;
                end;
                v145:Fire(v5.copy(v147));
            end;
            for v154, v155 in pairs(v144) do
                if v2.isObservable(v155) then
                    v150:GiveTask(v155:Subscribe(function(v156) --[[ Line: 1080 ]]
                        -- upvalues: v147 (copy), v154 (copy), v9 (ref), v145 (copy), v5 (ref)
                        v147[v154] = v156;
                        for _, v158 in pairs(v147) do
                            if v158 == v9 then
                                return;
                            end;
                        end;
                        v145:Fire(v5.copy(v147));
                    end, function(...) --[[ Line: 1084 ]]
                        -- upvalues: v146 (ref), v145 (copy)
                        v146 = v146 - 1;
                        v145:Fail(...);
                    end, function() --[[ Line: 1088 ]]
                        -- upvalues: v146 (ref), v145 (copy)
                        v146 = v146 - 1;
                        if v146 == 0 then
                            v145:Complete();
                        end;
                    end));
                end;
            end;
            return v150;
        end;
    end);
end;
v22.using = function(v159, v160) --[[ Line: 1116 ]] --[[ Name: using ]]
    -- upvalues: v2 (copy), v1 (copy)
    return v2.new(function(v161) --[[ Line: 1117 ]]
        -- upvalues: v1 (ref), v159 (copy), v160 (copy), v2 (ref)
        local v162 = v1.new();
        local v163 = v159();
        v162:GiveTask(v163);
        local v164 = v160(v163);
        assert(v2.isObservable(v164), "Bad observable");
        v162:GiveTask(v164:Subscribe(v161:GetFireFailComplete()));
        return v162;
    end);
end;
v22.first = function() --[[ Line: 1142 ]] --[[ Name: first ]]
    -- upvalues: v22 (copy)
    return v22.take(1);
end;
v22.take = function(v165) --[[ Line: 1153 ]] --[[ Name: take ]]
    -- upvalues: v2 (copy), v1 (copy)
    assert(type(v165) == "number", "Bad number");
    assert(v165 > 0, "Bad number");
    return function(v166) --[[ Line: 1157 ]]
        -- upvalues: v2 (ref), v1 (ref), v165 (copy)
        assert(v2.isObservable(v166), "Bad observable");
        return v2.new(function(v167) --[[ Line: 1160 ]]
            -- upvalues: v1 (ref), v166 (copy), v165 (ref)
            local v168 = 0;
            local v169 = v1.new();
            v169:GiveTask(v166:Subscribe(function(...) --[[ Line: 1164 ]]
                -- upvalues: v168 (ref), v165 (ref), v167 (copy)
                if v165 <= v168 then
                    warn("[Rx.take] - Still getting values past subscription");
                    return;
                else
                    v168 = v168 + 1;
                    v167:Fire(...);
                    if v165 <= v168 then
                        v167:Complete();
                    end;
                    return;
                end;
            end, v167:GetFailComplete()));
            return v169;
        end);
    end;
end;
v22.skip = function(v170) --[[ Line: 1190 ]] --[[ Name: skip ]]
    -- upvalues: v2 (copy), v1 (copy)
    assert(type(v170) == "number", "Bad toSkip");
    assert(v170 > 0, "Bad toSkip");
    return function(v171) --[[ Line: 1194 ]]
        -- upvalues: v2 (ref), v1 (ref), v170 (copy)
        assert(v2.isObservable(v171), "Bad observable");
        return v2.new(function(v172) --[[ Line: 1197 ]]
            -- upvalues: v1 (ref), v171 (copy), v170 (ref)
            local v173 = 0;
            local v174 = v1.new();
            v174:GiveTask(v171:Subscribe(function(...) --[[ Line: 1201 ]]
                -- upvalues: v173 (ref), v170 (ref), v172 (copy)
                if v173 <= v170 then
                    v173 = v173 + 1;
                    return;
                else
                    v172:Fire(...);
                    return;
                end;
            end, v172:GetFailComplete()));
            return v174;
        end);
    end;
end;
v22.defer = function(v175) --[[ Line: 1225 ]] --[[ Name: defer ]]
    -- upvalues: v2 (copy)
    return v2.new(function(v176) --[[ Line: 1226 ]]
        -- upvalues: v175 (copy), v2 (ref)
        local v177 = nil;
        local l_status_0, l_result_0 = pcall(function() --[[ Line: 1228 ]]
            -- upvalues: v177 (ref), v175 (ref)
            v177 = v175();
        end);
        if not l_status_0 then
            v176:Fail(l_result_0);
            return;
        elseif not v2.isObservable(v177) then
            v176:Fail("Not an observable");
            return;
        else
            return v177:Subscribe(v176:GetFireFailComplete());
        end;
    end);
end;
v22.delay = function(v180) --[[ Line: 1252 ]] --[[ Name: delay ]]
    -- upvalues: v2 (copy), v1 (copy), v7 (copy)
    assert(type(v180) == "number", "Bad seconds");
    return function(v181) --[[ Line: 1255 ]]
        -- upvalues: v2 (ref), v1 (ref), v7 (ref), v180 (copy)
        assert(v2.isObservable(v181), "Bad observable");
        return v2.new(function(v182) --[[ Line: 1258 ]]
            -- upvalues: v1 (ref), v181 (copy), v7 (ref), v180 (ref)
            local v183 = v1.new();
            v183:GiveTask(v181:Subscribe(function(...) --[[ Line: 1261 ]]
                -- upvalues: v183 (copy), v7 (ref), v180 (ref), v182 (copy)
                local v184 = table.pack(...);
                v183[v184] = v7(v180, function() --[[ Line: 1264 ]]
                    -- upvalues: v183 (ref), v184 (copy), v182 (ref)
                    v183[v184] = nil;
                    v182:Fire(table.unpack(v184, 1, v184.n));
                end);
            end, v182:GetFailComplete()));
            return v183;
        end);
    end;
end;
v22.withLatestFrom = function(v185) --[[ Line: 1284 ]] --[[ Name: withLatestFrom ]]
    -- upvalues: v2 (copy), v1 (copy), v9 (copy)
    assert(v185, "Bad inputObservables");
    for _, v187 in pairs(v185) do
        assert(v2.isObservable(v187), "Bad observable");
    end;
    return function(v188) --[[ Line: 1291 ]]
        -- upvalues: v2 (ref), v1 (ref), v185 (copy), v9 (ref)
        assert(v2.isObservable(v188), "Bad observable");
        return v2.new(function(v189) --[[ Line: 1294 ]]
            -- upvalues: v1 (ref), v185 (ref), v9 (ref), v188 (copy)
            local v190 = v1.new();
            local v191 = {};
            for v192, v193 in pairs(v185) do
                v191[v192] = v9;
                v190:GiveTask(v193:Subscribe(function(v194) --[[ Line: 1302 ]]
                    -- upvalues: v191 (copy), v192 (copy)
                    v191[v192] = v194;
                end, nil, nil));
            end;
            v190:GiveTask(v188:Subscribe(function(v195) --[[ Line: 1307 ]]
                -- upvalues: v191 (copy), v9 (ref), v189 (copy)
                for _, v197 in pairs(v191) do
                    if v197 == v9 then
                        return;
                    end;
                end;
                v189:Fire({
                    v195, 
                    unpack(v191)
                });
            end, v189:GetFailComplete()));
            return v190;
        end);
    end;
end;
v22.scan = function(v198, v199) --[[ Line: 1329 ]] --[[ Name: scan ]]
    -- upvalues: v2 (copy)
    assert(type(v198) == "function", "Bad accumulator");
    return function(v200) --[[ Line: 1332 ]]
        -- upvalues: v2 (ref), v199 (copy), v198 (copy)
        assert(v2.isObservable(v200), "Bad observable");
        return v2.new(function(v201) --[[ Line: 1335 ]]
            -- upvalues: v199 (ref), v200 (copy), v198 (ref)
            local l_v199_0 = v199;
            return v200:Subscribe(function(...) --[[ Line: 1338 ]]
                -- upvalues: l_v199_0 (ref), v198 (ref), v201 (copy)
                l_v199_0 = v198(l_v199_0, ...);
                v201:Fire(l_v199_0);
            end, v201:GetFailComplete());
        end);
    end;
end;
v22.throttleTime = function(v203, v204) --[[ Line: 1359 ]] --[[ Name: throttleTime ]]
    -- upvalues: v2 (copy), v1 (copy), v6 (copy)
    assert(type(v203) == "number", "Bad duration");
    local v205 = true;
    if type(v204) ~= "table" then
        v205 = v204 == nil;
    end;
    assert(v205, "Bad throttleConfig");
    return function(v206) --[[ Line: 1363 ]]
        -- upvalues: v2 (ref), v1 (ref), v6 (ref), v203 (copy), v204 (copy)
        assert(v2.isObservable(v206), "Bad observable");
        return v2.new(function(v207) --[[ Line: 1366 ]]
            -- upvalues: v1 (ref), v6 (ref), v203 (ref), v204 (ref), v206 (copy)
            local v208 = v1.new();
            local v209 = v6.new(v203, function(...) --[[ Line: 1369 ]]
                -- upvalues: v207 (copy)
                v207:Fire(...);
            end, v204);
            v208:GiveTask(v209);
            v208:GiveTask(v206:Subscribe(function(...) --[[ Line: 1374 ]]
                -- upvalues: v209 (copy)
                v209:Call(...);
            end, v207:GetFailComplete()));
            return v208;
        end);
    end;
end;
v22.throttleDefer = function() --[[ Line: 1387 ]] --[[ Name: throttleDefer ]]
    -- upvalues: v2 (copy), v1 (copy)
    return function(v210) --[[ Line: 1388 ]]
        -- upvalues: v2 (ref), v1 (ref)
        assert(v2.isObservable(v210), "Bad observable");
        return v2.new(function(v211) --[[ Line: 1391 ]]
            -- upvalues: v1 (ref), v210 (copy)
            local v212 = v1.new();
            local v213 = nil;
            v212:GiveTask(v210:Subscribe(function(...) --[[ Line: 1396 ]]
                -- upvalues: v213 (ref), v211 (copy)
                if not v213 then
                    v213 = table.pack(...);
                    task.defer(function() --[[ Line: 1401 ]]
                        -- upvalues: v213 (ref), v211 (ref)
                        local l_v213_0 = v213;
                        v213 = nil;
                        if v211:IsPending() then
                            v211:Fire(table.unpack(l_v213_0, 1, l_v213_0.n));
                        end;
                    end);
                    return;
                else
                    v213 = table.pack(...);
                    return;
                end;
            end, v211:GetFailComplete()));
            return v212;
        end);
    end;
end;
return v22;