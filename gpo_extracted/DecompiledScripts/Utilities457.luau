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
local function _(v4) --[[ Line: 14 ]] --[[ Name: SafeUnit ]]
    if v4.Magnitude == 0 then
        return (Vector3.new(-0, -1, -0, -0));
    else
        return v4.Unit;
    end;
end;
local v83 = {
    LogIndent = 0, 
    GetRotationBetween = function(v6, v7) --[[ Line: 25 ]] --[[ Name: GetRotationBetween ]]
        local v8 = v6:Dot(v7);
        local v9 = math.atan2(v6:Cross(v7).Magnitude, v8);
        local v10 = v6:Cross(v7);
        local v11 = if v10.Magnitude == 0 then Vector3.new(-0, -1, -0, -0) else v10.Unit;
        return CFrame.fromAxisAngle(v11, v9);
    end, 
    GetCFrameAxis = function(v12, v13) --[[ Line: 34 ]] --[[ Name: GetCFrameAxis ]]
        local v14, v15, v16 = v12:ToEulerAnglesXYZ();
        if v13 == "X" then
            return v14;
        elseif v13 == "Y" then
            return v15;
        elseif v13 == "Z" then
            return v16;
        else
            return nil;
        end;
    end, 
    GatherObjectSettings = function(v17) --[[ Line: 46 ]] --[[ Name: GatherObjectSettings ]]
        -- upvalues: l_DefaultObjectSettings_0 (copy)
        local v18 = {};
        local function _(v19, v20, v21) --[[ Line: 49 ]] --[[ Name: Expect ]]
            -- upvalues: v17 (copy)
            if typeof(v19) ~= v20 then
                warn((("[SmartBone][Object] Expected attribute %* on %* to be of type %*, got type %*"):format(v21, v17.Name, v20, (typeof(v19)))));
                return false;
            else
                return true;
            end;
        end;
        for v23, v24 in l_DefaultObjectSettings_0 do
            local l_v17_Attribute_0 = v17:GetAttribute(v23);
            if l_v17_Attribute_0 ~= nil then
                local l_l_v17_Attribute_0_0 = l_v17_Attribute_0;
                local v27 = typeof(v24);
                local v28;
                if typeof(l_l_v17_Attribute_0_0) ~= v27 then
                    warn((("[SmartBone][Object] Expected attribute %* on %* to be of type %*, got type %*"):format(v23, v17.Name, v27, (typeof(l_l_v17_Attribute_0_0)))));
                    v28 = false;
                else
                    v28 = true;
                end;
                if not v28 then
                    l_v17_Attribute_0 = nil;
                end;
            end;
            v18[v23] = l_v17_Attribute_0 == nil and v24 or l_v17_Attribute_0;
        end;
        return v18;
    end, 
    GatherBoneSettings = function(v29) --[[ Line: 73 ]] --[[ Name: GatherBoneSettings ]]
        local function _(v30) --[[ Line: 74 ]] --[[ Name: Attrib ]]
            -- upvalues: v29 (copy)
            return v29:GetAttribute(v30);
        end;
        local function _(v32, v33, v34) --[[ Line: 78 ]] --[[ Name: Expect ]]
            -- upvalues: v29 (copy)
            if typeof(v32) ~= v33 then
                warn((("[SmartBone][Bone] Expected attribute %* on %* to be of type %*, got type %*"):format(v34, v29.Name, v33, (typeof(v32)))));
            end;
        end;
        local v36 = v29:GetAttribute("XAxisLocked") or false;
        local v37 = v29:GetAttribute("YAxisLocked") or false;
        local v38 = v29:GetAttribute("ZAxisLocked") or false;
        local v39 = v29:GetAttribute("XAxisLimits") or NumberRange.new(-1e999, 1e999);
        local v40 = v29:GetAttribute("YAxisLimits") or NumberRange.new(-1e999, 1e999);
        local v41 = v29:GetAttribute("ZAxisLimits") or NumberRange.new(-1e999, 1e999);
        local v42 = v29:GetAttribute("Radius") or 0.25;
        local v43 = v29:GetAttribute("RotationLimit") or 180;
        local v44 = v29:GetAttribute("Force") or "\194\172";
        local v45 = v29:GetAttribute("Gravity") or "\194\172";
        if typeof(v36) ~= "boolean" then
            warn((("[SmartBone][Bone] Expected attribute XAxisLocked on %* to be of type boolean, got type %*"):format(v29.Name, (typeof(v36)))));
        end;
        if typeof(v37) ~= "boolean" then
            warn((("[SmartBone][Bone] Expected attribute YAxisLocked on %* to be of type boolean, got type %*"):format(v29.Name, (typeof(v37)))));
        end;
        if typeof(v38) ~= "boolean" then
            warn((("[SmartBone][Bone] Expected attribute ZAxisLocked on %* to be of type boolean, got type %*"):format(v29.Name, (typeof(v38)))));
        end;
        if typeof(v39) ~= "NumberRange" then
            warn((("[SmartBone][Bone] Expected attribute XAxisLimits on %* to be of type NumberRange, got type %*"):format(v29.Name, (typeof(v39)))));
        end;
        if typeof(v40) ~= "NumberRange" then
            warn((("[SmartBone][Bone] Expected attribute YAxisLimits on %* to be of type NumberRange, got type %*"):format(v29.Name, (typeof(v40)))));
        end;
        if typeof(v41) ~= "NumberRange" then
            warn((("[SmartBone][Bone] Expected attribute ZAxisLimits on %* to be of type NumberRange, got type %*"):format(v29.Name, (typeof(v41)))));
        end;
        if typeof(v42) ~= "number" then
            warn((("[SmartBone][Bone] Expected attribute Radius on %* to be of type number, got type %*"):format(v29.Name, (typeof(v42)))));
        end;
        if typeof(v43) ~= "number" then
            warn((("[SmartBone][Bone] Expected attribute RotationLimit on %* to be of type number, got type %*"):format(v29.Name, (typeof(v43)))));
        end;
        if v44 ~= "\194\172" and typeof(v44) ~= "Vector3" then
            warn((("[SmartBone][Bone] Expected attribute Force on %* to be of type Vector3, got type %*"):format(v29.Name, (typeof(v44)))));
        end;
        if v44 ~= "\194\172" and typeof(v45) ~= "Vector3" then
            warn((("[SmartBone][Bone] Expected attribute Gravity on %* to be of type Vector3, got type %*"):format(v29.Name, (typeof(v45)))));
        end;
        return {
            AxisLocked = {
                v36, 
                v37, 
                v38
            }, 
            XAxisLimits = v39, 
            YAxisLimits = v40, 
            ZAxisLimits = v41, 
            RotationLimit = v43, 
            Radius = v42, 
            Force = v44, 
            Gravity = v45
        };
    end, 
    ClosestPointOnLine = function(v46, v47, v48, v49) --[[ Line: 131 ]] --[[ Name: ClosestPointOnLine ]]
        return v46 + v47 * math.clamp((v49 - v46):Dot(v47), -v48, v48);
    end, 
    ClosestPointInBox = function(v50, v51, v52) --[[ Line: 139 ]] --[[ Name: ClosestPointInBox ]]
        local v53 = v50:PointToObjectSpace(v52);
        local l_X_0 = v51.X;
        local l_X_1 = v51.X;
        local l_Z_0 = v51.Z;
        local l_X_2 = v53.X;
        local l_Y_0 = v53.Y;
        local l_Z_1 = v53.Z;
        if v53 ~= v53 or v51 ~= v51 then
            return false, v50.Position, (Vector3.new(0, 1, 0, 0));
        else
            local v60 = math.clamp(l_X_2, -l_X_0 * 0.5, l_X_0 * 0.5);
            local v61 = math.clamp(l_Y_0, -l_X_1 * 0.5, l_X_1 * 0.5);
            local v62 = math.clamp(l_Z_1, -l_Z_0 * 0.5, l_Z_0 * 0.5);
            if v60 ~= l_X_2 or v61 ~= l_Y_0 or v62 ~= l_Z_1 then
                local v63 = v50 * Vector3.new(v60, v61, v62);
                return false, v63, (v52 - v63).unit;
            else
                local v64 = l_X_2 - l_X_0 * 0.5;
                local v65 = l_Y_0 - l_X_1 * 0.5;
                local v66 = l_Z_1 - l_Z_0 * 0.5;
                local v67 = -l_X_2 - l_X_0 * 0.5;
                local v68 = -l_Y_0 - l_X_1 * 0.5;
                local v69 = -l_Z_1 - l_Z_0 * 0.5;
                local v70 = math.max(v64, v65, v66, v67, v68, v69);
                if v70 == v64 then
                    return true, v50 * Vector3.new(l_X_0 * 0.5, l_Y_0, l_Z_1), v50.XVector;
                elseif v70 == v65 then
                    return true, v50 * Vector3.new(l_X_2, l_X_1 * 0.5, l_Z_1), v50.YVector;
                elseif v70 == v66 then
                    return true, v50 * Vector3.new(l_X_2, l_Y_0, l_Z_0 * 0.5), v50.ZVector;
                elseif v70 == v67 then
                    return true, v50 * Vector3.new(-l_X_0 * 0.5, l_Y_0, l_Z_1), -v50.XVector;
                elseif v70 == v68 then
                    return true, v50 * Vector3.new(l_X_2, -l_X_1 * 0.5, l_Z_1), -v50.YVector;
                elseif v70 == v69 then
                    return true, v50 * Vector3.new(l_X_2, l_Y_0, -l_Z_0 * 0.5), -v50.ZVector;
                else
                    warn("CLOSEST POINT ON BOX FAIL");
                    return false, Vector3.new(0, 0, 0, 0), (Vector3.new(0, 1, 0, 0));
                end;
            end;
        end;
    end, 
    GetCollider = function(v71) --[[ Line: 194 ]] --[[ Name: GetCollider ]]
        -- upvalues: l_HttpService_0 (copy), v3 (copy)
        local l_v71_FirstChild_0 = v71:FindFirstChild("self.Collider");
        local v73 = nil;
        if l_v71_FirstChild_0 and l_v71_FirstChild_0:IsA("ModuleScript") then
            local v74 = require(l_v71_FirstChild_0);
            local v75 = nil;
            local l_v74_0 = v74 --[[ copy: 3 -> 9 ]];
            do
                local l_v75_0 = v75;
                pcall(function() --[[ Line: 203 ]]
                    -- upvalues: l_v75_0 (ref), l_HttpService_0 (ref), l_v74_0 (copy)
                    l_v75_0 = l_HttpService_0:JSONDecode(l_v74_0);
                end);
                v73 = l_v75_0;
            end;
        end;
        if v73 then
            return v73;
        else
            local function _(v78) --[[ Line: 216 ]] --[[ Name: GetShapeName ]]
                local l_v78_Attribute_0 = v78:GetAttribute("ColliderShape");
                if l_v78_Attribute_0 then
                    return l_v78_Attribute_0;
                elseif v78:IsA("Part") then
                    return v78.Shape.Name;
                else
                    return "Box";
                end;
            end;
            local l_v3_0 = v3;
            local l_v71_Attribute_0 = v71:GetAttribute("ColliderShape");
            return {
                {
                    Type = l_v3_0[if l_v71_Attribute_0 then l_v71_Attribute_0 else if v71:IsA("Part") then v71.Shape.Name else "Box"] or "Box", 
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
v83.SB_INDENT_LOG = function() --[[ Line: 250 ]] --[[ Name: SB_INDENT_LOG ]]
    -- upvalues: v83 (copy)
    local l_v83_0 = v83;
    l_v83_0.LogIndent = l_v83_0.LogIndent + 1;
end;
v83.SB_UNINDENT_LOG = function() --[[ Line: 254 ]] --[[ Name: SB_UNINDENT_LOG ]]
    -- upvalues: v83 (copy)
    local l_v83_1 = v83;
    l_v83_1.LogIndent = l_v83_1.LogIndent - 1;
    v83.LogIndent = math.max(v83.LogIndent, 0);
end;
v83.SB_ASSERT_CB = function(v86, v87, ...) --[[ Line: 259 ]] --[[ Name: SB_ASSERT_CB ]]
    if v86 == false or v86 == nil then
        v87(...);
    end;
end;
v83.SB_VERBOSE_LOG = function(v88) --[[ Line: 265 ]] --[[ Name: SB_VERBOSE_LOG ]]
    -- upvalues: l_Config_0 (copy), v83 (copy)
    if not l_Config_0.LOG_VERBOSE then
        return;
    else
        local v89 = string.rep("    ", v83.LogIndent);
        print((("%*[SmartBone][Log]: %*"):format(v89, v88)));
        return;
    end;
end;
v83.SB_VERBOSE_WARN = function(v90) --[[ Line: 275 ]] --[[ Name: SB_VERBOSE_WARN ]]
    -- upvalues: l_Config_0 (copy), v83 (copy)
    if not l_Config_0.LOG_VERBOSE then
        return;
    else
        local v91 = string.rep("    ", v83.LogIndent);
        warn((("%*[SmartBone][Warn]: %*"):format(v91, v90)));
        return;
    end;
end;
v83.SB_VERBOSE_ERROR = function(v92) --[[ Line: 285 ]] --[[ Name: SB_VERBOSE_ERROR ]]
    -- upvalues: l_Config_0 (copy), v83 (copy)
    if not l_Config_0.LOG_VERBOSE then
        return;
    else
        local v93 = string.rep("    ", v83.LogIndent);
        error((("%*[SmartBone][Error]: %*"):format(v93, v92)));
        return;
    end;
end;
return v83;