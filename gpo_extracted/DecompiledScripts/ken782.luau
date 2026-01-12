local _, _, _, _, v4 = require(game.ReplicatedStorage.Modules.ScriptSet).get();
local l_UserInputService_0 = game:GetService("UserInputService");
local v6 = require(game.ReplicatedStorage.KenHaki);
local v7 = false;
l_UserInputService_0.InputBegan:Connect(function(v8, v9) --[[ Line: 9 ]]
    -- upvalues: v4 (copy), v7 (ref), v6 (copy)
    if v9 then
        return;
    else
        if v8.KeyCode == Enum.KeyCode.G and v4.Stats.KenMastery.Value >= 1 then
            if v7 == true then
                if v6.On == false then
                    local v10 = false;
                    if v4.Stats.DF.Value == "Mochi-Mochi" and v4.Stats.KenMastery.Value >= 700 then
                        v10 = true;
                    end;
                    if v4.Skills.KenV2.Value == true then
                        game.ReplicatedStorage.KenHaki.v2fail:Play();
                        return;
                    elseif v10 == false then
                        game.ReplicatedStorage.KenHaki.fail:Play();
                        return;
                    else
                        game.ReplicatedStorage.KenHaki.fail2:Play();
                    end;
                end;
                return;
            else
                v7 = true;
                if v6.On == false and _G.canuse == true then
                    v6:Enable();
                elseif v6.On == true then
                    v6:Disable();
                end;
                task.wait(1);
                v7 = false;
            end;
        end;
        return;
    end;
end);