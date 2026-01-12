local l_Players_0 = game:GetService("Players");
local _ = game:GetService("ReplicatedStorage");
local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
local l_PlayerGui_0 = l_LocalPlayer_0:WaitForChild("PlayerGui");
local v4 = {
    Initialized = false, 
    Maintenance = false
};
v4.Initialize = function(v5) --[[ Line: 12 ]] --[[ Name: Initialize ]]
    -- upvalues: l_PlayerGui_0 (copy), l_LocalPlayer_0 (copy), v4 (copy)
    local v6 = l_PlayerGui_0:WaitForChild("MediaBan", 360);
    local l_Frame_0 = v6:WaitForChild("Frame");
    v6.Enabled = true;
    local v8 = false;
    for v9, _ in pairs(v5:GetWhitelist()) do
        if v9 == l_LocalPlayer_0.UserId then
            v6.Enabled = false;
            v8 = true;
            break;
        else
            task.wait();
        end;
    end;
    if v8 == false and game.GameId ~= 2097989947 then
        v6.Enabled = v4.Maintenance;
    end;
    if v6.Enabled then
        for _, v12 in pairs(l_Frame_0:GetChildren()) do
            if v12:IsA("TextLabel") then
                v12.Text = l_LocalPlayer_0.Name;
            end;
            task.wait();
        end;
    end;
    v4.Initialized = true;
end;
return v4;