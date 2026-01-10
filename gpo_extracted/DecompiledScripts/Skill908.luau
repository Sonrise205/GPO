local v0 = {};
local v1, _, v3, _, _ = require(game.ReplicatedStorage.Modules.ScriptSet).get();
local v6 = nil;
local v7 = {
    slash = false, 
    flash = false, 
    overflow = false, 
    divine = false
};
local v8 = require(game.ReplicatedStorage.Modules.RotatedRegion3);
local _ = require(game.ReplicatedStorage.Modules.Skills);
local function _(v10, v11) --[[ Line: 9 ]] --[[ Name: getinregion ]]
    -- upvalues: v8 (copy)
    return (v8.new(v11.CFrame, v11.Size):FindPartsInRegion3WithWhiteList(_G.getTargets(v10, true), 2000));
end;
local function _(v13, v14, v15) --[[ Line: 15 ]] --[[ Name: lerp ]]
    return v13 + (v14 - v13) * v15;
end;
local function _(v17, v18, v19, v20, v21) --[[ Line: 19 ]] --[[ Name: cubicBezierPos ]]
    local v22 = v17 + (v18 - v17) * v21;
    local v23 = v18 + (v19 - v18) * v21;
    local v24 = v19 + (v20 - v19) * v21;
    local v25 = v22 + (v23 - v22) * v21;
    return v25 + (v23 + (v24 - v23) * v21 - v25) * v21;
end;
local v27 = nil;
v0.setup = function(_, v29, v30) --[[ Line: 29 ]] --[[ Name: setup ]]
    -- upvalues: v6 (ref), v27 (ref), v7 (copy), v1 (copy), v3 (copy)
    if v6 then
        v6:Disconnect();
        v6 = nil;
    end;
    if v27 ~= v29 then
        for v31, _ in v7 do
            v7[v31] = false;
        end;
    end;
    v27 = v29;
    local l_SkillCallback_0 = require(v1.Backpack:WaitForChild("SkillCallbacks")):GetSkillCallback(v30);
    local _ = game.ReplicatedStorage:FindFirstChild("Stats" .. v1.Name);
    v6 = v3.InputBegan:Connect(function(v35, v36) --[[ Line: 46 ]]
        -- upvalues: v30 (copy), v29 (copy), l_SkillCallback_0 (copy)
        if v30.Parent ~= v29 or _G.canuse == false or v36 == true then
            return;
        elseif v35.KeyCode == Enum.KeyCode.E then
            l_SkillCallback_0:FinalRetort();
            return;
        elseif v35.KeyCode == Enum.KeyCode.R then
            l_SkillCallback_0:LaughingCounter();
            return;
        elseif v35.KeyCode == Enum.KeyCode.Z then
            l_SkillCallback_0:Overflow();
            return;
        else
            if v35.KeyCode == Enum.KeyCode.X then
                l_SkillCallback_0:DivineDeparture();
            end;
            return;
        end;
    end);
    return l_SkillCallback_0;
end;
return v0;