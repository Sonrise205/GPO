local v0 = {};
local v1 = "rbxasset://textures/ui/traildot.png";
local v2 = "rbxasset://textures/ui/waypoint.png";
local v3 = false;
local v4 = UDim2.new(0, 42, 0, 50);
local v5 = Vector2.new(0, 0.5);
local v6 = Vector2.new(0, 1);
local v7 = Vector2.new(0, 0.5);
local v8 = Vector2.new(0.1, 0.5);
local v9 = Vector2.new(-0.1, 0.5);
local v10 = Vector2.new(1.5, 1.5);
local v11 = RaycastParams.new();
v11.FilterType = Enum.RaycastFilterType.Exclude;
local l_Players_0 = game:GetService("Players");
local l_TweenService_0 = game:GetService("TweenService");
local l_RunService_0 = game:GetService("RunService");
local l_Workspace_0 = game:GetService("Workspace");
local l_CommonUtils_0 = script.Parent.Parent:WaitForChild("CommonUtils");
local v17 = require(l_CommonUtils_0:WaitForChild("FlagUtil")).getUserFlag("UserRaycastUpdateAPI");
local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
local function v30() --[[ Line: 55 ]] --[[ Name: CreateWaypointTemplates ]]
    -- upvalues: v10 (ref), v3 (ref), v1 (ref), v4 (copy), v5 (copy), v2 (ref), v7 (copy)
    local l_Part_0 = Instance.new("Part");
    l_Part_0.Size = Vector3.new(1, 1, 1, 0);
    l_Part_0.Anchored = true;
    l_Part_0.CanCollide = false;
    l_Part_0.Name = "TrailDot";
    l_Part_0.Transparency = 1;
    local l_ImageHandleAdornment_0 = Instance.new("ImageHandleAdornment");
    l_ImageHandleAdornment_0.Name = "TrailDotImage";
    l_ImageHandleAdornment_0.Size = v10;
    l_ImageHandleAdornment_0.SizeRelativeOffset = Vector3.new(0, 0, -0.10000000149011612, 0);
    l_ImageHandleAdornment_0.AlwaysOnTop = v3;
    l_ImageHandleAdornment_0.Image = v1;
    l_ImageHandleAdornment_0.Adornee = l_Part_0;
    l_ImageHandleAdornment_0.Parent = l_Part_0;
    local l_Part_1 = Instance.new("Part");
    l_Part_1.Size = Vector3.new(2, 2, 2, 0);
    l_Part_1.Anchored = true;
    l_Part_1.CanCollide = false;
    l_Part_1.Name = "EndWaypoint";
    l_Part_1.Transparency = 1;
    local l_ImageHandleAdornment_1 = Instance.new("ImageHandleAdornment");
    l_ImageHandleAdornment_1.Name = "TrailDotImage";
    l_ImageHandleAdornment_1.Size = v10;
    l_ImageHandleAdornment_1.SizeRelativeOffset = Vector3.new(0, 0, -0.10000000149011612, 0);
    l_ImageHandleAdornment_1.AlwaysOnTop = v3;
    l_ImageHandleAdornment_1.Image = v1;
    l_ImageHandleAdornment_1.Adornee = l_Part_1;
    l_ImageHandleAdornment_1.Parent = l_Part_1;
    local l_BillboardGui_0 = Instance.new("BillboardGui");
    l_BillboardGui_0.Name = "EndWaypointBillboard";
    l_BillboardGui_0.Size = v4;
    l_BillboardGui_0.LightInfluence = 0;
    l_BillboardGui_0.SizeOffset = v5;
    l_BillboardGui_0.AlwaysOnTop = true;
    l_BillboardGui_0.Adornee = l_Part_1;
    l_BillboardGui_0.Parent = l_Part_1;
    local l_ImageLabel_0 = Instance.new("ImageLabel");
    l_ImageLabel_0.Image = v2;
    l_ImageLabel_0.BackgroundTransparency = 1;
    l_ImageLabel_0.Size = UDim2.new(1, 0, 1, 0);
    l_ImageLabel_0.Parent = l_BillboardGui_0;
    local l_Part_2 = Instance.new("Part");
    l_Part_2.Size = Vector3.new(2, 2, 2, 0);
    l_Part_2.Anchored = true;
    l_Part_2.CanCollide = false;
    l_Part_2.Name = "FailureWaypoint";
    l_Part_2.Transparency = 1;
    local l_ImageHandleAdornment_2 = Instance.new("ImageHandleAdornment");
    l_ImageHandleAdornment_2.Name = "TrailDotImage";
    l_ImageHandleAdornment_2.Size = v10;
    l_ImageHandleAdornment_2.SizeRelativeOffset = Vector3.new(0, 0, -0.10000000149011612, 0);
    l_ImageHandleAdornment_2.AlwaysOnTop = v3;
    l_ImageHandleAdornment_2.Image = v1;
    l_ImageHandleAdornment_2.Adornee = l_Part_2;
    l_ImageHandleAdornment_2.Parent = l_Part_2;
    local l_BillboardGui_1 = Instance.new("BillboardGui");
    l_BillboardGui_1.Name = "FailureWaypointBillboard";
    l_BillboardGui_1.Size = v4;
    l_BillboardGui_1.LightInfluence = 0;
    l_BillboardGui_1.SizeOffset = v7;
    l_BillboardGui_1.AlwaysOnTop = true;
    l_BillboardGui_1.Adornee = l_Part_2;
    l_BillboardGui_1.Parent = l_Part_2;
    local l_Frame_0 = Instance.new("Frame");
    l_Frame_0.BackgroundTransparency = 1;
    l_Frame_0.Size = UDim2.new(0, 0, 0, 0);
    l_Frame_0.Position = UDim2.new(0.5, 0, 1, 0);
    l_Frame_0.Parent = l_BillboardGui_1;
    local l_ImageLabel_1 = Instance.new("ImageLabel");
    l_ImageLabel_1.Image = v2;
    l_ImageLabel_1.BackgroundTransparency = 1;
    l_ImageLabel_1.Position = UDim2.new(0, -v4.X.Offset / 2, 0, -v4.Y.Offset);
    l_ImageLabel_1.Size = v4;
    l_ImageLabel_1.Parent = l_Frame_0;
    return l_Part_0, l_Part_1, l_Part_2;
end;
local v31, v32, v33 = v30();
local function _() --[[ Line: 141 ]] --[[ Name: getTrailDotParent ]]
    -- upvalues: l_Workspace_0 (copy)
    local l_CurrentCamera_0 = l_Workspace_0.CurrentCamera;
    local l_ClickToMoveDisplay_0 = l_CurrentCamera_0:FindFirstChild("ClickToMoveDisplay");
    if not l_ClickToMoveDisplay_0 then
        l_ClickToMoveDisplay_0 = Instance.new("Model");
        l_ClickToMoveDisplay_0.Name = "ClickToMoveDisplay";
        l_ClickToMoveDisplay_0.Parent = l_CurrentCamera_0;
    end;
    return l_ClickToMoveDisplay_0;
end;
local function v48(v37, v38) --[[ Line: 152 ]] --[[ Name: placePathWaypoint ]]
    -- upvalues: v17 (copy), v11 (copy), l_Workspace_0 (copy), l_LocalPlayer_0 (copy)
    if v17 then
        v11.FilterDescendantsInstances = {
            l_Workspace_0.CurrentCamera, 
            l_LocalPlayer_0.Character
        };
        local v39 = l_Workspace_0:Raycast(v38 + Vector3.new(0, 2.5, 0, 0), Vector3.new(-0, -10, -0, -0), v11);
        if v39 then
            v37.CFrame = CFrame.lookAlong(v39.Position, v39.Normal);
            local l_CurrentCamera_1 = l_Workspace_0.CurrentCamera;
            local l_ClickToMoveDisplay_1 = l_CurrentCamera_1:FindFirstChild("ClickToMoveDisplay");
            if not l_ClickToMoveDisplay_1 then
                l_ClickToMoveDisplay_1 = Instance.new("Model");
                l_ClickToMoveDisplay_1.Name = "ClickToMoveDisplay";
                l_ClickToMoveDisplay_1.Parent = l_CurrentCamera_1;
            end;
            v37.Parent = l_ClickToMoveDisplay_1;
            return;
        end;
    else
        local v42 = Ray.new(v38 + Vector3.new(0, 2.5, 0, 0), (Vector3.new(0, -10, 0, 0)));
        local l_l_Workspace_0_PartOnRayWithIgnoreList_0, v44, v45 = l_Workspace_0:FindPartOnRayWithIgnoreList(v42, {
            l_Workspace_0.CurrentCamera, 
            l_LocalPlayer_0.Character
        });
        if l_l_Workspace_0_PartOnRayWithIgnoreList_0 then
            v37.CFrame = CFrame.new(v44, v44 + v45);
            local l_CurrentCamera_2 = l_Workspace_0.CurrentCamera;
            local l_ClickToMoveDisplay_2 = l_CurrentCamera_2:FindFirstChild("ClickToMoveDisplay");
            if not l_ClickToMoveDisplay_2 then
                l_ClickToMoveDisplay_2 = Instance.new("Model");
                l_ClickToMoveDisplay_2.Name = "ClickToMoveDisplay";
                l_ClickToMoveDisplay_2.Parent = l_CurrentCamera_2;
            end;
            v37.Parent = l_ClickToMoveDisplay_2;
        end;
    end;
end;
local v49 = {};
v49.__index = v49;
v49.Destroy = function(v50) --[[ Line: 177 ]] --[[ Name: Destroy ]]
    v50.DisplayModel:Destroy();
end;
v49.NewDisplayModel = function(_, v52) --[[ Line: 181 ]] --[[ Name: NewDisplayModel ]]
    -- upvalues: v31 (ref), v48 (copy)
    local v53 = v31:Clone();
    v48(v53, v52);
    return v53;
end;
v49.new = function(v54, v55) --[[ Line: 187 ]] --[[ Name: new ]]
    -- upvalues: v49 (copy)
    local v56 = setmetatable({}, v49);
    v56.DisplayModel = v56:NewDisplayModel(v54);
    v56.ClosestWayPoint = v55;
    return v56;
end;
local v57 = {};
v57.__index = v57;
v57.Destroy = function(v58) --[[ Line: 199 ]] --[[ Name: Destroy ]]
    v58.Destroyed = true;
    v58.Tween:Cancel();
    v58.DisplayModel:Destroy();
end;
v57.NewDisplayModel = function(_, v60) --[[ Line: 205 ]] --[[ Name: NewDisplayModel ]]
    -- upvalues: v32 (ref), v48 (copy)
    local v61 = v32:Clone();
    v48(v61, v60);
    return v61;
end;
v57.CreateTween = function(v62) --[[ Line: 211 ]] --[[ Name: CreateTween ]]
    -- upvalues: l_TweenService_0 (copy), v6 (copy)
    local v63 = TweenInfo.new(0.5, Enum.EasingStyle.Sine, Enum.EasingDirection.Out, -1, true);
    local v64 = l_TweenService_0:Create(v62.DisplayModel.EndWaypointBillboard, v63, {
        SizeOffset = v6
    });
    v64:Play();
    return v64;
end;
v57.TweenInFrom = function(v65, v66) --[[ Line: 222 ]] --[[ Name: TweenInFrom ]]
    -- upvalues: l_TweenService_0 (copy)
    local v67 = v66 - v65.DisplayModel.Position;
    v65.DisplayModel.EndWaypointBillboard.StudsOffset = Vector3.new(0, v67.Y, 0);
    local v68 = TweenInfo.new(1, Enum.EasingStyle.Sine, Enum.EasingDirection.Out);
    local v69 = l_TweenService_0:Create(v65.DisplayModel.EndWaypointBillboard, v68, {
        StudsOffset = Vector3.new(0, 0, 0, 0)
    });
    v69:Play();
    return v69;
end;
v57.new = function(v70, v71, v72) --[[ Line: 236 ]] --[[ Name: new ]]
    -- upvalues: v57 (copy)
    local v73 = setmetatable({}, v57);
    v73.DisplayModel = v73:NewDisplayModel(v70);
    v73.Destroyed = false;
    if v72 and (v72 - v70).Magnitude > 5 then
        v73.Tween = v73:TweenInFrom(v72);
        coroutine.wrap(function() --[[ Line: 243 ]]
            -- upvalues: v73 (copy)
            v73.Tween.Completed:Wait();
            if not v73.Destroyed then
                v73.Tween = v73:CreateTween();
            end;
        end)();
    else
        v73.Tween = v73:CreateTween();
    end;
    v73.ClosestWayPoint = v71;
    return v73;
end;
local v74 = {};
v74.__index = v74;
v74.Hide = function(v75) --[[ Line: 260 ]] --[[ Name: Hide ]]
    v75.DisplayModel.Parent = nil;
end;
v74.Destroy = function(v76) --[[ Line: 264 ]] --[[ Name: Destroy ]]
    v76.DisplayModel:Destroy();
end;
v74.NewDisplayModel = function(_, v78) --[[ Line: 268 ]] --[[ Name: NewDisplayModel ]]
    -- upvalues: v33 (ref), v48 (copy), v17 (copy), v11 (copy), l_Workspace_0 (copy), l_LocalPlayer_0 (copy)
    local v79 = v33:Clone();
    v48(v79, v78);
    if v17 then
        v11.FilterDescendantsInstances = {
            l_Workspace_0.CurrentCamera, 
            l_LocalPlayer_0.Character
        };
        local v80 = l_Workspace_0:Raycast(v78 + Vector3.new(0, 2.5, 0, 0), Vector3.new(-0, -10, -0, -0), v11);
        if v80 then
            v79.CFrame = CFrame.lookAlong(v80.Position, v80.Normal);
            local l_CurrentCamera_3 = l_Workspace_0.CurrentCamera;
            local l_ClickToMoveDisplay_3 = l_CurrentCamera_3:FindFirstChild("ClickToMoveDisplay");
            if not l_ClickToMoveDisplay_3 then
                l_ClickToMoveDisplay_3 = Instance.new("Model");
                l_ClickToMoveDisplay_3.Name = "ClickToMoveDisplay";
                l_ClickToMoveDisplay_3.Parent = l_CurrentCamera_3;
            end;
            v79.Parent = l_ClickToMoveDisplay_3;
            return v79;
        end;
    else
        local v83 = Ray.new(v78 + Vector3.new(0, 2.5, 0, 0), (Vector3.new(0, -10, 0, 0)));
        local l_l_Workspace_0_PartOnRayWithIgnoreList_1, v85, v86 = l_Workspace_0:FindPartOnRayWithIgnoreList(v83, {
            l_Workspace_0.CurrentCamera, 
            l_LocalPlayer_0.Character
        });
        if l_l_Workspace_0_PartOnRayWithIgnoreList_1 then
            v79.CFrame = CFrame.new(v85, v85 + v86);
            local l_CurrentCamera_4 = l_Workspace_0.CurrentCamera;
            local l_ClickToMoveDisplay_4 = l_CurrentCamera_4:FindFirstChild("ClickToMoveDisplay");
            if not l_ClickToMoveDisplay_4 then
                l_ClickToMoveDisplay_4 = Instance.new("Model");
                l_ClickToMoveDisplay_4.Name = "ClickToMoveDisplay";
                l_ClickToMoveDisplay_4.Parent = l_CurrentCamera_4;
            end;
            v79.Parent = l_ClickToMoveDisplay_4;
        end;
    end;
    return v79;
end;
v74.RunFailureTween = function(v89) --[[ Line: 292 ]] --[[ Name: RunFailureTween ]]
    -- upvalues: l_TweenService_0 (copy), v8 (copy), v9 (copy), v7 (copy)
    wait(0.125);
    local v90 = TweenInfo.new(0.0625, Enum.EasingStyle.Sine, Enum.EasingDirection.Out);
    local v91 = l_TweenService_0:Create(v89.DisplayModel.FailureWaypointBillboard, v90, {
        SizeOffset = v8
    });
    v91:Play();
    l_TweenService_0:Create(v89.DisplayModel.FailureWaypointBillboard.Frame, v90, {
        Rotation = 10
    }):Play();
    v91.Completed:wait();
    v90 = TweenInfo.new(0.125, Enum.EasingStyle.Sine, Enum.EasingDirection.Out, 3, true);
    local v92 = l_TweenService_0:Create(v89.DisplayModel.FailureWaypointBillboard, v90, {
        SizeOffset = v9
    });
    v92:Play();
    v90 = TweenInfo.new(0.125, Enum.EasingStyle.Sine, Enum.EasingDirection.Out, 3, true);
    l_TweenService_0:Create(v89.DisplayModel.FailureWaypointBillboard.Frame.ImageLabel, v90, {
        ImageColor3 = Color3.new(0.75, 0.75, 0.75)
    }):Play();
    l_TweenService_0:Create(v89.DisplayModel.FailureWaypointBillboard.Frame, v90, {
        Rotation = -10
    }):Play();
    v92.Completed:wait();
    v90 = TweenInfo.new(0.0625, Enum.EasingStyle.Sine, Enum.EasingDirection.Out);
    local v93 = l_TweenService_0:Create(v89.DisplayModel.FailureWaypointBillboard, v90, {
        SizeOffset = v7
    });
    v93:Play();
    l_TweenService_0:Create(v89.DisplayModel.FailureWaypointBillboard.Frame, v90, {
        Rotation = 0
    }):Play();
    v93.Completed:wait();
    wait(0.125);
end;
v74.new = function(v94) --[[ Line: 341 ]] --[[ Name: new ]]
    -- upvalues: v74 (copy)
    local v95 = setmetatable({}, v74);
    v95.DisplayModel = v95:NewDisplayModel(v94);
    return v95;
end;
local l_Animation_0 = Instance.new("Animation");
l_Animation_0.AnimationId = "rbxassetid://2874840706";
local v97 = nil;
local function _(v98) --[[ Line: 355 ]] --[[ Name: getFailureAnimationTrack ]]
    -- upvalues: v97 (ref), l_Animation_0 (copy)
    if v98 == nil then
        return v97;
    else
        v97 = v98:LoadAnimation(l_Animation_0);
        assert(v97, "");
        v97.Priority = Enum.AnimationPriority.Action;
        v97.Looped = false;
        return v97;
    end;
end;
local function _() --[[ Line: 366 ]] --[[ Name: findPlayerHumanoid ]]
    -- upvalues: l_LocalPlayer_0 (copy)
    local l_Character_0 = l_LocalPlayer_0.Character;
    if l_Character_0 then
        return l_Character_0:FindFirstChildOfClass("Humanoid");
    else
        return;
    end;
end;
local function v111(v102, v103) --[[ Line: 373 ]] --[[ Name: createTrailDots ]]
    -- upvalues: v49 (copy), v57 (copy)
    local v104 = {};
    local v105 = 1;
    for v106 = 1, #v102 - 1 do
        local v107 = (v102[v106].Position - v102[#v102].Position).Magnitude < 3;
        local v108 = false;
        if v106 % 2 == 0 then
            v108 = not v107;
        end;
        if v108 then
            v104[v105] = v49.new(v102[v106].Position, v106);
            v105 = v105 + 1;
        end;
    end;
    table.insert(v104, (v57.new(v102[#v102].Position, #v102, v103)));
    local v109 = {};
    v105 = 1;
    for v110 = #v104, 1, -1 do
        v109[v105] = v104[v110];
        v105 = v105 + 1;
    end;
    return v109;
end;
local function _(v112, v113) --[[ Line: 398 ]] --[[ Name: getTrailDotScale ]]
    return v113 * (math.clamp(v112 - 10, 0, 90) / 90 * 1.5 + 1);
end;
local v115 = 0;
v0.CreatePathDisplay = function(v116, v117) --[[ Line: 407 ]] --[[ Name: CreatePathDisplay ]]
    -- upvalues: v115 (ref), v111 (copy), l_RunService_0 (copy), l_Workspace_0 (copy), v10 (ref)
    v115 = v115 + 1;
    local v118 = v111(v116, v117);
    local function v122(v119) --[[ Line: 411 ]] --[[ Name: removePathBeforePoint ]]
        -- upvalues: v118 (copy)
        for v120 = #v118, 1, -1 do
            local v121 = v118[v120];
            if v121.ClosestWayPoint <= v119 then
                v121:Destroy();
                v118[v120] = nil;
            else
                break;
            end;
        end;
    end;
    local v123 = "ClickToMoveResizeTrail" .. v115;
    local function v128() --[[ Line: 425 ]] --[[ Name: resizeTrailDots ]]
        -- upvalues: v118 (copy), l_RunService_0 (ref), v123 (copy), l_Workspace_0 (ref), v10 (ref)
        if #v118 == 0 then
            l_RunService_0:UnbindFromRenderStep(v123);
            return;
        else
            local l_p_0 = l_Workspace_0.CurrentCamera.CFrame.p;
            for v125 = 1, #v118 do
                local l_TrailDotImage_0 = v118[v125].DisplayModel:FindFirstChild("TrailDotImage");
                if l_TrailDotImage_0 then
                    local l_Magnitude_0 = (v118[v125].DisplayModel.Position - l_p_0).Magnitude;
                    l_TrailDotImage_0.Size = v10 * (math.clamp(l_Magnitude_0 - 10, 0, 90) / 90 * 1.5 + 1);
                end;
            end;
            return;
        end;
    end;
    l_RunService_0:BindToRenderStep(v123, Enum.RenderPriority.Camera.Value - 1, v128);
    return function() --[[ Line: 441 ]] --[[ Name: removePath ]]
        -- upvalues: v122 (copy), v116 (copy)
        v122(#v116);
    end, v122;
end;
local v129 = nil;
v0.DisplayFailureWaypoint = function(v130) --[[ Line: 449 ]] --[[ Name: DisplayFailureWaypoint ]]
    -- upvalues: v129 (ref), v74 (copy)
    if v129 then
        v129:Hide();
    end;
    local v131 = v74.new(v130);
    v129 = v131;
    coroutine.wrap(function() --[[ Line: 455 ]]
        -- upvalues: v131 (ref)
        v131:RunFailureTween();
        v131:Destroy();
        v131 = nil;
    end)();
end;
v0.CreateEndWaypoint = function(v132) --[[ Line: 462 ]] --[[ Name: CreateEndWaypoint ]]
    -- upvalues: v57 (copy)
    return v57.new(v132);
end;
v0.PlayFailureAnimation = function() --[[ Line: 466 ]] --[[ Name: PlayFailureAnimation ]]
    -- upvalues: l_LocalPlayer_0 (copy), v97 (ref), l_Animation_0 (copy)
    local l_Character_1 = l_LocalPlayer_0.Character;
    local v134 = if l_Character_1 then l_Character_1:FindFirstChildOfClass("Humanoid") else nil;
    if v134 then
        if v134 == nil then
            l_Character_1 = v97;
        else
            v97 = v134:LoadAnimation(l_Animation_0);
            assert(v97, "");
            v97.Priority = Enum.AnimationPriority.Action;
            v97.Looped = false;
            l_Character_1 = v97;
        end;
        l_Character_1:Play();
    end;
end;
v0.CancelFailureAnimation = function() --[[ Line: 474 ]] --[[ Name: CancelFailureAnimation ]]
    -- upvalues: v97 (ref)
    if v97 ~= nil and v97.IsPlaying then
        v97:Stop();
    end;
end;
v0.SetWaypointTexture = function(v135) --[[ Line: 480 ]] --[[ Name: SetWaypointTexture ]]
    -- upvalues: v1 (ref), v31 (ref), v32 (ref), v33 (ref), v30 (copy)
    v1 = v135;
    local v136, v137, v138 = v30();
    v31 = v136;
    v32 = v137;
    v33 = v138;
end;
v0.GetWaypointTexture = function() --[[ Line: 485 ]] --[[ Name: GetWaypointTexture ]]
    -- upvalues: v1 (ref)
    return v1;
end;
v0.SetWaypointRadius = function(v139) --[[ Line: 489 ]] --[[ Name: SetWaypointRadius ]]
    -- upvalues: v10 (ref), v31 (ref), v32 (ref), v33 (ref), v30 (copy)
    v10 = Vector2.new(v139, v139);
    local v140, v141, v142 = v30();
    v31 = v140;
    v32 = v141;
    v33 = v142;
end;
v0.GetWaypointRadius = function() --[[ Line: 494 ]] --[[ Name: GetWaypointRadius ]]
    -- upvalues: v10 (ref)
    return v10.X;
end;
v0.SetEndWaypointTexture = function(v143) --[[ Line: 498 ]] --[[ Name: SetEndWaypointTexture ]]
    -- upvalues: v2 (ref), v31 (ref), v32 (ref), v33 (ref), v30 (copy)
    v2 = v143;
    local v144, v145, v146 = v30();
    v31 = v144;
    v32 = v145;
    v33 = v146;
end;
v0.GetEndWaypointTexture = function() --[[ Line: 503 ]] --[[ Name: GetEndWaypointTexture ]]
    -- upvalues: v2 (ref)
    return v2;
end;
v0.SetWaypointsAlwaysOnTop = function(v147) --[[ Line: 507 ]] --[[ Name: SetWaypointsAlwaysOnTop ]]
    -- upvalues: v3 (ref), v31 (ref), v32 (ref), v33 (ref), v30 (copy)
    v3 = v147;
    local v148, v149, v150 = v30();
    v31 = v148;
    v32 = v149;
    v33 = v150;
end;
v0.GetWaypointsAlwaysOnTop = function() --[[ Line: 512 ]] --[[ Name: GetWaypointsAlwaysOnTop ]]
    -- upvalues: v3 (ref)
    return v3;
end;
return v0;