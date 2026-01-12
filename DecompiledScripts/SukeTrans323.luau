return {
    start = function(_, v1) --[[ Line: 5 ]] --[[ Name: start ]]
        local v2 = false;
        local v3 = {};
        local l_v1_Descendants_0 = v1:GetDescendants();
        for v5 = 1, #l_v1_Descendants_0 do
            if (l_v1_Descendants_0[v5]:IsA("BasePart") or l_v1_Descendants_0[v5]:IsA("Decal")) and (l_v1_Descendants_0[v5].Transparency ~= 1 or l_v1_Descendants_0[v5]:GetAttribute("SukeTransparency") ~= nil) then
                local v6 = l_v1_Descendants_0[v5];
                if l_v1_Descendants_0[v5]:IsA("BasePart") then
                    v3[v6] = {
                        mat = v6.Material
                    };
                    if l_v1_Descendants_0[v5].Transparency ~= 0 and l_v1_Descendants_0[v5]:GetAttribute("SukeTransparency") == nil then
                        v3[v6].trans = v6.Transparency;
                    end;
                end;
                task.spawn(function() --[[ Line: 18 ]]
                    -- upvalues: v2 (ref), l_v1_Descendants_0 (copy), v5 (copy), v6 (copy)
                    task.wait(0.275);
                    if v2 == true then
                        return;
                    else
                        if l_v1_Descendants_0[v5]:IsA("BasePart") then
                            v6.Material = Enum.Material.Glass;
                        end;
                        v6.Transparency = 0.9;
                        return;
                    end;
                end);
            end;
        end;
        local v7 = Instance.new("BindableEvent", script);
        v7.Event:Connect(function() --[[ Line: 31 ]]
            -- upvalues: v2 (ref), v7 (copy), v3 (ref)
            v2 = true;
            v7:Destroy();
            for v8, v9 in v3 do
                v8.Transparency = 0;
                if v9.trans and v8:IsA("Decal") == false then
                    v8.Transparency = v9.trans;
                end;
                if v8:IsA("BasePart") then
                    v8.Material = v9.mat;
                end;
            end;
            v3 = nil;
        end);
        return v7;
    end
};