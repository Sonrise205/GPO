return {
    start = function(_, v1, v2, v3) --[[ Line: 5 ]] --[[ Name: start ]]
        if v1 == nil then
            return;
        elseif _G.checkRenderDistance(v1.CFrame, 75) == false then
            return;
        else
            local l_TextSize_0 = game:GetService("TextService"):GetTextSize(v2, 16, Enum.Font.Montserrat, Vector2.new(1000, 100));
            local v5 = script.BubbleChat:Clone();
            v5.BubbleChatList.Bubble.Size = UDim2.new(0, l_TextSize_0.X + 50, 0, 32);
            v5.BubbleChatList.Bubble.Frame.Text.Text = v2;
            v5.Parent = v1;
            local l_v5_Descendants_0 = v5:GetDescendants();
            for v7 = 1, #l_v5_Descendants_0 do
                if l_v5_Descendants_0[v7]:IsA("TextLabel") and l_v5_Descendants_0[v7].TextTransparency ~= 1 then
                    local l_TextTransparency_0 = l_v5_Descendants_0[v7].TextTransparency;
                    l_v5_Descendants_0[v7].TextTransparency = 1;
                    game:GetService("TweenService"):Create(l_v5_Descendants_0[v7], TweenInfo.new(0.25), {
                        TextTransparency = l_TextTransparency_0
                    }):Play();
                elseif l_v5_Descendants_0[v7]:IsA("Frame") and l_v5_Descendants_0[v7].BackgroundTransparency ~= 1 then
                    local l_BackgroundTransparency_0 = l_v5_Descendants_0[v7].BackgroundTransparency;
                    l_v5_Descendants_0[v7].BackgroundTransparency = 1;
                    game:GetService("TweenService"):Create(l_v5_Descendants_0[v7], TweenInfo.new(0.25), {
                        BackgroundTransparency = l_BackgroundTransparency_0
                    }):Play();
                elseif l_v5_Descendants_0[v7]:IsA("ImageLabel") and l_v5_Descendants_0[v7].ImageTransparency ~= 1 and l_v5_Descendants_0[v7].BackgroundTransparency ~= 1 then
                    local l_ImageTransparency_0 = l_v5_Descendants_0[v7].ImageTransparency;
                    local l_BackgroundTransparency_1 = l_v5_Descendants_0[v7].BackgroundTransparency;
                    l_v5_Descendants_0[v7].BackgroundTransparency = 1;
                    l_v5_Descendants_0[v7].ImageTransparency = 1;
                    game:GetService("TweenService"):Create(l_v5_Descendants_0[v7], TweenInfo.new(0.25), {
                        ImageTransparency = l_ImageTransparency_0, 
                        BackgroundTransparency = l_BackgroundTransparency_1
                    }):Play();
                end;
            end;
            task.delay(v3, function() --[[ Line: 44 ]]
                -- upvalues: l_v5_Descendants_0 (copy), v5 (copy)
                for v12 = 1, #l_v5_Descendants_0 do
                    if l_v5_Descendants_0[v12]:IsA("TextLabel") then
                        game:GetService("TweenService"):Create(l_v5_Descendants_0[v12], TweenInfo.new(0.25), {
                            TextTransparency = 1, 
                            BackgroundTransparency = 1
                        }):Play();
                    elseif l_v5_Descendants_0[v12]:IsA("Frame") then
                        game:GetService("TweenService"):Create(l_v5_Descendants_0[v12], TweenInfo.new(0.25), {
                            BackgroundTransparency = 1
                        }):Play();
                    elseif l_v5_Descendants_0[v12]:IsA("ImageLabel") then
                        game:GetService("TweenService"):Create(l_v5_Descendants_0[v12], TweenInfo.new(0.25), {
                            ImageTransparency = 1, 
                            BackgroundTransparency = 1
                        }):Play();
                    end;
                end;
                _G.destroy(v5, 0.25);
            end);
            return;
        end;
    end
};