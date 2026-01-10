local v0 = {};
local l_Debris_0 = game:GetService("Debris");
local l_TweenService_0 = game:GetService("TweenService");
local l_Effects_0 = workspace.Effects;
local l_DistortionMesh_0 = script.DistortionMesh;
v0.Play = function(v5) --[[ Line: 20 ]] --[[ Name: Play ]]
    -- upvalues: l_DistortionMesh_0 (copy), l_Effects_0 (copy), l_TweenService_0 (copy), l_Debris_0 (copy)
    local v6 = l_DistortionMesh_0:Clone();
    v6.CFrame = v5.Position;
    v6.Parent = l_Effects_0;
    v6.Transparency = v5.StartDistortion;
    v6.Size = Vector3.new(v5.StartRadius, v5.StartRadius, v5.StartRadius);
    l_TweenService_0:Create(v6, TweenInfo.new(v5.Duration, v5.EasingStyle, v5.EasingDirection), {
        Size = Vector3.new(v5.EndRadius, v5.EndRadius, v5.EndRadius), 
        Transparency = v5.EndDistortion
    }):Play();
    l_Debris_0:AddItem(v6, v5.Duration);
end;
return v0;