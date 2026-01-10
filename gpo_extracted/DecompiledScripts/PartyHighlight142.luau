local v0 = {};
local v1 = {};
v0.start = function(_, v3) --[[ Line: 5 ]] --[[ Name: start ]]
    -- upvalues: v1 (copy)
    print("called");
    local l_Players_0 = v3.Players;
    local l_Colour_0 = v3.Colour;
    local l_Type_0 = v3.Type;
    if typeof(l_Players_0) ~= "table" then
        l_Players_0 = {
            l_Players_0
        };
    end;
    for _, v8 in pairs(l_Players_0) do
        if v8 ~= game.Players.LocalPlayer then
            if l_Type_0 == "Add" then
                v1[v8.Name] = {};
                v1[v8.Name].Colour = l_Colour_0;
                v1[v8.Name].AddHighlight = function(v9, v10) --[[ Line: 23 ]]
                    local l_Highlight_0 = Instance.new("Highlight");
                    l_Highlight_0.Name = "PartyHighlight";
                    l_Highlight_0.FillColor = v9.Colour;
                    l_Highlight_0.OutlineColor = v9.Colour;
                    l_Highlight_0.FillTransparency = 1;
                    l_Highlight_0.DepthMode = Enum.HighlightDepthMode.Occluded;
                    l_Highlight_0.Parent = v10;
                end;
                v1[v8.Name].Connection = v8.CharacterAdded:Connect(function(v12) --[[ Line: 33 ]]
                    -- upvalues: v1 (ref), v8 (copy)
                    v1[v8.Name]:AddHighlight(v12);
                end);
                v1[v8.Name]:AddHighlight(v8.Character);
            else
                if v1[v8.Name] then
                    v1[v8.Name].Connection:Disconnect();
                end;
                if v8.Character then
                    local l_PartyHighlight_0 = v8.Character:FindFirstChild("PartyHighlight");
                    if l_PartyHighlight_0 then
                        l_PartyHighlight_0:Destroy();
                    end;
                end;
            end;
        end;
    end;
end;
return v0;