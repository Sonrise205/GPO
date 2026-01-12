local v0 = {};
v0.__index = v0;
v0.Start = function(_, v2, v3) --[[ Line: 4 ]] --[[ Name: Start ]]
    -- upvalues: v0 (copy)
    local v4 = {};
    setmetatable(v4, v0);
    warn("sitting");
    repeat
        task.wait();
    until v2.Humanoid.SeatPart ~= nil;
    if v2.Humanoid.SeatPart:WaitForChild("SeatWeld", 2) then

    end;
    local v5 = v2.Humanoid:LoadAnimation(script.sit);
    v5:Play();
    v4.RegY = v3.m.Position.Y;
    v4.anims = {
        v5
    };
    v4.ship = v3;
    return v4;
end;
v0.int = function(_, v7, v8) --[[ Line: 22 ]] --[[ Name: int ]]
    -- upvalues: v0 (copy)
    local v9 = {};
    setmetatable(v9, v0);
    repeat
        task.wait();
    until v7.Humanoid.SeatPart ~= nil;
    local v10 = v7.Humanoid:LoadAnimation(script.sit);
    v10:Play();
    v9.anims = {
        v10
    };
    v9.ship = v8;
    warn("sitting");
    return v9;
end;
v0.End = function(v11) --[[ Line: 34 ]] --[[ Name: End ]]
    local _ = v11.ship;
    if v11.anims then
        for v13 = 1, #v11.anims do
            v11.anims[v13]:Stop();
        end;
    end;
    return true;
end;
return v0;