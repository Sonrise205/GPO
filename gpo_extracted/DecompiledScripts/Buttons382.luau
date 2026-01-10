local l_RunService_0 = game:GetService("RunService");
local v1 = {};
v1.Initialize = function(_, v3) --[[ Line: 5 ]] --[[ Name: Initialize ]]
    -- upvalues: v1 (copy), l_RunService_0 (copy)
    local v4 = {};
    for _, v6 in script:GetChildren() do
        local l_Name_0 = v6.Name;
        if l_Name_0 ~= "Shared" then
            v1[l_Name_0] = require(v6).new(v3);
            table.insert(v4, v1[l_Name_0]);
        end;
    end;
    l_RunService_0.Heartbeat:Connect(function() --[[ Line: 15 ]] --[[ Name: Update ]]
        -- upvalues: v4 (copy)
        for _, v9 in v4 do
            local l_Update_0 = v9.Update;
            local l_Character_0 = game.Players.LocalPlayer.Character;
            if l_Character_0 ~= nil and (not l_Character_0 or l_Character_0.PrimaryPart ~= nil) and l_Update_0 then
                l_Update_0(v9);
            end;
        end;
    end);
end;
return v1;