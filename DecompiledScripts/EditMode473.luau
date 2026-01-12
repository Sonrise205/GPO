local l_Players_0 = game:GetService("Players");
local _ = game:GetService("TweenService");
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_UserInputService_0 = game:GetService("UserInputService");
local _ = game:GetService("RunService");
local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
local _ = l_LocalPlayer_0.PlayerGui;
local l_Modules_0 = l_ReplicatedStorage_0.Modules;
local l_Events_0 = l_ReplicatedStorage_0.Events;
local l_SaveButtons_0 = l_Events_0.SaveButtons;
local l_DefaultButtons_0 = l_Events_0.DefaultButtons;
local l_CurrentCamera_0 = workspace.CurrentCamera;
local l_l_LocalPlayer_0_Mouse_0 = l_LocalPlayer_0:GetMouse();
local v13 = require(l_Modules_0.ContextActionService);
local v14 = require(l_Modules_0.Maid);
local v15 = require(l_Modules_0.TableUtils);
local l_Icon_0 = require(l_Modules_0:WaitForChild("TopbarPlus"):WaitForChild("Icon"));
local _ = require(l_Modules_0.Shared.Signals.Signal);
local v18 = {
    Editting = false, 
    EdittingSize = false, 
    Cached = {}, 
    Skills = {}, 
    Cleaner = v14.new(), 
    Increment = 5
};
v18._changeButtons = function(v19, v20, v21, v22) --[[ Line: 35 ]] --[[ Name: _changeButtons ]]
    -- upvalues: l_l_LocalPlayer_0_Mouse_0 (copy), v13 (copy), l_UserInputService_0 (copy), v18 (copy)
    local l_Button_0 = v21.Button;
    local l_Callbacks_0 = v21.Callbacks;
    local l_Increment_0 = v19.Increment;
    v22.Interactable = false;
    if l_Callbacks_0.InputEnded then
        l_Callbacks_0.InputEnded();
    end;
    v19.Cached[v20] = {
        Callbacks = l_Callbacks_0, 
        Animatable = v21.Animatable, 
        Visible = v21.Frame.Visible
    };
    v21.Frame.Visible = true;
    v21.Animatable = false;
    local function _() --[[ Line: 55 ]] --[[ Name: InputEnded ]]
        -- upvalues: v19 (copy), v20 (copy)
        if v19.Cleaner[v20] then
            v19.Cleaner[v20]:Disconnect();
            v19.Cleaner[v20] = nil;
        end;
    end;
    local function v33() --[[ Line: 62 ]] --[[ Name: InputBegan ]]
        -- upvalues: l_l_LocalPlayer_0_Mouse_0 (ref), l_Button_0 (copy), l_Increment_0 (copy), v13 (ref), v20 (copy), v19 (copy), l_UserInputService_0 (ref)
        local v27 = Vector2.new(l_l_LocalPlayer_0_Mouse_0.X, l_l_LocalPlayer_0_Mouse_0.Y);
        local v28 = l_Button_0.AbsolutePosition + l_Button_0.AbsoluteSize / 2 - v27;
        local function v32() --[[ Line: 66 ]] --[[ Name: MouseMoved ]]
            -- upvalues: l_Button_0 (ref), v27 (ref), l_l_LocalPlayer_0_Mouse_0 (ref), v28 (copy), l_Increment_0 (ref), v13 (ref), v20 (ref)
            local l_AbsoluteSize_0 = l_Button_0.AbsoluteSize;
            v27 = Vector2.new(l_l_LocalPlayer_0_Mouse_0.X, l_l_LocalPlayer_0_Mouse_0.Y) + v28;
            local v30 = math.floor((v27.X + l_Increment_0 / 2) / l_Increment_0) * l_Increment_0;
            local v31 = math.floor((v27.Y + l_Increment_0 / 2) / l_Increment_0) * l_Increment_0;
            v13:UpdatePosition({
                ButtonName = v20, 
                Position = UDim2.fromOffset(math.clamp(v30, l_AbsoluteSize_0.X / 2, l_l_LocalPlayer_0_Mouse_0.ViewSizeX - l_AbsoluteSize_0.X / 2), (math.clamp(v31, 0, l_l_LocalPlayer_0_Mouse_0.ViewSizeY)))
            });
        end;
        v19.Cleaner[v20] = l_l_LocalPlayer_0_Mouse_0.Move:Connect(v32);
        repeat
            l_UserInputService_0.InputEnded:Wait();
        until not l_UserInputService_0:IsMouseButtonPressed(Enum.UserInputType.MouseButton1);
        if v19.Cleaner[v20] then
            v19.Cleaner[v20]:Disconnect();
            v19.Cleaner[v20] = nil;
        end;
    end;
    local v34 = script["Size Drag"]:Clone();
    v34.Name = "EditSizeButton";
    v34.Visible = v18.EdittingSize;
    v34.Parent = l_Button_0;
    local v35 = script.EditMoveIcon:Clone();
    v35.Name = "EditMoveIcon";
    v35.Visible = true;
    v35.Parent = l_Button_0;
    local function v44() --[[ Line: 97 ]] --[[ Name: DragSize ]]
        -- upvalues: l_Button_0 (copy), l_l_LocalPlayer_0_Mouse_0 (ref), v19 (copy), l_Increment_0 (copy), v21 (copy), v22 (copy), v20 (copy), v13 (ref), l_UserInputService_0 (ref)
        local l_AbsolutePosition_0 = l_Button_0.AbsolutePosition;
        local function v43() --[[ Line: 100 ]] --[[ Name: MouseMoved ]]
            -- upvalues: l_l_LocalPlayer_0_Mouse_0 (ref), l_AbsolutePosition_0 (copy), v19 (ref), l_Increment_0 (ref), v21 (ref), v22 (ref), v20 (ref), v13 (ref)
            local v37 = Vector2.new(l_l_LocalPlayer_0_Mouse_0.X, l_l_LocalPlayer_0_Mouse_0.Y) - l_AbsolutePosition_0;
            local v38 = math.min(math.max(v19.MinimumButtonRadius, v37.X, v37.Y), v19.MaximumButtonRadius);
            local v39 = math.ceil(v38 / l_Increment_0) * l_Increment_0;
            local v40 = math.ceil(v38 / l_Increment_0) * l_Increment_0;
            v21.SizeRatio = Vector2.new(v39, v40) / v22.AbsoluteSize;
            local v41 = UDim2.fromOffset(v22.AbsoluteSize.X * v21.SizeRatio.X, v22.AbsoluteSize.Y * v21.SizeRatio.Y);
            local v42 = {
                ButtonName = v20, 
                Size = v41, 
                Position = UDim2.fromOffset(l_AbsolutePosition_0.X, l_AbsolutePosition_0.Y) + UDim2.fromOffset(v41.X.Offset * 0.5, v41.Y.Offset * 0.5)
            };
            v13:UpdateSize(v42);
            v13:UpdatePosition(v42);
        end;
        v19.Cleaner[v20] = l_l_LocalPlayer_0_Mouse_0.Move:Connect(v43);
        repeat
            l_UserInputService_0.InputEnded:Wait();
        until not l_UserInputService_0:IsMouseButtonPressed(Enum.UserInputType.MouseButton1);
        if v19.Cleaner[v20] then
            v19.Cleaner[v20]:Disconnect();
            v19.Cleaner[v20] = nil;
        end;
    end;
    v34.MouseButton1Down:Connect(v44);
    v19.Cleaner:AddTask(v34);
    v19.Cleaner:AddTask(v35);
    v13:UpdateCallbacks({
        ButtonName = v20, 
        Callbacks = {
            InputBegan = v33
        }
    });
end;
v18._editButtons = function(v45) --[[ Line: 138 ]] --[[ Name: _editButtons ]]
    -- upvalues: v13 (copy)
    print("edit mode is on");
    local _, _, v48 = v13:GetMobileUI();
    v45.MaximumButtonRadius = v48.AbsoluteSize.X * 1.5;
    v45.MinimumButtonRadius = v48.AbsoluteSize.X * 0.5;
    local function v51(v49, v50) --[[ Line: 146 ]] --[[ Name: changeButtons ]]
        -- upvalues: v45 (copy), v48 (copy)
        v45:_changeButtons(v49, v50, v48);
    end;
    for v52, v53 in v13.Buttons do
        v45:_changeButtons(v52, v53, v48);
    end;
    v45.Cleaner:AddTask(v13.ButtonAdded:Connect(v51));
end;
v18._stopEdittingButtons = function(v54) --[[ Line: 157 ]] --[[ Name: _stopEdittingButtons ]]
    -- upvalues: v13 (copy), l_LocalPlayer_0 (copy), v15 (copy), l_SaveButtons_0 (copy), l_CurrentCamera_0 (copy)
    print("edit mode is off");
    local _, _, v57 = v13:GetMobileUI();
    v57.Interactable = true;
    local l_PlayerScripts_0 = l_LocalPlayer_0:WaitForChild("PlayerScripts");
    local l_InputHandler_0 = require(l_PlayerScripts_0:WaitForChild("InputHandler"));
    for v60, v61 in v54.Cached do
        local l_v13_ButtonData_0 = v13:GetButtonData(v60);
        local _ = l_v13_ButtonData_0.Button;
        l_v13_ButtonData_0.Frame.Visible = v61.Visible;
        l_v13_ButtonData_0.Animatable = v61.Animatable;
        v13:UpdateCallbacks({
            ButtonName = v60, 
            Callbacks = v61.Callbacks
        });
    end;
    local v64 = {};
    for v65, v66 in v13.Buttons do
        v64[v65] = {
            X = v66.Properties.Position.X.Offset, 
            Y = v66.Properties.Position.Y.Offset, 
            SizeRatio = {
                X = v66.SizeRatio.X, 
                Y = v66.SizeRatio.Y
            }
        };
    end;
    for v67, v68 in v54.Skills do
        local v69 = v64[v68];
        v64[("Skill%*"):format(v67)] = v15:DeepCopy(v69);
    end;
    l_InputHandler_0.Inputs.Mobile.SavedButtons = v64;
    l_SaveButtons_0:FireServer({
        Positions = v64, 
        ViewportSize = l_CurrentCamera_0.ViewportSize
    });
    v54.Cached = {};
    v54.Cleaner:Destroy();
end;
v18.Initialize = function(v70) --[[ Line: 205 ]] --[[ Name: Initialize ]]
    -- upvalues: l_Icon_0 (copy), v13 (copy), l_LocalPlayer_0 (copy), l_DefaultButtons_0 (copy), l_CurrentCamera_0 (copy)
    local v71 = l_Icon_0.new();
    v71:setLeft();
    v71:disableStateOverlay(true);
    v71:setImage("rbxassetid://13863907825", "deselected");
    v71:setImage("rbxassetid://13863903503", "selected");
    v71:setCaption("Edit Mobile Buttons");
    v71:setImageScale(0.7);
    local v72 = v71.new();
    v72:setLabel("Edit Button Sizes");
    local v73 = nil;
    local function v74() --[[ Line: 222 ]] --[[ Name: EditButtonsFunction ]]
        -- upvalues: v70 (copy), v73 (ref)
        if not _G.canuse then
            return;
        else
            v70.Editting = not v70.Editting;
            _G.mobileButtonsEditting = v70.Editting;
            if v70.Editting == false and v73 then
                v73:Destroy();
                v73 = nil;
            end;
            if v70.Editting then
                v70:_editButtons();
                return;
            else
                v70:_stopEdittingButtons();
                return;
            end;
        end;
    end;
    local function v77() --[[ Line: 241 ]] --[[ Name: EditSizeFunction ]]
        -- upvalues: v70 (copy), v74 (copy), v13 (ref), v72 (copy)
        if not _G.canuse then
            return;
        else
            if not v70.Editting then
                v74();
            end;
            v70.EdittingSize = not v70.EdittingSize;
            for _, v76 in v13.Buttons do
                v76.Button.EditSizeButton.Visible = v70.EdittingSize;
            end;
            if v70.EdittingSize then
                v72:setLabel("Tap to Stop Editing Sizes");
                return;
            else
                v72:setLabel("Edit Button Sizes");
                return;
            end;
        end;
    end;
    v72.toggled:Connect(v77);
    v71.toggled:Connect(function() --[[ Line: 266 ]]
        -- upvalues: v70 (copy), v77 (copy), v74 (copy)
        if v70.EdittingSize then
            v77();
        end;
        v74();
    end);
    local v78 = v71.new();
    v78:setLabel("Reset Buttons");
    v78.selected:Connect(function() --[[ Line: 276 ]]
        -- upvalues: v73 (ref), l_LocalPlayer_0 (ref), v13 (ref), l_DefaultButtons_0 (ref), l_CurrentCamera_0 (ref), v70 (copy)
        if v73 then
            v73:Destroy();
            v73 = nil;
        end;
        v73 = _G.promptQuestion(game.Players.LocalPlayer, "Are you sure you want to RESET BUTTONS?", {
            [true] = function() --[[ Line: 282 ]]
                -- upvalues: l_LocalPlayer_0 (ref), v13 (ref), l_DefaultButtons_0 (ref), l_CurrentCamera_0 (ref), v70 (ref)
                local l_PlayerScripts_1 = l_LocalPlayer_0:WaitForChild("PlayerScripts");
                local l_InputHandler_1 = require(l_PlayerScripts_1:WaitForChild("InputHandler"));
                local _, _, v83 = v13:GetMobileUI();
                local v84 = l_DefaultButtons_0:InvokeServer({
                    ViewportSize = l_CurrentCamera_0.ViewportSize, 
                    JumpButtonSize = v83.AbsoluteSize, 
                    Increments = v70.Increment
                });
                for v85, v86 in v84 do
                    v13:UpdateSize({
                        ButtonName = v85, 
                        Size = UDim2.fromOffset(v86.SizeRatio.X * v83.AbsoluteSize.X, v86.SizeRatio.Y * v83.AbsoluteSize.Y)
                    });
                    v13:UpdatePosition({
                        ButtonName = v85, 
                        Position = UDim2.fromOffset(v86.X, v86.Y)
                    });
                    v13.Buttons[v85].SizeRatio = v86.SizeRatio;
                end;
                local v87 = math.max(#v70.Skills - 1, 5);
                local l_v13_PositionAndSize_0, _ = v13:GetPositionAndSize();
                local l_v13_Button_0 = v13:GetButton("Block");
                local v91 = 0;
                for v92, v93 in v70.Skills do
                    v91 = v91 + 1;
                    local v94 = 2.356194490192345 + 4.71238898038469 / v87 * v91;
                    local v95 = l_v13_PositionAndSize_0.X.Offset * 1.75;
                    local v96 = l_v13_Button_0.Position + UDim2.new(0, math.sin(v94) * v95, 0, -math.cos(v94) * v95);
                    v13.Buttons[v93].SizeRatio = {
                        X = 0.75, 
                        Y = 0.75
                    };
                    v84[v93] = {
                        X = v96.X.Offset, 
                        Y = v96.Y.Offset, 
                        SizeRatio = {
                            X = 0.75, 
                            Y = 0.75
                        }
                    };
                    v13:UpdatePosition({
                        ButtonName = v93, 
                        Position = v96
                    });
                    v13:UpdateSize({
                        ButtonName = v93, 
                        Size = UDim2.fromOffset(0.75 * v83.AbsoluteSize.X, 0.75 * v83.AbsoluteSize.Y)
                    });
                    v84[("Skill%*"):format(v92)] = nil;
                end;
                l_InputHandler_1.Inputs.Mobile.SavedButtons = v84;
            end
        });
    end);
    v71:setMenu({
        v72, 
        v78
    });
end;
return v18;