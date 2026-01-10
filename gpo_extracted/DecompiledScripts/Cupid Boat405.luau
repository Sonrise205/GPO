local v0 = {};
v0.__index = v0;
v0.Start = function(_, v2, _) --[[ Line: 4 ]] --[[ Name: Start ]]
    -- upvalues: v0 (copy)
    local v4 = {};
    setmetatable(v4, v0);
    repeat
        task.wait();
    until v2.Humanoid.SeatPart ~= nil;
    local v5 = v2.Humanoid.SeatPart:WaitForChild("SeatWeld", 2);
    if v5 then
        v5.C0 = v5.C0 * CFrame.new(0, 0, -1.1 * v2.Humanoid.BodyHeightScale.Value);
    end;
    local v6 = v2.Humanoid:LoadAnimation(script.sit);
    v6:Play();
    v4.anim = {
        v6
    };
    return v4;
end;
v0.End = function(v7) --[[ Line: 19 ]] --[[ Name: End ]]
    if v7.anim then
        for v8 = 1, #v7.anim do
            v7.anim[v8]:Stop();
        end;
        table.clear(v7.anim);
        v7.anim = nil;
    end;
    return true;
end;
return v0;