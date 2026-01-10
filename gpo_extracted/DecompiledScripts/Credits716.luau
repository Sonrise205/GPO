return function(_, v1) --[[ Line: 1 ]]
    if v1 then
        setfenv(1, v1);
    end;
    local l_client_0 = v1.client;
    local _ = v1.service;
    local v4 = l_client_0.UI.Make("Window", {
        Name = "Credits", 
        Title = "Credits", 
        Icon = l_client_0.MatIcons.Grade, 
        Size = {
            280, 
            340
        }, 
        AllowMultiple = false
    });
    if not v4 then
        return;
    else
        local v5 = v4:Add("TabFrame", {
            Size = UDim2.new(1, -10, 1, -10), 
            Position = UDim2.new(0, 5, 0, 5)
        });
        local v6 = require(l_client_0.Shared.Credits);
        for _, v8 in ipairs({
            [1] = v5:NewTab("Main", {
                Text = "Main"
            }), 
            [2] = v5:NewTab("Contributors", {
                Text = "Contributors"
            }), 
            [3] = v5:NewTab("Misc", {
                Text = "Everyone Else"
            })
        }) do
            local v9 = v8:Add("ScrollingFrame", {
                List = {}, 
                ScrollBarThickness = 3, 
                BackgroundTransparency = 1, 
                Position = UDim2.new(0, 5, 0, 30), 
                Size = UDim2.new(1, -10, 1, -35)
            });
            local v10 = v8:Add("TextBox", {
                Position = UDim2.new(0, 5, 0, 5), 
                Size = UDim2.new(1, -10, 0, 20), 
                BackgroundTransparency = 0.25, 
                BorderSizePixel = 0, 
                TextColor3 = Color3.new(1, 1, 1), 
                Text = "", 
                PlaceholderText = "Search", 
                TextStrokeTransparency = 0.8
            });
            v10:Add("ImageLabel", {
                Image = l_client_0.MatIcons.Search, 
                Position = UDim2.new(1, -20, 0, 2), 
                Size = UDim2.new(0, 16, 0, 16), 
                ImageTransparency = 0.2, 
                BackgroundTransparency = 1
            });
            local function v15() --[[ Line: 57 ]] --[[ Name: generate ]]
                -- upvalues: v10 (copy), v9 (copy), v6 (copy), v8 (copy)
                local v11 = 1;
                local l_Text_0 = v10.Text;
                v9:ClearAllChildren();
                for _, v14 in ipairs(v6[v8.Name]) do
                    if string.lower((string.sub(v14.Text, 1, #l_Text_0))) == string.lower(l_Text_0) or v8.Name == "Contributors" and string.lower((string.sub(v14.Text, 9, #l_Text_0 + 8))) == string.lower(l_Text_0) then
                        v9:Add("TextLabel", {
                            Text = ("  %* "):format(v14.Text), 
                            ToolTip = v14.Desc, 
                            BackgroundTransparency = v11 % 2 == 0 and 0 or 0.2, 
                            Size = UDim2.new(1, 0, 0, 26), 
                            Position = UDim2.new(0, 0, 0, (v11 - 1) * 26), 
                            TextXAlignment = "Left"
                        });
                        v11 = v11 + 1;
                    end;
                end;
                v9:ResizeCanvas(false, true, false, false, 5, 0);
            end;
            v10:GetPropertyChangedSignal("Text"):Connect(v15);
            v15();
        end;
        v4:Ready();
        return;
    end;
end;