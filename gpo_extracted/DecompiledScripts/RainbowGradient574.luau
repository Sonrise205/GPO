local v0 = {
    Color = nil, 
    Thread = nil
};
v0.GetColor = function(_) --[[ Line: 6 ]] --[[ Name: GetColor ]]
    -- upvalues: v0 (copy)
    return v0.Color;
end;
v0.Start = function(_) --[[ Line: 10 ]] --[[ Name: Start ]]
    -- upvalues: v0 (copy)
    if v0.Thread ~= nil then
        return;
    else
        v0.Thread = task.spawn(function() --[[ Line: 12 ]]
            -- upvalues: v0 (ref)
            while true do
                local _ = task.wait(0.02);
                local v4 = os.clock() % 1 / 1;
                local v5 = {};
                for v6 = 1, 8 do
                    local v7 = v4 - (v6 - 1) / 7;
                    local v8 = Color3.fromHSV(v7, 1, 1);
                    if v7 < 0 then
                        v8 = Color3.fromHSV(v7 + 1, 1, 1);
                    end;
                    table.insert(v5, ColorSequenceKeypoint.new((v6 - 1) / 7, v8));
                end;
                v0.Color = ColorSequence.new(v5);
            end;
        end);
        return;
    end;
end;
v0.Stop = function(_) --[[ Line: 37 ]] --[[ Name: Stop ]]
    -- upvalues: v0 (copy)
    if v0.Thread ~= nil and v0.Thread ~= "dead" then
        task.cancel(v0.Thread);
        v0.Thread = nil;
    end;
end;
v0.Initialize = function(_) --[[ Line: 44 ]] --[[ Name: Initialize ]]
    -- upvalues: v0 (copy)
    v0:Start();
end;
return v0;