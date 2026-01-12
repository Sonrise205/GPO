return {
    start = function(_, v1, v2) --[[ Line: 3 ]] --[[ Name: start ]]
        if _G.checkRenderDistance(v1.Position) == false then
            return;
        else
            local v3 = script.blood.Attachment:Clone();
            v3.WorldCFrame = CFrame.new(v1.Position);
            v3.Parent = workspace.Terrain;
            _G.customEmit(v3);
            _G.destroy(v3, 5);
            _G.PlayEffect("Spheres", nil, {
                cf = v1.CFrame, 
                ti = 0.25, 
                ti2 = 0.25, 
                range = 5, 
                minThick = 0.2, 
                maxThick = 3, 
                part = v1, 
                color = Color3.fromRGB(255, 89, 89), 
                am = 10
            });
            if v2 and v2 == "gravityBlade" then
                local v4 = script.gravityBlade.Hit:Clone();
                v4.WorldCFrame = v1.CFrame;
                v4.Parent = workspace.Terrain;
                _G.customEmit(v4);
                _G.destroy(v4, 5);
            end;
            return;
        end;
    end
};