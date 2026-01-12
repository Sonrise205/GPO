local l_CollectionService_0 = game:GetService("CollectionService");
local v1 = require("./mod/tween");
local v2 = require("./mod/utility");
local v3 = require(script.Parent.obj.Promise);
local _ = require("./obj/ObjectCache");
local v5 = Random.new();
local v6 = {};
local v7 = nil;
v6.init = function(v8) --[[ Line: 15 ]] --[[ Name: init ]]
    -- upvalues: v7 (ref)
    v7 = v8;
end;
v6.deinit = function() --[[ Line: 19 ]] --[[ Name: deinit ]]
    -- upvalues: v7 (ref)
    v7 = nil;
end;
v6.emit = function(v9, v10, v11) --[[ Line: 23 ]] --[[ Name: emit ]]
    -- upvalues: v7 (ref), v2 (copy), l_CollectionService_0 (copy), v5 (copy), v1 (copy), v3 (copy)
    if not v7 then
        return;
    else
        local v12 = v2.getAttribute(v9, "RayDirection", (Vector3.new(0, -50, 0, 0)));
        local v13 = v2.getAttribute(v9, "RayCollisionGroup", "Default");
        local v14 = v2.getAttribute(v9, "FilterTag", "");
        local v15 = v2.getAttribute(v9, "FilterType", "Exclude");
        local v16 = v2.getAttribute(v9, "IgnoreWater", true);
        local v17 = v2.getAttribute(v9, "IgnoreCanCollide", false);
        local v18 = RaycastParams.new();
        v18.CollisionGroup = v13;
        v18.IgnoreWater = v16;
        v18.RespectCanCollide = not v17;
        v18.FilterType = Enum.RaycastFilterType[v15];
        v18.FilterDescendantsInstances = l_CollectionService_0:GetTagged(v14);
        if v15 == "Exclude" then
            v18:AddToFilter({
                workspace.Terrain
            });
        end;
        local v19 = v2.getAttribute(v10, "EmitDelay", 0);
        local v20 = v2.getAttribute(v10, "Radius", 5);
        local v21 = v2.getAttribute(v10, "Segments", 7);
        local v22 = v2.getRangeAttribute(v10, "Lifetime", NumberRange.new(2, 3), NumberRange.new(0, 1e999));
        local v23 = v2.getAttribute(v10, "PartOffset", Vector3.new(0, 0, 0, 0), true);
        local v24 = v2.getAttribute(v10, "BaseOffset", v23);
        local v25 = v2.getAttribute(v10, "Offset_Start", v23);
        local v26 = v2.getAttribute(v10, "Offset_End", v23);
        local v27 = v2.getAttribute(v10, "Offset_Start_Duration", 0.5);
        local v28 = v2.getAttribute(v10, "Offset_End_Duration", 0.5);
        local v29 = v2.getAttribute(v10, "SizeScaleStart", (Vector3.new(0, 0, 0, 0)));
        local v30 = v2.getAttribute(v10, "SizeScaleEnd", (Vector3.new(0, 0, 0, 0)));
        local v31 = v2.getAttribute(v10, "MinSize", (Vector3.new(2, 1, 2, 0)));
        local v32 = v2.getAttribute(v10, "MaxSize", (Vector3.new(3, 2, 3, 0)));
        local v33 = v2.getAttribute(v10, "Size_Curve", v2.default_bezier, true);
        local v34 = v2.getAttribute(v10, "Size_Duration", 0.5, true);
        local v35 = v2.getAttribute(v10, "Size_Start_Curve", v33);
        local v36 = v2.getAttribute(v10, "Size_End_Curve", v33);
        local v37 = v2.getAttribute(v10, "Size_Start_Duration", v34);
        local v38 = v2.getAttribute(v10, "Size_End_Duration", v34);
        local v39 = v2.getAttribute(v10, "Transparency_Duration", 0.5);
        local v40 = v2.getAttribute(v10, "Transparency_Start", 0);
        local v41 = v2.getAttribute(v10, "Transparency_End", 0);
        task.wait(v19);
        local v42 = {};
        for v43 = 0, v21 - 1 do
            local v44 = v43 / v21 * 3.141592653589793 * 2;
            local v45 = v20 * math.cos(v44);
            local v46 = v20 * math.sin(v44);
            local v47 = workspace:Raycast((v9.WorldCFrame * CFrame.new(v45, 0, v46)).Position, v9.WorldCFrame:VectorToWorldSpace(v12), v18);
            if v47 then
                local v48 = v5:NextNumber(v31.X, v32.X);
                local v49 = v5:NextNumber(v31.Y, v32.Y);
                local v50 = v5:NextNumber(v31.Z, v32.Z);
                local v51 = v2.getRanomId();
                local v52 = v7:get(v51);
                local v53 = v52._getReal();
                v2.copyProperties(v10, v53, v2.COPY_PART_PROPERTIES);
                v2.copyProperties(v10, v53, v2.COPY_EXTENDED_PART_PROPERTIES);
                if #v10:GetChildren() ~= 0 then
                    local v54 = v10:Clone();
                    for _, v56 in v54:GetChildren() do
                        v56.Parent = v53;
                    end;
                    v54:Destroy();
                end;
                table.insert(v11, function() --[[ Line: 128 ]]
                    -- upvalues: v7 (ref), v51 (copy)
                    if v7 then
                        v7:free(v51);
                    end;
                end);
                v52.Color = v47.Instance.Color;
                v52.Material = v47.Material;
                v52.Transparency = v47.Instance.Transparency;
                if v52.Transparency == 0 then
                    v52.Transparency = v40;
                end;
                v52.Size = Vector3.new(0, 0, 0, 0);
                local v57 = -math.cos(v44);
                local v58 = -math.sin(v44);
                local l_Unit_0 = v9.WorldCFrame:VectorToWorldSpace((Vector3.new(v57, 0, v58))):Cross(v47.Normal).Unit;
                local v60 = CFrame.fromMatrix(v47.Position, l_Unit_0, v47.Normal) * CFrame.fromOrientation(-math.atan(v49 / v50), 0, 0);
                v52.CFrame = CFrame.new(v25) * v60;
                local v61 = nil;
                local v62 = nil;
                local v63 = Vector3.new(0, 0, 0, 0);
                do
                    local l_v61_0, l_v62_0, l_v63_0 = v61, v62, v63;
                    if v25 ~= v24 then
                        l_v62_0 = v1.fromParams(v2.getAttribute(v10, "Offset_Start_Curve", v2.default_bezier), v27, function(v67, v68) --[[ Line: 164 ]]
                            -- upvalues: l_v63_0 (ref), v25 (copy), v24 (copy), v52 (copy), v60 (copy)
                            l_v63_0 = v25:Lerp(v24, v67);
                            v52.CFrame = CFrame.new(l_v63_0) * v60;
                            return v68;
                        end);
                        table.insert(v11, l_v61_0);
                    end;
                    local v69 = Vector3.new(v48, v49, v50);
                    if v69 * v29 ~= v69 then
                        l_v61_0 = v1.fromParams(v35, v37, function(v70, v71) --[[ Line: 177 ]]
                            -- upvalues: v52 (copy), v69 (copy), v29 (copy)
                            v52.Size = (v69 * v29):Lerp(v69, v70);
                            return v71;
                        end);
                        table.insert(v11, l_v61_0);
                    else
                        v52.Size = v69 * v29;
                    end;
                    if shared.vfx and #v52:GetChildren() ~= 0 then
                        table.insert(v42, shared.vfx.emit(v52).Finished);
                    end;
                    task.delay(v5:NextNumber(v22.Min, v22.Max), function() --[[ Line: 192 ]]
                        -- upvalues: l_v61_0 (ref), l_v62_0 (ref), v52 (copy), v69 (copy), v30 (copy), v11 (copy), v1 (ref), v36 (copy), v38 (copy), l_v63_0 (ref), v26 (copy), v2 (ref), v10 (copy), v28 (copy), v60 (copy), v41 (copy), v39 (copy)
                        if l_v61_0 then
                            l_v61_0:Disconnect();
                        end;
                        if l_v62_0 then
                            l_v62_0:Disconnect();
                        end;
                        local l_Size_0 = v52.Size;
                        local l_Transparency_0 = v52.Transparency;
                        if l_Size_0 ~= v69 * v30 then
                            table.insert(v11, v1.fromParams(v36, v38, function(v74, v75) --[[ Line: 207 ]]
                                -- upvalues: v52 (ref), l_Size_0 (copy), v69 (ref), v30 (ref)
                                v52.Size = l_Size_0:Lerp(v69 * v30, v74);
                                return v75;
                            end));
                        end;
                        if l_v63_0 ~= v26 then
                            table.insert(v11, v1.fromParams(v2.getAttribute(v10, "Offset_End_Curve", v2.default_bezier), v28, function(v76, v77) --[[ Line: 220 ]]
                                -- upvalues: v52 (ref), l_v63_0 (ref), v26 (ref), v60 (ref)
                                v52.CFrame = CFrame.new(l_v63_0:Lerp(v26, v76)) * v60;
                                return v77;
                            end));
                        end;
                        if l_Transparency_0 ~= v41 then
                            table.insert(v11, v1.fromParams(v2.getAttribute(v10, "Transparency_Curve", v2.default_bezier), v39, function(v78, v79) --[[ Line: 234 ]]
                                -- upvalues: v52 (ref), v2 (ref), l_Transparency_0 (copy), v41 (ref)
                                v52.Transparency = v2.lerp(l_Transparency_0, v41, v78);
                                return v79;
                            end));
                            return;
                        else
                            v52.Transparency = l_Transparency_0;
                            return;
                        end;
                    end);
                end;
            end;
        end;
        task.wait(v22.Max + math.max(v38, v28));
        v3.all(v42):await();
        return;
    end;
end;
return v6;