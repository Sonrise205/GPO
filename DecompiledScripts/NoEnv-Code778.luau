client = nil;
Pcall = nil;
Routine = nil;
service = nil;
gTable = nil;
return function(v0, v1) --[[ Line: 11 ]]
    if v1 then
        setfenv(1, v1);
    end;
    local l_Title_0 = v0.Title;
    local l_Message_0 = v0.Message;
    if not l_Title_0 or not l_Message_0 then
        return;
    else
        local l_gTable_0 = v0.gTable;
        local l_BaseClip_0 = script.Parent.Parent.BaseClip;
        local l_Frame_0 = l_BaseClip_0.Frame;
        l_Frame_0.Size = UDim2.new(1, 0, 0, l_BaseClip_0.AbsoluteSize.Y);
        l_Frame_0.Position = UDim2.new(0, 0, -1, 0);
        l_Frame_0.Parent = l_BaseClip_0;
        l_Frame_0.Visible = true;
        local l_TextButton_0 = l_Frame_0:WaitForChild("TextButton");
        local l_Top_0 = l_Frame_0:WaitForChild("Top");
        local l_Body_0 = l_Frame_0:WaitForChild("Body");
        local l_Title_1 = l_Top_0:WaitForChild("Title");
        local v11 = l_Body_0:WaitForChild("To Name Later");
        local l_Left_0 = l_Top_0:WaitForChild("Left");
        local l_Time_0 = v0.Time;
        l_Title_1.Text = l_Title_0;
        v11.Text = l_Message_0;
        local l_Y_0 = v11.TextBounds.Y;
        l_Y_0 = l_Y_0 < 30 and 30 or l_Y_0 + 15;
        local l_Offset_0 = l_Top_0.Size.Y.Offset;
        l_Frame_0.Size = UDim2.new(1, 0, 0, l_Y_0 + l_Offset_0);
        local function v22() --[[ Line: 45 ]] --[[ Name: Resize ]]
            -- upvalues: l_gTable_0 (copy), l_BaseClip_0 (copy), l_Frame_0 (copy), v11 (copy), l_Top_0 (copy)
            local v16 = nil;
            local _, l_result_0 = pcall(function() --[[ Line: 47 ]]
                -- upvalues: v16 (ref), l_gTable_0 (ref), l_BaseClip_0 (ref), l_Frame_0 (ref), v11 (ref), l_Top_0 (ref)
                v16 = l_gTable_0.BindEvent(l_BaseClip_0.Changed, function(v17) --[[ Line: 48 ]]
                    -- upvalues: l_Frame_0 (ref), l_BaseClip_0 (ref), v11 (ref), l_Top_0 (ref), v16 (ref)
                    if v17 == "AbsoluteSize" then
                        l_Frame_0.Size = UDim2.new(1, 0, 0, l_BaseClip_0.AbsoluteSize.Y);
                        local l_Y_1 = v11.TextBounds.Y;
                        l_Y_1 = l_Y_1 < 30 and 30 or l_Y_1 + 15;
                        local l_Offset_1 = l_Top_0.Size.Y.Offset;
                        l_Frame_0.Size = UDim2.new(1, 0, 0, l_Y_1 + l_Offset_1);
                        if l_Frame_0 ~= nil and l_Frame_0.Parent == l_BaseClip_0 then
                            l_Frame_0:TweenPosition(UDim2.new(0, 0, 0.5, -l_Frame_0.Size.Y.Offset / 2), "Out", "Quint", 0.5, true);
                            return;
                        else
                            if v16 then
                                v16:Disconnect();
                            end;
                            return;
                        end;
                    else
                        return;
                    end;
                end);
            end);
            if l_result_0 and v16 then
                v16:Disconnect();
                return;
            else
                return;
            end;
        end;
        l_gTable_0.CustomDestroy = function() --[[ Line: 76 ]]
            -- upvalues: l_gTable_0 (copy), l_Frame_0 (copy)
            l_gTable_0.CustomDestroy = nil;
            l_gTable_0.ClearEvents();
            pcall(function() --[[ Line: 80 ]]
                -- upvalues: l_Frame_0 (ref)
                l_Frame_0:TweenPosition(UDim2.new(0, 0, 1, 0), "Out", "Quint", 0.3, true, function(v23) --[[ Line: 81 ]]
                    -- upvalues: l_Frame_0 (ref)
                    if v23 == Enum.TweenStatus.Completed and l_Frame_0 then
                        l_Frame_0:Destroy();
                        return;
                    else
                        if v23 == Enum.TweenStatus.Canceled and l_Frame_0 then
                            l_Frame_0:Destroy();
                        end;
                        return;
                    end;
                end);
                wait(0.3);
            end);
            return l_gTable_0.Destroy();
        end;
        l_gTable_0:Ready();
        l_Frame_0:TweenPosition(UDim2.new(0, 0, 0.5, -l_Frame_0.Size.Y.Offset / 2), "Out", "Quint", 0.5, true, function(v24) --[[ Line: 95 ]]
            -- upvalues: v22 (copy)
            if v24 == Enum.TweenStatus.Completed then
                v22();
            end;
        end);
        l_gTable_0.BindEvent(l_TextButton_0.MouseButton1Click, function() --[[ Line: 101 ]]
            -- upvalues: l_Frame_0 (copy), l_gTable_0 (copy)
            pcall(function() --[[ Line: 102 ]]
                -- upvalues: l_Frame_0 (ref), l_gTable_0 (ref)
                l_Frame_0:TweenPosition(UDim2.new(0, 0, 1, 0), "Out", "Quint", 0.3, true, function(v25) --[[ Line: 103 ]]
                    -- upvalues: l_Frame_0 (ref), l_gTable_0 (ref)
                    if v25 == Enum.TweenStatus.Completed and l_Frame_0 then
                        l_Frame_0:Destroy();
                        l_gTable_0:Destroy();
                        return;
                    else
                        if v25 == Enum.TweenStatus.Canceled and l_Frame_0 then
                            l_Frame_0:Destroy();
                            l_gTable_0:Destroy();
                        end;
                        return;
                    end;
                end);
            end);
        end);
        local v26 = l_Time_0 or #v11.Text * 0.1 + 1;
        local v27, v28 = string.find(v26, "%p");
        if v27 and v28 then
            v26 = if tonumber((string.sub(v26, v27))) >= 0.5 then tonumber((string.sub(v26, 1, v27))) + 1 else tonumber((string.sub(v26, 1, v27)));
        end;
        l_Left_0.Text = ("%*.00"):format(v26);
        for v29 = v26, 1, -1 do
            if l_Left_0 then
                l_Left_0.Text = ("%*.00"):format(v29);
                wait(1);
            else
                break;
            end;
        end;
        l_Left_0.Text = "Closing..";
        wait(0.3);
        if l_Frame_0 then
            pcall(function() --[[ Line: 139 ]]
                -- upvalues: l_Frame_0 (copy), l_gTable_0 (copy)
                l_Frame_0:TweenPosition(UDim2.new(0, 0, 1, 0), "Out", "Quint", 0.3, true, function(v30) --[[ Line: 140 ]]
                    -- upvalues: l_Frame_0 (ref), l_gTable_0 (ref)
                    if v30 == Enum.TweenStatus.Completed and l_Frame_0 then
                        l_Frame_0:Destroy();
                        l_gTable_0:Destroy();
                        return;
                    else
                        if v30 == Enum.TweenStatus.Canceled and l_Frame_0 then
                            l_Frame_0:Destroy();
                            l_gTable_0:Destroy();
                        end;
                        return;
                    end;
                end);
            end);
        end;
        return;
    end;
end;