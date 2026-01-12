local l_Debris_0 = game:GetService("Debris");
local l_TweenService_0 = game:GetService("TweenService");
return function(v2, v3, v4) --[[ Line: 4 ]]
    -- upvalues: l_Debris_0 (copy), l_TweenService_0 (copy)
    local v5 = Instance.new("Model", workspace.Effects);
    v2.Parent = v5;
    l_Debris_0:AddItem(v5, 5);
    local v6 = Instance.new("NumberValue", v5);
    v6:GetPropertyChangedSignal("Value"):Connect(function() --[[ Line: 11 ]]
        -- upvalues: v5 (copy), v6 (copy)
        v5:ScaleTo(v6.Value);
    end);
    l_TweenService_0:Create(v6, v3, {
        Value = v4
    }):Play();
end;