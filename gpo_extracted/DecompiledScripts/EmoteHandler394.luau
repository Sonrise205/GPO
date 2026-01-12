local l_Players_0 = game:GetService("Players");
local l_TweenService_0 = game:GetService("TweenService");
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_HttpService_0 = game:GetService("HttpService");
local l_Modules_0 = l_ReplicatedStorage_0:WaitForChild("Modules");
local l_Shared_0 = l_Modules_0:WaitForChild("Shared");
local _ = l_Shared_0:WaitForChild("AnimationPacks");
local l_Client_0 = l_Modules_0.Client;
local l_UIUtils_0 = require(l_Client_0:WaitForChild("UIUtils"));
local l_Promises_0 = l_Shared_0.Promises;
local l_PromiseChild_0 = require(l_Promises_0:WaitForChild("PromiseChild"));
local l_Marketplace_0 = l_Shared_0.Marketplace;
local _ = require(l_Marketplace_0.MarketplaceUtils);
local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
local l_Emotes_0 = l_ReplicatedStorage_0.Events:WaitForChild("Emotes");
local l_Parent_0 = script.Parent;
local l_Wheel_0 = l_Parent_0:WaitForChild("Wheel");
local l_Selection_0 = l_Wheel_0:WaitForChild("Selection");
local l_Inventory_0 = l_Parent_0:WaitForChild("Inventory");
local l_List_0 = l_Inventory_0:WaitForChild("List");
local l_SearchBox_0 = l_Inventory_0:WaitForChild("SearchBox");
local v21 = require(l_Shared_0.EmoteUtils);
local v22 = require(l_Modules_0.Trove);
local v23 = {
    Pack1 = {
        LayoutOrder = 1, 
        Color = Color3.fromRGB(255, 206, 84)
    }, 
    Pack2 = {
        LayoutOrder = 2, 
        Color = Color3.fromRGB(79, 193, 233)
    }, 
    Pack3 = {
        LayoutOrder = 3, 
        Color = Color3.fromRGB(237, 85, 101)
    }, 
    Pack4 = {
        LayoutOrder = 4, 
        Color = Color3.fromRGB(252, 110, 81)
    }, 
    Pack5 = {
        LayoutOrder = 5, 
        Color = Color3.fromRGB(172, 146, 236)
    }, 
    Pack6 = {
        LayoutOrder = 6, 
        Color = Color3.fromRGB(160, 212, 104)
    }
};
local v24 = nil;
local v25 = nil;
local v26 = false;
local v27 = false;
local v28 = v22.new();
local function _() --[[ Line: 50 ]] --[[ Name: NormalState ]]
    -- upvalues: v26 (ref), l_Wheel_0 (copy), l_Inventory_0 (copy), v28 (copy)
    v26 = false;
    l_Wheel_0.Selection.Inventory.TextLabel.Text = "Edit Emotes";
    l_Inventory_0.Visible = false;
    v28:Destroy();
end;
local function v34(v30, v31) --[[ Line: 57 ]] --[[ Name: EditState ]]
    -- upvalues: v26 (ref), l_Wheel_0 (copy), l_Inventory_0 (copy), v28 (copy)
    v26 = true;
    l_Wheel_0.Selection.Inventory.TextLabel.Text = "Select a Emote";
    if v30 then
        l_Wheel_0.Selection.Inventory.TextLabel.Text = v30;
    end;
    l_Inventory_0.Visible = true;
    v28:Connect(game:GetService("UserInputService").InputBegan, function(v32, v33) --[[ Line: 67 ]]
        -- upvalues: v31 (copy), v26 (ref), l_Wheel_0 (ref), l_Inventory_0 (ref), v28 (ref)
        if v33 then
            return;
        else
            if v32.UserInputType == Enum.UserInputType.MouseButton1 or v32.UserInputType == Enum.UserInputType.Touch then
                if v31 then
                    v31();
                end;
                v26 = false;
                l_Wheel_0.Selection.Inventory.TextLabel.Text = "Edit Emotes";
                l_Inventory_0.Visible = false;
                v28:Destroy();
            end;
            return;
        end;
    end);
end;
local v35 = {};
local function v49(v36, v37) --[[ Line: 81 ]] --[[ Name: AddEmote ]]
    -- upvalues: v35 (copy), l_List_0 (copy), l_Inventory_0 (copy), v23 (copy), l_UIUtils_0 (copy), v24 (ref), v25 (ref), v34 (copy)
    if v35[v36.Name] ~= nil then
        return;
    else
        v35[v36.Name] = v36;
        local v38 = script.Template:Clone();
        v38.Name = v36.Name;
        v38.Parent = l_List_0;
        local l_Background_0 = v38.Background;
        local l_Middle_0 = l_Background_0.Middle;
        local l_Button_0 = v38.Button;
        local l_ViewportFrame_0 = v38.ViewportFrame;
        local l_Dummy_0 = l_ViewportFrame_0.WorldModel.Dummy;
        local l_Humanoid_0 = l_Dummy_0:WaitForChild("Humanoid");
        local l_Camera_0 = Instance.new("Camera");
        l_Camera_0.FieldOfView = 50;
        l_Camera_0.Parent = l_ViewportFrame_0;
        l_ViewportFrame_0.CurrentCamera = l_Camera_0;
        l_Camera_0.CFrame = l_Dummy_0.HumanoidRootPart.CFrame * CFrame.Angles(0, 3.141592653589793, 0) * CFrame.new(0, 0, 6.5);
        v38.Item.Text = v36.Name;
        local v46 = l_Humanoid_0:LoadAnimation(v36);
        v46.Looped = true;
        l_ViewportFrame_0.Parent = nil;
        l_Inventory_0:GetPropertyChangedSignal("Visible"):Connect(function() --[[ Line: 113 ]]
            -- upvalues: l_Inventory_0 (ref), v46 (copy), l_ViewportFrame_0 (copy), v38 (copy)
            if l_Inventory_0.Visible then
                v46:Play();
                l_ViewportFrame_0.Parent = v38;
                return;
            else
                v46:Stop();
                l_ViewportFrame_0.Parent = nil;
                return;
            end;
        end);
        local v47 = v23[v37];
        if v47 then
            l_Middle_0.ImageColor3 = v47.Color;
            v38.LayoutOrder = v47.LayoutOrder;
        else
            v38.LayoutOrder = 1000;
        end;
        l_Button_0.MouseButton1Click:Connect(function() --[[ Line: 131 ]]
            -- upvalues: l_UIUtils_0 (ref), l_Background_0 (copy), v24 (ref), v25 (ref), v38 (copy), v36 (copy), v34 (ref)
            l_UIUtils_0.ButtonEffect();
            local function v48() --[[ Line: 135 ]] --[[ Name: cancel ]]
                -- upvalues: l_Background_0 (ref), v24 (ref), v25 (ref)
                l_Background_0.BackgroundColor3 = script.Template.Background.BackgroundColor3;
                v24 = nil;
                v25 = nil;
            end;
            if v24 ~= nil then
                if v24 == v38 then
                    l_Background_0.BackgroundColor3 = script.Template.Background.BackgroundColor3;
                    v24 = nil;
                    v25 = nil;
                else
                    v24.Background.BackgroundColor3 = script.Template.Background.BackgroundColor3;
                    l_Background_0.BackgroundColor3 = Color3.fromRGB(90, 142, 233);
                    v25 = v36;
                    v24 = v38;
                end;
            else
                v24 = v38;
                l_Background_0.BackgroundColor3 = Color3.fromRGB(90, 142, 233);
                v25 = v36;
            end;
            v34("Select Slot", v48);
            print(v36);
        end);
        return;
    end;
end;
local v50 = nil;
local v51 = {};
local function v52() --[[ Line: 178 ]] --[[ Name: LoadDataFolder ]]
    -- upvalues: l_PromiseChild_0 (copy), l_ReplicatedStorage_0 (copy), l_LocalPlayer_0 (copy), v50 (ref), l_HttpService_0 (copy), v35 (copy), v51 (copy), v49 (copy), v21 (copy), v52 (copy)
    l_PromiseChild_0(l_ReplicatedStorage_0, "Stats" .. l_LocalPlayer_0.Name):Then(function(v53) --[[ Line: 179 ]]
        -- upvalues: v50 (ref), l_HttpService_0 (ref), v35 (ref), v51 (ref), v49 (ref), v21 (ref)
        v50 = v53;
        local l_Emotes_1 = v50:WaitForChild("Emotes");
        local l_Equipped_0 = l_Emotes_1:WaitForChild("Equipped");
        local l_Owned_0 = l_Emotes_1:WaitForChild("Owned");
        local function v62() --[[ Line: 186 ]] --[[ Name: OnEquippedUpdated ]]
            -- upvalues: l_HttpService_0 (ref), l_Equipped_0 (copy), v35 (ref), v51 (ref)
            local v57 = l_HttpService_0:JSONDecode(l_Equipped_0.Value);
            for v58, v59 in pairs(v57) do
                local v60 = v35[v59];
                local v61 = v51[v58];
                if v60 and v61 then
                    v61.AnimationObject.Value = v60;
                end;
            end;
            print("decoded", v57);
        end;
        local function v67() --[[ Line: 201 ]] --[[ Name: OnOwnedUpdated ]]
            -- upvalues: l_HttpService_0 (ref), l_Owned_0 (copy), v35 (ref), v49 (ref), v21 (ref)
            local v63 = l_HttpService_0:JSONDecode(l_Owned_0.Value);
            for v64, v65 in pairs(v63) do
                if v35[v64] == nil then
                    local l_Animation_0 = Instance.new("Animation");
                    l_Animation_0.Name = v64;
                    l_Animation_0.AnimationId = v65;
                    v49(l_Animation_0, v21:GetAnimationData(v64).Pack or "");
                end;
            end;
        end;
        v67();
        l_Owned_0:GetPropertyChangedSignal("Value"):Connect(v67);
        v62();
    end):Catch(function(v68) --[[ Line: 222 ]]
        -- upvalues: v52 (ref)
        warn(v68);
        task.wait(1);
        v52();
    end);
end;
local _ = function() --[[ Line: 229 ]] --[[ Name: OpenWheel ]]
    -- upvalues: v50 (ref), l_Wheel_0 (copy), v26 (ref), l_Inventory_0 (copy), v28 (copy), v51 (copy)
    if v50 == nil then
        return;
    else
        l_Wheel_0.Visible = true;
        v26 = false;
        l_Wheel_0.Selection.Inventory.TextLabel.Text = "Edit Emotes";
        l_Inventory_0.Visible = false;
        v28:Destroy();
        for _, v70 in pairs(v51) do
            v70.Open();
        end;
        return;
    end;
end;
local _ = function() --[[ Line: 242 ]] --[[ Name: CloseWheel ]]
    -- upvalues: l_Inventory_0 (copy), v51 (copy), l_Wheel_0 (copy), v26 (ref), v28 (copy)
    l_Inventory_0.Visible = false;
    for _, v73 in pairs(v51) do
        v73.Close();
    end;
    l_Wheel_0.Visible = false;
    v26 = false;
    l_Wheel_0.Selection.Inventory.TextLabel.Text = "Edit Emotes";
    l_Inventory_0.Visible = false;
    v28:Destroy();
end;
local _ = function() --[[ Line: 254 ]] --[[ Name: InstantCloseWheel ]]
    -- upvalues: l_Inventory_0 (copy), v51 (copy), l_Wheel_0 (copy), v26 (ref), v28 (copy), v27 (ref)
    l_Inventory_0.Visible = false;
    for _, v76 in pairs(v51) do
        v76.Close();
    end;
    l_Wheel_0.Visible = false;
    v26 = false;
    l_Wheel_0.Selection.Inventory.TextLabel.Text = "Edit Emotes";
    l_Inventory_0.Visible = false;
    v28:Destroy();
    v27 = false;
end;
for v78 = 1, 6 do
    local v79 = l_Selection_0:WaitForChild("" .. v78);
    if v79 then
        local l_Button_1 = v79:WaitForChild("Button");
        local l_ViewportFrame_1 = v79:WaitForChild("ViewportFrame");
        local l_CurrentAnimation_0 = v79:WaitForChild("CurrentAnimation");
        local v83 = l_ViewportFrame_1.WorldModel.Dummy:Destroy();
        v83 = script.Template.ViewportFrame.WorldModel.Dummy:Clone();
        v83.Parent = l_ViewportFrame_1.WorldModel;
        local l_Humanoid_1 = v83:WaitForChild("Humanoid");
        local l_Camera_1 = Instance.new("Camera");
        l_Camera_1.FieldOfView = 50;
        l_Camera_1.Parent = l_ViewportFrame_1;
        l_ViewportFrame_1.BackgroundColor3 = Color3.fromRGB(0, 0, 0);
        l_ViewportFrame_1.CurrentCamera = l_Camera_1;
        l_Camera_1.CFrame = v83.HumanoidRootPart.CFrame * CFrame.Angles(0, 3.141592653589793, 0) * CFrame.new(0, 0, 7.5);
        local v86 = nil;
        do
            local l_v86_0 = v86;
            local function v89() --[[ Line: 283 ]] --[[ Name: updateAnimation ]]
                -- upvalues: l_v86_0 (ref), l_CurrentAnimation_0 (copy), l_Humanoid_1 (copy), v79 (copy)
                if l_v86_0 then
                    l_v86_0:Stop();
                    l_v86_0 = nil;
                end;
                local l_Value_0 = l_CurrentAnimation_0.Value;
                if l_Value_0 ~= nil and l_Value_0:IsA("Animation") then
                    l_v86_0 = l_Humanoid_1:LoadAnimation(l_Value_0);
                    l_v86_0.Looped = true;
                    l_v86_0:Play();
                    v79.emoteName.Text = l_CurrentAnimation_0.Value.Name;
                    return;
                else
                    v79.emoteName.Text = "None";
                    return;
                end;
            end;
            l_CurrentAnimation_0:GetPropertyChangedSignal("Value"):Connect(v89);
            v89();
            l_Button_1.MouseButton1Click:Connect(function() --[[ Line: 304 ]]
                -- upvalues: l_UIUtils_0 (copy), v26 (ref), v24 (ref), l_Emotes_0 (copy), v78 (copy), v25 (ref), v51 (copy), v79 (copy), v34 (copy), l_Inventory_0 (copy), l_Wheel_0 (copy), v28 (copy), v27 (ref), l_CurrentAnimation_0 (copy), l_LocalPlayer_0 (copy), v21 (copy)
                l_UIUtils_0.ButtonEffect();
                if v26 == true then
                    if v24 == nil then
                        return;
                    else
                        l_Emotes_0:FireServer({
                            Method = "UpdateEmoteSlot", 
                            Slot = "" .. v78, 
                            AnimName = v25.Name
                        });
                        v51[v79.Name].AnimationObject.Value = v25;
                        v25 = nil;
                        v24.Background.BackgroundColor3 = Color3.fromRGB(255, 255, 255);
                        v24 = nil;
                        v34();
                        return;
                    end;
                else
                    l_Inventory_0.Visible = false;
                    for _, v91 in pairs(v51) do
                        v91.Close();
                    end;
                    l_Wheel_0.Visible = false;
                    v26 = false;
                    l_Wheel_0.Selection.Inventory.TextLabel.Text = "Edit Emotes";
                    l_Inventory_0.Visible = false;
                    v28:Destroy();
                    v27 = false;
                    if l_CurrentAnimation_0.Value == nil then
                        return;
                    else
                        local _ = l_LocalPlayer_0.Character;
                        v21:PlayEmote(l_CurrentAnimation_0.Value.Name);
                        return;
                    end;
                end;
            end);
            local v93 = {
                AnimationObject = l_CurrentAnimation_0
            };
            l_ViewportFrame_1.Parent = nil;
            v93.Open = function() --[[ Line: 337 ]]
                -- upvalues: l_ViewportFrame_1 (copy), v79 (copy), l_TweenService_0 (copy)
                l_ViewportFrame_1.Parent = v79;
                v79.Size = UDim2.new(0, 0, 0, 0);
                l_TweenService_0:Create(v79, TweenInfo.new(0.25, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                    Size = UDim2.new(0.3, 0, 0.3, 0)
                }):Play();
            end;
            v93.Close = function() --[[ Line: 350 ]]
                -- upvalues: l_ViewportFrame_1 (copy), l_TweenService_0 (copy), v79 (copy)
                l_ViewportFrame_1.Parent = nil;
                l_TweenService_0:Create(v79, TweenInfo.new(0.25, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                    Size = UDim2.new(0, 0, 0, 0)
                }):Play();
            end;
            v93.InstantClose = function() --[[ Line: 361 ]]
                -- upvalues: v79 (copy)
                v79.Size = UDim2.new(0, 0, 0, 0);
            end;
            v51[v79.Name] = v93;
        end;
    end;
end;
v52();
l_Selection_0.Inventory.Button.MouseButton1Click:Connect(function() --[[ Line: 371 ]]
    -- upvalues: l_UIUtils_0 (copy), l_Inventory_0 (copy), v26 (ref), l_Wheel_0 (copy), v34 (copy)
    l_UIUtils_0.ButtonEffect();
    l_Inventory_0.Visible = not l_Inventory_0.Visible;
    v26 = l_Inventory_0.Visible;
    if v26 == false then
        l_Wheel_0.Selection.Inventory.TextLabel.Text = "Edit Emotes";
        return;
    else
        v34();
        return;
    end;
end);
local function v98() --[[ Line: 385 ]] --[[ Name: UpdateSearchList ]]
    -- upvalues: l_SearchBox_0 (copy), l_List_0 (copy)
    local l_Text_0 = l_SearchBox_0.Text;
    local v95 = string.lower(l_Text_0);
    for _, v97 in pairs(l_List_0:GetChildren()) do
        if v97:IsA("Frame") then
            v97.Visible = string.find(string.lower(v97.Name), v95) and true or false;
        end;
    end;
end;
l_SearchBox_0:GetPropertyChangedSignal("Text"):Connect(function() --[[ Line: 396 ]]
    -- upvalues: v98 (copy)
    v98();
end);
script.Parent.ToggleUI.Event:Connect(function() --[[ Line: 402 ]]
    -- upvalues: v27 (ref), l_Inventory_0 (copy), v51 (copy), l_Wheel_0 (copy), v26 (ref), v28 (copy), v50 (ref)
    if v27 then
        l_Inventory_0.Visible = false;
        for _, v100 in pairs(v51) do
            v100.Close();
        end;
        l_Wheel_0.Visible = false;
        v26 = false;
        l_Wheel_0.Selection.Inventory.TextLabel.Text = "Edit Emotes";
        l_Inventory_0.Visible = false;
        v28:Destroy();
    elseif v50 ~= nil then
        l_Wheel_0.Visible = true;
        v26 = false;
        l_Wheel_0.Selection.Inventory.TextLabel.Text = "Edit Emotes";
        l_Inventory_0.Visible = false;
        v28:Destroy();
        for _, v102 in pairs(v51) do
            v102.Open();
        end;
    end;
    v27 = not v27;
end);
game:GetService("UserInputService").InputBegan:Connect(function(v103, v104) --[[ Line: 414 ]]
    -- upvalues: v27 (ref), l_Inventory_0 (copy), v51 (copy), l_Wheel_0 (copy), v26 (ref), v28 (copy), v50 (ref)
    if v104 then
        return;
    else
        if v103.KeyCode == Enum.KeyCode.U then
            if v27 == true then
                l_Inventory_0.Visible = false;
                for _, v106 in pairs(v51) do
                    v106.Close();
                end;
                l_Wheel_0.Visible = false;
                v26 = false;
                l_Wheel_0.Selection.Inventory.TextLabel.Text = "Edit Emotes";
                l_Inventory_0.Visible = false;
                v28:Destroy();
                v27 = false;
                return;
            else
                if v50 ~= nil then
                    l_Wheel_0.Visible = true;
                    v26 = false;
                    l_Wheel_0.Selection.Inventory.TextLabel.Text = "Edit Emotes";
                    l_Inventory_0.Visible = false;
                    v28:Destroy();
                    for _, v108 in pairs(v51) do
                        v108.Open();
                    end;
                end;
                v27 = true;
            end;
        end;
        return;
    end;
end);