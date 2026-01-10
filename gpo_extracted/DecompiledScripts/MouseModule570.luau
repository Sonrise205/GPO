local v0 = {};
v0.__index = v0;
local _ = UserSettings():GetService("UserGameSettings");
local _ = game:GetService("UserInputService");
local _ = game:GetService("GuiService");
local l_LocalPlayer_0 = game:GetService("Players").LocalPlayer;
local _ = l_LocalPlayer_0:WaitForChild("PlayerGui");
local _ = l_LocalPlayer_0:GetMouse();
local l_LocalPlayer_1 = game:GetService("Players").LocalPlayer;
local v8 = require(l_LocalPlayer_1.PlayerScripts.PlayerModule);
local v9 = false;
if game.GameId == 2097989947 then
    if _G.mobile == true then
        v9 = true;
    end;
else
    v9 = false;
end;
local function v19(v10, v11) --[[ Line: 45 ]] --[[ Name: nearThumbstick ]]
    -- upvalues: v8 (copy), l_LocalPlayer_1 (copy)
    if v11 == nil and v8:GetControls():GetMoveVector() == Vector3.new(0, 0, 0, 0) then
        return;
    else
        if l_LocalPlayer_1.PlayerGui:FindFirstChild("TouchGui") then
            local l_FirstChild_0 = l_LocalPlayer_1.PlayerGui.TouchGui:FindFirstChild("ThumbstickFrame", true);
            local l_FirstChild_1 = l_LocalPlayer_1.PlayerGui.TouchGui:FindFirstChild("JumpButton", true);
            local _ = l_LocalPlayer_1.PlayerGui.TouchGui:FindFirstChild("StickImage", true);
            if l_FirstChild_0 then
                local v15 = Vector2.new(l_FirstChild_0.AbsolutePosition.X, l_FirstChild_0.AbsolutePosition.Y);
                local l_AbsoluteSize_0 = l_FirstChild_0.AbsoluteSize;
                if (Vector2.new(v10.X, v10.Y) - v15).Magnitude < l_AbsoluteSize_0.Magnitude * 2 then
                    return true;
                end;
            end;
            if l_FirstChild_1 then
                local v17 = Vector2.new(l_FirstChild_1.AbsolutePosition.X, l_FirstChild_1.AbsolutePosition.Y);
                local l_AbsoluteSize_1 = l_FirstChild_1.AbsoluteSize;
                if (Vector2.new(v10.X, v10.Y) - v17).Magnitude < l_AbsoluteSize_1.Magnitude * 2 then
                    return true;
                end;
            end;
        end;
        return false;
    end;
end;
_G.nearThumbstick = v19;
v0.new = function() --[[ Line: 81 ]] --[[ Name: new ]]
    -- upvalues: v8 (copy), l_LocalPlayer_1 (copy), v9 (ref), v19 (copy), v0 (copy)
    assert(game.Players.LocalPlayer, "Could not get player");
    local l_CurrentCamera_0 = game.Workspace.CurrentCamera;
    local l_new_0 = Ray.new;
    local l_UserInputService_1 = game:GetService("UserInputService");
    local l_MouseButton1_0 = Enum.UserInputType.MouseButton1;
    local l_MouseButton2_0 = Enum.UserInputType.MouseButton2;
    local l_MouseButton3_0 = Enum.UserInputType.MouseButton3;
    local l_Touch_0 = Enum.UserInputType.Touch;
    local l_MouseMovement_0 = Enum.UserInputType.MouseMovement;
    local l_MouseWheel_0 = Enum.UserInputType.MouseWheel;
    local v29 = {};
    local v30 = Vector2.new();
    local v31 = Vector2.new();
    local v32 = {
        [l_MouseButton1_0] = false, 
        [l_MouseButton2_0] = false, 
        [l_MouseButton3_0] = false, 
        [l_Touch_0] = false
    };
    local function _(v33) --[[ Line: 102 ]] --[[ Name: CreateEvent ]]
        -- upvalues: v29 (copy)
        local l_BindableEvent_0 = Instance.new("BindableEvent");
        v29[v33] = l_BindableEvent_0.Event;
        return function(...) --[[ Line: 105 ]]
            -- upvalues: l_BindableEvent_0 (copy)
            l_BindableEvent_0:Fire(...);
        end;
    end;
    local l_BindableEvent_1 = Instance.new("BindableEvent");
    v29.ButtonDown = l_BindableEvent_1.Event;
    local l_l_BindableEvent_1_0 = l_BindableEvent_1 --[[ copy: 16 -> 26 ]];
    local function v38(...) --[[ Line: 105 ]]
        -- upvalues: l_l_BindableEvent_1_0 (copy)
        l_l_BindableEvent_1_0:Fire(...);
    end;
    local l_BindableEvent_2 = Instance.new("BindableEvent");
    v29.ButtonUp = l_BindableEvent_2.Event;
    local l_l_BindableEvent_2_0 = l_BindableEvent_2 --[[ copy: 17 -> 27 ]];
    l_BindableEvent_1 = function(...) --[[ Line: 105 ]]
        -- upvalues: l_l_BindableEvent_2_0 (copy)
        l_l_BindableEvent_2_0:Fire(...);
    end;
    local l_BindableEvent_3 = Instance.new("BindableEvent");
    v29.Moved = l_BindableEvent_3.Event;
    local l_l_BindableEvent_3_0 = l_BindableEvent_3 --[[ copy: 18 -> 28 ]];
    l_BindableEvent_2 = function(...) --[[ Line: 105 ]]
        -- upvalues: l_l_BindableEvent_3_0 (copy)
        l_l_BindableEvent_3_0:Fire(...);
    end;
    local l_BindableEvent_4 = Instance.new("BindableEvent");
    v29.Scrolled = l_BindableEvent_4.Event;
    local l_l_BindableEvent_4_0 = l_BindableEvent_4 --[[ copy: 19 -> 29 ]];
    l_BindableEvent_3 = function(...) --[[ Line: 105 ]]
        -- upvalues: l_l_BindableEvent_4_0 (copy)
        l_l_BindableEvent_4_0:Fire(...);
    end;
    v29.IsDown = function(_, v46) --[[ Line: 116 ]] --[[ Name: IsDown ]]
        -- upvalues: v32 (copy)
        return v32[v46] == true;
    end;
    l_BindableEvent_4 = function(v47) --[[ Line: 120 ]] --[[ Name: WorldToScreenPoint ]]
        local v48 = game.Workspace.CurrentCamera:WorldToViewportPoint(v47);
        return (Vector2.new(v48.X, v48.Y));
    end;
    local v49 = false;
    local function _() --[[ Line: 135 ]] --[[ Name: isMouseLocked ]]
        -- upvalues: v8 (ref)
        local v50 = false;
        pcall(function() --[[ Line: 137 ]]
            -- upvalues: v50 (ref), v8 (ref)
            v50 = v8.cameras.CameraModule.activeMouseLockController:GetIsMouseLocked();
        end);
        return v50;
    end;
    v29.SetPosition = function(_, v53, v54) --[[ Line: 144 ]] --[[ Name: SetPosition ]]
        -- upvalues: v49 (ref), v8 (ref), l_LocalPlayer_1 (ref), v30 (ref), v9 (ref), v29 (copy)
        if v49 == true and v54 == nil then
            return;
        else
            if _G.mobile == true then
                local v55 = false;
                local v56;
                do
                    local l_v55_0 = v55;
                    pcall(function() --[[ Line: 137 ]]
                        -- upvalues: l_v55_0 (ref), v8 (ref)
                        l_v55_0 = v8.cameras.CameraModule.activeMouseLockController:GetIsMouseLocked();
                    end);
                    v56 = l_v55_0;
                end;
                if v56 == true then
                    v56 = l_LocalPlayer_1.PlayerGui:FindFirstChild("MobileMouseIcon").Icon;
                    v53 = v56.AbsolutePosition + v56.AbsoluteSize / 2;
                end;
            end;
            if typeof(v53) == "Vector3" and v53.Z ~= 0 then
                local v58 = game.Workspace.CurrentCamera:WorldToViewportPoint(v53);
                v30 = Vector2.new(v58.X, v58.Y);
            else
                if typeof(v53) == "Vector3" then
                    v53 = Vector2.new(v53.X, v53.Y);
                end;
                v30 = v53;
            end;
            if v9 == true then
                local v59 = script.ScreenGui:Clone();
                v59.Frame.Position = UDim2.fromOffset(v30.X + v59.Frame.AbsoluteSize.X / 2, v30.Y + v59.Frame.AbsoluteSize.Y / 2);
                v59.Parent = game.Players.LocalPlayer.PlayerGui;
                _G.destroy(v59, 0.25);
            end;
            v29:ProjectMouseRay({
                game.Players.LocalPlayer.Character, 
                workspace.Effects, 
                workspace.Projectiles
            });
            if v54 ~= nil then
                v49 = true;
                local v60 = tick();
                task.spawn(function() --[[ Line: 174 ]]
                    -- upvalues: v60 (copy), v49 (ref)
                    if _G.canuse == false then
                        repeat
                            task.wait();
                        until tick() - v60 >= 1 or _G.canuse == true;
                    end;
                    v49 = false;
                end);
            end;
            return;
        end;
    end;
    v29.GetPosition = function(_) --[[ Line: 185 ]] --[[ Name: GetPosition ]]
        -- upvalues: v30 (ref)
        return v30;
    end;
    v29.ProjectMouseRay = function(v62, v63, v64, v65) --[[ Line: 191 ]] --[[ Name: ProjectMouseRay ]]
        -- upvalues: l_CurrentCamera_0 (copy), l_new_0 (copy)
        local l_v62_Position_0 = v62:GetPosition();
        local v67 = l_CurrentCamera_0:ScreenPointToRay(l_v62_Position_0.X, l_v62_Position_0.Y, 0);
        v67 = l_new_0(v67.Origin, v67.Unit.Direction * 1028);
        local v68 = nil;
        local v69 = nil;
        local v70 = nil;
        if v65 == nil then
            local v71 = RaycastParams.new();
            v71.FilterType = Enum.RaycastFilterType.Exclude;
            v71.FilterDescendantsInstances = v63 or {
                workspace.Effects, 
                workspace.CurrentCamera
            };
            v71.RespectCanCollide = true;
            local v72 = workspace:Raycast(v67.Origin, v67.Unit.Direction * 1028, v71);
            if v72 then
                v68 = v72.Instance;
                v69 = v72.Position;
                v70 = v72.Normal;
            else
                v68 = nil;
                v69 = v67.Origin + v67.Unit.Direction * 1028;
                v70 = Vector3.new(0, 1, 0, 0);
            end;
        else
            local l_workspace_PartOnRayWithWhitelist_0, v74, v75 = workspace:FindPartOnRayWithWhitelist(v67, v65);
            v68 = l_workspace_PartOnRayWithWhitelist_0;
            v69 = v74;
            v70 = v75;
        end;
        local v76 = CFrame.new(v69, v69 + v67.Unit.Direction);
        if v64 == nil then
            local l__G_0 = _G;
            local l__G_1 = _G;
            l__G_0.MouseCF = v76;
            l__G_1.MouseTarget = v68;
        end;
        return v76, v68, v70;
    end;
    v29.UpdateGlobals = function(_) --[[ Line: 217 ]] --[[ Name: UpdateGlobals ]]
        -- upvalues: v29 (copy)
        v29:ProjectMouseRay({
            game.Players.LocalPlayer.Character, 
            workspace.Effects, 
            workspace.Projectiles
        });
    end;
    local function v83(v80, v81) --[[ Line: 223 ]] --[[ Name: InputBegan ]]
        -- upvalues: l_MouseButton1_0 (copy), l_MouseButton2_0 (copy), l_MouseButton3_0 (copy), l_Touch_0 (copy), v32 (copy), v38 (copy)
        if v81 or _G.mobile == true then
            return;
        else
            local l_UserInputType_0 = v80.UserInputType;
            if l_UserInputType_0 == l_MouseButton1_0 or l_UserInputType_0 == l_MouseButton2_0 or l_UserInputType_0 == l_MouseButton3_0 or l_UserInputType_0 == l_Touch_0 then
                v32[l_UserInputType_0] = true;
                v38(l_UserInputType_0);
            end;
            return;
        end;
    end;
    local function v90(v84, v85) --[[ Line: 232 ]] --[[ Name: InputChanged ]]
        -- upvalues: l_MouseMovement_0 (copy), l_Touch_0 (copy), v30 (ref), v31 (ref), l_BindableEvent_2 (copy), l_MouseWheel_0 (copy), l_BindableEvent_3 (copy)
        if v85 or _G.mobile == true then
            return;
        else
            local l_UserInputType_1 = v84.UserInputType;
            if l_UserInputType_1 == l_MouseMovement_0 or l_UserInputType_1 == l_Touch_0 then
                local v87 = Vector2.new(v84.Position.X, v84.Position.Y);
                local v88 = v87 - v30;
                v30 = v87;
                v31 = Vector2.new(v88.X, v88.Y);
                l_BindableEvent_2(v30, v31);
                return;
            else
                if l_UserInputType_1 == l_MouseWheel_0 or l_UserInputType_1 == l_Touch_0 then
                    local l_Z_0 = v84.Position.Z;
                    l_BindableEvent_3(l_Z_0 < 0 and -1 or l_Z_0 > 0 and 1 or 0);
                end;
                return;
            end;
        end;
    end;
    local function v94(v91, v92) --[[ Line: 246 ]] --[[ Name: InputEnded ]]
        -- upvalues: l_MouseButton1_0 (copy), l_MouseButton2_0 (copy), l_MouseButton3_0 (copy), l_Touch_0 (copy), v32 (copy), l_BindableEvent_1 (copy)
        if v92 or _G.mobile == true then
            return;
        else
            local l_UserInputType_2 = v91.UserInputType;
            if l_UserInputType_2 == l_MouseButton1_0 or l_UserInputType_2 == l_MouseButton2_0 or l_UserInputType_2 == l_MouseButton3_0 or l_UserInputType_2 == l_Touch_0 then
                v32[l_UserInputType_2] = false;
                l_BindableEvent_1(l_UserInputType_2);
            end;
            return;
        end;
    end;
    local function v98(v95, v96, v97) --[[ Line: 255 ]] --[[ Name: calc ]]
        -- upvalues: v49 (ref), v19 (ref), v29 (copy)
        if v49 == true or v96 then
            return;
        elseif v97 == "mobile" and _G.mobile == false then
            return;
        elseif typeof(v95) ~= "Instance" and typeof(v95) ~= "boolean" then
            if v19(v95) == true then
                return;
            else
                v29:SetPosition(v95);
                return;
            end;
        else
            if v95.Position ~= nil then
                if v19(v95.Position) == true then
                    return;
                else
                    v29:SetPosition(v95.Position);
                end;
            end;
            return;
        end;
    end;
    v29.Calc = function(_, ...) --[[ Line: 277 ]] --[[ Name: Calc ]]
        -- upvalues: v98 (copy)
        v98(...);
    end;
    l_UserInputService_1.TouchMoved:Connect(function(v100, v101) --[[ Line: 283 ]]
        -- upvalues: v8 (ref), v98 (copy)
        local v102 = false;
        local v103;
        do
            local l_v102_0 = v102;
            pcall(function() --[[ Line: 137 ]]
                -- upvalues: l_v102_0 (ref), v8 (ref)
                l_v102_0 = v8.cameras.CameraModule.activeMouseLockController:GetIsMouseLocked();
            end);
            v103 = l_v102_0;
        end;
        if v103 == true then
            return;
        else
            v98(v100, v101, "mobile");
            return;
        end;
    end);
    l_UserInputService_1.TouchStarted:Connect(function(v105, v106) --[[ Line: 290 ]]
        -- upvalues: v8 (ref), v98 (copy)
        local v107 = false;
        local v108;
        do
            local l_v107_0 = v107;
            pcall(function() --[[ Line: 137 ]]
                -- upvalues: l_v107_0 (ref), v8 (ref)
                l_v107_0 = v8.cameras.CameraModule.activeMouseLockController:GetIsMouseLocked();
            end);
            v108 = l_v107_0;
        end;
        if v108 == true then
            return;
        else
            v98(v105, v106, "mobile");
            return;
        end;
    end);
    l_UserInputService_1.InputBegan:Connect(function(v110, v111) --[[ Line: 297 ]]
        -- upvalues: v98 (copy)
        if v111 then
            return;
        else
            if v110.UserInputType == Enum.UserInputType.Touch then
                v98(v110, v111, "mobile");
            end;
            return;
        end;
    end);
    l_UserInputService_1.InputBegan:Connect(v83);
    l_UserInputService_1.InputChanged:Connect(v90);
    l_UserInputService_1.InputEnded:Connect(v94);
    return (setmetatable(v29, v0));
end;
v0.__tostring = function(v112) --[[ Line: 314 ]] --[[ Name: __tostring ]]
    return "Mouse <" .. tostring((v112:GetPosition())) .. ">";
end;
game:GetService("TextChatService").MessageReceived:Connect(function(v113) --[[ Line: 320 ]]
    -- upvalues: v9 (ref)
    local l_TextSource_0 = v113.TextSource;
    local l_Text_0 = v113.Text;
    if l_TextSource_0 and l_TextSource_0.Name == game.Players.LocalPlayer.Name and l_Text_0 == "/debugInput" then
        v9 = true;
        _G.displayMessage("debugging inputs");
    end;
end);
return v0;