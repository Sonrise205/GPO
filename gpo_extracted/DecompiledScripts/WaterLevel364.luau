local v0 = {};
local v1 = {};
v0.start = function(_, v3, v4, v5) --[[ Line: 4 ]] --[[ Name: start ]]
    -- upvalues: v1 (copy)
    v3 = _G.awaitObject(v3);
    if v3 == nil then
        return;
    elseif not _G.checkRenderDistance(v3.Position) then
        return;
    else
        v5.obj = v3;
        table.insert(v1, {
            v3, 
            v4, 
            v5
        });
        return;
    end;
end;
local l_Y_0 = workspace.Env.WaterStuff.Ocean.Position.Y;
task.spawn(function() --[[ Line: 18 ]]
    -- upvalues: v1 (copy), l_Y_0 (copy)
    game["Run Service"].Heartbeat:Connect(function() --[[ Line: 19 ]]
        -- upvalues: v1 (ref), l_Y_0 (ref)
        for v7 = 1, #v1 do
            if v1[v7] ~= nil and v1[v7][1] ~= nil and v1[v7][1].Parent ~= nil then
                local v8 = v1[v7][1];
                local v9 = v1[v7][2];
                local v10 = v1[v7][3];
                local l_remote_0 = v10.remote;
                local l_Y_1 = v8.Position.Y;
                if l_Y_1 <= l_Y_0 and workspace.Env.WaterStuff.Sand.Position.Y - 10 < l_Y_1 then
                    warn(math.abs(l_Y_0) - math.abs(l_Y_1));
                    local v13, _, v15, v16, v17, v18, v19, v20, v21, v22, v23, v24 = v8.CFrame:components();
                    v8.CFrame = CFrame.new(v13, l_Y_0, v15, v16, v17, v18, v19, v20, v21, v22, v23, v24);
                    l_remote_0:FireServer("splash", v8.CFrame);
                    task.spawn(function() --[[ Line: 33 ]]
                        -- upvalues: v9 (copy), v10 (copy)
                        if v9 and game.ReplicatedStorage.ClientImpacts:FindFirstChild(v9) then
                            _G.clientimpacts[game.ReplicatedStorage.ClientImpacts:FindFirstChild(v9)]:start(v10);
                        end;
                    end);
                    table.clear(v1[v7]);
                    table.remove(v1, v7);
                end;
            else
                table.remove(v1, v7);
            end;
        end;
    end);
end);
return v0;