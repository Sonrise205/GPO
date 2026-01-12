local v0, _, _, _, _ = require(game.ReplicatedStorage.Modules.ScriptSet).get();
while true do
    task.wait();
    if v0 and v0.Character and v0.Character:FindFirstChild("Humanoid") and _G.tween ~= nil then
        while true do
            if game.Players.LocalPlayer.Character == nil then
                task.wait();
            else
                local v5 = false;
                local function _(v6) --[[ Line: 7 ]] --[[ Name: Format ]]
                    return string.format("%02i", v6);
                end;
                local function v12(v8) --[[ Line: 11 ]] --[[ Name: convertToHMS ]]
                    local v9 = (v8 - v8 % 60) / 60;
                    v8 = v8 - v9 * 60;
                    local v10 = (v9 - v9 % 60) / 60;
                    v9 = v9 - v10 * 60;
                    local v11 = "";
                    if v10 > 0 then
                        v11 = string.format("%02i", v10) .. ":";
                    end;
                    return v11 .. string.format("%02i", v9) .. ":" .. string.format("%02i", v8);
                end;
                while true do
                    task.wait(1);
                    if v5 == false and game.ReplicatedStorage.reservedCode:GetAttribute("battleRoyale") ~= nil then
                        v5 = true;
                        v0.PlayerGui.Quest.Enabled = false;
                    end;
                    if v5 then
                        local v13 = 0;
                        local l_Players_0 = game.Players:GetPlayers();
                        for v15 = 1, #l_Players_0 do
                            if l_Players_0[v15].Team == game.Teams:FindFirstChild("Players") then
                                v13 = v13 + 1;
                            end;
                        end;
                        script.Parent.playersRemain.Visible = true;
                        if game.ReplicatedStorage.reservedCode:GetAttribute("matchTime") then
                            script.Parent.time.Visible = true;
                            script.Parent.grips.Visible = true;
                            script.Parent.time.Text = v12(game.ReplicatedStorage.reservedCode:GetAttribute("matchTime"));
                        end;
                        local l_Attribute_0 = game.Players.LocalPlayer:GetAttribute("playersEliminated");
                        if l_Attribute_0 == nil then
                            l_Attribute_0 = 0;
                        end;
                        script.Parent.grips.Text = "\240\159\146\128 " .. l_Attribute_0;
                        script.Parent.playersRemain.Text = tostring(v13) .. " PLAYERS REMAIN";
                    end;
                end;
            end;
        end;
    end;
end;