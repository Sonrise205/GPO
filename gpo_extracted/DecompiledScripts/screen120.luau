local l_RunService_0 = game:GetService("RunService");
local v1 = require("./mod/utility");
return {
    emit = function(v2, v3) --[[ Line: 7 ]] --[[ Name: emit ]]
        -- upvalues: v1 (copy), l_RunService_0 (copy)
        if not v2:GetAttribute("Enabled") then
            return;
        else
            local v4 = v1.getAttribute(v2, "PartScale", (Vector3.new(1, 1, 1, 0)));
            local v5 = v1.getAttribute(v2, "PartDistance", 1.5);
            local v6 = v1.getAttribute(v2, "OffsetPosition", (Vector3.new(0, 0, 0, 0)));
            local v7 = v1.getAttribute(v2, "OffsetRotation", (Vector3.new(0, 0, 0, 0))) * v1.DEG_TO_RAD;
            local l_CFrame_0 = v2.CFrame;
            local l_Size_0 = v2.Size;
            local l_CollisionGroup_0 = v2.CollisionGroup;
            v2.CollisionGroup = "ForgeMouseIgnore";
            table.insert(v3, function() --[[ Line: 24 ]]
                -- upvalues: v2 (copy), l_Size_0 (copy), l_CFrame_0 (copy), l_CollisionGroup_0 (copy)
                v2.Size = l_Size_0;
                v2.CFrame = l_CFrame_0;
                v2.CollisionGroup = l_CollisionGroup_0 ~= "" and l_CollisionGroup_0 or "Default";
            end);
            local v11 = v1.getRanomId();
            l_RunService_0:BindToRenderStep(v11, v1.RENDER_PRIORITY + v3.depth, function() --[[ Line: 32 ]]
                -- upvalues: v5 (copy), v2 (copy), v4 (copy), v6 (copy), v7 (copy)
                local l_CurrentCamera_0 = workspace.CurrentCamera;
                local v13 = math.tan((math.rad(l_CurrentCamera_0.FieldOfView / 2))) * v5 * 2;
                local v14 = l_CurrentCamera_0.ViewportSize.X / l_CurrentCamera_0.ViewportSize.Y * v13;
                local v15 = l_CurrentCamera_0.CFrame * CFrame.new(0, 0, -v5);
                v2.Size = Vector3.new(v14, v13, v2.Size.Z) * v4;
                v2.CFrame = v15 * CFrame.new(v6) * CFrame.fromOrientation(v7.x, v7.y, v7.z);
            end);
            table.insert(v3, function() --[[ Line: 45 ]]
                -- upvalues: l_RunService_0 (ref), v11 (copy)
                l_RunService_0:UnbindFromRenderStep(v11);
            end);
            return;
        end;
    end
};