local v0 = require(script.Parent.loader).load(script);
local l_Workspace_0 = game:GetService("Workspace");
local l_UserInputService_0 = game:GetService("UserInputService");
local l_StarterGui_0 = game:GetService("StarterGui");
local l_TeleportService_0 = game:GetService("TeleportService");
local v5 = v0("AttributeValue");
local v6 = v0("Maid");
local v7 = v0("PlayerGuiUtils");
local v8 = v0("Rx");
local v9 = v0("SoftShutdownConstants");
local v10 = v0("SoftShutdownTranslator");
local v11 = v0("SoftShutdownUI");
local v12 = v0("RxValueBaseUtils");
local v13 = {};
local v14 = {
    Enum.CoreGuiType.PlayerList, 
    Enum.CoreGuiType.Health, 
    Enum.CoreGuiType.Backpack, 
    Enum.CoreGuiType.Chat, 
    Enum.CoreGuiType.EmotesMenu, 
    Enum.CoreGuiType.All
};
v13.Init = function(v15, v16) --[[ Line: 32 ]] --[[ Name: Init ]]
    -- upvalues: v6 (copy), v10 (copy), v5 (copy), l_Workspace_0 (copy), v9 (copy), v8 (copy), v12 (copy), l_TeleportService_0 (copy)
    assert(not v15._serviceBag, "Already initialized");
    v15._serviceBag = assert(v16, "No serviceBag");
    v15._maid = v6.new();
    v15._translator = v15._serviceBag:GetService(v10);
    v15._isLobby = v5.new(l_Workspace_0, v9.IS_SOFT_SHUTDOWN_LOBBY_ATTRIBUTE, false);
    v15._isUpdating = v5.new(l_Workspace_0, v9.IS_SOFT_SHUTDOWN_UPDATING_ATTRIBUTE, false);
    v15._localTeleportDataSaysIsLobby = Instance.new("BoolValue");
    v15._localTeleportDataSaysIsLobby.Value = false;
    v15._maid:GiveTask(v15._localTeleportDataSaysIsLobby);
    v15._isArrivingAfterShutdown = Instance.new("BoolValue");
    v15._isArrivingAfterShutdown.Value = false;
    v15._maid:GiveTask(v15._isArrivingAfterShutdown);
    task.spawn(function() --[[ Line: 50 ]]
        -- upvalues: v15 (copy)
        if v15:_queryLocalTeleportInfo() then
            v15._localTeleportDataSaysIsLobby.Value = true;
        end;
        if v15:_queryIsArrivingAfterShutdown() then
            v15._isArrivingAfterShutdown.Value = true;
        end;
    end);
    v15._maid:GiveTask(v8.combineLatest({
        isLobby = v15._isLobby:Observe(), 
        isShuttingDown = v15._isUpdating:Observe(), 
        localTeleportDataSaysIsLobby = v12.observeValue(v15._localTeleportDataSaysIsLobby), 
        isArrivingAfterShutdown = v12.observeValue(v15._isArrivingAfterShutdown)
    }):Subscribe(function(v17) --[[ Line: 64 ]]
        -- upvalues: v15 (copy), l_TeleportService_0 (ref)
        if v17.isLobby or v17.localTeleportDataSaysIsLobby then
            v15._maid._shutdownUI = nil;
            if not v15._maid._lobbyUI then
                local _ = nil;
                local l__maid_0 = v15._maid;
                local v20, v21 = v15:_showSoftShutdownUI("shutdown.lobby.title", "shutdown.lobby.subtitle", true);
                l__maid_0._lobbyUI = v20;
                l_TeleportService_0:SetTeleportGui(v21);
                return;
            end;
        elseif v17.isShuttingDown then
            local _ = nil;
            local l__maid_1 = v15._maid;
            local v24, v25 = v15:_showSoftShutdownUI("shutdown.restart.title", "shutdown.restart.subtitle");
            l__maid_1._shutdownUI = v24;
            l_TeleportService_0:SetTeleportGui(v25);
            v15._maid._lobbyUI = nil;
            return;
        elseif v17.isArrivingAfterShutdown then
            local v26 = v15:_showSoftShutdownUI("shutdown.complete.title", "shutdown.complete.subtitle", true);
            v15._maid._shutdownUI = v26;
            v15._maid._lobbyUI = nil;
            task.delay(1, function() --[[ Line: 87 ]]
                -- upvalues: v15 (ref), v26 (copy)
                if v15._maid._shutdownUI == v26 then
                    v15._maid._shutdownUI = nil;
                end;
            end);
            return;
        else
            v15._maid._shutdownUI = nil;
            v15._maid._lobbyUI = nil;
        end;
    end));
end;
v13._queryIsArrivingAfterShutdown = function(_) --[[ Line: 99 ]] --[[ Name: _queryIsArrivingAfterShutdown ]]
    -- upvalues: l_TeleportService_0 (copy)
    local l_l_TeleportService_0_LocalPlayerTeleportData_0 = l_TeleportService_0:GetLocalPlayerTeleportData();
    if type(l_l_TeleportService_0_LocalPlayerTeleportData_0) == "table" and l_l_TeleportService_0_LocalPlayerTeleportData_0.isSoftShutdownArrivingIntoUpdatedServer then
        return true;
    else
        return false;
    end;
end;
v13._queryLocalTeleportInfo = function(_) --[[ Line: 108 ]] --[[ Name: _queryLocalTeleportInfo ]]
    -- upvalues: l_TeleportService_0 (copy)
    local l_l_TeleportService_0_LocalPlayerTeleportData_1 = l_TeleportService_0:GetLocalPlayerTeleportData();
    if type(l_l_TeleportService_0_LocalPlayerTeleportData_1) == "table" and l_l_TeleportService_0_LocalPlayerTeleportData_1.isSoftShutdownReserveServer then
        return true;
    else
        return false;
    end;
end;
v13._showSoftShutdownUI = function(v31, v32, v33, v34) --[[ Line: 117 ]] --[[ Name: _showSoftShutdownUI ]]
    -- upvalues: v6 (copy), v7 (copy), v11 (copy)
    local v35 = v6.new();
    local v36 = v6.new();
    local l_ScreenGui_0 = Instance.new("ScreenGui");
    l_ScreenGui_0.Name = "SoftShutdownScreenGui";
    l_ScreenGui_0.ResetOnSpawn = false;
    l_ScreenGui_0.AutoLocalize = false;
    l_ScreenGui_0.IgnoreGuiInset = true;
    l_ScreenGui_0.DisplayOrder = 10000000000;
    l_ScreenGui_0.Parent = v7.getPlayerGui();
    l_ScreenGui_0.ZIndexBehavior = Enum.ZIndexBehavior.Sibling;
    v36:GiveTask(l_ScreenGui_0);
    local v38 = v11.new();
    v36:GiveTask(v38);
    v35:GiveTask(function() --[[ Line: 135 ]]
        -- upvalues: v38 (copy), v36 (copy)
        v38:Hide();
        task.delay(1, function() --[[ Line: 138 ]]
            -- upvalues: v36 (ref)
            v36:Destroy();
        end);
    end);
    v31:_hideCoreGuiUI(v36, l_ScreenGui_0);
    v35:GivePromise(v31._translator:PromiseFormatByKey(v33)):Then(function(v39) --[[ Line: 145 ]]
        -- upvalues: v38 (copy)
        v38:SetSubtitle(v39);
    end);
    v35:GivePromise(v31._translator:PromiseFormatByKey(v32)):Then(function(v40) --[[ Line: 149 ]]
        -- upvalues: v38 (copy)
        v38:SetTitle(v40);
    end);
    v38:Show(v34);
    v38.Gui.Parent = l_ScreenGui_0;
    return v35, l_ScreenGui_0;
end;
v13._hideCoreGuiUI = function(_, v42, v43) --[[ Line: 160 ]] --[[ Name: _hideCoreGuiUI ]]
    -- upvalues: l_UserInputService_0 (copy), v7 (copy), v14 (copy), l_StarterGui_0 (copy)
    if not l_UserInputService_0.ModalEnabled then
        l_UserInputService_0.ModalEnabled = true;
        v42:GiveTask(function() --[[ Line: 164 ]]
            -- upvalues: l_UserInputService_0 (ref)
            l_UserInputService_0.ModalEnabled = false;
        end);
    end;
    local v44 = v7.getPlayerGui();
    local v45 = {};
    local function _(v46) --[[ Line: 173 ]] --[[ Name: handleChild ]]
        -- upvalues: v43 (copy), v45 (copy)
        if v46:IsA("ScreenGui") and v46 ~= v43 and v46.Enabled then
            v45[v46] = v46;
            v46.Enabled = false;
        end;
    end;
    for _, v49 in pairs(v44:GetChildren()) do
        if v49:IsA("ScreenGui") and v49 ~= v43 and v49.Enabled then
            v45[v49] = v49;
            v49.Enabled = false;
        end;
    end;
    v42:GiveTask(v44.ChildAdded:Connect(function(v50) --[[ Line: 184 ]]
        -- upvalues: v43 (copy), v45 (copy)
        if v50:IsA("ScreenGui") and v50 ~= v43 and v50.Enabled then
            v45[v50] = v50;
            v50.Enabled = false;
        end;
    end));
    v42:GiveTask(v44.ChildRemoved:Connect(function(v51) --[[ Line: 188 ]]
        -- upvalues: v45 (copy)
        v45[v51] = nil;
    end));
    v42:GiveTask(function() --[[ Line: 192 ]]
        -- upvalues: v45 (copy)
        for v52, _ in pairs(v45) do
            v52.Enabled = true;
        end;
    end);
    for _, v55 in pairs(v14) do
        task.spawn(function() --[[ Line: 199 ]]
            -- upvalues: l_StarterGui_0 (ref), v55 (copy), v42 (copy)
            if l_StarterGui_0:GetCoreGuiEnabled(v55) then
                l_StarterGui_0:SetCoreGuiEnabled(v55, false);
                v42:GiveTask(function() --[[ Line: 203 ]]
                    -- upvalues: l_StarterGui_0 (ref), v55 (ref)
                    l_StarterGui_0:SetCoreGuiEnabled(v55, true);
                end);
            end;
        end);
    end;
end;
v13.Destroy = function(v56) --[[ Line: 211 ]] --[[ Name: Destroy ]]
    v56._maid:DoCleaning();
end;
return v13;