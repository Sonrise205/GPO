local l_Parent_0 = script.Parent;
local v1 = nil;
local v2 = nil;
local v3 = nil;
local v4 = nil;
local v5 = false;
local v6 = {};
local function _(v7) --[[ Line: 11 ]] --[[ Name: c ]]
    -- upvalues: v6 (copy)
    table.insert(v6, v7);
end;
local _ = function() --[[ Line: 15 ]] --[[ Name: cleanup ]]
    -- upvalues: v6 (copy)
    for _, v10 in v6 do
        v10:Disconnect();
    end;
end;
local v12 = nil;
v12 = l_Parent_0:BindToMessage("Setup", function(v13, v14, v15) --[[ Line: 22 ]]
    -- upvalues: v1 (ref), v2 (ref), v3 (ref), v4 (ref), v5 (ref), v12 (ref)
    v1 = v13;
    v2 = v14;
    v3 = v15;
    v4 = require(v15);
    v5 = true;
    v12:Disconnect();
end);
repeat
    task.wait();
until v5;
local l_CollectionService_0 = game:GetService("CollectionService");
local l_RunService_0 = game:GetService("RunService");
local v18 = v4.new();
local l_Dependencies_0 = v3.Dependencies;
local v20 = require(l_Dependencies_0.DebugUi);
local v21 = nil;
local v22 = require(l_Dependencies_0.Config);
local v23 = require(l_Dependencies_0.Utilities);
local v24 = l_RunService_0:IsStudio() or v22.ALLOW_LIVE_GAME_DEBUG;
local l_OverlayEvent_0 = v3:WaitForChild("OverlayEvent");
local v26 = false;
local v27 = {
    Begin = function(...) --[[ Line: 52 ]] --[[ Name: Begin ]]
        -- upvalues: l_OverlayEvent_0 (copy)
        l_OverlayEvent_0:Fire("Begin", ...);
    end, 
    End = function(...) --[[ Line: 55 ]] --[[ Name: End ]]
        -- upvalues: l_OverlayEvent_0 (copy)
        l_OverlayEvent_0:Fire("End", ...);
    end, 
    Text = function(...) --[[ Line: 58 ]] --[[ Name: Text ]]
        -- upvalues: l_OverlayEvent_0 (copy)
        l_OverlayEvent_0:Fire("Text", ...);
    end
};
shared.FrameCounter = 0;
if v24 then
    v21 = require(l_Dependencies_0.Iris);
    if not v21.HasInit() then
        v21 = v21.Init();
    end;
end;
l_Parent_0.Name = ("%* - %*"):format(v1:GetFullName(), v18.ID);
v18:LoadObject(v1);
local l_Character_0 = game.Players.LocalPlayer.Character;
if v1:IsDescendantOf(l_Character_0) == false then
    v18.calculateCollisions = false;
else
    for _, v30 in v2 do
        v18:LoadRawCollider(v30[1], v30[2]);
    end;
    table.insert(v6, (l_CollectionService_0:GetInstanceAddedSignal("SmartCollider"):Connect(function(v31) --[[ Line: 84 ]]
        -- upvalues: v1 (ref), v23 (copy), v18 (copy)
        if not v31:IsA("BasePart") then
            return;
        else
            local l_v31_Attribute_0 = v31:GetAttribute("ColliderKey");
            local l_v1_Attribute_0 = v1:GetAttribute("ColliderKey");
            if tostring(l_v31_Attribute_0) ~= tostring(l_v1_Attribute_0) then
                return;
            else
                local v34 = v23.GetCollider(v31);
                v18:LoadRawCollider(v34, v31);
                return;
            end;
        end;
    end)));
end;
local v35 = nil;
if v24 then
    v35 = {
        DRAW_BONE = v21.State(false), 
        DRAW_PHYSICAL_BONE = v21.State(false), 
        DRAW_ROOT_PART = v21.State(false), 
        DRAW_BOUNDING_BOX = v21.State(false), 
        DRAW_AXIS_LIMITS = v21.State(false), 
        DRAW_COLLIDERS = v21.State(false), 
        DRAW_COLLIDER_INFLUENCE = v21.State(false), 
        DRAW_COLLIDER_AWAKE = v21.State(false), 
        DRAW_COLLIDER_BROADPHASE = v21.State(false), 
        DRAW_FILL_COLLIDERS = v21.State(false), 
        DRAW_CONTACTS = v21.State(false), 
        DRAW_ROTATION_LIMITS = v21.State(false), 
        DRAW_ACCELERATION_INFO = v21.State(false)
    };
end;
if v24 then
    v21:Connect(function() --[[ Line: 126 ]]
        -- upvalues: v1 (ref), v20 (copy), v21 (ref), v18 (copy), v35 (ref)
        if v1:GetAttribute("Debug") ~= nil then
            v20(v21, v18, v35);
        end;
    end);
end;
table.insert(v6, (l_Parent_0:BindToMessage("Destroy", function() --[[ Line: 135 ]]
    -- upvalues: v26 (ref)
    v26 = true;
end)));
local v36 = game.ReplicatedStorage:WaitForChild("Stats" .. game.Players.LocalPlayer.Name, 60);
if not v36 or v1:IsDescendantOf(workspace) == false then
    v26 = true;
end;
table.insert(v6, (v1.Destroying:Connect(function() --[[ Line: 145 ]]
    -- upvalues: v26 (ref)
    v26 = true;
end)));
table.insert(v6, (l_RunService_0.Heartbeat:ConnectParallel(function(v37) --[[ Line: 150 ]]
    -- upvalues: v26 (ref), v36 (copy), v1 (ref), v18 (copy), v6 (copy), l_Parent_0 (copy), v24 (copy), v35 (ref), v27 (copy)
    local l_shared_0 = shared;
    l_shared_0.FrameCounter = l_shared_0.FrameCounter + 1;
    if shared.FrameCounter > 131072 then
        shared.FrameCounter = 0;
    end;
    if v26 == false and (v36 and v36:FindFirstChild("Settings") and v36.Settings.AnimatedHats.Value == true or v36 == nil) and v1.Parent ~= nil then
        v18:StepBoneTrees(v37);
    end;
    if v1.Parent == nil then
        v26 = true;
    end;
    if v18.ShouldDestroy or v26 then
        v18:Destroy();
        task.synchronize();
        for _, v40 in v6 do
            v40:Disconnect();
        end;
        l_Parent_0:Destroy();
        return;
    else
        if v24 and v1:GetAttribute("Debug") ~= nil then
            task.synchronize();
            v18:DrawDebug(v35.DRAW_COLLIDERS:get(), v35.DRAW_CONTACTS:get(), v35.DRAW_PHYSICAL_BONE:get(), v35.DRAW_BONE:get(), v35.DRAW_AXIS_LIMITS:get(), v35.DRAW_ROOT_PART:get(), v35.DRAW_FILL_COLLIDERS:get(), v35.DRAW_COLLIDER_INFLUENCE:get(), v35.DRAW_COLLIDER_AWAKE:get(), v35.DRAW_COLLIDER_BROADPHASE:get(), v35.DRAW_BOUNDING_BOX:get(), v35.DRAW_ROTATION_LIMITS:get(), v35.DRAW_ACCELERATION_INFO:get());
            v18:DrawOverlay(v27);
        end;
        return;
    end;
end)));