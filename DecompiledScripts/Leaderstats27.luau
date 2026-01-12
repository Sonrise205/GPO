local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_LocalPlayer_0 = game:GetService("Players").LocalPlayer;
local v2 = {
    StringValue = true, 
    IntValue = true, 
    BoolValue = true, 
    NumberValue = true, 
    DoubleConstrainedValue = true, 
    IntConstrainedValue = true
};
local l_LeaderStats_0 = l_LocalPlayer_0.PlayerGui:WaitForChild("Playerlist"):WaitForChild("Main"):WaitForChild("ScrollingFrame"):WaitForChild("Leaderstats"):WaitForChild("Container"):WaitForChild("Title"):WaitForChild("LeaderStats");
local v4 = require(l_ReplicatedStorage_0.Modules.Shared.Signals.GoodSignal);
local v5 = {};
v5.__index = v5;
v5.new = function(v6) --[[ Line: 32 ]] --[[ Name: new ]]
    -- upvalues: v5 (copy), v4 (copy)
    local v7 = setmetatable({}, v5);
    v7.StatAdded = v4.new();
    v7.StatRemoved = v4.new();
    v7.StatChanged = v4.new();
    v7.PrimaryStat = nil;
    v7.Cache = {};
    v7.Playerlist = v6;
    v7.Stats = {};
    v7.SortedPlayers = {};
    v7:_main();
    return v7;
end;
v5.UpdatePrimaryStat = function(v8) --[[ Line: 51 ]] --[[ Name: UpdatePrimaryStat ]]
    -- upvalues: l_LeaderStats_0 (copy)
    local v9 = 1e999;
    local v10 = nil;
    for _, v12 in l_LeaderStats_0:GetChildren() do
        if v12:IsA("TextLabel") then
            local l_Name_0 = v12.Name;
            local l_Priority_0 = v8.Stats[l_Name_0].Priority;
            if l_Priority_0 < v9 then
                v9 = l_Priority_0;
                v10 = l_Name_0;
            end;
        end;
    end;
    if v10 ~= v8.PrimaryStat then
        v8.PrimaryStat = v10;
        for _, v16 in v8.Playerlist.Teams do
            v16:SortMembers();
        end;
    end;
end;
v5.IsValidStat = function(_, v18) --[[ Line: 76 ]] --[[ Name: IsValidStat ]]
    -- upvalues: v2 (copy)
    return v2[v18.ClassName];
end;
v5.UpdateStat = function(v19, v20, v21, v22) --[[ Line: 80 ]] --[[ Name: UpdateStat ]]
    local l_FirstChild_0 = v20.MainLeaderstat:FindFirstChild(v21);
    if l_FirstChild_0 then
        l_FirstChild_0.Text = v19:_filter(v22);
    end;
end;
v5.SetPriority = function(v24, v25, v26) --[[ Line: 85 ]] --[[ Name: SetPriority ]]
    -- upvalues: l_LeaderStats_0 (copy)
    local v27 = v24:_getStat(v25);
    if not v27 then
        return;
    else
        v26 = v26 or 0;
        v27.Priority = v26;
        local v28 = v24:_findChildUI(l_LeaderStats_0, v25);
        if v28 then
            v28.LayoutOrder = v26;
        end;
        for _, v30 in v24.Playerlist.Players do
            local v31 = v24:_findChildUI(v30.MainLeaderstat, v25);
            if v31 then
                v31.LayoutOrder = v26;
            end;
        end;
        v24:UpdatePrimaryStat();
        return;
    end;
end;
v5._getStat = function(v32, v33) --[[ Line: 105 ]] --[[ Name: _getStat ]]
    return v32.Stats[v33];
end;
v5._filter = function(_, v35) --[[ Line: 109 ]] --[[ Name: _filter ]]
    if typeof(v35) == "number" then
        if v35 >= 1000000000 then
            return string.format("%.1fB", v35 / 1000000000);
        elseif v35 >= 1000000 then
            return string.format("%.1fM", v35 / 1000000);
        elseif v35 >= 1000 then
            return string.format("%.1fK", v35 / 1000);
        else
            return (tostring(v35));
        end;
    else
        return v35;
    end;
end;
v5._createStatUI = function(v36, v37) --[[ Line: 126 ]] --[[ Name: _createStatUI ]]
    local l_Name_1 = v37.Name;
    local l_Parent_0 = v37.Parent;
    if v36:_findChildUI(l_Parent_0, l_Name_1) then
        return;
    else
        local l_Text_0 = v37.Text;
        local v41 = script.UI:Clone();
        v41.Name = l_Name_1;
        v41.Text = v36:_filter(l_Text_0) or "-";
        v41.LayoutOrder = v36.Stats[l_Name_1].Priority;
        v41.Parent = l_Parent_0;
        return;
    end;
end;
v5._createStat = function(v42, v43, v44) --[[ Line: 140 ]] --[[ Name: _createStat ]]
    v42.Stats[v43] = {
        Priority = v44 or 0, 
        Stacks = 0
    };
    v42.StatAdded:Fire(v43);
    v42:UpdatePrimaryStat();
    return v42.Stats[v43];
end;
v5._removeStat = function(v45, v46) --[[ Line: 153 ]] --[[ Name: _removeStat ]]
    v45.StatRemoved:Fire(v46);
    v45.Stats[v46] = nil;
end;
v5.AddStat = function(v47, _, v49, v50) --[[ Line: 158 ]] --[[ Name: AddStat ]]
    local v51 = v47:_getStat(v49) or v47:_createStat(v49, v50);
    v51.Stacks = v51.Stacks + 1;
end;
v5.RemoveStat = function(v52, _, v54) --[[ Line: 163 ]] --[[ Name: RemoveStat ]]
    local v55 = v52:_getStat(v54);
    if not v55 then
        return;
    else
        v55.Stacks = v55.Stacks - 1;
        if v55.Stacks > 0 then
            return;
        else
            v52:_removeStat(v54);
            return;
        end;
    end;
end;
v5._findChildUI = function(_, v57, v58) --[[ Line: 174 ]] --[[ Name: _findChildUI ]]
    return v57:FindFirstChild(v58);
end;
v5._main = function(v59) --[[ Line: 178 ]] --[[ Name: _main ]]
    -- upvalues: l_LeaderStats_0 (copy)
    local function v67(v60) --[[ Line: 181 ]] --[[ Name: OnStatAdded ]]
        -- upvalues: v59 (copy), l_LeaderStats_0 (ref)
        v59:_createStatUI({
            Name = v60, 
            Parent = l_LeaderStats_0, 
            Text = v60
        });
        for v61, v62 in v59.Playerlist.Players do
            local l_leaderstats_0 = v61:FindFirstChild("leaderstats");
            local v64 = l_leaderstats_0 and l_leaderstats_0:FindFirstChild(v60);
            v59:_createStatUI({
                Name = v60, 
                Parent = v62.MainLeaderstat, 
                Text = v64 and v64.Value
            });
        end;
        for _, v66 in v59.Playerlist.Teams do
            v59:_createStatUI({
                Name = v60, 
                Parent = v66.UI.Container.Title.LeaderStats, 
                Text = ""
            });
        end;
    end;
    local function v78(v68) --[[ Line: 196 ]] --[[ Name: OnStatRemoved ]]
        -- upvalues: v59 (copy), l_LeaderStats_0 (ref)
        local v69 = v59:_findChildUI(l_LeaderStats_0, v68);
        if v69 then
            v69:Destroy();
        end;
        for _, v71 in v59.Playerlist.Players do
            local l_MainLeaderstat_0 = v71.MainLeaderstat;
            task.spawn(function() --[[ Line: 202 ]]
                -- upvalues: l_MainLeaderstat_0 (copy), v68 (copy)
                local v73 = l_MainLeaderstat_0 and l_MainLeaderstat_0:WaitForChild(v68, 1);
                if v73 then
                    v73:Destroy();
                end;
            end);
        end;
        for _, v75 in v59.Playerlist.Teams do
            local l_LeaderStats_1 = v75.UI.Container.Title.LeaderStats;
            local v77 = v59:_findChildUI(l_LeaderStats_1, v68);
            if v77 then
                v77:Destroy();
            end;
        end;
    end;
    local function v81(v79) --[[ Line: 215 ]] --[[ Name: OnStatChanged ]]
        local l_Team_0 = v79.Team;
        if not l_Team_0 then
            return;
        else
            l_Team_0:SortMembers();
            return;
        end;
    end;
    local function v90(v82) --[[ Line: 222 ]] --[[ Name: OnPlayerAdded ]]
        -- upvalues: l_LeaderStats_0 (ref), v59 (copy)
        local l_Player_0 = v82.Player;
        for _, v85 in l_LeaderStats_0:GetChildren() do
            if v59.Stats[v85.Name] and v85:IsA("TextLabel") then
                local l_Name_2 = v85.Name;
                local l_leaderstats_1 = l_Player_0:FindFirstChild("leaderstats");
                local v88 = l_leaderstats_1 and v59:_findChildUI(l_leaderstats_1, l_Name_2).Value;
                v59:_createStatUI({
                    Name = l_Name_2, 
                    Parent = v82.MainLeaderstat, 
                    Text = v88
                });
            end;
        end;
        local l_Team_1 = v82.Team;
        if not l_Team_1 then
            return;
        else
            l_Team_1:SortMembers();
            return;
        end;
    end;
    local function v93(v91) --[[ Line: 242 ]] --[[ Name: OnPlayerRemoved ]]
        local l_Team_2 = v91.Team;
        if not l_Team_2 then
            return;
        else
            l_Team_2:SortMembers();
            return;
        end;
    end;
    v59.StatAdded:Connect(v67);
    v59.StatRemoved:Connect(v78);
    v59.StatChanged:Connect(v81);
    v59.Playerlist.PlayerAdded:Connect(v90);
    v59.Playerlist.PlayerRemoved:Connect(v93);
end;
return v5;