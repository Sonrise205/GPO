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
        v5.C0 = v5.C0 * CFrame.new(0, 0, 1.1 * v2.Humanoid.BodyHeightScale.Value);
    end;
    return v4;
end;
v0.End = function(_) --[[ Line: 15 ]] --[[ Name: End ]]
    return true;
end;
return v0;