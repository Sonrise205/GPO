local l_Frame_0 = script.Parent.Frame.Frame;
local l_Position_0 = l_Frame_0.Position;
local l_Position_1 = script.Parent.TextLabel.TextLabel.Position;
local l_Size_0 = script.Parent.TextLabel2.Frame.Size;
script.Parent.TextLabel2.Frame.Size = UDim2.new(0, 0, script.Parent.TextLabel2.Frame.Size.Y.Scale, 0);
script.Parent.TextLabel2.Frame.Position = UDim2.new(0.5, 0, 1, 0);
script.Parent.Frame.Frame.Position = UDim2.new(0, 0, -1, 0);
script.Parent.TextLabel.TextLabel.Position = UDim2.new(0, 0, 1, 0);
task.spawn(function() --[[ Line: 11 ]]
    -- upvalues: l_Size_0 (copy), l_Position_1 (copy), l_Position_0 (copy)
    script.Parent.TextLabel2.Frame:TweenSizeAndPosition(l_Size_0, UDim2.new(0, 0, 1, 0), "Out", "Quad", 0.25, true);
    task.wait(0.25);
    script.Parent.TextLabel.TextLabel:TweenPosition(l_Position_1, "Out", "Quad", 0.25, true);
    task.wait(0.25);
    script.Parent.Frame.Frame:TweenPosition(l_Position_0, "Out", "Quad", 0.25, true);
end);
local v4 = {
    Bush = 0, 
    ["Small Shack"] = 4, 
    ["Big Shack"] = 5, 
    ["Watch Tower"] = 6, 
    ["Wooden Spikes"] = 2, 
    ["Wooden Wall"] = 1, 
    ["Spike Trap"] = 7, 
    ["Wooden Door Wall"] = 3, 
    ["Wooden Ladder"] = 3, 
    ["Spike Turret"] = 8
};
local l_Attribute_0 = script.Parent:GetAttribute("Buildables");
if l_Attribute_0 then
    l_Attribute_0 = game:GetService("HttpService"):JSONDecode(l_Attribute_0);
    for v6, v7 in pairs(l_Attribute_0) do
        local v8 = script.Template:Clone();
        v8.Name = v6;
        v8.TextButton.Text = v6;
        v8.ammount.Text = v7 .. " Wood";
        v8.Parent = l_Frame_0;
        if v6 == "Campfire" then
            v8.LayoutOrder = -1;
        elseif v4[v6] then
            v8.LayoutOrder = v4[v6];
        end;
    end;
end;
local v9 = TweenInfo.new(0.25, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, false, 0);
local function v14() --[[ Line: 55 ]] --[[ Name: clearothers ]]
    -- upvalues: v9 (copy)
    local l_Children_0 = script.Parent.Frame.Frame:GetChildren();
    for v11 = 1, #l_Children_0 do
        if l_Children_0[v11]:IsA("Frame") and l_Children_0[v11].Name ~= _G.planktype then
            local v12 = {
                TextColor3 = Color3.fromRGB(255, 255, 255)
            };
            game:GetService("TweenService"):Create(l_Children_0[v11].TextButton, v9, v12):Play();
        elseif l_Children_0[v11]:IsA("Frame") then
            local v13 = {
                TextColor3 = Color3.fromRGB(89, 171, 227)
            };
            game:GetService("TweenService"):Create(l_Children_0[v11].TextButton, v9, v13):Play();
        end;
    end;
end;
v14();
local v15 = {};
local l_l_Frame_0_Children_0 = l_Frame_0:GetChildren();
for v17 = 1, #l_l_Frame_0_Children_0 do
    if l_l_Frame_0_Children_0[v17]:IsA("Frame") then
        table.insert(v15, l_l_Frame_0_Children_0[v17]);
        l_l_Frame_0_Children_0[v17].TextButton.MouseButton1Click:Connect(function() --[[ Line: 83 ]]
            -- upvalues: l_l_Frame_0_Children_0 (copy), v17 (copy), v14 (copy)
            if game.Players.LocalPlayer.Character.PrimaryPart.Anchored == true then
                return;
            else
                _G.planktype = l_l_Frame_0_Children_0[v17].Name;
                pcall(function() --[[ Line: 88 ]]
                    -- upvalues: l_l_Frame_0_Children_0 (ref), v17 (ref)
                    script.Parent.remote.Value:FireServer(l_l_Frame_0_Children_0[v17].Name);
                end);
                v14();
                return;
            end;
        end);
    end;
end;
local l_FirstChild_0 = game.ReplicatedStorage:FindFirstChild("Stats" .. game.Players.LocalPlayer.Name);
local function v25(v19, v20) --[[ Line: 97 ]] --[[ Name: itemammount ]]
    local v21 = 0;
    local l_FirstChild_1 = game.ReplicatedStorage:FindFirstChild("Stats" .. v19.Name);
    for v23, v24 in (game:GetService("HttpService"):JSONDecode(l_FirstChild_1.Inventory.Inventory.Value)) do
        if v23 == v20 then
            v21 = v24;
        end;
    end;
    return v21;
end;
while true do
    local _ = game:GetService("HttpService"):JSONDecode(l_FirstChild_0.Inventory.Inventory.Value);
    for v27 = 1, #v15 do
        if v15[v27].Name == "Wooden" then
            local v28 = v15[v27].Name .. " Plank";
            local v29 = v25(game.Players.LocalPlayer, v28);
            v15[v27].ammount.Text = "x" .. v29;
            if v29 <= 0 then
                v15[v27].Visible = false;
                if _G.planktype == v15[v27].Name then
                    _G.planktype = "";
                end;
            else
                v15[v27].Visible = true;
            end;
        end;
    end;
    script.Parent.TextLabel.TextLabel.Text = "Wooden Planks: " .. _G.CheckItemAmmount(game.Players.LocalPlayer, "Wooden Plank");
    task.wait(0.1);
end;