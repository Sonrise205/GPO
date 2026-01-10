local _ = game:GetService("Workspace");
local l_InsertService_0 = game:GetService("InsertService");
local l_Promises_0 = script.Parent.Parent.Promises;
local v3 = require(l_Promises_0.Promise);
local v11 = {
    PromiseAsset = function(v4) --[[ Line: 12 ]] --[[ Name: PromiseAsset ]]
        -- upvalues: v3 (copy), l_InsertService_0 (copy)
        assert(type(v4) == "number", "Must be a number! Received: " .. (v4 or "nil"));
        if v4 == 0 then
            v3.rejected("Invalid Accessory");
            return;
        else
            return v3.spawn(function(v5, v6) --[[ Line: 20 ]]
                -- upvalues: l_InsertService_0 (ref), v4 (copy)
                local v7 = nil;
                local l_status_0, l_result_0 = pcall(function() --[[ Line: 22 ]]
                    -- upvalues: v7 (ref), l_InsertService_0 (ref), v4 (ref)
                    v7 = l_InsertService_0:LoadAsset(v4);
                    if typeof(v7) == "Instance" then
                        local l_v7_0 = v7;
                        v7 = l_v7_0:GetChildren()[1];
                        v7.Parent = game.ServerStorage;
                        l_v7_0:Destroy();
                    end;
                end);
                if not l_status_0 then
                    v6(l_result_0);
                end;
                if typeof(v7) ~= "Instance" then
                    v6("Result was not an instance");
                end;
                v5(v7);
            end);
        end;
    end
};
v11.LoadModel = function(_, v13) --[[ Line: 44 ]] --[[ Name: LoadModel ]]
    -- upvalues: v11 (copy)
    local v14 = v11.PromiseAsset(v13);
    v14:Yield();
    local l_v14_Results_0, v16 = v14:GetResults();
    if not l_v14_Results_0 then
        task.wait(1);
        return v11:LoadModel(v13);
    else
        return v16;
    end;
end;
return v11;