local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_Players_0 = game:GetService("Players");
local l_Client_0 = l_ReplicatedStorage_0.Modules.Client;
local v3 = require(l_Client_0.ItemDisplay);
local l_Managers_0 = l_Client_0.Managers;
local v5 = require(l_Managers_0.ReplicaClientManager);
local l_DailyRewards_0 = l_Players_0.LocalPlayer:WaitForChild("PlayerGui"):WaitForChild("DailyRewards");
local l_Main_0 = l_DailyRewards_0:WaitForChild("Main");
local l_Contents_0 = l_Main_0:WaitForChild("Contents");
local l_NextDayTimerText_0 = l_Contents_0:WaitForChild("NextDayTimerText");
local l_Rewards_0 = l_Contents_0:WaitForChild("Rewards");
local l_Timer_0 = l_Contents_0:WaitForChild("Timer");
local l_TimerText_0 = l_Timer_0:WaitForChild("TimerText");
local l_TimerBar_0 = l_Timer_0:WaitForChild("TimerBar");
local l_Logins_0 = l_Main_0:WaitForChild("TotalLogins"):WaitForChild("Logins");
local l_NotReady_0 = l_Contents_0:WaitForChild("NotReady");
local l_Claim_0 = l_Contents_0:WaitForChild("Claim");
local l_DailyRewards_1 = l_ReplicatedStorage_0:WaitForChild("Remotes").DailyRewards;
local v18 = v3.new({
    Gui = l_DailyRewards_0
});
task.spawn(function() --[[ Line: 42 ]]
    -- upvalues: l_Main_0 (copy), l_DailyRewards_1 (copy)
    for _, v20 in l_Main_0:WaitForChild("ModMenu"):GetChildren() do
        if v20:IsA("ImageButton") then
            v20.MouseButton1Down:Connect(function() --[[ Line: 49 ]]
                -- upvalues: l_DailyRewards_1 (ref), v20 (copy)
                l_DailyRewards_1:FireServer(v20.Name);
            end);
        end;
    end;
end);
local function v32(v21, v22) --[[ Line: 59 ]] --[[ Name: UpdateRewardsFrame ]]
    -- upvalues: l_Rewards_0 (copy), v18 (copy)
    for v23, v24 in ipairs(v21) do
        local v25 = l_Rewards_0[("Day%*"):format(v23)];
        local l_Claimed_0 = v25.Claimed;
        local l_Locked_0 = v25.Locked;
        l_Claimed_0.Visible = v24.State == "Claimed";
        l_Locked_0.Visible = v24.State == "Locked";
        if v22 then
            local l_Items_0 = v25.Items;
            local _ = v25.Title;
            if #v24.Items == 1 then
                v25.ImageTransparency = 1;
                l_Items_0.UIGridLayout.CellSize = UDim2.new(1, 0, 1, 0);
                l_Items_0.ScrollingEnabled = false;
                l_Items_0.ScrollBarImageTransparency = 1;
            else
                l_Items_0.UIGridLayout.VerticalAlignment = Enum.VerticalAlignment.Top;
                l_Items_0.UIGridLayout.CellSize = UDim2.new(0.75, 0, 0.75, 0);
            end;
            for _, v31 in v24.Items do
                v18:AddItem(l_Items_0, v31.Name, v31.Amount);
            end;
        end;
    end;
end;
local function _() --[[ Line: 96 ]] --[[ Name: GetTimeUntilTmrw ]]
    local v33 = os.date("!*t");
    local v34 = 86400 - (v33.hour * 3600 + v33.min * 60 + v33.sec);
    return math.floor(v34 / 3600), math.floor(v34 % 3600 / 60), v34 % 60;
end;
local v36 = nil;
local function _() --[[ Line: 111 ]] --[[ Name: CancelUpdateThread ]]
    -- upvalues: v36 (ref)
    if v36 and coroutine.status(v36) ~= "dead" then
        task.cancel(v36);
        v36 = nil;
    end;
end;
local function _(v38) --[[ Line: 118 ]] --[[ Name: GetClaimableTimeLeft ]]
    local v39 = math.floor(v38 / 3600);
    local v40 = math.floor(v38 % 3600 / 60);
    local v41 = v38 % 60;
    if v39 > 0 then
        return string.format("%02d:%02d:%02d", v39, v40, v41);
    else
        return string.format("%02d:%02d", v40, v41);
    end;
end;
local v43 = nil;
local v44 = 600;
local v45 = Color3.fromRGB(170, 255, 127);
local v46 = Color3.fromRGB(85, 170, 0);
local v47 = Color3.fromRGB(53, 53, 53);
local v48 = Color3.fromRGB(68, 68, 68);
local function _() --[[ Line: 138 ]] --[[ Name: Refresh ]]
    -- upvalues: v44 (ref), v18 (copy)
    v44 = 600;
    v18:RemoveAllItems();
end;
local function v57(v50) --[[ Line: 144 ]] --[[ Name: UpdateClaimableTime ]]
    -- upvalues: v44 (ref), v43 (ref), l_TimerText_0 (copy), l_TimerBar_0 (copy), v45 (copy), v46 (copy), v47 (copy), v48 (copy), l_NotReady_0 (copy), l_Claim_0 (copy)
    if v44 == nil then
        return;
    else
        v43 = v50 or v43;
        if v43 == nil then
            return;
        else
            local v51 = math.clamp(os.time() - v43, 0, v44);
            local v52 = math.clamp(v44 - v51, 0, v44);
            local v53 = math.floor(v52 / 3600);
            local v54 = math.floor(v52 % 3600 / 60);
            local v55 = v52 % 60;
            local v56 = if v53 > 0 then string.format("%02d:%02d:%02d", v53, v54, v55) else string.format("%02d:%02d", v54, v55);
            v53 = math.clamp(v51 / v44, 0, 1);
            l_TimerText_0.Text = v56;
            if v53 ~= 1 then
                l_TimerBar_0.UIGradient.Color = ColorSequence.new({
                    ColorSequenceKeypoint.new(0, v45), 
                    ColorSequenceKeypoint.new(math.min(v53, 0.98), v46), 
                    ColorSequenceKeypoint.new(math.min(0.99, v53 + 0.05), v47), 
                    ColorSequenceKeypoint.new(1, v48)
                });
                l_NotReady_0.Visible = true;
                l_Claim_0.Visible = false;
                return;
            else
                l_TimerBar_0.UIGradient.Color = ColorSequence.new(v46);
                v44 = nil;
                l_NotReady_0.Visible = false;
                l_Claim_0.Visible = true;
                return;
            end;
        end;
    end;
end;
local function v66(v58) --[[ Line: 179 ]] --[[ Name: OnEnableChanged ]]
    -- upvalues: v36 (ref), l_NextDayTimerText_0 (copy), v57 (copy), v18 (copy)
    if v36 and coroutine.status(v36) ~= "dead" then
        task.cancel(v36);
        v36 = nil;
    end;
    if v58 then
        v36 = task.spawn(function() --[[ Line: 185 ]]
            -- upvalues: l_NextDayTimerText_0 (ref), v57 (ref)
            while task.wait(1) do
                local v59 = os.date("!*t");
                local v60 = 86400 - (v59.hour * 3600 + v59.min * 60 + v59.sec);
                local v61 = math.floor(v60 / 3600);
                local v62 = math.floor(v60 % 3600 / 60);
                local v63 = v60 % 60;
                local l_v61_0 = v61;
                local l_v62_0 = v62;
                l_NextDayTimerText_0.Text = ("%* %* %* seconds til tomorrow!"):format(l_v61_0 > 0 and l_v61_0 .. " hours" or "", l_v62_0 > 0 and l_v62_0 .. " minutes and" or "", v63);
                v57();
            end;
        end);
        v18:StartRotation();
        return;
    else
        v18:StopRotation();
        return;
    end;
end;
return {
    Initialize = function() --[[ Line: 203 ]] --[[ Name: Initialize ]]
        -- upvalues: v5 (copy), l_Logins_0 (copy), v44 (ref), v57 (copy), v18 (copy), v32 (copy), l_Rewards_0 (copy), v66 (copy), l_DailyRewards_0 (copy), l_Claim_0 (copy), l_DailyRewards_1 (copy)
        local l_v5_PlayerDataReplica_0 = v5:GetPlayerDataReplica();
        local l_Data_0 = l_v5_PlayerDataReplica_0.Data;
        local l_RewardKey_0 = l_Data_0.DailyRewards.RewardKey;
        l_Logins_0.Text = ("LOGIN STREAK: %*"):format(l_Data_0.DailyRewards.LoginStreak);
        l_v5_PlayerDataReplica_0:OnSet({
            "DailyRewards", 
            "LoginStreak"
        }, function(v70, _) --[[ Line: 217 ]]
            -- upvalues: l_Logins_0 (ref)
            l_Logins_0.Text = ("LOGIN STREAK: %*"):format(v70);
        end);
        l_v5_PlayerDataReplica_0:OnSet({
            "DailyRewards", 
            "JoinedTime"
        }, function(v72, _) --[[ Line: 221 ]]
            -- upvalues: v44 (ref), v57 (ref)
            v44 = 600;
            v57(v72);
        end);
        l_v5_PlayerDataReplica_0:OnSet({
            "DailyRewards", 
            "Rewards"
        }, function(v74, v75) --[[ Line: 260 ]]
            -- upvalues: l_Data_0 (copy), l_RewardKey_0 (ref), v44 (ref), v18 (ref), v32 (ref)
            print("Entity Rewards Upated with Key:", l_Data_0.DailyRewards.RewardKey, v74, v75);
            local v76 = false;
            if l_RewardKey_0 ~= l_Data_0.DailyRewards.RewardKey then
                v44 = 600;
                v18:RemoveAllItems();
                l_RewardKey_0 = l_Data_0.DailyRewards.RewardKey;
                v76 = true;
            end;
            v32(v74, v76);
        end);
        v57(l_Data_0.DailyRewards.JoinedTime);
        v32(l_Data_0.DailyRewards.Rewards);
        for v77, v78 in l_Data_0.DailyRewards.Rewards do
            local v79 = l_Rewards_0:WaitForChild((("Day%*"):format(v77)));
            local l_Items_1 = v79.Items;
            v79.Title.Text = ("DAY %*"):format(v77);
            if #v78.Items == 1 then
                v79.ImageTransparency = 1;
                l_Items_1.UIGridLayout.CellSize = UDim2.new(1, 0, 1, 0);
                l_Items_1.ScrollingEnabled = false;
                l_Items_1.ScrollBarImageTransparency = 1;
            else
                l_Items_1.UIGridLayout.VerticalAlignment = Enum.VerticalAlignment.Top;
                l_Items_1.UIGridLayout.CellSize = UDim2.new(0.75, 0, 0.75, 0);
            end;
            for _, v82 in v78.Items do
                v18:AddItem(l_Items_1, v82.Name, v82.Amount);
            end;
        end;
        v66(l_DailyRewards_0.Enabled);
        l_DailyRewards_0:GetPropertyChangedSignal("Enabled"):Connect(function() --[[ Line: 305 ]]
            -- upvalues: v66 (ref), l_DailyRewards_0 (ref)
            v66(l_DailyRewards_0.Enabled);
        end);
        local v83 = os.clock();
        l_Claim_0.MouseButton1Down:Connect(function() --[[ Line: 311 ]]
            -- upvalues: v83 (ref), l_DailyRewards_1 (ref)
            if os.clock() - v83 < 1 then
                return;
            else
                v83 = os.clock();
                l_DailyRewards_1:FireServer();
                return;
            end;
        end);
    end
};