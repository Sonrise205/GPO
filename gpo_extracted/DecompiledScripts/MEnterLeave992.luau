repeat
    task.wait();
until game.Players.LocalPlayer;
local l_LocalPlayer_0 = game.Players.LocalPlayer;
local v1 = {};
local v9 = {
    MouseEnterLeaveEvent = function(v2) --[[ Line: 6 ]] --[[ Name: MouseEnterLeaveEvent ]]
        -- upvalues: v1 (copy), l_LocalPlayer_0 (copy)
        if v1[v2] then
            return v1[v2].EnterEvent, v1[v2].LeaveEvent;
        else
            local v3 = {
                UIObj = v2
            };
            local l_BindableEvent_0 = Instance.new("BindableEvent");
            local l_BindableEvent_1 = Instance.new("BindableEvent");
            v3.EnteredEvent = l_BindableEvent_0;
            v3.MouseIn = false;
            v3.LeaveEvent = l_BindableEvent_1;
            v3.ParentScreenUI = v2:FindFirstAncestorWhichIsA("ScreenGui");
            v1[v2] = v3;
            v2.Destroying:Connect(function() --[[ Line: 22 ]]
                -- upvalues: l_BindableEvent_0 (copy), l_BindableEvent_1 (copy), v1 (ref), v2 (copy)
                l_BindableEvent_0:Destroy();
                l_BindableEvent_1:Destroy();
                v1[v2] = nil;
            end);
            task.spawn(function() --[[ Line: 28 ]]
                -- upvalues: l_LocalPlayer_0 (ref), v3 (copy)
                game["Run Service"].Heartbeat:Wait();
                local l_l_LocalPlayer_0_Mouse_0 = l_LocalPlayer_0:GetMouse();
                local l_X_0 = l_l_LocalPlayer_0_Mouse_0.X;
                local l_Y_0 = l_l_LocalPlayer_0_Mouse_0.Y;
                if v3.UIObj.AbsolutePosition.X < l_X_0 and v3.UIObj.AbsolutePosition.Y < l_Y_0 and l_X_0 < v3.UIObj.AbsolutePosition.X + v3.UIObj.AbsoluteSize.X and l_Y_0 < v3.UIObj.AbsolutePosition.Y + v3.UIObj.AbsoluteSize.Y and v3.MouseIn ~= true then
                    v3.MouseIn = true;
                    if v3.EnteredEvent then
                        v3.EnteredEvent:Fire();
                    end;
                end;
            end);
            return l_BindableEvent_0.Event, l_BindableEvent_1.Event;
        end;
    end
};
local l_l_LocalPlayer_0_Mouse_1 = l_LocalPlayer_0:GetMouse();
local function _(v11) --[[ Line: 50 ]] --[[ Name: IsInFrame ]]
    -- upvalues: l_l_LocalPlayer_0_Mouse_1 (copy)
    local l_X_1 = l_l_LocalPlayer_0_Mouse_1.X;
    local l_Y_1 = l_l_LocalPlayer_0_Mouse_1.Y;
    if v11.AbsolutePosition.X < l_X_1 and v11.AbsolutePosition.Y < l_Y_1 and l_X_1 < v11.AbsolutePosition.X + v11.AbsoluteSize.X and l_Y_1 < v11.AbsolutePosition.Y + v11.AbsoluteSize.Y then
        return true;
    else
        return false;
    end;
end;
game["Run Service"].Heartbeat:Connect(function() --[[ Line: 61 ]]
    -- upvalues: v1 (copy), l_l_LocalPlayer_0_Mouse_1 (copy)
    for _, v16 in v1 do
        local l_UIObj_0 = v16.UIObj;
        local l_X_2 = l_l_LocalPlayer_0_Mouse_1.X;
        local l_Y_2 = l_l_LocalPlayer_0_Mouse_1.Y;
        if l_UIObj_0.AbsolutePosition.X < l_X_2 and l_UIObj_0.AbsolutePosition.Y < l_Y_2 and l_X_2 < l_UIObj_0.AbsolutePosition.X + l_UIObj_0.AbsoluteSize.X and l_Y_2 < l_UIObj_0.AbsolutePosition.Y + l_UIObj_0.AbsoluteSize.Y then
            if not v16.MouseIn and (not v16.UIObj.Parent or not v16.UIObj.Parent:IsA("Frame") or v16.UIObj.Parent.Visible ~= false) then
                v16.MouseIn = true;
                v16.EnteredEvent:Fire();
            end;
        elseif v16.MouseIn then
            v16.MouseIn = false;
            v16.LeaveEvent:Fire();
        end;
    end;
end);
return v9;