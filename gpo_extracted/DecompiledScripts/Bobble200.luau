local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_Players_0 = game:GetService("Players");
local l_RunService_0 = game:GetService("RunService");
local l_Effects_0 = workspace.Effects;
local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
local v5 = Random.new();
local l_Action_0 = l_ReplicatedStorage_0.Fishing.Remotes.Action;
workspace:WaitForChild("Env");
workspace:WaitForChild("Ships");
workspace:WaitForChild("Islands");
local v7 = RaycastParams.new();
v7.FilterDescendantsInstances = {
    workspace.Islands, 
    workspace.Ships, 
    workspace.Env
};
v7.FilterType = Enum.RaycastFilterType.Include;
local v8 = require(l_ReplicatedStorage_0.Modules.Shared.Maids.Maid);
local _ = require(l_ReplicatedStorage_0.Modules.Shared.Signals.GoodSignal);
local v10 = {};
v10.__index = v10;
v10.new = function(v11) --[[ Line: 31 ]] --[[ Name: new ]]
    -- upvalues: v10 (copy), v8 (copy)
    local v12 = setmetatable({}, v10);
    v12.Cleaner = v8.new();
    v12.Landed = false;
    v12.Client = v11.Client;
    v12.Velocity = v11.Velocity;
    v12.Pull = Vector3.new(0, 0, 0, 0);
    v12.Push = Vector3.new(0, 0, 0, 0);
    v12.Model = v12:_getBobble();
    v12.Model.Destroying:Connect(function() --[[ Line: 44 ]]
        -- upvalues: v12 (copy)
        warn("bobble model desteroyed");
        _G.canuse = true;
        v12.Client.IsCharging = false;
    end);
    v12:_main();
    return v12;
end;
v10._getBobble = function(v13) --[[ Line: 55 ]] --[[ Name: _getBobble ]]
    -- upvalues: l_Effects_0 (copy), l_LocalPlayer_0 (copy)
    local v14 = l_Effects_0:WaitForChild((("%*'s hook"):format(l_LocalPlayer_0)));
    v13.Cleaner:AddTask(v14);
    return v14;
end;
local v15 = OverlapParams.new();
v15.FilterDescendantsInstances = {
    workspace.Islands, 
    workspace.Env, 
    workspace.Ships
};
v15.FilterType = Enum.RaycastFilterType.Include;
v10._bobbleFall = function(v16, _) --[[ Line: 66 ]] --[[ Name: _bobbleFall ]]
    -- upvalues: v15 (copy), l_LocalPlayer_0 (copy), l_Action_0 (copy)
    local l_Y_0 = workspace.Env.WaterStuff.Falls.Position.Y;
    local l_Model_0 = v16.Model;
    local l_workspace_PartsInPart_0 = workspace:GetPartsInPart(l_Model_0, v15);
    if l_workspace_PartsInPart_0 and #l_workspace_PartsInPart_0 > 0 then
        v16.Client:_reelBack();
        return;
    elseif l_Model_0.Position.Y <= l_Y_0 then
        if l_LocalPlayer_0.Character.HumanoidRootPart.Position.Y <= l_Y_0 then
            v16.Client:_reelBack();
            return;
        else
            v16.Landed = true;
            v16.LandedClock = os.clock();
            v16.Client:_play("Idle");
            l_Model_0.AssemblyLinearVelocity = Vector3.new(0, 0, 0, 0);
            local l_BodyPosition_0 = Instance.new("BodyPosition");
            l_BodyPosition_0.MaxForce = Vector3.new(0, 2000000000, 0, 0);
            l_BodyPosition_0.Position = l_Model_0.Position;
            l_BodyPosition_0.Parent = l_Model_0;
            l_Action_0:InvokeServer({
                Action = "Landed"
            });
            return;
        end;
    else
        l_Model_0.CFrame = CFrame.new(Vector3.new(0, 0, 0, 0), l_Model_0.AssemblyLinearVelocity.Unit) * CFrame.Angles(0, 0, 0) + l_Model_0.Position;
        return;
    end;
end;
v10._bobbleIdle = function(v22, _) --[[ Line: 101 ]] --[[ Name: _bobbleIdle ]]
    -- upvalues: l_LocalPlayer_0 (copy)
    local l_Model_1 = v22.Model;
    local l_HumanoidRootPart_0 = l_LocalPlayer_0.Character.HumanoidRootPart;
    local l_Unit_0 = (l_Model_1.Position - l_HumanoidRootPart_0.Position).Unit;
    local v27 = os.clock() - v22.LandedClock;
    local v28 = Vector3.new(0, 1, 0, 0) * math.sin(v27 * 2) * 0.1;
    local v29 = Vector3.new(0, 1, 0, 0) * _G.getWavePosition(l_Model_1.Position) + l_Model_1.Position * Vector3.new(1, 0, 1, 0) + v28;
    l_Model_1.CFrame = l_Model_1.CFrame:Lerp(CFrame.new(Vector3.new(0, 0, 0, 0), Vector3.new(0, 1, 0, 0):Cross(l_Unit_0)) * CFrame.Angles(-1.5707963267948966, 0, 0) + v29, 0.75);
end;
v10._bobbleStruggle = function(v30, v31) --[[ Line: 115 ]] --[[ Name: _bobbleStruggle ]]
    -- upvalues: v7 (copy)
    local l_Model_2 = v30.Model;
    if not v30.FishCaughtClock then
        return;
    else
        local v33 = os.clock() - v30.FishCaughtClock;
        local v34 = (Vector3.new(math.noise(v33 * v30.PathSeed.X), 0, math.noise(v33 * v30.PathSeed.Z)) * 35 + v30.Pull) * v31 + v30.Push;
        local v35 = workspace:Raycast(l_Model_2.Position, v34 * 5, v7);
        v30.Pull = v30.Pull:Lerp(Vector3.new(0, 0, 0, 0), v31);
        v30.Push = v30.Push:Lerp(Vector3.new(0, 0, 0, 0), v31);
        if v35 then
            v30.Push = Vector3.new(0, 1, 0, 0):Cross(CFrame.new(Vector3.new(0, 0, 0, 0), v35.Normal).RightVector) * 0.1;
            return;
        else
            local v36 = Vector3.new(0, 1, 0, 0) * _G.getWavePosition(l_Model_2.Position) + l_Model_2.Position * Vector3.new(1, 0, 1, 0) + v34;
            l_Model_2.CFrame = l_Model_2.CFrame - l_Model_2.Position + v36;
            return;
        end;
    end;
end;
v10._update = function(v37, v38) --[[ Line: 134 ]] --[[ Name: _update ]]
    if not v37.Client.Debounce then
        return;
    elseif not v37.Landed then
        v37:_bobbleFall(v38);
        return;
    elseif not v37.Client.FishCaught then
        v37:_bobbleIdle(v38);
        return;
    else
        v37:_bobbleStruggle(v38);
        return;
    end;
end;
v10.CleanConnections = function(v39) --[[ Line: 148 ]] --[[ Name: CleanConnections ]]
    if v39.Cleaner.Update then
        v39.Cleaner.Update:Disconnect();
        v39.Cleaner.Update = nil;
    end;
    if v39.Cleaner.Caught then
        v39.Cleaner.Caught:Disconnect();
        v39.Cleaner.Caught = nil;
    end;
end;
v10._main = function(v40) --[[ Line: 160 ]] --[[ Name: _main ]]
    -- upvalues: l_LocalPlayer_0 (copy), v5 (copy), v10 (copy), l_RunService_0 (copy)
    v40.Model.AssemblyLinearVelocity = v40.Velocity;
    local l_HumanoidRootPart_1 = l_LocalPlayer_0.Character.HumanoidRootPart;
    local l_Model_3 = v40.Model;
    local l_Position_0 = l_Model_3.Position;
    local function _(v44) --[[ Line: 167 ]] --[[ Name: Lerp ]]
        -- upvalues: l_LocalPlayer_0 (ref), l_Position_0 (ref), l_Model_3 (copy), l_HumanoidRootPart_1 (copy)
        if l_LocalPlayer_0.Character.Humanoid.SeatPart == nil then
            l_Position_0 = l_Position_0:Lerp(l_Model_3.Position, v44);
            l_HumanoidRootPart_1.CFrame = CFrame.new(l_HumanoidRootPart_1.Position, (Vector3.new(l_Position_0.X, l_HumanoidRootPart_1.Position.Y, l_Position_0.Z)));
        end;
    end;
    local function v47(v46) --[[ Line: 175 ]] --[[ Name: Update ]]
        -- upvalues: v40 (copy), l_LocalPlayer_0 (ref), l_Position_0 (ref), l_Model_3 (copy), l_HumanoidRootPart_1 (copy)
        if not v40.Client.Debounce then
            return;
        else
            v40:_update(v46);
            if l_LocalPlayer_0.Character.Humanoid.SeatPart == nil then
                l_Position_0 = l_Position_0:Lerp(l_Model_3.Position, v46);
                l_HumanoidRootPart_1.CFrame = CFrame.new(l_HumanoidRootPart_1.Position, (Vector3.new(l_Position_0.X, l_HumanoidRootPart_1.Position.Y, l_Position_0.Z)));
            end;
            return;
        end;
    end;
    local function v49() --[[ Line: 181 ]] --[[ Name: FishCaught ]]
        -- upvalues: v40 (copy), v5 (ref), v10 (ref)
        local l_Attribute_0 = v40.Model:GetAttribute("Caught");
        if l_Attribute_0 then
            v40.FishCaughtClock = os.clock();
            v40.PathSeed = v5:NextUnitVector():Abs();
            v40.BobbleCFrame = v10.CFrame;
            v40.Client:_fishCaught();
        else
            v40.Client:_stop("Reel");
        end;
        v40.Client.FishCaught = l_Attribute_0;
        print("caught");
    end;
    v40.Cleaner.Update = l_RunService_0.Heartbeat:Connect(v47);
    v40.Cleaner.Caught = v40.Model:GetAttributeChangedSignal("Caught"):Connect(v49);
end;
v10.Destroy = function(v50) --[[ Line: 204 ]] --[[ Name: Destroy ]]
    v50.Cleaner:Destroy();
    v50.Client.FishCaught = nil;
    warn("bobble destroyed!");
    setmetatable(v50, nil);
end;
return v10;