local v0 = {};
v0.__index = v0;
local function v5(v1, v2) --[[ Line: 3 ]] --[[ Name: paddle ]]
    local v3 = script.paddle:Clone();
    v3.Parent = v1;
    v3.Name = v2 .. "Paddle";
    local v4 = Instance.new("Motor6D", v1[v2 .. "Hand"]);
    v4.Part0 = v4.Parent;
    v4.Part1 = v3;
    v4.C0 = CFrame.new(0, -v3.Size.Y / 2, 0);
    v4.Name = v2 .. "Pad";
    return v3;
end;
v0.Start = function(_, v7) --[[ Line: 14 ]] --[[ Name: Start ]]
    -- upvalues: v0 (copy), v5 (copy)
    local v8 = {};
    setmetatable(v8, v0);
    v8.pads = {
        v5(v7, "Right"), 
        (v5(v7, "Left"))
    };
    return v8;
end;
v0.End = function(v9) --[[ Line: 21 ]] --[[ Name: End ]]
    for v10 = 1, #v9.pads do
        v9.pads[v10]:Destroy();
    end;
end;
return v0;