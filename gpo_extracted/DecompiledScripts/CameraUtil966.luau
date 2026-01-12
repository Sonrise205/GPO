return {
    WithinViewport = function(v0) --[[ Line: 3 ]] --[[ Name: WithinViewport ]]
        local l_CurrentCamera_0 = workspace.CurrentCamera;
        local v2 = nil;
        local v3 = nil;
        if v0:IsA("Model") then
            local l_v0_BoundingBox_0, v5 = v0:GetBoundingBox();
            v2 = l_v0_BoundingBox_0;
            v3 = v5;
        elseif v0:IsA("BasePart") then
            v2 = v0.CFrame;
            v3 = v0.Size;
        else
            warn("Object is neither a Model nor a BasePart! Disregarding Camera check!");
            return false;
        end;
        for v6 = 1, 8 do
            if l_CurrentCamera_0:WorldToViewportPoint((v2 * CFrame.new(v3.X * (v6 % 2 == 0 and 0.5 or -0.5), v3.Y * (v6 % 4 > 1 and 0.5 or -0.5), v3.Z * (v6 % 8 > 3 and 0.5 or -0.5))).Position) then
                return true;
            end;
        end;
        return false;
    end
};