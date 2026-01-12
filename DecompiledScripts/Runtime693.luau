local l_Parent_0 = script.Parent;
local v1 = nil;
local v2 = nil;
local v3 = nil;
local v4 = nil;
local v5 = false;
local v6 = {};
local l_game_Service_0 = game:FindService("Players");
local v8 = l_game_Service_0.LocalPlayer or l_game_Service_0.PlayerAdded:Wait();
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local function _(v10) --[[ Line: 14 ]] --[[ Name: c ]]
    -- upvalues: v6 (copy)
    table.insert(v6, v10);
end;
local _ = function() --[[ Line: 18 ]] --[[ Name: cleanup ]]
    -- upvalues: v6 (copy)
    for _, v13 in v6 do
        v13:Disconnect();
    end;
end;
local v15 = nil;
v15 = l_Parent_0:BindToMessage("Setup", function(v16, v17, v18) --[[ Line: 25 ]]
    -- upvalues: v1 (ref), v2 (ref), v3 (ref), v4 (ref), v5 (ref), v15 (ref)
    v1 = v16;
    v2 = v17;
    v3 = v18;
    v4 = require(v18);
    v5 = true;
    v15:Disconnect();
end);
repeat
    task.wait();
until v5;
local l_CollectionService_0 = game:GetService("CollectionService");
local l_RunService_0 = game:GetService("RunService");
local v21 = v4.new();
local l_Dependencies_0 = v3.Dependencies;
local _ = require(l_Dependencies_0.Debug.DebugUi);
local _ = nil;
local _ = require(l_Dependencies_0.Config);
local v26 = require(l_Dependencies_0.Utilities);
local l_OverlayEvent_0 = v3:WaitForChild("OverlayEvent");
local v28 = l_ReplicatedStorage_0:WaitForChild("Stats" .. game.Players.LocalPlayer.Name, 600);
if not v28 then
    return;
else
    local l_AnimatedHats_0 = v28:WaitForChild("Settings"):WaitForChild("AnimatedHats");
    local v30 = false;
    local v31 = false;
    local _ = {
        Begin = function(...) --[[ Line: 62 ]] --[[ Name: Begin ]]
            -- upvalues: l_OverlayEvent_0 (copy)
            l_OverlayEvent_0:Fire("Begin", ...);
        end, 
        End = function(...) --[[ Line: 65 ]] --[[ Name: End ]]
            -- upvalues: l_OverlayEvent_0 (copy)
            l_OverlayEvent_0:Fire("End", ...);
        end, 
        Text = function(...) --[[ Line: 68 ]] --[[ Name: Text ]]
            -- upvalues: l_OverlayEvent_0 (copy)
            l_OverlayEvent_0:Fire("Text", ...);
        end
    };
    shared.FrameCounter = 0;
    l_Parent_0.Name = ("%* - %*"):format(v1.Name, v21.ID);
    local l_Character_0 = v8.Character;
    v30 = v1:IsDescendantOf(l_Character_0);
    v21:LoadObject(v1);
    for _, v35 in v2 do
        v21:LoadRawCollider(v35[1], v35[2]);
    end;
    local _ = nil;
    table.insert(v6, (l_CollectionService_0:GetInstanceAddedSignal("SmartCollider"):Connect(function(v37) --[[ Line: 122 ]]
        -- upvalues: v1 (ref), v26 (copy), v21 (copy)
        if not v37:IsA("BasePart") then
            return;
        else
            local l_v37_Attribute_0 = v37:GetAttribute("ColliderKey");
            local l_v1_Attribute_0 = v1:GetAttribute("ColliderKey");
            if tostring(l_v37_Attribute_0) ~= tostring(l_v1_Attribute_0) then
                return;
            else
                local v40 = v26.GetCollider(v37);
                v21:LoadRawCollider(v40, v37);
                return;
            end;
        end;
    end)));
    table.insert(v6, (l_Parent_0:BindToMessage("Destroy", function() --[[ Line: 139 ]]
        -- upvalues: v31 (ref)
        v31 = true;
    end)));
    local v41 = false;
    table.insert(v6, (l_RunService_0.Heartbeat:ConnectParallel(function(v42) --[[ Line: 145 ]]
        -- upvalues: l_AnimatedHats_0 (copy), v30 (ref), v41 (ref), v21 (copy), v31 (ref), v6 (copy)
        local l_shared_0 = shared;
        l_shared_0.FrameCounter = l_shared_0.FrameCounter + 1;
        if shared.FrameCounter > 131072 then
            shared.FrameCounter = 0;
        end;
        if l_AnimatedHats_0.Value == false or v30 == false then
            if v41 == false then
                v41 = true;
                v21:SkipUpdate();
            end;
            return;
        else
            v41 = false;
            v21:StepBoneTrees(v42);
            if v21.ShouldDestroy or v31 then
                v21:Destroy();
                task.synchronize();
                for _, v45 in v6 do
                    v45:Disconnect();
                end;
                return;
            else
                return;
            end;
        end;
    end)));
    table.insert(v6, (v1.Destroying:Once(function() --[[ Line: 196 ]]
        -- upvalues: v31 (ref)
        v31 = true;
    end)));
    return;
end;