local l_RunService_0 = game:GetService("RunService");
return {
    WaitForAttribute = function(_, v2, v3, v4) --[[ Line: 5 ]] --[[ Name: WaitForAttribute ]]
        -- upvalues: l_RunService_0 (copy)
        v4 = v4 or 60;
        local v5 = tick();
        local l_v2_Attribute_0 = v2:GetAttribute(v3);
        while true do
            if v4 <= tick() - v5 then
                warn("Infinite yield waiting for \"" .. v3 .. " on " .. v2:GetFullName());
                return l_v2_Attribute_0;
            else
                l_v2_Attribute_0 = v2:GetAttribute(v3);
                l_RunService_0.Heartbeat:Wait();
                if l_v2_Attribute_0 ~= nil then
                    return l_v2_Attribute_0;
                end;
            end;
        end;
    end
};