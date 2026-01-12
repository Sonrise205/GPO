local v0 = require("./mod/tween");
local v1 = require("./mod/utility");
return {
    emit = function(v2, v3, v4) --[[ Line: 6 ]] --[[ Name: emit ]]
        -- upvalues: v1 (copy), v0 (copy)
        if v2.Enabled then
            v2.Enabled = false;
        end;
        local v5 = v1.getAttribute(v2, "EmitDelay", 0);
        local v6 = v1.getAttribute(v2, "EmitCount", 1);
        local v7 = v1.getAttribute(v2, "EmitDuration", 0);
        local v8 = v7 > 0;
        task.wait(v5);
        if v8 then
            v3.Enabled = true;
        end;
        local v9 = v1.getAttribute(v2, "TimeScale_Duration", 0.1);
        local v10 = v1.getAttribute(v2, "TimeScale_Start", v3.TimeScale);
        local v11 = v1.getAttribute(v2, "TimeScale_End", v3.TimeScale);
        local v12 = nil;
        if v10 ~= v11 then
            v12 = v0.fromParams(v1.getAttribute(v2, "TimeScale_Curve", v1.default_bezier), v9, function(v13, v14) --[[ Line: 34 ]]
                -- upvalues: v1 (ref), v10 (copy), v11 (copy), v3 (copy)
                v3.TimeScale = v1.lerp(v10, v11, (math.clamp(v13, 0, 1)));
                return v14;
            end);
            table.insert(v4, v12);
        else
            v3.TimeScale = v10;
        end;
        v3:Emit(v6);
        if v8 then
            task.wait(v7);
            v3.Enabled = false;
        end;
        v0.timer(v2.Lifetime.Max, function(v15, v16) --[[ Line: 55 ]]
            -- upvalues: v2 (copy), v12 (ref)
            if v2.TimeScale > 0 or v16 > 0 and v12 and v12.Connected then
                return v15 * v2.TimeScale;
            else
                return nil;
            end;
        end, v12, v4);
    end
};