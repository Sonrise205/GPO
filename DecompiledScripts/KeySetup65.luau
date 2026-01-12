local v0 = {};
local l_LocalPlayer_0 = game.Players.LocalPlayer;
local _ = require(game.ReplicatedStorage.Modules.MEnterLeave);
local v3 = require(game.ReplicatedStorage.Modules.Skills);
local v4 = true;
local _ = {};
local v6 = nil;
local v7 = require(game.ReplicatedStorage.Modules.Skills);
local v8 = {};
local v9 = {};
local v10 = {};
local _ = require(game.ReplicatedStorage.Modules.FastWait);
local v12 = {};
local v13 = nil;
local function v20(v14) --[[ Line: 17 ]] --[[ Name: getButton ]]
    -- upvalues: v6 (ref)
    local l_Descendants_0 = script.GUI:GetDescendants();
    if v6 then
        local l_v6_Descendants_0 = v6:GetDescendants();
        for v17 = 1, #l_v6_Descendants_0 do
            table.insert(l_Descendants_0, l_v6_Descendants_0[v17]);
        end;
    end;
    local v18 = {};
    for v19 = 1, #l_Descendants_0 do
        if l_Descendants_0[v19].Name == v14 then
            table.insert(v18, l_Descendants_0[v19]);
        end;
    end;
    return v18;
end;
local function _(v21) --[[ Line: 35 ]] --[[ Name: round ]]
    if v21 >= 0 then
        return (math.floor(v21 + 0.5));
    else
        return (math.ceil(v21 - 0.5));
    end;
end;
local function _(v23) --[[ Line: 43 ]] --[[ Name: roundToNearestHundredth ]]
    local v24 = v23 * 10;
    return (if v24 >= 0 then math.floor(v24 + 0.5) else math.ceil(v24 - 0.5)) / 10;
end;
v0.cooldown = function(_, v27, v28, v29) --[[ Line: 47 ]] --[[ Name: cooldown ]]
    -- upvalues: l_LocalPlayer_0 (copy), v20 (copy), v10 (copy), v12 (copy)
    task.spawn(function() --[[ Line: 48 ]]
        -- upvalues: l_LocalPlayer_0 (ref), v29 (copy), v20 (ref), v27 (copy), v10 (ref), v28 (ref), v12 (ref)
        local l_Keys_0 = l_LocalPlayer_0.PlayerGui:FindFirstChild("Keys");
        if v29 then
            l_Keys_0 = v29;
        end;
        local v31 = v20(v27);
        for v32 = 1, #v31 do
            local v33 = v31[v32];
            local v34 = nil;
            v34 = v33;
            if v10[v27] == nil and v28 then
                v10[v27] = {
                    endTime = tick() + v28, 
                    coolTime = v28, 
                    startTime = tick()
                };
                task.delay(v28, function() --[[ Line: 60 ]]
                    -- upvalues: v10 (ref), v27 (ref)
                    v10[v27] = nil;
                end);
            end;
            v28 = v10[v27].coolTime;
            do
                local l_v34_0 = v34;
                task.spawn(function() --[[ Line: 68 ]]
                    -- upvalues: v10 (ref), v27 (ref), v12 (ref), v28 (ref), l_v34_0 (ref)
                    local l_startTime_0 = v10[v27].startTime;
                    local v37 = Color3.fromRGB(255, 0, 0);
                    local v38 = game:GetService("HttpService"):GenerateGUID();
                    v12[v27] = v38;
                    local v39 = false;
                    while v28 ~= 0 do
                        if v12[v27] ~= v38 then
                            v39 = true;
                            break;
                        else
                            local v40 = 1 - (tick() - l_startTime_0) / v28;
                            local _, _ = pcall(function() --[[ Line: 86 ]]
                                -- upvalues: l_v34_0 (ref), v37 (copy), v40 (copy), v28 (ref), l_startTime_0 (copy)
                                l_v34_0.TextLabel.Frame.UIGradient.Color = ColorSequence.new({
                                    ColorSequenceKeypoint.new(0, v37), 
                                    ColorSequenceKeypoint.new(math.clamp(v40 * 0.9, 0, 0.9), v37), 
                                    ColorSequenceKeypoint.new(v40, Color3.fromRGB(255, 255, 255)), 
                                    ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 255, 255))
                                });
                                l_v34_0.Frame.cdStroke.Enabled = true;
                                local l_cdTimer_0 = l_v34_0.TextLabel.cdTimer;
                                local v42 = (v28 - (tick() - l_startTime_0)) * 10;
                                l_cdTimer_0.Text = (if v42 >= 0 then math.floor(v42 + 0.5) else math.ceil(v42 - 0.5)) / 10;
                                l_v34_0.TextLabel.cdTimer.Visible = true;
                            end);
                            game["Run Service"].Heartbeat:Wait();
                            if tick() - l_startTime_0 >= v28 then
                                break;
                            end;
                        end;
                    end;
                    if v12[v27] == v38 then
                        v12[v27] = nil;
                    end;
                    if v39 == false then
                        v10[v27] = nil;
                    end;
                    l_v34_0.TextLabel.Frame.UIGradient.Color = ColorSequence.new(Color3.fromRGB(255, 255, 255));
                    l_v34_0.TextLabel.cdTimer.Visible = false;
                    l_v34_0.Frame.cdStroke.Enabled = false;
                end);
            end;
        end;
    end);
end;
local v45 = nil;
local v46 = nil;
local v47 = {};
local function v59(v48, v49, v50) --[[ Line: 114 ]] --[[ Name: updateButton ]]
    -- upvalues: v7 (copy), v47 (ref)
    local l_FirstChild_0 = game.ReplicatedStorage:FindFirstChild("Stats" .. game.Players.LocalPlayer.Name);
    if l_FirstChild_0 == nil then
        return true;
    else
        local v52 = true;
        local v53 = 0;
        local v54 = false;
        if v7.GetM(v50).hiddenLock ~= nil then
            v54 = true;
        end;
        if v49 ~= nil then
            for v55, v56 in v49 do
                local _ = l_FirstChild_0.Stats:FindFirstChild(v55);
                local v58 = v7.GetM(v50);
                if _G.MeetReq(v58.statreq) then
                    v52 = false;
                    v48.desc.img.TextLabel.Text = v58.desc;
                    v48.Frame.TextLabel.Text = v50;
                    v53 = v56;
                else
                    v48.desc.img.TextLabel.Text = "???";
                    v48.Frame.TextLabel.Text = "???";
                    v52 = true;
                    if v55:match("/SKILL/") == nil then
                        v53 = v56;
                    end;
                end;
            end;
        else
            v52 = false;
        end;
        if v52 == true then
            if v54 == false then
                v48.lock.levelreq.Text = v53;
            else
                v48.lock.levelreq.Text = "???";
            end;
            v48.lock.Visible = true;
            v48.TextLabel.Visible = false;
        else
            v48.lock.Visible = false;
            v48.TextLabel.Visible = true;
        end;
        v47[v48] = v52;
        return v52;
    end;
end;
local v60 = {};
v0.Destroy = function(_) --[[ Line: 164 ]] --[[ Name: Destroy ]]
    -- upvalues: v6 (ref), v9 (copy), v8 (copy), v47 (ref)
    if v6 and not pcall(function() --[[ Line: 166 ]]
        -- upvalues: v6 (ref)
        v6.Parent = script.GUI;
    end) then
        v9[v6.Name] = nil;
        v8[v6.Name] = nil;
        v6 = nil;
    end;
    v47 = {};
end;
local v62 = nil;
v0.setup = function(_, v64, v65) --[[ Line: 182 ]] --[[ Name: setup ]]
    -- upvalues: l_LocalPlayer_0 (copy), v62 (ref), v8 (copy), v6 (ref), v9 (copy), v47 (ref), v46 (ref), v0 (copy), v3 (copy), v60 (copy), v10 (copy), v13 (ref), v4 (ref), v45 (ref)
    local _ = game.ReplicatedStorage:FindFirstChild("Stats" .. l_LocalPlayer_0.Name);
    if v62 == nil then
        v62 = game.Players.LocalPlayer.Character;
    end;
    if l_LocalPlayer_0.PlayerGui:FindFirstChild("Keys") == nil then
        if v8[v64] and v8[v64]:IsDescendantOf(script.GUI) then
            v6 = v8[v64];
            v6.Parent = game.Players.LocalPlayer.PlayerGui;
        elseif v8[v64] and v8[v64]:IsDescendantOf(script) == false then
            if v9[v64] then
                pcall(function() --[[ Line: 197 ]]
                    -- upvalues: v8 (ref), v64 (copy), v47 (ref)
                    local l_Children_0 = v8[v64].Frame:GetChildren();
                    for v68 = 1, #l_Children_0 do
                        if v47[l_Children_0[v68]] then
                            v47[l_Children_0[v68]] = nil;
                        end;
                    end;
                end);
            end;
            v8[v64]:Destroy();
            v8[v64] = nil;
        end;
        local v69 = nil;
        if v8[v64] == nil then
            v69 = script.Keys:Clone();
            v69.Parent = game.Players.LocalPlayer.PlayerGui;
            v69.Frame.Frame.Visible = false;
            v69.Frame.nameFrame.TextLabel.Text = v64;
            if _G.mobile == true then
                v69.Frame.Size = UDim2.new(v69.Frame.Size.X.Scale, 0, 0.6, 0);
            end;
        else
            v69 = v8[v64];
        end;
        if v46 then
            v46:Disconnect();
            v46 = nil;
        end;
        v8[v64] = v69;
        v6 = v69;
        if v69:FindFirstChild("Frame") == nil then
            v69:Destroy();
            v8[v64] = nil;
            _G.keysetup:Destroy();
            v0:setup(v64, v65);
            return;
        else
            local v70 = #v65;
            for v71 = 1, #v65 do
                local v72 = v65[v71][1];
                if v69.Frame:FindFirstChild(v65[v71][1]) == nil then
                    local v73 = v65[v71][2];
                    if string.len(v73) == 1 then
                        v73 = string.upper(v65[v71][2]);
                    end;
                    local v74 = v65[v71][3];
                    local v75 = v69.Frame.Frame:Clone();
                    v75.Name = v72;
                    v75.LayoutOrder = v70 - v71;
                    v75.TextLabel.TextLabel.Text = v73;
                    v75:SetAttribute("buttonKey", "Enum.KeyCode." .. v73);
                    if v74 then
                        v75.TextLabel.TextLabel.Text = v74 .. " " .. v73;
                    end;
                    v75.Frame.TextLabel.Text = v72;
                    v75.Visible = true;
                    local _ = v75.TextLabel.Frame.BackgroundColor3;
                    local l_statreq_0 = v3.GetM(v72).statreq;
                    local _ = v75.desc.img.Position;
                    local v79 = UDim2.new(1, 0, 0, 0);
                    v75.desc.img.Position = v79;
                    v75.desc.img.TextLabel.Text = v3.GetM(v72).desc;
                    table.insert(v60, {
                        v75, 
                        l_statreq_0, 
                        v72
                    });
                    v75.Parent = v69.Frame;
                end;
                if v10[v72] then
                    warn(v72 .. " has eixsitng cd");
                    v13:cooldown(v72, nil, v69);
                end;
            end;
            local v80 = false;
            local _ = v69.Frame.Position.X.Scale;
            local v82 = UDim2.new(script.Keys.Frame.Position.X.Scale, 0, v69.Frame.Position.Y.Scale, 0);
            local v83 = UDim2.new(1.25, 0, v69.Frame.Position.Y.Scale, 0);
            if v4 then
                v69.TextButton.TextLabel.Text = "Close";
                v69.Frame.Position = v82;
            else
                v69.TextButton.TextLabel.Text = "Open";
                v69.Frame.Position = v83;
            end;
            if v45 then
                v45:Disconnect();
                v45 = nil;
            end;
            do
                local l_v69_0, l_v80_0 = v69, v80;
                v45 = l_v69_0.TextButton.MouseButton1Click:Connect(function() --[[ Line: 296 ]]
                    -- upvalues: l_v80_0 (ref), v4 (ref), l_v69_0 (ref), v82 (copy), v83 (copy)
                    if l_v80_0 == false then
                        v4 = not v4;
                        l_v80_0 = true;
                        if v4 then
                            l_v69_0.TextButton.TextLabel.Text = "Close";
                            l_v69_0.Frame:TweenPosition(v82, "Out", "Quad", 0.25, true);
                        else
                            l_v69_0.TextButton.TextLabel.Text = "Open";
                            l_v69_0.Frame:TweenPosition(v83, "Out", "Quad", 0.5, true);
                        end;
                        task.wait(0.3);
                        l_v80_0 = false;
                    end;
                end);
                if v62 ~= game.Players.LocalPlayer.Character then
                    v62 = game.Players.LocalPlayer.Character;
                end;
            end;
        end;
    end;
end;
local function v90(v86) --[[ Line: 317 ]] --[[ Name: getButton ]]
    -- upvalues: v6 (ref)
    if v6 == nil then
        return;
    else
        local v87 = nil;
        if v6:FindFirstChild("Frame") == nil then
            return;
        else
            local l_Children_1 = v6.Frame:GetChildren();
            for v89 = 1, #l_Children_1 do
                if l_Children_1[v89]:GetAttribute("buttonKey") ~= nil and l_Children_1[v89]:GetAttribute("buttonKey") == tostring(v86) then
                    return l_Children_1[v89];
                end;
            end;
            return v87;
        end;
    end;
end;
game:GetService("UserInputService").InputBegan:Connect(function(v91, v92) --[[ Line: 337 ]]
    -- upvalues: v6 (ref), v90 (copy), v47 (ref)
    if v6 == nil then
        return;
    elseif v92 == true then
        return;
    else
        local v93 = v90(v91.KeyCode);
        if v93 ~= nil and v47[v93] == false then
            v93.TextLabel.Frame.BackgroundColor3 = Color3.fromRGB(151, 198, 255);
            local v94 = nil;
            do
                local l_v94_0 = v94;
                l_v94_0 = game:GetService("UserInputService").InputEnded:Connect(function(v96, v97) --[[ Line: 346 ]]
                    -- upvalues: v91 (copy), l_v94_0 (ref), v93 (copy)
                    if v97 == false and v96.KeyCode == v91.KeyCode then
                        l_v94_0:Disconnect();
                        l_v94_0 = nil;
                        v93.TextLabel.Frame.BackgroundColor3 = Color3.fromRGB(255, 255, 255);
                    end;
                end);
            end;
        end;
        return;
    end;
end);
task.spawn(function() --[[ Line: 356 ]]
    -- upvalues: v60 (copy), v59 (copy)
    while true do
        for v98 = 1, #v60 do
            if v60[v98] then
                local v99, v100, v101 = unpack(v60[v98]);
                if v99 == nil or v99 and v99.Parent == nil then
                    table.remove(v60, v98);
                else
                    v59(v99, v100, v101);
                end;
            else
                table.remove(v60, v98);
            end;
        end;
        task.wait(0.2);
    end;
end);
v13 = v0;
game.Players.LocalPlayer.CharacterAdded:Connect(function() --[[ Line: 376 ]]
    -- upvalues: v8 (copy), v0 (copy)
    for _, v103 in pairs(v8) do
        if v103 then
            v103:Destroy();
        end;
    end;
    table.clear(v8);
    v0:Destroy();
end);
return v0;