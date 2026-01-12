local l_Players_0 = game:GetService("Players");
local l_CommonUtils_0 = script.Parent.Parent.Parent:WaitForChild("CommonUtils");
local l_FlagUtil_0 = require(l_CommonUtils_0:WaitForChild("FlagUtil"));
local l_CameraWrapper_0 = require(l_CommonUtils_0:WaitForChild("CameraWrapper"));
local l_ConnectionUtil_0 = require(l_CommonUtils_0:WaitForChild("ConnectionUtil"));
local v5 = l_FlagUtil_0.getUserFlag("UserCurrentCameraUpdate2");
local v6 = l_FlagUtil_0.getUserFlag("UserPlayerConnectionMemoryLeak");
local v7 = if v5 then l_CameraWrapper_0.new() else nil;
local v8 = if v5 then nil else game.Workspace.CurrentCamera;
if v5 then
    v7:Enable();
end;
local l_min_0 = math.min;
local l_tan_0 = math.tan;
local l_rad_0 = math.rad;
local _ = Ray.new;
local v13 = {
    workspace.Effects, 
    workspace.CurrentCamera, 
    workspace.NPCs, 
    workspace.PlayerCharacters
};
local v14 = RaycastParams.new();
v14.IgnoreWater = true;
v14.FilterType = Enum.RaycastFilterType.Exclude;
v14.FilterDescendantsInstances = v13;
local v15 = RaycastParams.new();
v15.IgnoreWater = true;
v15.FilterType = Enum.RaycastFilterType.Include;
v15.FilterDescendantsInstances = {
    workspace.Islands, 
    workspace.Env, 
    workspace.Ships
};
local v16 = if v6 then l_ConnectionUtil_0.new() else nil;
local function _(v17) --[[ Line: 46 ]] --[[ Name: getTotalTransparency ]]
    return 1 - (1 - v17.Transparency) * (1 - v17.LocalTransparencyModifier);
end;
local function _(v19, v20) --[[ Line: 50 ]] --[[ Name: eraseFromEnd ]]
    for v21 = #v19, v20 + 1, -1 do
        v19[v21] = nil;
    end;
end;
local v23 = nil;
local v24 = nil;
local v25 = nil;
if v5 then
    local function v30() --[[ Line: 60 ]] --[[ Name: updateProjection ]]
        -- upvalues: v7 (copy), l_rad_0 (copy), v25 (ref), l_tan_0 (copy), v24 (ref)
        local v26 = v7:getCamera();
        local v27 = l_rad_0(v26.FieldOfView);
        local l_ViewportSize_0 = v26.ViewportSize;
        local v29 = l_ViewportSize_0.X / l_ViewportSize_0.Y;
        v25 = l_tan_0(v27 / 2) * 2;
        v24 = v29 * v25;
    end;
    v7:Connect("FieldOfView", v30);
    v7:Connect("ViewportSize", v30);
    local v31 = v7:getCamera();
    local v32 = l_rad_0(v31.FieldOfView);
    local l_ViewportSize_1 = v31.ViewportSize;
    local v34 = l_ViewportSize_1.X / l_ViewportSize_1.Y;
    v25 = l_tan_0(v32 / 2) * 2;
    v24 = v34 * v25;
    v23 = v7:getCamera().NearPlaneZ;
    v7:Connect("NearPlaneZ", function() --[[ Line: 76 ]]
        -- upvalues: v23 (ref), v7 (copy)
        v23 = v7:getCamera().NearPlaneZ;
    end);
else
    local function v38() --[[ Line: 82 ]] --[[ Name: updateProjection ]]
        -- upvalues: v8 (ref), l_rad_0 (copy), v25 (ref), l_tan_0 (copy), v24 (ref)
        local v35 = l_rad_0(v8.FieldOfView);
        local l_ViewportSize_2 = v8.ViewportSize;
        local v37 = l_ViewportSize_2.X / l_ViewportSize_2.Y;
        v25 = l_tan_0(v35 / 2) * 2;
        v24 = v37 * v25;
    end;
    v8:GetPropertyChangedSignal("FieldOfView"):Connect(v38);
    v8:GetPropertyChangedSignal("ViewportSize"):Connect(v38);
    local v39 = l_rad_0(v8.FieldOfView);
    local l_ViewportSize_3 = v8.ViewportSize;
    local v41 = l_ViewportSize_3.X / l_ViewportSize_3.Y;
    v25 = l_tan_0(v39 / 2) * 2;
    v24 = v41 * v25;
    v23 = v8.NearPlaneZ;
    v8:GetPropertyChangedSignal("NearPlaneZ"):Connect(function() --[[ Line: 96 ]]
        -- upvalues: v23 (ref), v8 (ref)
        v23 = v8.NearPlaneZ;
    end);
end;
local v42 = table.clone(v13);
local v43 = {};
local l_v43_0 = v43 --[[ copy: 23 -> 33 ]];
local function v48() --[[ Line: 105 ]] --[[ Name: refreshIgnoreList ]]
    -- upvalues: v42 (ref), v13 (copy), l_v43_0 (copy)
    local v45 = 1;
    v42 = table.clone(v13);
    for _, v47 in pairs(l_v43_0) do
        v42[v45] = v47;
        v45 = v45 + 1;
    end;
end;
local function v62(v49) --[[ Line: 114 ]] --[[ Name: playerAdded ]]
    -- upvalues: l_v43_0 (copy), v42 (ref), v13 (copy), v6 (copy), v16 (copy)
    local function v54(v50) --[[ Line: 115 ]] --[[ Name: characterAdded ]]
        -- upvalues: l_v43_0 (ref), v49 (copy), v42 (ref), v13 (ref)
        l_v43_0[v49] = v50;
        local v51 = 1;
        v42 = table.clone(v13);
        for _, v53 in pairs(l_v43_0) do
            v42[v51] = v53;
            v51 = v51 + 1;
        end;
    end;
    local function v58() --[[ Line: 119 ]] --[[ Name: characterRemoving ]]
        -- upvalues: l_v43_0 (ref), v49 (copy), v42 (ref), v13 (ref)
        l_v43_0[v49] = nil;
        local v55 = 1;
        v42 = table.clone(v13);
        for _, v57 in pairs(l_v43_0) do
            v42[v55] = v57;
            v55 = v55 + 1;
        end;
    end;
    if v6 then
        v16:trackConnection(("%*CharacterAdded"):format(v49.UserId), v49.CharacterAdded:Connect(v54));
        v16:trackConnection(("%*CharacterRemoving"):format(v49.UserId), v49.CharacterRemoving:Connect(v58));
    else
        v49.CharacterAdded:Connect(v54);
        v49.CharacterRemoving:Connect(v58);
    end;
    if v49.Character then
        l_v43_0[v49] = v49.Character;
        local v59 = 1;
        v42 = table.clone(v13);
        for _, v61 in pairs(l_v43_0) do
            v42[v59] = v61;
            v59 = v59 + 1;
        end;
    end;
end;
local function v67(v63) --[[ Line: 137 ]] --[[ Name: playerRemoving ]]
    -- upvalues: l_v43_0 (copy), v42 (ref), v13 (copy), v6 (copy), v16 (copy)
    l_v43_0[v63] = nil;
    local v64 = 1;
    v42 = table.clone(v13);
    for _, v66 in pairs(l_v43_0) do
        v42[v64] = v66;
        v64 = v64 + 1;
    end;
    if v6 then
        v16:disconnect((("%*CharacterAdded"):format(v63.UserId)));
        v16:disconnect((("%*CharacterRemoving"):format(v63.UserId)));
    end;
end;
l_Players_0.PlayerAdded:Connect(v62);
l_Players_0.PlayerRemoving:Connect(v67);
for _, v69 in ipairs(l_Players_0:GetPlayers()) do
    v62(v69);
end;
local v70 = 1;
v42 = table.clone(v13);
for _, v72 in pairs(v43) do
    v42[v70] = v72;
    v70 = v70 + 1;
end;
v43 = nil;
v48 = nil;
if v5 then
    v7:Connect("CameraSubject", function() --[[ Line: 177 ]]
        -- upvalues: v7 (copy), v48 (ref)
        local l_CameraSubject_0 = v7:getCamera().CameraSubject;
        if l_CameraSubject_0 and l_CameraSubject_0:IsA("Humanoid") then
            v48 = l_CameraSubject_0.RootPart;
            return;
        elseif l_CameraSubject_0 and l_CameraSubject_0:IsA("BasePart") then
            v48 = l_CameraSubject_0;
            return;
        else
            v48 = nil;
            return;
        end;
    end);
else
    v8:GetPropertyChangedSignal("CameraSubject"):Connect(function() --[[ Line: 188 ]]
        -- upvalues: v8 (ref), v48 (ref)
        local l_CameraSubject_1 = v8.CameraSubject;
        if l_CameraSubject_1:IsA("Humanoid") then
            v48 = l_CameraSubject_1.RootPart;
            return;
        elseif l_CameraSubject_1:IsA("BasePart") then
            v48 = l_CameraSubject_1;
            return;
        else
            v48 = nil;
            return;
        end;
    end);
end;
v62 = function(v75) --[[ Line: 200 ]] --[[ Name: canOcclude ]]
    -- upvalues: v43 (ref)
    local v76 = false;
    if 1 - (1 - v75.Transparency) * (1 - v75.LocalTransparencyModifier) < 0.25 then
        v76 = v75.CanCollide and v43 ~= (v75:GetRootPart() or v75) and not v75:IsA("TrussPart");
    end;
    return v76;
end;
v67 = {
    Vector2.new(0.4, 0), 
    Vector2.new(-0.4, 0), 
    Vector2.new(0, -0.4), 
    Vector2.new(0, 0.4), 
    Vector2.new(0, 0.2)
};
v70 = function(v77, v78) --[[ Line: 228 ]] --[[ Name: getCollisionPoint ]]
    -- upvalues: v13 (copy), v42 (ref), v14 (copy)
    local v79 = table.clone(v13);
    for v80 = 1, #v42 do
        v79[#v79 + 1] = v42[v80];
    end;
    v14.FilterDescendantsInstances = v79;
    while true do
        local v81 = workspace:Raycast(v77, v78, v14);
        if v81 then
            if v81.Instance.CanCollide then
                return v81.Position, true;
            else
                v14:AddToFilter(v81.Instance);
            end;
        end;
        if not v81 then
            return v77 + v78, false;
        end;
    end;
end;
local function v99(v82, v83, v84, v85) --[[ Line: 271 ]] --[[ Name: queryPoint ]]
    -- upvalues: v42 (ref), v23 (ref), v13 (copy), v14 (copy), v43 (ref), v15 (copy)
    debug.profilebegin("queryPoint");
    local _ = #v42;
    v84 = v84 + v23;
    local v87 = v82 + v83 * v84;
    local v88 = 1e999;
    local v89 = 1e999;
    local l_v82_0 = v82;
    local v91 = 0;
    local v92 = table.clone(v13);
    for v93 = 1, #v42 do
        v92[#v92 + 1] = v42[v93];
    end;
    v14.FilterDescendantsInstances = v92;
    while true do
        local v94 = workspace:Raycast(l_v82_0, v87 - l_v82_0, v14);
        if v94 then
            v91 = v91 + 1;
            local l_Instance_0 = v94.Instance;
            local l_Position_0 = v94.Position;
            local l_Magnitude_0 = (l_Position_0 - v82).Magnitude;
            if v91 >= 64 then
                v89 = l_Magnitude_0;
            else
                local v98 = false;
                if 1 - (1 - l_Instance_0.Transparency) * (1 - l_Instance_0.LocalTransparencyModifier) < 0.25 then
                    v98 = l_Instance_0.CanCollide and v43 ~= (l_Instance_0:GetRootPart() or l_Instance_0) and not l_Instance_0:IsA("TrussPart");
                end;
                if v98 then
                    v15.FilterDescendantsInstances = {
                        l_Instance_0
                    };
                    if workspace:Raycast(v87, l_Position_0 - v87, v15) then
                        if if v85 then workspace:Raycast(v85, v87 - v85, v15) or workspace:Raycast(v87, v85 - v87, v15) else false then
                            v89 = l_Magnitude_0;
                        elseif v84 < v88 then
                            v88 = l_Magnitude_0;
                        end;
                    else
                        v89 = l_Magnitude_0;
                    end;
                end;
            end;
            v14:AddToFilter(l_Instance_0);
            l_v82_0 = l_Position_0 - v83 * 0.001;
            if v89 < 1e999 or not l_Instance_0 then
                break;
            end;
        else
            break;
        end;
    end;
    debug.profileend();
    return v88 - v23, v89 - v23;
end;
local function v117(v100, v101) --[[ Line: 380 ]] --[[ Name: queryViewport ]]
    -- upvalues: v8 (ref), v5 (copy), v7 (copy), v24 (ref), v25 (ref), v23 (ref), v99 (copy)
    debug.profilebegin("queryViewport");
    local l_p_0 = v100.p;
    local l_rightVector_0 = v100.rightVector;
    local l_upVector_0 = v100.upVector;
    local v105 = -v100.lookVector;
    v8 = if v5 then v7:getCamera() else v8;
    local l_ViewportSize_4 = v8.ViewportSize;
    local v107 = 1e999;
    local v108 = 1e999;
    for v109 = 0, 1 do
        local v110 = l_rightVector_0 * ((v109 - 0.5) * v24);
        for v111 = 0, 1 do
            local v112 = l_upVector_0 * ((v111 - 0.5) * v25);
            local v113 = l_p_0 + v23 * (v110 + v112);
            local l_Origin_0 = v8:ViewportPointToRay(l_ViewportSize_4.x * v109, l_ViewportSize_4.y * v111).Origin;
            local v115, v116 = v99(v113, v105, v101, l_Origin_0);
            if v116 < v107 then
                v107 = v116;
            end;
            if v115 < v108 then
                v108 = v115;
            end;
        end;
    end;
    debug.profileend();
    return v108, v107;
end;
local function v132(v118, v119, v120) --[[ Line: 423 ]] --[[ Name: testPromotion ]]
    -- upvalues: v70 (copy), l_min_0 (copy), v99 (copy), v67 (copy)
    debug.profilebegin("testPromotion");
    local l_p_1 = v118.p;
    local l_rightVector_1 = v118.rightVector;
    local l_upVector_1 = v118.upVector;
    local v124 = -v118.lookVector;
    debug.profilebegin("extrapolate");
    local l_Magnitude_1 = (v70(l_p_1, v120.posVelocity * 1.25) - l_p_1).Magnitude;
    local l_magnitude_0 = v120.posVelocity.magnitude;
    for v127 = 0, l_min_0(1.25, v120.rotVelocity.magnitude + l_Magnitude_1 / l_magnitude_0), 0.0625 do
        local v128 = v120.extrapolate(v127);
        if v119 <= v99(v128.p, -v128.lookVector, v119) then
            return false;
        end;
    end;
    debug.profileend();
    debug.profilebegin("testOffsets");
    for _, v130 in ipairs(v67) do
        local v131 = v70(l_p_1, l_rightVector_1 * v130.x + l_upVector_1 * v130.y);
        if v99(v131, (l_p_1 + v124 * v119 - v131).Unit, v119) == 1e999 then
            return false;
        end;
    end;
    debug.profileend();
    debug.profileend();
    return true;
end;
return function(v133, v134, v135) --[[ Line: 472 ]] --[[ Name: Popper ]]
    -- upvalues: v43 (ref), v48 (ref), v117 (copy), v132 (copy)
    debug.profilebegin("popper");
    v43 = v48 and v48:GetRootPart() or v48;
    local l_v134_0 = v134;
    local v137, v138 = v117(v133, v134);
    if v138 < l_v134_0 then
        l_v134_0 = v138;
    end;
    if v137 < l_v134_0 and v132(v133, v134, v135) then
        l_v134_0 = v137;
    end;
    v43 = nil;
    debug.profileend();
    return l_v134_0;
end;