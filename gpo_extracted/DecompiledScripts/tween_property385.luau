local v0 = require("./mod/lerp");
local v1 = require("./mod/tween");
local v2 = require("./mod/utility");
local v3 = Random.new();
return {
    emit = function(v4, v5, v6) --[[ Line: 9 ]] --[[ Name: emit ]]
        -- upvalues: v2 (copy), v3 (copy), v1 (copy), v0 (copy)
        local l_Name_0 = v5.Name;
        local v8 = v2.getAttribute(v5, "EmitDelay", 0);
        local v9 = v2.getAttribute(v5, "ResetOnFinish", true);
        local v10 = v2.getRangeAttribute(v5, "Duration", NumberRange.new(1, 1), NumberRange.new(0, 1e999));
        if v8 > 0 then
            task.wait(v8);
        end;
        local l_v5_Attribute_0 = v5:GetAttribute("_END_VALUE");
        local l_v5_Attribute_1 = v5:GetAttribute("_START_VALUE");
        local l_status_0, l_result_0 = pcall(function() --[[ Line: 24 ]]
            -- upvalues: v4 (copy), l_Name_0 (copy)
            return v4[l_Name_0];
        end);
        if l_v5_Attribute_1 then
            l_result_0 = l_v5_Attribute_1;
        end;
        local v15 = typeof(l_result_0);
        if not l_status_0 or v15 ~= typeof(l_v5_Attribute_0) then
            return;
        else
            local v16 = v3:NextNumber(v10.Min, v10.Max);
            local v17 = v2.getAttribute(v5, "Speed_Start", 1);
            local v18 = v2.getAttribute(v5, "Speed_End", 1);
            local l_v17_0 = v17;
            local v20 = nil;
            if v17 ~= v18 then
                v20 = v1.fromParams(v2.getAttribute(v5, "Speed_Curve", v2.default_bezier), v2.getAttribute(v5, "Speed_Duration", 0.1), function(v21, v22) --[[ Line: 51 ]]
                    -- upvalues: l_v17_0 (ref), v2 (ref), v17 (copy), v18 (copy)
                    l_v17_0 = v2.lerp(v17, v18, v21);
                    return v22;
                end);
                table.insert(v6, v20);
            end;
            local v23 = v0[v15] or v0.Other;
            table.insert(v6, v1.fromParams(v2.getAttribute(v5, "Easing_Curve", v2.linear_bezier), v16, function(v24, v25) --[[ Line: 67 ]]
                -- upvalues: v4 (copy), l_Name_0 (copy), v23 (copy), l_result_0 (ref), l_v5_Attribute_0 (copy), l_v17_0 (ref)
                v4[l_Name_0] = v23(l_result_0, l_v5_Attribute_0, v24);
                return v25 * l_v17_0;
            end, v20, nil, nil, v2.RENDER_PRIORITY + v6.depth));
            if v9 then
                table.insert(v6, function() --[[ Line: 79 ]]
                    -- upvalues: v4 (copy), l_Name_0 (copy), l_result_0 (ref)
                    v4[l_Name_0] = l_result_0;
                end);
            end;
            v1.timer(v16, function(v26, v27) --[[ Line: 84 ]]
                -- upvalues: l_v17_0 (ref), v20 (ref)
                if l_v17_0 > 0 or v27 > 0 and v20 and v20.Connected then
                    return v26 * l_v17_0;
                else
                    return nil;
                end;
            end, v20, v6);
            return;
        end;
    end
};