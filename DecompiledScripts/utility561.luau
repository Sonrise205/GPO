local l_RunService_0 = game:GetService("RunService");
local l_PhysicsService_0 = game:GetService("PhysicsService");
local v2 = require("./logger");
local v3 = {
    DEG_TO_RAD = 0.017453292519943295, 
    BEZIER_TAG = "BezierParticle", 
    SHOCKWAVE_TAG = "Shockwave", 
    SCREENSHAKE_TAG = "CameraShake", 
    ENABLED_VFX_TAG = "ConstantVFX", 
    TEXTURE_LOAD_TAG = "LoadVFXTextures", 
    RENDER_PRIORITY = Enum.RenderPriority.Camera.Value + 1, 
    COLLISION_GROUPS = {
        StudioSelectable = {}, 
        ForgeDebris = {
            ForgeDebris = false
        }, 
        ForgeMouseIgnore = {
            StudioSelectable = false
        }
    }, 
    COPY_SPECIALMESH_PROPERTIES = {
        "MeshId", 
        "MeshType", 
        "Offset", 
        "Scale", 
        "TextureId", 
        "VertexColor"
    }, 
    COPY_PART_PROPERTIES = {
        "CastShadow", 
        "Color", 
        "Material", 
        "MaterialVariant", 
        "Reflectance", 
        "Shape", 
        "FrontSurface", 
        "BackSurface", 
        "LeftSurface", 
        "RightSurface", 
        "TopSurface", 
        "BottomSurface"
    }, 
    COPY_EXTENDED_PART_PROPERTIES = {
        "Size", 
        "Transparency", 
        "CanCollide", 
        "CanQuery", 
        "CanTouch", 
        "CollisionGroup"
    }
};
local v4 = setmetatable({}, {
    __mode = "k"
});
v3.lock = function(v5) --[[ Line: 75 ]] --[[ Name: lock ]]
    -- upvalues: v4 (copy)
    if v4[v5] then
        return true;
    else
        v4[v5] = coroutine.running();
        return false;
    end;
end;
v3.unlock = function(v6, v7) --[[ Line: 85 ]] --[[ Name: unlock ]]
    -- upvalues: v4 (copy), v2 (copy)
    local v8 = v4[v6];
    if coroutine.running() ~= v8 and v7 ~= v8 then
        v2.error("attempt to unlock an instance owned by a different thread");
    end;
    v4[v6] = nil;
end;
v3.setCollisionGroups = function(v9) --[[ Line: 95 ]] --[[ Name: setCollisionGroups ]]
    -- upvalues: l_PhysicsService_0 (copy), l_RunService_0 (copy)
    local v10 = {};
    for v11, v12 in v9 do
        l_PhysicsService_0:RegisterCollisionGroup(v11);
        if not v11:match("Studio") or l_RunService_0:IsStudio() then
            v10[v11] = v12;
        end;
    end;
    for v13, v14 in v10 do
        for v15, v16 in v14 do
            if not v15:match("Studio") or l_RunService_0:IsStudio() then
                l_PhysicsService_0:CollisionGroupSetCollidable(v13, v15, v16);
            end;
        end;
    end;
end;
local v17 = 0;
v3.getRanomId = function() --[[ Line: 119 ]] --[[ Name: getRanomId ]]
    -- upvalues: v17 (ref)
    v17 = v17 + 1;
    return v17;
end;
v3.copyProperties = function(v18, v19, v20) --[[ Line: 124 ]] --[[ Name: copyProperties ]]
    for _, v22 in v20 do
        v19[v22] = v18[v22];
    end;
end;
v3.lerp = function(v23, v24, v25) --[[ Line: 130 ]] --[[ Name: lerp ]]
    return v23 + (v24 - v23) * v25;
end;
v3.try = function(v26, v27, ...) --[[ Line: 134 ]] --[[ Name: try ]]
    -- upvalues: v2 (copy)
    local v29 = {
        xpcall(v27, function(v28) --[[ Line: 135 ]]
            -- upvalues: v2 (ref), v26 (copy)
            v2.warn(string.format(v26, v28));
        end, ...)
    };
    return v29[1], table.unpack(v29, 2);
end;
v3.reboundfn = function(v30, v31) --[[ Line: 142 ]] --[[ Name: reboundfn ]]
    local v32 = nil;
    return function(...) --[[ Line: 145 ]]
        -- upvalues: v32 (ref), v30 (copy), v31 (copy)
        if v32 then
            task.cancel(v32);
        end;
        local v33 = {
            ...
        };
        v32 = task.delay(v30, function() --[[ Line: 152 ]]
            -- upvalues: v32 (ref), v31 (ref), v33 (copy)
            v32 = nil;
            v31(table.unpack(v33));
        end);
    end;
end;
v3.randomUnitVector = function(v34, v35, v36) --[[ Line: 159 ]] --[[ Name: randomUnitVector ]]
    if not v36 then
        v36 = Random.new();
    end;
    return (Vector3.new(v36:NextNumber(v34.X, v35.X), v36:NextNumber(v34.Y, v35.Y), v36:NextNumber(v34.Z, v35.Z)));
end;
v3.getImpulseForce = function(v37, v38, v39) --[[ Line: 167 ]] --[[ Name: getImpulseForce ]]
    return (v38 - v37) / v39 + Vector3.new(0, workspace.Gravity * v39 * 0.5, 0);
end;
v3.isMeshVFX = function(v40) --[[ Line: 171 ]] --[[ Name: isMeshVFX ]]
    return v40 and v40:IsA("Model") and v40:FindFirstChild("Start") and v40.Start:IsA("BasePart") and v40:FindFirstChild("End") and v40.End:IsA("BasePart");
end;
v3.cleanupScope = function(v41) --[[ Line: 180 ]] --[[ Name: cleanupScope ]]
    -- upvalues: v3 (copy)
    for _, v43 in v41 do
        local v44 = typeof(v43);
        if v44 == "Instance" then
            v43:Destroy();
        elseif v44 == "RBXScriptConnection" then
            v43:Disconnect();
        elseif v44 == "thread" then
            if coroutine.status(v43) ~= "dead" then
                task.cancel(v43);
            end;
        elseif v44 == "function" then
            task.spawn(v43);
        elseif v44 == "table" then
            v3.cleanupScope(v43);
        end;
    end;
    table.clear(v41);
end;
v3.protectParent = function(v45, v46) --[[ Line: 202 ]] --[[ Name: protectParent ]]
    table.insert(v45, v46.AncestryChanged:Connect(function(_, _) --[[ Line: 205 ]]
        -- upvalues: v46 (copy)
        if v46.Parent == workspace.Terrain then
            return;
        else
            v46.Parent = workspace.Terrain;
            return;
        end;
    end));
end;
v3.findFirstClassWithTag = function(v49, v50, v51) --[[ Line: 215 ]] --[[ Name: findFirstClassWithTag ]]
    -- upvalues: v3 (copy)
    if not v49 or v49.Parent == game then
        return;
    elseif v49.ClassName == v50 and v49:HasTag(v51) then
        return v49;
    else
        return v3.findFirstClassWithTag(v49.Parent, v50, v51);
    end;
end;
v3.cloneParticleAncestry = function(v52, v53) --[[ Line: 227 ]] --[[ Name: cloneParticleAncestry ]]
    if not v52:FindFirstAncestorWhichIsA("BasePart") and not v52:FindFirstAncestorOfClass("Attachment") then
        return;
    else
        local function v54(v55) --[[ Line: 232 ]] --[[ Name: findAncestor ]]
            -- upvalues: v54 (copy)
            local l_v55_0 = v55;
            if v55.Parent and (v55.Parent:IsA("BasePart") or v55.Parent:IsA("Attachment")) then
                l_v55_0 = v54(v55.Parent);
            end;
            return l_v55_0;
        end;
        local function v57(v58) --[[ Line: 242 ]] --[[ Name: recurse ]]
            -- upvalues: v53 (copy), v52 (copy), v54 (copy), v57 (copy)
            local v59 = v53[v58];
            if v59 then
                local l_v59_0 = v59;
                if v58 == v52 then
                    return l_v59_0, v53[v58.Parent];
                else
                    local l_v53_0 = v53;
                    local l_Parent_0 = v58.Parent;
                    local l_l_Parent_0_0 = l_Parent_0;
                    if l_Parent_0.Parent and (l_Parent_0.Parent:IsA("BasePart") or l_Parent_0.Parent:IsA("Attachment")) then
                        l_l_Parent_0_0 = v54(l_Parent_0.Parent);
                    end;
                    return l_v59_0, l_v53_0[l_l_Parent_0_0] or v53[v58];
                end;
            else
                local v64 = Instance.fromExisting(v58);
                v64.Archivable = false;
                if v64:IsA("BasePart") then
                    v64.Locked = true;
                end;
                local l_v64_0 = v64;
                if v53 then
                    v53[v58] = v64;
                end;
                if v58.Parent and (v58.Parent:IsA("BasePart") or v58.Parent:IsA("Attachment")) then
                    local v66, v67 = v57(v58.Parent);
                    if v67 then
                        l_v64_0 = v67;
                    end;
                    if v66 then
                        v64.Parent = v66;
                    end;
                end;
                return v64, l_v64_0;
            end;
        end;
        return v57(v52.Parent);
    end;
end;
v3.getAttribute = function(v68, v69, v70, v71) --[[ Line: 280 ]] --[[ Name: getAttribute ]]
    local l_v68_Attribute_0 = v68:GetAttribute(v69);
    if l_v68_Attribute_0 == nil or typeof(l_v68_Attribute_0) ~= typeof(v70) then
        l_v68_Attribute_0 = v70;
    end;
    if not v71 then
        v68:SetAttribute(v69, l_v68_Attribute_0);
    end;
    return l_v68_Attribute_0;
end;
v3.getRangeAttribute = function(v73, v74, v75, v76, v77) --[[ Line: 294 ]] --[[ Name: getRangeAttribute ]]
    local l_v73_Attribute_0 = v73:GetAttribute(v74);
    if typeof(l_v73_Attribute_0) ~= "NumberRange" then
        l_v73_Attribute_0 = v75;
    end;
    if v76 then
        l_v73_Attribute_0 = NumberRange.new(math.clamp(l_v73_Attribute_0.Min, v76.Min, v76.Max), (math.clamp(l_v73_Attribute_0.Max, v76.Min, v76.Max)));
    end;
    if not v77 then
        v73:SetAttribute(v74, l_v73_Attribute_0);
    end;
    return l_v73_Attribute_0;
end;
v3.getEnumAttribute = function(v79, v80, v81, v82, v83) --[[ Line: 322 ]] --[[ Name: getEnumAttribute ]]
    local l_v79_Attribute_0 = v79:GetAttribute(v80);
    if l_v79_Attribute_0 == nil or not table.find(v82, l_v79_Attribute_0) then
        l_v79_Attribute_0 = v81;
    end;
    if not v83 then
        v79:SetAttribute(v80, l_v79_Attribute_0);
    end;
    return l_v79_Attribute_0;
end;
v3.getMeshDecals = function(v85, v86) --[[ Line: 336 ]] --[[ Name: getMeshDecals ]]
    -- upvalues: v3 (copy)
    local v87 = v3.getAttribute(v85, "Flipbook", false, true);
    local v88 = {};
    local v89 = {};
    local v90 = {};
    local function v95(v91) --[[ Line: 343 ]] --[[ Name: filter ]]
        local v92 = {};
        for _, v94 in v91 do
            if v94:IsA("Decal") then
                table.insert(v92, v94);
            end;
        end;
        return v92;
    end;
    if v87 then
        return v95(v86:GetChildren()), v89, v90;
    else
        local l_End_0 = v85:FindFirstChild("End");
        if l_End_0 then
            for _, v98 in v86:GetChildren() do
                if v98:IsA("Decal") then
                    local l_l_End_0_FirstChild_0 = l_End_0:FindFirstChild(v98.Name);
                    if l_l_End_0_FirstChild_0 and l_l_End_0_FirstChild_0:IsA("Decal") then
                        table.insert(v88, v98);
                        v90[v98] = l_l_End_0_FirstChild_0;
                        local l_v98_Children_0 = v98:GetChildren();
                        local v101 = 0;
                        for v102 = 1, #l_v98_Children_0 do
                            local v103 = v102 - v101;
                            if not l_v98_Children_0[v103]:IsA("Decal") then
                                table.remove(l_v98_Children_0, v103);
                                v101 = v101 + 1;
                            end;
                        end;
                        if #l_v98_Children_0 ~= 0 then
                            v101 = function(v104) --[[ Line: 395 ]] --[[ Name: idx ]]
                                return tonumber(v104:match("%d+")) or 0;
                            end;
                            table.sort(l_v98_Children_0, function(v105, v106) --[[ Line: 399 ]]
                                return (tonumber(v105.Name:match("%d+")) or 0) < (tonumber(v106.Name:match("%d+")) or 0);
                            end);
                            local v107 = {};
                            for _, v109 in l_v98_Children_0 do
                                table.insert(v107, tonumber(v109.Texture:match("%d+")) or 0);
                                v109:Destroy();
                            end;
                            local v110 = v3.serializeFlipbook(v107);
                            v98:SetAttribute("FlipbookEnabled", true);
                            v98:SetAttribute("FlipbookTextures", buffer.tostring(v110));
                        end;
                        if not v98:GetAttribute("FlipbookEnabled") then
                            table.insert(v88, v98);
                        else
                            v89[v98] = v3.deserializeFlipbook(v98:GetAttribute("FlipbookTextures"));
                        end;
                    end;
                end;
            end;
        end;
        return v88, v89, v90;
    end;
end;
v3.getBezierPoints = function(v111, v112) --[[ Line: 428 ]] --[[ Name: getBezierPoints ]]
    local l_v111_Children_0 = v111:GetChildren();
    table.sort(l_v111_Children_0, function(v114, v115) --[[ Line: 431 ]]
        return tonumber(v114.Name) < tonumber(v115.Name);
    end);
    local v116 = {};
    local v117 = {};
    local v118 = {};
    local function _(v119) --[[ Line: 439 ]] --[[ Name: vec ]]
        -- upvalues: v111 (copy), v116 (copy), v112 (copy), v118 (copy), v117 (copy)
        local v120 = v111.WorldCFrame:PointToObjectSpace(v119.WorldPosition);
        local v121 = vector.create(v120.X, v120.Y, v120.Z);
        table.insert(v116, v121);
        if v112 then
            v118[v119] = v121;
            table.insert(v117, v119);
        end;
        return v121;
    end;
    for v123, v124 in l_v111_Children_0 do
        local l_T0_0 = v124:FindFirstChild("T0");
        local l_T1_0 = v124:FindFirstChild("T1");
        if v123 == 1 then
            local v127 = v111.WorldCFrame:PointToObjectSpace(v124.WorldPosition);
            local v128 = vector.create(v127.X, v127.Y, v127.Z);
            table.insert(v116, v128);
            if v112 then
                v118[v124] = v128;
                table.insert(v117, v124);
            end;
        end;
        if v123 ~= 1 then
            if l_T1_0 then
                local v129 = v111.WorldCFrame:PointToObjectSpace(l_T1_0.WorldPosition);
                local v130 = vector.create(v129.X, v129.Y, v129.Z);
                table.insert(v116, v130);
                if v112 then
                    v118[l_T1_0] = v130;
                    table.insert(v117, l_T1_0);
                end;
            else
                local v131 = v111.WorldCFrame:PointToObjectSpace(v124.WorldPosition);
                local v132 = vector.create(v131.X, v131.Y, v131.Z);
                table.insert(v116, v132);
                if v112 then
                    v118[v124] = v132;
                    table.insert(v117, v124);
                end;
            end;
        end;
        if v123 ~= 1 and v123 ~= #l_v111_Children_0 then
            local v133 = v111.WorldCFrame:PointToObjectSpace(v124.WorldPosition);
            local v134 = vector.create(v133.X, v133.Y, v133.Z);
            table.insert(v116, v134);
            if v112 then
                v118[v124] = v134;
                table.insert(v117, v124);
            end;
        end;
        if v123 ~= #l_v111_Children_0 then
            if l_T0_0 then
                local v135 = v111.WorldCFrame:PointToObjectSpace(l_T0_0.WorldPosition);
                local v136 = vector.create(v135.X, v135.Y, v135.Z);
                table.insert(v116, v136);
                if v112 then
                    v118[l_T0_0] = v136;
                    table.insert(v117, l_T0_0);
                end;
            else
                local v137 = v111.WorldCFrame:PointToObjectSpace(v124.WorldPosition);
                local v138 = vector.create(v137.X, v137.Y, v137.Z);
                table.insert(v116, v138);
                if v112 then
                    v118[v124] = v138;
                    table.insert(v117, v124);
                end;
            end;
        end;
        if v123 == #l_v111_Children_0 then
            local v139 = v111.WorldCFrame:PointToObjectSpace(v124.WorldPosition);
            local v140 = vector.create(v139.X, v139.Y, v139.Z);
            table.insert(v116, v140);
            if v112 then
                v118[v124] = v140;
                table.insert(v117, v124);
            end;
        end;
    end;
    return v116, v117, v118;
end;
v3.scaleNumberSequence = function(v141, v142) --[[ Line: 491 ]] --[[ Name: scaleNumberSequence ]]
    if v142 == 1 then
        return v141;
    else
        local v143 = {};
        for _, v145 in v141.Keypoints do
            local v146 = nil;
            local v147 = nil;
            if typeof(v142) == "function" then
                local v148, v149 = v142(v145.Value, v145.Envelope);
                v146 = v148;
                v147 = v149;
            else
                v146 = v145.Value * v142;
                v147 = v145.Envelope * v142;
            end;
            table.insert(v143, NumberSequenceKeypoint.new(v145.Time, v146, v147));
        end;
        return NumberSequence.new(v143);
    end;
end;
v3.serializePath = @native function(v150) --[[ Line: 516 ]] --[[ Name: serializePath ]]
    local v151 = buffer.create(#v150 * 4 * 6);
    local v152 = 0;
    for v153, v154 in v150 do
        local l_Scale_0 = v154.Position.X.Scale;
        local l_Scale_1 = v154.Position.Y.Scale;
        if v153 ~= 1 then
            buffer.writef32(v151, v152, l_Scale_0 + v154.LeftTangent.X.Scale);
            buffer.writef32(v151, v152 + 4, l_Scale_1 + v154.LeftTangent.Y.Scale);
            v152 = v152 + 8;
        end;
        buffer.writef32(v151, v152, l_Scale_0);
        buffer.writef32(v151, v152 + 4, l_Scale_1);
        v152 = v152 + 8;
        if v153 ~= #v150 then
            buffer.writef32(v151, v152, l_Scale_0 + v154.RightTangent.X.Scale);
            buffer.writef32(v151, v152 + 4, l_Scale_1 + v154.RightTangent.Y.Scale);
            v152 = v152 + 8;
        end;
    end;
    return v151;
end;
v3.deserializePath = @native function(v157) --[[ Line: 549 ]] --[[ Name: deserializePath ]]
    local v158 = typeof(v157) == "string" and buffer.fromstring(v157) or v157;
    local v159 = buffer.len(v158) / 24;
    local v160 = {};
    for v161 = 0, v159 - 1 do
        local v162 = v161 * 4 * 6;
        table.insert(v160, (vector.create(buffer.readf32(v158, v162), (buffer.readf32(v158, v162 + 4)))));
        if v161 ~= v159 - 1 then
            local v163 = buffer.readf32(v158, v162 + 8);
            local v164 = buffer.readf32(v158, v162 + 12);
            local v165 = buffer.readf32(v158, v162 + 16);
            local v166 = buffer.readf32(v158, v162 + 20);
            table.insert(v160, (vector.create(v163, v164)));
            table.insert(v160, (vector.create(v165, v166)));
        end;
    end;
    return v160;
end;
v3.serializeFlipbook = @native function(v167) --[[ Line: 579 ]] --[[ Name: serializeFlipbook ]]
    local v168 = buffer.create(#v167 * 8);
    for v169, v170 in v167 do
        buffer.writef64(v168, (v169 - 1) * 8, v170);
    end;
    return v168;
end;
v3.deserializeFlipbook = @native function(v171) --[[ Line: 590 ]] --[[ Name: deserializeFlipbook ]]
    local v172 = typeof(v171) == "string" and buffer.fromstring(v171) or v171;
    local v173 = buffer.len(v172) / 8;
    local v174 = {};
    for v175 = 0, v173 - 1 do
        table.insert(v174, (buffer.readf64(v172, v175 * 8)));
    end;
    return v174;
end;
v3.default_bezier = buffer.tostring(v3.serializePath({
    Path2DControlPoint.new(UDim2.fromScale(0, 1), UDim2.new(), UDim2.fromScale(0.215, -0.61)), 
    Path2DControlPoint.new(UDim2.fromScale(1, 0), UDim2.fromScale(-0.645, 0), UDim2.new())
}));
v3.linear_bezier = buffer.tostring(v3.serializePath({
    Path2DControlPoint.new(UDim2.fromScale(0, 1)), 
    Path2DControlPoint.new(UDim2.fromScale(1, 0))
}));
return v3;