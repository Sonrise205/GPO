client = nil;
Pcall = nil;
Routine = nil;
service = nil;
gTable = nil;
return function(_, v1) --[[ Line: 7 ]]
    if v1 then
        setfenv(1, v1);
    end;
    local l_Parent_0 = script.Parent.Parent;
    local l_ScrollingFrame_0 = l_Parent_0.ScrollingFrame;
    local l_UIListLayout_0 = l_ScrollingFrame_0.UIListLayout;
    local v5 = 0;
    local function v6() --[[ Line: 17 ]] --[[ Name: UpdateCanvasSize ]]
        -- upvalues: l_ScrollingFrame_0 (copy), l_UIListLayout_0 (copy)
        l_ScrollingFrame_0.CanvasSize = UDim2.new(0, l_UIListLayout_0.AbsoluteContentSize.X, 0, l_UIListLayout_0.AbsoluteContentSize.Y);
    end;
    l_ScrollingFrame_0.ChildAdded:Connect(function(v7) --[[ Line: 21 ]]
        -- upvalues: v5 (ref), v6 (copy), l_ScrollingFrame_0 (copy)
        v5 = v5 + 1;
        local l_Y_0 = service.TextService:GetTextSize(v7.Frame.Main.Text, v7.Frame.Main.TextSize, v7.Frame.Main.Font, Vector2.new(229, 2147483647)).Y;
        v7.Size = v7.Size + UDim2.new(0, 0, 0, l_Y_0 + 5);
        v7.Frame.Main.Size = v7.Frame.Main.Size + UDim2.new(0, 0, 0, l_Y_0 + 5);
        v6();
        if l_ScrollingFrame_0.CanvasPosition.Y + v7.AbsoluteSize.Y + 5 == l_ScrollingFrame_0.AbsoluteCanvasSize.Y - l_ScrollingFrame_0.AbsoluteWindowSize.Y then
            l_ScrollingFrame_0.CanvasPosition = l_ScrollingFrame_0.CanvasPosition + v7.AbsoluteSize + Vector2.new(0, 5);
            return;
        else
            if v7.AbsoluteSize.Y > l_ScrollingFrame_0.AbsoluteCanvasSize.Y - l_ScrollingFrame_0.AbsoluteWindowSize.Y then
                l_ScrollingFrame_0.CanvasPosition = l_ScrollingFrame_0.CanvasPosition + v7.AbsoluteSize + Vector2.new(0, 5);
            end;
            return;
        end;
    end);
    l_ScrollingFrame_0.ChildRemoved:Connect(function(_) --[[ Line: 47 ]]
        -- upvalues: v5 (ref), v6 (copy), l_Parent_0 (copy)
        v5 = v5 - 1;
        v6();
        if v5 == 0 then
            l_Parent_0:Destroy();
        end;
    end);
    gTable:Ready();
end;