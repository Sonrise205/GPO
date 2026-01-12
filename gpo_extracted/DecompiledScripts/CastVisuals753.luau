local v20 = {
    Hide = function(v0) --[[ Line: 13 ]] --[[ Name: Hide ]]
        v0.CastOriginPart.Parent = nil;
    end, 
    Raycast = function(v1, v2, v3, v4) --[[ Line: 17 ]] --[[ Name: Raycast ]]
        local v5 = v1.WorldRoot:Raycast(v2, v3, v4);
        if not v5 then
            v1:Hide();
            return;
        else
            v1.CastOriginPart.CFrame = CFrame.lookAt(v2, v5.Position);
            v1.LineVisual.Length = v5.Distance - 0.25;
            v1.ConeVisual.CFrame = CFrame.new(0, 0, -v5.Distance);
            v1.BoxVisual.Visible = false;
            v1.SphereVisual.Visible = false;
            v1.CastOriginPart.Parent = v1.WorldRoot:FindFirstChild("Terrain") or v1.WorldRoot;
            return;
        end;
    end, 
    Blockcast = function(v6, v7, v8, v9, v10) --[[ Line: 38 ]] --[[ Name: Blockcast ]]
        local v11 = v6.WorldRoot:Blockcast(v7, v8, v9, v10);
        if not v11 then
            v6:Hide();
            return;
        else
            local v12 = v7.Position + v9.Unit * v11.Distance;
            v6.CastOriginPart.CFrame = CFrame.lookAt(v7.Position, v12);
            v6.LineVisual.Length = v11.Distance - 0.25;
            v6.ConeVisual.CFrame = CFrame.new(0, 0, -v11.Distance);
            v6.BoxVisual.CFrame = CFrame.new(0, 0, -v11.Distance);
            v6.BoxVisual.Size = v8;
            v6.BoxVisual.Visible = true;
            v6.SphereVisual.Visible = false;
            v6.CastOriginPart.Parent = v6.WorldRoot:FindFirstChild("Terrain") or v6.WorldRoot;
            return;
        end;
    end, 
    SphereCast = function(v13, v14, v15, v16, v17) --[[ Line: 64 ]] --[[ Name: SphereCast ]]
        local v18 = v13.WorldRoot:Spherecast(v14, v15, v16, v17);
        if not v18 then
            v13:Hide();
            return;
        else
            local v19 = v14 + v16.Unit * v18.Distance;
            v13.CastOriginPart.CFrame = CFrame.lookAt(v14, v19);
            v13.LineVisual.Length = v18.Distance - 0.25;
            v13.ConeVisual.CFrame = CFrame.new(0, 0, -v18.Distance);
            v13.SphereVisual.CFrame = CFrame.new(0, 0, -v18.Distance);
            v13.SphereVisual.Radius = v15;
            v13.SphereVisual.Visible = true;
            v13.BoxVisual.Visible = false;
            v13.CastOriginPart.Parent = v13.WorldRoot:FindFirstChild("Terrain") or v13.WorldRoot;
            return;
        end;
    end
};
local v21 = {};
local v22 = {
    __index = v20
};
v21.new = function(v23, v24) --[[ Line: 115 ]] --[[ Name: new ]]
    -- upvalues: v22 (copy)
    local v25 = setmetatable({
        Color = v23 or Color3.new(0, 0, 1), 
        WorldRoot = v24 or workspace
    }, v22);
    local l_Part_0 = Instance.new("Part");
    l_Part_0.Transparency = 1;
    l_Part_0.CanCollide = false;
    l_Part_0.CanQuery = false;
    l_Part_0.CanTouch = false;
    l_Part_0.Anchored = true;
    l_Part_0.Size = Vector3.new(0.009999999776482582, 0.009999999776482582, 0.009999999776482582, 0);
    v25.CastOriginPart = l_Part_0;
    local l_LineHandleAdornment_0 = Instance.new("LineHandleAdornment");
    l_LineHandleAdornment_0.Color3 = v25.Color;
    l_LineHandleAdornment_0.AlwaysOnTop = true;
    l_LineHandleAdornment_0.Transparency = 0.5;
    l_LineHandleAdornment_0.Thickness = 2.5;
    l_LineHandleAdornment_0.ZIndex = 1;
    l_LineHandleAdornment_0.Adornee = l_Part_0;
    l_LineHandleAdornment_0.Parent = l_Part_0;
    v25.LineVisual = l_LineHandleAdornment_0;
    local l_ConeHandleAdornment_0 = Instance.new("ConeHandleAdornment");
    l_ConeHandleAdornment_0.Color3 = v25.Color;
    l_ConeHandleAdornment_0.AlwaysOnTop = true;
    l_ConeHandleAdornment_0.Transparency = 0.5;
    l_ConeHandleAdornment_0.Radius = 0.05;
    l_ConeHandleAdornment_0.Height = 0.25;
    l_ConeHandleAdornment_0.SizeRelativeOffset = Vector3.new(0, 0, 0.5, 0);
    l_ConeHandleAdornment_0.ZIndex = 1;
    l_ConeHandleAdornment_0.Adornee = l_Part_0;
    l_ConeHandleAdornment_0.Parent = l_Part_0;
    v25.ConeVisual = l_ConeHandleAdornment_0;
    local l_BoxHandleAdornment_0 = Instance.new("BoxHandleAdornment");
    l_BoxHandleAdornment_0.Color3 = v25.Color;
    l_BoxHandleAdornment_0.AlwaysOnTop = true;
    l_BoxHandleAdornment_0.Transparency = 0.5;
    l_BoxHandleAdornment_0.ZIndex = 0;
    l_BoxHandleAdornment_0.Adornee = l_Part_0;
    l_BoxHandleAdornment_0.Parent = l_Part_0;
    v25.BoxVisual = l_BoxHandleAdornment_0;
    local l_SphereHandleAdornment_0 = Instance.new("SphereHandleAdornment");
    l_SphereHandleAdornment_0.Color3 = v25.Color;
    l_SphereHandleAdornment_0.AlwaysOnTop = true;
    l_SphereHandleAdornment_0.Transparency = 0.5;
    l_SphereHandleAdornment_0.ZIndex = 0;
    l_SphereHandleAdornment_0.Adornee = l_Part_0;
    l_SphereHandleAdornment_0.Parent = l_Part_0;
    v25.SphereVisual = l_SphereHandleAdornment_0;
    return v25;
end;
return v21;