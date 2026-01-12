client = nil;
Pcall = nil;
Routine = nil;
service = nil;
gTable = nil;
return function(v0, v1) --[[ Line: 10 ]]
    if v1 then
        setfenv(1, v1);
    end;
    local v2 = service.New("ScreenGui");
    v2:SetAttribute("unhideable", true);
    local l_Mode_0 = v0.Mode;
    local v4 = client.UI.Register(v2, {
        Name = "Effect"
    });
    local _ = v4.BindEvent;
    client.UI.Remove("Effect", v2);
    v4:Ready();
    if l_Mode_0 == "Off" or not l_Mode_0 then
        v4:Destroy();
        return;
    elseif l_Mode_0 == "Pixelize" then
        local l_Frame_0 = Instance.new("Frame");
        l_Frame_0.Parent = v2;
        local l_CurrentCamera_0 = workspace.CurrentCamera;
        local v8 = {};
        local v9 = v0.Resolution or 20;
        local v10 = v0.Resolution or 20;
        local v11 = v0.Distance or 128;
        local function v18() --[[ Line: 37 ]] --[[ Name: renderScreen ]]
            -- upvalues: v8 (copy), l_CurrentCamera_0 (copy), v11 (copy)
            for _, v13 in v8 do
                local v14 = l_CurrentCamera_0:ScreenPointToRay(v13.X, v13.Y, 0);
                local v15 = workspace:Raycast(v14.Origin, v14.Direction * v11);
                if v15 then
                    local l_Instance_0 = v15.Instance;
                    local _ = v15.Position;
                    v13.Pixel.BackgroundColor3 = if l_Instance_0 and l_Instance_0.Transparency < 1 then l_Instance_0.BrickColor.Color else Color3.fromRGB(105, 170, 255);
                else
                    v13.Pixel.BackgroundColor3 = Color3.fromRGB(105, 170, 255);
                end;
            end;
        end;
        l_Frame_0.Size = UDim2.new(1, 0, 1, 40);
        l_Frame_0.Position = UDim2.new(0, 0, 0, -35);
        for v19 = 0, v2.AbsoluteSize.Y + 50, v9 do
            for v20 = 0, v2.AbsoluteSize.X + 30, v10 do
                table.insert(v8, {
                    Pixel = service.New("TextLabel", {
                        Parent = l_Frame_0, 
                        Text = "", 
                        BorderSizePixel = 0, 
                        Size = UDim2.fromOffset(v10, v9), 
                        Position = UDim2.fromOffset(v20 - v10 / 2, v19 - v9 / 2), 
                        BackgroundColor3 = Color3.fromRGB(105, 170, 255)
                    }), 
                    X = v20, 
                    Y = v19
                });
            end;
        end;
        while task.wait() and not v4.Destroyed and v2.Parent do
            if not v4.Destroyed and not v4.Active then
                task.wait(5);
            else
                v18();
            end;
        end;
        v4:Destroy();
        return;
    elseif l_Mode_0 == "FadeOut" then
        service.StarterGui:SetCoreGuiEnabled(Enum.CoreGuiType.All, false);
        service.UserInputService.MouseIconEnabled = false;
        for _, v22 in service.PlayerGui:GetChildren() do
            pcall(function() --[[ Line: 84 ]]
                -- upvalues: v22 (copy), v2 (copy)
                if v22 ~= v2 then
                    v22:Destroy();
                end;
            end);
        end;
        local v23 = service.New("BlurEffect", {
            Name = "Adonis_FadeOut_Blur", 
            Parent = service.Lighting, 
            Size = 0
        });
        local v24 = service.New("Frame", {
            Parent = v2, 
            BackgroundTransparency = 1, 
            BackgroundColor3 = Color3.new(0, 0, 0), 
            Size = UDim2.new(2, 0, 2, 0), 
            Position = UDim2.new(-0.5, 0, -0.5, 0)
        });
        for v25 = 1, 0, -0.01 do
            v24.BackgroundTransparency = v25;
            v23.Size = 56 * (1 - v25);
            task.wait(0.1);
        end;
        v24.BackgroundTransparency = 0;
        return;
    else
        if l_Mode_0 == "Trippy" then
            local _ = service.Player;
            local l_Frame_1 = Instance.new("Frame");
            l_Frame_1.BackgroundColor3 = Color3.new(0, 0, 0);
            l_Frame_1.BackgroundTransparency = 0;
            l_Frame_1.Size = UDim2.new(10, 0, 10, 0);
            l_Frame_1.Position = UDim2.new(-5, 0, -5, 0);
            l_Frame_1.ZIndex = 10;
            l_Frame_1.Parent = v2;
            while v2 and v2.Parent do
                task.wait(0.022727272727272728);
                l_Frame_1.BackgroundColor3 = Color3.new(math.random(255) / 255, math.random(255) / 255, math.random(255) / 255);
            end;
            if v2 then
                v2:Destroy();
                return;
            end;
        elseif l_Mode_0 == "Spooky" then
            local l_Frame_2 = Instance.new("Frame");
            l_Frame_2.BackgroundColor3 = Color3.new(0, 0, 0);
            l_Frame_2.Size = UDim2.new(1, 0, 1, 50);
            l_Frame_2.Position = UDim2.new(0, 0, 0, -50);
            l_Frame_2.Parent = v2;
            local l_ImageLabel_0 = Instance.new("ImageLabel");
            l_ImageLabel_0.Position = UDim2.new(0, 0, 0, 0);
            l_ImageLabel_0.Size = UDim2.new(1, 0, 1, 0);
            l_ImageLabel_0.BorderSizePixel = 0;
            l_ImageLabel_0.BackgroundColor3 = Color3.new(0, 0, 0);
            l_ImageLabel_0.Parent = l_Frame_2;
            local v30 = {
                299735022, 
                299735054, 
                299735082, 
                299735103, 
                299735133, 
                299735156, 
                299735177, 
                299735198, 
                299735219, 
                299735245, 
                299735269, 
                299735289, 
                299735304, 
                299735320, 
                299735332, 
                299735361, 
                299735379
            };
            local l_Sound_0 = Instance.new("Sound");
            l_Sound_0.SoundId = "rbxassetid://174270407";
            l_Sound_0.Looped = true;
            l_Sound_0.Parent = v2;
            l_Sound_0:Play();
            while v2 and v2.Parent do
                for v32 = 1, #v30 do
                    l_ImageLabel_0.Image = ("rbxassetid://%*"):format(v30[v32]);
                    task.wait(0.1);
                end;
            end;
            l_Sound_0:Stop();
            return;
        elseif l_Mode_0 == "lifeoftheparty" then
            local l_Frame_3 = Instance.new("Frame");
            l_Frame_3.BackgroundColor3 = Color3.new(0, 0, 0);
            l_Frame_3.Size = UDim2.new(1, 0, 1, 50);
            l_Frame_3.Position = UDim2.new(0, 0, 0, -50);
            l_Frame_3.Parent = v2;
            local l_ImageLabel_1 = Instance.new("ImageLabel");
            l_ImageLabel_1.Position = UDim2.new(0, 0, 0, 0);
            l_ImageLabel_1.Size = UDim2.new(1, 0, 1, 0);
            l_ImageLabel_1.BorderSizePixel = 0;
            l_ImageLabel_1.BackgroundColor3 = Color3.new(0, 0, 0);
            l_ImageLabel_1.Parent = l_Frame_3;
            local v35 = {
                299733203, 
                299733248, 
                299733284, 
                299733309, 
                299733355, 
                299733386, 
                299733404, 
                299733425, 
                299733472, 
                299733489, 
                299733501, 
                299733523, 
                299733544, 
                299733551, 
                299733564, 
                299733570, 
                299733581, 
                299733597, 
                299733609, 
                299733621, 
                299733632, 
                299733640, 
                299733648, 
                299733663, 
                299733674, 
                299733694
            };
            local l_Sound_1 = Instance.new("Sound");
            l_Sound_1.SoundId = "rbxassetid://172906410";
            l_Sound_1.Looped = true;
            l_Sound_1.Parent = v2;
            l_Sound_1:Play();
            while v2 and v2.Parent do
                for v37 = 1, #v35 do
                    l_ImageLabel_1.Image = ("rbxassetid://%*"):format(v35[v37]);
                    task.wait(0.1);
                end;
            end;
            l_Sound_1:Stop();
            return;
        elseif l_Mode_0 == "trolling" then
            local l_Frame_4 = Instance.new("Frame");
            l_Frame_4.BackgroundColor3 = Color3.new(0, 0, 0);
            l_Frame_4.Size = UDim2.new(1, 0, 1, 50);
            l_Frame_4.Position = UDim2.new(0, 0, 0, -50);
            l_Frame_4.Parent = v2;
            local l_ImageLabel_2 = Instance.new("ImageLabel");
            l_ImageLabel_2.Position = UDim2.new(0, 0, 0, 0);
            l_ImageLabel_2.Size = UDim2.new(1, 0, 1, 0);
            l_ImageLabel_2.BorderSizePixel = 0;
            l_ImageLabel_2.BackgroundColor3 = Color3.new(0, 0, 0);
            l_ImageLabel_2.Parent = l_Frame_4;
            local v40 = {
                "6172043688", 
                "6172044478", 
                "6172045193", 
                "6172045797", 
                "6172046490", 
                "6172047172", 
                "6172047947", 
                "6172048674", 
                "6172050195", 
                "6172050892", 
                "6172051669", 
                "6172053085", 
                "6172054752", 
                "6172054752", 
                "6172053085", 
                "6172051669", 
                "6172050892", 
                "6172050195", 
                "6172048674", 
                "6172047947", 
                "6172047172", 
                "6172046490", 
                "6172045797", 
                "6172045193", 
                "6172044478", 
                "6172043688"
            };
            local l_Sound_2 = Instance.new("Sound");
            l_Sound_2.SoundId = "rbxassetid://229681899";
            l_Sound_2.Looped = true;
            l_Sound_2.Parent = v2;
            l_Sound_2:Play();
            while v2 and v2.Parent do
                for v42 = 1, #v40 do
                    l_ImageLabel_2.Image = ("rbxassetid://%*"):format(v40[v42]);
                    task.wait(0.13);
                end;
            end;
            l_Sound_2:Stop();
            return;
        elseif l_Mode_0 == "Strobe" then
            local l_Frame_5 = Instance.new("Frame");
            l_Frame_5.BackgroundColor3 = Color3.new(0, 0, 0);
            l_Frame_5.BackgroundTransparency = 0;
            l_Frame_5.Size = UDim2.new(10, 0, 10, 0);
            l_Frame_5.Position = UDim2.new(-5, 0, -5, 0);
            l_Frame_5.ZIndex = 10;
            l_Frame_5.Parent = v2;
            while v2 and v2.Parent do
                task.wait(0.022727272727272728);
                l_Frame_5.BackgroundColor3 = Color3.new(1, 1, 1);
                task.wait(0.022727272727272728);
                l_Frame_5.BackgroundColor3 = Color3.new(0, 0, 0);
            end;
            if v2 then
                v2:Destroy();
                return;
            end;
        elseif l_Mode_0 == "Blind" then
            local l_Frame_6 = Instance.new("Frame");
            l_Frame_6.BackgroundColor3 = Color3.new(0, 0, 0);
            l_Frame_6.BackgroundTransparency = 0;
            l_Frame_6.Size = UDim2.new(10, 0, 10, 0);
            l_Frame_6.Position = UDim2.new(-5, 0, -5, 0);
            l_Frame_6.ZIndex = 10;
            l_Frame_6.Parent = v2;
            return;
        elseif l_Mode_0 == "ScreenImage" then
            local l_ImageLabel_3 = Instance.new("ImageLabel");
            l_ImageLabel_3.Image = ("rbxassetid://%*"):format(v0.Image);
            l_ImageLabel_3.BackgroundColor3 = Color3.new(0, 0, 0);
            l_ImageLabel_3.BackgroundTransparency = 0;
            l_ImageLabel_3.Size = UDim2.new(1, 0, 1, 0);
            l_ImageLabel_3.Position = UDim2.new(0, 0, 0, 0);
            l_ImageLabel_3.ZIndex = 10;
            l_ImageLabel_3.Parent = v2;
            return;
        elseif l_Mode_0 == "ScreenVideo" then
            local l_VideoFrame_0 = Instance.new("VideoFrame");
            l_VideoFrame_0.Video = ("rbxassetid://%*"):format(v0.Video);
            l_VideoFrame_0.BackgroundColor3 = Color3.new(0, 0, 0);
            l_VideoFrame_0.BackgroundTransparency = 0;
            l_VideoFrame_0.Size = UDim2.new(1, 0, 1, 0);
            l_VideoFrame_0.Position = UDim2.new(0, 0, 0, 0);
            l_VideoFrame_0.ZIndex = 10;
            l_VideoFrame_0.Parent = v2;
            l_VideoFrame_0:Play();
        end;
        return;
    end;
end;