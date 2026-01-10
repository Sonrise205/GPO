local l_RunService_0 = game:GetService("RunService");
local l_Effects_0 = workspace:WaitForChild("Effects");
local l_Assets_0 = script.Parent.Parent.Assets;
local _ = workspace.CurrentCamera;
local v4 = require(game.ReplicatedStorage.Util.Tween);
local v5 = require(script.Data);
local v6 = {};
l_RunService_0:BindToRenderStep(script.Parent.Name .. "-" .. script.Name, Enum.RenderPriority.Last.Value - 1000, function(v7) --[[ Line: 10 ]]
    -- upvalues: v6 (copy), v4 (copy)
    local v8 = tick();
    for _, v10 in next, v6 do
        local v11 = math.min(1, (v8 - v10.Start) / v10.Duration);
        v10.Angle = v10.Angle + 6.283185307179586 * v7;
        local v12 = v4.ease.out.quad(v11, 0, 1, 1);
        local v13 = v4.ease["in"].cubic(v11, 0, 1, 1);
        local v14 = v4.ease.inout.quad(v11, 0, 1, 1);
        local v15 = v10.Scale * v12;
        local v16 = CFrame.new():Lerp(v10.Offset, v13);
        for _, v18 in next, v10.ReferenceData do
            local v19 = v18.Size / v10.ModelScale;
            if v18.Part:IsA("MeshPart") then
                v18.Part.Size = v19 * v15;
                v18.Part.Transparency = v4.point(v18.Transparency + v10.Transparency, 1, v14);
                v18.Part.CFrame = v10.CFrame * v18:CalculateOffset(v15 / v10.ModelScale);
            end;
        end;
        if not v10.LastCFrame then
            v10.LastCFrame = CFrame.new();
        end;
        local v20 = v10.Anchor and CFrame.new(v10.Anchor.CFrame.p) or v10.CFrame;
        v10.LastCFrame = v11 > 0.5 and v10.LastCFrame or v20;
        v10.Reference:PivotTo((v10.Anchor and v10.Anchor.CFrame or v10.CFrame) * v16 * CFrame.Angles(0, v10.Angle * v10.RotationDirection, 0) * v10.ModelOffset);
        if v11 == 1 then
            v10:Destroy();
        end;
    end;
end);
local v21 = {};
v21.new = function(v22, v23) --[[ Line: 51 ]] --[[ Name: new ]]
    -- upvalues: v5 (copy), v21 (copy)
    local v24 = {
        ID = v22 or v23.id or 1
    };
    local v25 = v5[v24.ID];
    v24.ModelScale = v25.Scale or 1;
    v24.ModelOffset = v25.Offset or CFrame.new();
    v24.Offset = v23.Offset or CFrame.new();
    v24.Anchor = v23.Anchor;
    v24.CFrame = v23.CFrame or CFrame.new();
    v24.Scale = v23.Scale or 1;
    v24.Duration = v23.Duration or 1;
    v24.Color = v23.Color or Color3.new(1, 1, 1);
    v24.Accent = v23.Accent or v24.Color;
    v24.RotationDirection = v23.RotationDirection or 1;
    v24.Transparency = v23.Transparency or 0.1;
    return setmetatable(v24, {
        __index = v21
    }):__init();
end;
v21.__init = function(v26) --[[ Line: 73 ]] --[[ Name: __init ]]
    -- upvalues: l_Assets_0 (copy)
    if v26.Reference then
        return v26;
    else
        v26.Angle = 0;
        v26.Reference = l_Assets_0.Slashes:FindFirstChild(v26.ID):Clone();
        v26.ReferenceData = {};
        local l_CFrame_0 = v26.Reference.PrimaryPart.CFrame;
        for _, v29 in next, v26.Reference:GetChildren() do
            local v30 = v29.Name:find("2") and v26.Accent or v26.Color;
            table.insert(v26.ReferenceData, {
                Part = v29, 
                Size = v29.Size, 
                CFrame = v29.CFrame, 
                Transparency = v29.Transparency, 
                CalculateOffset = function(v31, v32) --[[ Line: 93 ]] --[[ Name: CalculateOffset ]]
                    -- upvalues: l_CFrame_0 (copy)
                    local v33, v34, v35, v36, v37, v38, v39, v40, v41, v42, v43, v44 = v31.CFrame:ToObjectSpace(l_CFrame_0):inverse():components();
                    return CFrame.new(v33 * v32, v34 * v32, v35 * v32, v36, v37, v38, v39, v40, v41, v42, v43, v44);
                end
            });
            v29.Size = v29.Size * 0;
            v29.Color = v30;
            if v29:IsA("MeshPart") then
                v29.Transparency = 0;
            else
                v29.Transparency = 1;
            end;
        end;
        return v26;
    end;
end;
v21.Emit = function(v45) --[[ Line: 112 ]] --[[ Name: Emit ]]
    -- upvalues: l_Effects_0 (copy), v6 (copy)
    v45.Reference:PivotTo(v45.CFrame * v45.ModelOffset);
    v45.Reference.Parent = l_Effects_0;
    v45.Start = tick();
    v6[v45] = v45;
end;
v21.Destroy = function(v46) --[[ Line: 119 ]] --[[ Name: Destroy ]]
    -- upvalues: v6 (copy)
    v46.Reference:Destroy();
    v6[v46] = nil;
end;
return v21;