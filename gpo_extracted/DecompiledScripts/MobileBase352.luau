local l_RunService_0 = game:GetService("RunService");
local l_UserInputService_0 = game:GetService("UserInputService");
local _ = game:GetService("StarterGui");
local l_TweenService_0 = game:GetService("TweenService");
local l_LocalPlayer_0 = game.Players.LocalPlayer;
local _ = l_LocalPlayer_0:GetMouse();
local _ = workspace.CurrentCamera;
local v7 = require(script.Maid);
local v8 = require(script.Signal);
local v9 = {};
v9.__index = v9;
local l_PlayerScripts_0 = l_LocalPlayer_0:WaitForChild("PlayerScripts");
local l_PlayerModule_0 = require(l_PlayerScripts_0:WaitForChild("PlayerModule"));
local v12 = game.ReplicatedStorage:WaitForChild("Stats" .. l_LocalPlayer_0.Name);
local v13 = true;
l_UserInputService_0.WindowFocused:Connect(function() --[[ Line: 25 ]]
    -- upvalues: v13 (ref)
    v13 = true;
end);
l_UserInputService_0.WindowFocusReleased:Connect(function() --[[ Line: 29 ]]
    -- upvalues: v13 (ref)
    v13 = false;
end);
v9.new = function(v14) --[[ Line: 33 ]] --[[ Name: new ]]
    -- upvalues: v9 (copy), v7 (copy), v8 (copy), l_LocalPlayer_0 (copy)
    local v15 = setmetatable({}, v9);
    v15.Maid = v7.new();
    v15.Input = v8.new();
    v15.ToolName = v14;
    if v14 then
        v15.Tool = nil;
        v15.on = false;
        task.spawn(function() --[[ Line: 43 ]]
            -- upvalues: v15 (copy), l_LocalPlayer_0 (ref), v14 (copy)
            v15.Tool = l_LocalPlayer_0.Backpack:FindFirstChild(v14) or l_LocalPlayer_0.Character:FindFirstChild(v14);
            if v15.Tool == nil then
                v15.Tool = l_LocalPlayer_0.Backpack:WaitForChild(v14, 5);
                if v15.Tool == nil then
                    v15.Tool = l_LocalPlayer_0.Character:WaitForChild(v14, 5);
                end;
            end;
            if not v15.Tool then
                v15.Tool = v15:_findTool(l_LocalPlayer_0.Character) or v15:_findTool(l_LocalPlayer_0.Backpack);
            end;
            if not v15.Tool then
                return;
            else
                if v15.Tool:IsA("Tool") then
                    v15.Tool.Equipped:Connect(function() --[[ Line: 66 ]]
                        -- upvalues: v15 (ref)
                        v15.on = true;
                    end);
                    v15.Tool.Unequipped:Connect(function() --[[ Line: 70 ]]
                        -- upvalues: v15 (ref)
                        v15.on = false;
                    end);
                end;
                return;
            end;
        end);
    end;
    return v15;
end;
v9._findTool = function(v16, v17, v18) --[[ Line: 82 ]] --[[ Name: _findTool ]]
    for _, v20 in v17:GetChildren() do
        if v20.Name:find(v18 or v16.ToolName) then
            return v20;
        end;
    end;
    return nil;
end;
v9.GetMouseCFrame = function(_) --[[ Line: 92 ]] --[[ Name: GetMouseCFrame ]]
    if _G.mobile == true then
        _G.Mouse:UpdateGlobals();
    end;
    return _G.MouseCF;
end;
v9.GetMousePosition = function(_) --[[ Line: 99 ]] --[[ Name: GetMousePosition ]]
    if _G.mobile == true then
        _G.Mouse:UpdateGlobals();
    end;
    return _G.MouseCF.Position;
end;
local function v27(v23) --[[ Line: 106 ]] --[[ Name: flashButtonRed ]]
    local v24 = {
        ImageColor3 = Color3.fromRGB(255, 85, 0)
    };
    local v25 = TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, -1, true, 0);
    local v26 = game:GetService("TweenService"):Create(v23.ActionIcon, v25, v24);
    v26:Play();
    return v26;
end;
local v28 = false;
l_UserInputService_0.TouchStarted:Connect(function(v29) --[[ Line: 119 ]]
    -- upvalues: v28 (ref)
    if v29 then
        return;
    else
        v28 = true;
        return;
    end;
end);
l_UserInputService_0.TouchEnded:Connect(function(v30) --[[ Line: 126 ]]
    -- upvalues: v28 (ref)
    if v30 then
        return;
    else
        v28 = false;
        return;
    end;
end);
local function v39(v31, v32, v33) --[[ Line: 133 ]] --[[ Name: faceMouse ]]
    -- upvalues: l_LocalPlayer_0 (copy), l_PlayerModule_0 (copy)
    if _G.FaceMouse then
        local _ = l_LocalPlayer_0.Character;
        if _G.mobile == true and l_PlayerModule_0 and l_PlayerModule_0.cameras.CameraModule.activeMouseLockController ~= nil and l_PlayerModule_0.cameras.CameraModule.activeMouseLockController:GetIsMouseLocked() == true then
            local l_Icon_0 = l_LocalPlayer_0.PlayerGui:FindFirstChild("MobileMouseIcon").Icon;
            v32 = l_Icon_0.AbsolutePosition + l_Icon_0.AbsoluteSize / 2;
            v33 = true;
        end;
        if v32 then
            _G.Mouse:SetPosition(v32, v33);
        end;
        local l_v31_MousePosition_0 = v31:GetMousePosition();
        local l_Character_1 = l_LocalPlayer_0.Character;
        local l_PrimaryPart_0 = l_Character_1.PrimaryPart;
        if _G.mouseLevel then
            l_v31_MousePosition_0 = Vector3.new(l_v31_MousePosition_0.X, l_Character_1.HumanoidRootPart.Position.Y, l_v31_MousePosition_0.Z);
        end;
        l_Character_1:SetPrimaryPartCFrame(CFrame.new(l_PrimaryPart_0.Position, l_v31_MousePosition_0));
    end;
end;
local function v50(v40) --[[ Line: 177 ]] --[[ Name: statChanged ]]
    -- upvalues: l_LocalPlayer_0 (copy)
    local l_FirstChild_0 = game.ReplicatedStorage:FindFirstChild("Stats" .. l_LocalPlayer_0.Name);
    if v40.Tool == nil then
        return;
    else
        local v42 = nil;
        if v40.Tool then
            v42 = if typeof(v40.Tool) == "string" then v40.Tool else v40.Tool.Name;
        end;
        local l_FirstChild_1 = script.Parent:FindFirstChild(v42, true);
        local v44 = {
            DF = true, 
            FightingStyle = true
        };
        if l_FirstChild_1 then
            local l_Attribute_0 = l_FirstChild_1.Parent:GetAttribute("Catagory");
            if l_Attribute_0 and v44[l_Attribute_0] then
                local l_FirstChild_2 = l_FirstChild_0.Stats:FindFirstChild(l_Attribute_0);
                local l_Value_0 = l_FirstChild_2.Value;
                local v48 = false;
                local v49 = nil;
                v49 = l_FirstChild_2.Changed:Connect(function() --[[ Line: 207 ]]
                    -- upvalues: l_FirstChild_2 (copy), l_Value_0 (copy), v49 (ref), v48 (ref)
                    if l_FirstChild_2.Value ~= l_Value_0 then
                        v49:Disconnect();
                        v49 = nil;
                        v48 = true;
                    end;
                end);
                return v49, function() --[[ Line: 215 ]]
                    -- upvalues: v48 (ref)
                    return v48;
                end;
            end;
        end;
        return;
    end;
end;
v9.DoubleCastSkill = function(v51, v52, v53) --[[ Line: 222 ]] --[[ Name: DoubleCastSkill ]]
    -- upvalues: l_LocalPlayer_0 (copy), v7 (copy), v27 (copy), l_UserInputService_0 (copy), v50 (copy)
    local l_Character_2 = l_LocalPlayer_0.Character;
    local l_Key_0 = v53.Key;
    local l_ToolName_0 = v53.ToolName;
    local l_CompleteFunction_0 = v53.CompleteFunction;
    local v58 = v53.CheckFunction or v53.CancelFunction;
    local v59 = v53.PassFunction or function() --[[ Line: 228 ]]
        -- upvalues: l_Character_2 (copy), l_ToolName_0 (copy)
        return l_Character_2:FindFirstChild(l_ToolName_0) and _G.check:inspect(l_Character_2) == true;
    end;
    local v60 = v53.Button or v52;
    local l_Input_0 = v51.Input;
    local v62 = v7.new();
    local v63 = nil;
    local v64 = nil;
    local v65 = nil;
    if v60 then
        v63 = Color3.fromRGB(255, 255, 255);
        if v53.SkipTap ~= nil then
            v64 = v27(v60);
        else
            v60.ActionIcon.ImageColor3 = Color3.fromRGB(170, 255, 255);
        end;
        if v60.ActionIcon.Image ~= "rbxassetid://17672867931" then
            v65 = v60.ActionIcon.Image;
            v60.ActionIcon.Image = "rbxassetid://17672867931";
        end;
    end;
    task.spawn(function() --[[ Line: 253 ]]
        -- upvalues: v60 (copy), v62 (ref), v59 (copy), v53 (copy), l_UserInputService_0 (ref), l_Input_0 (copy), l_Key_0 (copy), l_CompleteFunction_0 (copy), v50 (ref), v51 (copy), v58 (copy), l_Character_2 (copy), v64 (ref), v63 (ref), v65 (ref)
        if _G.mobile and v60 then
            v62:AddTask(v60.MouseButton1Click:Connect(function() --[[ Line: 265 ]]
                -- upvalues: v59 (ref), v53 (ref), v60 (ref), v62 (ref), l_UserInputService_0 (ref), l_Input_0 (ref), l_Key_0 (ref)
                local v66 = v59();
                if v66 == false or v66 == nil then
                    return;
                elseif v53.SkipTap == nil then
                    v60.ActionIcon.ImageColor3 = Color3.fromRGB(255, 255, 255);
                    v60.ActionIcon.Image = "rbxassetid://17714973640";
                    v62:AddTask(l_UserInputService_0.TouchTapInWorld:Connect(function(v67, v68) --[[ Line: 276 ]]
                        -- upvalues: l_Input_0 (ref), l_Key_0 (ref)
                        if v68 then
                            return;
                        else
                            _G.Mouse:SetPosition(v67);
                            l_Input_0:Fire(l_Key_0);
                            return;
                        end;
                    end));
                    return;
                else
                    l_Input_0:Fire(l_Key_0);
                    return;
                end;
            end));
        else
            v62:AddTask(l_UserInputService_0.InputBegan:Connect(function(v69, v70) --[[ Line: 293 ]]
                -- upvalues: l_Key_0 (ref), l_Input_0 (ref)
                if v70 then
                    return;
                else
                    if v69.KeyCode == l_Key_0 then
                        warn("user inpiut tapped");
                        task.defer(function() --[[ Line: 300 ]]
                            -- upvalues: l_Input_0 (ref), l_Key_0 (ref)
                            l_Input_0:Fire(l_Key_0);
                        end);
                    end;
                    return;
                end;
            end));
        end;
        local v71 = false;
        local v72 = nil;
        local v73 = false;
        local function _() --[[ Line: 313 ]] --[[ Name: trueCompleteFunction ]]
            -- upvalues: v73 (ref), l_CompleteFunction_0 (ref)
            if v73 == true then
                return;
            else
                v73 = true;
                if l_CompleteFunction_0 then
                    l_CompleteFunction_0();
                end;
                return;
            end;
        end;
        v72 = l_Input_0:Connect(function(v75) --[[ Line: 323 ]]
            -- upvalues: l_Key_0 (ref), v59 (ref), v71 (ref), v73 (ref), l_CompleteFunction_0 (ref)
            if v75 ~= l_Key_0 then
                return;
            else
                local v76 = v59();
                if v76 ~= nil and v76 ~= false then
                    v71 = true;
                    if v73 == true then
                        return;
                    else
                        v73 = true;
                        if l_CompleteFunction_0 then
                            l_CompleteFunction_0();
                        end;
                    end;
                end;
                return;
            end;
        end);
        local v77 = tick();
        local v78, v79 = v50(v51);
        if v78 ~= nil then
            v62:AddTask(v78);
        end;
        while true do
            local v80 = tick() - v77;
            if v71 ~= true and (not v58 or v58(v80) ~= true) and (v79 == nil or v79() ~= true) then
                v77 = tick();
                task.wait();
                if l_Character_2:IsDescendantOf(workspace) == false then
                    break;
                end;
            else
                break;
            end;
        end;
        if v72 then
            v72:Disconnect();
        end;
        v62:Destroy();
        v62 = nil;
        if v60 then
            if v64 then
                v64:Cancel();
                v64:Destroy();
            end;
            v60.ActionIcon.ImageColor3 = v63;
            if v65 then
                v60.ActionIcon.Image = "rbxassetid://16527536731";
            end;
        end;
        if v73 ~= true then
            v73 = true;
            if l_CompleteFunction_0 then
                l_CompleteFunction_0();
            end;
        end;
    end);
end;
v9.ToggleSkill = function(v81, v82, v83) --[[ Line: 387 ]] --[[ Name: ToggleSkill ]]
    -- upvalues: v7 (copy), v50 (copy), l_RunService_0 (copy), l_UserInputService_0 (copy)
    local l_Key_1 = v83.Key;
    local v85 = v83.CheckFunction or function() --[[ Line: 389 ]]

    end;
    local l_EndFunction_0 = v83.EndFunction;
    local v87 = v83.Button or v82;
    if not v83.PassFunction then
        local function _() --[[ Line: 392 ]]
            return true;
        end;
    end;
    local l_Input_1 = v81.Input;
    local v90 = v7.new();
    local v91 = nil;
    local v92 = nil;
    local v93 = nil;
    if v87 then
        v91 = v87.ActionIcon.ImageColor3;
        v93 = v87.ActionIcon.Image;
        v87.ActionIcon.Image = "rbxassetid://17672867931";
        local v94 = {
            ImageColor3 = Color3.fromRGB(255, 85, 0)
        };
        local v95 = TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, -1, true, 0);
        v92 = game:GetService("TweenService"):Create(v87.ActionIcon, v95, v94);
        v92:Play();
    end;
    local v96, v97 = v50(v81);
    if v96 ~= nil then
        v90:AddTask(v96);
    end;
    task.spawn(function() --[[ Line: 418 ]]
        -- upvalues: v90 (copy), l_RunService_0 (ref), l_EndFunction_0 (copy), v97 (copy), v85 (copy), l_UserInputService_0 (ref), l_Key_1 (copy), l_Input_1 (copy), v87 (copy)
        v90:AddTask(l_RunService_0.RenderStepped:Connect(function(v98) --[[ Line: 421 ]]
            -- upvalues: l_EndFunction_0 (ref), v97 (ref), v85 (ref), l_UserInputService_0 (ref), l_Key_1 (ref), l_Input_1 (ref)
            local v99 = l_EndFunction_0(v98);
            local v100 = false;
            if v97 then
                v100 = v97();
            end;
            if v99 == true or v85() or not _G.mobile and not l_UserInputService_0:IsKeyDown(l_Key_1) or v100 == true then
                l_Input_1:Fire(l_Key_1);
            end;
        end));
        if _G.mobile and v87 then
            task.delay(0.05, function() --[[ Line: 436 ]]
                -- upvalues: v90 (ref), v87 (ref), l_Input_1 (ref), l_Key_1 (ref)
                v90:AddTask(v87.MouseButton1Click:Connect(function() --[[ Line: 438 ]]
                    -- upvalues: l_Input_1 (ref), l_Key_1 (ref)
                    l_Input_1:Fire(l_Key_1);
                end));
            end);
        end;
    end);
    while l_Input_1:Wait() ~= l_Key_1 do

    end;
    if v87 then
        v92:Cancel();
        v92:Destroy();
        v87.ActionIcon.Image = v93;
        v87.ActionIcon.ImageColor3 = v91;
    end;
    v90:Destroy();
end;
v9.ChargeSkill = function(v101, v102, v103) --[[ Line: 459 ]] --[[ Name: ChargeSkill ]]
    -- upvalues: l_RunService_0 (copy), v7 (copy), v50 (copy), l_LocalPlayer_0 (copy), v12 (copy), v13 (ref), v39 (copy)
    local l_Key_2 = v103.Key;
    v103.CheckFunction = v103.CheckFunction or function() --[[ Line: 461 ]]

    end;
    v103.EndFunction = v103.EndFunction or function() --[[ Line: 462 ]]

    end;
    v103.canUse = v103.canUse == nil or v103.canUse;
    v103.RunServiceType = v103.RunServiceType or l_RunService_0.Heartbeat;
    if v103.HoldDuration == nil then
        v103.HoldDuration = 0;
    end;
    local v105 = v103.PCInputType == nil and "Default" or v103.PCInputType;
    local v106 = v103.MobileInputType == nil and "Default" or v103.MobileInputType;
    local v107 = v7.new();
    local v108 = nil;
    if v102 then
        v108 = v102.ActionIcon.Image;
        v102.ActionIcon.Image = "rbxassetid://17714973640";
    end;
    local v109 = tick();
    local v110, v111 = v50(v101);
    if v110 ~= nil then
        v107:AddTask(v110);
    end;
    local v112 = false;
    if _G.canuse == false then
        v112 = true;
    end;
    local function v118(...) --[[ Line: 495 ]] --[[ Name: skillChecks ]]
        -- upvalues: l_LocalPlayer_0 (ref), v103 (copy), v101 (copy), l_Key_2 (copy), v12 (ref), v111 (copy), v13 (ref), v112 (ref)
        local l_Character_3 = l_LocalPlayer_0.Character;
        local v114 = ...;
        local v115 = false;
        local _, l_result_0 = pcall(function() --[[ Line: 499 ]]
            -- upvalues: v115 (ref), v103 (ref), v114 (copy)
            v115 = v103.CheckFunction(v114);
        end);
        if l_result_0 then
            warn("ERROR:", l_result_0);
        end;
        if v103.EndFunction(...) == true or v115 == false then
            v101.Input:Fire(l_Key_2);
            return;
        elseif v103.IgnoreInstantCastSetting == nil and v12.Settings.InstantCastSkills.Value == true then
            v101.Input:Fire(l_Key_2);
            return;
        elseif l_Character_3 and l_Character_3:FindFirstChild("campfireResting") then
            warn("cant fire resting");
            v101.Input:Fire(l_Key_2);
            return;
        elseif l_Character_3 ~= game.Players.LocalPlayer.Character then
            warn("in efect folder beka");
            v101.Input:Fire(l_Key_2);
            return;
        elseif l_Character_3.Parent == workspace.Effects or v111 and v111() == true then
            v101.Input:Fire(l_Key_2);
            return;
        elseif v13 == false then
            v101.Input:Fire(l_Key_2);
            return;
        else
            if v103.canUse == true and v112 == true then
                _G.canuse = false;
            end;
            return;
        end;
    end;
    local function v119() --[[ Line: 544 ]] --[[ Name: waitHold ]]
        -- upvalues: v103 (copy), v109 (copy)
        if v103.HoldDuration ~= 0 then
            repeat
                task.wait();
            until tick() - v109 >= v103.HoldDuration;
        end;
    end;
    local v120 = false;
    task.spawn(function() --[[ Line: 554 ]]
        -- upvalues: v101 (copy), l_Key_2 (copy), v120 (ref)
        local v121 = tick();
        while true do
            game["Run Service"].Heartbeat:Wait();
            if tick() - v121 >= 3 then
                game.Players.LocalPlayer:Kick("game froze too long, rejoin. froze for " .. tostring(math.floor((tick() - v121) * 1000) / 1000));
                v101.Input:Fire(l_Key_2);
                return;
            else
                v121 = tick();
                if v120 == true then
                    return;
                end;
            end;
        end;
    end);
    task.spawn(function() --[[ Line: 569 ]]
        -- upvalues: v107 (copy), v103 (copy), v118 (copy), v119 (copy), v101 (copy), v106 (copy), v105 (copy), v102 (copy)
        v107.RunServiceCheck = v103.RunServiceType:Connect(v118);
        v119();
        v101["_" .. (_G.mobile and "Mobile" .. v106 or "PC" .. v105)](v101, v103, v107, v102);
    end);
    if _G.mobile == true then
        v39(v101);
    end;
    while v101.Input:Wait() ~= l_Key_2 do

    end;
    v120 = true;
    v119();
    v107.RunServiceCheck:Disconnect();
    v118(0);
    v39(v101);
    if v102 then
        v102.ActionIcon.Image = v108;
        v102.ActionIcon.ImageColor3 = Color3.fromRGB(255, 255, 255);
    end;
    v107:Destroy();
end;
v9._PCDefault = function(v122, v123, v124) --[[ Line: 595 ]] --[[ Name: _PCDefault ]]
    -- upvalues: v12 (copy), l_RunService_0 (copy), l_UserInputService_0 (copy)
    if v123.IgnoreInstantCastSetting == nil and v12.Settings.InstantCastSkills.Value == true then
        v122.Input:Fire(v123.Key);
        return;
    else
        v124:AddTask(l_RunService_0.RenderStepped:Connect(function() --[[ Line: 602 ]]
            -- upvalues: l_UserInputService_0 (ref), v123 (copy), v122 (copy)
            if not l_UserInputService_0:IsKeyDown(v123.Key) then
                v122.Input:Fire(v123.Key);
            end;
        end));
        return;
    end;
end;
v9._MobileDefault = function(v125, v126, v127, v128) --[[ Line: 610 ]] --[[ Name: _MobileDefault ]]
    -- upvalues: v12 (copy), l_UserInputService_0 (copy), v39 (copy), l_LocalPlayer_0 (copy)
    local l_Key_3 = v126.Key;
    local _ = v126.CheckFunction;
    local _ = v126.EndFunction;
    local v132 = false;
    if v126.IgnoreInstantCastSetting == nil and v12.Settings.InstantCastSkills.Value == true then
        v125.Input:Fire(l_Key_3);
        return;
    else
        v127:AddTask(l_UserInputService_0.TouchStarted:Connect(function(_, v134) --[[ Line: 623 ]]
            -- upvalues: v132 (ref)
            if v134 then
                return;
            else
                v132 = true;
                return;
            end;
        end));
        v127:AddTask(l_UserInputService_0.TouchEnded:Connect(function(v135, v136) --[[ Line: 632 ]]
            -- upvalues: v132 (ref), v39 (ref), v125 (copy), l_Key_3 (copy)
            if v136 then
                return;
            elseif not v132 then
                return;
            else
                local l_Position_0 = v135.Position;
                v39(v125, l_Position_0);
                v125.Input:Fire(l_Key_3);
                return;
            end;
        end));
        if v128 then
            task.delay(0.05, function() --[[ Line: 652 ]]
                -- upvalues: v127 (copy), v128 (copy), l_LocalPlayer_0 (ref), v39 (ref), v125 (copy), l_Key_3 (copy)
                v127:AddTask(v128.MouseButton1Click:Connect(function() --[[ Line: 654 ]]
                    -- upvalues: l_LocalPlayer_0 (ref), v39 (ref), v125 (ref), l_Key_3 (ref)
                    local l_Character_4 = l_LocalPlayer_0.Character;
                    v39(v125, (l_Character_4.PrimaryPart.CFrame * CFrame.new(0, 0, 100)).Position, true);
                    v125.Input:Fire(l_Key_3);
                end));
            end);
        end;
        return;
    end;
end;
v9._PCToggle = function(v139, v140, v141) --[[ Line: 671 ]] --[[ Name: _PCToggle ]]
    -- upvalues: l_UserInputService_0 (copy)
    local l_Key_4 = v140.Key;
    v141:AddTask(l_UserInputService_0.InputBegan:Connect(function(v143, v144) --[[ Line: 675 ]]
        -- upvalues: l_Key_4 (copy), v139 (copy)
        if v144 then
            return;
        else
            if v143.KeyCode == l_Key_4 then
                v139.Input:Fire(l_Key_4);
            end;
            return;
        end;
    end));
end;
v9._MobileToggle = function(v145, v146, v147) --[[ Line: 687 ]] --[[ Name: _MobileToggle ]]
    -- upvalues: l_TweenService_0 (copy)
    local l_Button_0 = v146.Button;
    local l_ImageColor3_0 = l_Button_0.ActionIcon.ImageColor3;
    local v150 = {
        ImageColor3 = Color3.fromRGB(255, 85, 0)
    };
    local v151 = TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, -1, true, 0);
    local v152 = l_TweenService_0:Create(l_Button_0.ActionIcon, v151, v150);
    v152:Play();
    v147:AddTask(v152);
    task.delay(0.05, function() --[[ Line: 697 ]]
        -- upvalues: v147 (copy), l_Button_0 (copy), v145 (copy), v146 (copy), v152 (copy), l_ImageColor3_0 (copy)
        v147:AddTask(l_Button_0.MouseButton1Click:Connect(function() --[[ Line: 699 ]]
            -- upvalues: v145 (ref), v146 (ref), v152 (ref), l_Button_0 (ref), l_ImageColor3_0 (ref)
            v145.Input:Fire(v146.Key);
            v152:Cancel();
            l_Button_0.ActionIcon.ImageColor3 = l_ImageColor3_0;
        end));
    end);
end;
v9._MobileTapScreen = function(v153, v154, v155) --[[ Line: 708 ]] --[[ Name: _MobileTapScreen ]]
    -- upvalues: l_UserInputService_0 (copy), v39 (copy)
    v155:AddTask(l_UserInputService_0.TouchTapInWorld:Connect(function(v156, v157) --[[ Line: 710 ]]
        -- upvalues: v39 (ref), v153 (copy), v154 (copy)
        if v157 then
            return;
        else
            _G.Mouse:SetPosition(v156);
            v39(v153);
            v153.Input:Fire(v154.Key);
            return;
        end;
    end));
end;
return v9;