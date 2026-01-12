local v0 = {};
local v1 = {};
local _ = require(game.ReplicatedStorage.Modules.Trove);
local _ = game:GetService("ReplicatedStorage");
v0.start = function(_, v5, v6) --[[ Line: 7 ]] --[[ Name: start ]]
    -- upvalues: v1 (copy)
    if v5 == nil then
        return;
    elseif v5 and v5.Parent == nil then
        return;
    elseif v5.PrimaryPart == nil then
        return;
    elseif _G.checkRenderDistance(v5.PrimaryPart.Position, 100) == false then
        return;
    else
        local _, v8 = workspace.CurrentCamera:WorldToScreenPoint(v5.PrimaryPart.Position);
        if v8 == false then
            return;
        else
            local v9 = nil;
            local l_Highlight_0 = v5:FindFirstChildWhichIsA("Highlight");
            if l_Highlight_0 and l_Highlight_0.Name ~= "damageHighlight" then
                return;
            else
                if v1[v5] then
                    v9 = v1[v5].Highlight;
                else
                    v9 = Instance.new("Highlight");
                    v9.OutlineTransparency = 1;
                    v9.DepthMode = Enum.HighlightDepthMode.Occluded;
                    v9.FillTransparency = 0.5;
                end;
                v9.Name = "damageHighlight";
                v9.Adornee = v5;
                if v6 == true then
                    v9.FillColor = Color3.fromRGB(255, 255, 255);
                end;
                pcall(function() --[[ Line: 57 ]]
                    -- upvalues: v9 (ref)
                    v9.Parent = script;
                end);
                local v11 = v1[v5];
                if v11 then
                    local l_Tween_0 = v11.Tween;
                    if l_Tween_0 then
                        l_Tween_0:Pause();
                        l_Tween_0:Destroy();
                        v11.cnt:Disconnect();
                    end;
                end;
                v9.FillTransparency = 0.5;
                local v13 = game:GetService("TweenService"):Create(v9, TweenInfo.new(0.75, Enum.EasingStyle.Cubic, Enum.EasingDirection.Out), {
                    FillTransparency = 1
                });
                v13:Play();
                local function v14() --[[ Line: 84 ]] --[[ Name: clean ]]
                    -- upvalues: v1 (ref), v5 (copy), v13 (copy), v9 (ref)
                    if v1[v5] then
                        v1[v5].Tween:Destroy();
                        v1[v5].Highlight:Destroy();
                        v1[v5].cnt:Disconnect();
                        v1[v5] = nil;
                    end;
                    v13:Destroy();
                    v9:Destroy();
                end;
                local v15 = v13.Completed:Connect(function() --[[ Line: 95 ]]
                    -- upvalues: v14 (copy)
                    v14();
                end);
                v1[v5] = {
                    Tween = v13, 
                    Highlight = v9, 
                    cnt = v15
                };
                task.delay(0.75, function() --[[ Line: 101 ]]
                    -- upvalues: v1 (ref), v5 (copy), v13 (copy), v14 (copy)
                    if v1[v5] and v1[v5].Tween == v13 then
                        v14();
                    end;
                end);
                return;
            end;
        end;
    end;
end;
return v0;