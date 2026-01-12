local l_Players_0 = game:GetService("Players");
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_TweenService_0 = game:GetService("TweenService");
local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
local l_PlayerGui_0 = l_LocalPlayer_0:WaitForChild("PlayerGui");
local l_Modules_0 = l_ReplicatedStorage_0:WaitForChild("Modules");
local _ = require(l_Modules_0.Leveling);
local l_Shared_0 = l_Modules_0.Shared;
local _ = require(l_Shared_0.GameUtils);
local l_SoundUtils_0 = require(l_Shared_0:WaitForChild("SoundUtils"));
local v10 = require(l_Shared_0.Signals.GoodSignal);
local l_BindToRender_0 = l_Modules_0.BindToRender;
local v12 = {
    Initialized = false
};
v12.Initialize = function(v13) --[[ Line: 21 ]] --[[ Name: Initialize ]]
    -- upvalues: v12 (copy), l_ReplicatedStorage_0 (copy), l_PlayerGui_0 (copy), l_BindToRender_0 (copy), l_TweenService_0 (copy), v10 (copy), l_SoundUtils_0 (copy), l_LocalPlayer_0 (copy)
    if v12.Initialized then
        return;
    else
        local l_reservedCode_0 = l_ReplicatedStorage_0:WaitForChild("reservedCode");
        local v15 = l_PlayerGui_0:WaitForChild("Display", 360);
        local l_Region_0 = v15:WaitForChild("Region");
        local l_LogiaRate_0 = v15:WaitForChild("LogiaRate");
        local l_FPS_0 = v15:WaitForChild("FPS");
        local l_ServerAge_0 = v15:WaitForChild("ServerAge");
        local _ = v15:WaitForChild("Verson");
        local l_Combat_0 = v15:WaitForChild("Combat");
        local l_Safe_0 = v15:WaitForChild("Safe");
        local l_SkillPoints_0 = v13:GetStatsFolder():WaitForChild("Stats"):WaitForChild("SkillPoints");
        local l_UnspentSP_0 = v15:WaitForChild("UnspentSP");
        local l_ServerRegion_0 = l_ReplicatedStorage_0:WaitForChild("ServerRegion");
        local l_logia_0 = l_ReplicatedStorage_0:WaitForChild("logia");
        local v27 = 0;
        local _ = os.clock();
        l_BindToRender_0:GetAttributeChangedSignal("FPS"):Connect(function() --[[ Line: 49 ]]
            -- upvalues: v27 (ref), l_BindToRender_0 (ref), l_FPS_0 (copy)
            if v27 ~= l_BindToRender_0:GetAttribute("FPS") then
                v27 = l_BindToRender_0:GetAttribute("FPS");
                l_FPS_0.Text = v27;
                local v29 = v27 / 50;
                l_FPS_0.UIGradient.Color = ColorSequence.new(Color3.fromRGB(255, 255, 255), Color3.new(255, 0, 0):Lerp(Color3.fromRGB(0, 255, 0), v29));
            end;
        end);
        l_SkillPoints_0:GetPropertyChangedSignal("Value"):Connect(function() --[[ Line: 65 ]] --[[ Name: SkillPointsUpdated ]]
            -- upvalues: l_SkillPoints_0 (copy), l_UnspentSP_0 (copy)
            if l_SkillPoints_0.Value > 0 then
                l_UnspentSP_0.Visible = true;
                return;
            else
                l_UnspentSP_0.Visible = false;
                return;
            end;
        end);
        if l_SkillPoints_0.Value > 0 then
            l_UnspentSP_0.Visible = true;
        else
            l_UnspentSP_0.Visible = false;
        end;
        local v30 = TweenInfo.new(0.4, Enum.EasingStyle.Linear, Enum.EasingDirection.Out, -1, true, 0);
        l_UnspentSP_0.Rotation = -5;
        l_TweenService_0:Create(l_UnspentSP_0, v30, {
            Rotation = 5
        }):Play();
        local function v32(v31) --[[ Line: 87 ]] --[[ Name: UpdateSafezone ]]
            -- upvalues: l_Safe_0 (copy)
            l_Safe_0.Visible = v31;
        end;
        local function v33() --[[ Line: 91 ]] --[[ Name: ReservedCodeUpdated ]]
            -- upvalues: l_reservedCode_0 (copy), l_Safe_0 (copy)
            if l_reservedCode_0.Value == "arena" then
                l_Safe_0.Visible = false;
            end;
        end;
        if l_reservedCode_0.Value == "arena" then
            l_Safe_0.Visible = false;
        end;
        l_reservedCode_0:GetPropertyChangedSignal("Value"):Connect(v33);
        local function _(v34, v35) --[[ Line: 100 ]] --[[ Name: roundNumber ]]
            return math.floor(v34 * 10 ^ v35) / 10 ^ v35;
        end;
        local v37 = nil;
        local function v44(v38) --[[ Line: 105 ]] --[[ Name: UpdateServerRegion ]]
            -- upvalues: v10 (ref), v37 (ref), l_Region_0 (copy), l_ServerRegion_0 (copy)
            task.spawn(function() --[[ Line: 106 ]]
                -- upvalues: v38 (copy), v10 (ref), v37 (ref), l_Region_0 (ref), l_ServerRegion_0 (ref)
                if v38 ~= nil then
                    local v39 = os.clock();
                    local v40 = v10.new();
                    if v37 then
                        v37:Disconnect();
                        v37 = nil;
                    end;
                    v37 = game.ReplicatedStorage.Events.GetPing.Echo.OnClientEvent:Connect(function() --[[ Line: 115 ]]
                        -- upvalues: v40 (copy), v37 (ref)
                        v40:Fire();
                        if v37 then
                            v37:Disconnect();
                            v37 = nil;
                        end;
                    end);
                    task.spawn(function() --[[ Line: 124 ]]
                        game.ReplicatedStorage.Events.GetPing:InvokeServer(workspace:GetServerTimeNow());
                    end);
                    v40:Wait();
                    v40:DisconnectAll();
                    local v41 = os.clock() - v39;
                    local v42 = math.clamp((v41 - 0.05) / 0.25, 0, 1);
                    local v43 = Color3.fromRGB(0, 255, 0):Lerp(Color3.fromRGB(255, 0, 0), v42);
                    l_Region_0.Text = ("<font color=\"rgb(%*,%*,%*)\">"):format(math.ceil(v43.R * 255), math.ceil(v43.G * 255), (math.ceil(v43.B * 255))) .. math.floor(v41 * 1000 * 1) / 1 .. ("ms Ping </font><font color=\"rgb(255,255,255)\">[%*]</font> "):format(game.Players.LocalPlayer.UserId) .. l_ServerRegion_0.Value;
                    return;
                else
                    l_Region_0.Text = l_ServerRegion_0.Value;
                    return;
                end;
            end);
        end;
        game.ReplicatedStorage.Events.GetPing.OnClientInvoke = function(v45) --[[ Line: 142 ]]
            local l_workspace_ServerTimeNow_0 = workspace:GetServerTimeNow();
            return l_workspace_ServerTimeNow_0, l_workspace_ServerTimeNow_0 - v45;
        end;
        l_ServerRegion_0:GetPropertyChangedSignal("Value"):Connect(v44);
        local l_spawn_0 = task.spawn;
        local v48 = nil;
        local l_v48_0 = v48 --[[ copy: 27 -> 31 ]];
        l_spawn_0(function() --[[ Line: 106 ]]
            -- upvalues: l_v48_0 (copy), v10 (ref), v37 (ref), l_Region_0 (copy), l_ServerRegion_0 (copy)
            if l_v48_0 ~= nil then
                local v50 = os.clock();
                local v51 = v10.new();
                if v37 then
                    v37:Disconnect();
                    v37 = nil;
                end;
                v37 = game.ReplicatedStorage.Events.GetPing.Echo.OnClientEvent:Connect(function() --[[ Line: 115 ]]
                    -- upvalues: v51 (copy), v37 (ref)
                    v51:Fire();
                    if v37 then
                        v37:Disconnect();
                        v37 = nil;
                    end;
                end);
                task.spawn(function() --[[ Line: 124 ]]
                    game.ReplicatedStorage.Events.GetPing:InvokeServer(workspace:GetServerTimeNow());
                end);
                v51:Wait();
                v51:DisconnectAll();
                local v52 = os.clock() - v50;
                local v53 = math.clamp((v52 - 0.05) / 0.25, 0, 1);
                local v54 = Color3.fromRGB(0, 255, 0):Lerp(Color3.fromRGB(255, 0, 0), v53);
                l_Region_0.Text = ("<font color=\"rgb(%*,%*,%*)\">"):format(math.ceil(v54.R * 255), math.ceil(v54.G * 255), (math.ceil(v54.B * 255))) .. math.floor(v52 * 1000 * 1) / 1 .. ("ms Ping </font><font color=\"rgb(255,255,255)\">[%*]</font> "):format(game.Players.LocalPlayer.UserId) .. l_ServerRegion_0.Value;
                return;
            else
                l_Region_0.Text = l_ServerRegion_0.Value;
                return;
            end;
        end);
        task.spawn(function() --[[ Line: 152 ]]
            -- upvalues: v10 (ref), v37 (ref), l_Region_0 (copy), l_ServerRegion_0 (copy)
            while true do
                local l_spawn_1 = task.spawn;
                local v56 = true;
                l_spawn_1(function() --[[ Line: 106 ]]
                    -- upvalues: v56 (copy), v10 (ref), v37 (ref), l_Region_0 (ref), l_ServerRegion_0 (ref)
                    if v56 ~= nil then
                        local v57 = os.clock();
                        local v58 = v10.new();
                        if v37 then
                            v37:Disconnect();
                            v37 = nil;
                        end;
                        v37 = game.ReplicatedStorage.Events.GetPing.Echo.OnClientEvent:Connect(function() --[[ Line: 115 ]]
                            -- upvalues: v58 (copy), v37 (ref)
                            v58:Fire();
                            if v37 then
                                v37:Disconnect();
                                v37 = nil;
                            end;
                        end);
                        task.spawn(function() --[[ Line: 124 ]]
                            game.ReplicatedStorage.Events.GetPing:InvokeServer(workspace:GetServerTimeNow());
                        end);
                        v58:Wait();
                        v58:DisconnectAll();
                        local v59 = os.clock() - v57;
                        local v60 = math.clamp((v59 - 0.05) / 0.25, 0, 1);
                        local v61 = Color3.fromRGB(0, 255, 0):Lerp(Color3.fromRGB(255, 0, 0), v60);
                        l_Region_0.Text = ("<font color=\"rgb(%*,%*,%*)\">"):format(math.ceil(v61.R * 255), math.ceil(v61.G * 255), (math.ceil(v61.B * 255))) .. math.floor(v59 * 1000 * 1) / 1 .. ("ms Ping </font><font color=\"rgb(255,255,255)\">[%*]</font> "):format(game.Players.LocalPlayer.UserId) .. l_ServerRegion_0.Value;
                        return;
                    else
                        l_Region_0.Text = l_ServerRegion_0.Value;
                        return;
                    end;
                end);
                task.wait(1);
            end;
        end);
        l_logia_0:GetPropertyChangedSignal("Value"):Connect(function() --[[ Line: 159 ]] --[[ Name: UpdateLogiaRate ]]
            -- upvalues: l_LogiaRate_0 (copy), l_logia_0 (copy)
            l_LogiaRate_0.Visible = l_logia_0.Value;
        end);
        l_LogiaRate_0.Visible = l_logia_0.Value;
        v48 = l_ReplicatedStorage_0:WaitForChild("Events"):WaitForChild("CombatTag");
        l_Combat_0.Visible = false;
        local l_CD_0 = l_Combat_0:WaitForChild("CD");
        local v63 = nil;
        local function _() --[[ Line: 175 ]] --[[ Name: cancelCountdown ]]
            -- upvalues: v63 (ref)
            v63 = nil;
        end;
        v48.OnClientEvent:Connect(function(v65) --[[ Line: 179 ]]
            -- upvalues: l_Combat_0 (copy), l_SoundUtils_0 (ref), v63 (ref)
            if v65 == true and l_Combat_0.Visible == false then
                l_SoundUtils_0.PlaySound("InCombat", {
                    SoundCategory = "Announcer"
                });
                l_Combat_0.Visible = true;
                v63 = nil;
                return;
            else
                if v65 == false and l_Combat_0.Visible == true then
                    l_SoundUtils_0.PlaySound("Safe", {
                        SoundCategory = "Announcer"
                    });
                    l_Combat_0.Visible = false;
                    v63 = nil;
                end;
                return;
            end;
        end);
        task.spawn(function() --[[ Line: 202 ]]
            -- upvalues: l_LocalPlayer_0 (ref), v63 (ref), l_CD_0 (copy), l_ServerAge_0 (copy)
            while true do
                if l_LocalPlayer_0:GetAttribute("timeUntilSafe") ~= nil then
                    local v66 = math.ceil(l_LocalPlayer_0:GetAttribute("timeUntilSafe") - workspace:GetServerTimeNow());
                    if v63 == nil then
                        v63 = v66;
                    end;
                    v66 = math.clamp(v66, 0, 1000);
                    l_CD_0.Text = v66;
                    local v67 = Color3.fromRGB(255, 0, 0);
                    if v66 <= 10 then
                        v67 = Color3.fromRGB(255, 0, 0):Lerp(Color3.fromRGB(170, 255, 0), (10 - v66) / 10);
                    end;
                    l_CD_0.TextColor3 = v67;
                    l_CD_0.Visible = true;
                    if v66 <= 0 then
                        l_CD_0.Visible = false;
                    end;
                else
                    l_CD_0.Visible = false;
                end;
                local l_workspace_Attribute_0 = workspace:GetAttribute("serverAge");
                local v69 = math.floor(l_workspace_Attribute_0 % 60);
                local v70 = math.floor(l_workspace_Attribute_0 / 60 % 60);
                local v71 = math.floor(l_workspace_Attribute_0 / 3600 % 24);
                local v72 = math.floor(l_workspace_Attribute_0 / 86400);
                if v72 > 0 then
                    l_ServerAge_0.Text = string.format("%d days %.2d:%.2d:%.2d", v72, v71, v70, v69);
                else
                    l_ServerAge_0.Text = string.format("%.2d:%.2d:%.2d", v71, v70, v69);
                end;
                task.wait(0.1);
            end;
        end);
        l_ReplicatedStorage_0.Events.SafeZone.OnClientEvent:Connect(v32);
        v12.Initialized = true;
        return;
    end;
end;
return v12;