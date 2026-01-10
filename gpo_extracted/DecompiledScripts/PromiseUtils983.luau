local v0 = require(script.Parent.loader).load(script)("Promise");
return {
    any = function(v1) --[[ Line: 17 ]] --[[ Name: any ]]
        -- upvalues: v0 (copy)
        local v2 = v0.new();
        local function v3(...) --[[ Line: 20 ]] --[[ Name: resolve ]]
            -- upvalues: v2 (copy)
            v2:Resolve(...);
        end;
        local function v4(...) --[[ Line: 24 ]] --[[ Name: reject ]]
            -- upvalues: v2 (copy)
            v2:Reject(...);
        end;
        for _, v6 in pairs(v1) do
            v6:Then(v3, v4);
        end;
        return v2;
    end, 
    all = function(v7) --[[ Line: 46 ]] --[[ Name: all ]]
        -- upvalues: v0 (copy)
        if #v7 == 0 then
            return v0.resolved();
        elseif #v7 == 1 then
            return v7[1];
        else
            local v8 = #v7;
            local v9 = v0.new();
            local v10 = {};
            local v11 = true;
            local function _(v12, v13) --[[ Line: 58 ]] --[[ Name: syncronize ]]
                -- upvalues: v11 (ref), v10 (copy), v8 (ref), v9 (copy), v7 (copy)
                return function(v14) --[[ Line: 59 ]]
                    -- upvalues: v11 (ref), v13 (copy), v10 (ref), v12 (copy), v8 (ref), v9 (ref), v7 (ref)
                    v11 = v11 and v13;
                    v10[v12] = v14;
                    v8 = v8 - 1;
                    if v8 == 0 then
                        v9[v11 and "Resolve" or "Reject"](v9, unpack(v10, 1, #v7));
                    end;
                end;
            end;
            for v16, v17 in pairs(v7) do
                local v18 = true;
                local function v20(v19) --[[ Line: 59 ]]
                    -- upvalues: v11 (ref), v18 (copy), v10 (copy), v16 (copy), v8 (ref), v9 (copy), v7 (copy)
                    v11 = v11 and v18;
                    v10[v16] = v19;
                    v8 = v8 - 1;
                    if v8 == 0 then
                        v9[v11 and "Resolve" or "Reject"](v9, unpack(v10, 1, #v7));
                    end;
                end;
                local v21 = false;
                v17:Then(v20, function(v22) --[[ Line: 59 ]]
                    -- upvalues: v11 (ref), v21 (copy), v10 (copy), v16 (copy), v8 (ref), v9 (copy), v7 (copy)
                    v11 = v11 and v21;
                    v10[v16] = v22;
                    v8 = v8 - 1;
                    if v8 == 0 then
                        v9[v11 and "Resolve" or "Reject"](v9, unpack(v10, 1, #v7));
                    end;
                end);
            end;
            return v9;
        end;
    end, 
    invert = function(v23) --[[ Line: 84 ]] --[[ Name: invert ]]
        -- upvalues: v0 (copy)
        if v23:IsPending() then
            return v23:Then(function(...) --[[ Line: 86 ]]
                -- upvalues: v0 (ref)
                return v0.rejected(...);
            end, function(...) --[[ Line: 88 ]]
                -- upvalues: v0 (ref)
                return v0.resolved(...);
            end);
        else
            local v24 = {
                v23:GetResults()
            };
            if v24[1] then
                return v0.rejected(unpack(v24, 2));
            else
                return v0.resolved(unpack(v24, 2));
            end;
        end;
    end, 
    fromSignal = function(v25) --[[ Line: 107 ]] --[[ Name: fromSignal ]]
        -- upvalues: v0 (copy)
        local v26 = v0.new();
        local v27 = nil;
        v26:Finally(function() --[[ Line: 111 ]]
            -- upvalues: v27 (ref)
            v27:Disconnect();
            v27 = nil;
        end);
        v27 = v25:Connect(function(...) --[[ Line: 116 ]]
            -- upvalues: v26 (copy)
            v26:Resolve(...);
        end);
        return v26;
    end, 
    timeout = function(v28, v29) --[[ Line: 131 ]] --[[ Name: timeout ]]
        -- upvalues: v0 (copy)
        assert(type(v28) == "number", "Bad timeoutTime");
        assert(v29, "Bad fromPromise");
        if not v29:IsPending() then
            return v29;
        else
            local v30 = v0.new();
            v30:Resolve(v29);
            task.delay(v28, function() --[[ Line: 143 ]]
                -- upvalues: v30 (copy)
                v30:Reject();
            end);
            return v30;
        end;
    end
};