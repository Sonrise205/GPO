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
local l_LocalPlayer_0 = game.Players.LocalPlayer;
local l_PlayerModule_0 = require(l_LocalPlayer_0.PlayerScripts:WaitForChild("PlayerModule"));
local v12 = require(game.ReplicatedStorage.Modules.MaidClass);
local l_l_PlayerModule_0_Controls_0 = l_PlayerModule_0:GetControls();
local function v20(v14) --[[ Line: 18 ]] --[[ Name: getClimbAttachmentCFrame ]]
    local l_normal_0 = v14.normal;
    local l_position_0 = v14.position;
    local l_object_0 = v14.object;
    local l_Unit_0 = Vector3.new(0, 1, 0, 0):Cross(l_normal_0).Unit;
    local l_Unit_1 = l_normal_0:Cross(l_Unit_0).Unit;
    return l_object_0.CFrame:inverse() * CFrame.new(l_position_0.x, l_position_0.y, l_position_0.z, l_Unit_0.x, l_Unit_1.x, l_normal_0.x, l_Unit_0.y, l_Unit_1.y, l_normal_0.y, l_Unit_0.z, l_Unit_1.z, l_normal_0.z);
end;
local function v25(v21) --[[ Line: 35 ]] --[[ Name: checkpart ]]
    local v22, _, _ = _G.raycastWhitelist(v21, {
        workspace.Islands, 
        workspace.Env, 
        workspace.Ships, 
        workspace.Jails
    });
    return v22;
end;
local function _(v26, v27, v28, v29) --[[ Line: 40 ]] --[[ Name: lineup ]]
    v26.Attachment1 = v28;
    v27.Attachment1 = v28;
    pcall(function() --[[ Line: 44 ]]
        -- upvalues: v29 (copy), v28 (copy)
        if v29 and v28 then
            v28.Parent = v29;
        end;
    end);
end;
v0.setup = function(_, v32) --[[ Line: 51 ]] --[[ Name: setup ]]
    -- upvalues: v5 (ref), v7 (ref), v8 (ref), v3 (copy), v12 (copy), v1 (copy), v2 (copy), v0 (copy), v25 (copy), v9 (copy)
    local v33, v34, v35, v36 = v3.get();
    v5 = v33;
    v7 = v35;
    v8 = v36;
    v32 = v34;
    v33 = v32:WaitForChild("HumanoidRootPart");
    v34 = v12.new();
    v35 = {
        Part = nil, 
        AO = script.AlignOrientation:Clone(), 
        AP = script.AlignPosition:Clone(), 
        Attachment = Instance.new("Attachment"), 
        char = v32
    };
    v35.AP.Parent = v33;
    v35.AO.Parent = v33;
    v35.AP.Attachment0 = v33.ClimbCenter;
    v35.AO.Attachment0 = v33.ClimbCenter;
    v35.Enabled = false;
    v35.Anims = {
        Up = v32.Humanoid:LoadAnimation(script.Up), 
        Left = v32.Humanoid:LoadAnimation(script.Left), 
        Right = v32.Humanoid:LoadAnimation(script.Right), 
        Down = v32.Humanoid:LoadAnimation(script.Down)
    };
    v35.fakepart = nil;
    v35.currentdirection = {
        Up = false, 
        Down = false, 
        Right = false, 
        Left = false
    };
    v35.AlreadyStopped = false;
    v35.prenor = nil;
    v35.ledge = false;
    v35.bill = script.BillboardGui:Clone();
    v35.bill.ImageLabel.ImageLabel.ImageRectSize = Vector2.new(v1.GetSize(v2));
    v35.connection = nil;
    v35.LengthScan = 2 + v32.PrimaryPart.Size.Y * 2;
    v35.climbingtime = 20;
    v34:AttachToInstance(v32.PrimaryPart);
    setmetatable(v35, v0);
    for _, v38 in v35.Anims do
        v38.Looped = true;
    end;
    v36 = function(v39) --[[ Line: 87 ]] --[[ Name: pro ]]
        -- upvalues: v35 (copy)
        for _, v41 in v35.Anims do
            if v39 == v41 then
                if v39.IsPlaying == false then
                    v39:Play();
                end;
                v41:AdjustWeight(1);
                v39:AdjustSpeed(1);
            else
                v41:AdjustSpeed(0);
            end;
        end;
    end;
    local _ = function(v42) --[[ Line: 101 ]] --[[ Name: checkstop ]]
        -- upvalues: v35 (copy)
        for _, v44 in v35.Anims do
            if v44 ~= v42 and v44.Speed == 1 and v44.IsPlaying == true then
                v42:Stop();
                v42:AdjustSpeed(0);
                return;
            end;
        end;
    end;
    local function v48() --[[ Line: 111 ]] --[[ Name: stopall ]]
        -- upvalues: v35 (copy)
        for _, v47 in v35.Anims do
            if v47.IsPlaying == true then
                v47:Stop();
                v47.Looped = true;
                v47:AdjustSpeed(0);
            end;
        end;
    end;
    local v49 = tick();
    local v50 = 0;
    v34:GiveTask(game["Run Service"].RenderStepped:Connect(function(v51) --[[ Line: 125 ]]
        -- upvalues: v35 (copy), v48 (copy), v49 (ref), v1 (ref), v2 (ref), v33 (copy), v25 (ref), v32 (ref), v50 (ref), v9 (ref)
        if v35.Attachment and v35.Attachment.Position.Y ~= v35.Attachment.Position.Y then
            v35.Attachment:Destroy();
            v35.Attachment = Instance.new("Attachment");
        end;
        if v35.Enabled == false then
            v48();
            v35.climbingtime = v35.climbingtime + v51;
            if v35.climbingtime >= 20 then
                v35.climbingtime = 20;
                v35.bill.Parent = nil;
            end;
            v49 = tick();
        else
            v35.climbingtime = v35.climbingtime - v51;
            v49 = tick();
            if v35.climbingtime <= 0 then
                v35.climbingtime = 0;
                warn("stopped because ran out of time");
                v35:stop();
            end;
        end;
        local v52 = v35.climbingtime / 20;
        local l_new_0 = Vector2.new;
        local l_ImageLabel_0 = v35.bill.ImageLabel.ImageLabel;
        l_ImageLabel_0.ImageRectSize = l_new_0(v1.GetSize(v2));
        local v55 = v52 * 64;
        l_ImageLabel_0.ImageRectOffset = l_new_0(v1.GetOffset(v2, v55));
        l_ImageLabel_0.ImageColor3 = Color3.fromRGB(255, 0, 0):Lerp(Color3.fromRGB(85, 255, 127), v52);
        local v56 = {
            Rain = true, 
            Snow = true
        };
        local v57 = {
            Rain = 0.05, 
            Snow = 0.06
        };
        if v35.Enabled == true then
            if workspace.Islands:FindFirstChild(_G.currentisland) and v56[workspace.Islands:FindFirstChild(_G.currentisland).Settings.Weather.Value] then
                local l_CFrame_0 = v33.CFrame;
                local _ = v57[workspace.Islands:FindFirstChild(_G.currentisland).Settings.Weather.Value];
                if v25(Ray.new(l_CFrame_0.p, l_CFrame_0.upVector * -(v32.Humanoid.HipHeight * 2))) == nil and tick() - v50 >= v9() then
                    v50 = tick();
                end;
            end;
            v35:step();
        end;
        if v35.Part ~= nil and v35.Part:IsDescendantOf(workspace) == false then
            warn("stopped nil part");
            v35:stop();
        end;
    end));
    return v35;
end;
local _ = function(v60) --[[ Line: 194 ]] --[[ Name: moving ]]
    local v61 = false;
    for _, v63 in v60 do
        if v63 == true then
            v61 = true;
        end;
    end;
    return v61;
end;
local function v66(v65) --[[ Line: 204 ]] --[[ Name: getClimbingAnimation ]]
    if math.abs(v65.X) >= math.abs(v65.Y) and math.abs(v65.X) >= math.abs(v65.Z) then
        return v65.X > 0 and "Right" or "Left", (math.abs(v65.X));
    elseif math.abs(v65.Z) >= math.abs(v65.X) and math.abs(v65.Z) >= math.abs(v65.Y) then
        return v65.Z > 0 and "Down" or "Up", (math.abs(v65.Z));
    else
        return "Up", 0;
    end;
end;
local v67 = {
    workspace.Islands, 
    workspace.Ships, 
    workspace.Env
};
v0.step = function(v68) --[[ Line: 216 ]] --[[ Name: step ]]
    -- upvalues: l_l_PlayerModule_0_Controls_0 (copy), v66 (copy), v25 (copy), v67 (copy), v20 (copy)
    local l_char_0 = v68.char;
    if l_char_0.PrimaryPart == nil then
        return;
    else
        local l_CFrame_1 = l_char_0.HumanoidRootPart.CFrame;
        if v68.Enabled == true then
            v68.AP.Enabled = true;
            v68.AO.Enabled = true;
        end;
        if v68.Enabled == false then
            warn("stopped enabled = false");
            v68:stop();
            return;
        elseif l_char_0:FindFirstChild("Stun") and v68.Enabled == true then
            warn("stopped stun");
            v68:stop();
            return;
        elseif l_char_0.PrimaryPart == nil then
            return;
        else
            local l_HumanoidRootPart_0 = l_char_0.HumanoidRootPart;
            local l_l_l_PlayerModule_0_Controls_0_MoveVector_0 = l_l_PlayerModule_0_Controls_0:GetMoveVector();
            local v73, v74 = v66(l_l_l_PlayerModule_0_Controls_0_MoveVector_0);
            if v68.Enabled == true and v73 == "Down" and v68.Part ~= nil and v25(Ray.new(l_CFrame_1.p, l_CFrame_1.upVector * -(l_char_0.Humanoid.HipHeight * 2))) ~= nil then
                warn("stopped part below");
                v68:stop();
                return;
            else
                if not v68.Anims[v73].IsPlaying then
                    for _, v76 in pairs(v68.Anims) do
                        v76:Stop();
                    end;
                    v68.Anims[v73]:Play();
                end;
                v68.Anims[v73]:AdjustSpeed(v74);
                local v77 = l_HumanoidRootPart_0.Size.Y * 0.5 + l_char_0.Humanoid.HipHeight;
                local l_Position_0 = l_char_0.PrimaryPart.Position;
                local function v87(v79) --[[ Line: 268 ]] --[[ Name: getRealDistance ]]
                    -- upvalues: l_char_0 (ref), l_Position_0 (copy)
                    local v80 = false;
                    if v79.X < 0 or v79.Y < 0 or v79.Z < 0 then
                        v80 = true;
                    end;
                    local l_Position_1 = (l_char_0.PrimaryPart.CFrame * v79).Position;
                    local l_Magnitude_0 = (l_Position_1 - l_Position_0).Magnitude;
                    local v83 = Ray.new(l_Position_0, (l_Position_1 - l_Position_0).Unit * -l_Magnitude_0);
                    local _, v85 = workspace:FindPartOnRayWithWhitelist(v83, {
                        workspace.Islands, 
                        workspace.Ships, 
                        workspace.Env
                    });
                    local l_Magnitude_1 = (l_Position_0 - v85).Magnitude;
                    if l_Magnitude_1 ~= l_Magnitude_1 then
                        return 0;
                    else
                        if v80 == true then
                            l_Magnitude_1 = l_Magnitude_1 * -1;
                        end;
                        return l_Magnitude_1;
                    end;
                end;
                local v88 = l_HumanoidRootPart_0.CFrame * CFrame.new(v87(CFrame.new(l_l_l_PlayerModule_0_Controls_0_MoveVector_0.X, 0, 0)), v87(CFrame.new(0, -l_l_l_PlayerModule_0_Controls_0_MoveVector_0.Z, 0)), 0);
                local v89 = Ray.new(v88.Position, v88.LookVector * 3);
                local v90 = _G.raycastWhitelist(v89, v67);
                local v91 = Ray.new(l_HumanoidRootPart_0.Position, l_HumanoidRootPart_0.CFrame.RightVector * l_l_l_PlayerModule_0_Controls_0_MoveVector_0.X);
                local v92 = _G.raycastWhitelist(v91, v67);
                local v93 = l_HumanoidRootPart_0.Size.Z * 0.5 + 0.5;
                local v94 = l_HumanoidRootPart_0.Position - l_HumanoidRootPart_0.CFrame.LookVector * v93;
                local v95 = l_HumanoidRootPart_0.CFrame.UpVector * -l_l_l_PlayerModule_0_Controls_0_MoveVector_0.Z * v77 + l_HumanoidRootPart_0.CFrame.RightVector * l_l_l_PlayerModule_0_Controls_0_MoveVector_0.X * 0.5;
                local v96 = Ray.new(v94, v95);
                local v97 = _G.raycastWhitelist(v96, v67);
                if v97 and v97.CanCollide == true then
                    return;
                else
                    if v92 then
                        v89 = v91;
                    elseif not v90 then
                        local v98 = l_HumanoidRootPart_0.CFrame * CFrame.new(v87(CFrame.new(l_l_l_PlayerModule_0_Controls_0_MoveVector_0.X, 0, 0)), 0, (v87(CFrame.new(0, 0, -1))));
                        v89 = Ray.new(v98.Position, v98.RightVector * -l_l_l_PlayerModule_0_Controls_0_MoveVector_0.X * 3);
                    end;
                    local v99, v100, v101 = _G.raycastWhitelist(v89, v67);
                    l_CFrame_1 = l_char_0.HumanoidRootPart.CFrame * CFrame.new(0, 2, 0);
                    local v102 = Ray.new(l_CFrame_1.p, l_CFrame_1.lookVector * 3);
                    local v103, _, _ = _G.raycastWhitelist(v102, v67);
                    if v99 and v99.CollisionGroup:match("Barrier") then
                        v99 = nil;
                        warn("stopped barrier poart");
                        v68.AlreadyStopped = false;
                        v68:stop();
                        return;
                    elseif v68.Part and v68.Part.CollisionGroup:match("Barrier") then
                        warn("stopped barrier poart 2");
                        v68.AlreadyStopped = false;
                        v68:stop();
                        return;
                    elseif v68.Part ~= nil and v103 == nil and v68.Part.Transparency ~= 1 then
                        local _ = l_char_0.HumanoidRootPart.Position.Y;
                        local _ = v68.Part.Size.Y / 2 + v68.Part.Position.Y - 2;
                        local v108 = Ray.new(l_char_0.Head.Position + Vector3.new(0, 1, 0, 0):Cross(l_char_0.Head.CFrame.RightVector) * 3 + Vector3.new(0, 1, 0, 0), Vector3.new(0, 1, 0, 0) * -v77 * 2);
                        if _G.raycastWhitelist(v108, v67) and v68.ledge == false then
                            v68:stop();
                            v68.ledge = true;
                            l_char_0.Humanoid:LoadAnimation(script.Ledge):Play();
                            local l_BodyVelocity_0 = Instance.new("BodyVelocity");
                            l_BodyVelocity_0.MaxForce = Vector3.new(99999997952, 99999997952, 99999997952, 0);
                            l_BodyVelocity_0.Velocity = l_char_0.HumanoidRootPart.CFrame.upVector * 5;
                            l_BodyVelocity_0.Parent = l_char_0.HumanoidRootPart;
                            v68.Enabled = false;
                            l_char_0.Humanoid.AutoRotate = false;
                            task.wait(1);
                            l_char_0.Humanoid.AutoRotate = true;
                            l_BodyVelocity_0:Destroy();
                            v68.Enabled = false;
                            v68.ledge = false;
                        end;
                        if v68.Part then
                            warn("eldge detect?", v68.Part:GetFullName(), v68.Part.CollisionGroup);
                        else
                            warn("ledge detected no part");
                        end;
                        v68.AlreadyStopped = false;
                        v68:stop();
                        return;
                    elseif v68.Part ~= nil and v68.Part.Parent == nil or v68.Part ~= nil and v68.Part.Transparency == 1 then
                        warn("stop climb because no eldge");
                        v68.AlreadyStopped = false;
                        v68:stop();
                        return;
                    elseif v68.Enabled == false then
                        v68:stop();
                        warn("not enabled so ret");
                        return;
                    else
                        v68.bill.Parent = l_char_0.HumanoidRootPart;
                        l_char_0.Humanoid.AutoRotate = false;
                        if v99 and v68.Enabled == true then
                            v68.Attachment.WorldPosition = v100;
                            v68.Part = v99;
                            if v68.Part == v99 and v68.prenor == v101 then
                                return;
                            else
                                v68.prenor = v101;
                                l_char_0.Humanoid.AutoRotate = false;
                                l_char_0.Humanoid.Sit = true;
                                if v68.Attachment == nil then
                                    v68.Attachment = Instance.new("Attachment");
                                end;
                                local l_AP_0 = v68.AP;
                                local l_AO_0 = v68.AO;
                                local l_Attachment_0 = v68.Attachment;
                                local l_v99_0 = v99;
                                l_AP_0.Attachment1 = l_Attachment_0;
                                l_AO_0.Attachment1 = l_Attachment_0;
                                local l_l_v99_0_0 = l_v99_0 --[[ copy: 30 -> 33 ]];
                                pcall(function() --[[ Line: 44 ]]
                                    -- upvalues: l_l_v99_0_0 (copy), l_Attachment_0 (copy)
                                    if l_l_v99_0_0 and l_Attachment_0 then
                                        l_Attachment_0.Parent = l_l_v99_0_0;
                                    end;
                                end);
                                v68.Attachment.CFrame = v20({
                                    object = v99, 
                                    position = v100, 
                                    normal = v101
                                });
                                if v68.Attachment.CFrame.Y ~= v68.Attachment.CFrame.Y then
                                    v68.Attachment:Destroy();
                                    v68.Attachment = Instance.new("Attachment");
                                    warn("attachment destroyed");
                                end;
                                l_AP_0 = l_char_0:GetChildren();
                                for v115 = 1, #l_AP_0 do
                                    if l_AP_0[v115]:IsA("BasePart") then
                                        l_AP_0[v115].CollisionGroup = "noclip";
                                    end;
                                end;
                                if v68.Anims.Up.IsPlaying == false and v68.currentdirection.Up == true then
                                    v68.Anims.Up:Play();
                                    v68.Anims.Up:AdjustSpeed(0);
                                end;
                            end;
                        elseif v99 == nil or v68.Part ~= nil and v68.Part:IsDescendantOf(workspace) == false then
                            warn("stop climb because no eldge 2", v68.Enabled, v99, v68.Part);
                            v68.AlreadyStopped = false;
                            v68:stop();
                            return;
                        end;
                        warn("climb step");
                        if l_char_0:GetAttribute("ServerClimb") == nil then
                            v68.AlreadyStopped = false;
                            warn("stop because too server not valid");
                            v68:stop();
                            return;
                        else
                            if v101 then
                                local v116 = v101:Dot((Vector3.new(0, 1, 0, 0)));
                                if v116 >= 0.75 or v116 <= -0.75 then
                                    warn("stop because too steep");
                                    v68.AlreadyStopped = false;
                                    v68:stop();
                                end;
                            end;
                            l_char_0 = game.Players.LocalPlayer.Character;
                            return;
                        end;
                    end;
                end;
            end;
        end;
    end;
end;
v0.stop = function(v117) --[[ Line: 487 ]] --[[ Name: stop ]]
    if v117.AlreadyStopped == true then
        return;
    else
        local l_char_1 = v117.char;
        v117.Enabled = false;
        v117.Part = nil;
        v117.prenor = Vector3.new(2, 2, 2, 0);
        v117.Attachment.Parent = l_char_1.HumanoidRootPart;
        local l_AP_1 = v117.AP;
        local l_AO_1 = v117.AO;
        l_AP_1.Attachment1 = nil;
        l_AO_1.Attachment1 = nil;
        local l_pcall_0 = pcall;
        local v122 = nil;
        local v123 = nil;
        l_pcall_0(function() --[[ Line: 44 ]]
            -- upvalues: v122 (copy), v123 (copy)
            if v122 and v123 then
                v123.Parent = v122;
            end;
        end);
        v117.AP.Enabled = false;
        v117.AO.Enabled = false;
        _G.canuse = true;
        l_char_1.Humanoid.Sit = false;
        v117.AlreadyStopped = true;
        l_char_1.Humanoid.AutoRotate = true;
        l_AP_1 = l_char_1:GetChildren();
        for v124 = 1, #l_AP_1 do
            if l_AP_1[v124]:IsA("BasePart") then
                l_AP_1[v124].CollisionGroup = "Players";
            end;
        end;
        l_char_1.PrimaryPart.AssemblyLinearVelocity = Vector3.new();
        l_char_1.PrimaryPart.AssemblyAngularVelocity = Vector3.new();
        task.spawn(function() --[[ Line: 521 ]]
            game.ReplicatedStorage.Events.climb:InvokeServer(false);
        end);
        warn("actually stopped");
        return;
    end;
end;
return v0;