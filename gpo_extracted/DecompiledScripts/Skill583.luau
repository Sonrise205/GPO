local v0 = {};
local v1, _, v3, _, _ = require(game.ReplicatedStorage.Modules.ScriptSet).get();
local v6 = nil;
local _ = {
    spin = false, 
    beat = false
};
local _ = require(game.ReplicatedStorage.Modules.RotatedRegion3);
local _ = require(game.ReplicatedStorage.Modules.Skills);
v0.setup = function(_, v11, v12, _) --[[ Line: 13 ]] --[[ Name: setup ]]
    -- upvalues: v6 (ref), v1 (copy), v3 (copy)
    if v6 then
        v6:Disconnect();
    end;
    local _ = game.ReplicatedStorage:FindFirstChild("Stats" .. v1.Name);
    local l_SkillCallback_0 = require(v1.Backpack:WaitForChild("SkillCallbacks")):GetSkillCallback(v12);
    v6 = v3.InputBegan:Connect(function(v16, v17) --[[ Line: 23 ]]
        -- upvalues: v12 (copy), v11 (copy), l_SkillCallback_0 (copy)
        if v12.Parent ~= v11 or _G.canuse == false or v17 == true then
            return;
        elseif v16.KeyCode == Enum.KeyCode.E then
            l_SkillCallback_0:PipeRush();
            return;
        else
            if v16.KeyCode == Enum.KeyCode.R then
                l_SkillCallback_0:PipeBeatdown();
            end;
            return;
        end;
    end);
    return l_SkillCallback_0;
end;
return v0;