local v0 = {};
local v1 = {
    WindPower = "number", 
    WindSpeed = "number", 
    WindDirection = "Vector3"
};
v0.new = function(v2, v3) --[[ Line: 9 ]] --[[ Name: new ]]
    -- upvalues: v1 (copy)
    local v4 = table.create(3);
    local l_v2_Attribute_0 = v2:GetAttribute("WindPower");
    local l_v2_Attribute_1 = v2:GetAttribute("WindSpeed");
    local l_v2_Attribute_2 = v2:GetAttribute("WindDirection");
    v4.WindPower = typeof(l_v2_Attribute_0) == v1.WindPower and l_v2_Attribute_0 or v3.WindPower;
    v4.WindSpeed = typeof(l_v2_Attribute_1) == v1.WindSpeed and l_v2_Attribute_1 or v3.WindSpeed;
    v4.WindDirection = typeof(l_v2_Attribute_2) == v1.WindDirection and l_v2_Attribute_2 or v3.WindDirection;
    local v8 = v2:GetAttributeChangedSignal("WindPower"):Connect(function() --[[ Line: 24 ]]
        -- upvalues: l_v2_Attribute_0 (ref), v2 (copy), v4 (copy), v1 (ref), v3 (copy)
        l_v2_Attribute_0 = v2:GetAttribute("WindPower");
        v4.WindPower = typeof(l_v2_Attribute_0) == v1.WindPower and l_v2_Attribute_0 or v3.WindPower;
    end);
    local v9 = v2:GetAttributeChangedSignal("WindSpeed"):Connect(function() --[[ Line: 29 ]]
        -- upvalues: l_v2_Attribute_1 (ref), v2 (copy), v4 (copy), v1 (ref), v3 (copy)
        l_v2_Attribute_1 = v2:GetAttribute("WindSpeed");
        v4.WindSpeed = typeof(l_v2_Attribute_1) == v1.WindSpeed and l_v2_Attribute_1 or v3.WindSpeed;
    end);
    local v10 = v2:GetAttributeChangedSignal("WindDirection"):Connect(function() --[[ Line: 34 ]]
        -- upvalues: l_v2_Attribute_2 (ref), v2 (copy), v4 (copy), v1 (ref), v3 (copy)
        l_v2_Attribute_2 = v2:GetAttribute("WindDirection");
        v4.WindDirection = typeof(l_v2_Attribute_2) == v1.WindDirection and l_v2_Attribute_2 or v3.WindDirection;
    end);
    v4.Destroy = function(_) --[[ Line: 41 ]] --[[ Name: Destroy ]]
        -- upvalues: v8 (copy), v9 (copy), v10 (copy), v4 (copy)
        v8:Disconnect();
        v9:Disconnect();
        v10:Disconnect();
        table.clear(v4);
    end;
    return v4;
end;
return v0;