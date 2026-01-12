local _ = game:GetService("Debris");
local v1 = require(script.Class)();
local l_Part_0 = Instance.new("Part");
l_Part_0.Anchored = true;
l_Part_0.CanCollide = false;
l_Part_0.CanQuery = false;
l_Part_0.CanTouch = false;
l_Part_0.TopSurface = Enum.SurfaceType.Smooth;
l_Part_0.BottomSurface = Enum.SurfaceType.Smooth;
local _ = Instance.new("BlockMesh", l_Part_0);
v1.init = function(v4, v5, v6, v7) --[[ Line: 49 ]] --[[ Name: init ]]
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
    end;
    v4.thickness = v4.options.thickness;
    v4.ti = v4.options.ti;
    v4.material = v4.options.material or Enum.Material.Neon;
    v4.branches = {};
    v4.lines = {
        {
            origin = v5, 
            goal = v6, 
            transparency = v4.options.transparency or 0.4, 
            depth = v4.depth, 
            num = 0, 
            max = 0
        }
    };
    v4:generateBolt();
end;
v1.GetOptions = function(v8) --[[ Line: 113 ]] --[[ Name: GetOptions ]]
    local v9 = {};
    for v10, v11 in v8.options do
        v9[v10] = v11;
    end;
    return v9;
end;
v1.GetLines = function(v12) --[[ Line: 121 ]] --[[ Name: GetLines ]]
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
v1.IsDestroyed = function(v18) --[[ Line: 135 ]] --[[ Name: IsDestroyed ]]
    return v18.destroyed or false;
end;
v1.IsDrawn = function(v19) --[[ Line: 139 ]] --[[ Name: IsDrawn ]]
    return v19.drew or false;
end;
v1.generateBolt = function(v20) --[[ Line: 143 ]] --[[ Name: generateBolt ]]
    for _ = 1, v20.rep do
        v20:bend();
    end;
end;
v1.displace = function(_, v23, v24, v25, v26) --[[ Line: 149 ]] --[[ Name: displace ]]
    return (CFrame.new(v23, v24) * CFrame.new(math.sin(3.141592653589793 * v26 * 2) * v25, math.cos(3.141592653589793 * v26 * 2) * v25, 0)).p;
end;
v1.bend = function(v27) --[[ Line: 153 ]] --[[ Name: bend ]]
    -- upvalues: v1 (copy)
    for v28 = 1, #v27.lines do
        local v29 = v27.lines[v28];
        local l_goal_0 = v29.goal;
        v29.goal = v27:displace(v29.origin + (v29.goal - v29.origin).unit * (v29.goal - v29.origin).magnitude * v27.random:NextInteger(40, 60) / 100, v29.goal, v27.random:NextInteger(-530, 530) / 100, v27.random:NextNumber());
        v27.lines[#v27.lines + 1] = {
            origin = v29.goal, 
            goal = l_goal_0, 
            transparency = v29.transparency, 
            depth = v29.depth, 
            num = v28, 
            max = #v27.lines
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
v1.Draw = function(v34, _) --[[ Line: 182 ]] --[[ Name: Draw ]]
    -- upvalues: l_Part_0 (copy)
    local l_Model_0 = Instance.new("Model");
    v34.model = l_Model_0;
    l_Model_0.Name = "LightningBolt";
    local l_color2_0 = v34.color2;
    local v38 = l_Part_0:Clone();
    v38.Material = v34.material;
    v38.Color = v34.color;
    local l_v34_Lines_0 = v34:GetLines();
    local _ = math.random(100, 500) / 100;
    local l_ti_0 = v34.ti;
    task.spawn(function() --[[ Line: 194 ]]
        -- upvalues: l_v34_Lines_0 (copy), v38 (copy), v34 (copy), l_Model_0 (copy), l_ti_0 (copy), l_color2_0 (copy)
        for v42 = 1, #l_v34_Lines_0 do
            local v43 = l_v34_Lines_0[v42];
            local v44 = v38:Clone();
            local v45 = Vector3.new(v34.thickness - v43.depth * 0.1, v34.thickness - v43.depth * 0.1, (v43.origin - v43.goal).magnitude);
            v44.CFrame = CFrame.new((v43.goal + v43.origin) / 2, v43.goal);
            v44.Size = Vector3.new(1, 1, 1, 0);
            v44.Mesh.Scale = Vector3.new(0, 0, 0, 0);
            v44.Parent = l_Model_0;
            task.spawn(function() --[[ Line: 204 ]]
                -- upvalues: v44 (copy), v45 (copy), l_ti_0 (ref), l_color2_0 (ref)
                if v44 and v44.Parent ~= nil then
                    v44.Mesh.Scale = v45;
                    v44.Transparency = 0;
                    local v46 = math.random(1, 6);
                    local v47 = TweenInfo.new(l_ti_0, Enum.EasingStyle.Quint, Enum.EasingDirection.Out, v46, true, math.random(10, 75) / 1000);
                    local v48 = {
                        Scale = Vector3.new(0, 0, v45.Z)
                    };
                    game:GetService("TweenService"):Create(v44.Mesh, v47, v48):Play();
                end;
                if l_color2_0 ~= nil then
                    task.wait(l_ti_0 / 2);
                    local v49 = TweenInfo.new(l_ti_0 / 2, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out, 0, false, 0);
                    local v50 = {
                        Color = l_color2_0, 
                        Transparency = 1
                    };
                    game:GetService("TweenService"):Create(v44, v49, v50):Play();
                end;
            end);
            game["Run Service"].Stepped:Wait();
        end;
    end);
    l_Model_0.Parent = workspace.Effects;
    v34.drew = true;
    if v34.options.decay then
        _G.destroy(l_Model_0, (tonumber(v34.options.decay) or 0) + 3);
        v34.destroyed = true;
    end;
end;
v1.Destroy = function(v51) --[[ Line: 279 ]] --[[ Name: Destroy ]]
    if v51.model then
        v51.model:Destroy();
        v51.destroyed = true;
    end;
end;
return (setmetatable({
    new = v1
}, {
    __call = function(_, ...) --[[ Line: 288 ]] --[[ Name: __call ]]
        -- upvalues: v1 (copy)
        return v1(...);
    end
}));