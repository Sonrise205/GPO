local v0 = nil;
local v1 = nil;
client = v0;
service = v1;
return function(v2, v3) --[[ Line: 3 ]]
    if v3 then
        setfenv(1, v3);
    end;
    local v4 = nil;
    local v5 = nil;
    local l_Question_0 = v2.Question;
    local l_Answers_0 = v2.Answers;
    local l_IsRandomOrder_0 = v2.IsRandomOrder;
    local v9 = client.UI.Make("Window", {
        Name = "Vote", 
        Title = "Vote", 
        Size = {
            300, 
            200
        }, 
        Icon = client.MatIcons.Poll, 
        OnClose = function() --[[ Line: 17 ]] --[[ Name: OnClose ]]
            -- upvalues: v5 (ref)
            if not v5 then
                v5 = false;
            end;
        end
    });
    local _ = v9:Add("TextLabel", {
        Text = l_Question_0, 
        TextScaled = true, 
        TextWrapped = true, 
        Size = UDim2.new(1, -10, 0, 50), 
        BackgroundTransparency = 1
    });
    local v11 = v9:Add("ScrollingFrame", {
        Size = UDim2.new(1, -10, 1, -60), 
        Position = UDim2.new(0, 5, 0, 55)
    });
    if l_IsRandomOrder_0 then
        local v12 = {};
        for _, v14 in ipairs(l_Answers_0) do
            table.insert(v12, math.random(1, #v12 + 1), v14);
        end;
        l_Answers_0 = v12;
    end;
    for v15, v16 in l_Answers_0 do
        v11:Add("TextButton", {
            Text = ("%*. %*"):format(v15, v16), 
            Size = UDim2.new(1, -10, 0, 25), 
            Position = UDim2.new(0, 5, 0, 25 * (v15 - 1)), 
            TextXAlignment = "Left", 
            Events = {
                MouseButton1Click = function() --[[ Line: 49 ]] --[[ Name: MouseButton1Click ]]
                    -- upvalues: v9 (copy), v5 (ref), v16 (copy)
                    v9:Close();
                    v5 = v16;
                end
            }
        });
    end;
    v11:ResizeCanvas();
    v4 = v9.gTable;
    v9:Ready();
    repeat
        task.wait();
    until v5 or not v4.Active;
    return v5;
end;