if not game.ReplicatedStorage:FindFirstChild("tradingHUB") then
    local v0, v1, _, _, v4 = require(game.ReplicatedStorage.Modules.ScriptSet).get();
    game:GetService("ProximityPromptService").Enabled = true;
    local l_UserInputService_0 = game:GetService("UserInputService");
    _G.HoldingBlockKey = false;
    local v6 = false;
    local v7 = false;
    local v8 = false;
    local _ = {
        ["Gut Punch"] = false, 
        Buso = false
    };
    local _ = require(game.ReplicatedStorage.Modules.Skills);
    local _ = _G.allowMelee;
    local v12 = game.ReplicatedStorage:WaitForChild("CombatAnimations", 1);
    local v13 = {};
    local _ = require(game.ReplicatedStorage.Modules.FastWait);
    local v15 = require(game.ReplicatedStorage.Modules.SwordHandle.SwordInfo);
    local l_Humanoid_0 = v1:WaitForChild("Humanoid");
    local l_Animator_0 = v1.Humanoid:WaitForChild("Animator");
    _G.FaceMouse = false;
    _G.canuse = true;
    _G.swordEquiped = false;
    _G.currentSword = nil;
    _G.toolLocked = nil;
    _G.canM1 = true;
    local function v22(v18) --[[ Line: 45 ]] --[[ Name: getBuso ]]
        local v19 = false;
        local l_v18_Children_0 = v18:GetChildren();
        for v21 = 1, #l_v18_Children_0 do
            if l_v18_Children_0[v21].Name:match("Buso") and l_v18_Children_0[v21]:IsA("NumberValue") then
                v19 = true;
            end;
        end;
        return v19;
    end;
    local v23 = nil;
    local function _(v24) --[[ Line: 58 ]] --[[ Name: trail ]]
        -- upvalues: v1 (copy), v23 (ref)
        local l_Tool_0 = v1:FindFirstChildWhichIsA("Tool");
        if v1:FindFirstChild(l_Tool_0.Name .. "Sword") == nil and l_Tool_0.Name ~= "2SS" then
            return;
        else
            if v1:FindFirstChild(l_Tool_0.Name .. "Sword") and v1:FindFirstChild(l_Tool_0.Name .. "Sword"):FindFirstChild("Blade") or l_Tool_0.Name == "2SS" then
                local v26 = nil;
                v26 = v1:GetChildren();
                local v27 = {};
                for v28 = 1, #v26 do
                    if v26[v28]:IsA("Model") and v26[v28]:FindFirstChild("Blade") then
                        local l_Children_0 = v26[v28].Blade:GetChildren();
                        for v30 = 1, #l_Children_0 do
                            table.insert(v27, l_Children_0[v30]);
                        end;
                    end;
                end;
                v26 = v27;
                local v31 = game:GetService("HttpService"):GenerateGUID(true);
                v23 = v31;
                do
                    local l_v26_0 = v26;
                    for v33 = 1, #l_v26_0 do
                        if (l_v26_0[v33]:IsA("Trail") or l_v26_0[v33]:IsA("ParticleEmitter")) and l_v26_0[v33].Name ~= "notTrail" and l_v26_0[v33]:GetAttribute("trailBypass") == nil then
                            l_v26_0[v33].Enabled = true;
                            task.spawn(function() --[[ Line: 86 ]]
                                -- upvalues: v24 (copy), v23 (ref), v31 (copy), l_v26_0 (ref), v33 (copy)
                                _G.fw(v24);
                                if v23 == v31 then
                                    l_v26_0[v33].Enabled = false;
                                end;
                            end);
                        end;
                    end;
                end;
            end;
            return;
        end;
    end;
    local v35 = false;
    l_UserInputService_0.InputEnded:Connect(function(v36, v37) --[[ Line: 98 ]]
        if v37 then
            return;
        else
            if v36.KeyCode == Enum.KeyCode.F then
                _G.HoldingBlockKey = false;
            end;
            return;
        end;
    end);
    game:GetService("GuiService").MenuOpened:Connect(function() --[[ Line: 107 ]]
        -- upvalues: v7 (ref), v35 (ref)
        if v7 == false then
            return;
        else
            v35 = true;
            _G.HoldingBlockKey = false;
            return;
        end;
    end);
    local function _() --[[ Line: 115 ]] --[[ Name: getTools ]]
        -- upvalues: v0 (copy)
        local v38 = nil;
        local l_Children_1 = v0.Backpack:GetChildren();
        for v40 = 1, #l_Children_1 do
            if l_Children_1[v40]:IsA("Tool") and l_Children_1[v40]:FindFirstChild("SwordEquip") then
                return l_Children_1[v40].Name;
            end;
        end;
        return v38;
    end;
    local l_InputCallbacks_0 = require(v0.Backpack:WaitForChild("InputCallbacks"));
    l_UserInputService_0.InputBegan:Connect(function(v43, v44) --[[ Line: 129 ]]
        -- upvalues: v1 (copy), v7 (ref), v35 (ref), l_InputCallbacks_0 (copy)
        local _ = v1:FindFirstChildWhichIsA("Tool");
        if v7 == true and (v43.KeyCode == Enum.KeyCode.Slash or v43.KeyCode == Enum.KeyCode.BackSlash) then
            v35 = true;
            _G.HoldingBlockKey = false;
            return;
        elseif v44 == true then
            return;
        else
            if v43.KeyCode == Enum.KeyCode.F then
                _G.HoldingBlockKey = true;
            end;
            if v43.KeyCode == Enum.KeyCode.J then
                l_InputCallbacks_0.Callbacks.Buso:PC_Activate();
            end;
            if v43.UserInputType == Enum.UserInputType.MouseButton1 then
                _G.HoldingM1 = true;
                while _G.HoldingM1 == true do
                    if l_InputCallbacks_0.Utils.holdingValidMelee() == true then
                        l_InputCallbacks_0.Callbacks.Attack:PC_Activate();
                    end;
                    task.wait();
                end;
            end;
            return;
        end;
    end);
    l_UserInputService_0.InputEnded:Connect(function(v46, _) --[[ Line: 157 ]]
        if v46.UserInputType == Enum.UserInputType.MouseButton1 then
            _G.HoldingM1 = false;
        end;
    end);
    local v48 = nil;
    local v49 = {};
    local v50 = nil;
    local v51 = nil;
    v1.ChildAdded:Connect(function(v52) --[[ Line: 167 ]]
        -- upvalues: v15 (copy), v48 (ref), v51 (ref), v1 (copy), v4 (copy), v0 (copy), v50 (ref), l_Animator_0 (copy), v12 (copy), v13 (copy), v49 (copy), v6 (ref)
        if v52:IsA("Tool") and (v52:GetAttributes().MeleeTool ~= nil or v15[v52.Name]) then
            v48 = v52;
            if v51 then
                v51:Stop();
                v51:Destroy();
                v51 = nil;
            end;
            local v53 = v1:GetAttribute("customM1") ~= nil;
            local l_Value_0 = v4.Stats.FightingStyle.Value;
            if l_Value_0 and game.ReplicatedStorage.CombatAnimations:FindFirstChild(v4.Stats.FightingStyle.Value) and v15[v52.Name] == nil and v53 == false then
                if v52:GetAttributes().MeleeTool ~= nil then
                    local v55 = nil;
                    local v56 = v0.Backpack:FindFirstChild(l_Value_0) or v52;
                    if v56.Name == l_Value_0 and v52:GetAttribute("customIdle") == nil then
                        local v57 = "Idle";
                        local l_v56_Attribute_0 = v56:GetAttribute("idleName");
                        if l_v56_Attribute_0 then
                            v57 = l_v56_Attribute_0;
                        end;
                        if v56.Main:FindFirstChild("Idle2") == nil then
                            v55 = v56.Main:FindFirstChild(v57);
                            local l_v56_Attribute_1 = v56:GetAttribute("idleAsWalk");
                            if v50 ~= nil and l_v56_Attribute_1 == nil then
                                v50:Stop();
                                v50:Destroy();
                                v50 = nil;
                            elseif l_v56_Attribute_1 then
                                if v50 then
                                    v50:Stop();
                                    v50:Destroy();
                                    v50 = nil;
                                end;
                                v50 = l_Animator_0:LoadAnimation(v55);
                            end;
                        else
                            v55 = v56.Main:FindFirstChild(v57);
                            if v50 == nil then
                                v50 = l_Animator_0:LoadAnimation(v56.Main.Idle2);
                            end;
                        end;
                        v51 = l_Animator_0:LoadAnimation(v55);
                    end;
                end;
            elseif v50 then
                v50:Stop();
                v50:Destroy();
                v50 = nil;
            end;
            if v53 == false then
                if v51 == nil then
                    v51 = l_Animator_0:LoadAnimation(v12.Melee.Idle);
                end;
                if v50 == nil then
                    v50 = l_Animator_0:LoadAnimation(v12.Melee.Idle);
                else
                    v50.Priority = Enum.AnimationPriority.Action;
                end;
                if v52:GetAttributes().MeleeTool ~= nil and v13[v52.Name] == nil and _G.canuse == true then
                    v51:Play(0.25);
                end;
                if v52:GetAttribute("customIdle") ~= nil or _G.canuse == false then
                    v51:Stop();
                end;
                v49[v52] = v52.AttributeChanged:Connect(function() --[[ Line: 246 ]]
                    -- upvalues: v52 (copy), v51 (ref), v13 (ref)
                    if v52:GetAttribute("customIdle") ~= nil then
                        v51:Stop();
                        return;
                    else
                        if v51.IsPlaying == false and v52:GetAttributes().MeleeTool ~= nil and v13[v52.Name] == nil and v52.Name ~= "BlackLeg" then
                            v51:Play(0.25);
                        end;
                        return;
                    end;
                end);
            elseif v51 then
                v51:Stop();
                v51 = nil;
            end;
            v6 = true;
        end;
    end);
    v1.ChildRemoved:Connect(function(v60) --[[ Line: 269 ]]
        -- upvalues: v15 (copy), v48 (ref), v6 (ref), v51 (ref), v49 (copy)
        if v60:IsA("Tool") and (v60:GetAttributes().MeleeTool ~= nil or v15[v60.Name]) then
            v48 = nil;
            v6 = false;
            if v51 then
                v51:Stop();
            end;
        end;
        if v49[v60] then
            v49[v60]:Disconnect();
            v49[v60] = nil;
        end;
    end);
    game["Run Service"].Heartbeat:Connect(function() --[[ Line: 285 ]]
        -- upvalues: l_Humanoid_0 (copy), v48 (ref), v1 (copy), v50 (ref), v51 (ref)
        if l_Humanoid_0 == nil then
            return;
        elseif v48 == nil or v48 and not v48:GetAttribute("MeleeTool") or v1:GetAttribute("customM1") ~= nil then
            if v50 then
                v50:Stop();
            end;
            if v51 then
                v51:Stop();
            end;
            return;
        elseif v48.Parent ~= v1 or _G.canuse == false or _G.blocking == true then
            if v50 then
                if v50.IsPlaying == true then
                    v50:Stop();
                end;
                if v51.IsPlaying == true then
                    v51:Stop();
                end;
            end;
            return;
        else
            if l_Humanoid_0.MoveDirection ~= Vector3.new() or l_Humanoid_0.FloorMaterial == Enum.Material.Air then
                if v51 and v51.IsPlaying == true then
                    v51:Stop();
                end;
                if v50 and v50.IsPlaying == false then
                    v50:Play();
                    return;
                end;
            else
                if v51 and v51.IsPlaying == false then
                    v51:Play();
                end;
                if v50 and v50.IsPlaying == true then
                    v50:Stop();
                end;
            end;
            return;
        end;
    end);
    while true do
        local v61 = nil;
        do
            local l_v61_0 = v61;
            local l_status_0, l_result_0 = pcall(function() --[[ Line: 334 ]]
                -- upvalues: v8 (ref), v1 (copy), v7 (ref), l_InputCallbacks_0 (copy), l_Animator_0 (copy), l_v61_0 (ref), v22 (copy), l_Humanoid_0 (copy), v35 (ref)
                if _G.HoldingBlockKey == true then
                    local v63 = false;
                    local v64 = true;
                    local function v65() --[[ Line: 339 ]] --[[ Name: checker ]]
                        -- upvalues: v8 (ref), v1 (ref), v63 (ref), v64 (ref)
                        if v8 == false and _G.canuse == true and _G.check:inspect(v1) == true and v1:FindFirstChildWhichIsA("Tool") and v1.Parent == workspace.PlayerCharacters then
                            v63 = true;
                            return;
                        else
                            v63 = false;
                            v64 = false;
                            return;
                        end;
                    end;
                    v65();
                    while v63 ~= true and _G.HoldingBlockKey ~= false do
                        v65();
                        game["Run Service"].RenderStepped:Wait();
                        if v63 == true or _G.HoldingBlockKey == false or v1.Parent ~= workspace.PlayerCharacters then
                            break;
                        end;
                    end;
                    if _G.HoldingBlockKey == false then
                        return;
                    else
                        v8 = true;
                        v7 = true;
                        _G.blocking = true;
                        l_InputCallbacks_0.Callbacks.Attack:stopM1Anims();
                        local l_Tool_2 = v1:FindFirstChildWhichIsA("Tool");
                        local v67 = {};
                        local v68 = nil;
                        do
                            local l_v68_0 = v68;
                            if not pcall(function() --[[ Line: 368 ]]
                                -- upvalues: l_v68_0 (ref), l_Animator_0 (ref), v1 (ref)
                                l_v68_0 = l_Animator_0:LoadAnimation(v1:FindFirstChildWhichIsA("Tool").Main.Block);
                            end) then
                                if l_v68_0 then
                                    l_v68_0:Destroy();
                                end;
                                l_v68_0 = l_Animator_0:LoadAnimation(game.ReplicatedStorage.Util.Melee.Block);
                            end;
                            local l_v1_Attribute_0 = v1:GetAttribute("customM1Model");
                            if l_v1_Attribute_0 then
                                local l_v1_FirstChild_0 = v1:FindFirstChild(l_v1_Attribute_0);
                                if l_v1_FirstChild_0 then
                                    if l_v68_0 then
                                        l_v68_0:Destroy();
                                    end;
                                    local l_v1_Attribute_1 = v1:GetAttribute("customM1");
                                    local l_FirstChild_0 = game.ReplicatedStorage.Modules.SwordHandle.Swords:FindFirstChild(l_v1_Attribute_1);
                                    l_v68_0 = l_v1_FirstChild_0.AnimationController:LoadAnimation(l_FirstChild_0.Block);
                                end;
                            end;
                            local l_Action3_0 = Enum.AnimationPriority.Action3;
                            l_v68_0.Priority = l_Action3_0;
                            if l_Tool_2 then
                                l_Action3_0 = v1:FindFirstChild(l_Tool_2.Name .. "Sword");
                                if l_Action3_0 and l_Action3_0:FindFirstChild("AnimationController") then
                                    local v75 = l_Action3_0.AnimationController:LoadAnimation(v1:FindFirstChildWhichIsA("Tool").Main.Block);
                                    v75.Priority = Enum.AnimationPriority.Action3;
                                    table.insert(v67, v75);
                                end;
                            end;
                            table.insert(v67, l_v68_0);
                            for v76 = 1, #v67 do
                                v67[v76]:Play();
                            end;
                            warn("invoke block remote");
                            l_Action3_0 = game.ReplicatedStorage.Events.Block:InvokeServer(true, "Melee", v64);
                            warn("finished invoke block remote");
                            l_v61_0 = game.ReplicatedStorage.Util.Melee.BlockGui:Clone();
                            l_v61_0.Parent = v1.HumanoidRootPart;
                            if l_v1_Attribute_0 ~= nil then
                                l_v61_0.MaxDistance = 200;
                            end;
                            if v22(v1) == true then
                                l_v61_0.ImageLabel.Frame.ImageLabel.ImageColor3 = Color3.fromRGB(85, 85, 255);
                            end;
                            local v77 = tick();
                            while true do
                                l_Humanoid_0.WalkSpeed = 5;
                                if l_Action3_0 ~= nil and l_Action3_0.Parent ~= nil and l_Action3_0:IsDescendantOf(v1) ~= false then
                                    _G.blocking = true;
                                    local v78 = l_Action3_0.Value / l_Action3_0.MaxValue;
                                    l_v61_0.ImageLabel.Frame.Size = UDim2.new(1, 0, v78, 0);
                                    l_v61_0.ImageLabel.Frame.Position = UDim2.new(0, 0, 1 - v78, 0);
                                    l_v61_0.ImageLabel.Frame.ImageLabel.Size = UDim2.new(1, 0, 1 / v78, 0);
                                    l_v61_0.ImageLabel.Frame.ImageLabel.Position = UDim2.new(0, 0, -(l_v61_0.ImageLabel.Frame.Position.Y.Scale / l_v61_0.ImageLabel.Frame.Size.Y.Scale), 0);
                                    if v1.Humanoid.SeatPart == nil then
                                        if game:GetService("GuiService").MenuIsOpen == true then
                                            v35 = true;
                                            break;
                                        else
                                            game["Run Service"].RenderStepped:Wait();
                                            if _G.HoldingBlockKey == false and tick() - v77 >= 0.1 or l_Action3_0 == nil or l_Action3_0 and l_Action3_0.Parent == nil or l_Action3_0:IsDescendantOf(v1) == false or v1.Parent ~= workspace.PlayerCharacters or l_Tool_2 and l_Tool_2.Parent ~= v1 then
                                                break;
                                            end;
                                        end;
                                    else
                                        break;
                                    end;
                                else
                                    break;
                                end;
                            end;
                            if _G.HoldingBlockKey == false then
                                blockHold = false;
                            end;
                            _G.blocking = false;
                            if l_Action3_0 then
                                l_Action3_0:Destroy();
                            end;
                            l_v61_0:Destroy();
                            l_Humanoid_0.WalkSpeed = 16;
                            for v79 = 1, #v67 do
                                v67[v79]:Stop();
                            end;
                            v7 = false;
                            game.ReplicatedStorage.Events.Block:InvokeServer(false, "Melee");
                            _G.keysetup:cooldown("Block", 1);
                            task.wait(1);
                            v8 = false;
                        end;
                    end;
                end;
            end);
            if not l_status_0 then
                warn("ERROR:", l_result_0);
                _G.blocking = false;
                _G.HoldingBlockKey = false;
                v7 = false;
                v8 = false;
                if l_v61_0 then
                    l_v61_0:Destroy();
                end;
            end;
            game["Run Service"].RenderStepped:Wait();
        end;
    end;
end;
_G.canuse = true;
script:Destroy();