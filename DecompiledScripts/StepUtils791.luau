local l_HttpService_0 = game:GetService("HttpService");
local l_RunService_0 = game:GetService("RunService");
local v2 = {};
v2.bindToRenderStep = function(v3) --[[ Line: 38 ]] --[[ Name: bindToRenderStep ]]
    -- upvalues: v2 (copy), l_RunService_0 (copy)
    return v2.bindToSignal(l_RunService_0.RenderStepped, v3);
end;
v2.bindToSignal = function(v4, v5) --[[ Line: 51 ]] --[[ Name: bindToSignal ]]
    if typeof(v4) ~= "RBXScriptSignal" then
        error("signal must be of type RBXScriptSignal");
    end;
    if type(v5) ~= "function" then
        error(("update must be of type function, got %q"):format((type(v5))));
    end;
    local v6 = nil;
    return function(...) --[[ Line: 67 ]] --[[ Name: connect ]]
        -- upvalues: v6 (ref), v5 (copy), v4 (copy)
        if v6 and v6.Connected then
            return;
        elseif not v5(...) then
            return;
        elseif v6 and v6.Connected then
            return;
        else
            local v7 = {
                ...
            };
            v6 = v4:Connect(function() --[[ Line: 87 ]]
                -- upvalues: v5 (ref), v7 (copy), v6 (ref)
                if not v5(unpack(v7)) and v6 then
                    v6:Disconnect();
                    v6 = nil;
                end;
            end);
            return;
        end;
    end, function() --[[ Line: 60 ]] --[[ Name: disconnect ]]
        -- upvalues: v6 (ref)
        if v6 then
            v6:Disconnect();
            v6 = nil;
        end;
    end;
end;
v2.onceAtRenderPriority = function(v8, v9) --[[ Line: 105 ]] --[[ Name: onceAtRenderPriority ]]
    -- upvalues: l_HttpService_0 (copy), l_RunService_0 (copy)
    assert(type(v8) == "number", "Bad priority");
    assert(type(v9) == "function", "Bad func");
    local v10 = ("StepUtils.onceAtPriority_%s"):format(l_HttpService_0:GenerateGUID(false));
    local function v11() --[[ Line: 111 ]] --[[ Name: cleanup ]]
        -- upvalues: l_RunService_0 (ref), v10 (copy)
        l_RunService_0:UnbindFromRenderStep(v10);
    end;
    l_RunService_0:BindToRenderStep(v10, v8, function() --[[ Line: 115 ]]
        -- upvalues: l_RunService_0 (ref), v10 (copy), v9 (copy)
        l_RunService_0:UnbindFromRenderStep(v10);
        v9();
    end);
    return v11;
end;
v2.onceAtStepped = function(v12) --[[ Line: 135 ]] --[[ Name: onceAtStepped ]]
    -- upvalues: v2 (copy), l_RunService_0 (copy)
    return v2.onceAtEvent(l_RunService_0.Stepped, v12);
end;
v2.onceAtRenderStepped = function(v13) --[[ Line: 145 ]] --[[ Name: onceAtRenderStepped ]]
    -- upvalues: v2 (copy), l_RunService_0 (copy)
    return v2.onceAtEvent(l_RunService_0.RenderStepped, v13);
end;
v2.onceAtEvent = function(v14, v15) --[[ Line: 156 ]] --[[ Name: onceAtEvent ]]
    assert(type(v15) == "function", "Bad func");
    local v16 = nil;
    local function v17() --[[ Line: 160 ]] --[[ Name: cleanup ]]
        -- upvalues: v16 (ref)
        if v16 then
            v16:Disconnect();
            v16 = nil;
        end;
    end;
    v16 = v14:Connect(function(...) --[[ Line: 167 ]]
        -- upvalues: v16 (ref), v15 (copy)
        if v16 then
            v16:Disconnect();
            v16 = nil;
        end;
        v15(...);
    end);
    return v17;
end;
return v2;