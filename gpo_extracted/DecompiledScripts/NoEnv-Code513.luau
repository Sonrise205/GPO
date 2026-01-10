client = nil;
Pcall = nil;
Routine = nil;
service = nil;
gTable = nil;
return function(v0, v1) --[[ Line: 11 ]]
    if v1 then
        setfenv(1, v1);
    end;
    if not v0.Message then
        return;
    else
        local l_gTable_0 = v0.gTable;
        local l_BaseClip_0 = script.Parent.Parent.BaseClip;
        local l_Frame_0 = l_BaseClip_0.Frame;
        local l_TextButton_0 = l_Frame_0:WaitForChild("TextButton");
        local l_Top_0 = l_Frame_0:WaitForChild("Top");
        local l_Body_0 = l_Frame_0:WaitForChild("Body");
        local l_Title_0 = l_Top_0:WaitForChild("Title");
        local v9 = l_Body_0:WaitForChild("To Name Later");
        l_gTable_0.BindEvent(l_TextButton_0.MouseButton1Click, function() --[[ Line: 28 ]]
            -- upvalues: l_Frame_0 (copy), l_gTable_0 (copy)
            l_Frame_0:TweenPosition(UDim2.new(0, 0, 0, -l_Frame_0.AbsoluteSize.Y), "Out", "Quint", 0.3, true, function(v10) --[[ Line: 29 ]]
                -- upvalues: l_Frame_0 (ref), l_gTable_0 (ref)
                if v10 == Enum.TweenStatus.Completed then
                    l_Frame_0:Destroy();
                    l_gTable_0:Destroy();
                end;
            end);
        end);
        l_Title_0.Text = v0.Title or " ";
        v9.Text = v0.Message;
        l_Frame_0.Parent = l_BaseClip_0;
        l_Frame_0.Visible = true;
        l_Frame_0.Position = UDim2.new(0, 0, -1, 0);
        l_gTable_0.CustomDestroy = function() --[[ Line: 43 ]]
            -- upvalues: l_gTable_0 (copy), l_Frame_0 (copy)
            l_gTable_0.CustomDestroy = nil;
            l_gTable_0.ClearEvents();
            pcall(function() --[[ Line: 47 ]]
                -- upvalues: l_Frame_0 (ref), l_gTable_0 (ref)
                l_Frame_0:TweenPosition(UDim2.new(0, 0, 0, -l_Frame_0.AbsoluteSize.Y), "Out", "Quint", 0.3, true, function(v11) --[[ Line: 48 ]]
                    -- upvalues: l_Frame_0 (ref), l_gTable_0 (ref)
                    if v11 == Enum.TweenStatus.Completed then
                        l_Frame_0:Destroy();
                        l_gTable_0:Destroy();
                    end;
                end);
                wait(0.3);
            end);
            l_gTable_0:Destroy();
        end;
        l_gTable_0:Ready();
        l_Frame_0:TweenPosition(UDim2.new(0, 0, 0, 0), "Out", "Quint", 0.3, true);
        local v12 = #v9.Text * 0.1 + 1;
        local v13 = tonumber(v0.Wait or v12) or v12;
        if v12 <= 1 then
            v12 = 2.5;
        elseif v12 > 10 then
            v12 = 10;
        end;
        wait(v13);
        pcall(function() --[[ Line: 72 ]]
            -- upvalues: l_Frame_0 (copy), l_gTable_0 (copy)
            if l_Frame_0 then
                l_Frame_0:TweenPosition(UDim2.new(0, 0, 0, -l_Frame_0.AbsoluteSize.Y), "Out", "Quint", 0.3, true, function(v14) --[[ Line: 74 ]]
                    -- upvalues: l_Frame_0 (ref), l_gTable_0 (ref)
                    if v14 == Enum.TweenStatus.Completed then
                        l_Frame_0:Destroy();
                        l_gTable_0:Destroy();
                    end;
                end);
            end;
        end);
        return;
    end;
end;