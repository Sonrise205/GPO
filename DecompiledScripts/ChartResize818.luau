local l_RunService_0 = game:GetService("RunService");
local l_UserInputService_0 = game:GetService("UserInputService");
local l_GuiService_0 = game:GetService("GuiService");
local l_Modules_0 = script.Parent.Parent.Modules;
local v4 = require(l_Modules_0.Packages);
local v5 = require(v4.Directory.Roact);
local v6 = v5.Component:extend("ChartResize");
v6.init = function(v7) --[[ Line: 13 ]] --[[ Name: init ]]
    -- upvalues: v5 (copy), v4 (copy), l_UserInputService_0 (copy), l_RunService_0 (copy), l_GuiService_0 (copy)
    local v8, v9 = v5.createBinding(UDim2.fromOffset(650, 290));
    v7.Size = v8;
    v7.SetSize = v9;
    if not v4.IsPlugin then
        v7.Connections = {};
        v8 = l_UserInputService_0.MouseIcon;
        v9 = nil;
        local v10 = false;
        local v11 = false;
        local v12 = {
            SizeWE = "rbxassetid://18699453492", 
            SizeNS = "rbxassetid://18700045701", 
            SizeAll = "rbxassetid://18700129047"
        };
        do
            local l_v8_0, l_v9_0, l_v10_0, l_v11_0 = v8, v9, v10, v11;
            v7.AddIcon = function(v17) --[[ Line: 29 ]] --[[ Name: AddIcon ]]
                -- upvalues: l_v11_0 (ref), l_v10_0 (ref), l_v8_0 (ref), l_UserInputService_0 (ref), v12 (copy)
                if l_v11_0 or l_v10_0 == v17 then
                    return;
                else
                    if l_v10_0 == false then
                        l_v8_0 = l_UserInputService_0.MouseIcon;
                    end;
                    l_v10_0 = v17;
                    l_UserInputService_0.MouseIcon = v12[v17];
                    return;
                end;
            end;
            v7.RemoveIcon = function() --[[ Line: 40 ]] --[[ Name: RemoveIcon ]]
                -- upvalues: l_v11_0 (ref), l_v10_0 (ref), l_UserInputService_0 (ref), l_v8_0 (ref)
                if l_v11_0 or not l_v10_0 then
                    return;
                else
                    l_v10_0 = false;
                    l_UserInputService_0.MouseIcon = l_v8_0;
                    return;
                end;
            end;
            v7.SetSizeTarget = function(v18) --[[ Line: 50 ]] --[[ Name: SetSizeTarget ]]
                -- upvalues: v7 (copy), l_RunService_0 (ref), l_GuiService_0 (ref), l_UserInputService_0 (ref), l_v10_0 (ref)
                if not v18 then
                    return;
                else
                    for _, v20 in v7.Connections do
                        v20:Disconnect();
                    end;
                    table.clear(v7.Connections);
                    table.insert(v7.Connections, l_RunService_0.RenderStepped:Connect(function() --[[ Line: 60 ]]
                        -- upvalues: l_GuiService_0 (ref), l_UserInputService_0 (ref), v18 (copy), v7 (ref)
                        local l_l_GuiService_0_GuiInset_0 = l_GuiService_0:GetGuiInset();
                        local l_l_UserInputService_0_MouseLocation_0 = l_UserInputService_0:GetMouseLocation();
                        local v23 = v18.AbsolutePosition + l_l_GuiService_0_GuiInset_0;
                        local l_AbsoluteSize_0 = v18.AbsoluteSize;
                        local v25 = v23.Y + l_AbsoluteSize_0.Y + 8;
                        local v26 = v23.X + l_AbsoluteSize_0.X;
                        local v27 = true;
                        if l_l_UserInputService_0_MouseLocation_0.X >= v23.X - 8 then
                            v27 = true;
                            if v26 >= l_l_UserInputService_0_MouseLocation_0.X then
                                v27 = true;
                                if l_l_UserInputService_0_MouseLocation_0.Y >= v23.Y then
                                    v27 = v25 < l_l_UserInputService_0_MouseLocation_0.Y;
                                end;
                            end;
                        end;
                        if v27 then
                            v7.RemoveIcon();
                            return;
                        else
                            local v28 = false;
                            if l_l_UserInputService_0_MouseLocation_0.Y > v25 - 8 then
                                v28 = l_l_UserInputService_0_MouseLocation_0.Y < v25 + 8;
                            end;
                            local v29 = false;
                            if l_l_UserInputService_0_MouseLocation_0.X < v23.X + 8 then
                                v29 = l_l_UserInputService_0_MouseLocation_0.X > v23.X - 8;
                            end;
                            if v28 or v29 then
                                local v30 = if v28 then v29 and "SizeAll" or "SizeNS" else "SizeWE";
                                v7.AddIcon(v30);
                                return;
                            else
                                v7.RemoveIcon();
                                return;
                            end;
                        end;
                    end));
                    table.insert(v7.Connections, l_UserInputService_0.InputBegan:Connect(function(v31) --[[ Line: 87 ]]
                        -- upvalues: l_v10_0 (ref), v7 (ref)
                        if v31.UserInputType == Enum.UserInputType.MouseButton1 and l_v10_0 then
                            v7.StartResizing();
                        end;
                    end));
                    table.insert(v7.Connections, l_UserInputService_0.InputEnded:Connect(function(v32) --[[ Line: 92 ]]
                        -- upvalues: v7 (ref)
                        if v32.UserInputType == Enum.UserInputType.MouseButton1 then
                            v7.StopResizing();
                        end;
                    end));
                    return;
                end;
            end;
            v7.StartResizing = function() --[[ Line: 99 ]] --[[ Name: StartResizing ]]
                -- upvalues: l_v11_0 (ref), v7 (copy), l_UserInputService_0 (ref), l_v9_0 (ref), l_RunService_0 (ref), l_v10_0 (ref)
                if l_v11_0 then
                    return;
                else
                    l_v11_0 = true;
                    local v33 = v7.Size:getValue();
                    local l_l_UserInputService_0_MouseLocation_1 = l_UserInputService_0:GetMouseLocation();
                    local v35 = Vector2.new(l_l_UserInputService_0_MouseLocation_1.X, l_l_UserInputService_0_MouseLocation_1.Y);
                    l_v9_0 = l_RunService_0.RenderStepped:Connect(function() --[[ Line: 110 ]]
                        -- upvalues: l_UserInputService_0 (ref), v35 (copy), l_v10_0 (ref), v33 (copy), v7 (ref)
                        local v36 = l_UserInputService_0:GetMouseLocation() - v35;
                        if l_v10_0 == "SizeNS" then
                            v36 = v36 * Vector2.new(0, 1);
                        elseif l_v10_0 == "SizeWE" then
                            v36 = v36 * Vector2.new(1, 0);
                        end;
                        local v37 = UDim2.fromOffset(math.max(v33.X.Offset - v36.X, 300), (math.max(v33.Y.Offset + v36.Y, 100)));
                        v7.SetSize(v37);
                    end);
                    return;
                end;
            end;
            v7.StopResizing = function() --[[ Line: 126 ]] --[[ Name: StopResizing ]]
                -- upvalues: l_v11_0 (ref), v7 (copy), l_v9_0 (ref)
                if not l_v11_0 then
                    return;
                else
                    l_v11_0 = false;
                    v7.RemoveIcon();
                    l_v9_0:Disconnect();
                    l_v9_0 = nil;
                    return;
                end;
            end;
        end;
    end;
end;
v6.render = function(v38) --[[ Line: 140 ]] --[[ Name: render ]]
    -- upvalues: v5 (copy)
    return v5.oneChild(v38.props[v5.Children])({
        UISize = v38.Size, 
        StartResizing = v38.StartResizing, 
        StopResizing = v38.StopResizing, 
        AddIcon = v38.AddIcon, 
        RemoveIcon = v38.RemoveIcon, 
        SetSizeTarget = v38.SetSizeTarget
    });
end;
v6.willUnmount = function(v39) --[[ Line: 152 ]] --[[ Name: willUnmount ]]
    if v39.StopResizing then
        v39.StopResizing();
    end;
    if v39.Connections then
        for _, v41 in v39.Connections do
            v41:Disconnect();
        end;
        table.clear(v39.Connections);
    end;
end;
return function(v42) --[[ Line: 166 ]] --[[ Name: ChartResizeInit ]]
    -- upvalues: v5 (copy), v6 (copy)
    return v5.createElement(v6, {}, {
        PacketChart = v42
    });
end;