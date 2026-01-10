local v0 = {};
v0.__index = v0;
local v1 = {
    "CameraMinZoomDistance", 
    "CameraMaxZoomDistance", 
    "CameraMode", 
    "DevCameraOcclusionMode", 
    "DevComputerCameraMode", 
    "DevTouchCameraMode", 
    "DevComputerMovementMode", 
    "DevTouchMovementMode", 
    "DevEnableMouseLock"
};
local v2 = {
    "ComputerCameraMovementMode", 
    "ComputerMovementMode", 
    "ControlMode", 
    "GamepadCameraSensitivity", 
    "MouseSensitivity", 
    "RotationType", 
    "TouchCameraMovementMode", 
    "TouchMovementMode"
};
local l_Players_0 = game:GetService("Players");
local l_RunService_0 = game:GetService("RunService");
local l_UserInputService_0 = game:GetService("UserInputService");
local l_VRService_0 = game:GetService("VRService");
local l_UserGameSettings_0 = UserSettings():GetService("UserGameSettings");
local l_CommonUtils_0 = script.Parent:WaitForChild("CommonUtils");
local l_ConnectionUtil_0 = require(l_CommonUtils_0:WaitForChild("ConnectionUtil"));
local l_FlagUtil_0 = require(l_CommonUtils_0:WaitForChild("FlagUtil"));
local l_CameraUtils_0 = require(script:WaitForChild("CameraUtils"));
local l_CameraInput_0 = require(script:WaitForChild("CameraInput"));
local l_ClassicCamera_0 = require(script:WaitForChild("ClassicCamera"));
local l_OrbitalCamera_0 = require(script:WaitForChild("OrbitalCamera"));
local l_LegacyCamera_0 = require(script:WaitForChild("LegacyCamera"));
local l_VehicleCamera_0 = require(script:WaitForChild("VehicleCamera"));
local l_VRCamera_0 = require(script:WaitForChild("VRCamera"));
local l_VRVehicleCamera_0 = require(script:WaitForChild("VRVehicleCamera"));
local l_Invisicam_0 = require(script:WaitForChild("Invisicam"));
local l_Poppercam_0 = require(script:WaitForChild("Poppercam"));
local l_TransparencyController_0 = require(script:WaitForChild("TransparencyController"));
local l_MouseLockController_0 = require(script:WaitForChild("MouseLockController"));
local v23 = {};
local v24 = {};
if not l_Players_0.LocalPlayer then
    return {};
else
    assert(l_Players_0.LocalPlayer, "Strict typing check");
    local l_PlayerScripts_0 = l_Players_0.LocalPlayer:WaitForChild("PlayerScripts");
    l_PlayerScripts_0:RegisterTouchCameraMovementMode(Enum.TouchCameraMovementMode.Default);
    l_PlayerScripts_0:RegisterTouchCameraMovementMode(Enum.TouchCameraMovementMode.Follow);
    l_PlayerScripts_0:RegisterTouchCameraMovementMode(Enum.TouchCameraMovementMode.Classic);
    l_PlayerScripts_0:RegisterComputerCameraMovementMode(Enum.ComputerCameraMovementMode.Default);
    l_PlayerScripts_0:RegisterComputerCameraMovementMode(Enum.ComputerCameraMovementMode.Follow);
    l_PlayerScripts_0:RegisterComputerCameraMovementMode(Enum.ComputerCameraMovementMode.Classic);
    l_PlayerScripts_0:RegisterComputerCameraMovementMode(Enum.ComputerCameraMovementMode.CameraToggle);
    l_PlayerScripts_0 = l_FlagUtil_0.getUserFlag("UserRespectLegacyCameraOptions");
    local v26 = l_FlagUtil_0.getUserFlag("UserPlayerConnectionMemoryLeak");
    local v27 = l_FlagUtil_0.getUserFlag("UserPreferredInputPlayerScripts2");
    local v28 = l_FlagUtil_0.getUserFlag("UserPSFixCameraControllerReset");
    v0.new = function() --[[ Line: 147 ]] --[[ Name: new ]]
        -- upvalues: l_TransparencyController_0 (copy), v26 (copy), l_ConnectionUtil_0 (copy), v0 (copy), l_Players_0 (copy), l_UserInputService_0 (copy), v27 (copy), l_MouseLockController_0 (copy), l_PlayerScripts_0 (copy), l_RunService_0 (copy), v1 (copy), v2 (copy), l_UserGameSettings_0 (copy)
        local v29 = setmetatable({
            activeTransparencyController = l_TransparencyController_0.new(), 
            connectionUtil = if v26 then l_ConnectionUtil_0.new() else nil
        }, v0);
        v29.activeCameraController = nil;
        v29.activeOcclusionModule = nil;
        v29.activeMouseLockController = nil;
        v29.currentComputerCameraMovementMode = nil;
        v29.cameraSubjectChangedConn = nil;
        v29.cameraTypeChangedConn = nil;
        for _, v31 in pairs(l_Players_0:GetPlayers()) do
            v29:OnPlayerAdded(v31);
        end;
        l_Players_0.PlayerAdded:Connect(function(v32) --[[ Line: 170 ]]
            -- upvalues: v29 (copy)
            v29:OnPlayerAdded(v32);
        end);
        if v26 then
            l_Players_0.PlayerRemoving:Connect(function(v33) --[[ Line: 175 ]]
                -- upvalues: v29 (copy)
                v29:OnPlayerRemoving(v33);
            end);
        end;
        v29.activeTransparencyController:Enable(true);
        if not l_UserInputService_0.TouchEnabled or v27 then
            v29.activeMouseLockController = l_MouseLockController_0.new();
            assert(v29.activeMouseLockController, "Strict typing check");
            local l_BindableToggleEvent_0 = v29.activeMouseLockController:GetBindableToggleEvent();
            if l_BindableToggleEvent_0 then
                l_BindableToggleEvent_0:Connect(function() --[[ Line: 188 ]]
                    -- upvalues: v29 (copy)
                    v29:OnMouseLockToggled();
                end);
            end;
        end;
        if l_PlayerScripts_0 then
            v29:ActivateCameraController();
        else
            v29:ActivateCameraController(v29:GetCameraControlChoice());
        end;
        v29:ActivateOcclusionModule(l_Players_0.LocalPlayer.DevCameraOcclusionMode);
        v29:OnCurrentCameraChanged();
        l_RunService_0:BindToRenderStep("cameraRenderUpdate", Enum.RenderPriority.Camera.Value, function(v35) --[[ Line: 201 ]]
            -- upvalues: v29 (copy)
            v29:Update(v35);
        end);
        for _, v37 in pairs(v1) do
            l_Players_0.LocalPlayer:GetPropertyChangedSignal(v37):Connect(function() --[[ Line: 205 ]]
                -- upvalues: v29 (copy), v37 (copy)
                v29:OnLocalPlayerCameraPropertyChanged(v37);
            end);
        end;
        for _, v39 in pairs(v2) do
            l_UserGameSettings_0:GetPropertyChangedSignal(v39):Connect(function() --[[ Line: 211 ]]
                -- upvalues: v29 (copy), v39 (copy)
                v29:OnUserGameSettingsPropertyChanged(v39);
            end);
        end;
        game.Workspace:GetPropertyChangedSignal("CurrentCamera"):Connect(function() --[[ Line: 215 ]]
            -- upvalues: v29 (copy)
            v29:OnCurrentCameraChanged();
        end);
        if v27 then
            l_UserInputService_0:GetPropertyChangedSignal("PreferredInput"):Connect(function() --[[ Line: 219 ]]
                -- upvalues: v29 (copy)
                v29:OnPreferredInputChanged();
            end);
        end;
        return v29;
    end;
    v0.GetCameraMovementModeFromSettings = function(_) --[[ Line: 227 ]] --[[ Name: GetCameraMovementModeFromSettings ]]
        -- upvalues: l_Players_0 (copy), l_CameraUtils_0 (copy), v27 (copy), l_UserInputService_0 (copy), l_UserGameSettings_0 (copy)
        if l_Players_0.LocalPlayer.CameraMode == Enum.CameraMode.LockFirstPerson then
            return l_CameraUtils_0.ConvertCameraModeEnumToStandard(Enum.ComputerCameraMovementMode.Classic);
        else
            local v41 = nil;
            local v42 = nil;
            local _ = nil;
            if if v27 then l_UserInputService_0.PreferredInput == Enum.PreferredInput.Touch else l_UserInputService_0.TouchEnabled then
                v41 = l_CameraUtils_0.ConvertCameraModeEnumToStandard(l_Players_0.LocalPlayer.DevTouchCameraMode);
                v42 = l_CameraUtils_0.ConvertCameraModeEnumToStandard(l_UserGameSettings_0.TouchCameraMovementMode);
            else
                v41 = l_CameraUtils_0.ConvertCameraModeEnumToStandard(l_Players_0.LocalPlayer.DevComputerCameraMode);
                v42 = l_CameraUtils_0.ConvertCameraModeEnumToStandard(l_UserGameSettings_0.ComputerCameraMovementMode);
            end;
            if v41 == Enum.DevComputerCameraMovementMode.UserChoice then
                return v42;
            else
                return v41;
            end;
        end;
    end;
    v0.ActivateOcclusionModule = function(v44, v45) --[[ Line: 257 ]] --[[ Name: ActivateOcclusionModule ]]
        -- upvalues: l_Poppercam_0 (copy), l_Invisicam_0 (copy), v24 (copy), l_Players_0 (copy)
        local v46 = nil;
        if v45 == Enum.DevCameraOcclusionMode.Zoom then
            v46 = l_Poppercam_0;
        elseif v45 == Enum.DevCameraOcclusionMode.Invisicam then
            v46 = l_Invisicam_0;
        else
            warn("CameraScript ActivateOcclusionModule called with unsupported mode");
            return;
        end;
        v44.occlusionMode = v45;
        if v44.activeOcclusionModule and v44.activeOcclusionModule:GetOcclusionMode() == v45 then
            if not v44.activeOcclusionModule:GetEnabled() then
                v44.activeOcclusionModule:Enable(true);
            end;
            return;
        else
            local l_activeOcclusionModule_0 = v44.activeOcclusionModule;
            v44.activeOcclusionModule = v24[v46];
            if not v44.activeOcclusionModule then
                v44.activeOcclusionModule = v46.new();
                if v44.activeOcclusionModule then
                    v24[v46] = v44.activeOcclusionModule;
                end;
            end;
            if v44.activeOcclusionModule then
                if v44.activeOcclusionModule:GetOcclusionMode() ~= v45 then
                    warn("CameraScript ActivateOcclusionModule mismatch: ", v44.activeOcclusionModule:GetOcclusionMode(), "~=", v45);
                end;
                if l_activeOcclusionModule_0 then
                    if l_activeOcclusionModule_0 ~= v44.activeOcclusionModule then
                        l_activeOcclusionModule_0:Enable(false);
                    else
                        warn("CameraScript ActivateOcclusionModule failure to detect already running correct module");
                    end;
                end;
                if v45 == Enum.DevCameraOcclusionMode.Invisicam then
                    if l_Players_0.LocalPlayer.Character then
                        v44.activeOcclusionModule:CharacterAdded(l_Players_0.LocalPlayer.Character, l_Players_0.LocalPlayer);
                    end;
                else
                    for _, v49 in pairs(l_Players_0:GetPlayers()) do
                        if v49 and v49.Character then
                            v44.activeOcclusionModule:CharacterAdded(v49.Character, v49);
                        end;
                    end;
                    v44.activeOcclusionModule:OnCameraSubjectChanged(game.Workspace.CurrentCamera.CameraSubject);
                end;
                v44.activeOcclusionModule:Enable(true);
            end;
            return;
        end;
    end;
    v0.ShouldUseVehicleCamera = function(v50) --[[ Line: 336 ]] --[[ Name: ShouldUseVehicleCamera ]]
        local l_CurrentCamera_0 = workspace.CurrentCamera;
        if not l_CurrentCamera_0 then
            return false;
        else
            local l_CameraType_0 = l_CurrentCamera_0.CameraType;
            local l_CameraSubject_0 = l_CurrentCamera_0.CameraSubject;
            local v54 = true;
            if l_CameraType_0 ~= Enum.CameraType.Custom then
                v54 = l_CameraType_0 == Enum.CameraType.Follow;
            end;
            local v55 = l_CameraSubject_0 and l_CameraSubject_0:IsA("VehicleSeat") or false;
            local v56 = v50.occlusionMode ~= Enum.DevCameraOcclusionMode.Invisicam;
            return v55 and v54 and v56;
        end;
    end;
    v0.ActivateCameraController = function(v57, v58, v59) --[[ Line: 352 ]] --[[ Name: ActivateCameraController ]]
        -- upvalues: l_PlayerScripts_0 (copy), l_LegacyCamera_0 (copy), l_VRService_0 (copy), l_VRCamera_0 (copy), l_ClassicCamera_0 (copy), l_OrbitalCamera_0 (copy), l_VRVehicleCamera_0 (copy), l_VehicleCamera_0 (copy), v23 (copy), v28 (copy)
        if l_PlayerScripts_0 then
            v59 = workspace.CurrentCamera.CameraType;
            v58 = v57:GetCameraMovementModeFromSettings();
        end;
        local v60 = nil;
        if l_PlayerScripts_0 and true or v59 ~= nil then
            if v59 == Enum.CameraType.Scriptable then
                if v57.activeCameraController then
                    v57.activeCameraController:Enable(false);
                    v57.activeCameraController = nil;
                end;
                return;
            elseif v59 == Enum.CameraType.Custom then
                v58 = v57:GetCameraMovementModeFromSettings();
            elseif v59 == Enum.CameraType.Track then
                v58 = Enum.ComputerCameraMovementMode.Classic;
            elseif v59 == Enum.CameraType.Follow then
                v58 = Enum.ComputerCameraMovementMode.Follow;
            elseif v59 == Enum.CameraType.Orbital then
                v58 = Enum.ComputerCameraMovementMode.Orbital;
            elseif v59 == Enum.CameraType.Attach or v59 == Enum.CameraType.Watch or v59 == Enum.CameraType.Fixed then
                v60 = l_LegacyCamera_0;
            else
                warn("CameraScript encountered an unhandled Camera.CameraType value: ", v59);
            end;
        end;
        if not v60 then
            if l_VRService_0.VREnabled then
                v60 = l_VRCamera_0;
            elseif v58 == Enum.ComputerCameraMovementMode.Classic or v58 == Enum.ComputerCameraMovementMode.Follow or v58 == Enum.ComputerCameraMovementMode.Default or v58 == Enum.ComputerCameraMovementMode.CameraToggle then
                v60 = l_ClassicCamera_0;
            elseif v58 == Enum.ComputerCameraMovementMode.Orbital then
                v60 = l_OrbitalCamera_0;
            else
                warn("ActivateCameraController did not select a module.");
                return;
            end;
        end;
        if v57:ShouldUseVehicleCamera() then
            v60 = if l_VRService_0.VREnabled then l_VRVehicleCamera_0 else l_VehicleCamera_0;
        end;
        local v61 = nil;
        if not v23[v60] then
            v61 = v60.new();
            v23[v60] = v61;
        else
            v61 = v23[v60];
            if v28 then
                if v61.Reset and v57.activeCameraController ~= v61 then
                    v61:Reset();
                end;
            elseif v61.Reset then
                v61:Reset();
            end;
        end;
        if v57.activeCameraController then
            if v57.activeCameraController ~= v61 then
                v57.activeCameraController:Enable(false);
                v57.activeCameraController = v61;
                v57.activeCameraController:Enable(true);
            elseif not v57.activeCameraController:GetEnabled() then
                v57.activeCameraController:Enable(true);
            end;
        elseif v61 ~= nil then
            v57.activeCameraController = v61;
            assert(v57.activeCameraController, "Strict typing check");
            v57.activeCameraController:Enable(true);
        end;
        if v57.activeCameraController then
            if l_PlayerScripts_0 then
                v57.activeCameraController:SetCameraMovementMode(v58);
                v57.activeCameraController:SetCameraType(v59);
                return;
            elseif v58 ~= nil then
                v57.activeCameraController:SetCameraMovementMode(v58);
                return;
            elseif v59 ~= nil then
                v57.activeCameraController:SetCameraType(v59);
            end;
        end;
    end;
    v0.OnCameraSubjectChanged = function(v62) --[[ Line: 472 ]] --[[ Name: OnCameraSubjectChanged ]]
        local l_CurrentCamera_1 = workspace.CurrentCamera;
        local v64 = if l_CurrentCamera_1 then l_CurrentCamera_1.CameraSubject else nil;
        if v62.activeTransparencyController then
            v62.activeTransparencyController:SetSubject(v64);
        end;
        if v62.activeOcclusionModule then
            v62.activeOcclusionModule:OnCameraSubjectChanged(v64);
        end;
        v62:ActivateCameraController(nil, if l_CurrentCamera_1 then l_CurrentCamera_1.CameraType else nil);
    end;
    v0.OnCameraTypeChanged = function(v65, v66) --[[ Line: 487 ]] --[[ Name: OnCameraTypeChanged ]]
        -- upvalues: l_UserInputService_0 (copy), l_CameraUtils_0 (copy)
        if v66 == Enum.CameraType.Scriptable and l_UserInputService_0.MouseBehavior == Enum.MouseBehavior.LockCenter then
            l_CameraUtils_0.restoreMouseBehavior();
        end;
        v65:ActivateCameraController(nil, v66);
    end;
    v0.OnCurrentCameraChanged = function(v67) --[[ Line: 499 ]] --[[ Name: OnCurrentCameraChanged ]]
        local l_CurrentCamera_2 = game.Workspace.CurrentCamera;
        if not l_CurrentCamera_2 then
            return;
        else
            if v67.cameraSubjectChangedConn then
                v67.cameraSubjectChangedConn:Disconnect();
            end;
            if v67.cameraTypeChangedConn then
                v67.cameraTypeChangedConn:Disconnect();
            end;
            v67.cameraSubjectChangedConn = l_CurrentCamera_2:GetPropertyChangedSignal("CameraSubject"):Connect(function() --[[ Line: 511 ]]
                -- upvalues: v67 (copy)
                v67:OnCameraSubjectChanged();
            end);
            v67.cameraTypeChangedConn = l_CurrentCamera_2:GetPropertyChangedSignal("CameraType"):Connect(function() --[[ Line: 515 ]]
                -- upvalues: v67 (copy), l_CurrentCamera_2 (copy)
                v67:OnCameraTypeChanged(l_CurrentCamera_2.CameraType);
            end);
            v67:OnCameraSubjectChanged();
            v67:OnCameraTypeChanged(l_CurrentCamera_2.CameraType);
            return;
        end;
    end;
    v0.OnLocalPlayerCameraPropertyChanged = function(v69, v70) --[[ Line: 523 ]] --[[ Name: OnLocalPlayerCameraPropertyChanged ]]
        -- upvalues: l_Players_0 (copy), l_CameraUtils_0 (copy)
        if v70 == "CameraMode" then
            if l_Players_0.LocalPlayer.CameraMode == Enum.CameraMode.LockFirstPerson then
                if not v69.activeCameraController or v69.activeCameraController:GetModuleName() ~= "ClassicCamera" then
                    v69:ActivateCameraController(l_CameraUtils_0.ConvertCameraModeEnumToStandard(Enum.DevComputerCameraMovementMode.Classic));
                end;
                if v69.activeCameraController then
                    v69.activeCameraController:UpdateForDistancePropertyChange();
                    return;
                end;
            elseif l_Players_0.LocalPlayer.CameraMode == Enum.CameraMode.Classic then
                local l_v69_CameraMovementModeFromSettings_0 = v69:GetCameraMovementModeFromSettings();
                v69:ActivateCameraController(l_CameraUtils_0.ConvertCameraModeEnumToStandard(l_v69_CameraMovementModeFromSettings_0));
                return;
            else
                warn("Unhandled value for property player.CameraMode: ", l_Players_0.LocalPlayer.CameraMode);
                return;
            end;
        elseif v70 == "DevComputerCameraMode" or v70 == "DevTouchCameraMode" then
            local l_v69_CameraMovementModeFromSettings_1 = v69:GetCameraMovementModeFromSettings();
            v69:ActivateCameraController(l_CameraUtils_0.ConvertCameraModeEnumToStandard(l_v69_CameraMovementModeFromSettings_1));
            return;
        elseif v70 == "DevCameraOcclusionMode" then
            v69:ActivateOcclusionModule(l_Players_0.LocalPlayer.DevCameraOcclusionMode);
            return;
        elseif v70 == "CameraMinZoomDistance" or v70 == "CameraMaxZoomDistance" then
            if v69.activeCameraController then
                v69.activeCameraController:UpdateForDistancePropertyChange();
                return;
            end;
        elseif v70 == "DevTouchMovementMode" then
            return;
        elseif v70 == "DevComputerMovementMode" then
            return;
        elseif v70 == "DevEnableMouseLock" then

        end;
    end;
    v0.OnUserGameSettingsPropertyChanged = function(v73, v74) --[[ Line: 567 ]] --[[ Name: OnUserGameSettingsPropertyChanged ]]
        -- upvalues: l_CameraUtils_0 (copy)
        if v74 == "ComputerCameraMovementMode" then
            local l_v73_CameraMovementModeFromSettings_0 = v73:GetCameraMovementModeFromSettings();
            v73:ActivateCameraController(l_CameraUtils_0.ConvertCameraModeEnumToStandard(l_v73_CameraMovementModeFromSettings_0));
        end;
    end;
    v0.OnPreferredInputChanged = function(v76) --[[ Line: 574 ]] --[[ Name: OnPreferredInputChanged ]]
        -- upvalues: l_CameraUtils_0 (copy)
        local l_v76_CameraMovementModeFromSettings_0 = v76:GetCameraMovementModeFromSettings();
        v76:ActivateCameraController(l_CameraUtils_0.ConvertCameraModeEnumToStandard(l_v76_CameraMovementModeFromSettings_0));
    end;
    v0.Update = function(v78, v79) --[[ Line: 585 ]] --[[ Name: Update ]]
        -- upvalues: l_CameraInput_0 (copy)
        if v78.activeCameraController then
            v78.activeCameraController:UpdateMouseBehavior();
            local v80, v81 = v78.activeCameraController:Update(v79);
            if v78.activeOcclusionModule then
                local v82, v83 = v78.activeOcclusionModule:Update(v79, v80, v81);
                v80 = v82;
                v81 = v83;
            end;
            local l_CurrentCamera_3 = game.Workspace.CurrentCamera;
            l_CurrentCamera_3.CFrame = v80;
            l_CurrentCamera_3.Focus = v81;
            if v78.activeTransparencyController then
                v78.activeTransparencyController:Update(v79);
            end;
            if l_CameraInput_0.getInputEnabled() then
                l_CameraInput_0.resetInputForFrameEnd();
            end;
        end;
    end;
    v0.GetCameraControlChoice = function(_) --[[ Line: 613 ]] --[[ Name: GetCameraControlChoice ]]
        -- upvalues: l_PlayerScripts_0 (copy), l_UserInputService_0 (copy), l_Players_0 (copy), l_CameraUtils_0 (copy), l_UserGameSettings_0 (copy)
        assert(not l_PlayerScripts_0, "CameraModule:GetCameraControlChoice should not be called when FFlagUserRespectLegacyCameraOptions is enabled");
        if l_UserInputService_0:GetLastInputType() == Enum.UserInputType.Touch or l_UserInputService_0.TouchEnabled then
            if l_Players_0.LocalPlayer.DevTouchCameraMode == Enum.DevTouchCameraMovementMode.UserChoice then
                return l_CameraUtils_0.ConvertCameraModeEnumToStandard(l_UserGameSettings_0.TouchCameraMovementMode);
            else
                return l_CameraUtils_0.ConvertCameraModeEnumToStandard(l_Players_0.LocalPlayer.DevTouchCameraMode);
            end;
        elseif l_Players_0.LocalPlayer.DevComputerCameraMode == Enum.DevComputerCameraMovementMode.UserChoice then
            local v86 = l_CameraUtils_0.ConvertCameraModeEnumToStandard(l_UserGameSettings_0.ComputerCameraMovementMode);
            return l_CameraUtils_0.ConvertCameraModeEnumToStandard(v86);
        else
            return l_CameraUtils_0.ConvertCameraModeEnumToStandard(l_Players_0.LocalPlayer.DevComputerCameraMode);
        end;
    end;
    v0.OnCharacterAdded = function(v87, v88, v89) --[[ Line: 633 ]] --[[ Name: OnCharacterAdded ]]
        if v87.activeOcclusionModule then
            v87.activeOcclusionModule:CharacterAdded(v88, v89);
        end;
    end;
    v0.OnCharacterRemoving = function(v90, v91, v92) --[[ Line: 639 ]] --[[ Name: OnCharacterRemoving ]]
        if v90.activeOcclusionModule then
            v90.activeOcclusionModule:CharacterRemoving(v91, v92);
        end;
    end;
    v0.OnPlayerAdded = function(v93, v94) --[[ Line: 645 ]] --[[ Name: OnPlayerAdded ]]
        -- upvalues: v26 (copy)
        if v26 then
            if v93.connectionUtil then
                v93.connectionUtil:trackConnection(("%*CharacterAdded"):format(v94.UserId), v94.CharacterAdded:Connect(function(v95) --[[ Line: 649 ]]
                    -- upvalues: v93 (copy), v94 (copy)
                    v93:OnCharacterAdded(v95, v94);
                end));
                v93.connectionUtil:trackConnection(("%*CharacterRemoving"):format(v94.UserId), v94.CharacterRemoving:Connect(function(v96) --[[ Line: 652 ]]
                    -- upvalues: v93 (copy), v94 (copy)
                    v93:OnCharacterRemoving(v96, v94);
                end));
                return;
            end;
        else
            v94.CharacterAdded:Connect(function(v97) --[[ Line: 657 ]]
                -- upvalues: v93 (copy), v94 (copy)
                v93:OnCharacterAdded(v97, v94);
            end);
            v94.CharacterRemoving:Connect(function(v98) --[[ Line: 660 ]]
                -- upvalues: v93 (copy), v94 (copy)
                v93:OnCharacterRemoving(v98, v94);
            end);
        end;
    end;
    v0.OnPlayerRemoving = function(v99, v100) --[[ Line: 666 ]] --[[ Name: OnPlayerRemoving ]]
        if v99.connectionUtil then
            v99.connectionUtil:disconnect((("%*CharacterAdded"):format(v100.UserId)));
            v99.connectionUtil:disconnect((("%*CharacterRemoving"):format(v100.UserId)));
        end;
    end;
    v0.OnMouseLockToggled = function(v101) --[[ Line: 674 ]] --[[ Name: OnMouseLockToggled ]]
        if v101.activeMouseLockController then
            local l_IsMouseLocked_0 = v101.activeMouseLockController:GetIsMouseLocked();
            local l_MouseLockOffset_0 = v101.activeMouseLockController:GetMouseLockOffset();
            if v101.activeCameraController then
                v101.activeCameraController:SetIsMouseLocked(l_IsMouseLocked_0);
                v101.activeCameraController:SetMouseLockOffset(l_MouseLockOffset_0);
            end;
        end;
    end;
    v0.ConstructMobileShiftLock = function(v104) --[[ Line: 685 ]] --[[ Name: ConstructMobileShiftLock ]]
        -- upvalues: l_MouseLockController_0 (copy)
        v104.activeMouseLockController = l_MouseLockController_0.new();
        local l_BindableToggleEvent_1 = v104.activeMouseLockController:GetBindableToggleEvent();
        if l_BindableToggleEvent_1 then
            l_BindableToggleEvent_1:Connect(function() --[[ Line: 689 ]]
                -- upvalues: v104 (copy)
                v104:OnMouseLockToggled();
            end);
        end;
    end;
    v0.ToggleMobileShiftLock = function(v106) --[[ Line: 695 ]] --[[ Name: ToggleMobileShiftLock ]]
        if v106.activeMouseLockController then
            v106.activeMouseLockController:OnMouseLockToggled();
        end;
    end;
    return {
        CameraModule = v0.new()
    };
end;