local l_Position_0 = script.Parent.Frame.Frame.Position;
local l_Position_1 = script.Parent.TextLabel.TextLabel.Position;
local l_Size_0 = script.Parent.TextLabel2.Frame.Size;
script.Parent.TextLabel2.Frame.Size = UDim2.new(0, 0, script.Parent.TextLabel2.Frame.Size.Y.Scale, 0);
script.Parent.TextLabel2.Frame.Position = UDim2.new(0.5, 0, 1, 0);
script.Parent.Frame.Frame.Position = UDim2.new(0, 0, -1, 0);
script.Parent.TextLabel.TextLabel.Position = UDim2.new(0, 0, 1, 0);
script.Parent.TextLabel2.Frame:TweenSizeAndPosition(l_Size_0, UDim2.new(0, 0, 1, 0), "Out", "Quad", 0.25, true);
task.wait(0.25);
script.Parent.TextLabel.TextLabel:TweenPosition(l_Position_1, "Out", "Quad", 0.25, true);
task.wait(0.25);
script.Parent.Frame.Frame:TweenPosition(l_Position_0, "Out", "Quad", 0.25, true);
local v3 = TweenInfo.new(0.25, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, false, 0);
local function v8() --[[ Line: 17 ]] --[[ Name: clearothers ]]
    -- upvalues: v3 (copy)
    local l_Children_0 = script.Parent.Frame.Frame:GetChildren();
    for v5 = 1, #l_Children_0 do
        if l_Children_0[v5]:IsA("Frame") and l_Children_0[v5].Name ~= _G.balltype then
            local v6 = {
                TextColor3 = Color3.fromRGB(255, 255, 255)
            };
            game:GetService("TweenService"):Create(l_Children_0[v5].TextButton, v3, v6):Play();
        elseif l_Children_0[v5]:IsA("Frame") then
            local v7 = {
                TextColor3 = Color3.fromRGB(89, 171, 227)
            };
            game:GetService("TweenService"):Create(l_Children_0[v5].TextButton, v3, v7):Play();
        end;
    end;
end;
v8();
local v9 = {};
local l_Children_1 = script.Parent.Frame.Frame:GetChildren();
for v11 = 1, #l_Children_1 do
    if l_Children_1[v11]:IsA("Frame") then
        table.insert(v9, l_Children_1[v11]);
        l_Children_1[v11].TextButton.MouseButton1Click:Connect(function() --[[ Line: 41 ]]
            -- upvalues: l_Children_1 (copy), v11 (copy), v8 (copy)
            _G.balltype = l_Children_1[v11].Name;
            v8();
        end);
    end;
end;
local l_FirstChild_0 = game.ReplicatedStorage:FindFirstChild("Stats" .. game.Players.LocalPlayer.Name);
local function v19(v13, v14) --[[ Line: 49 ]] --[[ Name: itemammount ]]
    local v15 = 0;
    local l_FirstChild_1 = game.ReplicatedStorage:FindFirstChild("Stats" .. v13.Name);
    for v17, v18 in (game:GetService("HttpService"):JSONDecode(l_FirstChild_1.Inventory.Inventory.Value)) do
        if v17 == v14 then
            v15 = v18;
        end;
    end;
    return v15;
end;
while true do
    task.wait();
    pcall(function() --[[ Line: 66 ]]
        -- upvalues: l_FirstChild_0 (copy), v9 (copy), v19 (copy)
        local _ = game:GetService("HttpService"):JSONDecode(l_FirstChild_0.Inventory.Inventory.Value);
        for v21 = 1, #v9 do
            local v22 = v9[v21].Name .. " Cannonball";
            local v23 = v19(game.Players.LocalPlayer, v22);
            v9[v21].ammount.Text = "x" .. v23;
            if v23 <= 0 then
                v9[v21].Visible = false;
                if _G.balltype == v9[v21].Name then
                    _G.balltype = "";
                end;
            else
                v9[v21].Visible = true;
            end;
        end;
    end);
    local l_Character_0 = game.Players.LocalPlayer.Character;
    if l_Character_0 and l_Character_0:FindFirstChild("Humanoid") and l_Character_0.Humanoid.SeatPart == nil then
        pcall(function() --[[ Line: 84 ]]
            script.Parent:Destroy();
        end);
    end;
end;