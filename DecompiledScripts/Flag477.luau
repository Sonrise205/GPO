local v0 = require(script.Parent.Default);
local _ = workspace.CurrentCamera;
local l_CompassGuider_0 = game.ReplicatedStorage.CompassGuider;
local l_TweenService_0 = game:GetService("TweenService");
local v4, _, _, _, v8 = require(game.ReplicatedStorage.Modules.ScriptSet).get();
local _ = function(v9, _) --[[ Line: 9 ]] --[[ Name: Check ]]
    if not v9:IsA("GuiObject") then
        return false;
    elseif not v9:GetAttribute("canFade") then
        return false;
    else
        return true;
    end;
end;
local v16 = {
    TextLabel = function(v12, v13) --[[ Line: 16 ]]
        if not (not not v12:IsA("GuiObject") and (v12:GetAttribute("canFade") and true or false)) then
            return;
        else
            v12.TextTransparency = v13;
            return;
        end;
    end, 
    ImageLabel = function(v14, v15) --[[ Line: 21 ]]
        if not (not not v14:IsA("GuiObject") and (v14:GetAttribute("canFade") and true or false)) then
            return;
        else
            v14.ImageTransparency = v15;
            return;
        end;
    end
};
local v17 = {
    __index = v0
};
v17.new = function(v18) --[[ Line: 30 ]] --[[ Name: new ]]
    -- upvalues: v17 (copy), l_TweenService_0 (copy), v16 (copy), v8 (copy), v4 (copy), l_CompassGuider_0 (copy)
    local v19 = setmetatable({}, v17);
    local v20 = script.Icon:Clone();
    v20.Name = v18.Guider.Name;
    v20.Info.Title.Text = v18.Guider.Name;
    v20:SetAttribute("CanVisible", true);
    v20.Parent = v18.Parent;
    v19.Angle = 6.283185307179586;
    v19.Guider = v18.Guider;
    v19.Icon = v20;
    v19.DefaultTransparency = v18.DefaultTransparency or 0;
    v19.InView = false;
    v19.Handler = v18.Handler;
    local l_Position_0 = v19.Icon.Info.Position;
    v19.InViewTweens = {
        [true] = function() --[[ Line: 49 ]]
            -- upvalues: v19 (copy), l_TweenService_0 (ref), l_Position_0 (copy)
            if v19.Icon.Visible == false then
                return;
            else
                l_TweenService_0:Create(v19.Icon.Info, TweenInfo.new(0.5), {
                    Position = l_Position_0
                }):Play();
                for _, v23 in pairs(v19.Icon.Info:GetChildren()) do
                    if v23:IsA("TextLabel") then
                        l_TweenService_0:Create(v23, TweenInfo.new(0.5), {
                            TextTransparency = 0
                        }):Play();
                    end;
                end;
                return;
            end;
        end, 
        [false] = function() --[[ Line: 73 ]]
            -- upvalues: v19 (copy), l_TweenService_0 (ref), l_Position_0 (copy)
            if v19.Icon.Visible == false then
                return;
            else
                l_TweenService_0:Create(v19.Icon.Info, TweenInfo.new(0.5), {
                    Position = l_Position_0 + UDim2.new(0, 0, 0.25, 0)
                }):Play();
                for _, v25 in pairs(v19.Icon.Info:GetChildren()) do
                    if v25:IsA("TextLabel") then
                        l_TweenService_0:Create(v25, TweenInfo.new(0.5), {
                            TextTransparency = 1
                        }):Play();
                    end;
                end;
                return;
            end;
        end
    };
    v19.CachedUI = {};
    if v16[v19.Icon.ClassName] then
        table.insert(v19.CachedUI, v19.Icon);
    end;
    for _, v27 in v19.Icon:GetDescendants() do
        if v16[v27.ClassName] then
            table.insert(v19.CachedUI, v27);
        end;
    end;
    local function v29() --[[ Line: 110 ]] --[[ Name: updateInfamyGained ]]
        -- upvalues: v19 (copy)
        local l_Attribute_0 = v19.Guider:GetAttribute("InfamyAccumulated");
        v19.Icon.Info.InfamyAccumulated.Text = l_Attribute_0 .. " INFAMY EARNED";
    end;
    local function v31() --[[ Line: 115 ]] --[[ Name: updateCapturedText ]]
        -- upvalues: v19 (copy), v8 (ref)
        local l_Attribute_1 = v19.Guider:GetAttribute("Captured");
        v19.Icon.Info.Captured.Text = l_Attribute_1 == "" and "None" or "CAPTURED BY: " .. l_Attribute_1;
        if l_Attribute_1 ~= "" and l_Attribute_1 ~= v8.Stats.Crew.Value then
            v19.Icon.Flag.ImageColor3 = Color3.fromRGB(255, 0, 0);
            v19.Icon.Info.InfamyAccumulated.Visible = false;
            return;
        elseif l_Attribute_1 ~= "" then
            v19.Icon.Flag.ImageColor3 = Color3.fromRGB(0, 255, 0);
            v19.Icon.Info.InfamyAccumulated.Visible = true;
            return;
        else
            v19.Icon.Flag.ImageColor3 = Color3.fromRGB(255, 255, 255);
            v19.Icon.Info.InfamyAccumulated.Visible = false;
            return;
        end;
    end;
    local v32 = game.ReplicatedStorage:WaitForChild("Stats" .. v4.Name);
    local l_Crew_0 = v32.Stats.Crew;
    local l_ShowCapturePoints_0 = v32.Settings.ShowCapturePoints;
    local function v36() --[[ Line: 135 ]] --[[ Name: updateVisibility ]]
        -- upvalues: l_CompassGuider_0 (ref), v19 (copy), l_Crew_0 (copy)
        local l_l_CompassGuider_0_Attribute_0 = l_CompassGuider_0:GetAttribute("CapturePointEnabled");
        v19.Guider:SetAttribute("isEnabled", l_l_CompassGuider_0_Attribute_0 and l_Crew_0.Value ~= "");
        if not l_l_CompassGuider_0_Attribute_0 then
            v19.Icon.Info.InfamyAccumulated.Visible = false;
        end;
    end;
    local function v38(v37) --[[ Line: 145 ]] --[[ Name: onCrewChanged ]]
        -- upvalues: v19 (copy)
        v19.Guider:SetAttribute("isEnabled", v37 ~= "");
    end;
    local function v39() --[[ Line: 149 ]] --[[ Name: updateDisplay ]]
        -- upvalues: v19 (copy), l_ShowCapturePoints_0 (copy)
        if v19.Guider:GetAttribute("Captured") == nil then
            return;
        elseif l_ShowCapturePoints_0.Value == true then
            v19.Icon:SetAttribute("CanVisible", true);
            return;
        else
            v19.Icon:SetAttribute("CanVisible", false);
            return;
        end;
    end;
    v19.Guider:GetAttributeChangedSignal("Captured"):Connect(v31);
    v19.Guider:GetAttributeChangedSignal("InfamyAccumulated"):Connect(v29);
    l_CompassGuider_0:GetAttributeChangedSignal("CapturePointEnabled"):Connect(v36);
    v31();
    local l_Attribute_2 = v19.Guider:GetAttribute("InfamyAccumulated");
    v19.Icon.Info.InfamyAccumulated.Text = l_Attribute_2 .. " INFAMY EARNED";
    l_Attribute_2 = l_CompassGuider_0:GetAttribute("CapturePointEnabled");
    v19.Guider:SetAttribute("isEnabled", l_Attribute_2 and l_Crew_0.Value ~= "");
    if not l_Attribute_2 then
        v19.Icon.Info.InfamyAccumulated.Visible = false;
    end;
    l_Crew_0.Changed:Connect(v38);
    l_Attribute_2 = l_Crew_0.Value;
    v19.Guider:SetAttribute("isEnabled", l_Attribute_2 ~= "");
    l_ShowCapturePoints_0.Changed:Connect(v39);
    if v19.Guider:GetAttribute("Captured") ~= nil then
        if l_ShowCapturePoints_0.Value == true then
            v19.Icon:SetAttribute("CanVisible", true);
        else
            v19.Icon:SetAttribute("CanVisible", false);
        end;
    end;
    v19.InViewTweens[false]();
    return v19;
end;
return v17;