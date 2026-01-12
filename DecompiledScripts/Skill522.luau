local v0 = {};
local v1, _, v3, _, _ = require(game.ReplicatedStorage.Modules.ScriptSet).get();
local v6 = nil;
local _ = require(game.ReplicatedStorage.Modules.RotatedRegion3);
local _ = require(game.ReplicatedStorage.Modules.Skills);
v0.setup = function(_, v10, v11) --[[ Line: 10 ]] --[[ Name: setup ]]
    -- upvalues: v6 (ref), v1 (copy), v3 (copy)
    if v6 then
        v6:Disconnect();
    end;
    local _ = game.ReplicatedStorage:FindFirstChild("Stats" .. v1.Name);
    local l_SkillCallback_0 = require(v1.Backpack:WaitForChild("SkillCallbacks")):GetSkillCallback(v11);
    v6 = v3.InputBegan:Connect(function(v14, v15) --[[ Line: 20 ]]
        -- upvalues: v11 (copy), v10 (copy), l_SkillCallback_0 (copy)
        if v11.Parent ~= v10 or _G.canuse == false or v15 == true then
            return;
        elseif v14.KeyCode == Enum.KeyCode.R then
            l_SkillCallback_0:FrostBlast();
            return;
        else
            if v14.KeyCode == Enum.KeyCode.E then
                l_SkillCallback_0.FrostBullets(l_SkillCallback_0);
            end;
            return;
        end;
    end);
    return l_SkillCallback_0;
end;
return v0;