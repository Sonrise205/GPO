local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_RunService_0 = game:GetService("RunService");
local l_reservedCode_0 = l_ReplicatedStorage_0.reservedCode;
local l_LocalPlayer_0 = game.Players.LocalPlayer;
local l_CompassGuider_0 = l_ReplicatedStorage_0.CompassGuider;
local l_CurrentCamera_0 = workspace.CurrentCamera;
local _ = script.Objects;
local v7 = nil;
local v8 = 0;
local v9 = require(l_ReplicatedStorage_0.Modules.Shared.Signals.GoodSignal);
local v10 = require(script.CardinalDirections);
local v11 = {
    Default = require(script.Objects.Default), 
    Flag = require(script.Objects.Flag)
};
local v12 = {
    Coordinates = {}, 
    InactiveCoordinates = {}, 
    Cardinals = {}, 
    PlayerLookAngle = nil, 
    Smoothness = 10, 
    CompassUI = script.Parent, 
    ItemAddedCheck = v9.new(), 
    ItemRemovedCheck = v9.new()
};
v12.CheckItemAdded = function(v13) --[[ Line: 34 ]] --[[ Name: CheckItemAdded ]]
    -- upvalues: v12 (copy)
    if not v13:IsA("Tool") then
        return;
    else
        v12.ItemAddedCheck:Fire(v13);
        return;
    end;
end;
v12.CheckItemRemoved = function(v14) --[[ Line: 39 ]] --[[ Name: CheckItemRemoved ]]
    -- upvalues: v12 (copy)
    if not v14:IsA("Tool") then
        return;
    else
        v12.ItemRemovedCheck:Fire(v14);
        return;
    end;
end;
for _, v16 in pairs(l_LocalPlayer_0.Backpack:GetChildren()) do
    task.spawn(v12.CheckItemAdded, v16);
end;
l_LocalPlayer_0.Backpack.ChildAdded:Connect(v12.CheckItemAdded);
l_LocalPlayer_0.Backpack.ChildRemoved:Connect(v12.CheckItemRemoved);
l_LocalPlayer_0.Character.ChildAdded:Connect(v12.CheckItemAdded);
v12.RestrictAngle = function(v17) --[[ Line: 52 ]] --[[ Name: RestrictAngle ]]
    if v17 < -3.141592653589793 then
        return v17 + 6.283185307179586;
    elseif v17 > 3.141592653589793 then
        return v17 - 6.283185307179586;
    else
        return v17;
    end;
end;
local function v19(v18) --[[ Line: 62 ]] --[[ Name: AddGuider ]]
    -- upvalues: v12 (copy), v11 (copy)
    if v12.Coordinates[v18] then
        v12.Coordinates[v18]:Destroy();
    end;
    v12.Coordinates[v18] = v11[v18:GetAttribute("Type") or "Default"].new({
        Handler = v12, 
        Guider = v18, 
        Parent = script.Parent.Guiders
    });
    v12.Coordinates[v18]:CheckItems();
    v12.Coordinates[v18]:AutoOptimize();
    v18.Destroying:Connect(function() --[[ Line: 76 ]]
        -- upvalues: v12 (ref), v18 (copy)
        if v12.Coordinates[v18] then
            v12.Coordinates[v18]:Destroy();
        end;
        v12.Coordinates[v18] = nil;
    end);
end;
for _, v21 in pairs(l_CompassGuider_0:GetChildren()) do
    if v21:IsA("Vector3Value") then
        v19(v21);
    end;
end;
l_CompassGuider_0.ChildAdded:Connect(function(v22) --[[ Line: 91 ]]
    -- upvalues: v19 (copy)
    v19(v22);
end);
v10:SetUp(v12);
local v23 = 0;
local function v37(v24) --[[ Line: 100 ]] --[[ Name: render ]]
    -- upvalues: v12 (copy), l_CurrentCamera_0 (copy), v8 (ref), v23 (ref)
    if v24 <= 0 then
        return;
    else
        v12.PlayerLookAngle = l_CurrentCamera_0.CFrame.LookVector;
        v12.PlayerLookAngle = math.atan2(v12.PlayerLookAngle.Z, v12.PlayerLookAngle.X);
        local v25 = v12.RestrictAngle(v12.PlayerLookAngle - v8);
        v12.PlayerLookAngle = v12.RestrictAngle(v8 + v25 * v24 * v12.Smoothness);
        v8 = v12.PlayerLookAngle;
        local v26 = false;
        v23 = v23 + v24;
        if v23 >= 0.06666666666666667 then
            v26 = true;
            v23 = 0;
        end;
        local l_CFrame_0 = l_CurrentCamera_0.CFrame;
        local v28 = nil;
        local v29 = 1e999;
        for _, v31 in pairs(v12.Coordinates) do
            v31:Update(l_CFrame_0, v26);
            if v31.IsVisible then
                local v32 = math.abs(v31.Angle);
                if v32 < v29 and v31.Guider:GetAttribute("isEnabled") and math.abs(v31.Angle) < 0.25 then
                    v29 = v32;
                    v28 = v31;
                end;
            end;
        end;
        if v28 then
            v28:SetInView(true);
        end;
        for _, v34 in pairs(v12.Coordinates) do
            if v28 ~= v34 then
                v34:SetInView(false);
            end;
        end;
        for _, v36 in pairs(v12.Cardinals) do
            v36:Update(l_CFrame_0, v26);
        end;
        return;
    end;
end;
v7 = l_RunService_0.RenderStepped:Connect(v37);
local function _() --[[ Line: 154 ]] --[[ Name: destroyCompass ]]
    -- upvalues: v7 (ref)
    print("Compass Destroyed");
    if v7 then
        v7:Disconnect();
        v7 = nil;
    end;
    script.Parent:Destroy();
end;
l_reservedCode_0:GetAttributeChangedSignal("battleRoyale"):Connect(function() --[[ Line: 165 ]]
    -- upvalues: l_reservedCode_0 (copy), v7 (ref)
    if l_reservedCode_0:GetAttribute("battleRoyale") and l_reservedCode_0.Value then
        print("Compass Destroyed");
        if v7 then
            v7:Disconnect();
            v7 = nil;
        end;
        script.Parent:Destroy();
    end;
end);
if l_ReplicatedStorage_0:FindFirstChild("tradingHUB") then
    print("Compass Destroyed");
    if v7 then
        v7:Disconnect();
        v7 = nil;
    end;
    script.Parent:Destroy();
end;
print("Compass loaded");