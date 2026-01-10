local function _() --[[ Line: 1 ]] --[[ Name: getRandomWaveDirection ]]
    local v0 = math.random() * 2 - 1;
    local v1 = math.random() * 2 - 1;
    local v2 = math.sqrt(v0 ^ 2 + v1 ^ 2);
    return (Vector3.new(v0 / v2, v1 / v2));
end;
local v4 = {};
local function v9() --[[ Line: 21 ]] --[[ Name: randomDefault ]]
    -- upvalues: v4 (copy)
    local v5 = {
        Direction = Vector3.new(1, -1, 0, 0), 
        WaveLength = 180, 
        Steepness = 0.12, 
        Gravity = 0.2, 
        Priority = 0, 
        Cancel = false
    };
    local v6 = math.random() * 2 - 1;
    local v7 = math.random() * 2 - 1;
    local v8 = math.sqrt(v6 ^ 2 + v7 ^ 2);
    v5.Direction = Vector3.new(v6 / v8, v7 / v8);
    v5.WaveLength = math.random(25, 100);
    v5.Steepness = math.random(20, 40) / 1000;
    table.insert(v4, v5);
end;
for _ = 1, 12 do
    v9();
end;
return v4;