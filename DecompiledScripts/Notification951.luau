local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_Players_0 = game:GetService("Players");
local l_Modules_0 = l_ReplicatedStorage_0:WaitForChild("Modules");
local l_RichText_0 = require(l_Modules_0:WaitForChild("RichText"));
local l_TweenService_0 = game:GetService("TweenService");
local l_Shared_0 = l_Modules_0.Shared;
local v6 = require(l_Shared_0.GameUtils);
local _ = require(l_Shared_0.DebrisService);
local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
local l_PlayerGui_0 = l_LocalPlayer_0.PlayerGui;
local l_Notifications_0 = l_PlayerGui_0:WaitForChild("Notifications");
local v11 = {};
local l_PlayerScripts_0 = l_LocalPlayer_0:WaitForChild("PlayerScripts");
if require(l_PlayerScripts_0:WaitForChild("InputHandler"):WaitForChild("GetPreferredInput")).Current == "Mobile" then
    local l_Size_0 = l_Notifications_0.Frame.Size;
    local l_Position_0 = l_Notifications_0.Frame.Position;
    local v15 = UDim2.new(l_Size_0.X.Scale * 1.5, 0, l_Size_0.Y.Scale * 1.5, 0);
    local v16 = UDim2.new(l_Position_0.X.Scale, 0, l_Position_0.Y.Scale + l_Size_0.Y.Scale * 1.5 / 4, 0);
    l_Notifications_0.Frame.Size = v15;
    l_Notifications_0.Frame2.Size = v15;
    l_Notifications_0.Frame.Position = v16;
    l_Notifications_0.Frame2.Position = v16;
end;
local v17 = {};
local _ = {};
local _ = function() --[[ Line: 40 ]] --[[ Name: reOrder ]]
    -- upvalues: l_Notifications_0 (ref)
    if not l_Notifications_0 then
        return;
    else
        local v19 = {};
        for _, v21 in ipairs(l_Notifications_0.Frame:GetChildren()) do
            if v21:IsA("TextLabel") and v21.Parent ~= nil then
                table.insert(v19, v21);
            end;
        end;
        for v22 = 1, #v19 do
            local v23 = v19[v22];
            if v23 and v23.Parent ~= nil then
                local l_status_0, l_result_0 = pcall(function() --[[ Line: 55 ]]
                    -- upvalues: v23 (copy), v22 (copy)
                    v23:TweenPosition(UDim2.new(0, 0, 0.1 * v22, 0), "Out", "Quad", 0.25, true);
                end);
                if not l_status_0 then
                    warn(l_result_0);
                end;
            end;
        end;
        return;
    end;
end;
local function _(v27) --[[ Line: 65 ]] --[[ Name: isErrorMessage ]]
    if string.len(v27) >= 11 then
        if string.sub(v27, 1, 11) == "<Color=Red>" then
            return true;
        else
            return false;
        end;
    else
        return false;
    end;
end;
hasOnlyOnePattern = function(v29) --[[ Line: 78 ]] --[[ Name: hasOnlyOnePattern ]]
    local v30, v31 = string.find(v29, "<Color=");
    if not v30 then
        return false;
    else
        return string.find(v29, "<Color=", v31 + 1) == nil;
    end;
end;
local function _() --[[ Line: 91 ]] --[[ Name: playQueueSound ]]
    local v32 = script["Notification Warning"]:Clone();
    v32.Parent = script;
    v32.Name = "sfx";
    v32:Play();
    _G.destroy(v32, 3);
end;
local function v55(v34, _, _) --[[ Line: 101 ]] --[[ Name: createNotification ]]
    -- upvalues: l_Notifications_0 (ref), v17 (copy), l_RichText_0 (copy), l_TweenService_0 (copy)
    local v37 = false;
    if (string.len(v34) >= 11 and string.sub(v34, 1, 11) == "<Color=Red>") == true and hasOnlyOnePattern(v34) == true then
        script.RedText4:Play();
        v37 = true;
    end;
    local l_Frame_0 = l_Notifications_0.Frame;
    if v17[v34] == nil then
        local v39 = script.TextLabel:Clone();
        v39.Parent = l_Frame_0;
        v39.Visible = true;
        local v40 = #l_Frame_0:GetChildren() - 1;
        v39.Position = UDim2.new(0, 0, v40 * 0.1 - 1, 0);
        v39:TweenPosition(UDim2.new(0, 0, v40 * 0.1, 0), "Out", "Quad", 0.25, true);
        l_RichText_0:New(v39, "<AnimateStyle=Appear><ContainerHorizontalAlignment=Center><TextStrokeTransparency=0>" .. v34, {
            ZIndex = 10, 
            TextScale = 1, 
            AnimateStepFrequency = 3
        }):ShowFast();
        local v41 = 0;
        local v42 = #v39:GetChildren();
        if v42 >= 3 then
            v41 = v39.AbsoluteSize.Y * (v42 - 2);
        end;
        v39.Size = UDim2.new(1, 0, 0.1, v41);
        local v43 = string.len(v34) * 0.15;
        if v43 >= 10 then
            v43 = 10;
        end;
        local v44 = task.delay(v43, function() --[[ Line: 146 ]]
            -- upvalues: v39 (copy), v17 (ref), v34 (copy)
            v39:Destroy();
            v17[v34] = nil;
        end);
        if v17[v34] == nil then
            v17[v34] = {
                NotificationLabel = v39, 
                DestroyTask = v44
            };
        end;
        local l_v39_Descendants_0 = v39:GetDescendants();
        for v46 = 1, #l_v39_Descendants_0 do
            local v47 = l_v39_Descendants_0[v46];
            if v47:IsA("TextLabel") and v47.Visible == true and v47.Text ~= "" and v47.TextTransparency < 1 then
                script.UIStroke:Clone().Parent = v47;
            end;
        end;
        return;
    else
        local l_NotificationLabel_0 = v17[v34].NotificationLabel;
        local l_DestroyTask_0 = v17[v34].DestroyTask;
        task.cancel(l_DestroyTask_0);
        local v50 = string.len(v34) * 0.15;
        if v50 >= 10 then
            v50 = 10;
        end;
        local v51 = task.delay(v50, function() --[[ Line: 174 ]]
            -- upvalues: l_NotificationLabel_0 (copy), v17 (ref), v34 (copy)
            l_NotificationLabel_0:Destroy();
            v17[v34] = nil;
        end);
        local l_BoomScale_0 = l_NotificationLabel_0:FindFirstChild("BoomScale");
        if l_BoomScale_0 then
            l_BoomScale_0:Destroy();
        end;
        local l_UIScale_0 = Instance.new("UIScale");
        l_UIScale_0.Name = "BoomScale";
        l_UIScale_0.Scale = 1;
        l_UIScale_0.Parent = l_NotificationLabel_0;
        l_TweenService_0:Create(l_UIScale_0, TweenInfo.new(0.1, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut, 0, true, 0), {
            Scale = 1.25
        }):Play();
        _G.destroy(l_UIScale_0, 0.2);
        if v37 == false then
            local v54 = script["Notification Warning"]:Clone();
            v54.Parent = script;
            v54.Name = "sfx";
            v54:Play();
            _G.destroy(v54, 3);
        end;
        v17[v34] = {
            NotificationLabel = l_NotificationLabel_0, 
            DestroyTask = v51
        };
        return;
    end;
end;
v11.DisplayMessage = function(v56, v57, v58) --[[ Line: 203 ]] --[[ Name: DisplayMessage ]]
    -- upvalues: v6 (copy), l_LocalPlayer_0 (copy), l_Notifications_0 (ref), l_PlayerGui_0 (copy), v55 (copy)
    local v59 = v6.GetStatsFolder(l_LocalPlayer_0);
    if v58 ~= nil and v59.Settings.ShowShouts.Value == false then
        return;
    else
        if not l_Notifications_0 then
            l_Notifications_0 = l_PlayerGui_0:WaitForChild("Notifications", 600);
        end;
        _G.bindableExcu(function() --[[ Line: 214 ]]
            -- upvalues: v55 (ref), v56 (copy), v57 (copy), v58 (copy)
            v55(v56, v57, v58);
        end);
        return;
    end;
end;
_G.displayMessage = v11.DisplayMessage;
return v11;