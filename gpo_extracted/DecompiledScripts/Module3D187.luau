local v44 = {
    new = function(v0) --[[ Line: 59 ]] --[[ Name: new ]]
        local v1 = CFrame.new();
        local v2 = 1;
        local v3 = {
            Object3D = v0
        };
        if v0:IsA("BasePart") then
            local l_Model_0 = Instance.new("Model");
            l_Model_0.Name = "Model3D";
            v0.Parent = l_Model_0;
            l_Model_0.PrimaryPart = v0;
            v0 = l_Model_0;
            v3.Object3D = v0;
        end;
        local l_v0_Descendants_0 = v0:GetDescendants();
        for v6 = 1, #l_v0_Descendants_0 do
            if l_v0_Descendants_0[v6]:IsA("Sound") then
                l_v0_Descendants_0[v6]:Destroy();
            end;
        end;
        local l_ViewportFrame_0 = Instance.new("ViewportFrame");
        l_ViewportFrame_0.BackgroundTransparency = 1;
        v3.AdornFrame = l_ViewportFrame_0;
        local l_Camera_0 = Instance.new("Camera");
        l_Camera_0.Parent = l_ViewportFrame_0;
        l_ViewportFrame_0.CurrentCamera = l_Camera_0;
        local l_PrimaryPart_0 = v0.PrimaryPart;
        if not l_PrimaryPart_0 then
            v0.PrimaryPart = v0:FindFirstChildWhichIsA("BasePart", true);
        end;
        if v0.PrimaryPart then
            v0:PivotTo(CFrame.new(Vector3.new(0, 10000, 0, 0) - v0.PrimaryPart.Position) * v0.PrimaryPart.CFrame);
            v0.PrimaryPart = l_PrimaryPart_0;
        end;
        v0.Parent = l_ViewportFrame_0;
        local l_v0_BoundingBox_0, v11 = v0:GetBoundingBox();
        local l_p_0 = l_v0_BoundingBox_0.p;
        local v13 = math.max(v11.X, v11.Y, v11.Z);
        local function _() --[[ Line: 117 ]] --[[ Name: UpdateCFrame ]]
            -- upvalues: v13 (copy), l_Camera_0 (copy), v2 (ref), l_p_0 (copy), v1 (ref)
            local v14 = v13 / math.tan((math.rad(l_Camera_0.FieldOfView))) * v2;
            local v15 = CFrame.new(l_p_0);
            l_Camera_0.CFrame = v15 * v1 * CFrame.new(0, 0, v13 / 2 + v14);
            l_Camera_0.Focus = v15;
        end;
        v3.Update = function(_) --[[ Line: 128 ]] --[[ Name: Update ]]
            -- upvalues: v13 (copy), l_Camera_0 (copy), v2 (ref), l_p_0 (copy), v1 (ref)
            local v18 = v13 / math.tan((math.rad(l_Camera_0.FieldOfView))) * v2;
            local v19 = CFrame.new(l_p_0);
            l_Camera_0.CFrame = v19 * v1 * CFrame.new(0, 0, v13 / 2 + v18);
            l_Camera_0.Focus = v19;
        end;
        v3.SetActive = function(_, v21) --[[ Line: 135 ]] --[[ Name: SetActive ]]
            -- upvalues: l_ViewportFrame_0 (copy)
            l_ViewportFrame_0.Visible = v21;
        end;
        v3.GetActive = function(_) --[[ Line: 142 ]] --[[ Name: GetActive ]]
            -- upvalues: l_ViewportFrame_0 (copy)
            return l_ViewportFrame_0.Visible;
        end;
        v3.SetCFrame = function(_, v24) --[[ Line: 149 ]] --[[ Name: SetCFrame ]]
            -- upvalues: v1 (ref), v13 (copy), l_Camera_0 (copy), v2 (ref), l_p_0 (copy)
            v1 = v24;
            local v25 = v13 / math.tan((math.rad(l_Camera_0.FieldOfView))) * v2;
            local v26 = CFrame.new(l_p_0);
            l_Camera_0.CFrame = v26 * v1 * CFrame.new(0, 0, v13 / 2 + v25);
            l_Camera_0.Focus = v26;
        end;
        v3.GetCFrame = function(_) --[[ Line: 157 ]] --[[ Name: GetCFrame ]]
            -- upvalues: v1 (ref)
            return v1;
        end;
        v3.SetDepthMultiplier = function(_, v29) --[[ Line: 164 ]] --[[ Name: SetDepthMultiplier ]]
            -- upvalues: v2 (ref), v13 (copy), l_Camera_0 (copy), l_p_0 (copy), v1 (ref)
            v2 = v29;
            local v30 = v13 / math.tan((math.rad(l_Camera_0.FieldOfView))) * v2;
            local v31 = CFrame.new(l_p_0);
            l_Camera_0.CFrame = v31 * v1 * CFrame.new(0, 0, v13 / 2 + v30);
            l_Camera_0.Focus = v31;
        end;
        v3.GetDepthMultiplier = function(_) --[[ Line: 172 ]] --[[ Name: GetDepthMultiplier ]]
            -- upvalues: v2 (ref)
            return v2;
        end;
        v3.Destroy = function(v33) --[[ Line: 179 ]] --[[ Name: Destroy ]]
            v33.AdornFrame:Destroy();
            v33.Object3D:Destroy();
        end;
        v3.End = function(v34) --[[ Line: 187 ]] --[[ Name: End ]]
            v34:Destroy();
        end;
        local v35 = {};
        setmetatable(v3, v35);
        v35.__index = function(_, v37) --[[ Line: 194 ]]
            -- upvalues: l_ViewportFrame_0 (copy), v3 (copy)
            if v37 == "Camera" then
                return l_ViewportFrame_0.CurrentCamera;
            else
                local v38 = rawget(v3, v37);
                if v38 ~= nil then
                    return v38;
                else
                    return l_ViewportFrame_0[v37];
                end;
            end;
        end;
        v35.__newindex = function(_, v40, v41) --[[ Line: 209 ]]
            -- upvalues: l_ViewportFrame_0 (copy)
            l_ViewportFrame_0[v40] = v41;
        end;
        local v42 = v13 / math.tan((math.rad(l_Camera_0.FieldOfView))) * v2;
        local v43 = CFrame.new(l_p_0);
        l_Camera_0.CFrame = v43 * v1 * CFrame.new(0, 0, v13 / 2 + v42);
        l_Camera_0.Focus = v43;
        return v3;
    end
};
v44.Attach3D = function(_, v46, v47) --[[ Line: 222 ]] --[[ Name: Attach3D ]]
    -- upvalues: v44 (copy)
    local v48 = v44.new(v47);
    v48.AnchorPoint = Vector2.new(0.5, 0.5);
    v48.Position = UDim2.new(0.5, 0, 0.5, 0);
    v48.Visible = false;
    v48.Parent = v46;
    local v51 = v46.Changed:Connect(function() --[[ Line: 233 ]] --[[ Name: UpdateFrameSize ]]
        -- upvalues: v46 (copy), v48 (copy)
        local l_AbsoluteSize_0 = v46.AbsoluteSize;
        local _ = math.abs((math.min(l_AbsoluteSize_0.X, l_AbsoluteSize_0.Y)));
        v48.AdornFrame.Size = UDim2.new(1, 0, 1, 0);
    end);
    local l_AbsoluteSize_1 = v46.AbsoluteSize;
    local _ = math.abs((math.min(l_AbsoluteSize_1.X, l_AbsoluteSize_1.Y)));
    v48.AdornFrame.Size = UDim2.new(1, 0, 1, 0);
    l_AbsoluteSize_1 = v48.Destroy;
    rawset(v48, "Destroy", function(v54) --[[ Line: 245 ]] --[[ Name: NewDesstroy ]]
        -- upvalues: l_AbsoluteSize_1 (copy), v51 (ref)
        l_AbsoluteSize_1(v54);
        if v51 then
            v51:Disconnect();
            v51 = nil;
        end;
    end);
    v46.Destroying:Connect(function() --[[ Line: 255 ]]
        -- upvalues: v48 (copy)
        v48:End();
    end);
    return v48;
end;
return v44;