local l_HttpService_0 = game:GetService("HttpService");
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local _ = game:GetService("Players");
local l_UserInputService_0 = game:GetService("UserInputService");
local v5 = {
    GetStatsFolder = function(v4) --[[ Line: 9 ]] --[[ Name: GetStatsFolder ]]
        -- upvalues: l_ReplicatedStorage_0 (copy)
        if typeof(v4) == "Instance" and v4:IsA("Player") then
            return l_ReplicatedStorage_0:FindFirstChild("Stats" .. v4.Name);
        else
            return l_ReplicatedStorage_0:FindFirstChild("Stats" .. v4);
        end;
    end
};
v5.PlayerHasItem = function(v6, v7) --[[ Line: 18 ]] --[[ Name: PlayerHasItem ]]
    -- upvalues: v5 (copy), l_HttpService_0 (copy)
    local v8 = v5.GetStatsFolder(v6);
    if v8 == nil then
        warn("Failed to get inventory for ", v6);
        return nil;
    else
        local l_Inventory_0 = v8.Inventory.Inventory;
        if l_HttpService_0:JSONDecode(l_Inventory_0.Value)[v7] then
            return true;
        else
            return false;
        end;
    end;
end;
v5.CheckItemAmount = function(v10, v11) --[[ Line: 48 ]] --[[ Name: CheckItemAmount ]]
    -- upvalues: v5 (copy), l_HttpService_0 (copy)
    local v12 = v5.GetStatsFolder(v10);
    if v12 == nil then
        warn("Failed to get inventory for ", v10);
        return 0;
    else
        local l_Inventory_1 = v12.Inventory.Inventory;
        local v14 = l_HttpService_0:JSONDecode(l_Inventory_1.Value)[v11];
        if v14 then
            return v14;
        else
            return 0;
        end;
    end;
end;
v5.CheckUltDamage = function(v15) --[[ Line: 79 ]] --[[ Name: CheckUltDamage ]]
    -- upvalues: l_ReplicatedStorage_0 (copy), v5 (copy)
    if l_ReplicatedStorage_0.reservedCode.Value == "arena" then
        return math.clamp(1000 - v5.GetStatsFolder(v15).Stats.Defense.Value, 0, 10000) + 1200;
    else
        return;
    end;
end;
v5.GetInputType = function() --[[ Line: 86 ]] --[[ Name: GetInputType ]]
    -- upvalues: l_UserInputService_0 (copy)
    if l_UserInputService_0.TouchEnabled and not l_UserInputService_0.KeyboardEnabled and not l_UserInputService_0.MouseEnabled and not l_UserInputService_0.GamepadEnabled then
        return "Mobile";
    elseif not l_UserInputService_0.TouchEnabled and l_UserInputService_0.KeyboardEnabled and l_UserInputService_0.MouseEnabled and not l_UserInputService_0.GamepadEnabled then
        return "PC";
    elseif game:GetService("GuiService"):IsTenFootInterface() == true then
        return "Console";
    else
        return "PC";
    end;
end;
return v5;