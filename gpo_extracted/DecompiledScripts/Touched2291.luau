return {
    start = function(_, v1, v2, v3, v4, v5, v6) --[[ Line: 3 ]] --[[ Name: start ]]
        local l_LocalPlayer_0 = game.Players.LocalPlayer;
        local v8 = nil;
        if v5 == nil then
            table.insert(v2, workspace.CurrentCamera);
        end;
        local function v13(v9) --[[ Line: 9 ]] --[[ Name: check ]]
            -- upvalues: v5 (copy), v2 (copy)
            local v10 = true;
            if v5 ~= nil then
                v10 = false;
            end;
            for v11 = 1, #v2 do
                local v12 = nil;
                if v2[v11] ~= nil then
                    v12 = if v5 ~= nil then v9:IsDescendantOf(v2[v11].Parent) else v9:IsDescendantOf(v2[v11]);
                end;
                if v12 == true and v5 == nil then
                    return false;
                elseif v12 == false and v5 ~= nil then
                    v10 = false;
                elseif v12 == true and v5 ~= nil then
                    return true;
                end;
            end;
            return v10;
        end;
        v1 = _G.awaitObject(v1);
        v8 = v1.Touched:Connect(function(v14) --[[ Line: 36 ]]
            -- upvalues: v13 (copy), l_LocalPlayer_0 (copy), v8 (ref), v6 (copy), v1 (ref), v3 (copy), v4 (copy)
            if v13(v14) == true and (v14.Transparency ~= 1 or v14.Name == "HumanoidRootPart" or v14.Parent:FindFirstChild("Humanoid")) then
                if l_LocalPlayer_0.Character ~= nil and v14:IsDescendantOf(l_LocalPlayer_0.Character) then
                    return;
                else
                    v8:Disconnect();
                    v8 = nil;
                    if v6 == nil then
                        v1.Anchored = true;
                    end;
                    v3:FireServer(v1, v1.CFrame, v14);
                    if v4 then
                        _G.clientimpacts[game.ReplicatedStorage.ClientImpacts:FindFirstChild(v4)]:start({
                            obj = v1, 
                            cf = v1.CFrame, 
                            hit = v14
                        });
                    end;
                end;
            end;
        end);
    end
};