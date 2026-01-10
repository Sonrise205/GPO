local l_Parent_0 = script.Parent.Parent;
local l_Config_0 = require(l_Parent_0:WaitForChild("Config"));
local l_Gizmo_0 = require(script:WaitForChild("Gizmo"));
local v3 = game:GetService("RunService"):IsStudio() or l_Config_0.ALLOW_LIVE_GAME_DEBUG;
if v3 then
    l_Gizmo_0.Init();
end;
local v6 = setmetatable({}, {
    __index = function(_, v5) --[[ Line: 21 ]] --[[ Name: __index ]]
        -- upvalues: v3 (copy), l_Gizmo_0 (copy)
        if v3 then
            return l_Gizmo_0[v5];
        elseif ({
            SetStyle = true, 
            AddDebrisInSeconds = true, 
            PushProperty = true, 
            PopProperty = true, 
            AddDebrisInFrames = true, 
            SetEnabled = true, 
            DoCleaning = true, 
            ScheduleCleaning = true, 
            TweenProperties = true
        })[v5] then
            return function() --[[ Line: 38 ]]

            end;
        else
            return {
                Draw = function() --[[ Line: 42 ]] --[[ Name: Draw ]]

                end, 
                Create = function() --[[ Line: 43 ]] --[[ Name: Create ]]

                end
            };
        end;
    end
});
return table.freeze(v6);