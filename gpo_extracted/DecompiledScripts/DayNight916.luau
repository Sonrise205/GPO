repeat
    task.wait(1);
until game.ReplicatedStorage.reservedCode.Value ~= "checking" and game.Lighting:GetAttribute("Ready") == true;
local _ = require(script.Day);
local _ = require(script.Night);
local l_Lighting_0 = game:GetService("Lighting");
local function _(v3, v4, v5) --[[ Line: 13 ]] --[[ Name: lerp ]]
    return v3 + (v4 - v3) * v5;
end;
local v7 = false;
local v8 = {};
local l_Tagged_0 = game:GetService("CollectionService"):GetTagged("nightWindow");
for v10 = 1, #l_Tagged_0 do
    local v11 = l_Tagged_0[v10];
    v8[v11] = {
        color = v11.Color, 
        mat = v11.Material
    };
end;
local function v20(v12) --[[ Line: 25 ]] --[[ Name: Update ]]
    -- upvalues: l_Lighting_0 (copy), v7 (ref), l_Tagged_0 (copy), v8 (copy)
    v12 = l_Lighting_0:GetMinutesAfterMidnight();
    if game.Lighting:FindFirstChild("Atmosphere") then
        local v13 = nil;
        local l_ClockTime_0 = game.Lighting.ClockTime;
        if game.Lighting.ClockTime >= 7 and game.Lighting.ClockTime < 18 then
            v13 = (8 - (12 - l_ClockTime_0)) / 8;
            if v7 == true then
                v7 = false;
                local l_l_Tagged_0_0 = l_Tagged_0;
                for v16 = 1, #l_l_Tagged_0_0 do
                    local v17 = l_l_Tagged_0_0[v16];
                    if v17 and v8[v17] ~= nil then
                        l_l_Tagged_0_0[v16].Material = v8[v17].mat;
                        l_l_Tagged_0_0[v16].Color = v8[v17].color;
                    end;
                end;
                return;
            end;
        elseif game.Lighting.ClockTime >= 13 then
            v13 = (5 - (23 - l_ClockTime_0)) / 5;
            if v7 == false then
                v7 = true;
                local l_l_Tagged_0_1 = l_Tagged_0;
                for v19 = 1, #l_l_Tagged_0_1 do
                    l_l_Tagged_0_1[v19].Material = Enum.Material.Neon;
                    l_l_Tagged_0_1[v19].Color = Color3.fromRGB(162, 108, 81);
                end;
            end;
        end;
    end;
end;
if game["Run Service"]:IsStudio() == false then
    game.ReplicatedFirst.StartTime:Destroy();
end;
if game.Lighting:GetAttribute("AlwaysDay") == true then
    v20(game.Lighting:GetAttribute("setTime"));
    return;
else
    local v21 = 0;
    game:GetService("RunService").Heartbeat:Connect(function() --[[ Line: 91 ]]
        -- upvalues: v21 (ref), v20 (copy)
        if tick() - v21 < 1 then
            return;
        else
            local _ = workspace:GetServerTimeNow();
            v20();
            v21 = tick();
            return;
        end;
    end);
    return;
end;