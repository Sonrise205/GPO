local v0 = nil;
local v1 = nil;
client = v0;
service = v1;
return function(_, v3) --[[ Line: 3 ]]
    if v3 then
        setfenv(1, v3);
    end;
    local v4 = nil;
    local v5 = client.UI.Make("Window", {
        Name = "CreateCard", 
        Title = "Create Card", 
        Icon = client.MatIcons["Add circle"], 
        Size = {
            400, 
            330
        }, 
        AllowMultiple = false, 
        OnClose = function() --[[ Line: 15 ]] --[[ Name: OnClose ]]

        end
    });
    if v5 then
        v5:Add("TextLabel", {
            Text = "List Name:  ", 
            BackgroundTransparency = 1, 
            Size = UDim2.new(0, 80, 0, 30), 
            Position = UDim2.new(0, 10, 0, 10), 
            TextXAlignment = "Right"
        }):Copy("TextLabel", {
            Text = "Card Name:  ", 
            Position = UDim2.new(0, 10, 0, 50)
        }):Copy("TextLabel", {
            Text = "Card Desc:  ", 
            Position = UDim2.new(0, 10, 0, 90)
        });
        local v6 = v5:Add("TextBox", {
            Text = "", 
            BackgroundTransparency = 0.5, 
            Position = UDim2.new(0, 90, 0, 10), 
            Size = UDim2.new(1, -100, 0, 30), 
            BackgroundColor3 = v5.BackgroundColor3:lerp(Color3.new(1, 1, 1), 0.2), 
            TextWrapped = true
        });
        local v7 = v6:Copy("TextBox", {
            Position = UDim2.new(0, 90, 0, 50)
        });
        local v8 = v6:Copy("TextBox", {
            Position = UDim2.new(0, 90, 0, 90), 
            Size = UDim2.new(1, -100, 1, -100)
        });
        local v9 = false;
        do
            local l_v9_0 = v9;
            local _ = v5:Add("TextButton", {
                Text = "Create", 
                Size = UDim2.new(0, 70, 0, 30), 
                Position = UDim2.new(0, 10, 1, -40), 
                OnClick = function() --[[ Line: 58 ]] --[[ Name: OnClick ]]
                    -- upvalues: l_v9_0 (ref), v5 (copy), v6 (copy), v7 (copy), v8 (copy)
                    if not l_v9_0 then
                        l_v9_0 = true;
                        v5:Destroy();
                        client.Remote.Send("TrelloOperation", {
                            Action = "MakeCard", 
                            List = v6.Text, 
                            Name = v7.Text, 
                            Desc = v8.Text
                        });
                    end;
                end
            });
            v4 = v5.gTable;
            v5:Ready();
        end;
    end;
end;