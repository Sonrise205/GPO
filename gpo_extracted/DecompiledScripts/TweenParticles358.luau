return {
    start = function(_, v1, v2, v3) --[[ Line: 3 ]] --[[ Name: start ]]
        if v1 == nil then
            return;
        else
            local v4 = {
                v1
            };
            local l_v1_Descendants_0 = v1:GetDescendants();
            for v6 = 1, #l_v1_Descendants_0 do
                if l_v1_Descendants_0[v6]:IsA("ParticleEmitter") then
                    table.insert(v4, l_v1_Descendants_0[v6]);
                end;
            end;
            for v7 = 1, #v4 do
                if v4[v7]:IsA("ParticleEmitter") then
                    _G.tween(v4[v7], {
                        v3, 
                        Enum.EasingStyle.Quad, 
                        Enum.EasingDirection.Out, 
                        0, 
                        false, 
                        0
                    }, {
                        Size = v2
                    });
                end;
            end;
            return;
        end;
    end
};