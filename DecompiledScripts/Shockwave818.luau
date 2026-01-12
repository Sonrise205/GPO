return {
    start = function(_, v1, v2, v3, v4, v5, v6, v7, _, v9, v10) --[[ Line: 4 ]] --[[ Name: start ]]
        if _G.checkRenderDistance(v1.p) == false then
            return;
        else
            local v11 = script.Shock:Clone();
            v11.CFrame = v1;
            if v10 then
                v11.Material = v10;
            end;
            if v2 then
                v11.CFrame = v2;
            end;
            if typeof(v3) == "BrickColor" then
                v11.BrickColor = v3;
            else
                v11.Color = v3;
            end;
            if v5 then
                v11.Size = v5;
            end;
            if v7 == nil then
                v7 = 0;
            end;
            v11.Transparency = v7;
            _G.destroy(v11, v6);
            local v12 = {
                Size = v4, 
                CFrame = v1, 
                Transparency = 1
            };
            if v9 then
                v12.Color = v9;
            end;
            _G.tween(v11, {
                v6, 
                Enum.EasingStyle.Quad, 
                Enum.EasingDirection.Out, 
                0, 
                false, 
                0
            }, v12);
            return;
        end;
    end
};