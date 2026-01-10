local v0 = {};
local v1, _, v3, _, _ = require(game.ReplicatedStorage.Modules.ScriptSet).get();
local v6 = nil;
local v7 = {
    slash = false, 
    flash = false, 
    overflow = false, 
    divine = false
};
local _ = require(game.ReplicatedStorage.Modules.RotatedRegion3);
local _ = require(game.ReplicatedStorage.Modules.Skills);
local v10 = nil;
v0.setup = function(_, v12, v13) --[[ Line: 10 ]] --[[ Name: setup ]]
    -- upvalues: v6 (ref), v10 (ref), v7 (copy), v1 (copy), v3 (copy)
    if v6 then
        v6:Disconnect();
        v6 = nil;
    end;
    if v10 ~= v12 then
        for v14, _ in v7 do
            v7[v14] = false;
        end;
    end;
    v10 = v12;
    local l_SkillCallback_0 = require(v1.Backpack:WaitForChild("SkillCallbacks")):GetSkillCallback(v13);
    local _ = game.ReplicatedStorage:FindFirstChild("Stats" .. v1.Name);
    v6 = v3.InputBegan:Connect(function(v18, v19) --[[ Line: 27 ]]
        -- upvalues: v13 (copy), v12 (copy), l_SkillCallback_0 (copy)
        if v13.Parent ~= v12 or _G.canuse == false or v19 == true then
            return;
        elseif v18.KeyCode == Enum.KeyCode.Z then
            l_SkillCallback_0:HakaiSlash();
            return;
        elseif v18.KeyCode == Enum.KeyCode.R then
            l_SkillCallback_0:Hahaba();
            return;
        elseif v18.KeyCode == Enum.KeyCode.E then
            l_SkillCallback_0:MaserRay();
            return;
        else
            if v18.KeyCode == Enum.KeyCode.X then
                l_SkillCallback_0:BlazeEruption();
            end;
            return;
        end;
    end);
    return l_SkillCallback_0;
end;
return v0;