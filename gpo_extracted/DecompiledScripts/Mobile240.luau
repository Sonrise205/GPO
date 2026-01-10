local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local _ = game:GetService("Players");
local l_Modules_0 = l_ReplicatedStorage_0.Modules;
local l_GetButtons_0 = l_ReplicatedStorage_0.Events.GetButtons;
local l_CurrentCamera_0 = workspace.CurrentCamera;
local v5 = require(l_Modules_0.ContextActionService);
local v7 = {
    EditMode = require(script.EditMode), 
    Buttons = require(script.Buttons), 
    _getViewportSize = function(_) --[[ Line: 20 ]] --[[ Name: _getViewportSize ]]
        -- upvalues: l_CurrentCamera_0 (copy)
        while l_CurrentCamera_0.ViewportSize == Vector2.one do
            l_CurrentCamera_0:GetPropertyChangedSignal("ViewportSize"):Wait();
        end;
        return l_CurrentCamera_0.ViewportSize;
    end
};
v7.Initialize = function(v8) --[[ Line: 29 ]] --[[ Name: Initialize ]]
    -- upvalues: v5 (copy), v7 (copy), l_GetButtons_0 (copy)
    local _, _, v11 = v5:GetMobileUI();
    v7.SavedButtons = l_GetButtons_0:InvokeServer({
        Increments = v7.EditMode.Increment, 
        ViewportSize = v8:_getViewportSize(), 
        JumpButtonSize = v11.AbsoluteSize
    });
    v7.EditMode:Initialize(v8);
    v7.Buttons:Initialize(v8);
    warn("Mobile");
end;
return v7;