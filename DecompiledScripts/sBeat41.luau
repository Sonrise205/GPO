local _ = {};
local l_BindableEvent_0 = Instance.new("BindableEvent");
local _ = game:GetService("RunService").Heartbeat;
local v3 = 0;
game:GetService("RunService").Heartbeat:Connect(function(v4) --[[ Line: 16 ]]
    -- upvalues: v3 (ref), l_BindableEvent_0 (copy)
    v3 = v3 + v4;
    if v3 >= 0.016666666666666666 then
        local v5 = math.floor(v3 / 0.016666666666666666);
        for _ = 1, v5 do
            l_BindableEvent_0:Fire();
        end;
        v3 = v3 - v5 * 0.016666666666666666;
    end;
end);
return function(v7) --[[ Line: 27 ]]
    -- upvalues: l_BindableEvent_0 (copy)
    if v7 == 0 or v7 == nil then
        l_BindableEvent_0.Event:Wait();
        return;
    else
        for _ = 1, v7 do
            l_BindableEvent_0.Event:Wait();
        end;
        return;
    end;
end;