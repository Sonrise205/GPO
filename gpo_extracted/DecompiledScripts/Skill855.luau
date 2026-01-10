local v0 = {};
local v1, _, v3, _, _ = require(game.ReplicatedStorage.Modules.ScriptSet).get();
local v6 = nil;
local _ = {
    slash = false, 
    slices = false, 
    tackle = false, 
    Counter = false
};
local _ = require(game.ReplicatedStorage.Modules.RotatedRegion3);
local _ = require(game.ReplicatedStorage.Modules.Skills);
v0.setup = function(_, v11, v12) --[[ Line: 10 ]] --[[ Name: setup ]]
    -- upvalues: v6 (ref), v1 (copy), v3 (copy)
    if v6 then
        v6:Disconnect();
    end;
    local l_SkillCallback_0 = require(v1.Backpack:WaitForChild("SkillCallbacks")):GetSkillCallback(v12);
    v6 = v3.InputBegan:Connect(function(v14, v15) --[[ Line: 18 ]]
        -- upvalues: v12 (copy), v11 (copy), l_SkillCallback_0 (copy)
        if v12.Parent ~= v11 or _G.canuse == false or v15 == true then
            return;
        elseif v14.KeyCode == Enum.KeyCode.X then
            l_SkillCallback_0["World'sStrongestSlash"](l_SkillCallback_0);
            return;
        elseif v14.KeyCode == Enum.KeyCode.E then
            l_SkillCallback_0:ThousandSlices();
            return;
        elseif v14.KeyCode == Enum.KeyCode.Z then
            l_SkillCallback_0:NightfallRush();
            return;
        else
            if v14.KeyCode == Enum.KeyCode.R then
                l_SkillCallback_0:NightfallCounter();
            end;
            return;
        end;
    end);
    return l_SkillCallback_0;
end;
return v0;