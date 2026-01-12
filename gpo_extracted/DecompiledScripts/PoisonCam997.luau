local v0 = {};
local v1 = 0;
local v2 = script.test:Clone();
local v3 = CFrame.new(0, 0, -0.25);
local function v7(v4) --[[ Line: 7 ]] --[[ Name: enable ]]
    -- upvalues: v2 (copy)
    local l_v2_Descendants_0 = v2:GetDescendants();
    for v6 = 1, #l_v2_Descendants_0 do
        pcall(function() --[[ Line: 10 ]]
            -- upvalues: l_v2_Descendants_0 (copy), v6 (copy), v4 (copy)
            l_v2_Descendants_0[v6].Enabled = v4;
        end);
    end;
end;
v0.start = function(_, v9) --[[ Line: 16 ]] --[[ Name: start ]]
    -- upvalues: v7 (copy), v1 (ref)
    v7(true);
    v1 = v1 + v9;
end;
local v10 = tick();
local v11 = 0;
game["Run Service"].RenderStepped:connect(function() --[[ Line: 22 ]]
    -- upvalues: v1 (ref), v2 (copy), v10 (ref), v7 (copy), v11 (ref), v3 (copy)
    local v12 = true;
    local l_Character_0 = game.Players.LocalPlayer.Character;
    if l_Character_0 == nil then
        v12 = false;
    end;
    if l_Character_0 and l_Character_0.UpperTorso:FindFirstChild("Poison") == nil then
        v12 = false;
    end;
    if l_Character_0 and l_Character_0.UpperTorso:FindFirstChild("Poison") and l_Character_0.UpperTorso:FindFirstChild("Poison").Enabled == false then
        v12 = false;
    end;
    if v1 > 0 and v12 == true then
        v2.Parent = workspace.CurrentCamera;
        v1 = v1 - (tick() - v10);
    else
        v1 = 0;
        if v2 and v2:FindFirstChild("Attachment") and v2.Attachment.Poison.Enabled == true then
            v7(false);
            v11 = tick();
        end;
        if tick() - v11 > 4 then
            v2.Parent = nil;
        end;
    end;
    v2.CFrame = workspace.CurrentCamera.CFrame * v3;
    v10 = tick();
end);
return v0;