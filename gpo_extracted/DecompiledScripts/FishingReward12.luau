local v0 = {};
local _ = game:GetService("TweenService");
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_Assets_0 = l_ReplicatedStorage_0.Fishing.Assets;
local l_Rewards_0 = l_Assets_0.Rewards;
local v5 = Random.new();
v0.start = function(_, v7) --[[ Line: 10 ]] --[[ Name: start ]]
    -- upvalues: v5 (copy), l_Rewards_0 (copy), l_ReplicatedStorage_0 (copy), l_Assets_0 (copy)
    local l_Hook_0 = v7.Hook;
    if not l_Hook_0 then
        return;
    else
        local l_Reward_0 = v7.Reward;
        local l_RewardType_0 = v7.RewardType;
        local l_Start_0 = v7.Start;
        local l_Goal_0 = v7.Goal;
        local _ = math.random(15, 30);
        local _ = v5:NextNumber(3, 5);
        local l_l_Rewards_0_FirstChild_0 = l_Rewards_0:FindFirstChild(l_Reward_0);
        local v16 = nil;
        v16 = if l_l_Rewards_0_FirstChild_0 ~= nil then l_l_Rewards_0_FirstChild_0 else l_ReplicatedStorage_0.Tools:FindFirstChild(l_Reward_0);
        if v16 and v16:IsA("BasePart") then
            v16 = v16:Clone();
            local l_Model_0 = Instance.new("Model");
            l_Model_0.PrimaryPart = v16;
            v16.Parent = l_Model_0;
            v16 = l_Model_0;
        elseif v16 then
            v16 = v16:Clone();
        end;
        if v16 == nil then
            return;
        else
            v16:MoveTo(l_Start_0);
            if v16.PrimaryPart then
                v16.PrimaryPart.Anchored = true;
            end;
            v16.Parent = workspace.Effects;
            local l_AnimationController_0 = v16:FindFirstChild("AnimationController");
            local l_Animation_0 = v16:FindFirstChildOfClass("Animation");
            if l_AnimationController_0 and l_Animation_0 then
                local v20 = l_AnimationController_0:LoadAnimation(l_Animation_0);
                v20:Play();
                v20:AdjustSpeed(math.random(100, 300) / 100);
            end;
            local function _(v21, v22) --[[ Line: 61 ]] --[[ Name: GetCFrameOffset ]]
                return v21:Inverse() * v22;
            end;
            local _ = v16:GetExtentsSize();
            local v25 = v16:GetAttribute("Offset") or CFrame.new();
            if v16.PrimaryPart:FindFirstChild("Hook") then
                v16.PrimaryPart.Hook.CFrame = CFrame.new(v16.PrimaryPart.Hook.CFrame.Position);
                local l_WorldCFrame_0 = v16.PrimaryPart.Hook.WorldCFrame;
                local l_CFrame_0 = v16.PrimaryPart.CFrame;
                v25 = l_WorldCFrame_0:Inverse() * l_CFrame_0;
            end;
            while l_Hook_0.Parent do
                local _ = (v16:GetPivot().Position - l_Hook_0.Position).Magnitude;
                v16.PrimaryPart.Anchored = true;
                v16:SetPrimaryPartCFrame(l_Hook_0.CFrame * v25);
                game["Run Service"].RenderStepped:Wait();
            end;
            if l_RewardType_0 and l_Assets_0.CatchVFX:FindFirstChild(l_RewardType_0) then
                local v29 = l_Assets_0.CatchVFX:FindFirstChild(l_RewardType_0):Clone();
                v29.CFrame = l_Goal_0.PrimaryPart.CFrame;
                _G.scaleParticle(v29, 1.5, true);
                v29.Parent = workspace.Effects;
                _G.customEmit(v29);
                _G.destroy(v29, 5);
            end;
            v16:Destroy();
            if l_RewardType_0 and l_RewardType_0 == "Sunken" then
                _G.PlaySound(l_Goal_0.PrimaryPart, game.ReplicatedStorage.Fishing.Assets.SFX.Caught.TreasureFound, {
                    RandomPitch = true
                });
                return;
            else
                _G.PlaySound(l_Goal_0.PrimaryPart, game.ReplicatedStorage.Fishing.Assets.SFX.Caught.NewFish, {
                    RandomPitch = true
                });
                return;
            end;
        end;
    end;
end;
return v0;