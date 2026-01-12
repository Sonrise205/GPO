local v0 = {};
local v1 = {};
v0.addBar = function(_, v3, v4) --[[ Line: 3 ]] --[[ Name: addBar ]]
    -- upvalues: v1 (copy), v0 (copy)
    task.spawn(function() --[[ Line: 4 ]]
        -- upvalues: v1 (ref), v3 (copy), v0 (ref), v4 (copy)
        if v1[v3] ~= nil then
            v1[v3]:Destroy();
            v1[v3] = nil;
        end;
        local v5 = script.Parent.NPCAnimation.Overhead:Clone();
        v5.Name = v3.Name;
        v5.NameT.Text = v3.Name;
        v5.Health.Frame.Script.char.Value = v3;
        v5.Health.Frame.Script.Disabled = false;
        v5.Parent = game.Players.LocalPlayer.PlayerGui.HealthBars;
        v1[v3] = v5;
        if game.Players:GetPlayerFromCharacter(v3) ~= nil then
            local v6 = nil;
            do
                local l_v6_0 = v6;
                l_v6_0 = v3.AncestryChanged:Connect(function() --[[ Line: 20 ]]
                    -- upvalues: v3 (ref), l_v6_0 (ref), v0 (ref)
                    if v3.Parent == workspace.Effects then
                        l_v6_0:Disconnect();
                        l_v6_0 = nil;
                        v0:removeBar(v3);
                    end;
                end);
            end;
        end;
        if v4 == nil then
            v3.ChildAdded:Connect(function(v8) --[[ Line: 29 ]]
                -- upvalues: v0 (ref), v3 (ref)
                if v8.Name == "Head" then
                    v0:addBar(v3, true);
                end;
            end);
        end;
        v3.Destroying:Connect(function() --[[ Line: 36 ]]
            -- upvalues: v0 (ref), v3 (ref)
            v0:removeBar(v3);
        end);
        local v9 = v3:WaitForChild("Head", 100000000000);
        if v9 ~= nil then
            if v9:FindFirstChild("Overhead") then
                v9:FindFirstChild("Overhead"):Destroy();
            end;
            local v10 = Instance.new("ObjectValue", v9);
            v10.Name = "Overhead";
            v10.Value = v5;
            v5.Adornee = v9;
            return;
        else
            v0:removeBar(v3);
            return;
        end;
    end);
end;
v0.removeBar = function(_, v12) --[[ Line: 56 ]] --[[ Name: removeBar ]]
    -- upvalues: v1 (copy)
    if v1[v12] ~= nil then
        v1[v12]:Destroy();
        v1[v12] = nil;
    end;
end;
game["Run Service"].Heartbeat:Connect(function() --[[ Line: 63 ]]
    -- upvalues: v1 (copy), v0 (copy)
    local l_Position_0 = workspace.CurrentCamera.CFrame.Position;
    for v14, v15 in pairs(v1) do
        if v14 and v14.Parent ~= nil then
            if v14.PrimaryPart and (l_Position_0 - v14.PrimaryPart.Position).Magnitude <= 30 and v14:FindFirstChild("Head") then
                local l_Suke_0 = v14:FindFirstChild("Suke");
                if l_Suke_0 and l_Suke_0:IsA("Tool") == false or v14:GetAttribute("hideOverhead") ~= nil then
                    v15.Enabled = false;
                else
                    v15.Enabled = true;
                end;
            end;
        else
            v0:removeBar(v14);
        end;
    end;
end);
return v0;