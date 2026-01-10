local l_Players_0 = game:GetService("Players");
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local _ = game:GetService("TweenService");
local l_Shared_0 = l_ReplicatedStorage_0:WaitForChild("Modules"):WaitForChild("Shared");
local _ = require(l_Shared_0:WaitForChild("SoundUtils"));
local v5 = {
    UIClient = {}
};
local l_UIButton_0 = require(script:WaitForChild("UIButton"));
local l_UIFrame_0 = require(script:WaitForChild("UIFrame"));
local l_UIClient_0 = require(script:WaitForChild("UIClient"));
local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
local l_Main_0 = l_LocalPlayer_0:WaitForChild("PlayerGui"):WaitForChild("Crews", 360):WaitForChild("Main");
local l_Buttons_0 = l_Main_0:WaitForChild("Buttons");
local l_Frames_0 = l_Main_0:WaitForChild("Frames");
local _ = l_Main_0:WaitForChild("Loading");
local l_Default_0 = l_Frames_0:WaitForChild("Default");
local l_Crew_0 = l_Default_0:WaitForChild("Crew");
local l_NoCrew_0 = l_Default_0:WaitForChild("NoCrew");
local l_Invites_0 = l_Frames_0:WaitForChild("Invites");
local l_Invite_0 = l_Invites_0:WaitForChild("Invite");
local l_Invited_0 = l_Invites_0:WaitForChild("Invited");
local l_Notfications_0 = l_Main_0:WaitForChild("Notfications");
v5.Buttons = {};
v5.Frames = {};
v5.Selected = nil;
local v21 = {
    Information = Color3.fromRGB(0, 170, 255), 
    Success = Color3.fromRGB(85, 170, 0), 
    Error = Color3.fromRGB(170, 0, 0)
};
local v22 = 0;
local v23 = {};
v5.RemoveNotification = function(v24, v25) --[[ Line: 51 ]] --[[ Name: RemoveNotification ]]
    -- upvalues: v23 (copy)
    if v23[v24] then
        if v25 == nil then
            v23[v24]:TweenSize(UDim2.fromScale(1, 0), Enum.EasingDirection.Out, Enum.EasingStyle.Quad, 0.2, true, function() --[[ Line: 54 ]]
                -- upvalues: v23 (ref), v24 (copy)
                v23[v24]:Destroy();
                v23[v24] = nil;
            end);
            return;
        else
            v23[v24]:Destroy();
            v23[v24] = nil;
        end;
    end;
end;
v5.Notify = function(v26, v27, v28) --[[ Line: 65 ]] --[[ Name: Notify ]]
    -- upvalues: v22 (ref), v21 (copy), l_Notfications_0 (copy), v23 (copy), v5 (copy)
    v22 = v22 + 1;
    local l_v22_0 = v22;
    local v30 = v21[v26] or Color3.fromRGB(0, 170, 255);
    local v31 = script.MessageTemplate:Clone();
    v31.Name = l_v22_0;
    v31.BackgroundColor3 = v30;
    v31.Parent = l_Notfications_0;
    v23[l_v22_0] = v31;
    v31.TextLabel.Text = v27;
    v31:TweenSize(UDim2.fromScale(1, 1), Enum.EasingDirection.Out, Enum.EasingStyle.Quad, 0.2, true);
    task.delay(v28 or 3, function() --[[ Line: 81 ]]
        -- upvalues: v5 (ref), l_v22_0 (copy)
        v5.RemoveNotification(l_v22_0);
    end);
    return l_v22_0;
end;
v5.OpenFrame = function(_, v33) --[[ Line: 89 ]] --[[ Name: OpenFrame ]]
    -- upvalues: v5 (copy), l_Buttons_0 (copy)
    if v5.Selected ~= nil then
        v5.Frames[v5.Selected.Name]:SetVisible(false);
    end;
    local l_Children_0 = l_Buttons_0.Frames:GetChildren();
    for v35 = 1, #l_Children_0 do
        if l_Children_0[v35].Name ~= v33 and l_Children_0[v35]:IsA("ImageButton") then
            l_Children_0[v35].Text.TextColor3 = Color3.fromRGB(255, 255, 255);
        end;
    end;
    l_Buttons_0.Frames[v33].Text.TextColor3 = Color3.fromRGB(247, 202, 24);
    v5.Frames[v33]:SetVisible(true);
end;
v5.GetSelectedButton = function(_) --[[ Line: 108 ]] --[[ Name: GetSelectedButton ]]
    -- upvalues: v5 (copy)
    return v5.Selected;
end;
v5.SelectButton = function(_, v38) --[[ Line: 112 ]] --[[ Name: SelectButton ]]
    -- upvalues: v5 (copy)
    v5.Selected = v38;
end;
v5.GetButton = function(_, v40) --[[ Line: 116 ]] --[[ Name: GetButton ]]
    -- upvalues: v5 (copy)
    return v5.Buttons[v40];
end;
local v41 = nil;
local v42 = nil;
local v43 = nil;
local function v50() --[[ Line: 125 ]] --[[ Name: UpdateLocalCrewData ]]
    -- upvalues: v42 (ref), v41 (ref), v43 (ref), l_Crew_0 (copy), l_NoCrew_0 (copy), l_Invite_0 (copy), l_Invited_0 (copy), v5 (copy)
    v42 = v42 or v41:WaitForChild("Stats");
    v43 = v43 or v42:WaitForChild("Crew");
    if v43.Value == "" then
        l_Crew_0.Visible = false;
        l_NoCrew_0.Visible = true;
        l_Invite_0.Visible = false;
        l_Invited_0.Visible = true;
        local l_Default_1 = v5.Frames.Default;
        l_Default_1:RemoveAllConfigureMembers();
        l_Default_1:RemoveAllViewPageObjects();
        l_Default_1:UpdateCachedData({});
        local v45 = {
            Default = true, 
            Invites = true, 
            Leaderboards = true
        };
        for v46, v47 in pairs(v5.Buttons) do
            if v45[v46] == true then
                v47:EnableButton();
            else
                v47:DisableButton();
            end;
        end;
        return;
    else
        l_Crew_0.Visible = true;
        l_NoCrew_0.Visible = false;
        l_Invite_0.Visible = true;
        l_Invited_0.Visible = false;
        for _, v49 in pairs(v5.Buttons) do
            v49:EnableButton();
        end;
        return;
    end;
end;
local function _() --[[ Line: 170 ]] --[[ Name: DataFolderAdded ]]
    -- upvalues: v42 (ref), v41 (ref), v43 (ref), v50 (copy)
    v42 = v41:WaitForChild("Stats");
    v43 = v42:WaitForChild("Crew");
    v50();
    v43:GetPropertyChangedSignal("Value"):Connect(v50);
end;
v5.Initialize = function(_, v53) --[[ Line: 179 ]] --[[ Name: Initialize ]]
    -- upvalues: v5 (copy), l_Frames_0 (copy), l_UIFrame_0 (copy), l_Buttons_0 (copy), l_UIButton_0 (copy), v41 (ref), l_ReplicatedStorage_0 (copy), l_LocalPlayer_0 (copy), v42 (ref), v43 (ref), v50 (copy), l_UIClient_0 (copy)
    v5.UIController = v53;
    for _, v55 in ipairs(l_Frames_0:GetChildren()) do
        if v55:IsA("Frame") then
            v5.Frames[v55.Name] = l_UIFrame_0.new(v5, v55);
            v5.Frames[v55.Name]:SetVisible(v55.Name == "Default");
        end;
    end;
    for _, v57 in ipairs(l_Buttons_0.Frames:GetChildren()) do
        if v57:IsA("ImageButton") then
            v5.Buttons[v57.Name] = l_UIButton_0.new(v5, v57);
            if v57.Name == "Default" then
                v5:SelectButton(v57);
            end;
        end;
    end;
    v41 = l_ReplicatedStorage_0:WaitForChild("Stats" .. l_LocalPlayer_0.Name, 600);
    if v41 == nil then
        warn("Data Folder did not load after 10 minutes!");
        return;
    else
        v42 = v41:WaitForChild("Stats");
        v43 = v42:WaitForChild("Crew");
        v50();
        v43:GetPropertyChangedSignal("Value"):Connect(v50);
        v5.UIClient = l_UIClient_0:Initialize(v5);
        return;
    end;
end;
return v5;