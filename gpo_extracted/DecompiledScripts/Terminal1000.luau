local v0 = nil;
local v1 = nil;
client = v0;
service = v1;
return function(_, v3) --[[ Line: 3 ]]
    if v3 then
        setfenv(1, v3);
    end;
    local v4 = {};
    local v5 = nil;
    local v6 = client.UI.Make("Window", {
        Name = "Terminal", 
        Title = "Terminal", 
        Icon = client.MatIcons.Code, 
        Size = {
            500, 
            300
        }, 
        AllowMultiple = false, 
        OnClose = function() --[[ Line: 17 ]] --[[ Name: OnClose ]]

        end
    });
    local v7 = v6:Add("ScrollingFrame", {
        Size = UDim2.new(1, -10, 1, -40), 
        BackgroundTransparency = 1, 
        List = {}
    });
    local v8 = v6:Add("TextBox", {
        Text = "", 
        Size = UDim2.new(1, 0, 0, 30), 
        Position = UDim2.new(0, 0, 1, -30), 
        PlaceholderText = "Enter command", 
        TextXAlignment = "Left", 
        ClearTextOnFocus = false
    });
    v8:Add("UIPadding", {
        PaddingLeft = UDim.new(0, 6)
    });
    local function v11(v9, v10) --[[ Line: 38 ]] --[[ Name: out ]]
        table.insert(v10, v9);
        if #v10 > 500 then
            table.remove(v10, 1);
        end;
    end;
    v6:BindEvent(service.Events.TerminalLive, function(v12) --[[ Line: 45 ]]
        -- upvalues: v11 (copy), v4 (copy)
        local l_Data_0 = v12.Data;
        local _ = v12.Type;
        v11(l_Data_0, v4);
    end);
    v8.FocusLost:Connect(function(v15) --[[ Line: 52 ]]
        -- upvalues: v8 (copy), v11 (copy), v4 (copy)
        service.Debounce("_TERMINAL_BOX_FOCUSLOST", function() --[[ Line: 53 ]]
            -- upvalues: v15 (copy), v8 (ref), v11 (ref), v4 (ref)
            if v15 and v8.Text ~= "" and v8.Text ~= "Enter command" then
                local l_Text_0 = v8.Text;
                local v17 = nil;
                v8.Text = "";
                v11((">%*"):format(l_Text_0), v4);
                v17 = client.Remote.Get("Terminal", l_Text_0, {
                    Time = time()
                });
                if v17 and type(v17) == "table" then
                    for _, v19 in ipairs(v17) do
                        v11(v19, v4);
                    end;
                end;
                v8:CaptureFocus();
            end;
            wait(0.1);
        end);
    end);
    v11(string.format("Adonis Terminal [%s]", string.match(client.Changelog[5], "%[(.+)%].+")), v4);
    v5 = v6.gTable;
    v6:Ready();
    local v20 = 0;
    while v5.Active and wait(0.5) do
        if v20 < #v4 then
            v20 = #v4;
            v7:GenerateList(v4, nil, true);
        end;
    end;
end;