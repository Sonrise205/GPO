local v0 = nil;
local v1 = nil;
client = v0;
service = v1;
return function(_, v3) --[[ Line: 3 ]]
    if v3 then
        setfenv(1, v3);
    end;
    local v4 = true;
    local v5 = nil;
    local v6 = client.UI.Make("Window", {
        Name = "Performance stats", 
        Title = "Stats", 
        Icon = client.MatIcons.Leaderboard, 
        Size = {
            150, 
            90
        }, 
        Position = UDim2.new(0, 10, 1, -100), 
        AllowMultiple = false, 
        NoHide = true, 
        Walls = true, 
        CanKeepAlive = true, 
        OnClose = function() --[[ Line: 23 ]] --[[ Name: OnClose ]]
            -- upvalues: v4 (ref)
            v4 = false;
        end
    });
    if v6 then
        local v7 = v6:Add("TextLabel", {
            Text = "...", 
            BackgroundTransparency = 1, 
            TextSize = 20, 
            Size = UDim2.new(1, 0, 1, 0), 
            Position = UDim2.new(0, 0, 0, 0)
        });
        v5 = v6.gTable;
        v6:Ready();
        repeat
            v7.Text = string.format("Render: %.1f fps\nPhysics: %.1f fps\nPing: %d ms", 1 / service.RunService.RenderStepped:Wait(), workspace:GetRealPhysicsFPS(), service.Players.LocalPlayer:GetNetworkPing() * 1000);
            task.wait(1);
        until not v4 or not v5.Active;
    end;
end;