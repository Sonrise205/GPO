local v0 = require("./mod/tween");
local v1 = require("./mod/utility");
local v2 = Random.new();
local function v5(v3, v4) --[[ Line: 6 ]] --[[ Name: getLegacyWidths ]]
    -- upvalues: v1 (copy)
    return v1.getAttribute(v3, "Width0", v3.Width0, true) * v4, v1.getAttribute(v3, "Width1", v3.Width1, true) * v4, v1.getAttribute(v3, "StartWidth0", v3.Width0, true) * v4, v1.getAttribute(v3, "StartWidth1", v3.Width1, true) * v4;
end;
return {
    emit = function(v6, v7, v8, v9) --[[ Line: 18 ]] --[[ Name: emit ]]
        -- upvalues: v5 (copy), v1 (copy), v2 (copy), v0 (copy)
        local v10, v11, v12, v13 = v5(v6, v9);
        local v14 = v1.getAttribute(v6, "Width0_Start", v12);
        local v15 = v1.getAttribute(v6, "Width0_End", v10);
        local v16 = v1.getAttribute(v6, "Width1_Start", v13);
        local v17 = v1.getAttribute(v6, "Width1_End", v11);
        local v18 = v1.getAttribute(v6, "EmitDelay", 0);
        local v19 = v1.getAttribute(v6, "Duration", 1, true);
        local v20 = v1.getAttribute(v6, "EndTransparencyScale", 1, true);
        local v21 = v1.getRangeAttribute(v6, "EffectDuration", NumberRange.new(v19, v19), NumberRange.new(0, 1e999));
        local v22 = v2:NextNumber(v21.Min, v21.Max);
        local v23 = v1.getAttribute(v6, "Transparency_Scale_Start", 1);
        local v24 = v1.getAttribute(v6, "Transparency_Scale_End", v20);
        local v25 = v1.getAttribute(v6, "Speed_Start", 1);
        local v26 = v1.getAttribute(v6, "Speed_End", 1);
        local l_TextureSpeed_0 = v7.TextureSpeed;
        task.wait(v18);
        v7.Enabled = true;
        local v28 = 1;
        local v29 = nil;
        if v25 ~= v26 then
            v29 = v0.fromParams(v1.getAttribute(v6, "Speed_Curve", v1.default_bezier), v1.getAttribute(v7, "Speed_Duration", 0.1), function(v30, v31) --[[ Line: 61 ]]
                -- upvalues: v28 (ref), v1 (ref), v25 (copy), v26 (copy), v7 (copy), l_TextureSpeed_0 (copy)
                v28 = v1.lerp(v25, v26, v30);
                v7.TextureSpeed = l_TextureSpeed_0 * v28;
                return v31;
            end);
            table.insert(v8, v29);
        end;
        local function _(v32) --[[ Line: 73 ]] --[[ Name: setTScale ]]
            -- upvalues: v7 (copy), v1 (ref), v6 (copy)
            v7.Transparency = v1.scaleNumberSequence(v6.Transparency, function(v33, v34) --[[ Line: 74 ]]
                -- upvalues: v32 (copy)
                return v33 + (v32 > 1 and 1 - v33 or -v33) * (v32 > 1 and v32 - 1 or 1 - v32), v34;
            end);
        end;
        if v23 ~= v24 then
            table.insert(v8, v0.fromParams(v1.getAttribute(v6, "Transparency_Scale_Curve", v1.default_bezier), v22, function(v36, v37) --[[ Line: 88 ]]
                -- upvalues: v1 (ref), v23 (copy), v24 (copy), v7 (copy), v6 (copy), v28 (ref)
                local v38 = v1.lerp(v23, v24, v36);
                v7.Transparency = v1.scaleNumberSequence(v6.Transparency, function(v39, v40) --[[ Line: 74 ]]
                    -- upvalues: v38 (copy)
                    return v39 + (v38 > 1 and 1 - v39 or -v39) * (v38 > 1 and v38 - 1 or 1 - v38), v40;
                end);
                return v37 * v28;
            end, v29));
        elseif v23 ~= 1 then
            v7.Transparency = v1.scaleNumberSequence(v6.Transparency, function(v41, v42) --[[ Line: 74 ]]
                -- upvalues: v23 (copy)
                return v41 + (v23 > 1 and 1 - v41 or -v41) * (v23 > 1 and v23 - 1 or 1 - v23), v42;
            end);
        end;
        if v14 ~= v15 then
            table.insert(v8, v0.fromParams(v1.getAttribute(v6, "Width0_Curve", v1.default_bezier), v22, function(v43, v44) --[[ Line: 105 ]]
                -- upvalues: v7 (copy), v1 (ref), v14 (copy), v15 (copy), v28 (ref)
                v7.Width0 = v1.lerp(v14, v15, v43);
                return v44 * v28;
            end, v29));
        else
            v7.Width0 = v14;
        end;
        if v16 ~= v17 then
            table.insert(v8, v0.fromParams(v1.getAttribute(v6, "Width1_Curve", v1.default_bezier), v22, function(v45, v46) --[[ Line: 122 ]]
                -- upvalues: v7 (copy), v1 (ref), v16 (copy), v17 (copy), v28 (ref)
                v7.Width1 = v1.lerp(v16, v17, v45);
                return v46 * v28;
            end, v29));
        else
            v7.Width1 = v16;
        end;
        v0.timer(v22, function(v47, v48) --[[ Line: 133 ]]
            -- upvalues: v28 (ref), v29 (ref)
            if v28 > 0 or v48 > 0 and v29 and v29.Connected then
                return v47 * v28;
            else
                return nil;
            end;
        end, v29, v8);
    end
};