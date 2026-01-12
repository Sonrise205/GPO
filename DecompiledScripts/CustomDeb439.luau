local _ = {};
local l_BindableEvent_0 = Instance.new("BindableEvent");
l_BindableEvent_0.Name = "DestroyEvent";
l_BindableEvent_0.Event:Connect(function(v2, v3) --[[ Line: 6 ]]
    if not v2 then
        warn("Non debris was passed!");
        return;
    elseif not v3 then
        if typeof(v2) == "Instance" then
            v2:Destroy();
            return;
        else
            for _, v5 in ipairs(v2) do
                v5:Destroy();
            end;
            return;
        end;
    else
        if v3 == nil or v3 ~= v3 then
            v3 = 0;
        end;
        if typeof(v2) == "table" then
            for _, v7 in ipairs(v2) do
                task.delay(v3, v7.Destroy, v7);
            end;
            return;
        elseif typeof(v2) == "Instance" then
            task.delay(v3, v2.Destroy, v2);
            return;
        else
            warn(tostring(v2) .. " is not a instance!");
            return;
        end;
    end;
end);
l_BindableEvent_0.Parent = game:GetService("ReplicatedStorage");
local function _(v8, v9) --[[ Line: 41 ]] --[[ Name: destroy ]]
    -- upvalues: l_BindableEvent_0 (copy)
    l_BindableEvent_0:Fire(v8, v9);
end;
return function(v11, v12) --[[ Line: 45 ]] --[[ Name: AddItem ]]
    -- upvalues: l_BindableEvent_0 (copy)
    local v13 = 100;
    if v12 == nil then
        if typeof(v11) == "Instance" then
            pcall(v11.Destroy, v11);
            return;
        else
            for v14 = 1, #v11 do
                if v11[v14] then
                    v11[v14]:Destroy();
                end;
                v13 = v13 - 1;
                if v13 <= 0 then
                    v13 = 100;
                    game:GetService("RunService").Heartbeat:Wait();
                end;
            end;
            return;
        end;
    elseif typeof(v11) == "table" then
        for v15 = 1, #v11 do
            if typeof(v11[v15]) == "Instance" then
                local v16 = v11[v15];
                l_BindableEvent_0:Fire(v16, v12);
            end;
        end;
        return;
    else
        if v11 and v12 and typeof(v11) == "Instance" then
            l_BindableEvent_0:Fire(v11, v12);
        end;
        return;
    end;
end;