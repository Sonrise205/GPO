local l_Modules_0 = game:GetService("ReplicatedStorage").Modules;
local v1 = require(l_Modules_0.ContextActionService);
local v2 = {};
v2.__index = v2;
v2._createButton = function(v3, v4) --[[ Line: 13 ]] --[[ Name: _createButton ]]
    -- upvalues: v1 (copy)
    local l_ButtonData_0 = v4.ButtonData;
    local l_Name_0 = v4.Name;
    local l_Title_0 = v4.Title;
    local l_Texture_0 = v4.Texture;
    local l_Button_0 = v4.Button;
    local _, _, _ = v1:GetMobileUI();
    local l_JumpButtonSize_0 = v1.JumpButtonSize;
    local l_SizeRatio_0 = l_ButtonData_0.SizeRatio;
    return (v1:CreateButton({
        Button = l_Button_0, 
        Name = l_Name_0, 
        Title = l_Title_0 or l_Name_0, 
        Texture = l_Texture_0, 
        Callbacks = {
            InputBegan = function() --[[ Line: 24 ]] --[[ Name: Activated ]]
                -- upvalues: v3 (copy)
                if not v3.Activated then
                    return;
                else
                    v3:Activated();
                    return;
                end;
            end, 
            InputEnded = function() --[[ Line: 29 ]] --[[ Name: Deactivated ]]
                -- upvalues: v3 (copy)
                if not v3.Deactivated then
                    return;
                else
                    v3:Deactivated();
                    return;
                end;
            end
        }, 
        Position = UDim2.fromOffset(l_ButtonData_0.X, l_ButtonData_0.Y), 
        Size = UDim2.fromOffset(l_JumpButtonSize_0.X * l_SizeRatio_0.X, l_JumpButtonSize_0.Y * l_SizeRatio_0.Y), 
        SizeRatio = l_SizeRatio_0, 
        AutoScaling = true
    }));
end;
return v2;