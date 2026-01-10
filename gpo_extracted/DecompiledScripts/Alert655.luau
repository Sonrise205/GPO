local v0 = nil;
local v1 = nil;
client = v0;
service = v1;
return function(v2, v3) --[[ Line: 3 ]]
    if v3 then
        setfenv(1, v3);
    end;
    local v4 = nil;
    local v5 = false;
    local v6 = service.New("Sound", {
        Volume = 1, 
        Looped = true, 
        SoundId = "rbxassetid://138081509"
    });
    local v7 = client.UI.Make("Window", {
        Name = "Alert", 
        Title = "Alert", 
        Size = {
            300, 
            150
        }, 
        Icon = client.MatIcons["Priority high"], 
        AllowMultiple = false, 
        OnClose = function() --[[ Line: 24 ]] --[[ Name: OnClose ]]
            -- upvalues: v6 (copy)
            v6:Stop();
            task.wait();
            v6:Destroy();
        end
    });
    if v7 then
        local v8 = v7:Add("TextLabel", {
            Text = v2.Message, 
            BackgroundTransparency = 1, 
            TextScaled = true, 
            TextWrapped = true
        });
        local v9 = v7:AddTitleButton({
            Text = ""
        });
        local v10 = v9:Add("ImageLabel", {
            Size = UDim2.new(0, 20, 0, 20), 
            Position = UDim2.new(0, 5, 0, 0), 
            Image = "rbxassetid://1638551696", 
            BackgroundTransparency = 1
        });
        v9.MouseButton1Down:Connect(function() --[[ Line: 50 ]]
            -- upvalues: v5 (ref), v6 (copy), v10 (copy)
            if v5 then
                v6.Volume = 1;
                v10.Image = "rbxassetid://1638551696";
                v5 = false;
                return;
            else
                v6.Volume = 0;
                v10.Image = "rbxassetid://1638584675";
                v5 = true;
                return;
            end;
        end);
        v6.Parent = v8;
        v6:Play();
        v4 = v7.gTable;
        v7:Ready();
    end;
end;