local l_BounceTemplate_0 = script.Parent.BounceTemplate;
local v2 = {
    isBounceTemplate = function(v1) --[[ Line: 12 ]] --[[ Name: isBounceTemplate ]]
        return v1:GetAttribute("IsBounceTemplate", true) == true;
    end
};
v2.getTarget = function(v3) --[[ Line: 16 ]] --[[ Name: getTarget ]]
    -- upvalues: v2 (copy)
    if not v2.isBounceTemplate(v3) then
        return nil;
    elseif v3:IsA("ObjectValue") then
        return v3.Value;
    else
        local l_BounceTarget_0 = v3:FindFirstChild("BounceTarget");
        if l_BounceTarget_0 then
            return l_BounceTarget_0.Value;
        else
            warn("[BounceTemplateUtils.getTarget] - Bounce template without BounceTarget");
            return nil;
        end;
    end;
end;
v2.create = function(v5, v6) --[[ Line: 34 ]] --[[ Name: create ]]
    -- upvalues: l_BounceTemplate_0 (copy)
    assert(typeof(v5) == "Instance", "Bad target");
    assert(type(v6) == "string", "Bad linkName");
    local v7 = l_BounceTemplate_0:Clone();
    v7:SetAttribute("IsBounceTemplate", true);
    v7.Name = v6;
    local l_ObjectValue_0 = Instance.new("ObjectValue");
    l_ObjectValue_0.Name = "BounceTarget";
    l_ObjectValue_0.Value = v5;
    l_ObjectValue_0.Parent = v7;
    return v7;
end;
v2.createLink = function(v9, v10) --[[ Line: 54 ]] --[[ Name: createLink ]]
    assert(typeof(v9) == "Instance", "Bad target");
    assert(type(v10) == "string", "Bad linkName");
    local l_ObjectValue_1 = Instance.new("ObjectValue");
    l_ObjectValue_1.Name = v10;
    l_ObjectValue_1.Value = v9;
    l_ObjectValue_1:SetAttribute("IsBounceTemplate", true);
    return l_ObjectValue_1;
end;
return v2;