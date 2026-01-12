local _ = game:GetService("ReplicatedStorage");
local l_ScrollingFrame_0 = game:GetService("Players").LocalPlayer.PlayerGui:WaitForChild("Playerlist"):WaitForChild("Main"):WaitForChild("ScrollingFrame");
local v2 = {};
v2.__index = v2;
v2.new = function(v3, v4) --[[ Line: 19 ]] --[[ Name: new ]]
    -- upvalues: v2 (copy)
    local v5 = setmetatable({}, v2);
    v5.Playerlist = v3;
    v5.Team = v4;
    v5.Members = {};
    v5.UI = v5:_createUI();
    v5:_main();
    return v5;
end;
v2._createUI = function(_) --[[ Line: 31 ]] --[[ Name: _createUI ]]
    -- upvalues: l_ScrollingFrame_0 (copy)
    local v7 = script.UI:Clone();
    v7.Visible = false;
    v7.Parent = l_ScrollingFrame_0;
    return v7;
end;
v2.DisplayTitle = function(v8, v9) --[[ Line: 38 ]] --[[ Name: DisplayTitle ]]
    v8.UI.Container.Title.Visible = v9;
end;
v2.AddMember = function(v10, v11) --[[ Line: 42 ]] --[[ Name: AddMember ]]
    v10.Members[v11.Player] = v11;
    v10.UI.Visible = true;
    v10:SortMembers();
end;
v2.RemoveMember = function(v12, v13) --[[ Line: 48 ]] --[[ Name: RemoveMember ]]
    v12.Members[v13.Player] = nil;
    v12.UI.Visible = next(v12.Members) ~= nil;
    v12:SortMembers();
end;
v2.SortMembers = function(v14) --[[ Line: 54 ]] --[[ Name: SortMembers ]]
    local l_PrimaryStat_0 = v14.Playerlist.Leaderstats.PrimaryStat;
    local v16 = {};
    for v17 in v14.Members do
        table.insert(v16, v17);
    end;
    table.sort(v16, function(v18, v19) --[[ Line: 62 ]]
        -- upvalues: l_PrimaryStat_0 (copy)
        local l_leaderstats_0 = v18:FindFirstChild("leaderstats");
        local l_leaderstats_1 = v19:FindFirstChild("leaderstats");
        if not l_leaderstats_0 then
            return false;
        elseif not l_leaderstats_1 then
            return true;
        else
            local l_l_leaderstats_0_FirstChild_0 = l_leaderstats_0:FindFirstChild(l_PrimaryStat_0);
            local l_l_leaderstats_1_FirstChild_0 = l_leaderstats_1:FindFirstChild(l_PrimaryStat_0);
            if not l_l_leaderstats_0_FirstChild_0 then
                return false;
            elseif not l_l_leaderstats_1_FirstChild_0 then
                return true;
            else
                return l_l_leaderstats_0_FirstChild_0.Value > l_l_leaderstats_1_FirstChild_0.Value;
            end;
        end;
    end);
    for v24, v25 in v16 do
        v14.Members[v25].UI.LayoutOrder = v24;
    end;
end;
v2._main = function(v26) --[[ Line: 91 ]] --[[ Name: _main ]]
    local _ = v26.UI;
    local l_Team_0 = v26.Team;
    local function v29() --[[ Line: 95 ]] --[[ Name: UpdateName ]]
        -- upvalues: v26 (copy), l_Team_0 (copy)
        v26.UI.Name = l_Team_0.Name;
        v26.UI.Container.Title.TextLabel.Text = l_Team_0.Name;
    end;
    local function v30() --[[ Line: 100 ]] --[[ Name: UpdateColor ]]
        -- upvalues: v26 (copy), l_Team_0 (copy)
        v26.UI.Background.ImageColor3 = l_Team_0.TeamColor.Color;
        v26.UI.Container.Title.Divider.Background.ImageColor3 = l_Team_0.TeamColor.Color;
    end;
    v26.UI.Name = l_Team_0.Name;
    v26.UI.Container.Title.TextLabel.Text = l_Team_0.Name;
    v26.UI.Background.ImageColor3 = l_Team_0.TeamColor.Color;
    v26.UI.Container.Title.Divider.Background.ImageColor3 = l_Team_0.TeamColor.Color;
    if typeof(l_Team_0) ~= "Instance" or not l_Team_0:IsA("Team") then
        return;
    else
        l_Team_0:GetPropertyChangedSignal("Name"):Connect(v29);
        l_Team_0:GetPropertyChangedSignal("TeamColor"):Connect(v30);
        return;
    end;
end;
v2.Destroy = function(v31) --[[ Line: 115 ]] --[[ Name: Destroy ]]
    v31.UI:Destroy();
    setmetatable(v31, nil);
end;
return v2;