local v0 = {};
local v1 = require(script.ConfigReader);
v0.__index = v0;
local v2 = {
    diameter = 120, 
    padding = 4, 
    count = 64, 
    size = 1024
};
local v3 = require(game.ReplicatedStorage.Modules.ScriptSet);
local _ = game:GetService("PhysicsService");
local v5, _, v7, v8 = v3.get();
local v9 = require(game.ReplicatedStorage.Modules.FastWait);
local function v16(v10) --[[ Line: 13 ]] --[[ Name: getClimbAttachmentCFrame ]]
    local l_normal_0 = v10.normal;
    local l_position_0 = v10.position;
    local l_object_0 = v10.object;
    local l_Unit_0 = Vector3.new(0, 1, 0, 0):Cross(l_normal_0).Unit;
    local l_Unit_1 = l_normal_0:Cross(l_Unit_0).Unit;
    return l_object_0.CFrame:inverse() * CFrame.new(l_position_0.x, l_position_0.y, l_position_0.z, l_Unit_0.x, l_Unit_1.x, l_normal_0.x, l_Unit_0.y, l_Unit_1.y, l_normal_0.y, l_Unit_0.z, l_Unit_1.z, l_normal_0.z);
end;
local function v21(v17) --[[ Line: 30 ]] --[[ Name: checkpart ]]
    local v18, _, _ = _G.raycastWhitelist(v17, {
        workspace.Islands, 
        workspace.Env, 
        workspace.Ships, 
        workspace.Jails
    });
    return v18;
end;
local function _(v22, v23, v24, v25) --[[ Line: 35 ]] --[[ Name: lineup ]]
    v22.Attachment1 = v24;
    v23.Attachment1 = v24;
    pcall(function() --[[ Line: 39 ]]
        -- upvalues: v25 (copy), v24 (copy)
        if v25 and v24 then
            v24.Parent = v25;
        end;
    end);
end;
v0.setup = function(v27, v28) --[[ Line: 46 ]] --[[ Name: setup ]]
    -- upvalues: v5 (ref), v7 (ref), v8 (ref), v3 (copy), v1 (copy), v2 (copy), v0 (copy), v21 (copy), v9 (copy)
    local v29, v30, v31, v32 = v3.get();
    v5 = v29;
    v7 = v31;
    v8 = v32;
    v28 = v30;
    warn(v28:GetFullName());
    v29 = {
        Part = nil, 
        AO = script.AlignOrientation:Clone(), 
        AP = script.AlignPosition:Clone(), 
        Attachment = Instance.new("Attachment"), 
        char = v28
    };
    v29.AP.Parent = v28.HumanoidRootPart;
    v29.AO.Parent = v28.HumanoidRootPart;
    v29.AP.Attachment0 = v28.HumanoidRootPart.ClimbCenter;
    v29.AO.Attachment0 = v28.HumanoidRootPart.ClimbCenter;
    v29.Enabled = false;
    v29.Anims = {
        Up = v28.Humanoid:LoadAnimation(script.Up), 
        Left = v28.Humanoid:LoadAnimation(script.Left), 
        Right = v28.Humanoid:LoadAnimation(script.Right), 
        Down = v28.Humanoid:LoadAnimation(script.Down)
    };
    v29.fakepart = nil;
    v29.currentdirection = {
        Up = false, 
        Down = false, 
        Right = false, 
        Left = false
    };
    v29.AlreadyStopped = false;
    v29.prenor = nil;
    v29.ledge = false;
    v29.bill = script.BillboardGui:Clone();
    v29.bill.ImageLabel.ImageLabel.ImageRectSize = Vector2.new(v1.GetSize(v2));
    v29.climbingtime = 10;
    setmetatable(v29, v0);
    for _, v34 in v29.Anims do
        v34.Looped = true;
    end;
    v30 = function(v35) --[[ Line: 75 ]] --[[ Name: pro ]]
        -- upvalues: v29 (copy)
        for _, v37 in v29.Anims do
            if v35 == v37 then
                if v35.IsPlaying == false then
                    v35:Play();
                end;
                v37:AdjustWeight(1);
                v35:AdjustSpeed(1);
            else
                v37:AdjustSpeed(0);
            end;
        end;
    end;
    v31 = function(v38) --[[ Line: 88 ]] --[[ Name: checkstop ]]
        -- upvalues: v29 (copy)
        for _, v40 in v29.Anims do
            if v40 ~= v38 and v40.Speed == 1 and v40.IsPlaying == true then
                v38:Stop();
                v38:AdjustSpeed(0);
                return;
            end;
        end;
    end;
    v32 = function() --[[ Line: 98 ]] --[[ Name: stopall ]]
        -- upvalues: v29 (copy)
        for _, v42 in v29.Anims do
            v42:Stop();
            v42.Looped = true;
            v42:AdjustSpeed(0);
        end;
    end;
    v7.InputBegan:Connect(function(v43, v44) --[[ Line: 105 ]]
        -- upvalues: v29 (copy), v30 (copy), v21 (ref), v28 (ref), v9 (ref), v7 (ref), v31 (copy)
        if v29.Enabled == false then
            return;
        elseif v44 == true then
            return;
        elseif v43.KeyCode == Enum.KeyCode.W and v29.currentdirection.Up == false then
            v29.currentdirection.Up = true;
            v30(v29.Anims.Up);
            repeat
                if v29.Anims.Up.IsPlaying == false then
                    v29.Anims.Up:Play();
                end;
                local v45 = v21(Ray.new(v28.HumanoidRootPart.CFrame.p, v28.HumanoidRootPart.CFrame.upVector * (v28.Humanoid.HipHeight * 2)));
                if v45 == nil or v45 and v45.CanCollide == false then
                    v29.Attachment.CFrame = v29.Attachment.CFrame * CFrame.new(0, 0.25, 0);
                    v29.Anims.Up:AdjustSpeed(1);
                else
                    v29.Anims.Up:AdjustSpeed(0);
                end;
                v9();
            until v7:IsKeyDown(Enum.KeyCode.W) == false or v29.Enabled == false;
            v29.Anims.Up:AdjustSpeed(0);
            v29.currentdirection.Up = false;
            v31(v29.Anims.Up);
            return;
        elseif v43.KeyCode == Enum.KeyCode.S and v29.currentdirection.Down == false then
            v29.currentdirection.Down = true;
            v30(v29.Anims.Down);
            repeat
                if v29.Anims.Down.IsPlaying == false then
                    v29.Anims.Down:Play();
                end;
                v29.Anims.Down:AdjustSpeed(1);
                v29.Attachment.CFrame = v29.Attachment.CFrame * CFrame.new(0, -0.25, 0);
                v9();
            until v7:IsKeyDown(Enum.KeyCode.S) == false or v29.Enabled == false;
            v29.currentdirection.Down = false;
            v29.Anims.Down:AdjustSpeed(0);
            v31(v29.Anims.Down);
            return;
        elseif v43.KeyCode == Enum.KeyCode.A and v29.currentdirection.Left == false then
            v29.currentdirection.Left = true;
            v30(v29.Anims.Left);
            repeat
                if v29.Anims.Left.IsPlaying == false then
                    v29.Anims.Left:Play();
                end;
                v29:step();
                v29.Anims.Left:AdjustSpeed(1);
                v29.Attachment.CFrame = v29.Attachment.CFrame * CFrame.new(-0.25, 0, 0);
                v9();
            until v7:IsKeyDown(Enum.KeyCode.A) == false or v29.Enabled == false;
            v29.currentdirection.Left = false;
            v29.Anims.Left:AdjustSpeed(0);
            v31(v29.Anims.Left);
            return;
        else
            if v43.KeyCode == Enum.KeyCode.D and v29.currentdirection.Right == false then
                v30(v29.Anims.Right);
                v29.currentdirection.Right = true;
                repeat
                    if v29.Anims.Right.IsPlaying == false then
                        v29.Anims.Right:Play();
                    end;
                    v29:step();
                    v29.Anims.Right:AdjustSpeed(1);
                    v29.Attachment.CFrame = v29.Attachment.CFrame * CFrame.new(0.25, 0, 0);
                    v9();
                until v7:IsKeyDown(Enum.KeyCode.D) == false or v29.Enabled == false;
                v29.currentdirection.Right = false;
                v29.Anims.Right:AdjustSpeed(0);
                v31(v29.Anims.Right);
            end;
            return;
        end;
    end);
    local v46 = tick();
    local v47 = 0;
    game["Run Service"].Heartbeat:Connect(function() --[[ Line: 186 ]]
        -- upvalues: v27 (copy), v29 (copy), v32 (copy), v46 (ref), v1 (ref), v2 (ref), v28 (ref), v21 (ref), v47 (ref), v9 (ref)
        if v27.Attachment and v27.Attachment.Position.Y ~= v27.Attachment.Position.Y then
            v27.Attachment:Destroy();
            v27.Attachment = Instance.new("Attachment");
        end;
        if v29.Enabled == false then
            v32();
            v29.climbingtime = v29.climbingtime + (tick() - v46);
            if v29.climbingtime >= 10 then
                v29.climbingtime = 10;
                v29.bill.Parent = nil;
            end;
            v46 = tick();
            v29:stop();
        else
            v29.climbingtime = v29.climbingtime - (tick() - v46);
            v46 = tick();
            if v29.climbingtime <= 0 then
                v29.climbingtime = 0;
                v29:stop();
            end;
        end;
        local v48 = v29.climbingtime / 10;
        local l_new_0 = Vector2.new;
        local l_ImageLabel_0 = v29.bill.ImageLabel.ImageLabel;
        l_ImageLabel_0.ImageRectSize = l_new_0(v1.GetSize(v2));
        local v51 = v48 * 64;
        l_ImageLabel_0.ImageRectOffset = l_new_0(v1.GetOffset(v2, v51));
        l_ImageLabel_0.ImageColor3 = Color3.fromRGB(255, 0, 0):Lerp(Color3.fromRGB(85, 255, 127), v48);
        local v52 = {
            Rain = true, 
            Snow = true
        };
        local v53 = {
            Rain = 0.05, 
            Snow = 0.06
        };
        if v29.Enabled == true and workspace.Islands:FindFirstChild(_G.currentisland) and v52[workspace.Islands:FindFirstChild(_G.currentisland).Settings.Weather.Value] then
            local l_CFrame_0 = v28.HumanoidRootPart.CFrame;
            local v55 = v53[workspace.Islands:FindFirstChild(_G.currentisland).Settings.Weather.Value];
            if v21(Ray.new(l_CFrame_0.p, l_CFrame_0.upVector * -(v28.Humanoid.HipHeight * 2))) == nil and tick() - v47 >= v9() then
                v29.Attachment.CFrame = v29.Attachment.CFrame * CFrame.new(0, -v55, 0);
                v47 = tick();
            end;
        end;
        v29:step();
        if v29.Part ~= nil and v29.Part:IsDescendantOf(workspace) == false then
            v29:stop();
        end;
    end);
    return v29;
end;
local _ = function(v56) --[[ Line: 246 ]] --[[ Name: moving ]]
    local v57 = false;
    for _, v59 in v56 do
        if v59 == true then
            v57 = true;
        end;
    end;
    return v57;
end;
v0.step = function(v61) --[[ Line: 256 ]] --[[ Name: step ]]
    -- upvalues: v21 (copy), v16 (copy)
    local l_char_0 = v61.char;
    local l_CFrame_1 = l_char_0.HumanoidRootPart.CFrame;
    if v61.Enabled == false then
        v61:stop();
        return;
    elseif v61.Enabled == true and v61.currentdirection.Down == true and v61.Part ~= nil and v21(Ray.new(l_CFrame_1.p, l_CFrame_1.upVector * -(l_char_0.Humanoid.HipHeight * 2))) ~= nil then
        v61:stop();
        return;
    elseif l_char_0:FindFirstChild("Stun") and v61.Enabled == true then
        v61:stop();
        return;
    else
        if v61.Enabled == true then
            v61.AP.Enabled = true;
            v61.AO.Enabled = true;
        end;
        local l_l_char_0_Children_0 = l_char_0:GetChildren();
        for v65 = 1, #l_l_char_0_Children_0 do
            if l_l_char_0_Children_0[v65]:IsA("BasePart") then
                l_l_char_0_Children_0[v65].CollisionGroup = "noclip";
            end;
        end;
        local v66 = Ray.new(l_CFrame_1.p, l_CFrame_1.lookVector * 3);
        if v61.currentdirection.Left == true then
            v66 = Ray.new(l_CFrame_1.p, l_CFrame_1.rightVector * -2);
        elseif v61.currentdirection.Right == true then
            v66 = Ray.new(l_CFrame_1.p, l_CFrame_1.rightVector * 2);
        end;
        local v67 = nil;
        if v61.currentdirection.Left == true then
            local v68 = l_char_0.HumanoidRootPart.CFrame * CFrame.new(-0.75, 0, 0);
            v67 = Ray.new(v68.p, v68.lookVector * 2);
        elseif v61.currentdirection.Right == true then
            local v69 = l_char_0.HumanoidRootPart.CFrame * CFrame.new(0.75, 0, 0);
            v67 = Ray.new(v69.p, v69.lookVector * 2);
        end;
        if (v61.currentdirection.Left == true or v61.currentdirection.Right == true) and v21(v66) == nil then
            if v61.currentdirection.Left == true and v21(v67) == nil then
                local v70 = l_char_0.HumanoidRootPart.CFrame * CFrame.new(-1, 0, -0.5);
                v66 = Ray.new(v70.p, v70.rightVector * 3);
            elseif v61.currentdirection.Right == true and v21(v67) == nil then
                local v71 = l_char_0.HumanoidRootPart.CFrame * CFrame.new(1, 0, -0.5);
                v66 = Ray.new(v71.p, v71.rightVector * -3);
            end;
            local v72, v73 = _G.raycastIgnoreList(v66, {
                workspace.PlayerCharacters, 
                workspace.Ragdolls, 
                workspace.Effects
            });
            if v72 == nil or v73 == v61.prenor then
                v66 = Ray.new(l_CFrame_1.p, l_CFrame_1.lookVector * 3);
            end;
        end;
        local v74, v75, v76 = _G.raycastIgnoreList(v66, {
            workspace.PlayerCharacters, 
            workspace.Ragdolls, 
            workspace.Effects
        });
        l_CFrame_1 = l_char_0.HumanoidRootPart.CFrame * CFrame.new(0, 2, 0);
        local v77 = Ray.new(l_CFrame_1.p, l_CFrame_1.lookVector * 3);
        local v78, _, _ = _G.raycastIgnoreList(v77, {
            workspace.PlayerCharacters, 
            workspace.Ragdolls, 
            workspace.Effects
        });
        if v61.Part ~= nil and v78 == nil and v61.Part.Transparency ~= 1 then
            if l_char_0.HumanoidRootPart.Position.Y >= v61.Part.Size.Y / 2 + v61.Part.Position.Y - 2 and v61.ledge == false then
                v61.ledge = true;
                l_char_0.Humanoid:LoadAnimation(script.Ledge):Play();
                local l_BodyVelocity_0 = Instance.new("BodyVelocity");
                l_BodyVelocity_0.MaxForce = Vector3.new(99999997952, 99999997952, 99999997952, 0);
                l_BodyVelocity_0.Velocity = l_char_0.HumanoidRootPart.CFrame.upVector * 5;
                l_BodyVelocity_0.Parent = l_char_0.HumanoidRootPart;
                v61.Enabled = false;
                v61:stop();
                l_char_0.Humanoid.AutoRotate = false;
                task.wait(1);
                l_char_0.Humanoid.AutoRotate = true;
                l_BodyVelocity_0:Destroy();
                v61.Enabled = false;
                v61.ledge = false;
                return;
            end;
        elseif v61.Part ~= nil and v61.Part.Parent == nil or v61.Part ~= nil and v61.Part.Transparency == 1 then
            v61:stop();
        end;
        if v61.Enabled == false then
            return;
        else
            v61.bill.Parent = l_char_0.HumanoidRootPart;
            l_char_0.Humanoid.AutoRotate = false;
            if v74 and v61.Enabled == true then
                if v61.Part == v74 and v61.prenor == v76 then
                    return;
                else
                    v61.prenor = v76;
                    l_char_0.Humanoid.AutoRotate = false;
                    l_char_0.Humanoid.Sit = true;
                    v61.Part = v74;
                    if v61.Attachment == nil then
                        v61.Attachment = Instance.new("Attachment");
                    end;
                    local l_AP_0 = v61.AP;
                    local l_AO_0 = v61.AO;
                    local l_Attachment_0 = v61.Attachment;
                    l_AP_0.Attachment1 = l_Attachment_0;
                    l_AO_0.Attachment1 = l_Attachment_0;
                    pcall(function() --[[ Line: 39 ]]
                        -- upvalues: v74 (copy), l_Attachment_0 (copy)
                        if v74 and l_Attachment_0 then
                            l_Attachment_0.Parent = v74;
                        end;
                    end);
                    v61.Attachment.CFrame = v16({
                        object = v74, 
                        position = v75, 
                        normal = v76
                    });
                    if v61.Attachment.CFrame.Y ~= v61.Attachment.CFrame.Y then
                        v61.Attachment:Destroy();
                        v61.Attachment = Instance.new("Attachment");
                    end;
                    if v61.Anims.Up.IsPlaying == false and v61.currentdirection.Up == true then
                        v61.Anims.Up:Play();
                        v61.Anims.Up:AdjustSpeed(0);
                    end;
                end;
            elseif v74 == nil or v61.Part ~= nil and v61.Part:IsDescendantOf(workspace) == false then
                v61:stop();
            end;
            if v76 then
                local v85 = v76:Dot((Vector3.new(0, 1, 0, 0)));
                if v85 >= 0.75 or v85 <= -0.75 then
                    v61:stop();
                end;
            end;
            return;
        end;
    end;
end;
v0.stop = function(v86) --[[ Line: 390 ]] --[[ Name: stop ]]
    local l_char_1 = v86.char;
    v86.Enabled = false;
    v86.Part = nil;
    v86.Attachment.Parent = l_char_1.HumanoidRootPart;
    local l_AP_1 = v86.AP;
    local l_AO_1 = v86.AO;
    l_AP_1.Attachment1 = nil;
    l_AO_1.Attachment1 = nil;
    local l_pcall_0 = pcall;
    local v91 = nil;
    local v92 = nil;
    l_pcall_0(function() --[[ Line: 39 ]]
        -- upvalues: v91 (copy), v92 (copy)
        if v91 and v92 then
            v92.Parent = v91;
        end;
    end);
    v86.AP.Enabled = false;
    v86.AO.Enabled = false;
    if v86.AlreadyStopped == true then
        return;
    else
        l_char_1.Humanoid.Sit = false;
        v86.AlreadyStopped = true;
        l_char_1.Humanoid.AutoRotate = true;
        l_AP_1 = l_char_1:GetChildren();
        for v93 = 1, #l_AP_1 do
            if l_AP_1[v93]:IsA("BasePart") then
                l_AP_1[v93].CollisionGroup = "Players";
            end;
        end;
        game.ReplicatedStorage.Events.climb:FireServer(false);
        return;
    end;
end;
return v0;