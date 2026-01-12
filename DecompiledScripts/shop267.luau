local v0 = game.ReplicatedStorage:WaitForChild("UGCAssets", 600);
if not v0 then
    return;
else
    repeat
        task.wait(0.1);
    until script.Parent.Enabled == true;
    local v1 = require(game.ReplicatedStorage.Modules.Module3D);
    local l_ScrollingFrame_0 = script.Parent.Frame.Frame.ScrollingFrame;
    local v3 = {};
    local _ = require(game.ReplicatedStorage.Modules.MEnterLeave);
    weldAttachments = function(v5, v6) --[[ Line: 15 ]] --[[ Name: weldAttachments ]]
        local l_Weld_0 = Instance.new("Weld");
        l_Weld_0.Part0 = v5.Parent;
        l_Weld_0.Part1 = v6.Parent;
        l_Weld_0.C0 = v5.CFrame;
        l_Weld_0.C1 = v6.CFrame;
        l_Weld_0.Parent = v5.Parent;
        return l_Weld_0;
    end;
    local function _(v8, v9, v10, v11, v12, v13) --[[ Line: 25 ]] --[[ Name: buildWeld ]]
        local l_Weld_1 = Instance.new("Weld");
        l_Weld_1.Name = v8;
        l_Weld_1.Part0 = v10;
        l_Weld_1.Part1 = v11;
        l_Weld_1.C0 = v12;
        l_Weld_1.C1 = v13;
        l_Weld_1.Parent = v9;
        return l_Weld_1;
    end;
    local function v16(v17, v18) --[[ Line: 36 ]] --[[ Name: findFirstMatchingAttachment ]]
        -- upvalues: v16 (copy)
        for _, v20 in pairs(v17:GetChildren()) do
            if v20:IsA("Attachment") and v20.Name == v18 then
                return v20;
            elseif not v20:IsA("Accoutrement") and not v20:IsA("Tool") then
                local v21 = v16(v20, v18);
                if v21 then
                    return v21;
                end;
            end;
        end;
    end;
    addAccoutrement = function(v22, v23) --[[ Line: 49 ]] --[[ Name: addAccoutrement ]]
        -- upvalues: v16 (copy)
        v23.Parent = v22;
        local l_Handle_0 = v23:FindFirstChild("Handle");
        if l_Handle_0 then
            local l_Attachment_0 = l_Handle_0:FindFirstChildOfClass("Attachment");
            if l_Attachment_0 then
                local v26 = v16(v22, l_Attachment_0.Name);
                if v26 then
                    weldAttachments(v26, l_Attachment_0);
                    return;
                end;
            else
                local l_Head_0 = v22:FindFirstChild("Head");
                if l_Head_0 then
                    local v28 = CFrame.new(0, 0.5, 0);
                    local l_AttachmentPoint_0 = v23.AttachmentPoint;
                    local l_Weld_2 = Instance.new("Weld");
                    l_Weld_2.Name = "HeadWeld";
                    l_Weld_2.Part0 = l_Head_0;
                    l_Weld_2.Part1 = l_Handle_0;
                    l_Weld_2.C0 = v28;
                    l_Weld_2.C1 = l_AttachmentPoint_0;
                    l_Weld_2.Parent = l_Head_0;
                end;
            end;
        end;
    end;
    (function() --[[ Line: 70 ]] --[[ Name: clear ]]
        -- upvalues: l_ScrollingFrame_0 (copy)
        local l_l_ScrollingFrame_0_Children_0 = l_ScrollingFrame_0:GetChildren();
        for v32 = 1, #l_l_ScrollingFrame_0_Children_0 do
            if l_l_ScrollingFrame_0_Children_0[v32]:IsA("ImageButton") then
                l_l_ScrollingFrame_0_Children_0[v32]:Destroy();
            end;
        end;
    end)();
    local l_HumanoidModelFromUserId_0 = game.Players:CreateHumanoidModelFromUserId(game.Players.LocalPlayer.UserId);
    local _ = l_HumanoidModelFromUserId_0:WaitForChild("Humanoid");
    l_HumanoidModelFromUserId_0.Humanoid.EvaluateStateMachine = false;
    l_HumanoidModelFromUserId_0.PrimaryPart.Anchored = true;
    l_HumanoidModelFromUserId_0:WaitForChild("Animate"):Destroy();
    local function v39(v35, v36) --[[ Line: 87 ]] --[[ Name: cleanHats ]]
        local l_v35_Children_0 = v35:GetChildren();
        for v38 = 1, #l_v35_Children_0 do
            if l_v35_Children_0[v38]:IsA("Accessory") and l_v35_Children_0[v38].AccessoryType == v36.AccessoryType and l_v35_Children_0[v38] ~= v36 then
                l_v35_Children_0[v38]:Destroy();
            end;
        end;
    end;
    local _ = l_ScrollingFrame_0.UIGridLayout;
    local function v47() --[[ Line: 99 ]] --[[ Name: updateCanvas ]]
        -- upvalues: l_ScrollingFrame_0 (copy)
        local v41 = Vector2.new(0.025, 0.165);
        local v42 = Vector2.new(0.4, 0.4);
        local l_l_ScrollingFrame_0_0 = l_ScrollingFrame_0;
        local l_UIGridLayout_1 = l_l_ScrollingFrame_0_0.UIGridLayout;
        local v45 = v42 * l_l_ScrollingFrame_0_0.AbsoluteSize;
        local v46 = v41 * l_l_ScrollingFrame_0_0.AbsoluteSize;
        v46 = UDim2.new(0, v46.X, 0, v46.Y);
        v45 = UDim2.new(0, v45.X, 0, v45.Y);
        if l_ScrollingFrame_0:IsA("ScrollingFrame") then
            l_UIGridLayout_1.CellPadding = v46;
            l_UIGridLayout_1.CellSize = v45;
            l_l_ScrollingFrame_0_0.CanvasSize = UDim2.new(0, l_UIGridLayout_1.AbsoluteContentSize.X, 0, l_UIGridLayout_1.AbsoluteContentSize.Y + 50);
        end;
    end;
    v47();
    game["Run Service"].Heartbeat:Connect(function(_) --[[ Line: 118 ]]
        -- upvalues: v3 (copy), v47 (copy)
        if script.Parent.Enabled == false then
            for _, v50 in pairs(v3) do
                v50.Visible = false;
            end;
            return;
        else
            for _, v52 in pairs(v3) do
                v52.Visible = true;
            end;
            local v53 = CFrame.Angles(0, tick() % 6.283185307179586, 0) * CFrame.Angles(-0.03490658503988659, 0, 0);
            v47();
            for v54, _ in pairs(v3) do
                v54:SetCFrame(v53);
            end;
            return;
        end;
    end);
    local l_v0_Children_0 = v0:GetChildren();
    for v57 = 1, #l_v0_Children_0 do
        task.spawn(function() --[[ Line: 139 ]]
            -- upvalues: l_v0_Children_0 (copy), v57 (copy), l_HumanoidModelFromUserId_0 (copy), v39 (copy), v1 (copy), l_ScrollingFrame_0 (copy), v3 (copy)
            local v58 = l_v0_Children_0[v57];
            local l_status_0, l_result_0 = pcall(game:GetService("MarketplaceService").PlayerOwnsAsset, game:GetService("MarketplaceService"), game.Players.LocalPlayer, v58:GetAttribute("ID"));
            if l_status_0 == true and l_result_0 == true then
                return;
            else
                if script.Parent.Enabled == false then
                    repeat
                        task.wait(0.1);
                    until script.Parent.Enabled == true;
                end;
                local v61 = script.Temp:Clone();
                local v62 = v58:Clone();
                local v63 = l_HumanoidModelFromUserId_0:Clone();
                addAccoutrement(v63, v62);
                v39(v63, v62);
                v63.Parent = game.Workspace;
                task.delay(0.1, function() --[[ Line: 159 ]]
                    -- upvalues: v1 (ref), v61 (copy), v63 (copy), v58 (copy), l_ScrollingFrame_0 (ref), v3 (ref), v62 (copy)
                    local v64 = v1:Attach3D(v61.Frame, v63);
                    v64:SetDepthMultiplier(1.5);
                    v64.Camera.FieldOfView = 70;
                    v64:SetActive(true);
                    v64:SetCFrame(CFrame.new(0, 0, 0) * CFrame.Angles(0, 3.141592653589793, 0));
                    local v65 = v61.Frame:WaitForChild("ViewportFrame", 1);
                    if v65 then
                        v65.ZIndex = 15;
                        v65.BackgroundColor3 = Color3.fromRGB(79, 79, 79);
                    end;
                    v61.Price.Text = v58:GetAttribute("Price") .. " ROBUX";
                    v61.Name = v58.Name;
                    v61.itemName.Text = v58.Name;
                    v61.Parent = l_ScrollingFrame_0;
                    v61.MouseEnter:Connect(function() --[[ Line: 176 ]]
                        -- upvalues: v61 (ref)
                        v61.itemName.Visible = true;
                    end);
                    v61.MouseLeave:Connect(function() --[[ Line: 180 ]]
                        -- upvalues: v61 (ref)
                        v61.itemName.Visible = false;
                    end);
                    v3[v64] = v61;
                    v61.Buy.MouseButton1Down:Connect(function() --[[ Line: 186 ]]
                        -- upvalues: v62 (ref), v61 (ref)
                        game:GetService("MarketplaceService"):PromptPurchase(game.Players.LocalPlayer, v62:GetAttribute("ID"));
                        _G.circleclick:Activate(v61);
                    end);
                end);
                return;
            end;
        end);
        task.wait(0.1);
    end;
    return;
end;