game.ReplicatedStorage.Events.buggyTrack.OnClientEvent:Connect(function(v0, v1, v2) --[[ Line: 1 ]]
    if v0 == nil then
        return;
    else
        local l_Info_0 = v0:FindFirstChild("Info");
        local l_Target_0 = l_Info_0:FindFirstChild("Target");
        while l_Info_0 ~= nil and l_Target_0 ~= nil do
            local l_Value_0 = l_Target_0.Value;
            if l_Value_0 then
                v2.CFrame = CFrame.new(v0.UpperTorso.CFrame.p, (l_Value_0.CFrame * CFrame.new(0, 0, 0)).p) * CFrame.Angles(-1.5707963267948966, 0, 0);
                v1.Velocity = v1.Parent.CFrame.upVector * 50;
                game["Run Service"].Stepped:Wait();
                if v2.Parent == nil or v1.Parent == nil then
                    break;
                end;
            else
                break;
            end;
        end;
        return;
    end;
end);