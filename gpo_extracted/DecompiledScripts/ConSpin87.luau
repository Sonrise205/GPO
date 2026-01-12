return {
    start = function(_, v1) --[[ Line: 5 ]] --[[ Name: start ]]
        local l_char_0 = v1.char;
        local l_nt_0 = v1.nt;
        local _ = v1.t;
        local l_v0_0 = v1.v0;
        local l_x0_0 = v1.x0;
        local l_en2_0 = v1.en2;
        local l_endcf_0 = v1.endcf;
        local l_g_0 = v1.g;
        if _G.checkRenderDistance(l_char_0.HumanoidRootPart.CFrame.p) == false then
            return;
        else
            local v10 = nil;
            v10 = game["Run Service"].RenderStepped:Connect(function(v11) --[[ Line: 18 ]]
                -- upvalues: l_char_0 (copy), l_g_0 (copy), l_nt_0 (ref), l_v0_0 (copy), l_x0_0 (copy), l_en2_0 (copy), l_endcf_0 (ref), v10 (ref)
                l_char_0.HumanoidRootPart.CFrame = CFrame.new(CFrame.new(0.5 * l_g_0 * l_nt_0 * l_nt_0 + l_v0_0 * l_nt_0 + l_x0_0).p, l_en2_0);
                local v12 = l_nt_0 + v11;
                local v13 = CFrame.new(0.5 * l_g_0 * v12 * v12 + l_v0_0 * v12 + l_x0_0);
                local v14 = Ray.new(l_char_0.HumanoidRootPart.CFrame.p, (l_char_0.HumanoidRootPart.CFrame.p - v13.p).unit * -(l_char_0.HumanoidRootPart.CFrame.p - v13.p).magnitude);
                local v15, v16 = _G.raycastIgnoreList(v14, {
                    l_char_0, 
                    workspace.Ragdolls, 
                    workspace.Effects, 
                    workspace.Projectiles, 
                    workspace.CurrentCamera, 
                    workspace.PlayerCharacters
                });
                local _ = Ray.new(l_char_0.HumanoidRootPart.CFrame.p, (l_char_0.HumanoidRootPart.CFrame.p - v13.p).unit * (l_char_0.HumanoidRootPart.CFrame.p - v13.p).magnitude / 2);
                if v15 then
                    local v18 = v16 + Vector3.new(0, l_char_0.Humanoid.HipHeight * 1.5);
                    l_char_0.HumanoidRootPart.CFrame = CFrame.new(v18, (Vector3.new(l_en2_0.x, v18.y, l_en2_0.z))) * CFrame.Angles(0, 3.141592653589793, 0);
                    l_endcf_0 = l_char_0.HumanoidRootPart.CFrame;
                    v10:disconnect();
                    v10 = nil;
                end;
                l_nt_0 = l_nt_0 + v11;
            end);
            return;
        end;
    end
};