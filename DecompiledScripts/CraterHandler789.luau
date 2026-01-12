local _ = game:GetService("RunService");
local v1 = {};
local _ = require(script:WaitForChild("Modes"));
local l_Styles_0 = require(script:WaitForChild("Styles"));
(function(v4, v5) --[[ Line: 10 ]]
    for _, v7 in ipairs(v5) do
        if not v7:IsA("ModuleScript") and v7 == "string" then
            v4[v7.Name] = v7;
        else
            v4[v7.Name] = require(v7);
        end;
    end;
end)(v1, script:WaitForChild("Presets"):GetChildren());
return {
    new = function(v8, v9, v10) --[[ Line: 26 ]]
        -- upvalues: l_Styles_0 (copy)
        if not v10.PauseThread then
            task.spawn(function() --[[ Line: 29 ]]
                -- upvalues: l_Styles_0 (ref), v8 (copy), v9 (copy), v10 (copy)
                return l_Styles_0[v8] and l_Styles_0[v8](v9, v10 or {});
            end);
            return;
        elseif v10.PauseThread == false then
            task.spawn(function() --[[ Line: 37 ]]
                -- upvalues: l_Styles_0 (ref), v8 (copy), v9 (copy), v10 (copy)
                return l_Styles_0[v8] and l_Styles_0[v8](v9, v10 or {});
            end);
            return;
        else
            return l_Styles_0[v8] and l_Styles_0[v8](v9, v10 or {});
        end;
    end, 
    preset = function(v11, v12, v13) --[[ Line: 46 ]]
        -- upvalues: v1 (copy)
        return v1[v11] and v1[v11](v12, v13 or {});
    end
};