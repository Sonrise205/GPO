local l_RunService_0 = game:GetService("RunService");
local v1 = require("./logger");
local v2 = require("./utility");
local v3 = require("../obj/Bezier");
return {
    fromParams = function(v4, v5, v6, v7, v8, v9, v10) --[[ Line: 10 ]] --[[ Name: fromParams ]]
        -- upvalues: v2 (copy), v1 (copy), v3 (copy), l_RunService_0 (copy)
        local l_status_0, l_result_0 = pcall(function() --[[ Line: 19 ]]
            -- upvalues: v2 (ref), v4 (copy)
            return v2.deserializePath(v4);
        end);
        if not l_status_0 then
            v1.error((("failed to decode bezier path data with error: %*"):format(l_result_0)));
        end;
        local v13 = v3.new(l_result_0, 0);
        local v14 = 0;
        local v15 = nil;
        local function v20(v16) --[[ Line: 33 ]] --[[ Name: step ]]
            -- upvalues: v9 (copy), v14 (ref), v5 (copy), v13 (copy), v6 (copy), v7 (copy), v15 (ref), v8 (copy)
            if not v9 and v14 == 0 then
                v14 = math.clamp(v14 + v16, 0, (math.max(v5, 0)));
            end;
            local v17 = math.clamp(v14 / v5, 0, 1);
            local v18 = 1 - v13:getEase(v17).y;
            local v19 = v6(v18, v16, v14);
            if (v19 == nil or if v5 ~= 0 then v5 <= v14 else v5 < v14) and (not v7 or not v7.Connected) then
                v15();
                if v8 then
                    v8(true);
                end;
                return;
            else
                if v19 then
                    v14 = math.clamp(v14 + v19, 0, (math.max(v5, 0)));
                end;
                return;
            end;
        end;
        if not v10 then
            local v21 = nil;
            v21 = l_RunService_0.RenderStepped:Connect(v20);
            v15 = function() --[[ Line: 66 ]]
                -- upvalues: v21 (ref)
                v21:Disconnect();
            end;
            return v21;
        else
            local v22 = v2.getRanomId();
            l_RunService_0:BindToRenderStep(v22, v10, v20);
            local v23 = true;
            v15 = function() --[[ Line: 78 ]]
                -- upvalues: v23 (ref), l_RunService_0 (ref), v22 (copy)
                if not v23 then
                    return;
                else
                    v23 = false;
                    l_RunService_0:UnbindFromRenderStep(v22);
                    return;
                end;
            end;
            return v15;
        end;
    end, 
    timer = function(v24, v25, v26, v27, v28) --[[ Line: 92 ]] --[[ Name: timer ]]
        -- upvalues: l_RunService_0 (copy), v2 (copy)
        local v29 = coroutine.running();
        local v30 = 0;
        local v31 = nil;
        local function v34(v32) --[[ Line: 105 ]] --[[ Name: step ]]
            -- upvalues: v25 (copy), v30 (ref), v24 (copy), v26 (copy), v31 (ref), v29 (copy)
            local v33 = v25(v32, v30);
            if (v33 == nil or if v24 ~= 0 then v24 <= v30 else v24 < v30) and (not v26 or not v26.Connected) then
                v31();
                task.spawn(v29);
                return;
            else
                if v33 then
                    v30 = math.clamp(v30 + v33, 0, (math.max(v24, 0)));
                end;
                return;
            end;
        end;
        if not v28 then
            local v35 = l_RunService_0.RenderStepped:Connect(v34);
            v31 = function() --[[ Line: 125 ]]
                -- upvalues: v35 (copy)
                v35:Disconnect();
            end;
        else
            local v36 = v2.getRanomId();
            l_RunService_0:BindToRenderStep(v36, v28, v34);
            local v37 = true;
            do
                local l_v37_0 = v37;
                v31 = function() --[[ Line: 135 ]]
                    -- upvalues: l_v37_0 (ref), l_RunService_0 (ref), v36 (copy)
                    if not l_v37_0 then
                        return;
                    else
                        l_v37_0 = false;
                        l_RunService_0:UnbindFromRenderStep(v36);
                        return;
                    end;
                end;
            end;
        end;
        if v27 then
            table.insert(v27, v31);
        end;
        coroutine.yield();
    end
};