local v0 = {};
local function v5(v1, v2) --[[ Line: 3 ]] --[[ Name: convert ]]
    local l_Descendants_0 = script[v2]:GetDescendants();
    for v4 = 1, #l_Descendants_0 do
        if l_Descendants_0[v4].Name == v1.Name then
            _G.tween(v1, {
                1, 
                "Quad", 
                Enum.EasingDirection.Out, 
                0, 
                false, 
                0
            }, {
                Color = l_Descendants_0[v4].Color
            });
        end;
    end;
end;
local v6 = nil;
v0.start = function(_, v8, v9, v10) --[[ Line: 12 ]] --[[ Name: start ]]
    -- upvalues: v6 (ref), v5 (copy)
    if v9 ~= nil then
        if v6 then
            pcall(function() --[[ Line: 15 ]]
                -- upvalues: v6 (ref)
                v6:Stop();
            end);
            v6 = nil;
        end;
        v6 = _G.tween(workspace.Effects["Spirit Essence"].Handle, {
            v9, 
            Enum.EasingStyle.Quad, 
            Enum.EasingDirection.Out, 
            0, 
            false, 
            0
        }, {
            CFrame = v10
        }, nil, true);
        return;
    else
        local l_Descendants_1 = workspace.Effects["Spirit Essence"]:GetDescendants();
        for v12 = 1, #l_Descendants_1 do
            if l_Descendants_1[v12]:IsA("BasePart") or l_Descendants_1[v12]:IsA("PointLight") then
                v5(l_Descendants_1[v12], v8);
            end;
        end;
        return;
    end;
end;
return v0;