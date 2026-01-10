local v0 = nil;
if game.Players.LocalPlayer then
    v0 = game.Players.LocalPlayer:WaitForChild("PlayerGui");
elseif pcall(function() --[[ Line: 44 ]]
    PluginManager():CreatePlugin();
end) then
    v0 = game.CoreGui;
end;
local v1 = {};
local l_new_0 = CFrame.new;
local l_Angles_0 = CFrame.Angles;
local l_new_1 = Ray.new;
local l_new_2 = Instance.new;
local l_new_3 = UDim2.new;
local l_NormalId_0 = Enum.NormalId;
local l_UserInputType_0 = Enum.UserInputType;
local v9 = true;
local v10 = nil;
local v11 = nil;
if v0 then
    v10 = l_new_2("ScreenGui");
    v10.Name = "MouseModuleIconFrameHolder";
    v10.Parent = v0;
    v11 = l_new_2("ImageLabel");
    v11.Name = "MouseModuleIcon";
    v11.Size = l_new_3(0, 100, 0, 100);
    v11.BackgroundTransparency = 1;
    v11.Image = "";
    v11.Parent = v10;
    spawn(function() --[[ Line: 69 ]]
        -- upvalues: v9 (ref), v11 (ref), v1 (copy)
        while v9 == true do
            v11.Image = v1.Icon or "";
            task.wait();
        end;
    end);
end;
local v12 = l_new_2("BindableEvent");
local v13 = l_new_2("BindableEvent");
local v14 = l_new_2("BindableEvent");
local v15 = l_new_2("BindableEvent");
local v16 = l_new_2("BindableEvent");
local v17 = l_new_2("BindableEvent");
local v18 = l_new_2("BindableEvent");
local v19 = l_new_2("BindableEvent");
v1.X = 0;
v1.Y = 0;
v1.Hit = l_new_0();
v1.Icon = "";
v1.Button1Down = v12.Event;
v1.Button1Up = v13.Event;
v1.Button2Down = v14.Event;
v1.Button2Up = v15.Event;
v1.WheelForward = v16.Event;
v1.WheelBackward = v17.Event;
v1.Idle = v18.Event;
v1.Move = v19.Event;
local l_CurrentCamera_0 = game.Workspace.CurrentCamera;
while not l_CurrentCamera_0 do
    task.wait();
    l_CurrentCamera_0 = game.Workspace.CurrentCamera;
end;
local l_UserInputService_0 = game:GetService("UserInputService");
local function v39(v22, v23) --[[ Line: 101 ]] --[[ Name: VectorToFace ]]
    -- upvalues: l_NormalId_0 (copy)
    local _, _, _, v27, v28, v29, v30, v31, v32, v33, v34, v35 = v22:components();
    local l_X_0 = v23.X;
    local l_Y_0 = v23.Y;
    local l_Z_0 = v23.Z;
    if l_X_0 == v28 and l_Y_0 == v31 and l_Z_0 == v34 then
        return l_NormalId_0.Top;
    elseif l_X_0 == v27 and l_Y_0 == v30 and l_Z_0 == v33 then
        return l_NormalId_0.Right;
    elseif l_X_0 == v29 and l_Y_0 == v32 and l_Z_0 == v35 then
        return l_NormalId_0.Back;
    elseif l_X_0 == -v28 and l_Y_0 == -v31 and l_Z_0 == -v34 then
        return l_NormalId_0.Bottom;
    elseif l_X_0 == -v27 and l_Y_0 == -v30 and l_Z_0 == -v33 then
        return l_NormalId_0.Left;
    elseif l_X_0 == -v29 and l_Y_0 == -v32 and l_Z_0 == -v35 then
        return l_NormalId_0.Front;
    else
        return;
    end;
end;
local function _(v40) --[[ Line: 119 ]] --[[ Name: GetRayFromMousePoint ]]
    -- upvalues: l_CurrentCamera_0 (ref), v1 (copy), l_new_1 (copy)
    local v41 = l_CurrentCamera_0:ScreenPointToRay(v1.X, v1.Y, v40);
    local v42 = v41.Origin + v41.Direction;
    return l_new_1(l_CurrentCamera_0.CoordinateFrame.p, v42 - l_CurrentCamera_0.CoordinateFrame.p);
end;
local function v58() --[[ Line: 125 ]] --[[ Name: UpdateProps ]]
    -- upvalues: l_CurrentCamera_0 (ref), v1 (copy), l_new_1 (copy), v39 (copy), l_new_0 (copy), l_Angles_0 (copy)
    local v44 = l_CurrentCamera_0:ScreenPointToRay(v1.X, v1.Y, 999);
    local v45 = v44.Origin + v44.Direction;
    local v46 = l_new_1(l_CurrentCamera_0.CoordinateFrame.p, v45 - l_CurrentCamera_0.CoordinateFrame.p);
    v44 = nil;
    v45 = nil;
    local v47 = nil;
    if type(v1.TargetFilter) == "table" then
        local v48, v49, v50 = _G.raycastIgnoreList(v46, v1.TargetFilter);
        v44 = v48;
        v45 = v49;
        v47 = v50;
    else
        local l_PartOnRay_0, v52, v53 = game.Workspace:FindPartOnRay(v46, v1.TargetFilter);
        v44 = l_PartOnRay_0;
        v45 = v52;
        v47 = v53;
    end;
    v1.Target = v44;
    if v44 then
        v1.TargetSurface = v39(v44.CFrame, v47);
    else
        v1.TargetSurface = nil;
    end;
    local l_p_0 = l_CurrentCamera_0.CoordinateFrame.p;
    v1.Origin = CFrame.new(l_p_0, v46.Origin + v46.Direction);
    v1.Hit = l_new_0(v45, l_p_0) * l_Angles_0(0, 3.141592653589793, 0);
    local l_v1_0 = v1;
    local v56 = l_CurrentCamera_0:ScreenPointToRay(v1.X, v1.Y, 1);
    local v57 = v56.Origin + v56.Direction;
    l_v1_0.UnitRay = l_new_1(l_CurrentCamera_0.CoordinateFrame.p, v57 - l_CurrentCamera_0.CoordinateFrame.p);
    v1.ViewSizeX = l_CurrentCamera_0.ViewportSize.X;
    v1.ViewSizeY = l_CurrentCamera_0.ViewportSize.Y;
end;
local function v64(v59) --[[ Line: 147 ]] --[[ Name: OnKeyGeneral ]]
    -- upvalues: v1 (copy), v11 (ref), l_new_3 (copy), l_UserInputType_0 (copy), v16 (copy), v17 (copy), v58 (copy)
    local l_v1_1 = v1;
    local l_v1_2 = v1;
    local l_X_1 = v59.Position.X;
    local l_Y_1 = v59.Position.Y;
    l_v1_1.X = l_X_1;
    l_v1_2.Y = l_Y_1;
    v11.Position = l_new_3(0, v1.X - 50, 0, v1.Y - 50);
    if v59.UserInputType == l_UserInputType_0.MouseWheel then
        if v59.Position.Z == 1 then
            v16:Fire();
        elseif v59.Position.Z == -1 then
            v17:Fire();
        end;
    end;
    v58();
end;
local function v66(v65) --[[ Line: 161 ]] --[[ Name: OnKeyBegin ]]
    -- upvalues: l_UserInputType_0 (copy), v12 (copy), v14 (copy), v19 (copy), v64 (copy)
    if v65.UserInputType == l_UserInputType_0.MouseButton1 then
        v12:Fire();
    elseif v65.UserInputType == l_UserInputType_0.MouseButton2 then
        v14:Fire();
    elseif v65.UserInputType == Enum.UserInputType.MouseMovement then
        v19:Fire();
    elseif v65.UserInputType == Enum.UserInputType.Touch then
        v12:Fire();
    end;
    v64(v65);
end;
local function v68(v67) --[[ Line: 174 ]] --[[ Name: OnKeyEnd ]]
    -- upvalues: l_UserInputType_0 (copy), v13 (copy), v15 (copy), v18 (copy), v64 (copy)
    if v67.UserInputType == l_UserInputType_0.MouseButton1 then
        v13:Fire();
    elseif v67.UserInputType == l_UserInputType_0.MouseButton2 then
        v15:Fire();
    elseif v67.UserInputType == Enum.UserInputType.MouseMovement then
        v18:Fire();
    elseif v67.UserInputType == Enum.UserInputType.Touch then
        v13:Fire();
    end;
    v64(v67);
end;
local v69 = l_UserInputService_0.InputBegan:Connect(v66);
local v70 = l_UserInputService_0.InputChanged:Connect(v64);
local v71 = l_UserInputService_0.InputEnded:Connect(v68);
v1.Disconnect = function(_) --[[ Line: 191 ]] --[[ Name: Disconnect ]]
    -- upvalues: v9 (ref), v69 (copy), v70 (copy), v71 (copy), v10 (ref)
    v9 = false;
    if v69 then
        v69:disconnect();
    end;
    if v70 then
        v70:disconnect();
    end;
    if v71 then
        v71:disconnect();
    end;
    if v10 then
        v10:Destroy();
    end;
end;
return v1;