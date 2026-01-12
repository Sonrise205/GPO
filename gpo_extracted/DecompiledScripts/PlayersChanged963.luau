local v0 = {};
local v1 = {};
local v2 = {};
local v3 = {};
v0.AddRemove = function(_, v5) --[[ Line: 6 ]] --[[ Name: AddRemove ]]
    -- upvalues: v1 (copy)
    table.insert(v1, v5);
end;
v0.AddJoin = function(_, v7) --[[ Line: 10 ]] --[[ Name: AddJoin ]]
    -- upvalues: v2 (copy), v3 (copy)
    task.spawn(function() --[[ Line: 11 ]]
        -- upvalues: v2 (ref), v7 (copy), v3 (ref)
        table.insert(v2, v7);
        local l_Players_0 = game.Players:GetPlayers();
        for v9 = 1, #l_Players_0 do
            local v10 = l_Players_0[v9];
            if v3[v10] == nil then
                v3[v10] = {};
            end;
            if not v3[v10][v7] then
                v3[v10][v7] = true;
                task.spawn(v7, l_Players_0[v9]);
            end;
        end;
    end);
end;
game.Players.PlayerRemoving:Connect(function(v11) --[[ Line: 29 ]]
    -- upvalues: v3 (copy), v1 (copy)
    local _ = v11.Character;
    v3[v11] = nil;
    for v13 = 1, #v1 do
        task.spawn(function() --[[ Line: 33 ]]
            -- upvalues: v1 (ref), v13 (copy), v11 (copy)
            v1[v13](v11);
        end);
    end;
    task.wait(3);
end);
game.Players.PlayerAdded:Connect(function(v14) --[[ Line: 45 ]]
    -- upvalues: v2 (copy), v3 (copy)
    for v15 = 1, #v2 do
        task.spawn(function() --[[ Line: 48 ]]
            -- upvalues: v3 (ref), v14 (copy), v2 (ref), v15 (copy)
            if v3[v14] == nil then
                v3[v14] = {};
            end;
            if v3[v14][v2[v15]] ~= nil then
                return;
            else
                v3[v14][v2[v15]] = true;
                v2[v15](v14);
                return;
            end;
        end);
    end;
end);
_G.addPlayerJoinFunction = function(v16) --[[ Line: 61 ]]
    -- upvalues: v0 (copy)
    v0:AddJoin(v16);
end;
_G.addPlayerRemoveFunction = function(v17) --[[ Line: 65 ]]
    -- upvalues: v0 (copy)
    v0:AddRemove(v17);
end;
return v0;