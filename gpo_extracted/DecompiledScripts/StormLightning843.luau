local _ = game:GetService("Debris");
local v1 = require(script.Class)();
local l_Part_0 = Instance.new("Part");
l_Part_0.Anchored = true;
l_Part_0.CanCollide = false;
l_Part_0.TopSurface = Enum.SurfaceType.Smooth;
l_Part_0.BottomSurface = Enum.SurfaceType.Smooth;
l_Part_0.CastShadow = false;
l_Part_0.CanTouch = false;
l_Part_0.CanQuery = false;
local _ = Instance.new("BlockMesh", l_Part_0);
v1.init = function(v4, v5, v6, v7) --[[ Line: 50 ]] --[[ Name: init ]]
    if typeof(v5) ~= "Vector3" then
        error("LightningBolt: `from` must be a Vector3");
    end;
    if typeof(v6) ~= "Vector3" then
        error("LightningBolt: `to` must be a Vector3");
    end;
    v4.options = v7 or {};
    if v4.options.seed then
        v4.random = Random.new(v4.options.seed);
    else
        v4.random = Random.new();
    end;
    v4.depth = v4.options.depth or 0;
    v4.origin = v5;
    v4.goal = v6;
    v4.rep = v4.options.bends or 6;
    if v4.options.color then
        if typeof(v4.options.color) == "Color3" then
            v4.color = v4.options.color;
        elseif typeof(v4.options.color) == "BrickColor" then
            v4.color = v4.options.color.Color;
        else
            error("LightningBolt: `Options.color` must be a Color3 or BrickColor");
        end;
    else
        v4.color = BrickColor.new("White").Color;
    end;
    if v4.options.color2 then
        if typeof(v4.options.color2) == "Color3" then
            v4.color2 = v4.options.color2;
        elseif typeof(v4.options.color2) == "BrickColor" then
            v4.color2 = v4.options.color2.Color;
        else
            error("LightningBolt: `Options.color2` must be a Color3 or BrickColor");
        end;
    else
        v4.color2 = BrickColor.new("White").Color;
    end;
    v4.material = v4.options.material or Enum.Material.Neon;
    v4.branches = {};
    v4.lines = {
        {
            origin = v5, 
            goal = v6, 
            transparency = v4.options.transparency or 0.4, 
            depth = v4.depth
        }
    };
    v4:generateBolt();
end;
v1.GetOptions = function(v8) --[[ Line: 111 ]] --[[ Name: GetOptions ]]
    local v9 = {};
    for v10, v11 in v8.options do
        v9[v10] = v11;
    end;
    return v9;
end;
v1.GetLines = function(v12) --[[ Line: 119 ]] --[[ Name: GetLines ]]
    local v13 = {};
    for v14 = 1, #v12.lines do
        v13[v14] = v12.lines[v14];
    end;
    for v15 = 1, #v12.branches do
        local l_Lines_0 = v12.branches[v15]:GetLines();
        for v17 = 1, #l_Lines_0 do
            v13[#v13 + 1] = l_Lines_0[v17];
        end;
    end;
    return v13;
end;
v1.IsDestroyed = function(v18) --[[ Line: 133 ]] --[[ Name: IsDestroyed ]]
    return v18.destroyed or false;
end;
v1.IsDrawn = function(v19) --[[ Line: 137 ]] --[[ Name: IsDrawn ]]
    return v19.drew or false;
end;
v1.generateBolt = function(v20) --[[ Line: 141 ]] --[[ Name: generateBolt ]]
    for _ = 1, v20.rep do
        v20:bend();
    end;
end;
v1.displace = function(_, v23, v24, v25, v26) --[[ Line: 147 ]] --[[ Name: displace ]]
    return (CFrame.new(v23, v24) * CFrame.new(math.sin(3.141592653589793 * v26 * 2) * v25, math.cos(3.141592653589793 * v26 * 2) * v25, 0)).p;
end;
v1.bend = function(v27) --[[ Line: 151 ]] --[[ Name: bend ]]
    -- upvalues: v1 (copy)
    for v28 = 1, #v27.lines do
        local v29 = v27.lines[v28];
        local l_goal_0 = v29.goal;
        v29.goal = v27:displace(v29.origin + (v29.goal - v29.origin).unit * (v29.goal - v29.origin).magnitude * v27.random:NextInteger(40, 60) / 100, v29.goal, v27.random:NextInteger(-530, 530) / 100, v27.random:NextNumber());
        v27.lines[#v27.lines + 1] = {
            origin = v29.goal, 
            goal = l_goal_0, 
            transparency = v29.transparency, 
            depth = v29.depth
        };
        if v29.depth <= (v27.options.max_depth or 3) then
            local v31 = (v27.origin - v29.goal).magnitude / (v27.origin - v27.goal).magnitude;
            if v27.random:NextInteger(1, 100) < (v27.options.fork_chance or 50) * v31 then
                local l_v27_Options_0 = v27:GetOptions();
                l_v27_Options_0.depth = v29.depth + 1;
                l_v27_Options_0.bends = l_v27_Options_0.fork_bends or 2;
                local v33 = v1(v29.goal, v29.goal + (v29.goal - v29.origin).unit * v27.random:NextInteger(20, 40), l_v27_Options_0);
                v27.branches[#v27.branches + 1] = v33;
            end;
        end;
    end;
end;
v1.Draw = function(v34, _) --[[ Line: 178 ]] --[[ Name: Draw ]]
    -- upvalues: l_Part_0 (copy)
    local l_Model_0 = Instance.new("Model");
    v34.model = l_Model_0;
    l_Model_0.Name = "LightningBolt";
    local _ = v34.color2;
    local v38 = l_Part_0:Clone();
    v38.Material = v34.material;
    v38.Color = v34.color;
    local l_v34_Lines_0 = v34:GetLines();
    local _ = math.random(100, 500) / 100;
    for v41 = 1, #l_v34_Lines_0 do
        local v42 = l_v34_Lines_0[v41];
        local v43 = v38:Clone();
        local v44 = 1;
        if v34:GetOptions().thickness then
            v44 = v34:GetOptions().thickness;
        end;
        local v45 = v44 - v42.depth * 0.1;
        local v46 = Vector3.new(v45, v45, (v42.origin - v42.goal).magnitude + 0.5);
        v43.CFrame = CFrame.new((v42.goal + v42.origin) / 2, v42.goal);
        v43.Size = Vector3.new(1, 1, 1, 0);
        v43.Mesh.Scale = v46;
        v43.Transparency = 0;
        v43.Parent = l_Model_0;
    end;
    l_Model_0.Parent = workspace.Effects;
    v34.drew = true;
    if v34.options.decay then
        _G.destroy(l_Model_0, tonumber(v34.options.decay) or 0);
        v34.destroyed = true;
    end;
end;
v1.Destroy = function(v47) --[[ Line: 216 ]] --[[ Name: Destroy ]]
    if v47.model then
        v47.model:Destroy();
        v47.destroyed = true;
    end;
end;
return (setmetatable({
    new = v1
}, {
    __call = function(_, ...) --[[ Line: 225 ]] --[[ Name: __call ]]
        -- upvalues: v1 (copy)
        return v1(...);
    end
}));