local v0 = require("./mod/tween");
local v1 = require("./mod/utility");
return {
    emit = function(v2, v3) --[[ Line: 6 ]] --[[ Name: emit ]]
        -- upvalues: v1 (copy), v0 (copy)
        local v4 = v1.getAttribute(v2, "SpinRotation", Vector3.new(0, 0, 0, 0), true) * v1.DEG_TO_RAD;
        local v5 = v1.getAttribute(v2, "Scale_Start", 1, true);
        local v6 = v1.getAttribute(v2, "Scale_End", 1, true);
        if v4 == Vector3.new(0, 0, 0, 0) and v5 == 1 and v6 == 1 then
            return;
        else
            local v7 = v1.getAttribute(v2, "EmitDelay", 0);
            local v8 = v1.getAttribute(v2, "SyncPosition", false);
            local v9 = v1.getAttribute(v2, "SpinDuration", 0.5);
            local v10 = v1.getAttribute(v2, "SpinSpeed_Duration", 0.1);
            local v11 = v1.getAttribute(v2, "SpinSpeed_Start", 0);
            local v12 = v1.getAttribute(v2, "SpinSpeed_End", 1);
            local l_v11_0 = v11;
            task.wait(v7);
            local v14 = nil;
            if v11 ~= v12 then
                v14 = v0.fromParams(v1.getAttribute(v2, "SpinSpeed_Curve", v1.default_bezier), v10, function(v15, v16) --[[ Line: 36 ]]
                    -- upvalues: l_v11_0 (ref), v1 (ref), v11 (copy), v12 (copy)
                    l_v11_0 = v1.lerp(v11, v12, v15);
                    return v16;
                end);
                table.insert(v3, v14);
            end;
            local l_v2_Pivot_0 = v2:GetPivot();
            local l_v2_Scale_0 = v2:GetScale();
            if v5 ~= v6 then
                table.insert(v3, v0.fromParams(v1.getAttribute(v2, "Scale_Curve", v1.default_bezier), v9, function(v19, v20) --[[ Line: 54 ]]
                    -- upvalues: v2 (copy), v1 (ref), v5 (copy), v6 (copy)
                    v2:ScaleTo(v1.lerp(v5, v6, v19));
                    return v20;
                end));
            else
                v2:ScaleTo(v5);
            end;
            local v21 = v2:FindFirstAncestorOfClass("Attachment") or v2:FindFirstAncestorWhichIsA("BasePart");
            table.insert(v3, function() --[[ Line: 66 ]]
                -- upvalues: v2 (copy), v21 (copy), l_v2_Pivot_0 (copy), l_v2_Scale_0 (copy)
                v2:PivotTo(v21 and (v21:IsA("Attachment") and v21.WorldCFrame or v21.CFrame) or l_v2_Pivot_0);
                v2:ScaleTo(l_v2_Scale_0);
            end);
            v4 = v4 * v9;
            v0.timer(v9, function(v22, v23) --[[ Line: 73 ]]
                -- upvalues: v9 (copy), v4 (ref), v21 (copy), v8 (copy), l_v2_Pivot_0 (copy), v2 (copy), l_v11_0 (ref), v14 (ref)
                local v24 = math.clamp(v23 / v9, 0, 1);
                local v25 = v4 * v24;
                local v26 = (if v21 and v8 then v21:IsA("Attachment") and v21.WorldCFrame or v21.CFrame else l_v2_Pivot_0) * CFrame.fromOrientation(v25.x, v25.y, v25.z);
                v2:PivotTo(v26);
                if l_v11_0 > 0 or v23 > 0 and v14.Connected then
                    return v22 * l_v11_0;
                else
                    return nil;
                end;
            end, v14, v3, v1.RENDER_PRIORITY + v3.depth);
            return;
        end;
    end
};