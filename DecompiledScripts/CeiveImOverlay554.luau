local l_GuiService_0 = game:GetService("GuiService");
local v1 = Font.new("rbxasset://fonts/families/PressStart2P.json");
local v2 = {};
v2.__index = v2;
v2.new = function(v3, v4, v5) --[[ Line: 22 ]] --[[ Name: new ]]
    -- upvalues: l_GuiService_0 (copy), v2 (copy)
    v3 = v3 or 5;
    v4 = v4 or 11;
    v5 = v5 == nil or v5;
    local v6 = UDim2.fromOffset(25, 5 + l_GuiService_0:GetGuiInset().Y);
    local v7 = UDim2.new(1, -25, 1, -5);
    local v8 = UDim2.fromOffset(0, 0);
    local v9 = UDim2.fromScale(1, 1);
    local v10 = setmetatable({}, v2);
    v10.DefaultY = v3;
    v10.TextSize = v4;
    v10.BackFrame = Instance.new("Frame");
    v10.BackFrame.Position = v5 and v6 or v8;
    v10.BackFrame.Size = v5 and v7 or v9;
    v10.BackFrame.Name = "BackFrame";
    v10.BackFrame.Transparency = 1;
    v10.ListLayout = Instance.new("UIListLayout");
    v10.ListLayout.Padding = UDim.new(0, 2);
    v10.ListLayout.SortOrder = Enum.SortOrder.LayoutOrder;
    v10.ListLayout.Parent = v10.BackFrame;
    v10.m_Indent = 0;
    v10.DidUpdate = false;
    v10.m_State = "";
    v10.m_PreviousState = "";
    v10.m_RenderGroup = {};
    v10.m_ItemPool = {};
    return v10;
end;
v2.Begin = function(v11, v12, v13, v14) --[[ Line: 64 ]] --[[ Name: Begin ]]
    if not v12 or type(v12) ~= "string" then
        warn("Expected text to ImOverlay::Begin", debug.traceback());
        return;
    elseif v13 and typeof(v13) ~= "Color3" then
        warn("BackgroundColor should be a Color3", debug.traceback());
        return;
    elseif v14 and typeof(v14) ~= "Color3" then
        warn("TextColor should be a Color3", debug.traceback());
        return;
    else
        v11:Text(v12, v13, v14);
        v11.m_Indent = v11.m_Indent + 1;
        return;
    end;
end;
v2.End = function(v15) --[[ Line: 84 ]] --[[ Name: End ]]
    if v15.m_Indent - 1 < 0 then
        error("Too many callbacks to ImOverlay::End");
        return;
    else
        v15.m_Indent = v15.m_Indent - 1;
        return;
    end;
end;
v2.Text = function(v16, v17, v18, v19) --[[ Line: 93 ]] --[[ Name: Text ]]
    if not v17 or type(v17) ~= "string" then
        warn("Expected text to ImOverlay::Text", debug.traceback());
        return;
    elseif v18 and typeof(v18) ~= "Color3" then
        warn("BackgroundColor should be a Color3", debug.traceback());
        return;
    elseif v19 and typeof(v19) ~= "Color3" then
        warn("TextColor should be a Color3", debug.traceback());
        return;
    else
        v18 = v18 or Color3.new();
        v19 = v19 or Color3.new(1, 1, 1);
        table.insert(v16.m_RenderGroup, {
            Text = v17, 
            TextColor = v19, 
            BackgroundColor = v18, 
            Indent = v16.m_Indent
        });
        v16.m_State = v16.m_State .. ("%*|%*|%*|%*"):format(v17, v19, v18, v16.m_Indent);
        return;
    end;
end;
v2.m_Pool = function(v20) --[[ Line: 122 ]] --[[ Name: m_Pool ]]
    for _, v22 in v20.BackFrame:GetChildren() do
        if not v22:IsA("UIListLayout") and v22.Visible then
            v22.Visible = false;
            table.insert(v20.m_ItemPool, v22);
        end;
    end;
end;
v2.m_Cleanup = function(v23) --[[ Line: 137 ]] --[[ Name: m_Cleanup ]]
    v23.m_State = "";
    v23.m_Indent = 0;
    v23.m_RenderGroup = {};
end;
v2.m_CreateLabel = function(v24, v25, v26, v27, v28) --[[ Line: 145 ]] --[[ Name: m_CreateLabel ]]
    -- upvalues: v1 (copy)
    local l_Frame_0 = Instance.new("Frame");
    l_Frame_0.Name = "Background";
    l_Frame_0.AutomaticSize = Enum.AutomaticSize.XY;
    l_Frame_0.BackgroundColor3 = v27;
    l_Frame_0.BackgroundTransparency = 0.4;
    l_Frame_0.BorderSizePixel = 0;
    local l_TextLabel_0 = Instance.new("TextLabel");
    l_TextLabel_0.Name = "TaskText";
    l_TextLabel_0.FontFace = v1;
    l_TextLabel_0.Text = v25;
    l_TextLabel_0.TextColor3 = v26;
    l_TextLabel_0.TextSize = v24.TextSize;
    l_TextLabel_0.TextXAlignment = Enum.TextXAlignment.Left;
    l_TextLabel_0.AutomaticSize = Enum.AutomaticSize.XY;
    l_TextLabel_0.BackgroundColor3 = Color3.fromRGB(255, 255, 255);
    l_TextLabel_0.BackgroundTransparency = 1;
    l_TextLabel_0.Position = UDim2.fromOffset(v28 * 50, 0);
    l_TextLabel_0.Size = UDim2.fromOffset(0, v24.DefaultY);
    l_TextLabel_0.Parent = l_Frame_0;
    local l_UIPadding_0 = Instance.new("UIPadding");
    l_UIPadding_0.Name = "UIPadding";
    l_UIPadding_0.PaddingBottom = UDim.new(0, 2);
    l_UIPadding_0.Parent = l_TextLabel_0;
    local l_UIPadding_1 = Instance.new("UIPadding");
    l_UIPadding_1.Name = "UIPadding";
    l_UIPadding_1.PaddingRight = UDim.new(0, 5);
    l_UIPadding_1.PaddingLeft = UDim.new(0, 5);
    l_UIPadding_1.Parent = l_Frame_0;
    return l_Frame_0;
end;
v2.Render = function(v33) --[[ Line: 182 ]] --[[ Name: Render ]]
    if v33.m_State == "" then
        v33:m_Pool();
        v33:m_Cleanup();
        v33.DidUpdate = false;
        return;
    else
        v33.m_State = v33.m_State .. ("%*|%*"):format(v33.DefaultY, v33.TextSize);
        if v33.m_State == v33.m_PreviousState then
            v33:m_Cleanup();
            v33.DidUpdate = false;
            return;
        else
            v33:m_Pool();
            v33.m_PreviousState = v33.m_State;
            v33.DidUpdate = true;
            for v34, v35 in v33.m_RenderGroup do
                if #v33.m_ItemPool == 0 then
                    local v36 = v33:m_CreateLabel(v35.Text, v35.TextColor, v35.BackgroundColor, v35.Indent);
                    v36.LayoutOrder = v34;
                    v36.Parent = v33.BackFrame;
                else
                    local v37 = table.remove(v33.m_ItemPool, #v33.m_ItemPool);
                    local l_TaskText_0 = v37.TaskText;
                    v37.LayoutOrder = v34;
                    v37.BackgroundColor3 = v35.BackgroundColor;
                    l_TaskText_0.Text = v35.Text;
                    l_TaskText_0.TextColor3 = v35.TextColor;
                    l_TaskText_0.Position = UDim2.fromOffset(50 * v35.Indent, 0);
                    v37.Visible = true;
                    v37.Parent = v33.BackFrame;
                end;
            end;
            v33:m_Cleanup();
            return;
        end;
    end;
end;
v2.Destroy = function(v39) --[[ Line: 239 ]] --[[ Name: Destroy ]]
    v39.BackFrame:Destroy();
    setmetatable(v39, nil);
end;
return v2;