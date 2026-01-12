local l_TeleportService_0 = game:GetService("TeleportService");
local _ = game:GetService("Players");
local l_Promises_0 = script.Parent.Parent.Promises;
local v3 = require(l_Promises_0.Promise);
local v12 = {
    PromiseTeleportAsync = function(v4, v5, v6) --[[ Line: 12 ]] --[[ Name: PromiseTeleportAsync ]]
        -- upvalues: v3 (copy), l_TeleportService_0 (copy)
        print(type(v4), v4);
        assert(type(v4) == "number", "Invalid PlaceId");
        assert(type(v5) == "table", "Invalid Players");
        assert(typeof(v6) == "Instance" and v6:IsA("TeleportOptions") or v6 == nil, "Invalid TeleportOptions");
        return v3.spawn(function(v7, v8) --[[ Line: 19 ]]
            -- upvalues: l_TeleportService_0 (ref), v4 (copy), v5 (copy), v6 (copy)
            local v9 = nil;
            local l_status_0, l_result_0 = pcall(function() --[[ Line: 22 ]]
                -- upvalues: v9 (ref), l_TeleportService_0 (ref), v4 (ref), v5 (ref), v6 (ref)
                v9 = l_TeleportService_0:TeleportAsync(v4, v5, v6);
            end);
            if not l_status_0 then
                v8(l_result_0);
            end;
            return v7(v9);
        end);
    end
};
v12.PromiseTeleportAsyncWithRetry = function(v13, v14, v15, v16) --[[ Line: 38 ]] --[[ Name: PromiseTeleportAsyncWithRetry ]]
    -- upvalues: v12 (copy)
    v16 = v16 or 360;
    local v17 = 0;
    local v18 = nil;
    repeat
        print("Teleporting Players..., Retry Count:", v17);
        v18 = v12.PromiseTeleportAsync(v13, v14, v15);
        v17 = v17 + 1;
        task.wait(1);
    until v18:IsFulfilled() or v17 == v16;
    return v18;
end;
v12.CustomTeleportAsync = function(v19) --[[ Line: 60 ]] --[[ Name: CustomTeleportAsync ]]
    -- upvalues: v12 (copy)
    local l_Players_1 = v19.Players;
    local l_PlaceId_0 = v19.PlaceId;
    local v22 = v19.Retries or 5;
    local l_ReservedServerAccessCode_0 = v19.ReservedServerAccessCode;
    local l_TeleportData_0 = v19.TeleportData;
    local v25 = v19.TeleportOptions or Instance.new("TeleportOptions");
    if l_TeleportData_0 ~= nil then
        v25:SetTeleportData(l_TeleportData_0);
    end;
    if v25 and v25.ReservedServerAccessCode ~= nil then
        local l_v25_TeleportData_0 = v25:GetTeleportData();
        if l_v25_TeleportData_0 and typeof(l_v25_TeleportData_0) == "table" then
            l_v25_TeleportData_0.CurrentReservedServerAccessCode = v25.ReservedServerAccessCode;
            v25:SetTeleportData(l_v25_TeleportData_0);
        end;
    end;
    if l_ReservedServerAccessCode_0 then
        v25.ReservedServerAccessCode = l_ReservedServerAccessCode_0;
    end;
    local function v29() --[[ Line: 90 ]] --[[ Name: ReadyTeleport ]]
        -- upvalues: v19 (copy), l_Players_1 (copy), v12 (ref), l_PlaceId_0 (copy), v25 (copy), v22 (copy)
        if (v19.ListenToHopReady or false) == true then
            for _, v28 in ipairs(l_Players_1) do
                if v28 and v28:IsDescendantOf(l_Players_1) then
                    ({}):ListenToHopReady(function() --[[ Line: 105 ]]
                        -- upvalues: v12 (ref), l_PlaceId_0 (ref), v28 (copy), v25 (ref), v22 (ref)
                        v12.PromiseTeleportAsyncWithRetry(l_PlaceId_0, {
                            v28
                        }, v25, v22);
                    end);
                end;
            end;
            return;
        else
            print("tp");
            v12.PromiseTeleportAsyncWithRetry(l_PlaceId_0, l_Players_1, v25, v22);
            return;
        end;
    end;
    if (v19.ReserveServer or false) == true then
        local v30 = nil;
        local v31 = 0;
        repeat
            v30 = v12.PromiseReserveServer(l_PlaceId_0);
            v31 = v31 + 1;
            task.wait(1);
        until v30:IsFulfilled() or v31 == 5;
        v30:Then(function(v32) --[[ Line: 148 ]]
            -- upvalues: v25 (copy), v29 (copy)
            print("access code", v32);
            v25.ReservedServerAccessCode = v32;
            v29();
        end):Catch(function(_) --[[ Line: 152 ]]
            warn("Failed to generate AccessCode");
        end);
        return;
    else
        v29();
        return;
    end;
end;
v12.PromiseReserveServer = function(v34) --[[ Line: 165 ]] --[[ Name: PromiseReserveServer ]]
    -- upvalues: v3 (copy), l_TeleportService_0 (copy)
    return v3.spawn(function(v35, v36) --[[ Line: 166 ]]
        -- upvalues: l_TeleportService_0 (ref), v34 (copy)
        local v37 = nil;
        local l_status_1, l_result_1 = pcall(function() --[[ Line: 168 ]]
            -- upvalues: v37 (ref), l_TeleportService_0 (ref), v34 (ref)
            v37 = l_TeleportService_0:ReserveServer(v34);
        end);
        if not l_status_1 then
            return v36(l_result_1);
        else
            return v35(v37);
        end;
    end);
end;
v12.IsServerReserved = function() --[[ Line: 179 ]] --[[ Name: IsServerReserved ]]
    local v40 = false;
    if game.PrivateServerId ~= "" then
        v40 = game.PrivateServerOwnerId == 0;
    end;
    return v40;
end;
local function v49(v41, v42, v43) --[[ Line: 187 ]] --[[ Name: SafeTeleport ]]
    -- upvalues: l_TeleportService_0 (copy)
    local v44 = 0;
    local v45 = nil;
    local v46 = nil;
    repeat
        local l_status_2, l_result_2 = pcall(function() --[[ Line: 192 ]]
            -- upvalues: l_TeleportService_0 (ref), v41 (copy), v42 (copy), v43 (copy)
            return l_TeleportService_0:TeleportAsync(v41, v42, v43);
        end);
        v45 = l_status_2;
        v46 = l_result_2;
        v44 = v44 + 1;
        if not v45 then
            task.wait(1);
        end;
    until v45 or v44 == 10;
    if not v45 then
        warn(v46);
    end;
    return v45, v46;
end;
l_TeleportService_0.TeleportInitFailed:Connect(function(v50, v51, v52, v53, v54) --[[ Line: 208 ]] --[[ Name: handleFailedTeleport ]]
    -- upvalues: v49 (copy)
    if v51 == Enum.TeleportResult.Flooded then
        task.wait(15);
    elseif v51 == Enum.TeleportResult.Failure then
        task.wait(1);
    else
        warn(("Invalid teleport [%s]: %s"):format(v51.Name, v52));
    end;
    warn("telekport failed for " .. v50.Name);
    if v54 and v54:GetTeleportData() and v54:GetTeleportData().gamemode ~= nil then
        if v50:GetAttribute("teleportFailed") == nil then
            game.ReplicatedStorage.Events.note:FireClient(v50, "TELEPORT FAILED, RETRYING!");
            v50:SetAttribute("teleportFailed", true);
        end;
        v49(v53, {
            v50
        }, v54);
    end;
end);
return v12;