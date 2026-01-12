local l_Modules_0 = game:GetService("ReplicatedStorage"):WaitForChild("Modules");
local l_Trove_0 = require(l_Modules_0:WaitForChild("Trove"));
local function v7(v2, v3) --[[ Line: 5 ]] --[[ Name: AddItem ]]
    -- upvalues: l_Trove_0 (copy)
    v3 = v3 or 0;
    local v4 = l_Trove_0.new();
    if typeof(v2) == "table" then
        for _, v6 in pairs(v2) do
            v4:Add(v6);
        end;
    else
        v4:Add(v2);
    end;
    task.delay(v3, function() --[[ Line: 18 ]]
        -- upvalues: v4 (ref)
        v4:Clean();
        v4 = nil;
    end);
end;
return {
    AddItem = function(_, v9, v10) --[[ Line: 26 ]] --[[ Name: AddItem ]]
        -- upvalues: v7 (copy)
        v7(v9, v10);
    end
};