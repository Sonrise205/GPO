local v0 = require(script.Parent.loader).load(script);
local v1 = v0("AccelTween");
local v2 = v0("BlendDefaultProps");
local v3 = v0("Brio");
local v4 = v0("Maid");
local v5 = v0("MaidTaskUtils");
local v6 = v0("Observable");
local v7 = v0("Promise");
local v8 = v0("Rx");
local v9 = v0("BrioUtils");
local v10 = v0("RxInstanceUtils");
local v11 = v0("RxValueBaseUtils");
local v12 = v0("Signal");
local v13 = v0("Spring");
local v14 = v0("SpringUtils");
local v15 = v0("StepUtils");
local v16 = v0("ValueBaseUtils");
local v17 = v0("ValueObject");
local v18 = v0("ValueObjectUtils");
local v19 = {};
v19.New = function(v20) --[[ Line: 49 ]] --[[ Name: New ]]
    -- upvalues: v2 (copy), v6 (copy), v4 (copy), v19 (copy)
    assert(type(v20) == "string", "Bad className");
    local v21 = v2[v20];
    return function(v22) --[[ Line: 54 ]]
        -- upvalues: v6 (ref), v4 (ref), v20 (copy), v21 (copy), v19 (ref)
        return v6.new(function(v23) --[[ Line: 55 ]]
            -- upvalues: v4 (ref), v20 (ref), v21 (ref), v19 (ref), v22 (copy)
            local v24 = v4.new();
            local v25 = Instance.new(v20);
            v24:GiveTask(v25);
            if v21 then
                for v26, v27 in pairs(v21) do
                    v25[v26] = v27;
                end;
            end;
            v24:GiveTask(v19.mount(v25, v22));
            v23:Fire(v25);
            return v24;
        end);
    end;
end;
v19.State = function(v28) --[[ Line: 82 ]] --[[ Name: State ]]
    -- upvalues: v17 (copy)
    return v17.new(v28);
end;
v19.Dynamic = function(...) --[[ Line: 86 ]] --[[ Name: Dynamic ]]
    -- upvalues: v19 (copy), v8 (copy), v7 (copy), v6 (copy)
    return v19.Computed(...):Pipe({
        v8.switchMap(function(v29, ...) --[[ Line: 91 ]]
            -- upvalues: v7 (ref), v8 (ref), v6 (ref)
            if v7.isPromise(v29) then
                return v8.fromPromise(v29);
            elseif v6.isObservable(v29) then
                return v29;
            else
                return v8.of(v29, ...);
            end;
        end)
    });
end;
v19.Computed = function(...) --[[ Line: 129 ]] --[[ Name: Computed ]]
    -- upvalues: v19 (copy), v8 (copy), v6 (copy)
    local v30 = {
        ...
    };
    local v31 = select("#", ...);
    local v32 = v30[v31];
    assert(type(v32) == "function", "Bad compute");
    local v33 = {};
    for v34 = 1, v31 - 1 do
        local v35 = v19.toPropertyObservable(v30[v34]);
        if v35 then
            v33[v34] = v35;
        else
            v33[v34] = v8.of(v30[v34]);
        end;
    end;
    if #v33 == 0 then
        return v6.new(function(v36) --[[ Line: 148 ]]
            -- upvalues: v32 (copy)
            v36:Fire(v32());
        end);
    elseif #v33 == 1 then
        return v8.map(v32)(v33[1]);
    else
        return v8.combineLatest(v33):Pipe({
            v8.map(function(v37) --[[ Line: 156 ]]
                -- upvalues: v32 (copy), v31 (copy)
                return v32(unpack(v37, 1, v31 - 1));
            end)
        });
    end;
end;
v19.OnChange = function(v38) --[[ Line: 179 ]] --[[ Name: OnChange ]]
    -- upvalues: v10 (copy)
    assert(type(v38) == "string", "Bad propertyName");
    return function(v39) --[[ Line: 182 ]]
        -- upvalues: v10 (ref), v38 (copy)
        return v10.observeProperty(v39, v38);
    end;
end;
v19.OnEvent = function(v40) --[[ Line: 205 ]] --[[ Name: OnEvent ]]
    -- upvalues: v8 (copy)
    assert(type(v40) == "string", "Bad eventName");
    return function(v41) --[[ Line: 208 ]]
        -- upvalues: v8 (ref), v40 (copy)
        return v8.fromSignal(v41[v40]);
    end;
end;
v19.Attached = function(v42) --[[ Line: 219 ]] --[[ Name: Attached ]]
    -- upvalues: v6 (copy), v4 (copy), v5 (copy)
    return function(v43) --[[ Line: 220 ]]
        -- upvalues: v6 (ref), v4 (ref), v42 (copy), v5 (ref)
        return v6.new(function(v44) --[[ Line: 221 ]]
            -- upvalues: v4 (ref), v42 (ref), v43 (copy), v5 (ref)
            local v45 = v4.new();
            local v46 = v42(v43);
            if v5.isValidTask(v46) then
                v45:GiveTask(v46);
            end;
            v44:Fire(v46);
            return v45;
        end);
    end;
end;
v19.ComputedPairs = function(v47, v48) --[[ Line: 243 ]] --[[ Name: ComputedPairs ]]
    -- upvalues: v19 (copy), v8 (copy), v6 (copy), v4 (copy), v3 (copy)
    local v49 = v19.toPropertyObservable(v47) or v8.of(v47);
    return v6.new(function(v50) --[[ Line: 246 ]]
        -- upvalues: v4 (ref), v49 (copy), v48 (copy), v3 (ref)
        local v51 = {};
        local v52 = v4.new();
        local v53 = v4.new();
        v52:GiveTask(v53);
        v52:GiveTask(v49:Subscribe(function(v54) --[[ Line: 253 ]]
            -- upvalues: v51 (copy), v4 (ref), v48 (ref), v3 (ref), v50 (copy), v53 (copy)
            assert(type(v54) == "table", "Bad value emitted from source");
            local v55 = {};
            for v56, _ in pairs(v51) do
                v55[v56] = true;
            end;
            for v58, v59 in pairs(v54) do
                v55[v58] = nil;
                if v51[v58] ~= v59 then
                    local v60 = v4.new();
                    local v61 = v48(v58, v59, v60);
                    local v62 = v3.new(v61);
                    v60:GiveTask(v62);
                    v50:Fire(v62);
                    v53[v58] = v60;
                    v51[v58] = v59;
                end;
            end;
            for v63, _ in pairs(v55) do
                v53[v63] = nil;
                v51[v63] = nil;
            end;
        end), v50:GetFailComplete());
        return v52;
    end);
end;
v19.AccelTween = function(v65, v66) --[[ Line: 296 ]] --[[ Name: AccelTween ]]
    -- upvalues: v19 (copy), v8 (copy), v1 (copy), v6 (copy), v4 (copy), v15 (copy)
    local v67 = v19.toPropertyObservable(v65) or v8.of(v65);
    local v68 = v19.toNumberObservable(v66);
    local function _(v69, v70) --[[ Line: 300 ]] --[[ Name: createAccelTween ]]
        -- upvalues: v1 (ref), v68 (copy)
        local v71 = v1.new(v70);
        if v68 then
            v69:GiveTask(v68:Subscribe(function(v72) --[[ Line: 304 ]]
                -- upvalues: v71 (copy)
                assert(type(v72) == "number", "Bad value");
                v71.a = v72;
            end));
        end;
        return v71;
    end;
    return v6.new(function(v74) --[[ Line: 314 ]]
        -- upvalues: v4 (ref), v15 (ref), v67 (copy), v1 (ref), v68 (copy)
        local v75 = nil;
        local v76 = v4.new();
        local v77, v78 = v15.bindToRenderStep(function() --[[ Line: 318 ]]
            -- upvalues: v74 (copy), v75 (ref)
            v74:Fire(v75.p);
            return v75.rtime > 0;
        end);
        v76:GiveTask(v78);
        v76:GiveTask(v67:Subscribe(function(v79) --[[ Line: 324 ]]
            -- upvalues: v75 (ref), v76 (copy), v1 (ref), v68 (ref), v77 (copy)
            local l_v75_0 = v75;
            if not l_v75_0 then
                local l_v76_0 = v76;
                local v82 = v1.new(v79);
                if v68 then
                    l_v76_0:GiveTask(v68:Subscribe(function(v83) --[[ Line: 304 ]]
                        -- upvalues: v82 (copy)
                        assert(type(v83) == "number", "Bad value");
                        v82.a = v83;
                    end));
                end;
                l_v75_0 = v82;
            end;
            v75 = l_v75_0;
            v75.t = v79;
            v77();
        end));
        return v76;
    end);
end;
v19.Spring = function(v84, v85, v86) --[[ Line: 355 ]] --[[ Name: Spring ]]
    -- upvalues: v19 (copy), v8 (copy), v13 (copy), v6 (copy), v4 (copy), v15 (copy), v14 (copy)
    local v87 = v19.toPropertyObservable(v84) or v8.of(v84);
    local v88 = v19.toNumberObservable(v85);
    local v89 = v19.toNumberObservable(v86);
    local function v95(v90, v91) --[[ Line: 360 ]] --[[ Name: createSpring ]]
        -- upvalues: v13 (ref), v88 (copy), v89 (copy)
        local v92 = v13.new(v91);
        if v88 then
            v90:GiveTask(v88:Subscribe(function(v93) --[[ Line: 364 ]]
                -- upvalues: v92 (copy)
                assert(type(v93) == "number", "Bad value");
                v92.Speed = v93;
            end));
        end;
        if v89 then
            v90:GiveTask(v89:Subscribe(function(v94) --[[ Line: 371 ]]
                -- upvalues: v92 (copy)
                assert(type(v94) == "number", "Bad value");
                v92.Damper = v94;
            end));
        end;
        return v92;
    end;
    return v6.new(function(v96) --[[ Line: 382 ]]
        -- upvalues: v4 (ref), v15 (ref), v14 (ref), v87 (copy), v95 (copy)
        local v97 = nil;
        local v98 = v4.new();
        local v101, v102 = v15.bindToRenderStep(function() --[[ Line: 386 ]]
            -- upvalues: v14 (ref), v97 (ref), v96 (copy)
            local v99, v100 = v14.animating(v97);
            v96:Fire(v14.fromLinearIfNeeded(v100));
            return v99;
        end);
        v98:GiveTask(v102);
        v98:GiveTask(v87:Subscribe(function(v103) --[[ Line: 393 ]]
            -- upvalues: v14 (ref), v97 (ref), v95 (ref), v98 (copy), v101 (copy)
            if v103 then
                local v104 = v14.toLinearIfNeeded(v103);
                v97 = v97 or v95(v98, v104);
                v97.t = v14.toLinearIfNeeded(v103);
                v101();
                return;
            else
                warn("Got nil value from emitted source");
                return;
            end;
        end));
        return v98;
    end);
end;
v19.toPropertyObservable = function(v105) --[[ Line: 414 ]] --[[ Name: toPropertyObservable ]]
    -- upvalues: v6 (copy), v16 (copy), v11 (copy), v17 (copy), v18 (copy), v7 (copy), v8 (copy)
    if v6.isObservable(v105) then
        return v105;
    else
        if typeof(v105) == "Instance" then
            if v16.isValueBase(v105) then
                return v11.observeValue(v105);
            end;
        elseif type(v105) == "table" then
            if v17.isValueObject(v105) then
                return v18.observeValue(v105);
            elseif v7.isPromise(v105) then
                return v8.fromPromise(v105);
            end;
        end;
        return nil;
    end;
end;
v19.toNumberObservable = function(v106) --[[ Line: 439 ]] --[[ Name: toNumberObservable ]]
    -- upvalues: v8 (copy), v19 (copy)
    if type(v106) == "number" then
        return v8.of(v106);
    else
        return v19.toPropertyObservable(v106);
    end;
end;
v19.toEventObservable = function(v107) --[[ Line: 453 ]] --[[ Name: toEventObservable ]]
    -- upvalues: v6 (copy), v12 (copy), v8 (copy)
    if v6.isObservable(v107) then
        return v107;
    elseif typeof(v107) == "RBXScriptSignal" or v12.isSignal(v107) then
        return v8.fromSignal(v107);
    else
        return nil;
    end;
end;
v19.toEventHandler = function(v108) --[[ Line: 469 ]] --[[ Name: toEventHandler ]]
    -- upvalues: v16 (copy), v12 (copy)
    if type(v108) == "function" then
        return v108;
    else
        if typeof(v108) == "Instance" then
            if v16.isValueBase(v108) then
                return function(v109) --[[ Line: 475 ]]
                    -- upvalues: v108 (copy)
                    v108.Value = v109;
                end;
            end;
        elseif type(v108) == "table" then
            if v12.isSignal(v108) then
                return function(...) --[[ Line: 481 ]]
                    -- upvalues: v108 (copy)
                    v108:Fire(...);
                end;
            elseif v108.ClassName == "ValueObject" then
                return function(v110) --[[ Line: 485 ]]
                    -- upvalues: v108 (copy)
                    v108.Value = v110;
                end;
            end;
        end;
        return nil;
    end;
end;
v19.Children = function(v111, v112) --[[ Line: 538 ]] --[[ Name: Children ]]
    -- upvalues: v19 (copy), v8 (copy)
    assert(typeof(v111) == "Instance", "Bad parent");
    local v113 = v19._observeChildren(v112);
    if v113 then
        return v113:Pipe({
            v8.tap(function(v114) --[[ Line: 544 ]]
                -- upvalues: v111 (copy)
                v114.Parent = v111;
            end)
        });
    else
        return v8.EMPTY;
    end;
end;
v19.Instance = function(v115) --[[ Line: 589 ]] --[[ Name: Instance ]]
    -- upvalues: v6 (copy)
    return v6.new(function(v116) --[[ Line: 590 ]]
        -- upvalues: v115 (copy)
        v116:Fire(v115);
    end);
end;
v19.Single = function(v117) --[[ Line: 625 ]] --[[ Name: Single ]]
    -- upvalues: v6 (copy), v4 (copy), v3 (copy), v9 (copy)
    return v6.new(function(v118) --[[ Line: 626 ]]
        -- upvalues: v4 (ref), v117 (copy), v3 (ref), v9 (ref)
        local v119 = v4.new();
        v119:GiveTask(v117:Subscribe(function(v120) --[[ Line: 629 ]]
            -- upvalues: v3 (ref), v9 (ref), v119 (copy), v118 (copy)
            if v3.isBrio(v120) then
                local v121 = v9.clone(v120);
                v119._current = v121;
                v118:Fire(v121);
                return v121;
            else
                local v122 = v3.new(v120);
                v119._current = v122;
                v118:Fire(v122);
                return v122;
            end;
        end));
        return v119;
    end);
end;
v19._observeChildren = function(v123) --[[ Line: 654 ]] --[[ Name: _observeChildren ]]
    -- upvalues: v6 (copy), v17 (copy), v4 (copy), v19 (copy), v5 (copy), v3 (copy), v7 (copy), v8 (copy), v12 (copy)
    if typeof(v123) == "Instance" then
        return v6.new(function(v124) --[[ Line: 657 ]]
            -- upvalues: v123 (ref)
            v124:Fire(v123);
            return v123;
        end);
    elseif v17.isValueObject(v123) then
        return v6.new(function(v125) --[[ Line: 665 ]]
            -- upvalues: v4 (ref), v123 (ref), v19 (ref), v5 (ref)
            local v126 = v4.new();
            local function v132() --[[ Line: 669 ]] --[[ Name: update ]]
                -- upvalues: v123 (ref), v126 (copy), v125 (copy), v19 (ref), v5 (ref)
                local l_Value_0 = v123.Value;
                if typeof(l_Value_0) == "Instance" then
                    v126._current = l_Value_0;
                    v125:Fire(l_Value_0);
                    return;
                else
                    local v128 = v19._observeChildren(l_Value_0);
                    if v128 then
                        v126._current = nil;
                        local v129 = false;
                        local v130 = nil;
                        v130 = v128:Subscribe(function(v131) --[[ Line: 683 ]]
                            -- upvalues: v125 (ref)
                            v125:Fire(v131);
                        end, function(...) --[[ Line: 685 ]]
                            -- upvalues: v125 (ref)
                            v125:Fail(...);
                        end, function() --[[ Line: 687 ]]
                            -- upvalues: v129 (ref), v126 (ref), v130 (ref)
                            v129 = true;
                            if v126._current == v130 then
                                v126._current = nil;
                            end;
                        end);
                        if v129 then
                            if v130 then
                                v5.doCleanup(v130);
                            end;
                        else
                            v126._current = v130;
                        end;
                        return;
                    else
                        v126._current = nil;
                        return;
                    end;
                end;
            end;
            v126:GiveTask(v123.Changed:Connect(v132));
            v132();
            return v126;
        end);
    elseif v3.isBrio(v123) then
        return v6.new(function(v133) --[[ Line: 720 ]]
            -- upvalues: v123 (ref), v19 (ref)
            if v123:IsDead() then
                return nil;
            else
                local l_v123_Value_0 = v123:GetValue();
                if typeof(l_v123_Value_0) == "Instance" then
                    local v135 = v123:ToMaid();
                    v135:GiveTask(l_v123_Value_0);
                    v133:Fire(l_v123_Value_0);
                    return v135;
                else
                    local v136 = v19._observeChildren(l_v123_Value_0);
                    if v136 then
                        local v137 = v123:ToMaid();
                        v137:GiveTask(v136:Subscribe(function(v138) --[[ Line: 741 ]]
                            -- upvalues: v133 (copy)
                            v133:Fire(v138);
                        end, function(...) --[[ Line: 743 ]]
                            -- upvalues: v133 (copy)
                            v133:Fail(...);
                        end, function() --[[ Line: 745 ]]
                            -- upvalues: v137 (copy)
                            v137:DoCleaning();
                        end));
                        return v137;
                    else
                        warn(("Unknown type in brio %q"):format((typeof(l_v123_Value_0))));
                        return nil;
                    end;
                end;
            end;
        end);
    else
        if v7.isPromise(v123) then
            v123 = v8.fromPromise(v123);
        end;
        if v12.isSignal(v123) or typeof(v123) == "RBXScriptSignal" then
            v123 = v8.fromSignal(v123);
        end;
        if v6.isObservable(v123) then
            return v6.new(function(v139) --[[ Line: 769 ]]
                -- upvalues: v4 (ref), v123 (ref), v19 (ref)
                local v140 = v4.new();
                v140:GiveTask(v123:Subscribe(function(v141) --[[ Line: 772 ]]
                    -- upvalues: v140 (copy), v139 (copy), v19 (ref), v4 (ref)
                    if typeof(v141) == "Instance" then
                        v140:GiveTask(v141);
                        v139:Fire(v141);
                        return;
                    else
                        local v142 = v19._observeChildren(v141);
                        if v142 then
                            local v143 = v4.new();
                            v143:GiveTask(v142:Subscribe(function(v144) --[[ Line: 786 ]]
                                -- upvalues: v139 (ref)
                                v139:Fire(v144);
                            end, function(...) --[[ Line: 788 ]]
                                -- upvalues: v143 (copy), v139 (ref)
                                v143:DoCleaning();
                                v139:Fail(...);
                            end, function() --[[ Line: 791 ]]
                                -- upvalues: v143 (copy)
                                v143:DoCleaning();
                            end));
                            v143:GiveTask(function() --[[ Line: 795 ]]
                                -- upvalues: v140 (ref), v143 (copy)
                                v140[v143] = nil;
                            end);
                            v140[v143] = v143;
                            return;
                        else
                            warn(("Failed to convert %q into children"):format((tostring(v141))));
                            return;
                        end;
                    end;
                end, function(...) --[[ Line: 802 ]]
                    -- upvalues: v139 (copy)
                    v139:Fire(...);
                end, function() --[[ Line: 804 ]]

                end));
                return v140;
            end);
        elseif type(v123) == "table" and not getmetatable(v123) then
            local v145 = {};
            for v146, v147 in pairs(v123) do
                local v148 = v19._observeChildren(v147);
                if v148 then
                    table.insert(v145, v148);
                else
                    warn(("Failed to convert [%s] %q into children"):format(tostring(v146), (tostring(v147))));
                end;
            end;
            if next(v145) then
                return v8.merge(v145);
            else
                return nil;
            end;
        else
            return nil;
        end;
    end;
end;
v19.mount = function(v149, v150) --[[ Line: 850 ]] --[[ Name: mount ]]
    -- upvalues: v4 (copy), v19 (copy), v6 (copy)
    local v151 = v4.new();
    local v152 = nil;
    local v153 = {};
    for v154, v155 in pairs(v150) do
        if type(v154) == "string" then
            if v154 == "Parent" then
                v152 = v155;
            else
                local v156 = v19.toPropertyObservable(v155);
                if v156 then
                    v151:GiveTask(v156:Subscribe(function(v157) --[[ Line: 863 ]]
                        -- upvalues: v149 (copy), v154 (copy)
                        task.spawn(function() --[[ Line: 864 ]]
                            -- upvalues: v149 (ref), v154 (ref), v157 (copy)
                            v149[v154] = v157;
                        end);
                    end));
                else
                    task.spawn(function() --[[ Line: 869 ]]
                        -- upvalues: v149 (copy), v154 (copy), v155 (copy)
                        v149[v154] = v155;
                    end);
                end;
            end;
        elseif type(v154) == "function" then
            local v158 = v19.toEventObservable(v154(v149, v155));
            if v6.isObservable(v158) then
                table.insert(v153, {
                    v158, 
                    v155
                });
            else
                warn(("Unable to apply event listener %q"):format((tostring(v154))));
            end;
        else
            warn(("Unable to apply property %q"):format((tostring(v154))));
        end;
    end;
    for _, v160 in pairs(v153) do
        v151:GiveTask(v160[1]:Subscribe(v19.toEventHandler(v160[2])));
    end;
    if v152 then
        local v161 = v19.toPropertyObservable(v152);
        if v161 then
            v151:GiveTask(v161:Subscribe(function(v162) --[[ Line: 895 ]]
                -- upvalues: v149 (copy)
                v149.Parent = v162;
            end));
            return v151;
        else
            v149.Parent = v152;
        end;
    end;
    return v151;
end;
return v19;