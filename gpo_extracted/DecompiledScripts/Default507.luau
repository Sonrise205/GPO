local l_LocalPlayer_0 = game.Players.LocalPlayer;
local l_CurrentCamera_0 = workspace.CurrentCamera;
local l_TweenService_0 = game:GetService("TweenService");
local l_CompassGuider_0 = game:GetService("ReplicatedStorage").CompassGuider;
local _ = function(v4, _) --[[ Line: 10 ]] --[[ Name: Check ]]
    if not v4:IsA("GuiObject") then
        return false;
    elseif not v4:GetAttribute("canFade") then
        return false;
    else
        return true;
    end;
end;
local v11 = {
    TextLabel = function(v7, v8) --[[ Line: 17 ]]
        if not (not not v7:IsA("GuiObject") and (v7:GetAttribute("canFade") and true or false)) then
            return;
        else
            v7.TextTransparency = v8;
            return;
        end;
    end, 
    ImageLabel = function(v9, v10) --[[ Line: 22 ]]
        if not (not not v9:IsA("GuiObject") and (v9:GetAttribute("canFade") and true or false)) then
            return;
        else
            v9.ImageTransparency = v10;
            return;
        end;
    end
};
local v12 = {};
v12.__index = v12;
v12.new = function(v13) --[[ Line: 31 ]] --[[ Name: new ]]
    -- upvalues: v12 (copy), l_TweenService_0 (copy), v11 (copy)
    local v14 = setmetatable({}, v12);
    v14.DefaultTransparency = v13.DefaultTransparency or 0;
    v14.Guider = v13.Guider;
    v14.InView = false;
    v14.Angle = 6.283185307179586;
    v14.IsVisible = true;
    v14._lastTrans = -1;
    v14._lastTextUpdate = 0;
    v14.Icon = v13.Icon or script.Icon:Clone();
    if typeof(v13.Guider) == "Instance" and not v13.Icon then
        v14.Icon.Flag.Image = v13.Guider:GetAttribute("ImageIcon") or "";
        v14.Icon.Name = v13.Guider.Name;
        v14.Icon.Info.Title.Text = v13.Guider.Name:upper();
        local l_Position_0 = v14.Icon.Info.Position;
        v14.InViewTweens = {
            [true] = function() --[[ Line: 51 ]]
                -- upvalues: l_TweenService_0 (ref), v14 (copy), l_Position_0 (copy)
                l_TweenService_0:Create(v14.Icon.Info, TweenInfo.new(0.5), {
                    Position = l_Position_0
                }):Play();
                for _, v17 in pairs(v14.Icon.Info:GetChildren()) do
                    if v17:IsA("TextLabel") then
                        l_TweenService_0:Create(v17, TweenInfo.new(0.5), {
                            TextTransparency = 0
                        }):Play();
                    end;
                end;
            end, 
            [false] = function() --[[ Line: 72 ]]
                -- upvalues: l_TweenService_0 (ref), v14 (copy), l_Position_0 (copy)
                l_TweenService_0:Create(v14.Icon.Info, TweenInfo.new(0.5), {
                    Position = l_Position_0 + UDim2.new(0, 0, 0.25, 0)
                }):Play();
                for _, v19 in pairs(v14.Icon.Info:GetChildren()) do
                    if v19:IsA("TextLabel") then
                        l_TweenService_0:Create(v19, TweenInfo.new(0.5), {
                            TextTransparency = 1
                        }):Play();
                    end;
                end;
            end
        };
        v14.InViewTweens[false]();
    end;
    v14.CachedUI = {};
    if v11[v14.Icon.ClassName] then
        table.insert(v14.CachedUI, v14.Icon);
    end;
    for _, v21 in v14.Icon:GetDescendants() do
        if v11[v21.ClassName] then
            table.insert(v14.CachedUI, v21);
        end;
    end;
    v14.Icon.Parent = v13.Parent or v13.Handler.CompassUI;
    v14.Handler = v13.Handler;
    return v14;
end;
v12.AutoOptimize = function(v22) --[[ Line: 116 ]] --[[ Name: AutoOptimize ]]
    local l_Guider_0 = v22.Guider;
    local function _(v24) --[[ Line: 119 ]] --[[ Name: detect ]]
        -- upvalues: v22 (copy), l_Guider_0 (copy)
        local v25 = v22.Handler.InactiveCoordinates[l_Guider_0];
        local v26 = v22.Handler.Coordinates[l_Guider_0];
        if v24 then
            if v25 then
                v22.Handler.InactiveCoordinates[l_Guider_0] = nil;
                v22.Handler.Coordinates[l_Guider_0] = v22;
                v22.Icon.Visible = true;
                return;
            end;
        elseif v26 then
            v22.Handler.Coordinates[l_Guider_0] = nil;
            v22.Handler.InactiveCoordinates[l_Guider_0] = v22;
            v22.Icon.Visible = false;
        end;
    end;
    v22.Optimizer = l_Guider_0:GetAttributeChangedSignal("isEnabled"):Connect(function() --[[ Line: 138 ]]
        -- upvalues: l_Guider_0 (copy), v22 (copy)
        local l_l_Guider_0_Attribute_0 = l_Guider_0:GetAttribute("isEnabled");
        local v29 = v22.Handler.InactiveCoordinates[l_Guider_0];
        local v30 = v22.Handler.Coordinates[l_Guider_0];
        if l_l_Guider_0_Attribute_0 then
            if v29 then
                v22.Handler.InactiveCoordinates[l_Guider_0] = nil;
                v22.Handler.Coordinates[l_Guider_0] = v22;
                v22.Icon.Visible = true;
                return;
            end;
        elseif v30 then
            v22.Handler.Coordinates[l_Guider_0] = nil;
            v22.Handler.InactiveCoordinates[l_Guider_0] = v22;
            v22.Icon.Visible = false;
        end;
    end);
    local l_l_Guider_0_Attribute_1 = l_Guider_0:GetAttribute("isEnabled");
    local v32 = v22.Handler.InactiveCoordinates[l_Guider_0];
    local v33 = v22.Handler.Coordinates[l_Guider_0];
    if l_l_Guider_0_Attribute_1 then
        if v32 then
            v22.Handler.InactiveCoordinates[l_Guider_0] = nil;
            v22.Handler.Coordinates[l_Guider_0] = v22;
            v22.Icon.Visible = true;
            return;
        end;
    elseif v33 then
        v22.Handler.Coordinates[l_Guider_0] = nil;
        v22.Handler.InactiveCoordinates[l_Guider_0] = v22;
        v22.Icon.Visible = false;
    end;
end;
v12.CheckItems = function(v34) --[[ Line: 145 ]] --[[ Name: CheckItems ]]
    -- upvalues: l_LocalPlayer_0 (copy), l_CompassGuider_0 (copy)
    local v35 = nil;
    local l_Guider_1 = v34.Guider;
    local l_l_Guider_1_Attribute_0 = l_Guider_1:GetAttribute("ImageIcon");
    v34.Handler.ItemAddedCheck:Connect(function(v38) --[[ Line: 151 ]]
        -- upvalues: l_LocalPlayer_0 (ref), v34 (copy), v35 (ref), l_Guider_1 (copy)
        local v39 = l_LocalPlayer_0.Backpack:FindFirstChild(v34.Guider.Name .. " Eternal Pose") ~= nil;
        if v38.Name == v34.Guider.Name .. " Eternal Pose" or v38.Name == "Bomi's Log Pose" and _G.HasItem(l_LocalPlayer_0, v34.Guider.Name .. " Eternal Pose") and not v39 then
            v34.Icon.Flag.Image = v38.TextureId;
            if v35 then
                return;
            else
                v35 = l_Guider_1:GetAttributeChangedSignal("isEnabled"):Connect(function() --[[ Line: 158 ]]
                    -- upvalues: l_Guider_1 (ref)
                    if l_Guider_1:GetAttribute("isEnabled") then
                        return;
                    else
                        l_Guider_1:SetAttribute("isEnabled", true);
                        return;
                    end;
                end);
                l_Guider_1:SetAttribute("isEnabled", true);
            end;
        end;
    end);
    v34.Handler.ItemRemovedCheck:Connect(function(v40) --[[ Line: 167 ]]
        -- upvalues: l_LocalPlayer_0 (ref), v34 (copy), v35 (ref), l_l_Guider_1_Attribute_0 (copy), l_Guider_1 (copy), l_CompassGuider_0 (ref)
        local l_FirstChild_0 = l_LocalPlayer_0.Backpack:FindFirstChild(v34.Guider.Name .. " Eternal Pose");
        local l_FirstChild_1 = l_LocalPlayer_0.Backpack:FindFirstChild("Bomi's Log Pose");
        if v40.Name == v34.Guider.Name .. " Eternal Pose" or v40.Name == "Bomi's Log Pose" and _G.HasItem(l_LocalPlayer_0, v34.Guider.Name .. " Eternal Pose") then
            if v40.Parent == l_LocalPlayer_0.Character then
                return;
            elseif not v35 then
                return;
            else
                v34.Icon.Flag.Image = l_FirstChild_1 and l_FirstChild_1.TextureId or l_FirstChild_0 and l_FirstChild_0.TextureId or l_l_Guider_1_Attribute_0;
                if not l_FirstChild_1 and not l_FirstChild_0 then
                    v35:Disconnect();
                    v35 = nil;
                end;
                l_Guider_1:SetAttribute("isEnabled", l_Guider_1:GetAttribute("Type") == "Flag" and l_CompassGuider_0:GetAttribute("CapturePointEnabled") or l_FirstChild_0 ~= nil or l_FirstChild_1 ~= nil);
            end;
        end;
    end);
end;
v12.GetAngle = function(v43, v44) --[[ Line: 187 ]] --[[ Name: GetAngle ]]
    if typeof(v43.Guider) == "number" then
        return v43.Guider + 1.5707963267948966;
    elseif typeof(v43.Guider) == "Instance" then
        local l_Value_0 = v43.Guider.Value;
        return (math.atan2(l_Value_0.Z - v44.Z, l_Value_0.X - v44.X));
    else
        return nil;
    end;
end;
v12._setUIVisiblity = function(v46, v47) --[[ Line: 201 ]] --[[ Name: _setUIVisiblity ]]
    -- upvalues: l_CurrentCamera_0 (copy)
    if typeof(v46.Guider) == "Instance" then
        local v48 = false;
        if CFrame.new(l_CurrentCamera_0.CFrame.Position * Vector3.new(1, 0, 1, 0), v46.Guider.Value * Vector3.new(1, 0, 1, 0)).LookVector:Dot(l_CurrentCamera_0.CFrame.LookVector * Vector3.new(1, 0, 1, 0)) > 0 then
            v48 = v46.Guider:GetAttribute("isEnabled");
        end;
        return v48;
    else
        return math.sin(v47) > 0;
    end;
end;
v12.SetInView = function(v49, v50) --[[ Line: 209 ]] --[[ Name: SetInView ]]
    if v49.InView == v50 then
        return;
    elseif not v49.Guider:GetAttribute("isEnabled") then
        return;
    else
        v49.InView = v50;
        v49.InViewTweens[v50]();
        return;
    end;
end;
v12.UpdateTransparency = function(v51, v52) --[[ Line: 217 ]] --[[ Name: UpdateTransparency ]]
    -- upvalues: v11 (copy)
    if not v51.CachedUI then
        return;
    else
        for _, v54 in v51.CachedUI do
            v11[v54.ClassName](v54, v52);
        end;
        return;
    end;
end;
v12.Update = function(v55, v56, v57) --[[ Line: 227 ]] --[[ Name: Update ]]
    local l_Position_1 = (v56 or workspace.CurrentCamera.CFrame).Position;
    local l_v55_Angle_0 = v55:GetAngle(l_Position_1);
    if not l_v55_Angle_0 then
        return;
    else
        l_v55_Angle_0 = v55.Handler.RestrictAngle(l_v55_Angle_0 - v55.Handler.PlayerLookAngle);
        if v57 then
            local v60 = false;
            if v55.Icon:GetAttribute("CanVisible") ~= false then
                v60 = math.cos(l_v55_Angle_0) > 0 and typeof(v55.Guider) == "Instance" and v55.Guider:GetAttribute("isEnabled");
            end;
            v55.IsVisible = v60;
            v55.Icon.Visible = v60;
            if v60 and typeof(v55.Guider) == "Instance" then
                local v61 = os.clock();
                if v61 - (v55._lastTextUpdate or 0) > 0.5 then
                    v55.Icon.Info.Distance.Text = math.floor((v55.Guider.Value - l_Position_1).Magnitude) .. " STUDS";
                    v55._lastTextUpdate = v61;
                end;
            end;
            local v62 = 1 - math.cos(l_v55_Angle_0);
            if math.abs((v55._lastTrans or -1) - v62) > 0.05 then
                v55:UpdateTransparency(v62);
                v55._lastTrans = v62;
            end;
        end;
        if not v55.IsVisible then
            return;
        else
            local v63 = math.sin(l_v55_Angle_0);
            v55.Angle = v63;
            local v64 = v63 * 0.6 + 0.5;
            if math.abs(v55.Icon.Position.X.Scale - v64) > 0.001 then
                v55.Icon.Position = UDim2.new(v64, v55.Icon.Position.X.Offset, 0, 3);
            end;
            return;
        end;
    end;
end;
v12.Destroy = function(v65) --[[ Line: 276 ]] --[[ Name: Destroy ]]
    if v65.Optimizer then
        v65.Optimizer:Disconnect();
        v65.Optimizer = nil;
    end;
    v65.Icon:Destroy();
    setmetatable(v65, nil);
    v65 = nil;
end;
return v12;