return {
    start = function(_, v1, _) --[[ Line: 3 ]] --[[ Name: start ]]
        task.spawn(function() --[[ Line: 4 ]]
            -- upvalues: v1 (copy)
            local v3 = workspace.Effects:WaitForChild(v1.Name .. "IceBike", 3);
            while v1.PrimaryPart ~= nil do
                _G.PlayEffect("FloorFreeze", nil, v1.HumanoidRootPart.CFrame * CFrame.new(0, 1, -4), v1.Humanoid.HipHeight * 2, 8, 10);
                game["Run Service"].Heartbeat:Wait();
                if v3 == nil or v3 and v3.Parent == nil then
                    break;
                end;
            end;
        end);
    end
};