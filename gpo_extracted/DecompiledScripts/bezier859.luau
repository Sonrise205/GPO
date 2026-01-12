local l_HttpService_0 = game:GetService("HttpService");
local l_CollectionService_0 = game:GetService("CollectionService");
local v2 = require("./mod/tween");
local v3 = require("./mod/shape");
local v4 = require("./mod/utility");
local v5 = require("./obj/Bezier");
local _ = require("./obj/ObjectCache");
local v7 = require(script.Parent.obj.Promise);
local v38 = {
    Box = {
        Volume = v3.getPointWithinBox, 
        Surface = v3.getPointOnBox
    }, 
    Cylinder = {
        Volume = function(v8, v9, v10, v11, v12) --[[ Line: 20 ]] --[[ Name: Volume ]]
            -- upvalues: v3 (copy)
            return v3.getPointWithinCylinder(v8, 0, v12, v9, v10, v11);
        end, 
        Surface = function(v13, v14, v15, v16, v17) --[[ Line: 24 ]] --[[ Name: Surface ]]
            -- upvalues: v3 (copy)
            return v3.getPointWithinCylinder(v13, 1, v17, v14, v15, v16);
        end
    }, 
    Sphere = {
        Volume = function(v18, v19, v20, v21, v22) --[[ Line: 30 ]] --[[ Name: Volume ]]
            -- upvalues: v3 (copy)
            return v3.getPointWithinSphere(v18, 0, v22, v19, v20, v21);
        end, 
        Surface = function(v23, v24, v25, v26, v27) --[[ Line: 34 ]] --[[ Name: Surface ]]
            -- upvalues: v3 (copy)
            return v3.getPointWithinSphere(v23, 1, v27, v24, v25, v26);
        end
    }, 
    Disc = {
        Volume = function(v28, v29, v30, v31, v32) --[[ Line: 40 ]] --[[ Name: Volume ]]
            -- upvalues: v3 (copy)
            return v3.getPointWithinDisc(v28, 0, v32, v29, v30, v31);
        end, 
        Surface = function(v33, v34, v35, v36, v37) --[[ Line: 44 ]] --[[ Name: Surface ]]
            -- upvalues: v3 (copy)
            return v3.getPointWithinDisc(v33, 1, v37, v34, v35, v36);
        end
    }
};
local v39 = {};
local v40 = nil;
v39.init = function(v41) --[[ Line: 54 ]] --[[ Name: init ]]
    -- upvalues: v40 (ref)
    v40 = v41;
end;
v39.deinit = function() --[[ Line: 58 ]] --[[ Name: deinit ]]
    -- upvalues: v40 (ref)
    v40 = nil;
end;
v39.emit = function(v42, v43, v44, v45) --[[ Line: 62 ]] --[[ Name: emit ]]
    -- upvalues: v40 (ref), v4 (copy), v38 (copy), v2 (copy), v5 (copy), l_CollectionService_0 (copy), v7 (copy), l_HttpService_0 (copy)
    local l_Points_0 = v42:FindFirstChild("Points");
    if not l_Points_0 or not l_Points_0:IsA("Attachment") or not v40 then
        return;
    else
        local v47 = v4.getAttribute(v42, "EmitDelay", 0);
        local v48 = v4.getAttribute(v42, "EmitCount", 1);
        local v49 = v4.getAttribute(v42, "EmitDuration", 0);
        local v50 = v4.getAttribute(v42, "DestroyDelay", 0);
        local v51 = v4.getRangeAttribute(v42, "Duration", NumberRange.new(1, 1), NumberRange.new(0, 1e999));
        local v52 = v4.getEnumAttribute(v42, "ShapeFace", "Outward", {
            "InAndOut", 
            "Inward", 
            "Outward"
        });
        local v53 = v4.getAttribute(v42, "SpreadAngle", (Vector3.new(0, 0, 0, 0)));
        local v54 = v4.getAttribute(v42, "SyncPosition", false);
        local v55 = v4.getAttribute(v42, "MirrorPaths", true);
        local v56 = v4.getAttribute(v42, "MirrorRotation", (Vector3.new(0, 0, 180, 0)));
        local v57 = v4.getAttribute(v42, "FacePath", false);
        local v58 = v4.getAttribute(v42, "ArcSpace", false);
        local v59 = v4.getAttribute(v42, "ShapePartial", 1);
        local v60 = v4.getEnumAttribute(v42, "Shape", "Box", {
            "Box", 
            "Cylinder", 
            "Sphere", 
            "Disc"
        });
        local v61 = v4.getEnumAttribute(v42, "ShapeStyle", "Volume", {
            "Volume", 
            "Surface"
        });
        local v62 = Enum.NormalId[v4.getEnumAttribute(v42, "EmissionDirection", "Top", {
            "Top", 
            "Bottom", 
            "Left", 
            "Right", 
            "Front", 
            "Back"
        })];
        local v63 = v4.getAttribute(v42, "ProjectileEnabled", false);
        local v64 = v4.getAttribute(v42, "MatchEndDirection", false);
        local v65 = v4.getAttribute(v42, "ProjectileSpeed", 30);
        local v66 = v4.getRangeAttribute(v42, "ProjectileLifetime", NumberRange.new(1, 1), NumberRange.new(0, 1e999));
        local v67 = v4.getAttribute(v42, "HitboxEnabled", false);
        local v68 = v4.getAttribute(v42, "HitboxCollisionGroup", "Default");
        local v69 = v4.getAttribute(v42, "HitboxFilterTag", "");
        local v70 = v4.getAttribute(v42, "HitboxFilterType", "Exclude");
        local v71 = v4.getAttribute(v42, "HitboxIgnoreCanCollide", false);
        local v72 = v4.getRangeAttribute(v42, "RotSpeed_Start", NumberRange.new(0, 0));
        local v73 = v4.getRangeAttribute(v42, "RotSpeed_End", NumberRange.new(0, 0));
        local v74 = v4.getAttribute(v42, "MinInitRot", (Vector3.new(0, 0, 0, 0)));
        local v75 = v4.getAttribute(v42, "MaxInitRot", (Vector3.new(0, 0, 0, 0)));
        local v76 = v4.getAttribute(v42, "Speed_Start", 1);
        local v77 = v4.getAttribute(v42, "Speed_End", 1);
        local v78 = v38[v60] and v38[v60][v61];
        if not v78 then
            return;
        else
            local v79 = {};
            local v80 = v49 > 0;
            task.wait(v47);
            if v80 and not v45 then
                v42:SetAttribute("Enabled", true);
                if v76 ~= v77 then
                    v42:SetAttribute("SpeedTweening", true);
                    table.insert(v44, v2.fromParams(v4.getAttribute(v42, "Speed_Curve", v4.default_bezier), v4.getAttribute(v42, "Speed_Duration", 0.1), function(v81, v82) --[[ Line: 145 ]]
                        -- upvalues: v42 (copy), v4 (ref), v76 (copy), v77 (copy)
                        v42:SetAttribute("SpeedOverride", v4.lerp(v76, v77, v81));
                        return v82;
                    end, nil, function() --[[ Line: 150 ]]
                        -- upvalues: v42 (copy)
                        v42:SetAttribute("SpeedTweening", nil);
                    end));
                end;
                task.wait(v49);
                v42:SetAttribute("Enabled", false);
                v42:SetAttribute("SpeedOverride", nil);
                return;
            else
                if v48 > 0 then
                    local v83 = nil;
                    local v84 = nil;
                    local l_Parent_0 = v42.Parent;
                    if not l_Parent_0 then
                        return;
                    else
                        if not l_Parent_0:IsA("BasePart") and not l_Parent_0:IsA("Attachment") then
                            l_Parent_0 = v42;
                        end;
                        if l_Parent_0:IsA("BasePart") then
                            v83 = l_Parent_0.Size;
                            v84 = l_Parent_0.CFrame;
                        elseif l_Parent_0:IsA("Attachment") then
                            v83 = Vector3.new(0, 0, 0, 0);
                            v84 = l_Parent_0.WorldCFrame;
                        end;
                        if not v84 then
                            return;
                        else
                            local l_End_0 = v42:FindFirstChild("End");
                            local v87 = l_End_0 and l_End_0:FindFirstChild("T1");
                            if l_End_0 and not l_End_0:IsA("Attachment") then
                                l_End_0 = nil;
                            end;
                            if v87 and not v87:IsA("Attachment") then
                                v87 = nil;
                            end;
                            local v88 = v4.getBezierPoints(l_Points_0);
                            local v89 = Random.new();
                            local v90 = not l_End_0 and v5.new(v88);
                            local v91 = OverlapParams.new();
                            v91.MaxParts = 1;
                            v91.FilterType = Enum.RaycastFilterType[v70];
                            v91.CollisionGroup = v68;
                            v91.RespectCanCollide = not v71;
                            v91:AddToFilter(l_CollectionService_0:GetTagged(v69));
                            if v70 == "Exclude" then
                                v91:AddToFilter({
                                    workspace.Terrain, 
                                    l_Parent_0, 
                                    l_Points_0:FindFirstAncestorOfClass("Part")
                                });
                            end;
                            do
                                local l_v83_0, l_v84_0, l_l_Parent_0_0, l_l_End_0_0, l_v87_0 = v83, v84, l_Parent_0, l_End_0, v87;
                                for _ = 1, v48 do
                                    local v98 = v89:NextNumber(v72.Min, v72.Max);
                                    local v99 = v89:NextNumber(v73.Min, v73.Max);
                                    local v100 = vector.create(v89:NextNumber(v74.x, v75.x), v89:NextNumber(v74.y, v75.y), v89:NextNumber(v74.z, v75.z));
                                    local v101 = v89:NextNumber(v51.Min, v51.Max);
                                    local v102 = v63 and v89:NextNumber(v66.Min, v66.Max);
                                    table.insert(v79, v7.new(function(v103) --[[ Line: 232 ]]
                                        -- upvalues: l_l_Parent_0_0 (ref), l_v84_0 (ref), v62 (copy), v78 (copy), l_v83_0 (ref), v59 (copy), v89 (copy), v53 (copy), v52 (copy), l_l_End_0_0 (ref), v55 (copy), v56 (copy), v4 (ref), v90 (copy), v88 (copy), l_v87_0 (ref), v5 (ref), v58 (copy), l_HttpService_0 (ref), v40 (ref), v43 (copy), v79 (copy), v44 (copy), v67 (copy), v91 (copy), v76 (copy), v98 (copy), v100 (copy), v77 (copy), v42 (copy), v2 (ref), v99 (copy), v101 (copy), v57 (copy), v54 (copy), v63 (copy), v102 (copy), v64 (copy), v65 (copy)
                                        local v104 = if l_l_Parent_0_0:IsA("Attachment") then l_v84_0 * CFrame.new(Vector3.new(0, 0, 0, 0), Vector3.FromNormalId(v62)).Rotation else v78(nil, l_v84_0, l_v83_0, v62, v59);
                                        local v105 = Vector3.FromNormalId(v62);
                                        local v106 = v105:Cross(l_v84_0.LookVector);
                                        if v106.Magnitude < 0.001 then
                                            v106 = v105:Cross(l_v84_0.UpVector);
                                        end;
                                        v104 = v104 * (CFrame.fromAxisAngle(v105, (math.rad((v89:NextNumber(-v53.x, v53.x))))) * CFrame.fromAxisAngle(v106, (math.rad((v89:NextNumber(-v53.y, v53.y))))));
                                        if v52 == "Inward" or v52 == "InAndOut" and v89:NextInteger(0, 1) == 1 then
                                            v104 = v104 * CFrame.fromOrientation(0, 3.141592653589793, 0);
                                        end;
                                        if l_l_End_0_0 and v55 and (v104.Position - l_l_End_0_0.WorldPosition).Unit:Dot(v104.RightVector) >= 0 then
                                            local v107 = v56 * v4.DEG_TO_RAD;
                                            v104 = v104 * CFrame.fromOrientation(v107.x, v107.y, v107.z);
                                        end;
                                        local l_v90_0 = v90;
                                        if l_l_End_0_0 then
                                            local v109 = {};
                                            for v110, v111 in v88 do
                                                table.insert(v109, if v110 == #v88 - 1 then l_v87_0 and l_v87_0.WorldPosition or l_l_End_0_0.WorldPosition else if v110 == #v88 then l_l_End_0_0.WorldPosition else v104 * (v111 - v88[1]));
                                            end;
                                            l_v90_0 = v5.new(v109);
                                        end;
                                        local function _(v112) --[[ Line: 276 ]] --[[ Name: getPos ]]
                                            -- upvalues: v58 (ref), l_v90_0 (ref), l_l_End_0_0 (ref), v104 (ref), v88 (ref)
                                            local v113 = v58 and l_v90_0:getPositionArcSpace(v112) or l_v90_0:getPosition(v112);
                                            if l_l_End_0_0 then
                                                return v113;
                                            else
                                                return v104 * (v113 - v88[1]);
                                            end;
                                        end;
                                        local v115 = l_HttpService_0:GenerateGUID(false);
                                        if not v40 then
                                            v103();
                                            return;
                                        else
                                            local v116 = v40:get(v115);
                                            local l_new_0 = CFrame.new;
                                            local v118 = v58 and l_v90_0:getPositionArcSpace(0) or l_v90_0:getPosition(0);
                                            local v119;
                                            if l_l_End_0_0 then
                                                v119 = v118;
                                            else
                                                local v120 = v118 - v88[1];
                                                v119 = v104 * v120;
                                            end;
                                            v116.CFrame = l_new_0(v119);
                                            l_new_0 = v116._getReal();
                                            v4.copyProperties(v43, l_new_0, v4.COPY_PART_PROPERTIES);
                                            v4.copyProperties(v43, l_new_0, v4.COPY_EXTENDED_PART_PROPERTIES);
                                            v119 = v43:Clone();
                                            for _, v122 in v119:GetChildren() do
                                                v122.Parent = l_new_0;
                                            end;
                                            v119:Destroy();
                                            v119 = l_new_0:FindFirstChild("EmitOnFinish");
                                            if v119 then
                                                v119.Parent = nil;
                                            end;
                                            if shared.vfx and #l_new_0:GetChildren() ~= 0 then
                                                v118 = shared.vfx.emit(l_new_0);
                                                table.insert(v79, v118.Finished);
                                            end;
                                            table.insert(v44, function() --[[ Line: 322 ]]
                                                -- upvalues: v40 (ref), v115 (copy)
                                                if v40 then
                                                    v40:free(v115);
                                                end;
                                            end);
                                            v118 = Vector3.new(0, 0, 0, 0);
                                            local v123 = Vector3.new(0, 0, 0, 0);
                                            local v124 = false;
                                            local function v128() --[[ Line: 333 ]] --[[ Name: onFinish ]]
                                                -- upvalues: v124 (ref), v119 (copy), l_new_0 (copy), v103 (copy)
                                                if v124 then
                                                    return;
                                                else
                                                    v124 = true;
                                                    local v125 = v119 and v119:GetChildren();
                                                    if v125 and #v125 ~= 0 then
                                                        for _, v127 in v125 do
                                                            v127.Parent = l_new_0;
                                                        end;
                                                        shared.vfx.emit(table.unpack(v125)).Finished:finally(function() --[[ Line: 349 ]]
                                                            -- upvalues: v103 (ref)
                                                            v103();
                                                        end);
                                                        return;
                                                    else
                                                        v103();
                                                        return;
                                                    end;
                                                end;
                                            end;
                                            local function _() --[[ Line: 357 ]] --[[ Name: shapecast ]]
                                                -- upvalues: v67 (ref), l_new_0 (copy), v91 (ref)
                                                if not v67 then
                                                    return;
                                                elseif workspace:GetPartsInPart(l_new_0, v91)[1] then
                                                    return true;
                                                else
                                                    return false;
                                                end;
                                            end;
                                            local function _() --[[ Line: 371 ]] --[[ Name: getOriginCFrame ]]
                                                -- upvalues: l_v84_0 (ref), l_l_Parent_0_0 (ref)
                                                local l_l_v84_0_0 = l_v84_0;
                                                if l_l_Parent_0_0:IsA("BasePart") then
                                                    return l_l_Parent_0_0.CFrame;
                                                else
                                                    if l_l_Parent_0_0:IsA("Attachment") then
                                                        l_l_v84_0_0 = l_l_Parent_0_0.WorldCFrame;
                                                    end;
                                                    return l_l_v84_0_0;
                                                end;
                                            end;
                                            local v132 = false;
                                            local l_identity_0 = CFrame.identity;
                                            local l_v76_0 = v76;
                                            local l_v98_0 = v98;
                                            local v136 = CFrame.fromOrientation(v100.x, v100.y, v100.z);
                                            local v137 = nil;
                                            if v76 ~= v77 and not v42:GetAttribute("SpeedOverride") then
                                                v137 = v2.fromParams(v4.getAttribute(v42, "Speed_Curve", v4.default_bezier), v4.getAttribute(v42, "Speed_Duration", 0.1), function(v138, v139) --[[ Line: 397 ]]
                                                    -- upvalues: l_v76_0 (ref), v4 (ref), v76 (ref), v77 (ref)
                                                    l_v76_0 = v4.lerp(v76, v77, v138);
                                                    return v139;
                                                end);
                                                table.insert(v44, v137);
                                            end;
                                            if v98 ~= v99 then
                                                table.insert(v44, v2.fromParams(v4.getAttribute(v42, "RotSpeed_Curve", v4.default_bezier), v101, function(v140, v141) --[[ Line: 412 ]]
                                                    -- upvalues: l_v98_0 (ref), v4 (ref), v98 (ref), v99 (ref), v42 (ref), l_v76_0 (ref)
                                                    l_v98_0 = v4.lerp(v98, v99, v140);
                                                    return v141 * (v42:GetAttribute("SpeedOverride") or l_v76_0);
                                                end, v137));
                                            end;
                                            table.insert(v44, v2.fromParams(v4.getAttribute(v42, "Easing_Curve", v4.linear_bezier), v101, function(v142, v143, v144) --[[ Line: 426 ]]
                                                -- upvalues: v58 (ref), l_v90_0 (ref), l_l_End_0_0 (ref), v104 (ref), v88 (ref), v57 (ref), v101 (ref), l_identity_0 (ref), v100 (ref), l_v98_0 (ref), v4 (ref), v136 (ref), v54 (ref), v116 (copy), l_v84_0 (ref), l_l_Parent_0_0 (ref), v123 (ref), v118 (ref), v67 (ref), l_new_0 (copy), v91 (ref), v128 (copy), v132 (ref), v42 (ref), l_v76_0 (ref), v137 (ref), v63 (ref), v102 (ref)
                                                local v145 = v58 and l_v90_0:getPositionArcSpace(v142) or l_v90_0:getPosition(v142);
                                                local v146 = if l_l_End_0_0 then v145 else v104 * (v145 - v88[1]);
                                                v145 = CFrame.new(v146);
                                                if v57 then
                                                    local v147 = math.clamp((v144 + 0.016666666666666666) / v101, 0, 1);
                                                    local v148 = v58 and l_v90_0:getPositionArcSpace(v147) or l_v90_0:getPosition(v147);
                                                    local v149 = if l_l_End_0_0 then v148 else v104 * (v148 - v88[1]);
                                                    v145 = if v146 ~= v149 then CFrame.lookAt(v146, v149) else v145 * l_identity_0.Rotation;
                                                end;
                                                local v150 = v100:Sign() * l_v98_0 * v4.DEG_TO_RAD * v143;
                                                v136 = v136 * CFrame.fromOrientation(v150.x, v150.y, v150.z);
                                                l_identity_0 = v145;
                                                v145 = v145 * v136;
                                                if v54 then
                                                    local l_v116_0 = v116;
                                                    local l_l_v84_0_1 = l_v84_0;
                                                    if l_l_Parent_0_0:IsA("BasePart") then
                                                        l_l_v84_0_1 = l_l_Parent_0_0.CFrame;
                                                    elseif l_l_Parent_0_0:IsA("Attachment") then
                                                        l_l_v84_0_1 = l_l_Parent_0_0.WorldCFrame;
                                                    end;
                                                    l_v116_0.CFrame = l_l_v84_0_1 * l_v84_0:ToObjectSpace(v145);
                                                else
                                                    v116.CFrame = v145;
                                                end;
                                                v123 = (v146 - v118) / v143;
                                                v118 = v146;
                                                if if not v67 then nil else workspace:GetPartsInPart(l_new_0, v91)[1] and true or false then
                                                    v128();
                                                    v132 = true;
                                                    return nil;
                                                else
                                                    local v153 = v42:GetAttribute("SpeedOverride") or l_v76_0;
                                                    l_v76_0 = v153;
                                                    if v153 == 0 and if v137 then not v137.Connected else not v42:GetAttribute("SpeedTweening") then
                                                        return nil;
                                                    elseif v63 and v142 * v101 < v102 or not v63 then
                                                        return v143 * v153;
                                                    else
                                                        v128();
                                                        return nil;
                                                    end;
                                                end;
                                            end, v137, function(v154) --[[ Line: 486 ]]
                                                -- upvalues: v63 (ref), v132 (ref), v128 (copy), v64 (ref), l_l_End_0_0 (ref), v123 (ref), v65 (ref), l_new_0 (copy), l_v84_0 (ref), l_l_Parent_0_0 (ref), v2 (ref), v102 (ref), v54 (ref), v116 (copy), v67 (ref), v91 (ref), v42 (ref), l_v76_0 (ref), v137 (ref), v44 (ref), v4 (ref)
                                                if not v63 or v132 then
                                                    if v154 then
                                                        v128();
                                                    end;
                                                    return;
                                                else
                                                    local v155 = if v64 and l_l_End_0_0 then l_l_End_0_0.WorldCFrame.LookVector else v123.Unit;
                                                    if v155 ~= v155 then
                                                        v155 = Vector3.new(0, 0, 0, 0);
                                                    end;
                                                    v123 = v155 * v65;
                                                    local l_Position_0 = l_new_0.Position;
                                                    local l_l_v84_0_2 = l_v84_0;
                                                    if l_l_Parent_0_0:IsA("BasePart") then
                                                        l_l_v84_0_2 = l_l_Parent_0_0.CFrame;
                                                    elseif l_l_Parent_0_0:IsA("Attachment") then
                                                        l_l_v84_0_2 = l_l_Parent_0_0.WorldCFrame;
                                                    end;
                                                    local l_l_l_v84_0_2_0 = l_l_v84_0_2;
                                                    v2.timer(v102, function(v159, v160) --[[ Line: 506 ]]
                                                        -- upvalues: v54 (ref), v116 (ref), l_v84_0 (ref), l_l_Parent_0_0 (ref), l_l_l_v84_0_2_0 (copy), l_Position_0 (copy), v123 (ref), l_new_0 (ref), v67 (ref), v91 (ref), v128 (ref), v132 (ref), v42 (ref), l_v76_0 (ref), v137 (ref)
                                                        if v54 then
                                                            local l_v116_1 = v116;
                                                            local l_l_v84_0_3 = l_v84_0;
                                                            if l_l_Parent_0_0:IsA("BasePart") then
                                                                l_l_v84_0_3 = l_l_Parent_0_0.CFrame;
                                                            elseif l_l_Parent_0_0:IsA("Attachment") then
                                                                l_l_v84_0_3 = l_l_Parent_0_0.WorldCFrame;
                                                            end;
                                                            l_v116_1.CFrame = l_l_v84_0_3 * l_l_l_v84_0_2_0:ToObjectSpace(CFrame.new(l_Position_0 + v123 * v160));
                                                        else
                                                            v116.CFrame = CFrame.new(l_Position_0 + v123 * v160) * l_new_0.CFrame.Rotation;
                                                        end;
                                                        if if not v67 then nil else workspace:GetPartsInPart(l_new_0, v91)[1] and true or false then
                                                            v128();
                                                            v132 = true;
                                                            return nil;
                                                        else
                                                            local v163 = v42:GetAttribute("SpeedOverride") or l_v76_0;
                                                            l_v76_0 = v163;
                                                            if v163 > 0 or v160 > 0 and if v137 then v137.Connected else v42:GetAttribute("SpeedTweening") then
                                                                return v159 * v163;
                                                            else
                                                                return nil;
                                                            end;
                                                        end;
                                                    end, v137, v44, v4.RENDER_PRIORITY + v44.depth);
                                                    if not v132 then
                                                        v128();
                                                    end;
                                                    return;
                                                end;
                                            end, true, v4.RENDER_PRIORITY + v44.depth));
                                            return;
                                        end;
                                    end));
                                end;
                                v7.all(v79):await();
                                task.wait(v50);
                            end;
                        end;
                    end;
                end;
                return;
            end;
        end;
    end;
end;
return v39;