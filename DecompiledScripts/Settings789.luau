local v0 = {};
local v1 = {
    WindPower = "number", 
    WindSpeed = "number", 
    WindDirection = "Vector3", 
    PivotOffset = "CFrame"
};
v0.new = function(v2) --[[ Line: 10 ]] --[[ Name: new ]]
    -- upvalues: v1 (copy)
    local v3 = {};
    local l_v2_Attribute_0 = v2:GetAttribute("WindPower");
    local l_v2_Attribute_1 = v2:GetAttribute("WindSpeed");
    local l_v2_Attribute_2 = v2:GetAttribute("WindDirection");
    v3.WindPower = if typeof(l_v2_Attribute_0) == v1.WindPower then l_v2_Attribute_0 else nil;
    v3.WindSpeed = if typeof(l_v2_Attribute_1) == v1.WindSpeed then l_v2_Attribute_1 else nil;
    v3.WindDirection = if typeof(l_v2_Attribute_2) == v1.WindDirection then if l_v2_Attribute_2.Magnitude > 0 then l_v2_Attribute_2.Unit else Vector3.new(0, 0, 0, 0) else nil;
    v3.PivotOffset = if v2:IsA("BasePart") then v2.PivotOffset else nil;
    v3.PivotOffsetInverse = if typeof(v3.PivotOffset) == "CFrame" then v3.PivotOffset:Inverse() else nil;
    local v7 = v2:GetAttributeChangedSignal("WindPower"):Connect(function() --[[ Line: 30 ]]
        -- upvalues: l_v2_Attribute_0 (ref), v2 (copy), v3 (copy), v1 (ref)
        l_v2_Attribute_0 = v2:GetAttribute("WindPower");
        v3.WindPower = if typeof(l_v2_Attribute_0) == v1.WindPower then l_v2_Attribute_0 else nil;
    end);
    local v8 = v2:GetAttributeChangedSignal("WindSpeed"):Connect(function() --[[ Line: 35 ]]
        -- upvalues: l_v2_Attribute_1 (ref), v2 (copy), v3 (copy), v1 (ref)
        l_v2_Attribute_1 = v2:GetAttribute("WindSpeed");
        v3.WindSpeed = if typeof(l_v2_Attribute_1) == v1.WindSpeed then l_v2_Attribute_1 else nil;
    end);
    local v9 = v2:GetAttributeChangedSignal("WindDirection"):Connect(function() --[[ Line: 40 ]]
        -- upvalues: l_v2_Attribute_2 (ref), v2 (copy), v3 (copy), v1 (ref)
        l_v2_Attribute_2 = v2:GetAttribute("WindDirection");
        v3.WindDirection = if typeof(l_v2_Attribute_2) == v1.WindDirection then if l_v2_Attribute_2.Magnitude > 0 then l_v2_Attribute_2.Unit else Vector3.new(0, 0, 0, 0) else nil;
    end);
    local v10 = nil;
    if v2:IsA("BasePart") then
        v10 = v2:GetPropertyChangedSignal("PivotOffset"):Connect(function() --[[ Line: 49 ]]
            -- upvalues: v3 (copy), v2 (copy)
            v3.PivotOffset = v2.PivotOffset;
            v3.PivotOffsetInverse = v3.PivotOffset:Inverse();
        end);
    end;
    v3.Destroy = function(_) --[[ Line: 57 ]] --[[ Name: Destroy ]]
        -- upvalues: v7 (copy), v8 (copy), v9 (copy), v10 (ref), v3 (copy)
        v7:Disconnect();
        v8:Disconnect();
        v9:Disconnect();
        if v10 then
            v10:Disconnect();
        end;
        table.clear(v3);
    end;
    return v3;
end;
return v0;