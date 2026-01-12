local l_RunService_0 = game:GetService("RunService");
local l_CollectionService_0 = game:GetService("CollectionService");
local v2 = require("./mod/tween");
local v3 = require("./mod/utility");
local _ = require("./obj/ObjectCache");
local v5 = require(script.Parent.obj.Promise);
local v6 = Random.new();
local v7 = {};
local v8 = {};
local v9 = nil;
local v10 = nil;
v7.init = function(v11) --[[ Line: 18 ]] --[[ Name: init ]]
    -- upvalues: v10 (ref), v9 (ref), l_RunService_0 (copy), v8 (copy)
    if v10 then
        return;
    else
        v9 = v11;
        if l_RunService_0:IsStudio() and script:FindFirstAncestorOfClass("Plugin") then
            v10 = l_RunService_0.RenderStepped:Connect(function(v12) --[[ Line: 26 ]]
                -- upvalues: v8 (ref)
                if #v8 == 0 then
                    return;
                else
                    workspace:StepPhysics(v12, v8);
                    return;
                end;
            end);
        end;
        return;
    end;
end;
v7.deinit = function() --[[ Line: 36 ]] --[[ Name: deinit ]]
    -- upvalues: v10 (ref), v9 (ref), v8 (copy)
    if v10 then
        v10:Disconnect();
        v10 = nil;
    end;
    v9 = nil;
    for _, v14 in v8 do
        v14:Destroy();
    end;
    table.clear(v8);
end;
v7.emit = function(v15, v16, v17) --[[ Line: 51 ]] --[[ Name: emit ]]
    -- upvalues: v9 (ref), v3 (copy), l_CollectionService_0 (copy), v6 (copy), v8 (copy), v2 (copy), v5 (copy)
    if not v9 then
        return;
    else
        local v18 = nil;
        local v19 = v3.getAttribute(v16, "InheritanceEnabled", true);
        local v20 = v3.getAttribute(v16, "InheritanceRadius", 5);
        if v19 then
            local v21 = v3.getAttribute(v16, "InheritanceMaxResults", 5);
            local v22 = v3.getAttribute(v15, "RayCollisionGroup", "Default");
            local v23 = v3.getAttribute(v15, "FilterTag", "");
            local v24 = v3.getAttribute(v15, "FilterType", "Exclude");
            local v25 = v3.getAttribute(v15, "IgnoreCanCollide", false);
            v18 = OverlapParams.new();
            v18.MaxParts = v21;
            v18.CollisionGroup = v22;
            v18.RespectCanCollide = not v25;
            v18.FilterType = Enum.RaycastFilterType[v24];
            v18.FilterDescendantsInstances = l_CollectionService_0:GetTagged(v23);
            if v24 == "Exclude" then
                v18:AddToFilter({
                    workspace.Terrain
                });
            end;
        end;
        local v26 = v3.getAttribute(v16, "EmitDelay", 0);
        local v27 = v3.getRangeAttribute(v16, "Amount", NumberRange.new(5, 10), NumberRange.new(0, 1e999));
        local v28 = v3.getRangeAttribute(v16, "Lifetime", NumberRange.new(2, 3), NumberRange.new(0, 1e999));
        local v29 = v3.getRangeAttribute(v16, "Airtime", NumberRange.new(0.5, 0.5), NumberRange.new(0, 1e999));
        local v30 = v3.getRangeAttribute(v16, "LinearMagnitude", NumberRange.new(15, 25));
        local v31 = v3.getRangeAttribute(v16, "AngularMagnitude", NumberRange.new(5, 15));
        local v32 = v3.getAttribute(v16, "SizeScaleEnd", (Vector3.new(0, 0, 0, 0)));
        local v33 = v3.getAttribute(v16, "MinSize", (Vector3.new(2, 1, 2, 0)));
        local v34 = v3.getAttribute(v16, "MaxSize", (Vector3.new(3, 2, 3, 0)));
        local v35 = v3.getAttribute(v16, "MinDirection", (Vector3.new(-1, -1, -1, -0)));
        local v36 = v3.getAttribute(v16, "MaxDirection", (Vector3.new(1, 1, 1, 0)));
        local v37 = v6:NextInteger(v27.Min, v27.Max);
        local v38 = v3.getAttribute(v16, "Size_Curve", v3.default_bezier);
        local v39 = v3.getAttribute(v16, "Transparency_Curve", v3.default_bezier);
        local v40 = v3.getAttribute(v16, "Transparency_Duration", 0.5);
        local v41 = v3.getAttribute(v16, "Size_Duration", 0.5);
        local v42 = v3.getAttribute(v16, "Transparency_Start", 0);
        local v43 = v3.getAttribute(v16, "Transparency_End", 1);
        local v44 = {};
        local v45 = {};
        v16.CanCollide = false;
        if v18 then
            for _, v47 in (workspace:GetPartBoundsInRadius(v15.WorldPosition, v20, v18)) do
                if v47.Transparency ~= 1 then
                    table.insert(v44, v47);
                end;
            end;
        end;
        task.wait(v26);
        for _ = 1, v37 do
            local v49 = false;
            if #v44 ~= 0 then
                v49 = v44[v6:NextInteger(1, #v44)];
            end;
            local v50 = v3.getRanomId();
            local v51 = v9:get(v50);
            local v52 = v51._getReal();
            v3.copyProperties(v16, v52, v3.COPY_PART_PROPERTIES);
            v3.copyProperties(v16, v52, v3.COPY_EXTENDED_PART_PROPERTIES);
            if #v16:GetChildren() ~= 0 then
                local v53 = v16:Clone();
                for _, v55 in v53:GetChildren() do
                    v55.Parent = v52;
                end;
                v53:Destroy();
            end;
            v51.Anchored = false;
            v51.CanCollide = true;
            v51.Transparency = v42;
            if v51.CollisionGroup == "Default" then
                v51.CollisionGroup = "ForgeDebris";
            end;
            v51.CFrame = CFrame.new(v15.WorldPosition);
            local v56 = Vector3.new(v6:NextNumber(v33.X, v34.X), v6:NextNumber(v33.Y, v34.Y), v6:NextNumber(v33.Z, v34.Z));
            v51.Size = v56;
            if v49 then
                v51.Material = v49.Material;
                v51.Color = v49.Color;
                v51.Transparency = v49.Transparency;
            end;
            table.insert(v17, function() --[[ Line: 176 ]]
                -- upvalues: v8 (ref), v52 (copy), v9 (ref), v50 (copy)
                local v57 = table.find(v8, v52);
                if v57 then
                    table.remove(v8, v57);
                end;
                if v9 then
                    v9:free(v50);
                end;
            end);
            table.insert(v8, v52);
            v51.AssemblyLinearVelocity = v15.WorldCFrame:VectorToWorldSpace(v51.AssemblyLinearVelocity);
            local v58 = v3.randomUnitVector(v35, v36);
            local v59 = v15.WorldCFrame:VectorToWorldSpace(v58);
            v51:ApplyImpulse(v51.AssemblyMass * v3.getImpulseForce(v15.WorldPosition, v15.WorldPosition + v59.Unit * v6:NextNumber(v30.Min, v30.Max), v6:NextNumber(v29.Min, v29.Max)));
            v51:ApplyAngularImpulse(v51.AssemblyMass * v6:NextUnitVector() * v6:NextNumber(v31.Min, v31.Max));
            if shared.vfx and #v51:GetChildren() ~= 0 then
                table.insert(v45, shared.vfx.emit(v51).Finished);
            end;
            task.delay(v6:NextNumber(v28.Min, v28.Max), function() --[[ Line: 211 ]]
                -- upvalues: v51 (copy), v56 (copy), v32 (copy), v17 (copy), v2 (ref), v38 (copy), v41 (copy), v42 (copy), v43 (copy), v39 (copy), v40 (copy), v3 (ref)
                local l_Size_0 = v51.Size;
                if l_Size_0 ~= v56 * v32 then
                    table.insert(v17, v2.fromParams(v38, v41, function(v61, v62) --[[ Line: 217 ]]
                        -- upvalues: v51 (ref), l_Size_0 (copy), v56 (ref), v32 (ref)
                        v51.Size = l_Size_0:Lerp(v56 * v32, v61);
                        return v62;
                    end));
                end;
                if v42 ~= v43 then
                    table.insert(v17, v2.fromParams(v39, v40, function(v63, v64) --[[ Line: 227 ]]
                        -- upvalues: v51 (ref), v3 (ref), v42 (ref), v43 (ref)
                        v51.Transparency = v3.lerp(v42, v43, v63);
                        return v64;
                    end));
                    return;
                else
                    v51.Transparency = v42;
                    return;
                end;
            end);
        end;
        task.wait(v28.Max + math.max(v40, v41));
        v5.all(v45):await();
        return;
    end;
end;
return v7;