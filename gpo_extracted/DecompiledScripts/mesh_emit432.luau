local v0 = {};
v0.__index = v0;
local l_TweenService_0 = game:GetService("TweenService");
local l_RunService_0 = game:GetService("RunService");
local l_Debris_0 = game:GetService("Debris");
local _ = require(script.Types);
local function _(v5) --[[ Line: 8 ]] --[[ Name: GetType ]]
    if v5.Start:IsA("Part") and v5.Start:FindFirstChildOfClass("SpecialMesh") then
        return "SpecialMesh";
    else
        return "Mesh";
    end;
end;
local function _(v7) --[[ Line: 17 ]] --[[ Name: GetPartType ]]
    if v7:IsA("Part") and v7:FindFirstChildOfClass("SpecialMesh") then
        return "SpecialMesh";
    else
        return "Mesh";
    end;
end;
local function _(v9) --[[ Line: 29 ]] --[[ Name: RetrieveSettings ]]
    return (v9:GetAttributes());
end;
local function v17(v11, v12, v13) --[[ Line: 33 ]] --[[ Name: RotateMesh ]]
    -- upvalues: l_RunService_0 (copy)
    local v16 = l_RunService_0.Heartbeat:Connect(function(_) --[[ Line: 36 ]]
        -- upvalues: v11 (copy), v12 (copy)
        local l_v11_0 = v11;
        l_v11_0.CFrame = l_v11_0.CFrame * CFrame.Angles(0, math.rad(v12), 0);
    end);
    task.delay(v13, function() --[[ Line: 39 ]]
        -- upvalues: v16 (copy)
        v16:Disconnect();
    end);
end;
local function _(v18) --[[ Line: 45 ]] --[[ Name: GenerateInRange ]]
    if not v18 then
        return 0;
    else
        return math.random(v18.Min, v18.Max);
    end;
end;
local function v23(v20) --[[ Line: 52 ]] --[[ Name: RetrieveProperities ]]
    local v21 = {};
    if (v20:IsA("Part") and v20:FindFirstChildOfClass("SpecialMesh") and "SpecialMesh" or "Mesh") == "SpecialMesh" then
        local l_SpecialMesh_0 = v20:FindFirstChildOfClass("SpecialMesh");
        if not l_SpecialMesh_0 then
            return {};
        else
            v21.Scale = l_SpecialMesh_0.Scale;
        end;
    else
        v21.Size = v20.Size;
    end;
    v21.Position = v20.CFrame.Position;
    return v21;
end;
v0.new = function(v24) --[[ Line: 67 ]] --[[ Name: new ]]
    -- upvalues: v23 (copy), v0 (copy)
    return (setmetatable({
        Model = v24, 
        Type = v24.Start:IsA("Part") and v24.Start:FindFirstChildOfClass("SpecialMesh") and "SpecialMesh" or "Mesh", 
        Properities = v23(v24.Start), 
        EndProperities = v23(v24.End), 
        Settings = v24:GetAttributes()
    }, v0));
end;
v0.SetFlipbook = function(v25, v26) --[[ Line: 78 ]] --[[ Name: SetFlipbook ]]
    v25.__Flipbook = require(v26);
end;
v0.RandomizeSize = function(v27, v28, v29) --[[ Line: 82 ]] --[[ Name: RandomizeSize ]]
    if v27.Type == "SpecialMesh" then
        v27.EndProperities.Scale = Vector3.new(math.random(v28.X, v29.X), math.random(v28.Y, v29.Y), math.random(v28.Z, v29.Z));
        return;
    else
        v27.EndProperities.Size = Vector3.new(math.random(v28.X, v29.X), math.random(v28.Y, v29.Y), math.random(v28.Z, v29.Z));
        return;
    end;
end;
v0.PlayFlipbook = function(v30, v31) --[[ Line: 90 ]] --[[ Name: PlayFlipbook ]]
    -- upvalues: l_RunService_0 (copy)
    local l___Flipbook_0 = v30.__Flipbook;
    if not l___Flipbook_0 then
        return;
    else
        local v33 = 1;
        local v34 = 0;
        local v35 = nil;
        v35 = l_RunService_0.Heartbeat:Connect(function(v36) --[[ Line: 96 ]]
            -- upvalues: v34 (ref), v30 (copy), v33 (ref), l___Flipbook_0 (copy), v35 (ref), v31 (copy)
            v34 = v34 + v36;
            if v34 >= (1 / v30.Settings.FlipbookRate or 0.016666666666666666) then
                v33 = v33 + 1;
                if v33 > #l___Flipbook_0 then
                    v35:Disconnect();
                    return;
                else
                    if v30.Type == "SpecialMesh" then
                        local l_Decal_0 = v31:FindFirstChildOfClass("Decal");
                        if not l_Decal_0 then
                            return;
                        else
                            l_Decal_0.Texture = l___Flipbook_0[v33];
                        end;
                    else
                        v31.TextureId = l___Flipbook_0[v33];
                    end;
                    v34 = 0;
                end;
            end;
        end);
        return;
    end;
end;
v0.Emit = function(v38, v39) --[[ Line: 115 ]] --[[ Name: Emit ]]
    -- upvalues: l_Debris_0 (copy), v17 (copy), l_TweenService_0 (copy)
    local l_Lifetime_0 = v38.Settings.Lifetime;
    local v41 = Enum.EasingStyle[v38.Settings.EasingStyle];
    local v42 = Enum.EasingDirection[v38.Settings.EasingDirection];
    local v43 = v38.Settings.Transparency or 1;
    local v44 = v38.Settings.StartTransparency or 1;
    local l_RotationX_0 = v38.Settings.RotationX;
    local v46 = not l_RotationX_0 and 0 or math.random(l_RotationX_0.Min, l_RotationX_0.Max);
    local l_RotationY_0 = v38.Settings.RotationY;
    l_RotationX_0 = not l_RotationY_0 and 0 or math.random(l_RotationY_0.Min, l_RotationY_0.Max);
    local l_RotationZ_0 = v38.Settings.RotationZ;
    l_RotationY_0 = not l_RotationZ_0 and 0 or math.random(l_RotationZ_0.Min, l_RotationZ_0.Max);
    l_RotationZ_0 = TweenInfo.new(l_Lifetime_0, v41, v42);
    local v49 = v38.Model.Start:Clone();
    v38:PlayFlipbook(v49);
    v49.CFrame = (typeof(v39) == "CFrame" and v39 or v39.CFrame) * CFrame.Angles(math.rad(v46), math.rad(l_RotationX_0), (math.rad(l_RotationY_0)));
    v49.Parent = workspace.Effects;
    l_Debris_0:AddItem(v49, l_Lifetime_0);
    local v50 = v38.Model.Start.CFrame:ToObjectSpace(v38.Model.End.CFrame);
    v38.EndProperities.Position = nil;
    if v38.Settings.RotationSpeed then
        v17(v49, v38.Settings.RotationSpeed, l_Lifetime_0);
    end;
    if v38.Type == "SpecialMesh" then
        local l_SpecialMesh_1 = v49:FindFirstChildOfClass("SpecialMesh");
        local l_Decal_1 = v49:FindFirstChildOfClass("Decal");
        if l_SpecialMesh_1 then
            local v53 = l_TweenService_0:Create(l_SpecialMesh_1, l_RotationZ_0, v38.EndProperities);
            local v54 = l_TweenService_0:Create(v49, l_RotationZ_0, {
                CFrame = v49.CFrame * v50
            });
            v53:Play();
            v54:Play();
            v53.Completed:Once(function() --[[ Line: 154 ]]
                -- upvalues: l_SpecialMesh_1 (copy), v38 (copy), v49 (copy)
                l_SpecialMesh_1.Scale = v38.Properities.Scale or Vector3.new(1, 1, 1, 0);
                v49.Transparency = 1;
            end);
        end;
        if l_Decal_1 then
            l_Decal_1.Transparency = v44;
            local v55 = TweenInfo.new(l_Lifetime_0, Enum.EasingStyle[v38.Settings.TransparencyEasingStyle], Enum.EasingDirection[v38.Settings.TransparencyEasingDirection]);
            l_TweenService_0:Create(l_Decal_1, v55, {
                Transparency = v43, 
                Color3 = v38.Model.End:FindFirstChildOfClass("Decal").Color3
            }):Play();
            return;
        end;
    else
        v49.Transparency = v44;
        local _ = TweenInfo.new(l_Lifetime_0, Enum.EasingStyle[v38.Settings.TransparencyEasingStyle], Enum.EasingDirection[v38.Settings.TransparencyEasingDirection]);
        if v38.Settings.Movement then
            v38.EndProperities.CFrame = v49.CFrame * v50;
        end;
        v38.EndProperities.Transparency = v43;
        local v57 = l_TweenService_0:Create(v49, l_RotationZ_0, v38.EndProperities);
        v57:Play();
        v57.Completed:Once(function() --[[ Line: 177 ]]
            -- upvalues: v49 (copy), v38 (copy)
            v49.Size = v38.Properities.Size or Vector3.new(1, 1, 1, 0);
            v49.Transparency = 1;
        end);
    end;
end;
v0.EmitRate = function(v58, v59, v60, v61) --[[ Line: 184 ]] --[[ Name: EmitRate ]]
    -- upvalues: l_RunService_0 (copy)
    local v62 = 0;
    local v64 = l_RunService_0.Heartbeat:Connect(function(v63) --[[ Line: 186 ]]
        -- upvalues: v62 (ref), v59 (copy), v58 (copy), v61 (copy)
        v62 = v62 + v63;
        if v62 > v59 / 60 then
            v62 = 0;
            v58:Emit(v61);
        end;
    end);
    task.delay(v60, function() --[[ Line: 193 ]]
        -- upvalues: v64 (copy)
        v64:Disconnect();
    end);
end;
return v0;