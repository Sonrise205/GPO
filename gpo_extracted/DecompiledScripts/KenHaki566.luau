local v0 = {
    On = false, 
    maxDistance = 100, 
    kenTime = 0, 
    kenColor = Color3.fromRGB(110, 153, 202)
};
local l_LocalPlayer_0 = game.Players.LocalPlayer;
local l_ScreenGui_0 = Instance.new("ScreenGui");
l_ScreenGui_0.Name = "KenHaki";
l_ScreenGui_0.Parent = game.Players.LocalPlayer.PlayerGui;
l_ScreenGui_0.ResetOnSpawn = false;
local _ = {};
local v4 = {};
local v5 = {};
local v6 = {
    workspace.NPCs, 
    workspace.PlayerCharacters, 
    workspace.Ragdolls
};
local v7 = nil;
local v8 = nil;
local v9 = tick();
local v10 = nil;
local function _(v11, v12, v13) --[[ Line: 18 ]] --[[ Name: Lerp ]]
    return v11 + (v12 - v11) * v13;
end;
v0.Outline = function(_, v16, v17) --[[ Line: 23 ]] --[[ Name: Outline ]]
    -- upvalues: v4 (copy), l_LocalPlayer_0 (copy)
    local l_FirstChild_0 = game.ReplicatedStorage:FindFirstChild("Stats" .. game.Players.LocalPlayer.Name);
    local l_Character_0 = game.Players.LocalPlayer.Character;
    if v4[v16] then
        return;
    elseif v16:IsA("Model") == false then
        return;
    elseif v16 and v16:IsA("Model") and v16.PrimaryPart ~= nil and v17 < (v16.PrimaryPart.Position - l_Character_0.HumanoidRootPart.Position).magnitude then
        return;
    elseif v16 == l_Character_0 then
        return;
    elseif l_Character_0.PrimaryPart == nil or v16 and v16.PrimaryPart == nil then
        return;
    else
        local v20 = (l_Character_0.HumanoidRootPart.Position - v16.PrimaryPart.Position).magnitude / v17;
        local l_Highlight_0 = Instance.new("Highlight");
        l_Highlight_0.FillColor = l_FirstChild_0.Customization.KenColor.Value;
        l_Highlight_0.FillTransparency = 0.5;
        l_Highlight_0.OutlineTransparency = 0 + 0.2 * v20;
        l_Highlight_0.Adornee = v16;
        local v22 = false;
        if v16.Parent == workspace.NPCs then
            v22 = true;
        else
            local l_PlayerFromCharacter_0 = game.Players:GetPlayerFromCharacter(v16);
            if l_PlayerFromCharacter_0 and l_PlayerFromCharacter_0:FindFirstChild("Party") and (l_PlayerFromCharacter_0.Party.Value ~= l_LocalPlayer_0.Party.Value or l_PlayerFromCharacter_0.Party.Value == nil) then
                v22 = true;
            end;
        end;
        if v22 == true then
            l_Highlight_0.FillColor = Color3.fromRGB(255, 0, 0);
        else
            l_Highlight_0.FillColor = Color3.fromRGB(0, 255, 0);
        end;
        l_Highlight_0.OutlineColor = l_Highlight_0.FillColor;
        l_Highlight_0.Parent = v16;
        v4[v16] = {
            highLight = l_Highlight_0
        };
        if l_FirstChild_0.Skills.KenV2.Value == true then
            local l_PlayerFromCharacter_1 = game.Players:GetPlayerFromCharacter(v16);
            local v25 = script.Overhead:Clone();
            v25.Adornee = v16.PrimaryPart;
            v25.Parent = game.Players.LocalPlayer.PlayerGui.HealthBars;
            if l_PlayerFromCharacter_1 == nil then
                v25.tool:Destroy();
                v25.Stam:Destroy();
            end;
            local l_Humanoid_0 = v16:FindFirstChild("Humanoid");
            if l_Humanoid_0 and l_Humanoid_0:IsA("Humanoid") == true then
                v4[v16].gui = v25;
            else
                v25:Destroy();
            end;
            v4[v16].isPlayer = l_PlayerFromCharacter_1;
        end;
        return;
    end;
end;
v0.Enable = function(_) --[[ Line: 87 ]] --[[ Name: Enable ]]
    -- upvalues: v10 (ref), v0 (copy), v9 (ref), v5 (copy), l_LocalPlayer_0 (copy), v8 (ref), v7 (ref)
    v10 = game.Players.LocalPlayer.Character;
    game.ReplicatedStorage.Events.Haki:FireServer("Ken", true);
    if v10:WaitForChild("KenHaki", 2) == nil then
        return;
    else
        v0.On = true;
        local l_FirstChild_1 = game.ReplicatedStorage:FindFirstChild("Stats" .. game.Players.LocalPlayer.Name);
        v9 = 0;
        if v5.color then
            v5.color:Destroy();
        end;
        if v5.blur then
            v5.blur:Destroy();
        end;
        _G.tween(workspace.CurrentCamera, {
            0.25, 
            "Sine", 
            Enum.EasingDirection.Out, 
            0, 
            true, 
            0
        }, {
            FieldOfView = 90
        });
        local v29 = script.KenHaki:Clone();
        v29.Contrast = 0;
        v29.TintColor = Color3.fromRGB(255, 255, 255);
        v29.Parent = workspace.CurrentCamera;
        local v30, _, v32 = l_FirstChild_1.Customization.KenColor.Value:ToHSV();
        _G.tween(v29, {
            0.25, 
            "Smooth", 
            Enum.EasingDirection.Out, 
            0, 
            false, 
            0
        }, {
            Contrast = script.KenHaki.Contrast, 
            TintColor = Color3.fromHSV(v30, 0.325, v32)
        });
        v5.color = v29;
        local v33 = script.DepthOfField:Clone();
        v33.FarIntensity = 0;
        v33.FocusDistance = 100;
        v33.InFocusRadius = 0;
        v33.Parent = workspace.CurrentCamera;
        _G.tween(v33, {
            0.25, 
            "Smooth", 
            Enum.EasingDirection.Out, 
            0, 
            false, 
            0
        }, {
            FarIntensity = 0.5, 
            FocusDistance = 25, 
            InFocusRadius = 5
        });
        v5.blur = v33;
        local v34 = script.kengui:Clone();
        v34.Parent = l_LocalPlayer_0.PlayerGui;
        v34.ImageLabel.ImageColor3 = l_FirstChild_1.Customization.KenColor.Value;
        v34.TextLabel.UIGradient.Color = ColorSequence.new(Color3.fromRGB(255, 255, 255), l_FirstChild_1.Customization.KenColor.Value);
        _G.tween(v34.ImageLabel, {
            0.25, 
            "Quad", 
            Enum.EasingDirection.Out, 
            0, 
            false, 
            0
        }, {
            Size = UDim2.new(1.25, 0, 1.25, 0)
        });
        _G.tween(v34.ImageLabel, {
            0.25, 
            "Quad", 
            Enum.EasingDirection.Out, 
            0, 
            false, 
            0
        }, {
            ImageTransparency = 1
        });
        _G.tween(v34.TextLabel.UIGradient, {
            0.5, 
            "Sine", 
            Enum.EasingDirection.Out, 
            -1, 
            true, 
            0.25
        }, {
            Offset = Vector2.new(1, 0)
        });
        if v8 then
            v8:Destroy();
        end;
        v8 = v34;
        if string.find(l_FirstChild_1.Stats.DF.Value, "Mochi") ~= nil and l_FirstChild_1.Stats.KenMastery.Value >= 700 and _G.isFruitSupressed(l_LocalPlayer_0) == false then
            script.futureSightLoop:Play();
        elseif l_FirstChild_1.Skills.KenV2.Value == true then
            script.V2LOOP:Play();
        else
            script.KenSFX:Play();
        end;
        v7 = _G.music;
        _G.music = false;
        return;
    end;
end;
v0.Disable = function(_) --[[ Line: 149 ]] --[[ Name: Disable ]]
    -- upvalues: v0 (copy), v4 (copy), v5 (copy), v7 (ref), v8 (ref)
    v0.On = false;
    for v36, _ in v4 do
        v0:removehighLight(v36);
    end;
    table.clear(v4);
    pcall(function() --[[ Line: 156 ]]
        -- upvalues: v5 (ref)
        _G.tween(v5.blur, {
            0.25, 
            "Smooth", 
            Enum.EasingDirection.Out, 
            0, 
            false, 
            0
        }, {
            FarIntensity = 0
        });
        _G.tween(v5.color, {
            0.25, 
            "Smooth", 
            Enum.EasingDirection.Out, 
            0, 
            false, 
            0
        }, {
            Contrast = 0, 
            TintColor = Color3.fromRGB(255, 255, 255)
        });
        _G.destroy(v5.blur, 0.25);
        _G.destroy(v5.color, 0.25);
    end);
    script.KenSFX:Stop();
    script.futureSightLoop:Stop();
    script.V2LOOP:Stop();
    _G.music = v7;
    v0.kenTime = 0;
    game.ReplicatedStorage.Events.Haki:FireServer("Ken", false);
    if v8 then
        v8:Destroy();
        v8 = nil;
    end;
end;
v0.removehighLight = function(_, v39, v40) --[[ Line: 175 ]] --[[ Name: removehighLight ]]
    -- upvalues: v4 (copy)
    if v4[v39] then
        if v40 == nil then
            _G.tween(v4[v39].highLight, {
                0.25, 
                "Smooth", 
                Enum.EasingDirection.Out, 
                0, 
                false, 
                0
            }, {
                OutlineTransparency = 1, 
                FillTransparency = 1
            });
            _G.destroy(v4[v39].highLight, 0.25);
            v4[v39].highLight = nil;
        else
            v4[v39].highLight:Destroy();
        end;
    end;
    if v4[v39].gui ~= nil then
        v4[v39].gui:Destroy();
    end;
    if v4[v39].blockGUI ~= nil then
        v4[v39].blockGUI:Destroy();
    end;
    v4[v39] = nil;
end;
local function v45(v41) --[[ Line: 195 ]] --[[ Name: getBuso ]]
    local v42 = false;
    local l_v41_Children_0 = v41:GetChildren();
    for v44 = 1, #l_v41_Children_0 do
        if l_v41_Children_0[v44].Name:match("Buso") and l_v41_Children_0[v44]:IsA("NumberValue") then
            v42 = true;
        end;
    end;
    return v42;
end;
local l_FirstChild_2 = game.ReplicatedStorage:FindFirstChild("Stats" .. l_LocalPlayer_0.Name);
game["Run Service"].Heartbeat:Connect(function(v47) --[[ Line: 208 ]]
    -- upvalues: v10 (ref), v0 (copy), l_FirstChild_2 (copy), v4 (copy), v45 (copy), v9 (ref), v6 (copy), v8 (ref)
    local l_Character_1 = game.Players.LocalPlayer.Character;
    if v10 and v10 ~= l_Character_1 then
        v0:Disable();
        return;
    else
        if v0.On == true then
            local v49 = math.clamp(100 + l_FirstChild_2.Stats.KenMastery.Value / 3, 0, 2000);
            for v50, _ in v4 do
                local l_PrimaryPart_0 = v50.PrimaryPart;
                local l_Humanoid_1 = v50:FindFirstChildWhichIsA("Humanoid");
                if v50 and v50.Parent ~= nil and l_PrimaryPart_0 and v49 <= (l_PrimaryPart_0.Position - l_Character_1.HumanoidRootPart.Position).magnitude or l_PrimaryPart_0 == nil or l_Humanoid_1 ~= nil and v50.Parent ~= workspace.PlayerCharacters and v50.Parent ~= workspace.Ragdolls and v50.Parent ~= workspace.NPCs or v50:IsDescendantOf(workspace) == false then
                    v0:removehighLight(v50, true);
                elseif v50 then
                    local v54 = (l_Character_1.HumanoidRootPart.Position - v50.PrimaryPart.Position).magnitude / v49;
                    v4[v50].highLight.FillTransparency = 0.5 + 0.5 * v54;
                    v4[v50].highLight.OutlineTransparency = 0 + 1 * v54;
                    if v4[v50].gui ~= nil then
                        local l_gui_0 = v4[v50].gui;
                        if v4[v50].isPlayer ~= nil then
                            local l_FirstChild_3 = game.ReplicatedStorage:FindFirstChild("Stats" .. v50.Name);
                            if l_FirstChild_3 then
                                local v57 = l_FirstChild_3.Stamina.Value / l_FirstChild_3.Stamina.MaxValue;
                                l_gui_0.Health.Frame.BackgroundColor3 = BrickColor.new("White").Color:Lerp(Color3.fromRGB(66, 163, 218), v57);
                                l_gui_0.Stam.Frame.Size = UDim2.new(v57, 0, 1, 0);
                            end;
                            local l_Tool_0 = v50:FindFirstChildWhichIsA("Tool");
                            if l_Tool_0 then
                                if l_Tool_0.TextureId ~= "" then
                                    l_gui_0.tool.ImageLabel.Image = l_Tool_0.TextureId;
                                    l_gui_0.tool.ImageLabel.TextLabel.Text = "";
                                else
                                    l_gui_0.tool.ImageLabel.Image = "";
                                    l_gui_0.tool.ImageLabel.TextLabel.Text = l_Tool_0.Name;
                                end;
                                l_gui_0.tool.Visible = true;
                            else
                                l_gui_0.tool.Visible = false;
                            end;
                        end;
                        local v59 = v50:findFirstChild("Blocking");
                        if v59 and v4[v50].blockGUI == nil and v59.Value > 0 then
                            local v60 = game.ReplicatedStorage.Util.Melee.BlockGui:Clone();
                            v60.MaxDistance = 1000;
                            v60.Parent = v50.HumanoidRootPart;
                            v60.Size = UDim2.new(3, 0, 3, 0);
                            if v45(v50) == true then
                                v60.ImageLabel.Frame.ImageLabel.ImageColor3 = Color3.fromRGB(85, 85, 255);
                            end;
                            v4[v50].blockGUI = v60;
                        elseif v59 and v4[v50].blockGUI ~= nil and v59.Value > 0 then
                            local l_blockGUI_0 = v4[v50].blockGUI;
                            local v62 = v59.Value / v59.MaxValue;
                            l_blockGUI_0.ImageLabel.Frame.Size = UDim2.new(1, 0, v62, 0);
                            l_blockGUI_0.ImageLabel.Frame.Position = UDim2.new(0, 0, 1 - v62, 0);
                            l_blockGUI_0.ImageLabel.Frame.ImageLabel.Size = UDim2.new(1, 0, 1 / v62, 0);
                            l_blockGUI_0.ImageLabel.Frame.ImageLabel.Position = UDim2.new(0, 0, -(l_blockGUI_0.ImageLabel.Frame.Position.Y.Scale / l_blockGUI_0.ImageLabel.Frame.Size.Y.Scale), 0);
                        elseif v4[v50].blockGUI ~= nil and (v59 == nil or v59 and v59.Value <= 0) and v4[v50].blockGUI then
                            v4[v50].blockGUI:Destroy();
                            v4[v50].blockGUI = nil;
                        end;
                        if l_Humanoid_1 then
                            local v63 = l_Humanoid_1.Health / l_Humanoid_1.MaxHealth;
                            l_gui_0.Health.Frame.BackgroundColor3 = BrickColor.new("Bright red").Color:Lerp(Color3.fromRGB(170, 255, 127), v63);
                            l_gui_0.Health.Frame.Size = UDim2.new(v63, 0, 1, 0);
                        end;
                    end;
                end;
            end;
            if tick() - v9 >= 0.3 then
                for v64 = 1, #v6 do
                    local l_Children_0 = v6[v64]:GetChildren();
                    for v66 = 1, #l_Children_0 do
                        if v4[l_Children_0[v66]] == nil then
                            v0:Outline(l_Children_0[v66], v49);
                        end;
                    end;
                end;
                local l_workspace_Children_0 = workspace:GetChildren();
                for v68 = 1, #l_workspace_Children_0 do
                    if l_workspace_Children_0[v68]:IsA("Tool") and l_workspace_Children_0[v68]:FindFirstChild("FruitEater") then
                        v0:Outline(l_workspace_Children_0[v68].FruitModel, v49);
                    end;
                end;
                local l_Descendants_0 = workspace.Env.Settings:GetDescendants();
                for v70 = 1, #l_Descendants_0 do
                    if l_Descendants_0[v70]:IsA("Model") and l_Descendants_0[v70]:GetAttribute("fruitModel") == true then
                        v0:Outline(l_Descendants_0[v70], v49);
                    end;
                end;
                v9 = tick();
            end;
            v0.kenTime = v0.kenTime + v47;
            if v8 and l_Character_1:FindFirstChild("KenHaki") then
                if v8:FindFirstChild("TextLabel") then
                    v8.TextLabel.Text = l_FirstChild_2.KenBar.Value .. " Dodges left";
                end;
                if l_Character_1:FindFirstChild("KenHaki").Value <= 0 then
                    v0:Disable();
                    return;
                end;
            elseif v0.On == true and l_Character_1:FindFirstChild("KenHaki") == nil then
                v0:Disable();
                return;
            end;
        elseif script.V2LOOP.IsPlaying == true or script.KenSFX.IsPlaying == true or script.futureSightLoop.IsPlaying == true then
            script.KenSFX:Stop();
            script.futureSightLoop:Stop();
            script.V2LOOP:Stop();
        end;
        return;
    end;
end);
return v0;