local l_Client_0 = game:GetService("ReplicatedStorage").Modules.Client;
local l_UIUtils_0 = require(l_Client_0:WaitForChild("UIUtils"));
local v2 = {};
v2.__index = v2;
v2.new = function(v3, v4) --[[ Line: 11 ]] --[[ Name: new ]]
    -- upvalues: v2 (copy), l_UIUtils_0 (copy)
    local v5 = setmetatable({}, v2);
    v5.CrewsUI = v3;
    v5.Button = v4;
    local function v6() --[[ Line: 18 ]] --[[ Name: OnEntered ]]

    end;
    local function v7() --[[ Line: 22 ]] --[[ Name: OnLeave ]]
        -- upvalues: v5 (copy), v3 (copy)
        if v5.Button == v3:GetSelectedButton() then
            return;
        else
            return;
        end;
    end;
    v4.MouseEnter:Connect(v6);
    v4.MouseLeave:Connect(v7);
    v4.SelectionGained:Connect(v6);
    v4.SelectionLost:Connect(v7);
    v4.MouseButton1Click:Connect(function() --[[ Line: 35 ]]
        -- upvalues: l_UIUtils_0 (ref), v4 (copy), v5 (copy)
        l_UIUtils_0.ButtonEffect();
        if v4.BackgroundTransparency ~= 0 then
            return;
        else
            v5:Pressed();
            return;
        end;
    end);
    return v5;
end;
v2.EnableButton = function(v8) --[[ Line: 46 ]] --[[ Name: EnableButton ]]
    v8.Button.BackgroundTransparency = 0;
    v8.Button.Text.TextTransparency = 0;
end;
v2.DisableButton = function(v9) --[[ Line: 51 ]] --[[ Name: DisableButton ]]
    v9.Button.BackgroundTransparency = 0.8;
    v9.Button.Text.TextTransparency = 0.8;
end;
v2.Pressed = function(v10) --[[ Line: 56 ]] --[[ Name: Pressed ]]
    local l_SelectedButton_0 = v10.CrewsUI:GetSelectedButton();
    if (not l_SelectedButton_0 or l_SelectedButton_0 == v10.Button) and l_SelectedButton_0 and l_SelectedButton_0 == v10.Button then
        return;
    else
        v10.CrewsUI:OpenFrame(v10.Button.Name);
        v10.CrewsUI:SelectButton(v10.Button);
        return;
    end;
end;
return v2;