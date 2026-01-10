local v0 = Color3.new(1, 1, 1);
local v1 = false;
local v2 = NumberSequence.new(10);
local v3 = NumberRange.new(0.8);
local v4 = NumberSequence.new({
    NumberSequenceKeypoint.new(0, 5.33, 2.75), 
    NumberSequenceKeypoint.new(1, 5.33, 2.75)
});
local v5 = NumberRange.new(0.8);
local v6 = NumberRange.new(0, 360);
local v7 = NumberSequence.new({
    NumberSequenceKeypoint.new(0, 0), 
    NumberSequenceKeypoint.new(0.4, 3), 
    NumberSequenceKeypoint.new(1, 0)
});
local v8 = NumberRange.new(0.1, 0.15);
local v9 = NumberRange.new(0, 360);
local v10 = Vector2.new(10, 10);
local v11 = {
    Vector3.new(0.1414213627576828, 0, 0.1414213627576828, 0), 
    Vector3.new(-0.1414213627576828, 0, 0.1414213627576828, 0), 
    Vector3.new(-0.1414213627576828, 0, -0.1414213627576828, 0), 
    Vector3.new(0.1414213627576828, 0, -0.1414213627576828, 0), 
    Vector3.new(0.4000000059604645, 0, 0, 0), 
    Vector3.new(0.2828427255153656, 0, 0.2828427255153656, 0), 
    Vector3.new(2.4492937051703357E-17, 0, 0.4000000059604645, 0), 
    Vector3.new(-0.2828427255153656, 0, 0.2828427255153656, 0), 
    Vector3.new(-0.4000000059604645, 0, 4.8985874103406714E-17, 0), 
    Vector3.new(-0.2828427255153656, 0, -0.2828427255153656, 0), 
    Vector3.new(-7.347880453766517E-17, 0, -0.4000000059604645, 0), 
    Vector3.new(0.2828427255153656, 0, -0.2828427255153656, 0), 
    Vector3.new(0.6000000238418579, 0, 0, 0), 
    Vector3.new(0.485410213470459, 0, 0.35267114639282227, 0), 
    Vector3.new(0.18541020154953003, 0, 0.5706339478492737, 0), 
    Vector3.new(-0.18541020154953003, 0, 0.5706339478492737, 0), 
    Vector3.new(-0.485410213470459, 0, 0.35267114639282227, 0), 
    Vector3.new(-0.6000000238418579, 0, 7.347881115511007E-17, 0), 
    Vector3.new(-0.485410213470459, 0, -0.35267114639282227, 0), 
    Vector3.new(-0.18541020154953003, 0, -0.5706339478492737, 0), 
    Vector3.new(0.18541020154953003, 0, -0.5706339478492737, 0), 
    Vector3.new(0.485410213470459, 0, -0.35267114639282227, 0), 
    Vector3.new(0.7727406620979309, 0, 0.2070552408695221, 0), 
    Vector3.new(0.5656854510307312, 0, 0.5656854510307312, 0), 
    Vector3.new(0.2070552408695221, 0, 0.7727406620979309, 0), 
    Vector3.new(-0.2070552408695221, 0, 0.7727406620979309, 0), 
    Vector3.new(-0.5656854510307312, 0, 0.5656854510307312, 0), 
    Vector3.new(-0.7727406620979309, 0, 0.2070552408695221, 0), 
    Vector3.new(-0.7727406620979309, 0, -0.2070552408695221, 0), 
    Vector3.new(-0.5656854510307312, 0, -0.5656854510307312, 0), 
    Vector3.new(-0.2070552408695221, 0, -0.7727406620979309, 0), 
    Vector3.new(0.2070552408695221, 0, -0.7727406620979309, 0), 
    Vector3.new(0.5656854510307312, 0, -0.5656854510307312, 0), 
    (Vector3.new(0.7727406620979309, 0, -0.2070552408695221, 0))
};
local v12 = {
    None = 0, 
    Whitelist = 1, 
    Blacklist = 2, 
    Function = 3
};
local l_Players_0 = game:GetService("Players");
local l_TweenService_0 = game:GetService("TweenService");
local l_RunService_0 = game:GetService("RunService");
local l_NumberValue_0 = Instance.new("NumberValue");
l_NumberValue_0.Value = 1;
local v17 = {};
local v18 = true;
local v19 = Vector3.new(0, -1, 0, 0);
local v20 = nil;
local l_Function_0 = v12.Function;
local v22 = {
    workspace.Islands, 
    workspace.Env, 
    workspace.Ships
};
local function v24(v23) --[[ Line: 253 ]]
    if v23.CanCollide == false then
        return false;
    else
        return true;
    end;
end;
local v25 = 1;
local v26 = 1;
local v27 = 0;
local v28 = 0;
local v29 = 0;
local l_new_0 = Vector3.new;
local v31 = NumberSequenceKeypoint.new(0, 1, 0);
local v32 = NumberSequenceKeypoint.new(1, 1, 0);
local v33 = {};
for _, v35 in pairs(v11) do
    table.insert(v33, v35 * 35);
end;
table.sort(v33, function(v36, v37) --[[ Line: 278 ]]
    return v36.magnitude < v37.magnitude;
end);
local l_SoundGroup_0 = Instance.new("SoundGroup");
l_SoundGroup_0.Name = "__RainSoundGroup";
l_SoundGroup_0.Volume = 0.2;
l_SoundGroup_0.Archivable = false;
local l_Sound_0 = Instance.new("Sound");
l_Sound_0.Name = "RainSound";
l_Sound_0.Volume = v29;
l_Sound_0.SoundId = "rbxassetid://1516791621";
l_Sound_0.Looped = true;
l_Sound_0.SoundGroup = l_SoundGroup_0;
l_Sound_0.Parent = l_SoundGroup_0;
l_Sound_0.Archivable = false;
local v40 = nil;
v40 = Instance.new("Part");
v40.Transparency = 1;
v40.Anchored = true;
v40.CanCollide = false;
v40.Locked = false;
v40.Archivable = false;
v40.TopSurface = Enum.SurfaceType.Smooth;
v40.BottomSurface = Enum.SurfaceType.Smooth;
v40.Name = "__RainEmitter";
v40.Size = Vector3.new(0.05000000074505806, 0.05000000074505806, 0.05000000074505806, 0);
v40.CanQuery = false;
v40.Archivable = false;
local l_ParticleEmitter_0 = Instance.new("ParticleEmitter");
l_ParticleEmitter_0.Name = "RainStraight";
l_ParticleEmitter_0.LightEmission = 0.05;
l_ParticleEmitter_0.LightInfluence = 0.9;
l_ParticleEmitter_0.Size = v2;
l_ParticleEmitter_0.Texture = "rbxassetid://1822883048";
l_ParticleEmitter_0.LockedToPart = true;
l_ParticleEmitter_0.Enabled = false;
l_ParticleEmitter_0.Lifetime = v3;
l_ParticleEmitter_0.Rate = 600;
l_ParticleEmitter_0.Speed = NumberRange.new(60);
l_ParticleEmitter_0.EmissionDirection = Enum.NormalId.Bottom;
l_ParticleEmitter_0.Parent = v40;
l_ParticleEmitter_0.Orientation = Enum.ParticleOrientation.FacingCameraWorldUp;
local l_ParticleEmitter_1 = Instance.new("ParticleEmitter");
l_ParticleEmitter_1.Name = "RainTopDown";
l_ParticleEmitter_1.LightEmission = 0.05;
l_ParticleEmitter_1.LightInfluence = 0.9;
l_ParticleEmitter_1.Size = v4;
l_ParticleEmitter_1.Texture = "rbxassetid://1822856633";
l_ParticleEmitter_1.LockedToPart = true;
l_ParticleEmitter_1.Enabled = false;
l_ParticleEmitter_1.Rotation = v6;
l_ParticleEmitter_1.Lifetime = v5;
l_ParticleEmitter_1.Rate = 600;
l_ParticleEmitter_1.Speed = NumberRange.new(60);
l_ParticleEmitter_1.EmissionDirection = Enum.NormalId.Bottom;
l_ParticleEmitter_1.Parent = v40;
l_ParticleEmitter_0 = nil;
l_ParticleEmitter_1 = nil;
l_ParticleEmitter_0 = {};
l_ParticleEmitter_1 = {};
for _ = 1, 6 do
    local l_Attachment_0 = Instance.new("Attachment");
    l_Attachment_0.Name = "__RainSplashAttachment";
    local l_ParticleEmitter_2 = Instance.new("ParticleEmitter");
    l_ParticleEmitter_2.LightEmission = 0.05;
    l_ParticleEmitter_2.LightInfluence = 0.9;
    l_ParticleEmitter_2.Size = v7;
    l_ParticleEmitter_2.Texture = "rbxassetid://1822856633";
    l_ParticleEmitter_2.Rotation = v9;
    l_ParticleEmitter_2.Lifetime = v8;
    l_ParticleEmitter_2.Transparency = NumberSequence.new({
        v31, 
        NumberSequenceKeypoint.new(0.25, 0.6, 0), 
        NumberSequenceKeypoint.new(0.75, 0.6, 0), 
        v32
    });
    l_ParticleEmitter_2.Enabled = false;
    l_ParticleEmitter_2.Rate = 0;
    l_ParticleEmitter_2.Speed = NumberRange.new(0);
    l_ParticleEmitter_2.Name = "RainSplash";
    l_ParticleEmitter_2.Parent = l_Attachment_0;
    l_Attachment_0.Archivable = false;
    table.insert(l_ParticleEmitter_0, l_Attachment_0);
    local l_Attachment_1 = Instance.new("Attachment");
    l_Attachment_1.Name = "__RainOccludedAttachment";
    local v47 = v40.RainStraight:Clone();
    v47.Speed = NumberRange.new(70, 100);
    v47.SpreadAngle = v10;
    v47.LockedToPart = false;
    v47.Enabled = false;
    v47.Parent = l_Attachment_1;
    local v48 = v40.RainTopDown:Clone();
    v48.Speed = NumberRange.new(70, 100);
    v48.SpreadAngle = v10;
    v48.LockedToPart = false;
    v48.Enabled = false;
    v48.Parent = l_Attachment_1;
    l_Attachment_1.Archivable = false;
    table.insert(l_ParticleEmitter_1, l_Attachment_1);
end;
local v49 = {
    v40
};
local v61 = {
    [v12.None] = function(v50, v51) --[[ Line: 404 ]]
        -- upvalues: v40 (ref), l_Players_0 (copy), v49 (copy)
        return workspace:FindPartOnRayWithIgnoreList(v50, v51 and {
            v40, 
            l_Players_0.LocalPlayer and l_Players_0.LocalPlayer.Character
        } or v49);
    end, 
    [v12.Blacklist] = function(v52) --[[ Line: 407 ]]
        -- upvalues: v22 (ref)
        return workspace:FindPartOnRayWithIgnoreList(v52, v22);
    end, 
    [v12.Whitelist] = function(v53) --[[ Line: 410 ]]
        -- upvalues: v22 (ref)
        return workspace:FindPartOnRayWithWhitelist(v53, v22);
    end, 
    [v12.Function] = function(v54) --[[ Line: 413 ]]
        -- upvalues: v24 (ref)
        local v55 = v54.Origin + v54.Direction;
        while true do
            if v54.Direction.magnitude > 0.001 then
                local l_workspace_PartOnRayWithWhitelist_0, v57, v58, v59 = workspace:FindPartOnRayWithWhitelist(v54, {
                    workspace.Islands, 
                    workspace.Env, 
                    workspace.Ships
                });
                if not l_workspace_PartOnRayWithWhitelist_0 or v24(l_workspace_PartOnRayWithWhitelist_0) then
                    return l_workspace_PartOnRayWithWhitelist_0, v57, v58, v59;
                else
                    local v60 = v57 + v54.Direction.Unit * 0.001;
                    v54 = Ray.new(v60, v55 - v60);
                end;
            else
                return;
            end;
        end;
    end
};
local v62 = v61[l_Function_0];
local function v99() --[[ Line: 428 ]] --[[ Name: connectLoop ]]
    -- upvalues: v17 (ref), l_RunService_0 (copy), v62 (ref), v19 (ref), v20 (ref), v29 (ref), v18 (ref), l_TweenService_0 (copy), l_Sound_0 (copy), v40 (ref), l_new_0 (copy), v1 (ref), v31 (copy), v25 (ref), v32 (copy), v26 (ref), l_ParticleEmitter_1 (ref), v33 (copy), v28 (ref), l_ParticleEmitter_0 (ref), v27 (ref)
    local v63 = Random.new();
    local v64 = true;
    local v65 = 10;
    table.insert(v17, l_RunService_0.RenderStepped:connect(function() --[[ Line: 436 ]]
        -- upvalues: v62 (ref), v19 (ref), v20 (ref), v29 (ref), v18 (ref), l_TweenService_0 (ref), l_Sound_0 (ref), v65 (ref), v40 (ref), l_new_0 (ref), v64 (ref), v1 (ref)
        local v66, _ = v62(Ray.new(workspace.CurrentCamera.CFrame.p, -v19 * 500), true);
        if (not v20 or workspace.CurrentCamera.CFrame.p.y <= v20) and not v66 then
            if v29 < 1 and not v18 then
                v29 = 1;
                l_TweenService_0:Create(l_Sound_0, TweenInfo.new(0.5), {
                    Volume = 1
                }):Play();
            end;
            v65 = 10;
            local v68 = math.abs((workspace.CurrentCamera.CFrame.lookVector:Dot(v19)));
            local l_p_0 = workspace.CurrentCamera.CFrame.p;
            local v70 = workspace.CurrentCamera.CFrame.lookVector:Cross(-v19);
            v70 = v70.magnitude > 0.001 and v70.unit or -v19;
            local l_unit_0 = v19:Cross(v70).unit;
            v40.Size = l_new_0(40, 40, (1 - v68) * 60 + 40);
            v40.CFrame = CFrame.new(l_p_0.x, l_p_0.y, l_p_0.z, v70.x, -v19.x, l_unit_0.x, v70.y, -v19.y, l_unit_0.y, v70.z, -v19.z, l_unit_0.z) + (1 - v68) * workspace.CurrentCamera.CFrame.lookVector * v40.Size.Z / 3 - v68 * v19 * 20;
            if v40:FindFirstChild("RainStraight") and v40:FindFirstChild("RainTopDown") then
                v40.RainStraight.Enabled = true;
                v40.RainTopDown.Enabled = true;
            end;
            v64 = false;
        else
            if v40:FindFirstChild("RainStraight") and v40:FindFirstChild("RainTopDown") then
                v40.RainStraight.Enabled = false;
                v40.RainTopDown.Enabled = false;
            end;
            v64 = true;
        end;
        v1 = v64;
    end));
    local v72 = l_RunService_0:IsRunning() and l_RunService_0.Stepped or l_RunService_0.RenderStepped;
    table.insert(v17, v72:connect(function() --[[ Line: 499 ]]
        -- upvalues: v65 (ref), v19 (ref), v31 (ref), v25 (ref), v32 (ref), v26 (ref), v64 (ref), l_ParticleEmitter_1 (ref), v18 (ref), v20 (ref), v33 (ref), v62 (ref), v29 (ref), l_TweenService_0 (ref), l_Sound_0 (ref), v40 (ref), v28 (ref), l_ParticleEmitter_0 (ref), v63 (copy), l_new_0 (ref), v27 (ref)
        v65 = v65 + 1;
        if v65 >= 10 then
            local v73 = math.abs((workspace.CurrentCamera.CFrame.lookVector:Dot(v19)));
            local v74 = NumberSequence.new({
                v31, 
                NumberSequenceKeypoint.new(0.25, (1 - v73) * v25 + v73, 0), 
                NumberSequenceKeypoint.new(0.75, (1 - v73) * v25 + v73, 0), 
                v32
            });
            local v75 = NumberSequence.new({
                v31, 
                NumberSequenceKeypoint.new(0.25, v73 * v26 + (1 - v73), 0), 
                NumberSequenceKeypoint.new(0.75, v73 * v26 + (1 - v73), 0), 
                v32
            });
            local v76 = workspace.Camera.CFrame:inverse() * (workspace.Camera.CFrame.p - v19);
            local v77 = NumberRange.new((math.deg((math.atan2(-v76.x, v76.y)))));
            if v64 then
                for _, v79 in pairs(l_ParticleEmitter_1) do
                    v79.RainStraight.Transparency = v74;
                    v79.RainStraight.Rotation = v77;
                    v79.RainTopDown.Transparency = v75;
                end;
                if not v18 then
                    local v80 = 0;
                    if not v20 or workspace.CurrentCamera.CFrame.p.y <= v20 then
                        local v81 = 35;
                        local v82 = -v19 * 500;
                        for v83 = 1, #v33 do
                            if not v62(Ray.new(workspace.CurrentCamera.CFrame * v33[v83], v82), true) then
                                v81 = v33[v83].magnitude;
                                break;
                            end;
                        end;
                        v80 = 1 - v81 / 35;
                    end;
                    if math.abs(v80 - v29) > 0.01 then
                        v29 = v80;
                        l_TweenService_0:Create(l_Sound_0, TweenInfo.new(1), {
                            Volume = v29
                        }):Play();
                    end;
                end;
            else
                v40.RainStraight.Transparency = v74;
                v40.RainStraight.Rotation = v77;
                v40.RainTopDown.Transparency = v75;
            end;
            v65 = 0;
        end;
        local l_p_1 = workspace.CurrentCamera.CFrame.p;
        local v85 = workspace.CurrentCamera.CFrame.lookVector:Cross(-v19);
        v85 = v85.magnitude > 0.001 and v85.unit or -v19;
        local l_unit_1 = v19:Cross(v85).unit;
        local v87 = CFrame.new(l_p_1.x, l_p_1.y, l_p_1.z, v85.x, -v19.x, l_unit_1.x, v85.y, -v19.y, l_unit_1.y, v85.z, -v19.z, l_unit_1.z);
        local v88 = v19 * 550;
        for v89 = 1, v28 do
            local v90 = l_ParticleEmitter_0[v89];
            local v91 = l_ParticleEmitter_1[v89];
            local v92 = v63:NextNumber(-100, 100);
            local v93 = v63:NextNumber(-100, 100);
            local v94, v95, v96 = v62(Ray.new(v87 * l_new_0(v92, 500, v93), v88));
            if v94 then
                v90.Position = v95 + v96 * 0.5;
                v90.RainSplash:Emit(1);
                if v64 then
                    local v97 = v95 - v19 * 50;
                    if v20 and v97.Y > v20 and v19.Y < 0 then
                        v97 = v97 + v19 * (v20 - v97.Y) / v19.Y;
                    end;
                    v91.CFrame = v87 - v87.p + v97;
                    v91.RainStraight:Emit(v27);
                    v91.RainTopDown:Emit(v27);
                end;
            elseif v64 then
                local v98 = v87 * l_new_0(v92, v63:NextNumber(20, 100), v93);
                if v20 and v98.Y > v20 and v19.Y < 0 then
                    v98 = v98 + v19 * (v20 - v98.Y) / v19.Y;
                end;
                v91.CFrame = v87 - v87.p + v98;
                v91.RainStraight:Emit(v27);
                v91.RainTopDown:Emit(v27);
            end;
        end;
    end));
end;
local function v102() --[[ Line: 644 ]] --[[ Name: disconnectLoop ]]
    -- upvalues: v17 (ref)
    if #v17 > 0 then
        for _, v101 in pairs(v17) do
            v101:Disconnect();
        end;
        v17 = {};
    end;
end;
local function v106(v103) --[[ Line: 654 ]] --[[ Name: disableSound ]]
    -- upvalues: v29 (ref), l_TweenService_0 (copy), l_Sound_0 (copy)
    v29 = 0;
    local v104 = l_TweenService_0:Create(l_Sound_0, v103, {
        Volume = 0
    });
    v104.Completed:connect(function(v105) --[[ Line: 659 ]]
        -- upvalues: l_Sound_0 (ref), v104 (copy)
        if v105 == Enum.PlaybackState.Completed then
            l_Sound_0:Stop();
        end;
        v104:Destroy();
    end);
    v104:Play();
end;
local function _() --[[ Line: 669 ]] --[[ Name: disable ]]
    -- upvalues: v102 (copy), v40 (ref), v18 (ref), v106 (copy)
    v102();
    v40.RainStraight.Enabled = false;
    v40.RainTopDown.Enabled = false;
    v40.Size = Vector3.new(0.05000000074505806, 0.05000000074505806, 0.05000000074505806, 0);
    if not v18 then
        v106(TweenInfo.new(1));
    end;
end;
local function _(v108, v109, v110) --[[ Line: 686 ]] --[[ Name: makeProperty ]]
    local v111 = Instance.new(v108);
    if v109 then
        v111.Value = v109;
    end;
    v111.Changed:connect(v110);
    v110(v111.Value);
    return v111;
end;
local function v119(v113) --[[ Line: 696 ]]
    -- upvalues: v40 (ref), l_ParticleEmitter_0 (ref), l_ParticleEmitter_1 (ref)
    local v114 = ColorSequence.new(v113);
    v40.RainStraight.Color = v114;
    v40.RainTopDown.Color = v114;
    for _, v116 in pairs(l_ParticleEmitter_0) do
        v116.RainSplash.Color = v114;
    end;
    for _, v118 in pairs(l_ParticleEmitter_1) do
        v118.RainStraight.Color = v114;
        v118.RainTopDown.Color = v114;
    end;
end;
local l_Color3Value_0 = Instance.new("Color3Value");
if v0 then
    l_Color3Value_0.Value = v0;
end;
l_Color3Value_0.Changed:connect(v119);
v119(l_Color3Value_0.Value);
local l_l_Color3Value_0_0 = l_Color3Value_0;
v119 = function(v122) --[[ Line: 713 ]] --[[ Name: updateTransparency ]]
    -- upvalues: l_NumberValue_0 (copy), v25 (ref), v26 (ref), v31 (copy), v32 (copy), l_ParticleEmitter_0 (ref)
    local v123 = (1 - v122) * (1 - l_NumberValue_0.Value);
    local v124 = 1 - v123;
    v25 = 0.7 * v123 + v124;
    v26 = 0.85 * v123 + v124;
    local v125 = NumberSequence.new({
        v31, 
        NumberSequenceKeypoint.new(0.25, v123 * 0.6 + v124, 0), 
        NumberSequenceKeypoint.new(0.75, v123 * 0.6 + v124, 0), 
        v32
    });
    for _, v127 in pairs(l_ParticleEmitter_0) do
        v127.RainSplash.Transparency = v125;
    end;
end;
local l_NumberValue_1 = Instance.new("NumberValue");
l_NumberValue_1.Value = 0;
l_NumberValue_1.Changed:connect(v119);
v119(l_NumberValue_1.Value);
l_Color3Value_0 = l_NumberValue_1;
l_NumberValue_0.Changed:connect(v119);
local function v130(v129) --[[ Line: 736 ]]
    -- upvalues: v40 (ref)
    v40.RainStraight.Speed = NumberRange.new(v129 * 60);
    v40.RainTopDown.Speed = NumberRange.new(v129 * 60);
end;
local l_NumberValue_2 = Instance.new("NumberValue");
l_NumberValue_2.Value = 1;
l_NumberValue_2.Changed:connect(v130);
v130(l_NumberValue_2.Value);
l_NumberValue_1 = l_NumberValue_2;
l_NumberValue_2 = function(v132) --[[ Line: 743 ]]
    -- upvalues: v40 (ref), v27 (ref), v28 (ref)
    v40.RainStraight.Rate = 600 * v132;
    v40.RainTopDown.Rate = 600 * v132;
    v27 = math.ceil(2 * v132);
    v28 = 6 * v132;
end;
local l_NumberValue_3 = Instance.new("NumberValue");
l_NumberValue_3.Value = 1;
l_NumberValue_3.Changed:connect(l_NumberValue_2);
l_NumberValue_2(l_NumberValue_3.Value);
v130 = l_NumberValue_3;
l_NumberValue_3 = function(v134) --[[ Line: 753 ]]
    -- upvalues: v40 (ref), l_ParticleEmitter_1 (ref), l_ParticleEmitter_0 (ref)
    v40.RainStraight.LightEmission = v134;
    v40.RainTopDown.LightEmission = v134;
    for _, v136 in pairs(l_ParticleEmitter_1) do
        v136.RainStraight.LightEmission = v134;
        v136.RainTopDown.LightEmission = v134;
    end;
    for _, v138 in pairs(l_ParticleEmitter_0) do
        v138.RainSplash.LightEmission = v134;
    end;
end;
local l_NumberValue_4 = Instance.new("NumberValue");
l_NumberValue_4.Value = 0.05;
l_NumberValue_4.Changed:connect(l_NumberValue_3);
l_NumberValue_3(l_NumberValue_4.Value);
l_NumberValue_2 = l_NumberValue_4;
l_NumberValue_4 = function(v140) --[[ Line: 768 ]]
    -- upvalues: v40 (ref), l_ParticleEmitter_1 (ref), l_ParticleEmitter_0 (ref)
    v40.RainStraight.LightInfluence = v140;
    v40.RainTopDown.LightInfluence = v140;
    for _, v142 in pairs(l_ParticleEmitter_1) do
        v142.RainStraight.LightInfluence = v140;
        v142.RainTopDown.LightInfluence = v140;
    end;
    for _, v144 in pairs(l_ParticleEmitter_0) do
        v144.RainSplash.LightInfluence = v140;
    end;
end;
local l_NumberValue_5 = Instance.new("NumberValue");
l_NumberValue_5.Value = 0.9;
l_NumberValue_5.Changed:connect(l_NumberValue_4);
l_NumberValue_4(l_NumberValue_5.Value);
l_NumberValue_3 = l_NumberValue_5;
l_NumberValue_5 = function(v146) --[[ Line: 783 ]]
    -- upvalues: v19 (ref)
    if v146.magnitude > 0.001 then
        v19 = v146.unit;
    end;
end;
local l_Vector3Value_0 = Instance.new("Vector3Value");
l_Vector3Value_0.Value = Vector3.new(0, -1, 0, 0);
l_Vector3Value_0.Changed:connect(l_NumberValue_5);
l_NumberValue_5(l_Vector3Value_0.Value);
l_NumberValue_4 = l_Vector3Value_0;
l_NumberValue_5 = {
    CollisionMode = v12, 
    Enable = function(_, v149) --[[ Line: 796 ]] --[[ Name: Enable ]]
        -- upvalues: v18 (ref), v102 (copy), v40 (ref), l_ParticleEmitter_0 (ref), l_ParticleEmitter_1 (ref), l_RunService_0 (copy), l_SoundGroup_0 (copy), v99 (copy), l_TweenService_0 (copy), l_NumberValue_0 (copy), l_Sound_0 (copy)
        if v18 == false then
            return;
        else
            if v149 ~= nil and typeof(v149) ~= "TweenInfo" then
                error("bad argument #1 to 'Enable' (TweenInfo expected, got " .. typeof(v149) .. ")", 2);
            end;
            v102();
            v40.RainStraight.Enabled = true;
            v40.RainTopDown.Enabled = true;
            v40.Parent = workspace.Effects;
            for v150 = 1, 6 do
                l_ParticleEmitter_0[v150].Parent = workspace.Terrain;
                l_ParticleEmitter_1[v150].Parent = workspace.Terrain;
            end;
            if l_RunService_0:IsRunning() then
                l_SoundGroup_0.Parent = game:GetService("SoundService");
            end;
            v99();
            if v149 then
                l_TweenService_0:Create(l_NumberValue_0, v149, {
                    Value = 0
                }):Play();
            else
                l_NumberValue_0.Value = 0;
            end;
            if not l_Sound_0.Playing then
                l_Sound_0:Play();
                l_Sound_0.TimePosition = math.random() * l_Sound_0.TimeLength;
            end;
            v18 = false;
            return;
        end;
    end, 
    Disable = function(_, v152) --[[ Line: 836 ]] --[[ Name: Disable ]]
        -- upvalues: v18 (ref), l_TweenService_0 (copy), l_NumberValue_0 (copy), v102 (copy), v40 (ref), v106 (copy)
        if v18 == true then
            return;
        else
            if v152 ~= nil and typeof(v152) ~= "TweenInfo" then
                error("bad argument #1 to 'Disable' (TweenInfo expected, got " .. typeof(v152) .. ")", 2);
            end;
            if v152 then
                local v153 = l_TweenService_0:Create(l_NumberValue_0, v152, {
                    Value = 1
                });
                v153.Completed:connect(function(v154) --[[ Line: 846 ]]
                    -- upvalues: v102 (ref), v40 (ref), v18 (ref), v106 (ref), v153 (copy)
                    if v154 == Enum.PlaybackState.Completed then
                        v102();
                        v40.RainStraight.Enabled = false;
                        v40.RainTopDown.Enabled = false;
                        v40.Size = Vector3.new(0.05000000074505806, 0.05000000074505806, 0.05000000074505806, 0);
                        if not v18 then
                            v106(TweenInfo.new(1));
                        end;
                    end;
                    v153:Destroy();
                end);
                v153:Play();
                v106(v152);
            else
                l_NumberValue_0.Value = 1;
                v102();
                v40.RainStraight.Enabled = false;
                v40.RainTopDown.Enabled = false;
                v40.Size = Vector3.new(0.05000000074505806, 0.05000000074505806, 0.05000000074505806, 0);
                if not v18 then
                    v106(TweenInfo.new(1));
                end;
            end;
            v18 = true;
            return;
        end;
    end, 
    SetColor = function(_, v156, v157) --[[ Line: 865 ]] --[[ Name: SetColor ]]
        -- upvalues: l_TweenService_0 (copy), l_l_Color3Value_0_0 (copy)
        if typeof(v156) ~= "Color3" then
            error("bad argument #1 to 'SetColor' (Color3 expected, got " .. typeof(v156) .. ")", 2);
        elseif v157 ~= nil and typeof(v157) ~= "TweenInfo" then
            error("bad argument #2 to 'SetColor' (TweenInfo expected, got " .. typeof(v157) .. ")", 2);
        end;
        if v157 then
            l_TweenService_0:Create(l_l_Color3Value_0_0, v157, {
                Value = v156
            }):Play();
            return;
        else
            l_l_Color3Value_0_0.Value = v156;
            return;
        end;
    end
};
l_Vector3Value_0 = function(v158, v159) --[[ Line: 881 ]] --[[ Name: makeRatioSetter ]]
    -- upvalues: l_TweenService_0 (copy)
    return function(_, v161, v162) --[[ Line: 883 ]]
        -- upvalues: v158 (copy), l_TweenService_0 (ref), v159 (copy)
        if typeof(v161) ~= "number" then
            error("bad argument #1 to '" .. v158 .. "' (number expected, got " .. typeof(v161) .. ")", 2);
        elseif v162 ~= nil and typeof(v162) ~= "TweenInfo" then
            error("bad argument #2 to '" .. v158 .. "' (TweenInfo expected, got " .. typeof(v162) .. ")", 2);
        end;
        v161 = math.clamp(v161, 0, 1);
        if v162 then
            l_TweenService_0:Create(v159, v162, {
                Value = v161
            }):Play();
            return;
        else
            v159.Value = v161;
            return;
        end;
    end;
end;
local v163 = "SetTransparency";
local l_v163_0 = v163 --[[ copy: 57 -> 58 ]];
l_NumberValue_5.SetTransparency = function(_, v166, v167) --[[ Line: 883 ]]
    -- upvalues: l_v163_0 (copy), l_TweenService_0 (copy), l_Color3Value_0 (copy)
    if typeof(v166) ~= "number" then
        error("bad argument #1 to '" .. l_v163_0 .. "' (number expected, got " .. typeof(v166) .. ")", 2);
    elseif v167 ~= nil and typeof(v167) ~= "TweenInfo" then
        error("bad argument #2 to '" .. l_v163_0 .. "' (TweenInfo expected, got " .. typeof(v167) .. ")", 2);
    end;
    v166 = math.clamp(v166, 0, 1);
    if v167 then
        l_TweenService_0:Create(l_Color3Value_0, v167, {
            Value = v166
        }):Play();
        return;
    else
        l_Color3Value_0.Value = v166;
        return;
    end;
end;
v163 = "SetSpeedRatio";
local l_v163_1 = v163 --[[ copy: 57 -> 59 ]];
l_NumberValue_5.SetSpeedRatio = function(_, v170, v171) --[[ Line: 883 ]]
    -- upvalues: l_v163_1 (copy), l_TweenService_0 (copy), l_NumberValue_1 (copy)
    if typeof(v170) ~= "number" then
        error("bad argument #1 to '" .. l_v163_1 .. "' (number expected, got " .. typeof(v170) .. ")", 2);
    elseif v171 ~= nil and typeof(v171) ~= "TweenInfo" then
        error("bad argument #2 to '" .. l_v163_1 .. "' (TweenInfo expected, got " .. typeof(v171) .. ")", 2);
    end;
    v170 = math.clamp(v170, 0, 1);
    if v171 then
        l_TweenService_0:Create(l_NumberValue_1, v171, {
            Value = v170
        }):Play();
        return;
    else
        l_NumberValue_1.Value = v170;
        return;
    end;
end;
v163 = "SetIntensityRatio";
local l_v163_2 = v163 --[[ copy: 57 -> 60 ]];
l_NumberValue_5.SetIntensityRatio = function(_, v174, v175) --[[ Line: 883 ]]
    -- upvalues: l_v163_2 (copy), l_TweenService_0 (copy), v130 (copy)
    if typeof(v174) ~= "number" then
        error("bad argument #1 to '" .. l_v163_2 .. "' (number expected, got " .. typeof(v174) .. ")", 2);
    elseif v175 ~= nil and typeof(v175) ~= "TweenInfo" then
        error("bad argument #2 to '" .. l_v163_2 .. "' (TweenInfo expected, got " .. typeof(v175) .. ")", 2);
    end;
    v174 = math.clamp(v174, 0, 1);
    if v175 then
        l_TweenService_0:Create(v130, v175, {
            Value = v174
        }):Play();
        return;
    else
        v130.Value = v174;
        return;
    end;
end;
v163 = "SetLightEmission";
local l_v163_3 = v163 --[[ copy: 57 -> 61 ]];
l_NumberValue_5.SetLightEmission = function(_, v178, v179) --[[ Line: 883 ]]
    -- upvalues: l_v163_3 (copy), l_TweenService_0 (copy), l_NumberValue_2 (copy)
    if typeof(v178) ~= "number" then
        error("bad argument #1 to '" .. l_v163_3 .. "' (number expected, got " .. typeof(v178) .. ")", 2);
    elseif v179 ~= nil and typeof(v179) ~= "TweenInfo" then
        error("bad argument #2 to '" .. l_v163_3 .. "' (TweenInfo expected, got " .. typeof(v179) .. ")", 2);
    end;
    v178 = math.clamp(v178, 0, 1);
    if v179 then
        l_TweenService_0:Create(l_NumberValue_2, v179, {
            Value = v178
        }):Play();
        return;
    else
        l_NumberValue_2.Value = v178;
        return;
    end;
end;
v163 = "SetLightInfluence";
l_NumberValue_5.SetLightInfluence = function(_, v181, v182) --[[ Line: 883 ]]
    -- upvalues: v163 (copy), l_TweenService_0 (copy), l_NumberValue_3 (copy)
    if typeof(v181) ~= "number" then
        error("bad argument #1 to '" .. v163 .. "' (number expected, got " .. typeof(v181) .. ")", 2);
    elseif v182 ~= nil and typeof(v182) ~= "TweenInfo" then
        error("bad argument #2 to '" .. v163 .. "' (TweenInfo expected, got " .. typeof(v182) .. ")", 2);
    end;
    v181 = math.clamp(v181, 0, 1);
    if v182 then
        l_TweenService_0:Create(l_NumberValue_3, v182, {
            Value = v181
        }):Play();
        return;
    else
        l_NumberValue_3.Value = v181;
        return;
    end;
end;
l_NumberValue_5.SetVolume = function(_, v184, v185) --[[ Line: 908 ]] --[[ Name: SetVolume ]]
    -- upvalues: l_TweenService_0 (copy), l_SoundGroup_0 (copy)
    if typeof(v184) ~= "number" then
        error("bad argument #1 to 'SetVolume' (number expected, got " .. typeof(v184) .. ")", 2);
    elseif v185 ~= nil and typeof(v185) ~= "TweenInfo" then
        error("bad argument #2 to 'SetVolume' (TweenInfo expected, got " .. typeof(v185) .. ")", 2);
    end;
    if v185 then
        l_TweenService_0:Create(l_SoundGroup_0, v185, {
            Volume = v184
        }):Play();
        return;
    else
        l_SoundGroup_0.Volume = v184;
        return;
    end;
end;
l_NumberValue_5.SetDirection = function(_, v187, v188) --[[ Line: 924 ]] --[[ Name: SetDirection ]]
    -- upvalues: l_TweenService_0 (copy), l_NumberValue_4 (copy)
    if typeof(v187) ~= "Vector3" then
        error("bad argument #1 to 'SetDirection' (Vector3 expected, got " .. typeof(v187) .. ")", 2);
    elseif v188 ~= nil and typeof(v188) ~= "TweenInfo" then
        error("bad argument #2 to 'SetDirection' (TweenInfo expected, got " .. typeof(v188) .. ")", 2);
    end;
    if v187.unit.magnitude <= 0 then
        warn("Attempt to set rain direction to a zero-length vector, falling back on default direction = (" .. tostring((Vector3.new(0, -1, 0, 0))) .. ")");
        v187 = Vector3.new(0, -1, 0, 0);
    end;
    if v188 then
        l_TweenService_0:Create(l_NumberValue_4, v188, {
            Value = v187
        }):Play();
        return;
    else
        l_NumberValue_4.Value = v187;
        return;
    end;
end;
l_NumberValue_5.SetCeiling = function(_, v190) --[[ Line: 945 ]] --[[ Name: SetCeiling ]]
    -- upvalues: v20 (ref)
    if v190 ~= nil and typeof(v190) ~= "number" then
        error("bad argument #1 to 'SetCeiling' (number expected, got " .. typeof(v190) .. ")", 2);
    end;
    v20 = v190;
end;
l_NumberValue_5.SetStraightTexture = function(_, v192) --[[ Line: 955 ]] --[[ Name: SetStraightTexture ]]
    -- upvalues: v40 (ref), l_ParticleEmitter_1 (ref)
    if typeof(v192) ~= "string" then
        error("bad argument #1 to 'SetStraightTexture' (string expected, got " .. typeof(v192) .. ")", 2);
    end;
    v40.RainStraight.Texture = v192;
    for _, v194 in pairs(l_ParticleEmitter_1) do
        v194.RainStraight.Texture = v192;
    end;
end;
l_NumberValue_5.SetTopDownTexture = function(_, v196) --[[ Line: 969 ]] --[[ Name: SetTopDownTexture ]]
    -- upvalues: v40 (ref), l_ParticleEmitter_1 (ref)
    if typeof(v196) ~= "string" then
        error("bad argument #1 to 'SetStraightTexture' (string expected, got " .. typeof(v196) .. ")", 2);
    end;
    v40.RainTopDown.Texture = v196;
    for _, v198 in pairs(l_ParticleEmitter_1) do
        v198.RainTopDown.Texture = v196;
    end;
end;
l_NumberValue_5.SetSplashTexture = function(_, v200) --[[ Line: 983 ]] --[[ Name: SetSplashTexture ]]
    -- upvalues: l_ParticleEmitter_0 (ref)
    if typeof(v200) ~= "string" then
        error("bad argument #1 to 'SetStraightTexture' (string expected, got " .. typeof(v200) .. ")", 2);
    end;
    for _, v202 in pairs(l_ParticleEmitter_0) do
        v202.RainSplash.Texture = v200;
    end;
end;
l_NumberValue_5.SetSoundId = function(_, v204) --[[ Line: 995 ]] --[[ Name: SetSoundId ]]
    -- upvalues: l_Sound_0 (copy)
    if typeof(v204) ~= "string" then
        error("bad argument #1 to 'SetSoundId' (string expected, got " .. typeof(v204) .. ")", 2);
    end;
    l_Sound_0.SoundId = v204;
end;
l_NumberValue_5.SetCollisionMode = function(_, v206, v207) --[[ Line: 1005 ]] --[[ Name: SetCollisionMode ]]
    -- upvalues: v12 (copy), v22 (ref), v24 (ref), v40 (ref), l_Function_0 (ref), v62 (ref), v61 (copy)
    if v206 == v12.None then
        v22 = nil;
        v24 = nil;
    elseif v206 == v12.Blacklist then
        if typeof(v207) == "Instance" then
            v22 = {
                v207, 
                v40
            };
        elseif typeof(v207) == "table" then
            for v208 = 1, #v207 do
                if typeof(v207[v208]) ~= "Instance" then
                    error("bad argument #2 to 'SetCollisionMode' (blacklist contained a " .. typeof(v207[v208]) .. " on index " .. tostring(v208) .. " which is not an Instance)", 2);
                end;
            end;
            v22 = {
                v40
            };
            for v209 = 1, #v207 do
                table.insert(v22, v207[v209]);
            end;
        else
            error("bad argument #2 to 'SetCollisionMode (Instance or array of Instance expected, got " .. typeof(v207) .. ")'", 2);
        end;
        v24 = nil;
    elseif v206 == v12.Whitelist then
        if typeof(v207) == "Instance" then
            v22 = {
                v207
            };
        elseif typeof(v207) == "table" then
            for v210 = 1, #v207 do
                if typeof(v207[v210]) ~= "Instance" then
                    error("bad argument #2 to 'SetCollisionMode' (whitelist contained a " .. typeof(v207[v210]) .. " on index " .. tostring(v210) .. " which is not an Instance)", 2);
                end;
            end;
            v22 = {};
            for v211 = 1, #v207 do
                table.insert(v22, v207[v211]);
            end;
        else
            error("bad argument #2 to 'SetCollisionMode (Instance or array of Instance expected, got " .. typeof(v207) .. ")'", 2);
        end;
        v24 = nil;
    elseif v206 == v12.Function then
        if typeof(v207) ~= "function" then
            error("bad argument #2 to 'SetCollisionMode' (function expected, got " .. typeof(v207) .. ")", 2);
        end;
        v22 = nil;
        v24 = v207;
    else
        error("bad argument #1 to 'SetCollisionMode (Rain.CollisionMode expected, got " .. typeof(v207) .. ")'", 2);
    end;
    l_Function_0 = v206;
    v62 = v61[v206];
end;
l_NumberValue_5.inside = function(_) --[[ Line: 1076 ]] --[[ Name: inside ]]
    -- upvalues: v1 (ref)
    return v1;
end;
return l_NumberValue_5;