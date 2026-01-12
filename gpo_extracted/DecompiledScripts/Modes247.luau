local l_TweenService_0 = game:GetService("TweenService");
local v2 = {
    SineMode = function(v1) --[[ Line: 6 ]]
        return TweenInfo.new(v1, Enum.EasingStyle.Sine);
    end
};
local function v3(...) --[[ Line: 12 ]]
    -- upvalues: l_TweenService_0 (copy)
    return l_TweenService_0:Create(...);
end;
return {
    Shrink = function(v4, v5) --[[ Line: 20 ]]
        -- upvalues: v3 (copy), v2 (copy)
        local v6 = v3(v4, v2.SineMode(v5), {
            Size = Vector3.new(0, 0, 0, 0)
        });
        v6:Play();
        task.spawn(function() --[[ Line: 25 ]]
            -- upvalues: v6 (copy)
            v6.Completed:Wait();
            v6:Destroy();
        end);
    end, 
    Melt = function(v7, v8) --[[ Line: 31 ]]
        -- upvalues: v3 (copy), v2 (copy)
        local v9 = v3(v7, v2.SineMode(v8), {
            Position = v7.Position + Vector3.new(0, -v7.Size.X * 1.5, 0)
        });
        v9:Play();
        task.spawn(function() --[[ Line: 36 ]]
            -- upvalues: v9 (copy)
            v9.Completed:Wait();
            v9:Destroy();
        end);
    end, 
    FadeOut = function(v10, v11) --[[ Line: 42 ]]
        -- upvalues: v3 (copy), v2 (copy)
        local v12 = v3(v10, v2.SineMode(v11), {
            Transparency = 1
        });
        v12:Play();
        task.spawn(function() --[[ Line: 47 ]]
            -- upvalues: v12 (copy)
            v12.Completed:Wait();
            v12:Destroy();
        end);
    end, 
    Enlarge = function(v13, v14, v15) --[[ Line: 54 ]]
        -- upvalues: v3 (copy), v2 (copy)
        local l_Size_0 = v13.Size;
        v13.CFrame = v15.CFrame;
        v13.Size = Vector3.new(0, 0, 0, 0);
        local v17 = v3(v13, v2.SineMode(v14), {
            Size = l_Size_0
        });
        v17:Play();
        task.spawn(function() --[[ Line: 60 ]]
            -- upvalues: v17 (copy)
            v17.Completed:Wait();
            v17:Destroy();
        end);
    end, 
    Grow = function(v18, v19, v20) --[[ Line: 66 ]]
        -- upvalues: v3 (copy), v2 (copy)
        v18.CFrame = v18.CFrame * CFrame.new(0, -v18.Size.X / 1.5, 0);
        local v21 = v3(v18, v2.SineMode(v19), v20);
        v21:Play();
        task.spawn(function() --[[ Line: 70 ]]
            -- upvalues: v21 (copy)
            v21.Completed:Wait();
            v21:Destroy();
        end);
    end, 
    FadeIn = function(v22, v23, v24) --[[ Line: 76 ]]
        -- upvalues: v3 (copy), v2 (copy)
        v22.CFrame = v24.CFrame;
        local l_Transparency_0 = v22.Transparency;
        v22.Transparency = 1;
        local v26 = v3(v22, v2.SineMode(v23), {
            Transparency = l_Transparency_0
        });
        v26:Play();
        task.spawn(function() --[[ Line: 84 ]]
            -- upvalues: v26 (copy)
            v26.Completed:Wait();
            v26:Destroy();
        end);
    end
};