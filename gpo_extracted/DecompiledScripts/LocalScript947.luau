local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local _ = game:GetService("TweenService");
local l_HttpService_0 = game:GetService("HttpService");
local l_Players_0 = game:GetService("Players");
local l_Children_0 = game.ReplicatedStorage.Assets.Buildables:GetChildren();
local v5 = require(l_ReplicatedStorage_0.Modules.Module3D);
local v6 = {};
local l_l_ReplicatedStorage_0_FirstChild_0 = l_ReplicatedStorage_0:FindFirstChild("Stats" .. l_Players_0.LocalPlayer.Name);
local l_remote_0 = script.Parent.Parent:WaitForChild("remote");
local v9 = {
    Important = -1, 
    Damage = 0, 
    Buildings = 100, 
    Walls = 200, 
    Misc = 300
};
for v10 = 1, #l_Children_0 do
    local v11 = l_Children_0[v10]:Clone();
    local v12 = script.Frame:Clone();
    local v13 = v11:GetAttribute("woodCost") or 0;
    local l_Name_0 = v11.Name;
    local v15 = v5:Attach3D(v12.Display, v11);
    v15:SetDepthMultiplier(1);
    v15.Camera.FieldOfView = 30;
    v15.Visible = true;
    v15:SetCFrame(CFrame.Angles(-0.7853981633974483, 0, 0));
    local l_ViewportFrame_0 = v12.Display:FindFirstChild("ViewportFrame");
    if l_ViewportFrame_0 then
        l_ViewportFrame_0.ZIndex = 5;
        l_ViewportFrame_0.BackgroundColor3 = Color3.fromRGB(79, 79, 79);
    end;
    v12.LayoutOrder = (v9[v11:GetAttribute("Catagory") or "Misc"] or 300) + (v11:GetAttribute("displayOrder") or 0);
    v12.Cost.Text = v13;
    v12.Name = l_Name_0;
    v12.Parent = script.Parent.ScrollingFrame;
    local l_UIStroke_0 = v12.UIStroke;
    l_UIStroke_0.Enabled = false;
    table.insert(v6, {
        button = v12, 
        stroke = l_UIStroke_0, 
        model = v11, 
        name = l_Name_0, 
        cost = v13
    });
    v12.MouseButton1Click:Connect(function() --[[ Line: 58 ]]
        -- upvalues: l_Players_0 (copy), l_Name_0 (copy), v6 (copy), l_UIStroke_0 (copy), l_remote_0 (copy)
        if l_Players_0.LocalPlayer.Character and l_Players_0.LocalPlayer.Character.PrimaryPart and l_Players_0.LocalPlayer.Character.PrimaryPart.Anchored == true then
            return;
        else
            _G.planktype = l_Name_0;
            for _, v19 in ipairs(v6) do
                v19.stroke.Enabled = false;
            end;
            l_UIStroke_0.Enabled = true;
            if l_remote_0 and l_remote_0.Value then
                l_remote_0.Value:FireServer(l_Name_0);
            end;
            return;
        end;
    end);
end;
if _G.planktype then
    for _, v21 in ipairs(v6) do
        if v21.name == _G.planktype then
            v21.stroke.Enabled = true;
        end;
    end;
end;
while true do
    if l_l_ReplicatedStorage_0_FirstChild_0 and l_l_ReplicatedStorage_0_FirstChild_0.Inventory.Inventory.Value then
        local _ = l_HttpService_0:JSONDecode(l_l_ReplicatedStorage_0_FirstChild_0.Inventory.Inventory.Value);
        for v23 = 1, #v6 do
            local v24 = v6[v23];
            if (_G.CheckItemAmmount(l_Players_0.LocalPlayer, "Wooden Plank") or 0) < v24.cost then
                v24.button.ImageTransparency = 0.5;
                v24.button.Cost.TextColor3 = Color3.fromRGB(255, 100, 100);
            else
                v24.button.ImageTransparency = 0;
                v24.button.Cost.TextColor3 = Color3.fromRGB(0, 255, 0);
            end;
        end;
        local v25 = _G.CheckItemAmmount(l_Players_0.LocalPlayer, "Wooden Plank");
        script.Parent.TextFrames.PlankCount.Text = "Wooden Planks: " .. v25;
    end;
    task.wait(0.1);
end;