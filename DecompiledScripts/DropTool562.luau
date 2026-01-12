local v0 = {};
v0.__index = v0;
local l_LocalPlayer_0 = game.Players.LocalPlayer;
local _ = game:GetService("UserInputService");
local v3 = l_LocalPlayer_0.Character or l_LocalPlayer_0.CharacterAdded:Wait();
local v4 = {};
local v5 = nil;
local v6 = false;
v0.new = function(v7) --[[ Line: 12 ]] --[[ Name: new ]]
    -- upvalues: v0 (copy)
    local v8 = setmetatable({}, v0);
    v8.Handler = v7;
    v8.Utils = v7.Utils;
    v7.carrycd = false;
    return v8;
end;
v0.PC_Activate = function(_) --[[ Line: 22 ]] --[[ Name: PC_Activate ]]
    -- upvalues: v5 (ref), v3 (copy), v6 (ref)
    local _ = require(game.ReplicatedStorage.Modules.ScriptSet);
    if v5 and v3.Parent ~= workspace.Effects and v3.Parent ~= workspace.Ragdolls then
        v6 = true;
        local l_Tool_0 = v3:FindFirstChildWhichIsA("Tool");
        local v12 = false;
        do
            local l_v12_0 = v12;
            if l_Tool_0 == v5 then
                task.defer(function() --[[ Line: 31 ]]
                    -- upvalues: v3 (ref), l_Tool_0 (copy), l_v12_0 (ref)
                    if v3.RightHand:WaitForChild("RightGrip", 3) == nil then
                        return;
                    else
                        local v14 = l_Tool_0:WaitForChild("Handle", 5);
                        if v14 == nil then
                            return;
                        else
                            task.spawn(function() --[[ Line: 40 ]]
                                -- upvalues: v3 (ref), v14 (copy), l_v12_0 (ref)
                                repeat
                                    local l_Children_0 = v3.RightHand:GetChildren();
                                    for v16 = 1, #l_Children_0 do
                                        if l_Children_0[v16]:IsA("Weld") and l_Children_0[v16].Name == "RightGrip" and l_Children_0[v16].Part1 == v14 then
                                            l_Children_0[v16]:Destroy();
                                        end;
                                    end;
                                    task.wait();
                                until l_v12_0 == true;
                            end);
                            return;
                        end;
                    end;
                end);
            end;
            local l_status_0, l_result_0 = pcall(function() --[[ Line: 53 ]]
                -- upvalues: v5 (ref)
                game.ReplicatedStorage.Events.Tools:InvokeServer("drop", v5);
            end);
            l_v12_0 = true;
            if not l_status_0 then
                warn("error " .. l_result_0);
            end;
            v5 = nil;
            v6 = false;
        end;
    end;
end;
local function _(v19) --[[ Line: 66 ]] --[[ Name: toolCD ]]
    -- upvalues: v4 (copy), v3 (copy)
    local v20 = 0;
    v4[v19] = v19.AncestryChanged:Connect(function() --[[ Line: 68 ]]
        -- upvalues: v19 (copy), v3 (ref), v20 (ref)
        if v19.Parent == v3 and tick() - v20 <= 0.1 then
            task.defer(function() --[[ Line: 70 ]]
                -- upvalues: v3 (ref)
                v3.Humanoid:UnequipTools();
            end);
            v20 = tick();
            return;
        else
            v20 = tick();
            return;
        end;
    end);
end;
l_LocalPlayer_0.Backpack.ChildAdded:Connect(function(v22) --[[ Line: 80 ]]
    -- upvalues: v4 (copy), v3 (copy)
    if v22:IsA("Tool") and v4[v22] == nil then
        local v23 = 0;
        do
            local l_v23_0 = v23;
            v4[v22] = v22.AncestryChanged:Connect(function() --[[ Line: 68 ]]
                -- upvalues: v22 (copy), v3 (ref), l_v23_0 (ref)
                if v22.Parent == v3 and tick() - l_v23_0 <= 0.1 then
                    task.defer(function() --[[ Line: 70 ]]
                        -- upvalues: v3 (ref)
                        v3.Humanoid:UnequipTools();
                    end);
                    l_v23_0 = tick();
                    return;
                else
                    l_v23_0 = tick();
                    return;
                end;
            end);
        end;
    end;
end);
local l_Children_1 = l_LocalPlayer_0.Backpack:GetChildren();
for v26 = 1, #l_Children_1 do
    if l_Children_1[v26]:IsA("Tool") then
        local v27 = l_Children_1[v26];
        local v28 = 0;
        do
            local l_v28_0 = v28;
            v4[v27] = v27.AncestryChanged:Connect(function() --[[ Line: 68 ]]
                -- upvalues: v27 (copy), v3 (copy), l_v28_0 (ref)
                if v27.Parent == v3 and tick() - l_v28_0 <= 0.1 then
                    task.defer(function() --[[ Line: 70 ]]
                        -- upvalues: v3 (ref)
                        v3.Humanoid:UnequipTools();
                    end);
                    l_v28_0 = tick();
                    return;
                else
                    l_v28_0 = tick();
                    return;
                end;
            end);
        end;
    end;
end;
game["Run Service"].Heartbeat:Connect(function() --[[ Line: 95 ]]
    -- upvalues: v3 (copy), v5 (ref)
    local l_Tool_1 = v3:FindFirstChildWhichIsA("Tool");
    if l_Tool_1 ~= v5 then
        if l_Tool_1 and l_Tool_1:FindFirstChild("CanBeDropped") then
            v5 = l_Tool_1;
            return;
        else
            v5 = nil;
        end;
    end;
end);
v0.Mobile_Activate = v0.PC_Activate;
return v0;