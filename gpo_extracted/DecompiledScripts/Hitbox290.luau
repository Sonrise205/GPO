local v0 = {};
local v1 = require(game.ReplicatedStorage.Modules.RotatedRegion3);
local _ = require(game.ReplicatedStorage.Modules.LowLevel);
local v3 = require(game.ReplicatedStorage.Modules.Shared.Signals.GoodSignal);
local l_getTargetByPart_0 = _G.getTargetByPart;
local function v13(v5, v6, v7) --[[ Line: 8 ]] --[[ Name: getinregion ]]
    -- upvalues: v1 (copy)
    local v8 = v1.new(v6.CFrame, v6.Size);
    if _G.getTargets == nil then
        require(game.ReplicatedStorage.Modules.SharedGlobals)();
    end;
    local v9 = {};
    local v10 = _G.getTargets(v5, nil, nil, nil, nil, v7);
    for _, v12 in ipairs(v10) do
        table.insert(v9, v12.Parent);
    end;
    return (v8:FindPartsInRegion3WithWhiteList(v9, 5000));
end;
FindNearest = function(v14, v15) --[[ Line: 23 ]] --[[ Name: FindNearest ]]
    local v16 = 1e999;
    local v17 = nil;
    for v18 = 1, #v15 do
        local l_magnitude_0 = (v15[v18].Position - v14).magnitude;
        if l_magnitude_0 < v16 then
            v16 = l_magnitude_0;
            v17 = v15[v18];
        end;
    end;
    return v17;
end;
local _ = {};
local v21 = false;
local v22 = {};
if game["Run Service"]:IsStudio() == false and game.GameId ~= 2097989947 then
    v21 = false;
end;
v0.start = function(_, v24, v25, v26, v27, v28, v29, _, v31, v32, v33, v34) --[[ Line: 45 ]] --[[ Name: start ]]
    -- upvalues: l_getTargetByPart_0 (ref), v21 (ref), v3 (copy), v22 (copy)
    local _ = tick();
    l_getTargetByPart_0 = _G.getTargetByPart;
    task.spawn(function() --[[ Line: 49 ]]
        -- upvalues: v25 (copy), v21 (ref), v31 (copy), v24 (copy), v27 (copy), v26 (ref), v3 (ref), v22 (ref), v28 (ref), v29 (ref), v32 (copy), v33 (copy), v34 (copy)
        local l_Part_0 = Instance.new("Part");
        l_Part_0.Size = v25;
        l_Part_0.Massless = true;
        l_Part_0.Transparency = 1;
        l_Part_0.CanCollide = false;
        l_Part_0.CastShadow = false;
        l_Part_0.Color = Color3.fromRGB(255, 0, 0);
        l_Part_0.Material = Enum.Material.Neon;
        if v21 == true then
            l_Part_0.Transparency = 0.75;
        end;
        l_Part_0.Parent = workspace.Effects;
        local l_Weld_0 = Instance.new("Weld");
        if v31 then
            l_Weld_0.Part0 = v31;
        else
            l_Weld_0.Part0 = v24.HumanoidRootPart;
        end;
        l_Weld_0.Name = "hitbox";
        l_Weld_0.Part1 = l_Part_0;
        l_Weld_0.C0 = v27;
        l_Weld_0.Parent = l_Weld_0.Part1;
        _G.destroy(l_Part_0, v26);
        local v38 = v3.new();
        table.insert(v22, {
            l_Part_0, 
            v24, 
            v28, 
            v29, 
            v38, 
            tick(), 
            v26, 
            v32, 
            v33, 
            v34
        });
        v38:Wait();
        v38:DisconnectAll();
        v38 = nil;
        l_Weld_0:Destroy();
        l_Part_0:Destroy();
        v29 = nil;
        v28 = nil;
        v26 = nil;
    end);
end;
local l_Heartbeat_0 = game["Run Service"].Heartbeat;
if game["Run Service"]:IsClient() == true then
    l_Heartbeat_0 = game["Run Service"].RenderStepped;
end;
l_Heartbeat_0:Connect(function(_) --[[ Line: 94 ]]
    -- upvalues: v22 (copy), v13 (copy), l_getTargetByPart_0 (ref)
    for v41 = 1, #v22 do
        if v22[v41] then
            local v42, v43, v44, v45, v46, v47, v48, v49, v50, v51 = unpack(v22[v41]);
            if v42 and v42.Parent ~= nil then
                local function _() --[[ Line: 100 ]] --[[ Name: checkValid ]]
                    -- upvalues: v43 (copy), v50 (copy)
                    local v52 = true;
                    if _G.check:inspect(v43) ~= false then
                        v52 = v50 and v50() == true;
                    end;
                    return not v52;
                end;
                local v54 = true;
                if _G.check:inspect(v43) ~= false then
                    v54 = v50 and v50() == true;
                end;
                if not v54 == false and v45 then
                    table.remove(v22, v41);
                    v45();
                    v46:Fire();
                    return;
                else
                    local v55 = v13(v43, v42, v51);
                    v54 = {};
                    if #v55 > 0 then
                        for v56 = 1, #v55 do
                            local v57 = l_getTargetByPart_0(v55[v56]) or v55[v56];
                            if v57 ~= nil and v57 ~= v43 then
                                if v57:FindFirstChild("Humanoid") then
                                    if (not v57:FindFirstChild("Rag") or v57.Rag.Value == nil) and v57:FindFirstChild("gripping") == nil and v54[v57] == nil then
                                        v54[v57] = true;
                                    end;
                                elseif v57:FindFirstChild("barrelHP") then
                                    v54[v57] = true;
                                end;
                            end;
                        end;
                        local v58 = {};
                        for v59, _ in v54 do
                            if v59:IsA("Model") and v59.PrimaryPart then
                                table.insert(v58, v59.PrimaryPart);
                            else
                                table.insert(v58, v59:GetChildren()[1]);
                            end;
                        end;
                        v54 = {};
                        local v61 = nil;
                        v61 = if v49 == nil then FindNearest(v43.HumanoidRootPart.CFrame.p, v58) else v58;
                        if v61 then
                            table.remove(v22, v41);
                            v46:Fire();
                            local v62 = true;
                            if _G.check:inspect(v43) ~= false then
                                v62 = v50 and v50() == true;
                            end;
                            if not v62 == true then
                                v44(v61);
                            end;
                        end;
                    end;
                    if v48 <= tick() - v47 then
                        table.remove(v22, v41);
                        v46:Fire();
                    end;
                end;
            else
                table.remove(v22, v41);
            end;
        end;
    end;
end);
return v0;