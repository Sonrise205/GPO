local l_UserInputService_0 = game:GetService("UserInputService");
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_Players_0 = game:GetService("Players");
local _ = game:GetService("RunService");
local l_Backpack_0 = l_Players_0.LocalPlayer:WaitForChild("PlayerGui"):WaitForChild("BackpackGui", 360):WaitForChild("Backpack");
local v5 = false;
local l_Modules_0 = l_ReplicatedStorage_0:WaitForChild("Modules");
local v7 = require(l_Modules_0.Maid);
local v8 = {};
v8.__index = v8;
v8.new = function(v9) --[[ Line: 21 ]] --[[ Name: new ]]
    -- upvalues: v8 (copy), v7 (copy)
    local v10 = setmetatable({}, v8);
    v10.Object = v9;
    v10.DragStarted = nil;
    v10.DragEnded = nil;
    v10.Dragged = nil;
    v10.ObjectPressed = nil;
    v10.Dragging = false;
    v10.Maid = v7.new();
    return v10;
end;
v8.Enable = function(v11) --[[ Line: 36 ]] --[[ Name: Enable ]]
    -- upvalues: l_UserInputService_0 (copy), v5 (ref), l_Backpack_0 (copy)
    local l_Object_0 = v11.Object;
    local v13 = nil;
    local v14 = nil;
    local v15 = nil;
    local v16 = nil;
    local v17 = false;
    local v18 = false;
    local v19 = nil;
    local v20 = false;
    local v21 = nil;
    local v22 = nil;
    local function v32(v23) --[[ Line: 52 ]] --[[ Name: update ]]
        -- upvalues: v14 (ref), l_UserInputService_0 (ref), l_Object_0 (copy), v15 (ref), v16 (ref), v21 (ref), v22 (ref)
        local _ = v23.Position - v14;
        local l_l_UserInputService_0_MouseLocation_0 = l_UserInputService_0:GetMouseLocation();
        if v14.X == 0 and v14.Y == 0 then
            v14 = Vector3.new(l_l_UserInputService_0_MouseLocation_0.X, l_l_UserInputService_0_MouseLocation_0.Y, 0);
            local v26 = l_Object_0.AbsoluteSize / 2;
            local _ = v26.X;
            local l_Y_0 = v26.Y;
            l_Object_0.Position = UDim2.fromOffset(l_l_UserInputService_0_MouseLocation_0.X, l_l_UserInputService_0_MouseLocation_0.Y + l_Y_0);
            v15 = l_Object_0.Position;
        end;
        local v29 = v16 - l_l_UserInputService_0_MouseLocation_0;
        l_Object_0.Position = UDim2.new(0, v16.X - v29.X, 0, v16.Y - v29.Y);
        if v21 == nil then
            v21 = l_Object_0.AbsolutePosition;
        end;
        local v30 = v22 - v21;
        local v31 = UDim2.new(0, v16.X - v29.X + v30.X, 0, v16.Y - v29.Y + v30.Y);
        l_Object_0.Position = v31;
        return v31;
    end;
    v11.Maid:AddTask(l_Object_0.InputBegan:Connect(function(v33) --[[ Line: 84 ]]
        -- upvalues: v5 (ref), l_Backpack_0 (ref), v17 (ref), v16 (ref), l_UserInputService_0 (ref), v22 (ref), l_Object_0 (copy), v19 (ref), v18 (ref), v11 (copy), v20 (ref), v14 (ref), v15 (ref), v21 (ref)
        if (v33.UserInputType == Enum.UserInputType.MouseButton1 or v33.UserInputType == Enum.UserInputType.Touch) and not v5 then
            if l_Backpack_0.Visible == true then
                v5 = true;
                v17 = true;
            end;
            v16 = l_UserInputService_0:GetMouseLocation();
            v22 = l_Object_0.AbsolutePosition;
            v19 = v33;
            v18 = true;
            local v34 = nil;
            do
                local l_v34_0 = v34;
                l_v34_0 = v33.Changed:Connect(function() --[[ Line: 100 ]]
                    -- upvalues: v33 (copy), l_v34_0 (ref), l_UserInputService_0 (ref), v16 (ref), v18 (ref), v11 (ref), v17 (ref), v5 (ref), v20 (ref), v14 (ref), v15 (ref), v19 (ref), v22 (ref), v21 (ref)
                    if v33.UserInputState == Enum.UserInputState.End then
                        if l_v34_0 then
                            l_v34_0:Disconnect();
                            l_v34_0 = nil;
                        end;
                        local l_l_UserInputService_0_MouseLocation_1 = l_UserInputService_0:GetMouseLocation();
                        if v16 and v16 == l_l_UserInputService_0_MouseLocation_1 then
                            v18 = false;
                            if v11.ObjectPressed then
                                v11.ObjectPressed();
                            end;
                        end;
                        if v11.Dragging then
                            v11.Dragging = false;
                            if v11.DragEnded and not v17 then
                                v11.DragEnded(v33);
                            end;
                            v17 = false;
                        elseif v18 == true then
                            v11.Dragging = false;
                            if v11.ObjectPressed then
                                v11.ObjectPressed();
                            end;
                            v18 = false;
                        end;
                        v11.Dragging = false;
                        v5 = false;
                        v17 = false;
                        v20 = false;
                        v16 = nil;
                        v14 = nil;
                        v15 = nil;
                        v19 = nil;
                        v22 = nil;
                        v21 = nil;
                    end;
                end);
            end;
        end;
    end));
    v11.Maid:AddTask(l_Object_0.InputChanged:Connect(function(v37) --[[ Line: 156 ]]
        -- upvalues: v13 (ref)
        if v37.UserInputType == Enum.UserInputType.MouseMovement or v37.UserInputType == Enum.UserInputType.Touch then
            v13 = v37;
        end;
    end));
    v11.Maid:AddTask(l_Object_0:GetPropertyChangedSignal("Parent"):Connect(function() --[[ Line: 162 ]]
        -- upvalues: l_Object_0 (copy), l_UserInputService_0 (ref), v14 (ref), v15 (ref)
        if l_Object_0.Parent ~= nil and l_Object_0.Parent.Name == "BackpackGui" then
            local l_l_UserInputService_0_MouseLocation_2 = l_UserInputService_0:GetMouseLocation();
            v14 = Vector3.new(l_l_UserInputService_0_MouseLocation_2.X, l_l_UserInputService_0_MouseLocation_2.Y, 0);
            l_Object_0.Position = UDim2.fromOffset(l_l_UserInputService_0_MouseLocation_2.X, l_l_UserInputService_0_MouseLocation_2.Y);
            v15 = l_Object_0.Position;
        end;
    end));
    v11.Maid:AddTask(l_UserInputService_0.InputChanged:Connect(function(v39) --[[ Line: 172 ]]
        -- upvalues: l_Object_0 (copy), v11 (copy), v17 (ref), v14 (ref), v15 (ref), v13 (ref), l_UserInputService_0 (ref), v16 (ref), v20 (ref), v18 (ref), v32 (copy)
        if l_Object_0.Parent == nil then
            v11:Disable();
            return;
        else
            if v17 then
                v17 = false;
                v14 = v39.Position;
                v15 = l_Object_0.Position;
                v11.Dragging = true;
            end;
            if v39 == v13 and v11.Dragging then
                local l_l_UserInputService_0_MouseLocation_3 = l_UserInputService_0:GetMouseLocation();
                if (v16 - l_l_UserInputService_0_MouseLocation_3).Magnitude > 0.2 then
                    v20 = true;
                end;
                if v20 then
                    local v41 = false;
                    if v18 == true then
                        if v11.DragStarted then
                            v11.DragStarted();
                        end;
                        v14 = v39.Position;
                        v15 = l_Object_0.Position;
                        v41 = true;
                    end;
                    local v42 = v32(v39);
                    v18 = false;
                    if v11.Dragged then
                        v11.Dragged(v42);
                    end;
                end;
            end;
            return;
        end;
    end));
end;
v8.Disable = function(v43) --[[ Line: 221 ]] --[[ Name: Disable ]]
    v43.Maid:Clean();
    if v43.Dragging then
        v43.Dragging = false;
        if v43.DragEnded then
            v43.DragEnded();
        end;
    end;
end;
v8.Destroy = function(v44) --[[ Line: 234 ]] --[[ Name: Destroy ]]
    v44:Disable();
    setmetatable(v44, nil);
    v44 = nil;
end;
return v8;