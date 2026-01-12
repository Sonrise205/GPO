local v0 = {};
local v1 = require(game.ReplicatedStorage.Modules.SwordHandle.SwordInfo);
local v2 = require(game.ReplicatedStorage.Modules.Skills);
v0.swap = function(_, v4) --[[ Line: 5 ]] --[[ Name: swap ]]
    -- upvalues: v2 (copy), v1 (copy)
    local l_LocalPlayer_0 = game.Players.LocalPlayer;
    local l_Cooldowns_0 = v4.Cooldowns;
    local l_Character_0 = l_LocalPlayer_0.Character;
    local _ = game.ReplicatedStorage["Stats" .. l_LocalPlayer_0.Name];
    if l_Cooldowns_0.SwordStyleSwap == nil then
        l_Cooldowns_0.SwordStyleSwap = false;
    end;
    local l_l_Character_0_Attribute_0 = l_Character_0:GetAttribute("currentSwordStyle");
    if l_l_Character_0_Attribute_0 == nil then
        l_l_Character_0_Attribute_0 = 3;
    end;
    if l_Cooldowns_0.SwordStyleSwap == false and _G.canuse == true then
        local v10 = v2.GetM("Sword Style Swap");
        local l_cd_0 = v10.cd;
        if _G.StamCheck("Sword Style Swap") == false then
            return;
        elseif v10.statreq and _G.MeetReq(v10.statreq) == false then
            return;
        else
            l_Cooldowns_0.SwordStyleSwap = true;
            local v12 = l_l_Character_0_Attribute_0 + 1;
            if v12 > 3 then
                v12 = 1;
            end;
            l_Character_0:SetAttribute("currentSwordStyle", v12);
            script[v12 .. "SS"]:Play();
            _G.keysetup:Destroy();
            local v13 = nil;
            v13 = if v1[v12 .. "SS"] then v1[v12 .. "SS"] else v1.Katana;
            _G.keysetup:setup(v12 .. "SS", v13.keys);
            l_l_Character_0_Attribute_0 = v12;
            _G.fw(l_cd_0);
            l_Cooldowns_0.SwordStyleSwap = false;
        end;
    end;
end;
v0.matchCooldowns = function(_, v15) --[[ Line: 53 ]] --[[ Name: matchCooldowns ]]
    -- upvalues: v1 (copy), v2 (copy)
    local l_LocalPlayer_1 = game.Players.LocalPlayer;
    local l_SkillCallbacks_0 = require(l_LocalPlayer_1.Backpack:WaitForChild("SkillCallbacks"));
    local v18 = {
        "1SS", 
        "2SS", 
        "3SS"
    };
    local v19 = {};
    local v20 = {};
    local function v25(v21) --[[ Line: 62 ]] --[[ Name: getKeyfromSkill ]]
        -- upvalues: v20 (copy), v1 (ref)
        if v20[v21] then
            return v20[v21];
        else
            for _, v23 in pairs(v1) do
                if v23.keys then
                    for v24 = 1, #v23.keys do
                        if v23.keys[v24][1] == v21 then
                            v20[v21] = v23.keys[v24][2];
                            return v20[v21];
                        end;
                    end;
                end;
            end;
            return;
        end;
    end;
    local function v34(v26, v27, v28) --[[ Line: 79 ]] --[[ Name: cooldownKey ]]
        -- upvalues: v19 (copy), v25 (copy)
        for v29, v30 in pairs(v19) do
            local l_Cooldowns_1 = v30.Cooldowns;
            for v32, v33 in pairs(l_Cooldowns_1) do
                if v25(v32) == v26 and v33 == false and v32 ~= v28 then
                    v19[v29].Cooldowns[v32] = true;
                    _G.keysetup:cooldown(v32, v27);
                    task.delay(v27, function() --[[ Line: 88 ]]
                        -- upvalues: v19 (ref), v29 (copy), v32 (copy)
                        v19[v29].Cooldowns[v32] = false;
                    end);
                end;
            end;
        end;
    end;
    for v35 = 1, #v18 do
        v19[v18[v35]] = l_SkillCallbacks_0:GetSkillCallback(v18[v35]);
    end;
    (function(v36) --[[ Line: 101 ]] --[[ Name: matchCooldowns ]]
        -- upvalues: v25 (copy), v2 (ref), v34 (copy)
        for v37, v38 in pairs(v36) do
            if v38 ~= false then
                local v39 = v25(v37);
                local v40 = v2.GetM(v37);
                if v40 ~= nil then
                    local l_cd_1 = v40.cd;
                    v34(v39, l_cd_1, v37);
                end;
            end;
        end;
    end)(v15);
end;
return v0;