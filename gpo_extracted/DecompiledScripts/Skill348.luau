local v0 = {};
local v1, _, v3, _, _ = require(game.ReplicatedStorage.Modules.ScriptSet).get();
local v6 = nil;
local _ = {
    rash = false, 
    pound = false, 
    wheel = false, 
    climb = false, 
    strike = false
};
local _ = require(game.ReplicatedStorage.Modules.RotatedRegion3);
local _ = require(game.ReplicatedStorage.Modules.Skills);
local _ = require(game.ReplicatedStorage.Modules.sBeat);
local function v14() --[[ Line: 12 ]] --[[ Name: getTools ]]
    -- upvalues: v1 (copy)
    local v11 = nil;
    local l_Children_0 = v1.Backpack:GetChildren();
    for v13 = 1, #l_Children_0 do
        if l_Children_0[v13]:IsA("Tool") and l_Children_0[v13]:FindFirstChild("SwordEquip") and l_Children_0[v13].Name ~= "2SS" then
            return l_Children_0[v13].Name;
        end;
    end;
    return v11;
end;
v0.setup = function(_, v16, v17) --[[ Line: 25 ]] --[[ Name: setup ]]
    -- upvalues: v6 (ref), v1 (copy), v3 (copy), v14 (copy)
    if v6 then
        v6:Disconnect();
        v6 = nil;
    end;
    local l_FirstChild_0 = game.ReplicatedStorage:FindFirstChild("Stats" .. v1.Name);
    local l_SkillCallback_0 = require(v1.Backpack:WaitForChild("SkillCallbacks")):GetSkillCallback(v17);
    v6 = v3.InputBegan:Connect(function(v20, v21) --[[ Line: 35 ]]
        -- upvalues: v17 (copy), v16 (copy), l_FirstChild_0 (copy), v14 (ref), l_SkillCallback_0 (copy)
        if v17.Parent ~= v16 or _G.canuse == false or v21 == true then
            return;
        elseif l_FirstChild_0.Stats.FightingStyle.Value ~= "2SS" then
            return;
        elseif v14() ~= nil then
            return;
        elseif v20.KeyCode == Enum.KeyCode.E then
            l_SkillCallback_0["72CaliberPhoenix"](l_SkillCallback_0);
            return;
        elseif v20.KeyCode == Enum.KeyCode.R then
            l_SkillCallback_0:RagingWhirl();
            return;
        elseif v20.KeyCode == Enum.KeyCode.Z then
            l_SkillCallback_0:TowerClimb();
            return;
        elseif v20.KeyCode == Enum.KeyCode.X then
            l_SkillCallback_0:NitoryuStrike();
            return;
        else
            if v20.KeyCode == Enum.KeyCode.C then
                l_SkillCallback_0:RashomonDraw();
            end;
            return;
        end;
    end);
    return l_SkillCallback_0;
end;
return v0;