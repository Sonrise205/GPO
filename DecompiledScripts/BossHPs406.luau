local l_Players_0 = game:GetService("Players");
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_TweenService_0 = game:GetService("TweenService");
local l_PlayerGui_0 = l_Players_0.LocalPlayer:WaitForChild("PlayerGui");
local l_Modules_0 = l_ReplicatedStorage_0:WaitForChild("Modules");
local v5 = require(l_Modules_0.Trove);
local l_Shared_0 = l_Modules_0.Shared;
local _ = require(l_Shared_0.GameUtils);
local _ = l_ReplicatedStorage_0:WaitForChild("Events");
local l_NPCCircle_0 = l_ReplicatedStorage_0.Assets.NPCCircle;
local v10 = {
    Initialized = false
};
local function _(v11, v12) --[[ Line: 21 ]]
    v12 = math.pow(10, v12 or 0);
    v11 = v11 * v12;
    return (if v11 >= 0 then math.floor(v11 + 0.5) else math.ceil(v11 - 0.5)) / v12;
end;
v10.Initialize = function(v14) --[[ Line: 35 ]] --[[ Name: Initialize ]]
    -- upvalues: v10 (copy), l_ReplicatedStorage_0 (copy), l_PlayerGui_0 (copy), v5 (copy), l_TweenService_0 (copy), l_Players_0 (copy), l_NPCCircle_0 (copy)
    if v10.Initialized then
        return;
    else
        local _ = v14:GetStatsFolder();
        local l_Bosses_0 = l_ReplicatedStorage_0:WaitForChild("Replication"):WaitForChild("Bosses");
        local l_Main_0 = l_PlayerGui_0:WaitForChild("BossHP", 360):WaitForChild("Main");
        local v18 = TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out);
        local v19 = TweenInfo.new(0.15, Enum.EasingStyle.Quad, Enum.EasingDirection.Out);
        local v20 = nil;
        local v21 = {};
        local v22 = {};
        local function v58(v23) --[[ Line: 55 ]] --[[ Name: BossAdded ]]
            -- upvalues: v21 (copy), v5 (ref), l_Bosses_0 (copy), l_Main_0 (copy), l_TweenService_0 (ref), v18 (copy), v22 (copy), v19 (copy), l_Players_0 (ref), v20 (ref), l_NPCCircle_0 (ref)
            if v21[v23] ~= nil then
                return;
            else
                v21[v23] = {
                    Trove = v5.new()
                };
                local l_Value_0 = v23.Value;
                while l_Value_0 == nil do
                    l_Value_0 = v23.Value;
                    if l_Value_0 == nil and v23.Parent == l_Bosses_0 then
                        task.wait(1);
                    else
                        break;
                    end;
                end;
                if l_Value_0 == nil then
                    return;
                else
                    local l_Parent_0 = l_Value_0.Parent;
                    repeat
                        task.wait();
                    until #l_Parent_0:GetChildren() > 1 and l_Parent_0.PrimaryPart ~= nil;
                    if v21[v23] == nil then
                        v21[v23] = {
                            Trove = v5.new()
                        };
                    end;
                    if l_Parent_0 == nil then
                        return;
                    else
                        local l_Head_0 = l_Parent_0:FindFirstChild("Head");
                        local v27 = script.HealthBar:Clone();
                        v27.Name = l_Parent_0.Name;
                        v27.Parent = l_Main_0;
                        v27.Visible = false;
                        v21[v23].Trove:Add(v27);
                        v21[v23].HealthBar = v27;
                        v21[v23].Marker = l_Parent_0:FindFirstChild("questMarker");
                        local l_DamageFrame_0 = v27.DamageFrame;
                        local l_List_0 = l_DamageFrame_0.List;
                        local l_NPCName_0 = v27.NPCName;
                        local l_Health_0 = v27.Health;
                        l_NPCName_0.Text = l_Parent_0.Name;
                        l_NPCName_0.Shadow.Text = l_Parent_0.Name;
                        local function v38(v32, v33, v34) --[[ Line: 107 ]] --[[ Name: UpdateBarFill ]]
                            -- upvalues: l_Health_0 (copy), v27 (copy), l_TweenService_0 (ref), v18 (ref), v22 (ref), v19 (ref)
                            v33 = math.max(math.floor(v33), 0);
                            v34 = math.floor(v34);
                            local v35 = math.clamp(v33 / v34, 0, 1);
                            local l_Fill_0 = v32.Fill;
                            local l_FillLag_0 = v32.FillLag;
                            l_Health_0.Text = ("%* / %*"):format(v33, v34);
                            l_Health_0.Shadow.Text = l_Health_0.Text;
                            if v27.Visible == false then
                                l_Fill_0.Size = UDim2.new(v35, 0, 1, 0);
                                l_FillLag_0.Size = UDim2.new(v35, 0, 1, 0);
                                return;
                            else
                                l_TweenService_0:Create(l_Fill_0, v18, {
                                    Size = UDim2.new(v35, 0, 1, 0)
                                }):Play();
                                if v22[v32] and coroutine.status(v22[v32]) ~= "dead" then
                                    task.defer(task.cancel, v22[v32]);
                                end;
                                v22[v32] = task.delay(0.35, function() --[[ Line: 139 ]]
                                    -- upvalues: l_TweenService_0 (ref), l_FillLag_0 (copy), v19 (ref), v35 (copy)
                                    l_TweenService_0:Create(l_FillLag_0, v19, {
                                        Size = UDim2.new(v35, 0, 1, 0)
                                    }):Play();
                                end);
                                return;
                            end;
                        end;
                        local function v52() --[[ Line: 150 ]] --[[ Name: UpdateDamageList ]]
                            -- upvalues: l_Parent_0 (copy), v27 (copy), l_DamageFrame_0 (copy), l_Players_0 (ref), l_List_0 (copy), l_Value_0 (ref)
                            local l_PlayerDMG_0 = l_Parent_0:FindFirstChild("PlayerDMG");
                            if l_PlayerDMG_0 and v27.Visible == true then
                                local l_l_PlayerDMG_0_Children_0 = l_PlayerDMG_0:GetChildren();
                                if #l_l_PlayerDMG_0_Children_0 <= 0 then
                                    l_DamageFrame_0.Visible = false;
                                    return;
                                else
                                    l_DamageFrame_0.Visible = true;
                                    for _, v42 in ipairs(l_l_PlayerDMG_0_Children_0) do
                                        local l_l_Players_0_FirstChild_0 = l_Players_0:FindFirstChild(v42.Name);
                                        if l_l_Players_0_FirstChild_0 then
                                            local l_l_List_0_FirstChild_0 = l_List_0:FindFirstChild(l_l_Players_0_FirstChild_0.Name);
                                            if l_l_List_0_FirstChild_0 == nil then
                                                l_l_List_0_FirstChild_0 = script.PlayerTemplate:Clone();
                                                l_l_List_0_FirstChild_0.Name = l_l_Players_0_FirstChild_0.Name;
                                                l_l_List_0_FirstChild_0.Parent = l_List_0;
                                            end;
                                            local v45 = "%*: %*%%";
                                            local l_Name_0 = l_l_Players_0_FirstChild_0.Name;
                                            local v47 = v42.Value / l_Value_0.MaxHealth * 100;
                                            local v48 = math.pow(10, 2 or 0);
                                            v47 = v47 * v48;
                                            local v49 = v45:format(l_Name_0, (if v47 >= 0 then math.floor(v47 + 0.5) else math.ceil(v47 - 0.5)) / v48);
                                            l_l_List_0_FirstChild_0.Text = v49;
                                            l_l_List_0_FirstChild_0.Shadow.Text = v49;
                                            l_l_List_0_FirstChild_0.LayoutOrder = 100 - v42.Value / l_Value_0.MaxHealth * 100;
                                            if v42.Value / l_Value_0.MaxHealth >= 0.05 then
                                                l_l_List_0_FirstChild_0.TextColor3 = Color3.fromRGB(170, 255, 127);
                                            end;
                                        end;
                                    end;
                                    for _, v51 in ipairs(l_List_0:GetChildren()) do
                                        if v51:IsA("PlayerDamageDisplay") and l_List_0:FindFirstChild(v51.Name) == nil then
                                            v51:Destroy();
                                        end;
                                    end;
                                    return;
                                end;
                            else
                                l_DamageFrame_0.Visible = false;
                                return;
                            end;
                        end;
                        local function v53() --[[ Line: 194 ]] --[[ Name: OnHealthUpdated ]]
                            -- upvalues: l_Value_0 (ref), v20 (ref), v27 (copy), v38 (copy), v52 (copy)
                            if l_Value_0.Health <= 0 then
                                if v20 == v27 then
                                    v27.Visible = false;
                                    v20 = nil;
                                end;
                                return;
                            else
                                v38(v27, l_Value_0.Health, l_Value_0.MaxHealth);
                                v52();
                                return;
                            end;
                        end;
                        if v21[v23].Marker == nil then
                            local v54 = l_NPCCircle_0:Clone();
                            v54.Name = "questMarker";
                            local v55 = nil;
                            local l_l_Parent_0_Descendants_0 = l_Parent_0:GetDescendants();
                            for v57 = 1, #l_l_Parent_0_Descendants_0 do
                                if l_l_Parent_0_Descendants_0[v57]:IsA("BillboardGui") and l_l_Parent_0_Descendants_0[v57].Parent.Name ~= "HumanoidRootPart" then
                                    v55 = l_l_Parent_0_Descendants_0[v57];
                                    break;
                                end;
                            end;
                            v54.Parent = l_Parent_0;
                            if v55 ~= nil then
                                v54.Adornee = v55.Parent;
                                v54.StudsOffsetWorldSpace = v55.StudsOffsetWorldSpace;
                            else
                                v54.Adornee = l_Head_0;
                            end;
                            v21[v23].Marker = v54;
                            v21[v23].Marker.Enabled = false;
                        else
                            v21[v23].Marker.Enabled = false;
                        end;
                        if l_Value_0.Health <= 0 then
                            if v20 == v27 then
                                v27.Visible = false;
                                v20 = nil;
                            end;
                        else
                            v38(v27, l_Value_0.Health, l_Value_0.MaxHealth);
                            v52();
                        end;
                        v21[v23].Trove:Add(l_Value_0.HealthChanged:Connect(v53));
                        v21[v23].Trove:Add(v27:GetPropertyChangedSignal("Visible"):Connect(function() --[[ Line: 239 ]]
                            -- upvalues: v21 (ref), v23 (copy), v27 (copy), v52 (copy)
                            if v21[v23].Marker ~= nil then
                                v21[v23].Marker.Enabled = v27.Visible;
                                if v27.Visible == true then
                                    v52();
                                end;
                            end;
                        end));
                        return;
                    end;
                end;
            end;
        end;
        local function v60(v59) --[[ Line: 249 ]] --[[ Name: BossRemoved ]]
            -- upvalues: v21 (copy)
            if v21[v59] then
                v21[v59].Trove:Destroy();
                v21[v59] = nil;
            end;
        end;
        l_Bosses_0.ChildAdded:Connect(v58);
        l_Bosses_0.ChildRemoved:Connect(v60);
        for _, v62 in ipairs(l_Bosses_0:GetChildren()) do
            task.spawn(v58, v62);
        end;
        local _ = function(v63, v64) --[[ Line: 262 ]] --[[ Name: IsPlayerLookingAt ]]
            local l_CurrentCamera_0 = workspace.CurrentCamera;
            local l_LookVector_0 = l_CurrentCamera_0.CFrame.LookVector;
            local l_PrimaryPart_0 = v63.PrimaryPart;
            local v68 = l_LookVector_0:Dot((l_PrimaryPart_0.Position - l_CurrentCamera_0.CFrame.Position).Unit);
            local v69 = math.cos(v64);
            local _, v71 = l_CurrentCamera_0:WorldToScreenPoint(l_PrimaryPart_0.Position);
            if v71 == true then
                return true;
            else
                return v69 <= v68;
            end;
        end;
        task.spawn(function() --[[ Line: 280 ]]
            -- upvalues: v21 (copy), v20 (ref)
            while true do
                local _ = task.wait();
                local v74 = {};
                for v75, _ in pairs(v21) do
                    local l_CurrentCamera_1 = workspace.CurrentCamera;
                    local l_Value_1 = v75.Value;
                    local v79 = l_Value_1 and l_Value_1.Parent;
                    local v80 = v75:GetAttribute("viewRange") or 100;
                    if v79 ~= nil and v79.PrimaryPart ~= nil and v79.Parent == workspace.NPCs and l_Value_1.Health > 0 and l_Value_1:GetAttribute("notNPC") == nil and v75 and v79 and l_Value_1 then
                        local l_Magnitude_0 = (l_CurrentCamera_1.CFrame.Position - v79.PrimaryPart.Position).Magnitude;
                        if l_Magnitude_0 <= v80 then
                            table.insert(v74, {
                                Boss = v79, 
                                Distance = l_Magnitude_0, 
                                BossObject = v75
                            });
                        end;
                    end;
                end;
                table.sort(v74, function(v82, v83) --[[ Line: 324 ]]
                    return v82.Distance < v83.Distance;
                end);
                local v84 = false;
                for _, v86 in ipairs(v74) do
                    local l_Boss_0 = v86.Boss;
                    local l_CurrentCamera_2 = workspace.CurrentCamera;
                    local l_LookVector_1 = l_CurrentCamera_2.CFrame.LookVector;
                    local l_PrimaryPart_1 = l_Boss_0.PrimaryPart;
                    local v91 = l_LookVector_1:Dot((l_PrimaryPart_1.Position - l_CurrentCamera_2.CFrame.Position).Unit);
                    local _, v93 = l_CurrentCamera_2:WorldToScreenPoint(l_PrimaryPart_1.Position);
                    if (v93 == true or v91 >= -0.2836910914865273) == true then
                        v84 = true;
                        if v20 ~= nil and v20.Parent ~= nil then
                            v20.Visible = false;
                            v20 = nil;
                        end;
                        l_Boss_0 = v21[v86.BossObject];
                        if l_Boss_0 then
                            v20 = l_Boss_0.HealthBar;
                            if v20 then
                                v20.Visible = true;
                                break;
                            else
                                break;
                            end;
                        else
                            break;
                        end;
                    end;
                end;
                if v84 == false and v20 ~= nil and v20.Parent ~= nil then
                    v20.Visible = false;
                    v20 = nil;
                end;
            end;
        end);
        v10.Initialized = true;
        return;
    end;
end;
return v10;