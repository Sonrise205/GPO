local v0 = {};
local l_LocalPlayer_0 = game.Players.LocalPlayer;
v0.ready = function(_, v3) --[[ Line: 4 ]] --[[ Name: ready ]]
    -- upvalues: l_LocalPlayer_0 (ref)
    if _G.getEffect == nil or l_LocalPlayer_0 == nil then
        repeat
            task.wait();
        until _G.getEffect ~= nil and game.Players.LocalPlayer;
        l_LocalPlayer_0 = game.Players.LocalPlayer;
    end;
    local l_Character_0 = l_LocalPlayer_0.Character;
    local v5 = nil;
    if v3 == nil then
        l_Character_0 = l_Character_0 and l_Character_0.Parent ~= nil and l_Character_0 or l_LocalPlayer_0.CharacterAdded:Wait();
        l_LocalPlayer_0:GetMouse().TargetFilter = l_Character_0;
        if l_Character_0.Parent == nil or l_Character_0:FindFirstChild("Humanoid") == nil then
            repeat
                task.wait();
            until l_Character_0:FindFirstChild("Humanoid") or l_Character_0.Parent ~= nil;
            while l_Character_0.Parent == nil do
                l_LocalPlayer_0.Character.AncestryChanged:Wait();
            end;
        end;
        if l_LocalPlayer_0.Loaded.Value == false then
            repeat
                task.wait();
            until l_LocalPlayer_0.Loaded.Value == true;
        end;
        repeat
            task.wait();
        until l_Character_0.Parent == workspace.PlayerCharacters or l_Character_0.Parent == workspace.Ragdolls and _G.tween ~= nil;
        v5 = l_Character_0:WaitForChild("Humanoid");
        v5:WaitForChild("Animator");
        repeat
            task.wait();
        until v5:GetAttribute("AnimatorReady") ~= nil;
        l_LocalPlayer_0:WaitForChild("CrewPVP");
        workspace:WaitForChild("Env"):WaitForChild("WaterStuff");
    end;
    local v6 = game.ReplicatedStorage:WaitForChild("Stats" .. l_LocalPlayer_0.Name, 300);
    return l_LocalPlayer_0, l_Character_0, game:GetService("UserInputService"), l_LocalPlayer_0:GetMouse(), v6;
end;
return v0;