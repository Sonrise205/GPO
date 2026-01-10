local _, v1, _, _, _ = require(game.ReplicatedStorage.Modules.ScriptSet).get();
repeat
    task.wait();
until game.Players.LocalPlayer.Character;
task.wait(1);
local l_Character_0 = game.Players.LocalPlayer.Character;
local l_Waist_0 = l_Character_0:WaitForChild("UpperTorso"):WaitForChild("Waist");
local l_Root_0 = l_Character_0:WaitForChild("LowerTorso"):WaitForChild("Root");
local _ = l_Waist_0.C0;
local _ = l_Root_0.C0;
local v10 = l_Character_0.Humanoid:LoadAnimation(script.sidewalk);
local v11 = l_Character_0.Humanoid:LoadAnimation(script.sidewalk2);
v10.Priority = Enum.AnimationPriority.Movement;
v11.Priority = Enum.AnimationPriority.Movement;
local v12 = true;
local v13 = script.ColorCorrection:Clone();
v13.Parent = workspace.CurrentCamera;
v13.Name = "heart";
local v14 = {
    TintColor = Color3.fromRGB(255, 149, 149), 
    Saturation = -0.2, 
    Contrast = 0.5
};
local v15 = TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, -1, true, 0.4);
local v16 = game:GetService("TweenService"):Create(v13, v15, v14);
local v17 = TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, -1, true, 0.4);
local _ = game:GetService("TweenService"):Create(workspace.CurrentCamera, v17, {
    FieldOfView = 60
});
local v19 = false;
local l_HumanoidRootPart_0 = l_Character_0:WaitForChild("HumanoidRootPart");
local l_Humanoid_0 = l_Character_0.Humanoid;
local v22 = l_Humanoid_0:LoadAnimation(script.hurt);
v22.Priority = Enum.AnimationPriority.Idle;
local _ = Vector3.new();
local function v29() --[[ Line: 47 ]] --[[ Name: renderFunction ]]
    -- upvalues: l_Character_0 (copy), l_HumanoidRootPart_0 (copy), v1 (copy), l_Humanoid_0 (copy), v19 (ref), v12 (ref), v22 (copy), v16 (copy), v13 (copy)
    if l_Character_0.PrimaryPart and l_Character_0:FindFirstChild("Humanoid") then
        local _ = (l_HumanoidRootPart_0.CFrame * CFrame.new(0, -2, 0)).p;
        if v1.Parent == workspace.Ragdolls then
            l_Humanoid_0.WalkSpeed = 0;
            v19 = false;
        elseif v19 == false then
            v19 = true;
            l_Humanoid_0.WalkSpeed = 16;
        end;
        if _G.TurnCharacterToMouse == true and l_Humanoid_0.Sit == true then
            _G.TurnCharacterToMouse = false;
        end;
        if l_Humanoid_0.Health < l_Humanoid_0.MaxHealth / 4 then
            local _ = l_Humanoid_0.Health / (l_Humanoid_0.MaxHealth / 4);
            local v26 = math.clamp(_G.ScaleWithHP(16), 8, 16);
            if v26 < l_Humanoid_0.WalkSpeed then
                l_Humanoid_0.WalkSpeed = v26;
            end;
            v12 = false;
            if script.Heartbeat.IsPlaying == false then
                script.Heartbeat:Play();
            end;
            if v22.IsPlaying == false then
                v22:Play();
            end;
            if v16.PlaybackState ~= Enum.PlaybackState.Playing then
                v16:Play();
            end;
        elseif l_Humanoid_0.Health >= l_Humanoid_0.MaxHealth / 4 then
            if v12 == false then
                v12 = true;
                l_Humanoid_0.WalkSpeed = 16;
            end;
            if v22.IsPlaying == true then
                v22:Stop();
            end;
            if v16.PlaybackState == Enum.PlaybackState.Playing then
                script.Heartbeat:Stop();
                v16:Cancel();
                local v27 = {
                    TintColor = Color3.fromRGB(255, 255, 255), 
                    Saturation = 0, 
                    Contrast = 0
                };
                local v28 = TweenInfo.new(1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, false, 0);
                game:GetService("TweenService"):Create(v13, v28, v27):Play();
            end;
        end;
        if v1:FindFirstChild("Stun") then
            l_Humanoid_0.Jump = false;
        end;
    end;
end;
game["Run Service"].Stepped:Connect(v29);