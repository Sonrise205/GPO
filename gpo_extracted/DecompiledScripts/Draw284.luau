local _ = game:GetService("Debris");
local v1 = require(script.Class)();
local l_Part_0 = Instance.new("Part");
l_Part_0.Anchored = true;
l_Part_0.CanCollide = false;
l_Part_0.TopSurface = Enum.SurfaceType.Smooth;
l_Part_0.BottomSurface = Enum.SurfaceType.Smooth;
v1.init = function(v3, v4, v5, v6) --[[ Line: 19 ]] --[[ Name: init ]]
    if typeof(v4) ~= "Vector3" then
        error("LightningBolt: `from` must be a Vector3");
    end;
    if typeof(v5) ~= "Vector3" then
        error("LightningBolt: `to` must be a Vector3");
    end;
    v3.options = v6 or {};
    if v3.options.seed then
        v3.random = Random.new(v3.options.seed);
    else
        v3.random = Random.new();
    end;
    v3.origin = v4;
    v3.goal = v5;
    v3.depth = v3.options.depth or 0;
    v3.thickness = v3.options.thickness or 1;
    v3.rep = v3.options.bends or 6;
    if v3.options.color then
        if typeof(v3.options.color) == "Color3" then
            v3.color = v3.options.color;
        elseif typeof(v3.options.color) == "BrickColor" then
            v3.color = v3.options.color.Color;
        else
            error("LightningBolt: `Options.color` must be a Color3 or BrickColor");
        end;
    else
        v3.color = BrickColor.new("White").Color;
    end;
    v3.material = v3.options.material or Enum.Material.Neon;
    v3.branches = {};
    v3.lines = {
        {
            origin = v4, 
            goal = v5, 
            transparency = v3.options.transparency or 0.4, 
            depth = v3.depth
        }
    };
    v3:generateBolt();
end;
v1.GetOptions = function(v7) --[[ Line: 69 ]] --[[ Name: GetOptions ]]
    local v8 = {};
    for v9, v10 in v7.options do
        v8[v9] = v10;
    end;
    return v8;
end;
v1.GetLines = function(v11) --[[ Line: 77 ]] --[[ Name: GetLines ]]
    local v12 = {};
    for v13 = 1, #v11.lines do
        v12[v13] = v11.lines[v13];
    end;
    for v14 = 1, #v11.branches do
        local l_Lines_0 = v11.branches[v14]:GetLines();
        for v16 = 1, #l_Lines_0 do
            v12[#v12 + 1] = l_Lines_0[v16];
        end;
    end;
    return v12;
end;
v1.IsDestroyed = function(v17) --[[ Line: 91 ]] --[[ Name: IsDestroyed ]]
    return v17.destroyed or false;
end;
v1.IsDrawn = function(v18) --[[ Line: 95 ]] --[[ Name: IsDrawn ]]
    return v18.drew or false;
end;
v1.generateBolt = function(v19) --[[ Line: 99 ]] --[[ Name: generateBolt ]]
    for _ = 1, v19.rep do
        v19:bend();
    end;
end;
v1.displace = function(_, v22, v23, v24, v25) --[[ Line: 105 ]] --[[ Name: displace ]]
    return (CFrame.new(v22, v23) * CFrame.new(math.sin(3.141592653589793 * v25 * 2) * v24, math.cos(3.141592653589793 * v25 * 2) * v24, 0)).p;
end;
v1.bend = function(v26) --[[ Line: 109 ]] --[[ Name: bend ]]
    -- upvalues: v1 (copy)
    for v27 = 1, #v26.lines do
        local v28 = v26.lines[v27];
        local l_goal_0 = v28.goal;
        v28.goal = v26:displace(v28.origin + (v28.goal - v28.origin).unit * (v28.goal - v28.origin).magnitude * v26.random:NextInteger(40, 60) / 100, v28.goal, v26.random:NextInteger(-530, 530) / 100, v26.random:NextNumber());
        v26.lines[#v26.lines + 1] = {
            origin = v28.goal, 
            goal = l_goal_0, 
            transparency = v28.transparency, 
            depth = v28.depth
        };
        if v28.depth <= (v26.options.max_depth or 3) then
            local v30 = (v26.origin - v28.goal).magnitude / (v26.origin - v26.goal).magnitude;
            if v26.random:NextInteger(1, 100) < (v26.options.fork_chance or 50) * v30 then
                local l_v26_Options_0 = v26:GetOptions();
                l_v26_Options_0.depth = v28.depth + 1;
                l_v26_Options_0.bends = l_v26_Options_0.fork_bends or 2;
                local v32 = v1(v28.goal, v28.goal + (v28.goal - v28.origin).unit * v26.random:NextInteger(20, 40), l_v26_Options_0);
                v26.branches[#v26.branches + 1] = v32;
            end;
        end;
    end;
end;
v1.Draw = function(v33, v34) --[[ Line: 136 ]] --[[ Name: Draw ]]
    -- upvalues: l_Part_0 (copy)
    local l_Model_0 = Instance.new("Model");
    l_Model_0.Name = "lightning";
    v33.model = l_Model_0;
    l_Model_0.Name = "LightningBolt";
    v33.SegmentCache = {};
    local v36 = l_Part_0:Clone();
    v36.Material = v33.material;
    v36.Color = v33.color;
    local l_v33_Lines_0 = v33:GetLines();
    for v38 = 1, #l_v33_Lines_0 do
        local v39 = l_v33_Lines_0[v38];
        local v40 = v36:Clone();
        v40.Size = Vector3.new(v33.thickness - v39.depth * 2 * 0.1, v33.thickness - v39.depth * 2 * 0.1, (v39.origin - v39.goal).magnitude + 0.5);
        v40.CFrame = CFrame.new((v39.goal + v39.origin) / 2, v39.goal);
        v40.Transparency = v39.transparency;
        v40.Parent = l_Model_0;
        table.insert(v33.SegmentCache, v38, v40);
    end;
    l_Model_0.Parent = v34 or workspace;
    v33.drew = true;
    if v33.options.decay then
        _G.destroy(l_Model_0, tonumber(v33.options.decay) or 0);
        v33.destroyed = true;
    end;
end;
v1.Update = function(v41, v42, v43, v44, v45, v46) --[[ Line: 170 ]] --[[ Name: Update ]]
    v41.color = v45;
    v41.thickness = v46;
    v41.transparency = v44;
    v41.branches = {};
    v41.lines = {
        {
            origin = v42, 
            goal = v43, 
            transparency = 0, 
            depth = v41.depth
        }
    };
    v41:generateBolt();
    local l_v41_Lines_0 = v41:GetLines();
    for v48 = 1, #l_v41_Lines_0 do
        local v49 = l_v41_Lines_0[v48];
        local v50 = v41.SegmentCache[v48];
        v50.Size = Vector3.new(v41.thickness - v49.depth * 2 * 0.1, v41.thickness - v49.depth * 2 * 0.1, (v49.origin - v49.goal).magnitude + 0.5);
        v50.CFrame = CFrame.new((v49.goal + v49.origin) / 2, v49.goal);
        v50.Transparency = v44;
        v50.Color = v45;
    end;
end;
v1.Destroy = function(v51) --[[ Line: 199 ]] --[[ Name: Destroy ]]
    if v51.model then
        v51.model:Destroy();
        v51.destroyed = true;
    end;
end;
return (setmetatable({
    new = v1
}, {
    __call = function(_, ...) --[[ Line: 208 ]] --[[ Name: __call ]]
        -- upvalues: v1 (copy)
        return v1(...);
    end
}));