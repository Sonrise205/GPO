local _ = game:GetService("ReplicatedStorage");
local l_Players_0 = game:GetService("Players");
local l_UserInputService_0 = game:GetService("UserInputService");
local l_ReplicatedStorage_1 = game:GetService("ReplicatedStorage");
local v4 = require(l_ReplicatedStorage_1.Modules.Shared.GameUtils);
local l_Modules_0 = l_ReplicatedStorage_1.Modules;
local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
local v7 = require(l_Modules_0.ContextActionService);
local v8 = setmetatable({}, (require(script.Parent.Shared)));
v8.__index = v8;
local v9 = v4.GetStatsFolder(l_LocalPlayer_0);
v8.new = function(_) --[[ Line: 22 ]] --[[ Name: new ]]
    -- upvalues: v8 (copy), v7 (copy), l_UserInputService_0 (copy)
    local v11 = setmetatable({}, v8);
    local _, v13 = v7:GetMobileUI();
    local v14 = v13:WaitForChild("DynamicThumbstickFrame", 2) or v13:WaitForChild("ThumbstickFrame");
    local function v17(v15, v16) --[[ Line: 28 ]] --[[ Name: InputBegan ]]
        -- upvalues: v11 (copy)
        if v16 then
            return;
        elseif v15.UserInputType ~= Enum.UserInputType.Touch then
            return;
        else
            v11:Activated();
            return;
        end;
    end;
    local function v19(v18) --[[ Line: 34 ]] --[[ Name: InputEnded ]]
        -- upvalues: v11 (copy)
        if v18.UserInputType ~= Enum.UserInputType.Touch then
            return;
        else
            v11:Deactivated();
            return;
        end;
    end;
    v11.Thread = nil;
    v11.RunRadius = 25;
    v14.InputBegan:Connect(v17);
    l_UserInputService_0.InputEnded:Connect(v19);
    return v11;
end;
v8.Activated = function(v20) --[[ Line: 48 ]] --[[ Name: Activated ]]
    -- upvalues: l_LocalPlayer_0 (copy), l_UserInputService_0 (copy), v9 (copy)
    v20:Deactivated();
    local l_InputCallbacks_0 = require(l_LocalPlayer_0.Backpack:WaitForChild("InputCallbacks"));
    local l_l_UserInputService_0_MouseLocation_0 = l_UserInputService_0:GetMouseLocation();
    local function v25() --[[ Line: 54 ]] --[[ Name: Holding ]]
        -- upvalues: l_UserInputService_0 (ref), l_l_UserInputService_0_MouseLocation_0 (copy), v9 (ref), v20 (copy), l_InputCallbacks_0 (copy)
        while task.wait() do
            local l_Magnitude_0 = (l_UserInputService_0:GetMouseLocation() - l_l_UserInputService_0_MouseLocation_0).Magnitude;
            local v24 = v9.Settings.AutoRun.Value == true;
            if (v20.RunRadius < l_Magnitude_0 or v24 == true) and _G.running == false then
                _G.running = true;
                l_InputCallbacks_0.Callbacks.Run.HoldingRun = true;
                task.spawn(l_InputCallbacks_0.Callbacks.Run.PC_Activate, l_InputCallbacks_0.Callbacks.Run);
            elseif l_Magnitude_0 < v20.RunRadius and v24 == false then
                _G.running = false;
                l_InputCallbacks_0.Callbacks.Run.HoldingRun = false;
            end;
        end;
    end;
    v20.Thread = task.spawn(v25);
end;
v8.Deactivated = function(v26) --[[ Line: 75 ]] --[[ Name: Deactivated ]]
    if v26.Thread and coroutine.status(v26.Thread) ~= "dead" then
        task.cancel(v26.Thread);
        v26.Thread = nil;
    end;
end;
return v8;