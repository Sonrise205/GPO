local v0 = {};
local l_LocalPlayer_0 = game.Players.LocalPlayer;
local l_FirstChild_0 = game.ReplicatedStorage:FindFirstChild("Stats" .. l_LocalPlayer_0.Name);
local v3 = require(game.ReplicatedStorage.Modules.Skills);
local _ = game:GetService("UserInputService");
local _ = require(game.ReplicatedStorage.Modules.FastWait);
local v6 = {
    ["Bomb-Bomb"] = true
};
v0.dash = function(_, v8) --[[ Line: 8 ]] --[[ Name: dash ]]
    -- upvalues: l_LocalPlayer_0 (copy), l_FirstChild_0 (copy), v3 (copy), v6 (copy)
    local l_Character_0 = l_LocalPlayer_0.Character;
    local v10 = "Regular";
    if l_Character_0:GetAttribute("flyMode") then
        return false;
    else
        if l_Character_0:GetAttribute("sulongTransformed") ~= nil then
            v10 = "Moonlit Electro";
        end;
        if l_FirstChild_0.Stats.FightingStyle.Value == "Rokushiki" then
            v10 = _G.MeetReq(v3.GetM("Soru").statreq, nil, true) == false and "Regular" or "Soru";
        end;
        if l_FirstChild_0.Stats.FightingStyle.Value == "Kamishiki" then
            v10 = "Soru";
        end;
        if l_Character_0:GetAttribute("GEAR2Active") ~= nil then
            v10 = "Soru";
        end;
        local v11 = false;
        if script:FindFirstChild(l_FirstChild_0.Stats.DF.Value) then
            v11 = true;
        end;
        if script:FindFirstChild(l_FirstChild_0.Stats.DF.Value) and l_FirstChild_0.Settings.OverrideDash.Value == false then
            v10 = l_FirstChild_0.Stats.DF.Value;
        end;
        if l_FirstChild_0 and l_FirstChild_0.Settings.OverrideDash.Value == true then
            if v11 == true and v10 ~= "Soru" then
                v10 = "Regular";
            elseif v11 == false then
                v10 = "Regular";
            end;
        end;
        local v12 = Ray.new(l_Character_0.HumanoidRootPart.Position, l_Character_0.HumanoidRootPart.CFrame.upVector * -(l_Character_0.Humanoid.HipHeight * 3));
        if _G.raycastWhitelist(v12, {
            workspace.Islands, 
            workspace.Env, 
            workspace.Ships
        }) == nil and v6[v10] == nil then
            return;
        else
            if v10 == "Spring-Spring" and (_G.blocking == true or l_Character_0:GetAttribute("springMode") == nil) then
                v10 = "Regular";
            end;
            if game.ReplicatedStorage:FindFirstChild("tradingHUB") then
                v10 = "Regular";
            end;
            local l_script_FirstChild_0 = script:FindFirstChild(v10);
            if l_script_FirstChild_0 then
                return require(l_script_FirstChild_0):start(v8);
            else
                return false;
            end;
        end;
    end;
end;
return v0;