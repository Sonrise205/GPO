repeat
    task.wait();
until game.Players.LocalPlayer ~= nil;
local _ = game.Players.LocalPlayer;
local l_UserInputService_0 = game:GetService("UserInputService");
local v2 = false;
local v3 = true;
_G.holdSkill = function(v4, v5, v6, v7) --[[ Line: 10 ]]
    -- upvalues: v2 (ref), v3 (ref), l_UserInputService_0 (copy)
    if v2 == true then
        warn("already holding soemthing");
        return;
    else
        local l_Character_0 = game.Players.LocalPlayer.Character;
        local v9 = tick();
        local v10 = tick();
        local v11 = false;
        if v7 == nil then
            v7 = 0;
        end;
        while true do
            _G.canuse = false;
            v2 = true;
            if v5 then
                local l_status_0, l_result_0 = pcall(v5);
                if l_status_0 == false and l_result_0 then
                    warn("ERRROR: " .. l_result_0);
                end;
            end;
            if v3 == false then
                warn("focus false brerak");
                break;
            elseif l_Character_0 and l_Character_0:FindFirstChild("campfireResting") then
                warn("cant fire resting");
                break;
            elseif l_Character_0 ~= game.Players.LocalPlayer.Character then
                warn("in efect folder beka");
                break;
            elseif l_Character_0.Parent ~= workspace.Effects then
                game["Run Service"].Heartbeat:Wait();
                if tick() - v9 >= 3 then
                    game.Players.LocalPlayer:Kick("game froze too long, rejoin. froze for " .. tostring(math.floor((tick() - v9) * 1000) / 1000));
                    v11 = true;
                    break;
                else
                    v9 = tick();
                    if (l_UserInputService_0:IsKeyDown(v4) == false or v6() == true) and v7 <= tick() - v10 then
                        break;
                    end;
                end;
            else
                break;
            end;
        end;
        v2 = false;
        if v11 == true then
            while true do
                task.wait(1);
            end;
        end;
        return;
    end;
end;
local v14 = {};
l_UserInputService_0.WindowFocused:Connect(function() --[[ Line: 123 ]]
    -- upvalues: v3 (ref)
    v3 = true;
end);
l_UserInputService_0.WindowFocusReleased:Connect(function() --[[ Line: 127 ]]
    -- upvalues: v3 (ref)
    v3 = false;
end);
game.Players.LocalPlayer.CharacterAdded:Connect(function() --[[ Line: 131 ]]
    -- upvalues: v2 (ref), v14 (copy)
    v2 = false;
    for _, v16 in pairs(v14) do
        if v16.UI then
            v16.UI:Destroy();
        end;
        v16.uiUpdateCnt:Disconnect();
    end;
    table.clear(v14);
end);