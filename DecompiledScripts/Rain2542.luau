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
local l_Whitelist_0 = v12.Whitelist;
local v22 = {
    workspace.Islands, 
    workspace.Ships, 
    workspace.Env
};
local v23 = nil;
local v24 = 1;
local v25 = 1;
local v26 = 0;
local v27 = 0;
local v28 = 0;
local l_new_0 = Vector3.new;
local v30 = NumberSequenceKeypoint.new(0, 1, 0);
local v31 = NumberSequenceKeypoint.new(1, 1, 0);
local v32 = {};
for _, v34 in pairs(v11) do
    table.insert(v32, v34 * 35);
end;
table.sort(v32, function(v35, v36) --[[ Line: 269 ]]
    return v35.magnitude < v36.magnitude;
end);
local l_SoundGroup_0 = Instance.new("SoundGroup");
l_SoundGroup_0.Name = "__RainSoundGroup";
l_SoundGroup_0.Volume = 0.2;
l_SoundGroup_0.Archivable = false;
local l_Sound_0 = Instance.new("Sound");
l_Sound_0.Name = "RainSound";
l_Sound_0.Volume = v28;
l_Sound_0.SoundId = "rbxassetid://1516791621";
l_Sound_0.Looped = true;
l_Sound_0.SoundGroup = l_SoundGroup_0;
l_Sound_0.Parent = l_SoundGroup_0;
l_Sound_0.Archivable = false;
local v39 = nil;
v39 = Instance.new("Part");
v39.Transparency = 1;
v39.Anchored = true;
v39.CanCollide = false;
v39.Locked = false;
v39.Archivable = false;
v39.TopSurface = Enum.SurfaceType.Smooth;
v39.BottomSurface = Enum.SurfaceType.Smooth;
v39.Name = "__RainEmitter";
v39.Size = Vector3.new(0.05000000074505806, 0.05000000074505806, 0.05000000074505806, 0);
v39.Archivable = false;
local l_ParticleEmitter_0 = Instance.new("ParticleEmitter");
l_ParticleEmitter_0.Name = "RainStraight";
l_ParticleEmitter_0.LightEmission = 0.05;
l_ParticleEmitter_0.LightInfluence = 0.9;
l_ParticleEmitter_0.Size = v2;
l_ParticleEmitter_0.Texture = "rbxassetid://1822883048";
l_ParticleEmitter_0.LockedToPart = true;
l_ParticleEmitter_0.Enabled = false;
l_ParticleEmitter_0.Lifetime = v3;
l_ParticleEmitter_0.Rate = 150;
l_ParticleEmitter_0.Speed = NumberRange.new(60);
l_ParticleEmitter_0.EmissionDirection = Enum.NormalId.Bottom;
l_ParticleEmitter_0.Parent = v39;
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
l_ParticleEmitter_1.Rate = 100;
l_ParticleEmitter_1.Speed = NumberRange.new(60);
l_ParticleEmitter_1.EmissionDirection = Enum.NormalId.Bottom;
l_ParticleEmitter_1.Parent = v39;
l_ParticleEmitter_0 = nil;
l_ParticleEmitter_1 = nil;
l_ParticleEmitter_0 = {};
l_ParticleEmitter_1 = {};
for _ = 1, 20 do
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
        v30, 
        NumberSequenceKeypoint.new(0.25, 0.6, 0), 
        NumberSequenceKeypoint.new(0.75, 0.6, 0), 
        v31
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
    local v46 = v39.RainStraight:Clone();
    v46.Speed = NumberRange.new(70, 100);
    v46.SpreadAngle = v10;
    v46.LockedToPart = false;
    v46.Enabled = false;
    v46.Parent = l_Attachment_1;
    local v47 = v39.RainTopDown:Clone();
    v47.Speed = NumberRange.new(70, 100);
    v47.SpreadAngle = v10;
    v47.LockedToPart = false;
    v47.Enabled = false;
    v47.Parent = l_Attachment_1;
    l_Attachment_1.Archivable = false;
    table.insert(l_ParticleEmitter_1, l_Attachment_1);
end;
local v48 = {
    v39
};
local v60 = {
    [v12.None] = function(v49, v50) --[[ Line: 394 ]]
        -- upvalues: v39 (ref), l_Players_0 (copy), v48 (copy)
        return _G.raycastIgnoreList(v49, v50 and {
            v39, 
            l_Players_0.LocalPlayer and l_Players_0.LocalPlayer.Character
        } or v48);
    end, 
    [v12.Blacklist] = function(v51) --[[ Line: 397 ]]
        -- upvalues: v22 (ref)
        return _G.raycastIgnoreList(v51, v22);
    end, 
    [v12.Whitelist] = function(v52) --[[ Line: 400 ]]
        -- upvalues: v22 (ref)
        return _G.raycastWhitelist(v52, v22);
    end, 
    [v12.Function] = function(v53) --[[ Line: 403 ]]
        -- upvalues: v48 (copy), v23 (ref)
        local v54 = v53.Origin + v53.Direction;
        while true do
            if v53.Direction.magnitude > 0.001 then
                local v55, v56, v57, v58 = _G.raycastIgnoreList(v53, v48);
                if not v55 or v23(v55) then
                    return v55, v56, v57, v58;
                else
                    local v59 = v56 + v53.Direction.Unit * 0.001;
                    v53 = Ray.new(v59, v54 - v59);
                end;
            else
                return;
            end;
        end;
    end
};
local v61 = v60[l_Whitelist_0];
local function v98() --[[ Line: 418 ]] --[[ Name: connectLoop ]]
    -- upvalues: v17 (ref), l_RunService_0 (copy), v61 (ref), v19 (ref), v20 (ref), v28 (ref), v18 (ref), l_TweenService_0 (copy), l_Sound_0 (copy), v39 (ref), l_new_0 (copy), v1 (ref), v30 (copy), v24 (ref), v31 (copy), v25 (ref), l_ParticleEmitter_1 (ref), v32 (copy), v27 (ref), l_ParticleEmitter_0 (ref), v26 (ref)
    local v62 = Random.new();
    local v63 = true;
    local v64 = 12;
    table.insert(v17, l_RunService_0.Heartbeat:connect(function() --[[ Line: 426 ]]
        -- upvalues: v61 (ref), v19 (ref), v20 (ref), v28 (ref), v18 (ref), l_TweenService_0 (ref), l_Sound_0 (ref), v64 (ref), v39 (ref), l_new_0 (ref), v63 (ref), v1 (ref)
        local v65, _ = v61(Ray.new(workspace.CurrentCamera.CFrame.p, -v19 * 1000), true);
        if (not v20 or workspace.CurrentCamera.CFrame.p.y <= v20) and not v65 then
            if v28 < 1 and not v18 then
                v28 = 1;
                l_TweenService_0:Create(l_Sound_0, TweenInfo.new(0.5), {
                    Volume = 1
                }):Play();
            end;
            v64 = 12;
            local v67 = math.abs((workspace.CurrentCamera.CFrame.lookVector:Dot(v19)));
            local l_p_0 = workspace.CurrentCamera.CFrame.p;
            local v69 = workspace.CurrentCamera.CFrame.lookVector:Cross(-v19);
            v69 = v69.magnitude > 0.001 and v69.unit or -v19;
            local l_unit_0 = v19:Cross(v69).unit;
            v39.Size = l_new_0(40, 40, (1 - v67) * 60 + 40);
            v39.CFrame = CFrame.new(l_p_0.x, l_p_0.y, l_p_0.z, v69.x, -v19.x, l_unit_0.x, v69.y, -v19.y, l_unit_0.y, v69.z, -v19.z, l_unit_0.z) + (1 - v67) * workspace.CurrentCamera.CFrame.lookVector * v39.Size.Z / 3 - v67 * v19 * 20;
            if v39:FindFirstChild("RainTopDown") then
                v39.RainStraight.Enabled = true;
                v39.RainTopDown.Enabled = true;
            end;
            v63 = false;
        else
            if v39 and v39:FindFirstChild("RainStraight") then
                v39.RainStraight.Enabled = false;
                v39.RainTopDown.Enabled = false;
            end;
            v63 = true;
        end;
        v1 = v63;
    end));
    local v71 = l_RunService_0:IsRunning() and l_RunService_0.Heartbeat;
    table.insert(v17, v71:connect(function() --[[ Line: 488 ]]
        -- upvalues: v64 (ref), v19 (ref), v30 (ref), v24 (ref), v31 (ref), v25 (ref), v63 (ref), l_ParticleEmitter_1 (ref), v18 (ref), v20 (ref), v32 (ref), v61 (ref), v28 (ref), l_TweenService_0 (ref), l_Sound_0 (ref), v39 (ref), v27 (ref), l_ParticleEmitter_0 (ref), v62 (copy), l_new_0 (ref), v26 (ref)
        v64 = v64 + 1;
        if v64 >= 12 then
            local v72 = math.abs((workspace.CurrentCamera.CFrame.lookVector:Dot(v19)));
            local v73 = NumberSequence.new({
                v30, 
                NumberSequenceKeypoint.new(0.25, (1 - v72) * v24 + v72, 0), 
                NumberSequenceKeypoint.new(0.75, (1 - v72) * v24 + v72, 0), 
                v31
            });
            local v74 = NumberSequence.new({
                v30, 
                NumberSequenceKeypoint.new(0.25, v72 * v25 + (1 - v72), 0), 
                NumberSequenceKeypoint.new(0.75, v72 * v25 + (1 - v72), 0), 
                v31
            });
            local v75 = workspace.Camera.CFrame:inverse() * (workspace.Camera.CFrame.p - v19);
            local v76 = NumberRange.new((math.deg((math.atan2(-v75.x, v75.y)))));
            if v63 then
                for _, v78 in pairs(l_ParticleEmitter_1) do
                    v78.RainStraight.Transparency = v73;
                    v78.RainStraight.Rotation = v76;
                    v78.RainTopDown.Transparency = v74;
                end;
                if not v18 then
                    local v79 = 0;
                    if not v20 or workspace.CurrentCamera.CFrame.p.y <= v20 then
                        local v80 = 35;
                        local v81 = -v19 * 1000;
                        for v82 = 1, #v32 do
                            if not v61(Ray.new(workspace.CurrentCamera.CFrame * v32[v82], v81), true) then
                                v80 = v32[v82].magnitude;
                                break;
                            end;
                        end;
                        v79 = 1 - v80 / 35;
                    end;
                    if math.abs(v79 - v28) > 0.01 then
                        v28 = v79;
                        l_TweenService_0:Create(l_Sound_0, TweenInfo.new(1), {
                            Volume = v28
                        }):Play();
                    end;
                end;
            elseif v39 and v39:FindFirstChild("RainStraight") then
                v39.RainStraight.Transparency = v73;
                v39.RainStraight.Rotation = v76;
                v39.RainTopDown.Transparency = v74;
            end;
            v64 = 0;
        end;
        local l_p_1 = workspace.CurrentCamera.CFrame.p;
        local v84 = workspace.CurrentCamera.CFrame.lookVector:Cross(-v19);
        v84 = v84.magnitude > 0.001 and v84.unit or -v19;
        local l_unit_1 = v19:Cross(v84).unit;
        local v86 = CFrame.new(l_p_1.x, l_p_1.y, l_p_1.z, v84.x, -v19.x, l_unit_1.x, v84.y, -v19.y, l_unit_1.y, v84.z, -v19.z, l_unit_1.z);
        local v87 = v19 * 550;
        for v88 = 1, v27 do
            local v89 = l_ParticleEmitter_0[v88];
            local v90 = l_ParticleEmitter_1[v88];
            local v91 = v62:NextNumber(-100, 100);
            local v92 = v62:NextNumber(-100, 100);
            local v93, v94, v95 = v61(Ray.new(v86 * l_new_0(v91, 500, v92), v87));
            if v93 then
                v89.Position = v94 + v95 * 0.5;
                v89.RainSplash:Emit(1);
                if v63 then
                    local v96 = v94 - v19 * 50;
                    if v20 and v96.Y > v20 and v19.Y < 0 then
                        v96 = v96 + v19 * (v20 - v96.Y) / v19.Y;
                    end;
                    v90.CFrame = v86 - v86.p + v96;
                    v90.RainStraight:Emit(v26);
                    v90.RainTopDown:Emit(v26);
                end;
            elseif v63 then
                local v97 = v86 * l_new_0(v91, v62:NextNumber(20, 100), v92);
                if v20 and v97.Y > v20 and v19.Y < 0 then
                    v97 = v97 + v19 * (v20 - v97.Y) / v19.Y;
                end;
                v90.CFrame = v86 - v86.p + v97;
                v90.RainStraight:Emit(v26);
                v90.RainTopDown:Emit(v26);
            end;
        end;
    end));
end;
local function v101() --[[ Line: 634 ]] --[[ Name: disconnectLoop ]]
    -- upvalues: v17 (ref)
    if #v17 > 0 then
        for _, v100 in pairs(v17) do
            v100:disconnect();
        end;
        v17 = {};
    end;
end;
local function v105(v102) --[[ Line: 644 ]] --[[ Name: disableSound ]]
    -- upvalues: v28 (ref), l_TweenService_0 (copy), l_Sound_0 (copy)
    v28 = 0;
    local v103 = l_TweenService_0:Create(l_Sound_0, v102, {
        Volume = 0
    });
    v103.Completed:connect(function(v104) --[[ Line: 649 ]]
        -- upvalues: l_Sound_0 (ref), v103 (copy)
        if v104 == Enum.PlaybackState.Completed then
            l_Sound_0:Stop();
        end;
        v103:Destroy();
    end);
    v103:Play();
end;
local function _() --[[ Line: 659 ]] --[[ Name: disable ]]
    -- upvalues: v101 (copy), v39 (ref), v18 (ref), v105 (copy)
    v101();
    v39.RainStraight.Enabled = false;
    v39.RainTopDown.Enabled = false;
    v39.Size = Vector3.new(0.05000000074505806, 0.05000000074505806, 0.05000000074505806, 0);
    if not v18 then
        v105(TweenInfo.new(1));
    end;
end;
local function _(v107, v108, v109) --[[ Line: 676 ]] --[[ Name: makeProperty ]]
    local v110 = Instance.new(v107);
    if v108 then
        v110.Value = v108;
    end;
    v110.Changed:connect(v109);
    v109(v110.Value);
    return v110;
end;
local function v118(v112) --[[ Line: 686 ]]
    -- upvalues: v39 (ref), l_ParticleEmitter_0 (ref), l_ParticleEmitter_1 (ref)
    local v113 = ColorSequence.new(v112);
    v39.RainStraight.Color = v113;
    v39.RainTopDown.Color = v113;
    for _, v115 in pairs(l_ParticleEmitter_0) do
        v115.RainSplash.Color = v113;
    end;
    for _, v117 in pairs(l_ParticleEmitter_1) do
        v117.RainStraight.Color = v113;
        v117.RainTopDown.Color = v113;
    end;
end;
local l_Color3Value_0 = Instance.new("Color3Value");
if v0 then
    l_Color3Value_0.Value = v0;
end;
l_Color3Value_0.Changed:connect(v118);
v118(l_Color3Value_0.Value);
local l_l_Color3Value_0_0 = l_Color3Value_0;
v118 = function(v121) --[[ Line: 703 ]] --[[ Name: updateTransparency ]]
    -- upvalues: l_NumberValue_0 (copy), v24 (ref), v25 (ref), v30 (copy), v31 (copy), l_ParticleEmitter_0 (ref)
    local v122 = (1 - v121) * (1 - l_NumberValue_0.Value);
    local v123 = 1 - v122;
    v24 = 0.7 * v122 + v123;
    v25 = 0.85 * v122 + v123;
    local v124 = NumberSequence.new({
        v30, 
        NumberSequenceKeypoint.new(0.25, v122 * 0.6 + v123, 0), 
        NumberSequenceKeypoint.new(0.75, v122 * 0.6 + v123, 0), 
        v31
    });
    for _, v126 in pairs(l_ParticleEmitter_0) do
        v126.RainSplash.Transparency = v124;
    end;
end;
local l_NumberValue_1 = Instance.new("NumberValue");
l_NumberValue_1.Value = 0;
l_NumberValue_1.Changed:connect(v118);
v118(l_NumberValue_1.Value);
l_Color3Value_0 = l_NumberValue_1;
l_NumberValue_0.Changed:connect(v118);
local function v129(v128) --[[ Line: 726 ]]
    -- upvalues: v39 (ref)
    v39.RainStraight.Speed = NumberRange.new(v128 * 60);
    v39.RainTopDown.Speed = NumberRange.new(v128 * 60);
end;
local l_NumberValue_2 = Instance.new("NumberValue");
l_NumberValue_2.Value = 1;
l_NumberValue_2.Changed:connect(v129);
v129(l_NumberValue_2.Value);
l_NumberValue_1 = l_NumberValue_2;
l_NumberValue_2 = function(v131) --[[ Line: 733 ]]
    -- upvalues: v39 (ref), v26 (ref), v27 (ref)
    v39.RainStraight.Rate = 150 * v131;
    v39.RainTopDown.Rate = 100 * v131;
    v26 = math.ceil(1 * v131);
    v27 = 20 * v131;
end;
local l_NumberValue_3 = Instance.new("NumberValue");
l_NumberValue_3.Value = 1;
l_NumberValue_3.Changed:connect(l_NumberValue_2);
l_NumberValue_2(l_NumberValue_3.Value);
v129 = l_NumberValue_3;
l_NumberValue_3 = function(v133) --[[ Line: 743 ]]
    -- upvalues: v39 (ref), l_ParticleEmitter_1 (ref), l_ParticleEmitter_0 (ref)
    v39.RainStraight.LightEmission = v133;
    v39.RainTopDown.LightEmission = v133;
    for _, v135 in pairs(l_ParticleEmitter_1) do
        v135.RainStraight.LightEmission = v133;
        v135.RainTopDown.LightEmission = v133;
    end;
    for _, v137 in pairs(l_ParticleEmitter_0) do
        v137.RainSplash.LightEmission = v133;
    end;
end;
local l_NumberValue_4 = Instance.new("NumberValue");
l_NumberValue_4.Value = 0.05;
l_NumberValue_4.Changed:connect(l_NumberValue_3);
l_NumberValue_3(l_NumberValue_4.Value);
l_NumberValue_2 = l_NumberValue_4;
l_NumberValue_4 = function(v139) --[[ Line: 758 ]]
    -- upvalues: v39 (ref), l_ParticleEmitter_1 (ref), l_ParticleEmitter_0 (ref)
    v39.RainStraight.LightInfluence = v139;
    v39.RainTopDown.LightInfluence = v139;
    for _, v141 in pairs(l_ParticleEmitter_1) do
        v141.RainStraight.LightInfluence = v139;
        v141.RainTopDown.LightInfluence = v139;
    end;
    for _, v143 in pairs(l_ParticleEmitter_0) do
        v143.RainSplash.LightInfluence = v139;
    end;
end;
local l_NumberValue_5 = Instance.new("NumberValue");
l_NumberValue_5.Value = 0.9;
l_NumberValue_5.Changed:connect(l_NumberValue_4);
l_NumberValue_4(l_NumberValue_5.Value);
l_NumberValue_3 = l_NumberValue_5;
l_NumberValue_5 = function(v145) --[[ Line: 773 ]]
    -- upvalues: v19 (ref)
    if v145.magnitude > 0.001 then
        v19 = v145.unit;
    end;
end;
local l_Vector3Value_0 = Instance.new("Vector3Value");
l_Vector3Value_0.Value = Vector3.new(0, -1, 0, 0);
l_Vector3Value_0.Changed:connect(l_NumberValue_5);
l_NumberValue_5(l_Vector3Value_0.Value);
l_NumberValue_4 = l_Vector3Value_0;
l_NumberValue_5 = {
    CollisionMode = v12, 
    Enable = function(_, v148) --[[ Line: 786 ]] --[[ Name: Enable ]]
        -- upvalues: v101 (copy), v39 (ref), l_ParticleEmitter_0 (ref), l_ParticleEmitter_1 (ref), l_RunService_0 (copy), l_SoundGroup_0 (copy), v98 (copy), l_TweenService_0 (copy), l_NumberValue_0 (copy), l_Sound_0 (copy), v18 (ref)
        if v148 ~= nil and typeof(v148) ~= "TweenInfo" then
            error("bad argument #1 to 'Enable' (TweenInfo expected, got " .. typeof(v148) .. ")", 2);
        end;
        v101();
        if v39:FindFirstChild("RainStraight") then
            v39.RainStraight.Enabled = true;
            v39.RainTopDown.Enabled = true;
            v39.Parent = workspace.CurrentCamera;
        end;
        for v149 = 1, 20 do
            l_ParticleEmitter_0[v149].Parent = workspace.Terrain;
            l_ParticleEmitter_1[v149].Parent = workspace.Terrain;
        end;
        if l_RunService_0:IsRunning() then
            l_SoundGroup_0.Parent = game:GetService("SoundService");
        end;
        v98();
        if v148 then
            l_TweenService_0:Create(l_NumberValue_0, v148, {
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
    end, 
    Disable = function(_, v151) --[[ Line: 826 ]] --[[ Name: Disable ]]
        -- upvalues: l_TweenService_0 (copy), l_NumberValue_0 (copy), v101 (copy), v39 (ref), v18 (ref), v105 (copy)
        if v151 ~= nil and typeof(v151) ~= "TweenInfo" then
            error("bad argument #1 to 'Disable' (TweenInfo expected, got " .. typeof(v151) .. ")", 2);
        end;
        if v151 then
            local v152 = l_TweenService_0:Create(l_NumberValue_0, v151, {
                Value = 1
            });
            v152.Completed:connect(function(v153) --[[ Line: 834 ]]
                -- upvalues: v101 (ref), v39 (ref), v18 (ref), v105 (ref), v152 (copy)
                if v153 == Enum.PlaybackState.Completed then
                    v101();
                    v39.RainStraight.Enabled = false;
                    v39.RainTopDown.Enabled = false;
                    v39.Size = Vector3.new(0.05000000074505806, 0.05000000074505806, 0.05000000074505806, 0);
                    if not v18 then
                        v105(TweenInfo.new(1));
                    end;
                end;
                v152:Destroy();
            end);
            v152:Play();
            v105(v151);
        else
            l_NumberValue_0.Value = 1;
            v101();
            v39.RainStraight.Enabled = false;
            v39.RainTopDown.Enabled = false;
            v39.Size = Vector3.new(0.05000000074505806, 0.05000000074505806, 0.05000000074505806, 0);
            if not v18 then
                v105(TweenInfo.new(1));
            end;
        end;
        v18 = true;
    end, 
    SetColor = function(_, v155, v156) --[[ Line: 853 ]] --[[ Name: SetColor ]]
        -- upvalues: l_TweenService_0 (copy), l_l_Color3Value_0_0 (copy)
        if typeof(v155) ~= "Color3" then
            error("bad argument #1 to 'SetColor' (Color3 expected, got " .. typeof(v155) .. ")", 2);
        elseif v156 ~= nil and typeof(v156) ~= "TweenInfo" then
            error("bad argument #2 to 'SetColor' (TweenInfo expected, got " .. typeof(v156) .. ")", 2);
        end;
        if v156 then
            l_TweenService_0:Create(l_l_Color3Value_0_0, v156, {
                Value = v155
            }):Play();
            return;
        else
            l_l_Color3Value_0_0.Value = v155;
            return;
        end;
    end
};
l_Vector3Value_0 = function(v157, v158) --[[ Line: 869 ]] --[[ Name: makeRatioSetter ]]
    -- upvalues: l_TweenService_0 (copy)
    return function(_, v160, v161) --[[ Line: 871 ]]
        -- upvalues: v157 (copy), l_TweenService_0 (ref), v158 (copy)
        if typeof(v160) ~= "number" then
            error("bad argument #1 to '" .. v157 .. "' (number expected, got " .. typeof(v160) .. ")", 2);
        elseif v161 ~= nil and typeof(v161) ~= "TweenInfo" then
            error("bad argument #2 to '" .. v157 .. "' (TweenInfo expected, got " .. typeof(v161) .. ")", 2);
        end;
        v160 = math.clamp(v160, 0, 1);
        if v161 then
            l_TweenService_0:Create(v158, v161, {
                Value = v160
            }):Play();
            return;
        else
            v158.Value = v160;
            return;
        end;
    end;
end;
local v162 = "SetTransparency";
local l_v162_0 = v162 --[[ copy: 57 -> 58 ]];
l_NumberValue_5.SetTransparency = function(_, v165, v166) --[[ Line: 871 ]]
    -- upvalues: l_v162_0 (copy), l_TweenService_0 (copy), l_Color3Value_0 (copy)
    if typeof(v165) ~= "number" then
        error("bad argument #1 to '" .. l_v162_0 .. "' (number expected, got " .. typeof(v165) .. ")", 2);
    elseif v166 ~= nil and typeof(v166) ~= "TweenInfo" then
        error("bad argument #2 to '" .. l_v162_0 .. "' (TweenInfo expected, got " .. typeof(v166) .. ")", 2);
    end;
    v165 = math.clamp(v165, 0, 1);
    if v166 then
        l_TweenService_0:Create(l_Color3Value_0, v166, {
            Value = v165
        }):Play();
        return;
    else
        l_Color3Value_0.Value = v165;
        return;
    end;
end;
v162 = "SetSpeedRatio";
local l_v162_1 = v162 --[[ copy: 57 -> 59 ]];
l_NumberValue_5.SetSpeedRatio = function(_, v169, v170) --[[ Line: 871 ]]
    -- upvalues: l_v162_1 (copy), l_TweenService_0 (copy), l_NumberValue_1 (copy)
    if typeof(v169) ~= "number" then
        error("bad argument #1 to '" .. l_v162_1 .. "' (number expected, got " .. typeof(v169) .. ")", 2);
    elseif v170 ~= nil and typeof(v170) ~= "TweenInfo" then
        error("bad argument #2 to '" .. l_v162_1 .. "' (TweenInfo expected, got " .. typeof(v170) .. ")", 2);
    end;
    v169 = math.clamp(v169, 0, 1);
    if v170 then
        l_TweenService_0:Create(l_NumberValue_1, v170, {
            Value = v169
        }):Play();
        return;
    else
        l_NumberValue_1.Value = v169;
        return;
    end;
end;
v162 = "SetIntensityRatio";
local l_v162_2 = v162 --[[ copy: 57 -> 60 ]];
l_NumberValue_5.SetIntensityRatio = function(_, v173, v174) --[[ Line: 871 ]]
    -- upvalues: l_v162_2 (copy), l_TweenService_0 (copy), v129 (copy)
    if typeof(v173) ~= "number" then
        error("bad argument #1 to '" .. l_v162_2 .. "' (number expected, got " .. typeof(v173) .. ")", 2);
    elseif v174 ~= nil and typeof(v174) ~= "TweenInfo" then
        error("bad argument #2 to '" .. l_v162_2 .. "' (TweenInfo expected, got " .. typeof(v174) .. ")", 2);
    end;
    v173 = math.clamp(v173, 0, 1);
    if v174 then
        l_TweenService_0:Create(v129, v174, {
            Value = v173
        }):Play();
        return;
    else
        v129.Value = v173;
        return;
    end;
end;
v162 = "SetLightEmission";
local l_v162_3 = v162 --[[ copy: 57 -> 61 ]];
l_NumberValue_5.SetLightEmission = function(_, v177, v178) --[[ Line: 871 ]]
    -- upvalues: l_v162_3 (copy), l_TweenService_0 (copy), l_NumberValue_2 (copy)
    if typeof(v177) ~= "number" then
        error("bad argument #1 to '" .. l_v162_3 .. "' (number expected, got " .. typeof(v177) .. ")", 2);
    elseif v178 ~= nil and typeof(v178) ~= "TweenInfo" then
        error("bad argument #2 to '" .. l_v162_3 .. "' (TweenInfo expected, got " .. typeof(v178) .. ")", 2);
    end;
    v177 = math.clamp(v177, 0, 1);
    if v178 then
        l_TweenService_0:Create(l_NumberValue_2, v178, {
            Value = v177
        }):Play();
        return;
    else
        l_NumberValue_2.Value = v177;
        return;
    end;
end;
v162 = "SetLightInfluence";
l_NumberValue_5.SetLightInfluence = function(_, v180, v181) --[[ Line: 871 ]]
    -- upvalues: v162 (copy), l_TweenService_0 (copy), l_NumberValue_3 (copy)
    if typeof(v180) ~= "number" then
        error("bad argument #1 to '" .. v162 .. "' (number expected, got " .. typeof(v180) .. ")", 2);
    elseif v181 ~= nil and typeof(v181) ~= "TweenInfo" then
        error("bad argument #2 to '" .. v162 .. "' (TweenInfo expected, got " .. typeof(v181) .. ")", 2);
    end;
    v180 = math.clamp(v180, 0, 1);
    if v181 then
        l_TweenService_0:Create(l_NumberValue_3, v181, {
            Value = v180
        }):Play();
        return;
    else
        l_NumberValue_3.Value = v180;
        return;
    end;
end;
l_NumberValue_5.SetVolume = function(_, v183, v184) --[[ Line: 896 ]] --[[ Name: SetVolume ]]
    -- upvalues: l_TweenService_0 (copy), l_SoundGroup_0 (copy)
    if typeof(v183) ~= "number" then
        error("bad argument #1 to 'SetVolume' (number expected, got " .. typeof(v183) .. ")", 2);
    elseif v184 ~= nil and typeof(v184) ~= "TweenInfo" then
        error("bad argument #2 to 'SetVolume' (TweenInfo expected, got " .. typeof(v184) .. ")", 2);
    end;
    if v184 then
        l_TweenService_0:Create(l_SoundGroup_0, v184, {
            Volume = v183
        }):Play();
        return;
    else
        l_SoundGroup_0.Volume = v183;
        return;
    end;
end;
l_NumberValue_5.SetDirection = function(_, v186, v187) --[[ Line: 912 ]] --[[ Name: SetDirection ]]
    -- upvalues: l_TweenService_0 (copy), l_NumberValue_4 (copy)
    if typeof(v186) ~= "Vector3" then
        error("bad argument #1 to 'SetDirection' (Vector3 expected, got " .. typeof(v186) .. ")", 2);
    elseif v187 ~= nil and typeof(v187) ~= "TweenInfo" then
        error("bad argument #2 to 'SetDirection' (TweenInfo expected, got " .. typeof(v187) .. ")", 2);
    end;
    if v186.unit.magnitude <= 0 then
        warn("Attempt to set rain direction to a zero-length vector, falling back on default direction = (" .. tostring((Vector3.new(0, -1, 0, 0))) .. ")");
        v186 = Vector3.new(0, -1, 0, 0);
    end;
    if v187 then
        l_TweenService_0:Create(l_NumberValue_4, v187, {
            Value = v186
        }):Play();
        return;
    else
        l_NumberValue_4.Value = v186;
        return;
    end;
end;
l_NumberValue_5.SetCeiling = function(_, v189) --[[ Line: 933 ]] --[[ Name: SetCeiling ]]
    -- upvalues: v20 (ref)
    if v189 ~= nil and typeof(v189) ~= "number" then
        error("bad argument #1 to 'SetCeiling' (number expected, got " .. typeof(v189) .. ")", 2);
    end;
    v20 = v189;
end;
l_NumberValue_5.SetStraightTexture = function(_, v191) --[[ Line: 943 ]] --[[ Name: SetStraightTexture ]]
    -- upvalues: v39 (ref), l_ParticleEmitter_1 (ref)
    if typeof(v191) ~= "string" then
        error("bad argument #1 to 'SetStraightTexture' (string expected, got " .. typeof(v191) .. ")", 2);
    end;
    if v39 and v39:FindFirstChild("RainStraight") then
        v39.RainStraight.Texture = v191;
        for _, v193 in pairs(l_ParticleEmitter_1) do
            v193.RainStraight.Texture = v191;
        end;
    end;
end;
l_NumberValue_5.SetTopDownTexture = function(_, v195) --[[ Line: 960 ]] --[[ Name: SetTopDownTexture ]]
    -- upvalues: v39 (ref), l_ParticleEmitter_1 (ref)
    if typeof(v195) ~= "string" then
        error("bad argument #1 to 'SetStraightTexture' (string expected, got " .. typeof(v195) .. ")", 2);
    end;
    if v39 and v39:FindFirstChild("RainTopDown") then
        v39.RainTopDown.Texture = v195;
    end;
    for _, v197 in pairs(l_ParticleEmitter_1) do
        v197.RainTopDown.Texture = v195;
    end;
end;
l_NumberValue_5.SetSplashTexture = function(_, v199) --[[ Line: 975 ]] --[[ Name: SetSplashTexture ]]
    -- upvalues: l_ParticleEmitter_0 (ref)
    if typeof(v199) ~= "string" then
        error("bad argument #1 to 'SetStraightTexture' (string expected, got " .. typeof(v199) .. ")", 2);
    end;
    for _, v201 in pairs(l_ParticleEmitter_0) do
        v201.RainSplash.Texture = v199;
    end;
end;
l_NumberValue_5.SetSoundId = function(_, v203) --[[ Line: 987 ]] --[[ Name: SetSoundId ]]
    -- upvalues: l_Sound_0 (copy)
    if typeof(v203) ~= "string" then
        error("bad argument #1 to 'SetSoundId' (string expected, got " .. typeof(v203) .. ")", 2);
    end;
    l_Sound_0.SoundId = v203;
end;
l_NumberValue_5.inside = function(_) --[[ Line: 997 ]] --[[ Name: inside ]]
    -- upvalues: v1 (ref)
    return v1;
end;
l_NumberValue_5.SetCollisionMode = function(_, v206, v207) --[[ Line: 1001 ]] --[[ Name: SetCollisionMode ]]
    -- upvalues: v12 (copy), v22 (ref), v23 (ref), v39 (ref), l_Whitelist_0 (ref), v61 (ref), v60 (copy)
    if v206 == v12.None then
        v22 = nil;
        v23 = nil;
    elseif v206 == v12.Blacklist then
        if typeof(v207) == "Instance" then
            v22 = {
                v207, 
                v39
            };
        elseif typeof(v207) == "table" then
            for v208 = 1, #v207 do
                if typeof(v207[v208]) ~= "Instance" then
                    error("bad argument #2 to 'SetCollisionMode' (blacklist contained a " .. typeof(v207[v208]) .. " on index " .. tostring(v208) .. " which is not an Instance)", 2);
                end;
            end;
            v22 = {
                v39
            };
            for v209 = 1, #v207 do
                table.insert(v22, v207[v209]);
            end;
        else
            error("bad argument #2 to 'SetCollisionMode (Instance or array of Instance expected, got " .. typeof(v207) .. ")'", 2);
        end;
        v23 = nil;
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
        v23 = nil;
    elseif v206 == v12.Function then
        if typeof(v207) ~= "function" then
            error("bad argument #2 to 'SetCollisionMode' (function expected, got " .. typeof(v207) .. ")", 2);
        end;
        v22 = nil;
        v23 = v207;
    else
        error("bad argument #1 to 'SetCollisionMode (Rain.CollisionMode expected, got " .. typeof(v207) .. ")'", 2);
    end;
    l_Whitelist_0 = v206;
    v61 = v60[v206];
end;
return l_NumberValue_5;