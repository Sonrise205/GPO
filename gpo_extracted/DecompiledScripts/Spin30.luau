local v0 = {};
local v1 = {};
v0.start = function(_, v3, v4, v5, v6, v7, v8) --[[ Line: 4 ]] --[[ Name: start ]]
    -- upvalues: v1 (copy)
    local _ = tick();
    local v10 = nil;
    if _G.checkRenderDistance(v3.Part0.Position) == false then
        return;
    else
        if v5 then
            v10 = script.Part:Clone();
            if v6 then
                v10.Size = v6;
            end;
            if v7 then
                v10.Color = v7;
            end;
            v10.Parent = workspace.Effects;
            _G.tween(v10, {
                0.25, 
                Enum.EasingStyle.Quad, 
                Enum.EasingDirection.Out, 
                0, 
                false, 
                0
            }, {
                Transparency = 1, 
                Color = v8
            });
        end;
        table.insert(v1, {
            v10, 
            v3, 
            v4, 
            CFrame.new(0, 0, v10.Size.X / 6) * CFrame.Angles(0, -1.5707963267948966, 0)
        });
        return;
    end;
end;
game["Run Service"].RenderStepped:Connect(function() --[[ Line: 37 ]]
    -- upvalues: v1 (copy)
    for v11 = 1, #v1 do
        if v1[v11] then
            local v12, v13, v14, v15 = unpack(v1[v11]);
            if v13.Parent ~= nil then
                v13.C0 = v13.C0 * v14;
                if v12 and v12.Parent ~= nil then
                    v12.CFrame = v13.Part1.CFrame * v15;
                else
                    table.remove(v1, v11);
                end;
            else
                v12:Destroy();
                table.remove(v1, v11);
            end;
        else
            table.remove(v1, v11);
        end;
    end;
end);
return v0;