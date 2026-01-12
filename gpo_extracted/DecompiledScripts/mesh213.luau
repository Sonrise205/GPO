local l_RunService_0 = game:GetService("RunService");
local l_CollectionService_0 = game:GetService("CollectionService");
local v2 = require("./mod/tween");
local v3 = require("./mod/utility");
local v4 = require("./mod/color/Oklab");
local v5 = require("./obj/Promise");
local v6 = Random.new();
return {
    emit = function(v7, v8, v9, v10, v11) --[[ Line: 14 ]] --[[ Name: emit ]]
        -- upvalues: v3 (copy), v6 (copy), v2 (copy), l_RunService_0 (copy), v4 (copy), l_CollectionService_0 (copy), v5 (copy)
        local l_Start_0 = v7:FindFirstChild("Start");
        local l_End_0 = v7:FindFirstChild("End");
        if not l_Start_0 or not l_End_0 or not l_Start_0:IsA("BasePart") or not l_End_0:IsA("BasePart") or v7:GetAttribute("Enabled") and not v11 then
            return;
        else
            local v14 = v3.getAttribute(v7, "Duration", 1, true);
            local v15 = v3.getRangeAttribute(v7, "EffectDuration", NumberRange.new(v14, v14), NumberRange.new(0, 1e999));
            local v16 = v6:NextNumber(v15.Min, v15.Max);
            local v17 = v3.getAttribute(v7, "EmitDelay", 0);
            local v18 = v3.getAttribute(v7, "EmitDuration", 0, true);
            local v19 = v3.getAttribute(v7, "Flipbook", false, true);
            local v20 = v3.getAttribute(v7, "FlipbookFadeOffset", 0, true);
            local v21 = nil;
            v21 = not v19 and l_Start_0:FindFirstChildOfClass("Decal") and "Decal_" or "Mesh_";
            local l_v7_Attribute_0 = v7:GetAttribute("StartTransparency");
            if l_v7_Attribute_0 ~= nil then
                v7:SetAttribute(v21 .. "StartTransparency", l_v7_Attribute_0);
                v7:SetAttribute("StartTransparency", nil);
            end;
            local l_v7_Attribute_1 = v7:GetAttribute("EndTransparency");
            if l_v7_Attribute_1 ~= nil then
                v7:SetAttribute(v21 .. "EndTransparency", l_v7_Attribute_1);
                v7:SetAttribute("EndTransparency", nil);
            end;
            v21 = false;
            if v7:GetAttribute("Enabled") ~= nil then
                v21 = v7:HasTag(v3.ENABLED_VFX_TAG) and v16 > 0;
            end;
            l_v7_Attribute_0 = v3.getAttribute(v7, "Decal_StartTransparency", 0, true);
            l_v7_Attribute_1 = v3.getAttribute(v7, "Decal_EndTransparency", 1, true);
            local v24 = 0;
            if l_Start_0 and l_Start_0:FindFirstChildOfClass("Decal") then
                v24 = 1;
            end;
            local v25 = v3.getAttribute(v7, "Mesh_StartTransparency", v24, true);
            local v26 = v3.getAttribute(v7, "Mesh_EndTransparency", v24, true);
            local v27 = v3.getAttribute(v7, "SyncPosition", false);
            local v28 = v3.getAttribute(v7, "Speed_Start", 1);
            local v29 = v3.getAttribute(v7, "Speed_End", 1);
            local v30 = v3.getAttribute(v7, "Part_Transparency_Start", v25);
            local v31 = v3.getAttribute(v7, "Part_Transparency_End", v26);
            local v32 = v3.getAttribute(v7, "SpreadAngle", (Vector3.new(0, 0, 0, 0)));
            local v33 = v3.getRangeAttribute(v7, "Part_RotSpeed_Start", NumberRange.new(0, 0));
            local v34 = v3.getRangeAttribute(v7, "Part_RotSpeed_End", NumberRange.new(0, 0));
            local v35 = v3.getAttribute(v7, "RotAroundOrigin", false);
            local v36 = v3.getAttribute(v7, "MinInitRot", (Vector3.new(0, 0, 0, 0)));
            local v37 = v3.getAttribute(v7, "MaxInitRot", (Vector3.new(0, 0, 0, 0)));
            local v38 = v6:NextNumber(v33.Min, v33.Max);
            local v39 = v6:NextNumber(v34.Min, v34.Max);
            local v40 = vector.create(v6:NextNumber(v36.x, v37.x), v6:NextNumber(v36.y, v37.y), v6:NextNumber(v36.z, v37.z)) * v3.DEG_TO_RAD;
            task.wait(v17);
            if v21 and not v11 then
                v7:SetAttribute("Enabled", true);
                if v28 ~= v29 then
                    v7:SetAttribute("SpeedTweening", true);
                    table.insert(v9, v2.fromParams(v3.getAttribute(v7, "Speed_Curve", v3.default_bezier), v3.getAttribute(v7, "Speed_Duration", 0.1), function(v41, v42) --[[ Line: 128 ]]
                        -- upvalues: v7 (copy), v3 (ref), v28 (copy), v29 (copy)
                        v7:SetAttribute("SpeedOverride", v3.lerp(v28, v29, v41));
                        return v42;
                    end, nil, function() --[[ Line: 133 ]]
                        -- upvalues: v7 (copy)
                        v7:SetAttribute("SpeedTweening", nil);
                    end));
                end;
                task.wait(v18);
                v7:SetAttribute("Enabled", false);
                v7:SetAttribute("SpeedOverride", nil);
                return;
            else
                local v43 = v7:FindFirstAncestorOfClass("Attachment") or l_Start_0;
                local v44 = typeof(v8) == "table" and v8._getReal() or v8;
                local function _() --[[ Line: 151 ]] --[[ Name: getOrigin ]]
                    -- upvalues: v43 (copy)
                    return v43:IsA("Attachment") and v43.WorldCFrame or v43.CFrame;
                end;
                local v46 = v43:IsA("Attachment") and v43.WorldCFrame or v43.CFrame;
                local v47 = l_Start_0.CFrame:ToObjectSpace(l_End_0.CFrame);
                local l_v28_0 = v28;
                local l_v38_0 = v38;
                local v50 = CFrame.fromOrientation(v40.x, v40.y, v40.z);
                local l_identity_0 = CFrame.identity;
                local v52 = CFrame.fromOrientation(math.rad((v6:NextNumber(-v32.x, v32.x))), math.rad((v6:NextNumber(-v32.y, v32.y))), 0);
                local function v57(v53) --[[ Line: 170 ]] --[[ Name: updatePos ]]
                    -- upvalues: v27 (copy), v43 (copy), v46 (copy), v40 (copy), l_v38_0 (ref), v50 (ref), v35 (copy), v52 (copy), l_identity_0 (ref), v8 (copy)
                    local v54 = v27 and (v43:IsA("Attachment") and v43.WorldCFrame or v43.CFrame) or v46;
                    local v55 = v40:Sign() * l_v38_0 * v53;
                    v50 = v50 * CFrame.fromOrientation(v55.x, v55.y, v55.z);
                    local _ = nil;
                    v8.CFrame = (if v35 then v54 * v52 * v50 * l_identity_0 else v54 * v52 * l_identity_0 * v50) * v50;
                end;
                v57(0);
                local v58 = v3.getRanomId();
                l_RunService_0:BindToRenderStep(v58, v3.RENDER_PRIORITY + v9.depth, v57);
                local l_v58_0 = v58 --[[ copy: 45 -> 73 ]];
                table.insert(v9, function() --[[ Line: 196 ]]
                    -- upvalues: l_RunService_0 (ref), l_v58_0 (copy)
                    l_RunService_0:UnbindFromRenderStep(l_v58_0);
                end);
                v58 = {};
                local l_EmitOnFinish_0 = v8:FindFirstChild("EmitOnFinish");
                if l_EmitOnFinish_0 then
                    l_EmitOnFinish_0.Parent = nil;
                end;
                if shared.vfx and #v8:GetChildren() ~= 0 then
                    table.insert(v58, shared.vfx.emit(v8).Finished);
                end;
                local v61 = nil;
                if v28 ~= v29 and not v7:GetAttribute("SpeedOverride") then
                    v61 = v2.fromParams(v3.getAttribute(v7, "Speed_Curve", v3.default_bezier), v3.getAttribute(v7, "Speed_Duration", 0.1), function(v62, v63) --[[ Line: 220 ]]
                        -- upvalues: l_v28_0 (ref), v3 (ref), v28 (copy), v29 (copy)
                        l_v28_0 = v3.lerp(v28, v29, v62);
                        return v63;
                    end);
                    table.insert(v9, v61);
                end;
                if v47 ~= CFrame.identity then
                    table.insert(v9, v2.fromParams(v3.getAttribute(v7, "Part_CFrame_Curve", v3.default_bezier), v16, function(v64, v65) --[[ Line: 235 ]]
                        -- upvalues: l_identity_0 (ref), v47 (copy), v7 (copy), l_v28_0 (ref)
                        l_identity_0 = CFrame.identity:Lerp(v47, v64);
                        return v65 * (v7:GetAttribute("SpeedOverride") or l_v28_0);
                    end, v61));
                end;
                if v38 ~= v39 then
                    table.insert(v9, v2.fromParams(v3.getAttribute(v7, "Part_RotSpeed_Curve", v3.default_bezier), v16, function(v66, v67) --[[ Line: 250 ]]
                        -- upvalues: l_v38_0 (ref), v3 (ref), v38 (copy), v39 (copy), v7 (copy), l_v28_0 (ref)
                        l_v38_0 = v3.lerp(v38, v39, v66);
                        return v67 * (v7:GetAttribute("SpeedOverride") or l_v28_0);
                    end, v61));
                end;
                if v30 ~= v31 then
                    table.insert(v9, v2.fromParams(v3.getAttribute(v7, "Part_Transparency_Curve", v3.default_bezier), v16, function(v68, v69) --[[ Line: 265 ]]
                        -- upvalues: v8 (copy), v3 (ref), v30 (copy), v31 (copy), v7 (copy), l_v28_0 (ref)
                        v8.Transparency = v3.lerp(v30, v31, v68);
                        return v69 * (v7:GetAttribute("SpeedOverride") or l_v28_0);
                    end, v61));
                else
                    v8.Transparency = v30;
                end;
                local v70 = l_Start_0.Size * v10;
                local v71 = l_End_0.Size * v10;
                if v70 ~= v71 then
                    table.insert(v9, v2.fromParams(v3.getAttribute(v7, "Part_Size_Curve", v3.default_bezier), v16, function(v72, v73) --[[ Line: 284 ]]
                        -- upvalues: v8 (copy), v70 (copy), v71 (copy), v7 (copy), l_v28_0 (ref)
                        v8.Size = v70:Lerp(v71, v72);
                        return v73 * (v7:GetAttribute("SpeedOverride") or l_v28_0);
                    end, v61));
                else
                    v8.Size = v70;
                end;
                local l_SpecialMesh_0 = l_Start_0:FindFirstChildOfClass("SpecialMesh");
                local l_SpecialMesh_1 = l_End_0:FindFirstChildOfClass("SpecialMesh");
                local l_SpecialMesh_2 = v8:FindFirstChildOfClass("SpecialMesh");
                if l_SpecialMesh_2 then
                    if l_SpecialMesh_0 and l_SpecialMesh_1 then
                        local v77 = l_SpecialMesh_0.Scale * v10;
                        local v78 = l_SpecialMesh_1.Scale * v10;
                        if v77 ~= v78 then
                            local l_v77_0 = v77 --[[ copy: 53 -> 76 ]];
                            local l_v78_0 = v78 --[[ copy: 54 -> 77 ]];
                            table.insert(v9, v2.fromParams(v3.getAttribute(v7, "Mesh_Scale_Curve", v3.default_bezier), v16, function(v81, v82) --[[ Line: 310 ]]
                                -- upvalues: l_SpecialMesh_2 (copy), v3 (ref), l_v77_0 (copy), l_v78_0 (copy), v7 (copy), l_v28_0 (ref)
                                l_SpecialMesh_2.Scale = v3.lerp(l_v77_0, l_v78_0, v81);
                                return v82 * (v7:GetAttribute("SpeedOverride") or l_v28_0);
                            end, v61));
                        end;
                    else
                        l_SpecialMesh_2.Parent = nil;
                        table.insert(v9, function() --[[ Line: 321 ]]
                            -- upvalues: l_SpecialMesh_2 (copy), v44 (copy)
                            l_SpecialMesh_2.Parent = v44;
                        end);
                    end;
                end;
                local v83, v84, v85 = v3.getMeshDecals(v7, v8);
                local v86 = 0;
                if v19 then
                    table.sort(v83, function(v87, v88) --[[ Line: 332 ]]
                        local v89 = v87.Name:match("%d+") or 0;
                        local v90 = v88.Name:match("%d+") or 0;
                        return tonumber(v89) < tonumber(v90);
                    end);
                    local l_Decal_0 = Instance.new("Decal");
                    l_Decal_0.Parent = v44;
                    table.insert(v9, l_Decal_0);
                    if v20 > 0 and l_v7_Attribute_0 ~= l_v7_Attribute_1 then
                        local l_l_Decal_0_0 = l_Decal_0 --[[ copy: 57 -> 75 ]];
                        table.insert(v9, v2.fromParams(v3.default_bezier, v16 + v20, function(v93, v94) --[[ Line: 348 ]]
                            -- upvalues: l_l_Decal_0_0 (copy), v3 (ref), l_v7_Attribute_0 (copy), l_v7_Attribute_1 (copy), v7 (copy), l_v28_0 (ref)
                            l_l_Decal_0_0.Transparency = v3.lerp(l_v7_Attribute_0, l_v7_Attribute_1, v93);
                            return v94 * (v7:GetAttribute("SpeedOverride") or l_v28_0);
                        end, v61));
                    end;
                    local l_l_Decal_0_1 = l_Decal_0 --[[ copy: 57 -> 74 ]];
                    table.insert(v9, v2.fromParams(v3.default_bezier, v16, function(v96, v97) --[[ Line: 358 ]]
                        -- upvalues: v83 (copy), l_l_Decal_0_1 (copy), v20 (copy), v3 (ref), l_v7_Attribute_0 (copy), l_v7_Attribute_1 (copy), v7 (copy), l_v28_0 (ref)
                        local v98 = v83[math.max(math.round(#v83 * v96), 1)];
                        l_l_Decal_0_1.Texture = v98.Texture;
                        l_l_Decal_0_1.Color3 = v98.Color3;
                        l_l_Decal_0_1.ZIndex = v98.ZIndex;
                        if v20 == 0 then
                            l_l_Decal_0_1.Transparency = v3.lerp(l_v7_Attribute_0, l_v7_Attribute_1, v96);
                            l_l_Decal_0_1.ZIndex = v98.ZIndex;
                        end;
                        return v97 * (v7:GetAttribute("SpeedOverride") or l_v28_0);
                    end, v61));
                else
                    for _, v100 in v83 do
                        local v101 = v85[v100];
                        local v102 = v3.getAttribute(v100, "Transparency_Start", l_v7_Attribute_0);
                        local v103 = v3.getAttribute(v100, "Transparency_End", l_v7_Attribute_1);
                        if v102 ~= v103 then
                            table.insert(v9, v2.fromParams(v3.getAttribute(v100, "Transparency_Curve", v3.default_bezier), v16, function(v104, v105) --[[ Line: 389 ]]
                                -- upvalues: v100 (copy), v3 (ref), v102 (copy), v103 (copy), v7 (copy), l_v28_0 (ref)
                                v100.Transparency = v3.lerp(v102, v103, v104);
                                return v105 * (v7:GetAttribute("SpeedOverride") or l_v28_0);
                            end, v61));
                        else
                            v100.Transparency = v102;
                        end;
                        if v100.Color3 ~= v101.Color3 then
                            table.insert(v9, v2.fromParams(v3.getAttribute(v100, "Color_Curve", v3.default_bezier), v16, function(v106, v107) --[[ Line: 406 ]]
                                -- upvalues: v4 (ref), v100 (copy), v101 (copy), v100 (copy), v7 (copy), l_v28_0 (ref)
                                local v108 = v4.fromSRGB(v100.Color3);
                                local v109 = v4.fromSRGB(v101.Color3);
                                v100.Color3 = v4.toSRGB(v108:Lerp(v109, v106), true);
                                return v107 * (v7:GetAttribute("SpeedOverride") or l_v28_0);
                            end, v61));
                        end;
                        local v110 = v84[v100];
                        if v110 then
                            local v111 = v3.getAttribute(v100, "Flipbook_Change_Duration", v16);
                            if v3.getAttribute(v100, "SyncDuration", false) then
                                v111 = v16;
                            end;
                            if v86 < v111 then
                                v86 = v111;
                            end;
                            local v112 = false;
                            if l_RunService_0:IsStudio() then
                                for _, v114 in l_CollectionService_0:GetTags(v100) do
                                    if v114:match("^_local_flipbook_") then
                                        v112 = true;
                                        break;
                                    end;
                                end;
                            end;
                            do
                                local l_v112_0 = v112;
                                table.insert(v9, v2.fromParams(v3.getAttribute(v100, "Flipbook_Change_Curve", v3.linear_bezier), v111, function(v116, v117) --[[ Line: 448 ]]
                                    -- upvalues: v110 (copy), v100 (copy), l_v112_0 (ref), v7 (copy), l_v28_0 (ref)
                                    local v118 = math.max(math.round(#v110 * v116), 1);
                                    v100.Texture = ("%*%*"):format(l_v112_0 and "rbxtemp://" or "rbxassetid://", v110[v118]);
                                    return v117 * (v7:GetAttribute("SpeedOverride") or l_v28_0);
                                end, v61));
                            end;
                        end;
                    end;
                end;
                v2.timer(math.max(v16, v86) + v20, function(v119, v120) --[[ Line: 461 ]]
                    -- upvalues: v7 (copy), l_v28_0 (ref), v61 (ref)
                    local v121 = v7:GetAttribute("SpeedOverride") or l_v28_0;
                    l_v28_0 = v121;
                    if v121 > 0 or v120 > 0 and if v61 then v61.Connected else v7:GetAttribute("SpeedTweening") then
                        return v119 * v121;
                    else
                        return nil;
                    end;
                end, v61, v9);
                v5.all(v58):await();
                local v122 = l_EmitOnFinish_0 and l_EmitOnFinish_0:GetChildren();
                if v122 and #v122 ~= 0 then
                    for _, v124 in v122 do
                        v124.Parent = v44;
                    end;
                    shared.vfx.emit(table.unpack(v122)).Finished:await();
                end;
                return;
            end;
        end;
    end
};