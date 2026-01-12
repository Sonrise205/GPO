local _ = workspace:WaitForChild("Effects");
local v1 = {};
local _ = workspace:WaitForChild("Effects");
local v3 = {};
v3.__index = v3;
local _ = table.insert;
local _ = {};
local _ = game:GetService("ContentProvider");
local v7 = require(game:GetService("ReplicatedStorage").Modules.sBeat);
local v8 = {};
for _, v10 in (script:GetChildren()) do
    v8[v10.Name] = {
        ft = v10.config.frametime.Value * 60, 
        tf = v10.config.frames.Value, 
        ids = {}
    };
    local l_Children_0 = v10.texs:GetChildren();
    local v12 = {};
    for v13 = 1, #l_Children_0 do
        local l_Name_0 = l_Children_0[v13].Name;
        v12[v13] = tonumber((string.sub(l_Name_0, string.find(l_Name_0, "_") + 1)));
    end;
    table.sort(v12);
    for v15 = 1, #v12 do
        local v16 = v10.texs["Decal_" .. v12[v15]];
        v8[v10.Name].ids[v15] = v16.Texture;
        v16.Texture = "rbxassetid://" .. math.random(100000, 10000000);
    end;
    v10:Destroy();
end;
v3.new = function(v17, v18) --[[ Line: 39 ]] --[[ Name: new ]]
    -- upvalues: v8 (copy), v3 (copy)
    return (setmetatable({
        part = v18, 
        info = v8[v17]
    }, v3));
end;
v3.Do = function(v19) --[[ Line: 47 ]] --[[ Name: Do ]]
    -- upvalues: v7 (copy)
    local l_part_0 = v19.part;
    task.spawn(function() --[[ Line: 50 ]]
        -- upvalues: v19 (copy), l_part_0 (copy), v7 (ref)
        for v21 = 1, v19.info.tf do
            pcall(function() --[[ Line: 52 ]]
                -- upvalues: l_part_0 (ref), v19 (ref), v21 (copy)
                l_part_0.Decal.Texture = v19.info.ids[v21];
            end);
            v7(v19.info.ft);
        end;
        l_part_0:Destroy();
    end);
end;
v1.Do = function(v22, v23) --[[ Line: 64 ]] --[[ Name: Do ]]
    -- upvalues: v3 (copy)
    return v3.new(v22, v23):Do();
end;
return v1;