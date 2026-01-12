local l_HttpService_0 = game:GetService("HttpService");
local l_Config_0 = require(script.Parent:WaitForChild("Config"));
local l_DefaultObjectSettings_0 = require(script.Parent:WaitForChild("DefaultObjectSettings"));
local v3 = {
    Block = "Box", 
    Ball = "Sphere", 
    Capsule = "Capsule", 
    Sphere = "Sphere", 
    Box = "Box", 
    Cylinder = "Cylinder"
};
local function _(v4) --[[ Line: 14 ]] --[[ Name: YAxisSafeUnit ]]
    if v4.Magnitude <= 1.0E-6 then
        return (Vector3.new(-0, -1, -0, -0));
    else
        return v4.Unit;
    end;
end;
local v84 = {
    LogIndent = 0, 
    GetRotationBetween = function(v6, v7) --[[ Line: 25 ]] --[[ Name: GetRotationBetween ]]
        local v8 = v6:Dot(v7);
        local l_Magnitude_0 = v6:Cross(v7).Magnitude;
        local v10 = math.atan2(l_Magnitude_0, v8);
        local v11 = v6:Cross(v7);
        local v12 = if v11.Magnitude <= 1.0E-6 then Vector3.new(-0, -1, -0, -0) else v11.Unit;
        if l_Magnitude_0 < 1.0E-6 then
            if v8 > 0 then
                return CFrame.new();
            else
                v11 = math.abs(v6.X) > math.abs(v6.Z) and Vector3.new(-v6.Y, v6.X, 0) or Vector3.new(0, -v6.Z, v6.Y);
                return CFrame.fromAxisAngle(v11.Unit, 3.141592653589793);
            end;
        else
            return CFrame.fromAxisAngle(v12, v10);
        end;
    end, 
    GetCFrameAxis = function(v13, v14) --[[ Line: 44 ]] --[[ Name: GetCFrameAxis ]]
        local v15, v16, v17 = v13:ToEulerAnglesXYZ();
        if v14 == "X" then
            return v15;
        elseif v14 == "Y" then
            return v16;
        elseif v14 == "Z" then
            return v17;
        else
            return nil;
        end;
    end, 
    GatherObjectSettings = function(v18) --[[ Line: 56 ]] --[[ Name: GatherObjectSettings ]]
        -- upvalues: l_DefaultObjectSettings_0 (copy)
        local v19 = {};
        local function _(v20, v21, v22) --[[ Line: 59 ]] --[[ Name: Expect ]]
            -- upvalues: v18 (copy)
            if typeof(v20) ~= v21 then
                warn((("[SmartBone][Object] Expected attribute %* on %* to be of type %*, got type %*"):format(v22, v18.Name, v21, (typeof(v20)))));
                return false;
            else
                return true;
            end;
        end;
        for v24, v25 in l_DefaultObjectSettings_0 do
            local l_v18_Attribute_0 = v18:GetAttribute(v24);
            if l_v18_Attribute_0 ~= nil then
                local l_l_v18_Attribute_0_0 = l_v18_Attribute_0;
                local v28 = typeof(v25);
                local v29;
                if typeof(l_l_v18_Attribute_0_0) ~= v28 then
                    warn((("[SmartBone][Object] Expected attribute %* on %* to be of type %*, got type %*"):format(v24, v18.Name, v28, (typeof(l_l_v18_Attribute_0_0)))));
                    v29 = false;
                else
                    v29 = true;
                end;
                if not v29 then
                    l_v18_Attribute_0 = nil;
                end;
            end;
            v19[v24] = l_v18_Attribute_0 == nil and v25 or l_v18_Attribute_0;
        end;
        return v19;
    end, 
    GatherBoneSettings = function(v30) --[[ Line: 83 ]] --[[ Name: GatherBoneSettings ]]
        local function _(v31) --[[ Line: 84 ]] --[[ Name: Attrib ]]
            -- upvalues: v30 (copy)
            return v30:GetAttribute(v31);
        end;
        local function _(v33, v34, v35) --[[ Line: 88 ]] --[[ Name: Expect ]]
            -- upvalues: v30 (copy)
            if typeof(v33) ~= v34 then
                warn((("[SmartBone][Bone] Expected attribute %* on %* to be of type %*, got type %*"):format(v35, v30.Name, v34, (typeof(v33)))));
            end;
        end;
        local v37 = v30:GetAttribute("XAxisLocked") or false;
        local v38 = v30:GetAttribute("YAxisLocked") or false;
        local v39 = v30:GetAttribute("ZAxisLocked") or false;
        local v40 = v30:GetAttribute("XAxisLimits") or NumberRange.new(-1e999, 1e999);
        local v41 = v30:GetAttribute("YAxisLimits") or NumberRange.new(-1e999, 1e999);
        local v42 = v30:GetAttribute("ZAxisLimits") or NumberRange.new(-1e999, 1e999);
        local v43 = v30:GetAttribute("Radius") or 0.25;
        local v44 = v30:GetAttribute("RotationLimit") or 180;
        local v45 = v30:GetAttribute("Force") or "\194\172";
        local v46 = v30:GetAttribute("Gravity") or "\194\172";
        if typeof(v37) ~= "boolean" then
            warn((("[SmartBone][Bone] Expected attribute XAxisLocked on %* to be of type boolean, got type %*"):format(v30.Name, (typeof(v37)))));
        end;
        if typeof(v38) ~= "boolean" then
            warn((("[SmartBone][Bone] Expected attribute YAxisLocked on %* to be of type boolean, got type %*"):format(v30.Name, (typeof(v38)))));
        end;
        if typeof(v39) ~= "boolean" then
            warn((("[SmartBone][Bone] Expected attribute ZAxisLocked on %* to be of type boolean, got type %*"):format(v30.Name, (typeof(v39)))));
        end;
        if typeof(v40) ~= "NumberRange" then
            warn((("[SmartBone][Bone] Expected attribute XAxisLimits on %* to be of type NumberRange, got type %*"):format(v30.Name, (typeof(v40)))));
        end;
        if typeof(v41) ~= "NumberRange" then
            warn((("[SmartBone][Bone] Expected attribute YAxisLimits on %* to be of type NumberRange, got type %*"):format(v30.Name, (typeof(v41)))));
        end;
        if typeof(v42) ~= "NumberRange" then
            warn((("[SmartBone][Bone] Expected attribute ZAxisLimits on %* to be of type NumberRange, got type %*"):format(v30.Name, (typeof(v42)))));
        end;
        if typeof(v43) ~= "number" then
            warn((("[SmartBone][Bone] Expected attribute Radius on %* to be of type number, got type %*"):format(v30.Name, (typeof(v43)))));
        end;
        if typeof(v44) ~= "number" then
            warn((("[SmartBone][Bone] Expected attribute RotationLimit on %* to be of type number, got type %*"):format(v30.Name, (typeof(v44)))));
        end;
        if v45 ~= "\194\172" and typeof(v45) ~= "Vector3" then
            warn((("[SmartBone][Bone] Expected attribute Force on %* to be of type Vector3, got type %*"):format(v30.Name, (typeof(v45)))));
        end;
        if v45 ~= "\194\172" and typeof(v46) ~= "Vector3" then
            warn((("[SmartBone][Bone] Expected attribute Gravity on %* to be of type Vector3, got type %*"):format(v30.Name, (typeof(v46)))));
        end;
        return {
            AxisLocked = {
                v37, 
                v38, 
                v39
            }, 
            XAxisLimits = v40, 
            YAxisLimits = v41, 
            ZAxisLimits = v42, 
            RotationLimit = v44, 
            Radius = v43, 
            Force = v45, 
            Gravity = v46
        };
    end, 
    ClosestPointOnLine = function(v47, v48, v49, v50) --[[ Line: 142 ]] --[[ Name: ClosestPointOnLine ]]
        return v47 + v48 * math.clamp((v50 - v47):Dot(v48), -v49, v49);
    end, 
    ClosestPointInBox = function(v51, v52, v53) --[[ Line: 150 ]] --[[ Name: ClosestPointInBox ]]
        local v54 = v51:PointToObjectSpace(v53);
        local l_X_0 = v52.X;
        local l_X_1 = v52.X;
        local l_Z_0 = v52.Z;
        local l_X_2 = v54.X;
        local l_Y_0 = v54.Y;
        local l_Z_1 = v54.Z;
        if v54 ~= v54 or v52 ~= v52 then
            return false, v51.Position, (Vector3.new(0, 1, 0, 0));
        else
            local v61 = math.clamp(l_X_2, -l_X_0 * 0.5, l_X_0 * 0.5);
            local v62 = math.clamp(l_Y_0, -l_X_1 * 0.5, l_X_1 * 0.5);
            local v63 = math.clamp(l_Z_1, -l_Z_0 * 0.5, l_Z_0 * 0.5);
            if v61 ~= l_X_2 or v62 ~= l_Y_0 or v63 ~= l_Z_1 then
                local v64 = v51 * Vector3.new(v61, v62, v63);
                return false, v64, (v53 - v64).unit;
            else
                local v65 = l_X_2 - l_X_0 * 0.5;
                local v66 = l_Y_0 - l_X_1 * 0.5;
                local v67 = l_Z_1 - l_Z_0 * 0.5;
                local v68 = -l_X_2 - l_X_0 * 0.5;
                local v69 = -l_Y_0 - l_X_1 * 0.5;
                local v70 = -l_Z_1 - l_Z_0 * 0.5;
                local v71 = math.max(v65, v66, v67, v68, v69, v70);
                if v71 == v65 then
                    return true, v51 * Vector3.new(l_X_0 * 0.5, l_Y_0, l_Z_1), v51.XVector;
                elseif v71 == v66 then
                    return true, v51 * Vector3.new(l_X_2, l_X_1 * 0.5, l_Z_1), v51.YVector;
                elseif v71 == v67 then
                    return true, v51 * Vector3.new(l_X_2, l_Y_0, l_Z_0 * 0.5), v51.ZVector;
                elseif v71 == v68 then
                    return true, v51 * Vector3.new(-l_X_0 * 0.5, l_Y_0, l_Z_1), -v51.XVector;
                elseif v71 == v69 then
                    return true, v51 * Vector3.new(l_X_2, -l_X_1 * 0.5, l_Z_1), -v51.YVector;
                elseif v71 == v70 then
                    return true, v51 * Vector3.new(l_X_2, l_Y_0, -l_Z_0 * 0.5), -v51.ZVector;
                else
                    warn("CLOSEST POINT ON BOX FAIL");
                    return false, Vector3.new(0, 0, 0, 0), (Vector3.new(0, 1, 0, 0));
                end;
            end;
        end;
    end, 
    GetCollider = function(v72) --[[ Line: 205 ]] --[[ Name: GetCollider ]]
        -- upvalues: l_HttpService_0 (copy), v3 (copy)
        local l_v72_FirstChild_0 = v72:FindFirstChild("self.Collider");
        local v74 = nil;
        if l_v72_FirstChild_0 and l_v72_FirstChild_0:IsA("ModuleScript") then
            local v75 = require(l_v72_FirstChild_0);
            local v76 = nil;
            local l_v75_0 = v75 --[[ copy: 3 -> 9 ]];
            do
                local l_v76_0 = v76;
                pcall(function() --[[ Line: 214 ]]
                    -- upvalues: l_v76_0 (ref), l_HttpService_0 (ref), l_v75_0 (copy)
                    l_v76_0 = l_HttpService_0:JSONDecode(l_v75_0);
                end);
                v74 = l_v76_0;
            end;
        end;
        if v74 then
            return v74;
        else
            local function _(v79) --[[ Line: 227 ]] --[[ Name: GetShapeName ]]
                local l_v79_Attribute_0 = v79:GetAttribute("ColliderShape");
                if l_v79_Attribute_0 then
                    return l_v79_Attribute_0;
                elseif v79:IsA("Part") then
                    return v79.Shape.Name;
                else
                    return "Box";
                end;
            end;
            local l_v3_0 = v3;
            local l_v72_Attribute_0 = v72:GetAttribute("ColliderShape");
            return {
                {
                    Type = l_v3_0[if l_v72_Attribute_0 then l_v72_Attribute_0 else if v72:IsA("Part") then v72.Shape.Name else "Box"] or "Box", 
                    ScaleX = 1, 
                    ScaleY = 1, 
                    ScaleZ = 1, 
                    OffsetX = 0, 
                    OffsetY = 0, 
                    OffsetZ = 0, 
                    RotationX = 0, 
                    RotationY = 0, 
                    RotationZ = 0
                }
            };
        end;
    end
};
v84.SB_INDENT_LOG = function() --[[ Line: 261 ]] --[[ Name: SB_INDENT_LOG ]]
    -- upvalues: v84 (copy)
    local l_v84_0 = v84;
    l_v84_0.LogIndent = l_v84_0.LogIndent + 1;
end;
v84.SB_UNINDENT_LOG = function() --[[ Line: 265 ]] --[[ Name: SB_UNINDENT_LOG ]]
    -- upvalues: v84 (copy)
    local l_v84_1 = v84;
    l_v84_1.LogIndent = l_v84_1.LogIndent - 1;
    v84.LogIndent = math.max(v84.LogIndent, 0);
end;
v84.SB_ASSERT_CB = function(v87, v88, ...) --[[ Line: 270 ]] --[[ Name: SB_ASSERT_CB ]]
    if v87 == false or v87 == nil then
        v88(...);
    end;
end;
v84.SB_VERBOSE_LOG = function(v89) --[[ Line: 276 ]] --[[ Name: SB_VERBOSE_LOG ]]
    -- upvalues: l_Config_0 (copy), v84 (copy)
    if not l_Config_0.LOG_VERBOSE then
        return;
    else
        local v90 = string.rep("    ", v84.LogIndent);
        print((("%*[SmartBone][Log]: %*"):format(v90, v89)));
        return;
    end;
end;
v84.SB_VERBOSE_WARN = function(v91) --[[ Line: 286 ]] --[[ Name: SB_VERBOSE_WARN ]]
    -- upvalues: l_Config_0 (copy), v84 (copy)
    if not l_Config_0.LOG_VERBOSE then
        return;
    else
        local v92 = string.rep("    ", v84.LogIndent);
        warn((("%*[SmartBone][Warn]: %*"):format(v92, v91)));
        return;
    end;
end;
v84.SB_VERBOSE_ERROR = function(v93) --[[ Line: 296 ]] --[[ Name: SB_VERBOSE_ERROR ]]
    -- upvalues: l_Config_0 (copy), v84 (copy)
    if not l_Config_0.LOG_VERBOSE then
        return;
    else
        local v94 = string.rep("    ", v84.LogIndent);
        error((("%*[SmartBone][Error]: %*"):format(v94, v93)));
        return;
    end;
end;
return v84;