local v0 = {};
local v1 = {};
v0.start = function(_, v3) --[[ Line: 4 ]] --[[ Name: start ]]
    -- upvalues: v1 (copy)
    local v4 = Instance.new("Color3Value", v3);
    v4.Value = Color3.fromRGB(255, 255, 255);
    _G.tween(v4, {
        0.5, 
        Enum.EasingStyle.Quad, 
        Enum.EasingDirection.Out, 
        -1, 
        true, 
        0
    }, {
        Value = Color3.fromRGB(255, 0, 0)
    });
    v1[v3] = v4;
end;
game["Run Service"].Heartbeat:Connect(function() --[[ Line: 11 ]]
    -- upvalues: v1 (copy)
    for v5, v6 in v1 do
        if v5:IsDescendantOf(game) == true then
            v5.Color = ColorSequence.new(v6.Value);
        else
            v1[v5] = nil;
        end;
    end;
end);
return v0;