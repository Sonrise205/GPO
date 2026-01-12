local v0 = {};
local l_RunService_0 = game:GetService("RunService");
local l_TweenService_0 = game:GetService("TweenService");
local v3 = {};
local function v4(...) --[[ Line: 16 ]]
    print("[BUSO EFFECT HANDLER]:", ...);
end;
local function v9(v5) --[[ Line: 20 ]] --[[ Name: destroyBuso ]]
    for _, v7 in pairs(v5) do
        local l_busoHighlight_0 = v7:FindFirstChild("busoHighlight");
        if l_busoHighlight_0 then
            l_busoHighlight_0:Destroy();
        end;
    end;
end;
local function v11(v10) --[[ Line: 29 ]] --[[ Name: cleanPlayer ]]
    -- upvalues: v3 (copy), v9 (copy), v4 (copy)
    if not v3[v10.Player] then
        return;
    else
        v9(v3[v10.Player].Weapon);
        if not v3[v10.Player].Connection then
            return;
        else
            v3[v10.Player].Connection:Disconnect();
            v3[v10.Player].Connection = nil;
            v4("removed - " .. v10.Player.Name, v3[v10.Player]);
            return;
        end;
    end;
end;
local function v13(v12) --[[ Line: 42 ]] --[[ Name: createPlayerData ]]
    -- upvalues: v3 (copy), v11 (copy), v4 (copy)
    v3[v12.Player] = {};
    v3[v12.Player].Left = v12.Player:GetPropertyChangedSignal("Parent"):Connect(function() --[[ Line: 44 ]]
        -- upvalues: v11 (ref), v12 (copy), v3 (ref), v4 (ref)
        v11(v12);
        v3[v12.Player].Left:Disconnect();
        v3[v12.Player].Left = nil;
        v3[v12.Player] = nil;
        v4("buso cleaned - " .. v12.Player.Name, v3[v12.Player]);
    end);
end;
v0.start = function(_, v15) --[[ Line: 56 ]] --[[ Name: start ]]
    -- upvalues: v3 (copy), v13 (copy), l_RunService_0 (copy), v9 (copy), l_TweenService_0 (copy), v4 (copy), v11 (copy)
    if v15.Type == "On" then
        if not v3[v15.Player] then
            v13(v15);
        end;
        v3[v15.Player].Weapon = v15.Parent;
        v3[v15.Player].InRange = false;
        local l_Value_0 = game.ReplicatedStorage["Stats" .. v15.Player.Name].Customization.BusoColor.Value;
        if v3[v15.Player].Connection then
            return;
        else
            v3[v15.Player].Connection = l_RunService_0.Heartbeat:Connect(function() --[[ Line: 71 ]]
                -- upvalues: v15 (copy), v3 (ref), v9 (ref), l_Value_0 (copy), l_TweenService_0 (ref)
                if not v15.Player.Character then
                    return;
                else
                    if v15.Player.Character.PrimaryPart == nil or v15.Player.Character.PrimaryPart and not _G.checkRenderDistance(v15.Player.Character.PrimaryPart.Position, 100) then
                        if v3[v15.Player].InRange then
                            v3[v15.Player].InRange = false;
                            v9(v3[v15.Player].Weapon);
                            return;
                        end;
                    elseif not v3[v15.Player].InRange then
                        v3[v15.Player].InRange = true;
                        for _, v18 in pairs(v3[v15.Player].Weapon) do
                            if not v18:FindFirstChild("busoHighlight") then
                                local l_Highlight_0 = Instance.new("Highlight");
                                l_Highlight_0.DepthMode = Enum.HighlightDepthMode.Occluded;
                                l_Highlight_0.FillTransparency = 0;
                                l_Highlight_0.Name = "busoHighlight";
                                l_Highlight_0.OutlineColor = l_Value_0;
                                l_Highlight_0.FillColor = l_Value_0;
                                l_Highlight_0.Parent = v18;
                                l_TweenService_0:Create(l_Highlight_0, TweenInfo.new(0.5), {
                                    FillTransparency = 1
                                }):Play();
                            end;
                        end;
                    end;
                    return;
                end;
            end);
            v4("added - " .. v15.Player.Name, v3[v15.Player]);
            return;
        end;
    else
        if v15.Type == "Off" then
            v11(v15);
        end;
        return;
    end;
end;
return v0;