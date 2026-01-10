local v0 = {};
local v1 = game["Run Service"]:IsServer();
local function v2(v3, v4) --[[ Line: 4 ]] --[[ Name: printTable ]]
    -- upvalues: v2 (copy)
    v4 = v4 or 0;
    local v5 = string.rep(" ", v4);
    for v6, v7 in pairs(v3) do
        if type(v7) == "table" then
            print(v5 .. tostring(v6) .. ":");
            v2(v7, v4 + 4);
        else
            print(v5 .. tostring(v6) .. " = " .. tostring(v7));
        end;
    end;
end;
v0.start = function(_, v9, v10, v11, v12, v13) --[[ Line: 17 ]] --[[ Name: start ]]
    -- upvalues: v1 (copy)
    local v14 = nil;
    if v10 == nil then
        v10 = {
            workspace.Env, 
            workspace.Ships, 
            workspace.Islands
        };
    end;
    local function v17(v15) --[[ Line: 24 ]] --[[ Name: check ]]
        -- upvalues: v10 (ref)
        for v16 = 1, #v10 do
            if v10[v16] then
                if v15 == v10[v16] then
                    return true;
                elseif v15:IsDescendantOf(v10[v16]) or v15 == v10[v16] then
                    return true;
                end;
            end;
        end;
        return false;
    end;
    if v1 == false then
        v9 = _G.awaitObject(v9);
    end;
    v14 = v9.Touched:Connect(function(v18) --[[ Line: 58 ]]
        -- upvalues: v17 (copy), v14 (ref), v13 (copy), v9 (ref), v1 (ref), v11 (copy), v12 (copy)
        if v17(v18) == true then
            v14:Disconnect();
            v14 = nil;
            if v13 == nil then
                v9.Anchored = true;
            end;
            if v1 == false then
                v11:FireServer(v9, v9.CFrame, v18);
                if v12 then
                    local v19 = _G.clientimpacts[game.ReplicatedStorage.ClientImpacts:FindFirstChild(v12)];
                    if v19 then
                        v19:start({
                            obj = v9, 
                            cf = v9.CFrame, 
                            hit = v18
                        });
                        return;
                    end;
                end;
            else
                v11(nil, v9, v9.CFrame, v18);
            end;
        end;
    end);
end;
return v0;