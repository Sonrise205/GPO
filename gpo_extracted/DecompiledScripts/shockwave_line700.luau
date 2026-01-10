local l_CollectionService_0 = game:GetService("CollectionService");
local v1 = require("./mod/tween");
local v2 = require("./mod/logger");
local v3 = require("./mod/utility");
local v4 = require("./obj/Bezier");
local _ = require("./obj/ObjectCache");
local v6 = require(script.Parent.obj.Promise);
local v7 = Random.new();
local v8 = {};
local v9 = nil;
v8.init = function(v10) --[[ Line: 18 ]] --[[ Name: init ]]
    -- upvalues: v9 (ref)
    v9 = v10;
end;
v8.deinit = function() --[[ Line: 22 ]] --[[ Name: deinit ]]
    -- upvalues: v9 (ref)
    v9 = nil;
end;
v8.emit = function(v11, v12, v13) --[[ Line: 26 ]] --[[ Name: emit ]]
    -- upvalues: v9 (ref), v3 (copy), l_CollectionService_0 (copy), v1 (copy), v2 (copy), v4 (copy), v7 (copy), v6 (copy)
    if not v9 then
        return;
    else
        local v14 = v3.getAttribute(v11, "RayDirection", (Vector3.new(0, -50, 0, 0)));
        local v15 = v3.getAttribute(v11, "RayCollisionGroup", "Default");
        local v16 = v3.getAttribute(v11, "FilterTag", "");
        local v17 = v3.getAttribute(v11, "FilterType", "Exclude");
        local v18 = v3.getAttribute(v11, "IgnoreWater", true);
        local v19 = v3.getAttribute(v11, "IgnoreCanCollide", false);
        local v20 = RaycastParams.new();
        v20.CollisionGroup = v15;
        v20.IgnoreWater = v18;
        v20.RespectCanCollide = not v19;
        v20.FilterType = Enum.RaycastFilterType[v17];
        v20.FilterDescendantsInstances = l_CollectionService_0:GetTagged(v16);
        if v17 == "Exclude" then
            v20:AddToFilter({
                workspace.Terrain
            });
        end;
        local v21 = v3.getAttribute(v12, "EmitDelay", 0);
        local v22 = v3.getAttribute(v12, "Rate_Start", 30);
        local v23 = v3.getAttribute(v12, "Rate_End", 30);
        local v24 = v3.getAttribute(v12, "FixedAmount", 0);
        local v25 = v3.getAttribute(v12, "Scale_Start", 1);
        local v26 = v3.getAttribute(v12, "Scale_End", 1);
        local v27 = v3.getAttribute(v12, "Duration", 1);
        local v28 = v3.getAttribute(v12, "Direction", (Vector3.new(0, 0, -1, 0)));
        local v29 = v3.getAttribute(v12, "Length", 50);
        local v30 = v3.getRangeAttribute(v12, "Rotation", NumberRange.new(-180, 180));
        local v31 = v3.getAttribute(v12, "PartOffset", Vector3.new(0, 0, 0, 0), true);
        local v32 = v3.getAttribute(v12, "BaseOffset", v31);
        local v33 = v3.getAttribute(v12, "Offset_Start", v31);
        local v34 = v3.getAttribute(v12, "Offset_End", v31);
        local v35 = v3.getAttribute(v12, "Offset_Start_Duration", 0.5);
        local v36 = v3.getAttribute(v12, "Offset_End_Duration", 0.5);
        local v37 = v3.getRangeAttribute(v12, "Lifetime", NumberRange.new(2, 3), NumberRange.new(0, 1e999));
        local v38 = v3.getAttribute(v12, "SizeScaleStart", (Vector3.new(0, 0, 0, 0)));
        local v39 = v3.getAttribute(v12, "SizeScaleEnd", (Vector3.new(0, 0, 0, 0)));
        local v40 = v3.getAttribute(v12, "MinSize", (Vector3.new(2, 1, 2, 0)));
        local v41 = v3.getAttribute(v12, "MaxSize", (Vector3.new(3, 2, 3, 0)));
        local v42 = v3.getAttribute(v12, "Size_Curve", v3.default_bezier, true);
        local v43 = v3.getAttribute(v12, "Size_Duration", 0.5, true);
        local v44 = v3.getAttribute(v12, "Size_Start_Curve", v42);
        local v45 = v3.getAttribute(v12, "Size_End_Curve", v42);
        local v46 = v3.getAttribute(v12, "Size_Start_Duration", v43);
        local v47 = v3.getAttribute(v12, "Size_End_Duration", v43);
        local v48 = v3.getAttribute(v12, "Transparency_Duration", 0.5);
        local v49 = v3.getAttribute(v12, "Transparency_Start", 0);
        local v50 = v3.getAttribute(v12, "Transparency_End", 0);
        local v51 = v3.getAttribute(v12, "SyncPosition", false);
        v27 = math.max(v27, 0.001);
        if v24 > 0 then
            local v52 = v24 / v27;
            v22 = v52;
            v23 = v52;
        end;
        v28 = v28.Unit;
        if v28 ~= v28 then
            v28 = Vector3.new(-0, -0, -1, -0);
        end;
        task.wait(v21);
        local v53 = {};
        local l_WorldCFrame_0 = v11.WorldCFrame;
        local v55 = 0;
        local v56 = 0;
        local l_v22_0 = v22;
        local l_v25_0 = v25;
        if v25 ~= v26 then
            table.insert(v13, v1.fromParams(v3.getAttribute(v12, "Scale_Curve", v3.default_bezier), v27, function(v59, v60) --[[ Line: 133 ]]
                -- upvalues: l_v25_0 (ref), v3 (ref), v25 (copy), v26 (copy)
                l_v25_0 = v3.lerp(v25, v26, v59);
                return v60;
            end));
        end;
        if v22 ~= v23 then
            table.insert(v13, v1.fromParams(v3.getAttribute(v12, "Rate_Curve", v3.default_bezier), v27, function(v61, v62) --[[ Line: 147 ]]
                -- upvalues: l_v22_0 (ref), v3 (ref), v22 (ref), v23 (ref)
                l_v22_0 = v3.lerp(v22, v23, v61);
                return v62;
            end));
        end;
        local v63 = v3.getAttribute(v12, "Path_Curve", v3.linear_bezier);
        local l_status_0, l_result_0 = pcall(function() --[[ Line: 157 ]]
            -- upvalues: v3 (ref), v63 (copy)
            return v3.deserializePath(v63);
        end);
        if not l_status_0 then
            v2.error((("failed to decode bezier path data with error: %*"):format(l_result_0)));
        end;
        local v66 = v4.new(l_result_0, 0);
        table.insert(v13, v1.fromParams(v3.linear_bezier, v27, function(_, v68) --[[ Line: 169 ]]
            -- upvalues: v55 (ref), l_v22_0 (ref), v27 (ref), v56 (ref), v66 (copy), v51 (copy), l_WorldCFrame_0 (ref), v11 (copy), v28 (ref), v29 (copy), v14 (copy), v20 (copy), v7 (ref), v40 (copy), v41 (copy), v3 (ref), v9 (ref), v12 (copy), v13 (copy), v49 (copy), v30 (copy), v33 (copy), v32 (copy), v1 (ref), v35 (copy), l_v25_0 (ref), v38 (copy), v44 (copy), v46 (copy), v53 (copy), v37 (copy), v39 (copy), v45 (copy), v47 (copy), v34 (copy), v36 (copy), v50 (copy), v48 (copy)
            v55 = v55 + v68;
            local v69 = 1 / l_v22_0;
            local v70 = v27 * l_v22_0;
            if v55 < v69 or v70 <= v56 then
                return v68;
            else
                for _ = 1, v55 // v69 do
                    if v70 > v56 then
                        v56 = v56 + 1;
                        local v72 = math.clamp(v56 / v70, 0, 1);
                        local v73 = 1 - v66:getEase(v72).y;
                        if v51 then
                            l_WorldCFrame_0 = v11.WorldCFrame;
                        end;
                        local v74 = workspace:Raycast(l_WorldCFrame_0.Position + l_WorldCFrame_0:VectorToWorldSpace(v28) * v29 * v73, v11.WorldCFrame:VectorToWorldSpace(v14), v20);
                        if not v74 then
                            v55 = 0;
                            return v68;
                        else
                            local v75 = v7:NextNumber(v40.X, v41.X);
                            local v76 = v7:NextNumber(v40.Y, v41.Y);
                            local v77 = v7:NextNumber(v40.Z, v41.Z);
                            local v78 = v3.getRanomId();
                            local v79 = v9:get(v78);
                            local v80 = v79._getReal();
                            v3.copyProperties(v12, v80, v3.COPY_PART_PROPERTIES);
                            v3.copyProperties(v12, v80, v3.COPY_EXTENDED_PART_PROPERTIES);
                            if #v12:GetChildren() ~= 0 then
                                local v81 = v12:Clone();
                                for _, v83 in v81:GetChildren() do
                                    v83.Parent = v80;
                                end;
                                v81:Destroy();
                            end;
                            table.insert(v13, function() --[[ Line: 230 ]]
                                -- upvalues: v9 (ref), v78 (copy)
                                if v9 then
                                    v9:free(v78);
                                end;
                            end);
                            v79.Color = v74.Instance.Color;
                            v79.Material = v74.Material;
                            v79.Transparency = v74.Instance.Transparency;
                            if v79.Transparency == 0 then
                                v79.Transparency = v49;
                            end;
                            v79.Size = Vector3.new(0, 0, 0, 0);
                            local v84 = v7:NextNumber(v30.Min, v30.Max);
                            local v85 = -math.cos(v84);
                            local v86 = -math.sin(v84);
                            local l_Unit_0 = v11.WorldCFrame:VectorToWorldSpace((Vector3.new(v85, 0, v86))):Cross(v74.Normal).Unit;
                            local v88 = CFrame.fromMatrix(v74.Position, l_Unit_0, v74.Normal) * CFrame.fromOrientation(-math.atan(v76 / v77), 0, 0);
                            v79.CFrame = CFrame.new(v33) * v88;
                            local v89 = nil;
                            local v90 = nil;
                            local v91 = Vector3.new(0, 0, 0, 0);
                            do
                                local l_v89_0, l_v90_0, l_v91_0 = v89, v90, v91;
                                if v33 ~= v32 then
                                    l_v90_0 = v1.fromParams(v3.getAttribute(v12, "Offset_Start_Curve", v3.default_bezier), v35, function(v95, v96) --[[ Line: 268 ]]
                                        -- upvalues: l_v91_0 (ref), v33 (ref), v32 (ref), v79 (copy), v88 (copy)
                                        l_v91_0 = v33:Lerp(v32, v95);
                                        v79.CFrame = CFrame.new(l_v91_0) * v88;
                                        return v96;
                                    end);
                                    table.insert(v13, l_v90_0);
                                end;
                                local v97 = Vector3.new(v75, v76, v77) * l_v25_0;
                                if v97 * v38 ~= v97 then
                                    l_v89_0 = v1.fromParams(v44, v46, function(v98, v99) --[[ Line: 281 ]]
                                        -- upvalues: v79 (copy), v97 (copy), v38 (ref)
                                        v79.Size = (v97 * v38):Lerp(v97, v98);
                                        return v99;
                                    end);
                                    table.insert(v13, l_v89_0);
                                else
                                    v79.Size = v97 * v38;
                                end;
                                if shared.vfx and #v79:GetChildren() ~= 0 then
                                    local v100 = shared.vfx.emit(v80);
                                    table.insert(v53, v100.Finished);
                                end;
                                task.delay(v7:NextNumber(v37.Min, v37.Max), function() --[[ Line: 296 ]]
                                    -- upvalues: l_v89_0 (ref), l_v90_0 (ref), v79 (copy), v97 (copy), v39 (ref), v13 (ref), v1 (ref), v45 (ref), v47 (ref), l_v91_0 (ref), v34 (ref), v3 (ref), v12 (ref), v36 (ref), v88 (copy), v50 (ref), v48 (ref)
                                    if l_v89_0 then
                                        l_v89_0:Disconnect();
                                    end;
                                    if l_v90_0 then
                                        l_v90_0:Disconnect();
                                    end;
                                    local l_Size_0 = v79.Size;
                                    local l_Transparency_0 = v79.Transparency;
                                    if l_Size_0 ~= v97 * v39 then
                                        table.insert(v13, v1.fromParams(v45, v47, function(v103, v104) --[[ Line: 311 ]]
                                            -- upvalues: v79 (ref), l_Size_0 (copy), v97 (ref), v39 (ref)
                                            v79.Size = l_Size_0:Lerp(v97 * v39, v103);
                                            return v104;
                                        end));
                                    end;
                                    if l_v91_0 ~= v34 then
                                        table.insert(v13, v1.fromParams(v3.getAttribute(v12, "Offset_End_Curve", v3.default_bezier), v36, function(v105, v106) --[[ Line: 324 ]]
                                            -- upvalues: v79 (ref), l_v91_0 (ref), v34 (ref), v88 (ref)
                                            v79.CFrame = CFrame.new(l_v91_0:Lerp(v34, v105)) * v88;
                                            return v106;
                                        end));
                                    end;
                                    if l_Transparency_0 ~= v50 then
                                        table.insert(v13, v1.fromParams(v3.getAttribute(v12, "Transparency_Curve", v3.default_bezier), v48, function(v107, v108) --[[ Line: 338 ]]
                                            -- upvalues: v79 (ref), v3 (ref), l_Transparency_0 (copy), v50 (ref)
                                            v79.Transparency = v3.lerp(l_Transparency_0, v50, v107);
                                            return v108;
                                        end));
                                        return;
                                    else
                                        v79.Transparency = l_Transparency_0;
                                        return;
                                    end;
                                end);
                            end;
                        end;
                    end;
                end;
                v55 = v55 % v69;
                return v68;
            end;
        end, nil, nil, true, v3.RENDER_PRIORITY + v13.depth));
        task.wait(v37.Max + v27 + math.max(v47, v36));
        v6.all(v53):await();
        return;
    end;
end;
return v8;