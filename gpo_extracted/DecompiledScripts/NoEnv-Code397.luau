client = nil;
Pcall = nil;
Routine = nil;
service = nil;
gTable = nil;
return function(v0, v1) --[[ Line: 11 ]]
    if v1 then
        setfenv(1, v1);
    end;
    if not v0.Question then
        return;
    else
        local l_gTable_0 = v0.gTable;
        local l_BaseClip_0 = script.Parent.Parent.BaseClip;
        local v4 = v0.Duration or v0.Timeout;
        local v5 = nil;
        local l_Frame_0 = l_BaseClip_0.Frame;
        l_Frame_0.Parent = l_BaseClip_0;
        l_Frame_0.Position = UDim2.new(0.5, -210, 0, -l_Frame_0.Size.Y.Offset);
        l_Frame_0.Visible = true;
        local l_Body_0 = l_Frame_0:WaitForChild("Body");
        local l_Options_0 = l_Body_0:WaitForChild("Options");
        local l_Confirm_0 = l_Options_0:WaitForChild("Confirm");
        local l_Cancel_0 = l_Options_0:WaitForChild("Cancel");
        local l_Command_0 = l_Body_0:WaitForChild("Command");
        local l_Title_0 = l_Frame_0.Top.Title;
        l_Command_0.Text = v0.Subtitle or " ";
        l_Body_0.Ques.Text = v0.Question or "Unknown";
        l_Title_0.Text = v0.Title or "Yes/No Prompt";
        l_Body_0.Options.Cancel.Text = v0.No or "No";
        l_Body_0.Options.Confirm.Text = v0.Yes or "Yes";
        l_gTable_0:Ready();
        l_gTable_0.CustomDestroy = function() --[[ Line: 43 ]]
            -- upvalues: l_gTable_0 (copy), v5 (ref), v0 (copy), l_Frame_0 (copy)
            l_gTable_0.CustomDestroy = nil;
            l_gTable_0.ClearEvents();
            if v5 == nil then
                v5 = v0.No or "No";
            end;
            pcall(function() --[[ Line: 48 ]]
                -- upvalues: l_Frame_0 (ref)
                l_Frame_0:TweenPosition(UDim2.new(0.5, -210, 1, 0), "Out", "Quint", 0.3, true, function(v13) --[[ Line: 49 ]]
                    -- upvalues: l_Frame_0 (ref)
                    if v13 == Enum.TweenStatus.Completed then
                        l_Frame_0:Destroy();
                    end;
                end);
                wait(0.3);
            end);
            l_gTable_0:Destroy();
        end;
        l_Frame_0:TweenPosition(UDim2.new(0.5, -210, 0.5, -70), "Out", "Quint", 0.3, true);
        local v14 = nil;
        v14 = l_gTable_0.BindEvent(l_Confirm_0.MouseButton1Click, function() --[[ Line: 62 ]]
            -- upvalues: v14 (ref), l_Frame_0 (copy), v5 (ref), v0 (copy), l_gTable_0 (copy)
            v14:Disconnect();
            l_Frame_0:TweenPosition(UDim2.new(0.5, -210, 1, 0), "Out", "Quint", 0.3, true, function(v15) --[[ Line: 64 ]]
                -- upvalues: l_Frame_0 (ref)
                if v15 == Enum.TweenStatus.Completed then
                    l_Frame_0:Destroy();
                end;
            end);
            v5 = v0.Yes or "Yes";
            wait(0.3);
            l_gTable_0:Destroy();
        end);
        local v16 = nil;
        v16 = l_gTable_0.BindEvent(l_Cancel_0.MouseButton1Click, function() --[[ Line: 75 ]]
            -- upvalues: v16 (ref), l_Frame_0 (copy), v5 (ref), v0 (copy), l_gTable_0 (copy)
            v16:Disconnect();
            l_Frame_0:TweenPosition(UDim2.new(0.5, -210, 1, 0), "Out", "Quint", 0.3, true, function(v17) --[[ Line: 77 ]]
                -- upvalues: l_Frame_0 (ref)
                if v17 == Enum.TweenStatus.Completed then
                    l_Frame_0:Destroy();
                end;
            end);
            v5 = v0.No or "No";
            wait(0.3);
            l_gTable_0:Destroy();
        end);
        local _ = os.clock();
        repeat
            wait();
        until v5 ~= nil or v4 and v4 < os.clock() - v4;
        if v5 == nil then
            v5 = false;
        end;
        return v5;
    end;
end;