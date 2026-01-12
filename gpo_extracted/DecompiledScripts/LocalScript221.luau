local v0 = nil;
local v1 = nil;
v1 = Instance.new("Highlight");
v1.FillTransparency = 1;
v1.OutlineTransparency = 0.6;
v1.Name = "PartyHighlight";
v1.FillColor = Color3.fromRGB(0, 255, 0);
v1.OutlineColor = v1.FillColor;
v1.DepthMode = Enum.HighlightDepthMode.Occluded;
v1.OutlineColor = v1.FillColor;
v1.Parent = game.Players.LocalPlayer.PlayerGui.HealthBars;
local function v3() --[[ Line: 12 ]] --[[ Name: setAdor ]]
    -- upvalues: v0 (ref), v1 (ref)
    local l_Character_0 = script.Parent.targetPlayer.Value.Character;
    if v0 == nil then
        v0 = game.Players:GetPlayerFromCharacter(l_Character_0);
    end;
    if game.Teams:FindFirstChild("Eliminated") and v0.Team == game.Teams.Eliminated then
        script.Parent.Enabled = false;
    else
        script.Parent.Enabled = true;
    end;
    if v1 then
        v1.Adornee = l_Character_0;
        v1.Enabled = true;
    end;
    if l_Character_0 and l_Character_0:findFirstChild("Head") then
        script.Parent.Adornee = l_Character_0.Head;
        return;
    else
        script.Parent.Adornee = workspace.Terrain;
        return;
    end;
end;
script.Parent.Destroying:Connect(function() --[[ Line: 38 ]]
    -- upvalues: v1 (ref)
    if v1 then
        v1:Destroy();
    end;
end);
while true do
    v3();
    if script.Parent.Adornee == workspace.Terrain then
        pcall(function() --[[ Line: 47 ]]
            script.Parent.StudsOffsetWorldSpace = game.ReplicatedStorage.Events.getPartyPosition:InvokeServer(script.Parent.targetPlayer.Value);
        end);
        v3();
    else
        script.Parent.StudsOffsetWorldSpace = Vector3.new();
    end;
    task.wait(1);
end;