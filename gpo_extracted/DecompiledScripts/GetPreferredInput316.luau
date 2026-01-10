local l_UserInputService_0 = game:GetService("UserInputService");
local l_Touch_0 = Enum.UserInputType.Touch;
local l_Keyboard_0 = Enum.UserInputType.Keyboard;
local v3 = nil;
local v4 = {};
local function v9(v5) --[[ Line: 17 ]] --[[ Name: SetPreferred ]]
    -- upvalues: v3 (ref), v4 (copy)
    local v6 = game:GetService("GuiService"):IsTenFootInterface();
    if v6 == true then
        game.ReplicatedStorage.Events.updateDeviceInput:FireServer("Controller");
    end;
    if v5 == v3.Current then
        return;
    else
        v3.Current = v5;
        for _, v8 in ipairs(v4) do
            task.spawn(v8, v5);
        end;
        if v6 == false then
            game.ReplicatedStorage.Events.updateDeviceInput:FireServer(v5);
        end;
        return;
    end;
end;
local function v11(v10) --[[ Line: 37 ]] --[[ Name: DeterminePreferred ]]
    -- upvalues: l_Keyboard_0 (copy), v9 (copy), l_Touch_0 (copy)
    if v10 == l_Keyboard_0 or v10.Name:sub(1, 5) == "Mouse" then
        v9("KeyboardMouse");
        _G.mobile = false;
        return;
    elseif v10 == l_Touch_0 then
        v9("Mobile");
        _G.mobile = true;
        return;
    else
        if v10.Name:sub(1, 7) == "Gamepad" then
            v9("Controller");
            _G.mobile = false;
        end;
        return;
    end;
end;
v3 = {
    Current = "KeyboardMouse", 
    Observe = function(v12) --[[ Line: 54 ]] --[[ Name: Observe ]]
        -- upvalues: v4 (copy), v3 (ref)
        if table.find(v4, v12) then
            error("function already subscribed", 2);
        end;
        table.insert(v4, v12);
        task.spawn(v12, v3.Current);
        return function() --[[ Line: 62 ]]
            -- upvalues: v4 (ref), v12 (copy)
            local v13 = table.find(v4, v12);
            if v13 then
                local v14 = #v4;
                local l_v4_0 = v4;
                local l_v4_1 = v4;
                local v17 = v4[v14];
                local v18 = nil;
                l_v4_0[v13] = v17;
                l_v4_1[v14] = v18;
            end;
        end;
    end, 
    Update = function() --[[ Line: 71 ]] --[[ Name: Update ]]
        -- upvalues: v11 (copy), l_UserInputService_0 (copy)
        v11(l_UserInputService_0:GetLastInputType());
    end
};
game.ReplicatedStorage.Events.updateDeviceInput:FireServer("KeyboardMouse");
v11(l_UserInputService_0:GetLastInputType());
l_UserInputService_0.LastInputTypeChanged:Connect(v11);
return v3;