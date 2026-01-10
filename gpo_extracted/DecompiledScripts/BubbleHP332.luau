local l_Players_0 = game:GetService("Players");
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
local l_PlayerGui_0 = l_LocalPlayer_0:WaitForChild("PlayerGui");
local l_Modules_0 = l_ReplicatedStorage_0:WaitForChild("Modules");
local v5 = require(l_Modules_0.Trove);
local l_Shared_0 = l_Modules_0.Shared;
local _ = require(l_Shared_0.GameUtils);
local _ = l_ReplicatedStorage_0:WaitForChild("Events");
local v9 = {
    Initialized = false
};
v9.Initialize = function(_) --[[ Line: 18 ]] --[[ Name: Initialize ]]
    -- upvalues: v9 (copy), l_PlayerGui_0 (copy), v5 (copy), l_LocalPlayer_0 (copy)
    if v9.Initialized then
        return;
    else
        local l_Main_0 = l_PlayerGui_0:WaitForChild("BubbleHP", 360):WaitForChild("Main");
        local l_Bubble_0 = l_Main_0:WaitForChild("Bubble");
        local v13 = v5.new();
        local v14 = nil;
        local function v21(v15) --[[ Line: 31 ]] --[[ Name: CharacterAdded ]]
            -- upvalues: v13 (copy), v14 (ref), l_Main_0 (copy), l_Bubble_0 (copy)
            v13:Clean();
            v14 = v15;
            local v16 = nil;
            l_Main_0.Visible = false;
            local function v20(v17) --[[ Line: 39 ]] --[[ Name: ChildAdded ]]
                -- upvalues: v14 (ref), v15 (copy), v16 (ref), l_Main_0 (ref), l_Bubble_0 (ref)
                if v17.Name == "coatBubble" and v14 == v15 and v16 == nil then
                    l_Main_0.Visible = false;
                    l_Bubble_0.Size = UDim2.new(1, 0, 1, 0);
                    v16 = v17;
                    task.spawn(function() --[[ Line: 46 ]]
                        -- upvalues: l_Main_0 (ref), v14 (ref), v15 (ref), v16 (ref), v17 (copy), l_Bubble_0 (ref)
                        while true do
                            l_Main_0.Visible = true;
                            local _ = task.wait(0.2);
                            if v14 == v15 and v16 ~= nil then
                                local v19 = v17.Health.Value / v17.Health.MaxValue;
                                l_Bubble_0.Size = UDim2.new(v19, 0, v19, 0);
                                if v19 <= 0 then
                                    break;
                                end;
                            else
                                break;
                            end;
                        end;
                        v16 = nil;
                        l_Main_0.Visible = false;
                    end);
                end;
            end;
            v13:Add(v15.ChildAdded:Connect(v20));
        end;
        local v22 = l_LocalPlayer_0.Character or l_LocalPlayer_0.CharacterAdded:Wait();
        v13:Clean();
        v14 = v22;
        local v23 = nil;
        l_Main_0.Visible = false;
        do
            local l_v23_0 = v23;
            local function v28(v25) --[[ Line: 39 ]] --[[ Name: ChildAdded ]]
                -- upvalues: v14 (ref), v22 (copy), l_v23_0 (ref), l_Main_0 (copy), l_Bubble_0 (copy)
                if v25.Name == "coatBubble" and v14 == v22 and l_v23_0 == nil then
                    l_Main_0.Visible = false;
                    l_Bubble_0.Size = UDim2.new(1, 0, 1, 0);
                    l_v23_0 = v25;
                    task.spawn(function() --[[ Line: 46 ]]
                        -- upvalues: l_Main_0 (ref), v14 (ref), v22 (ref), l_v23_0 (ref), v25 (copy), l_Bubble_0 (ref)
                        while true do
                            l_Main_0.Visible = true;
                            local _ = task.wait(0.2);
                            if v14 == v22 and l_v23_0 ~= nil then
                                local v27 = v25.Health.Value / v25.Health.MaxValue;
                                l_Bubble_0.Size = UDim2.new(v27, 0, v27, 0);
                                if v27 <= 0 then
                                    break;
                                end;
                            else
                                break;
                            end;
                        end;
                        l_v23_0 = nil;
                        l_Main_0.Visible = false;
                    end);
                end;
            end;
            v13:Add(v22.ChildAdded:Connect(v28));
        end;
        l_LocalPlayer_0.CharacterAdded:Connect(v21);
        v9.Initialized = true;
        return;
    end;
end;
return v9;