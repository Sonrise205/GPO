local v0 = {};
local v1, _, v3, _, _ = require(game.ReplicatedStorage.Modules.ScriptSet).get();
local v6 = nil;
local v7 = {
    spin = false, 
    sweep = false, 
    counter = false, 
    trans = false
};
local _ = require(game.ReplicatedStorage.Modules.RotatedRegion3);
local _ = require(game.ReplicatedStorage.Modules.Skills);
local v10 = nil;
local v11 = nil;
v0.setup = function(_, v13, v14, _) --[[ Line: 12 ]] --[[ Name: setup ]]
    -- upvalues: v6 (ref), v11 (ref), v7 (copy), v10 (ref), v1 (copy), v3 (copy)
    if v6 then
        v6:Disconnect();
    end;
    if v11 ~= v13 then
        for v16, _ in v7 do
            v7[v16] = false;
        end;
        v10 = nil;
    end;
    v11 = v13;
    local _ = game.ReplicatedStorage:FindFirstChild("Stats" .. v1.Name);
    local l_SkillCallback_0 = require(v1.Backpack:WaitForChild("SkillCallbacks")):GetSkillCallback(v14);
    v6 = v3.InputBegan:Connect(function(v20, v21) --[[ Line: 28 ]]
        -- upvalues: v14 (copy), v13 (copy), l_SkillCallback_0 (copy)
        if v14.Parent ~= v13 or _G.canuse == false or v21 == true then
            return;
        elseif v20.KeyCode == Enum.KeyCode.E then
            l_SkillCallback_0:RapidThrust();
            return;
        elseif v20.KeyCode == Enum.KeyCode.R then
            l_SkillCallback_0:GoldenSweep();
            return;
        elseif v20.KeyCode == Enum.KeyCode.Z then
            l_SkillCallback_0:PoleCounter();
            return;
        else
            if v20.KeyCode == Enum.KeyCode.X then
                l_SkillCallback_0:GoldenStaffTransform();
            end;
            return;
        end;
    end);
    return weaponCallbacks;
end;
return v0;