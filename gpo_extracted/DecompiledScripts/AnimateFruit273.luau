local l_Parent_0 = script.Parent;
local l_SnackMesh_0 = l_Parent_0:WaitForChild("RootPart").Lower_Torso.Upper_Torso.Left_Shoulder.Left_UpperArm.Left_LowerArm.Left_Paw.SnackMesh;
local function v7(v2, v3) --[[ Line: 5 ]] --[[ Name: cleanFruit ]]
    local l_v2_Descendants_0 = v2:GetDescendants();
    for v5 = 1, #l_v2_Descendants_0 do
        if l_v2_Descendants_0[v5]:IsA("BasePart") then
            l_v2_Descendants_0[v5].CanCollide = false;
            l_v2_Descendants_0[v5].CanQuery = false;
            l_v2_Descendants_0[v5].CanTouch = false;
            l_v2_Descendants_0[v5].CollisionGroup = "noclip";
            l_v2_Descendants_0[v5].Velocity = Vector3.new();
            l_v2_Descendants_0[v5].Massless = true;
            local l_Transparency_0 = l_v2_Descendants_0[v5].Transparency;
            if l_v2_Descendants_0[v5].Transparency ~= 1 then
                v3:GetPropertyChangedSignal("Transparency"):Connect(function() --[[ Line: 17 ]]
                    -- upvalues: v3 (copy), l_v2_Descendants_0 (copy), v5 (copy), l_Transparency_0 (copy)
                    if v3.Transparency == 0 == false then
                        l_v2_Descendants_0[v5].Transparency = 1;
                        return;
                    else
                        l_v2_Descendants_0[v5].Transparency = l_Transparency_0;
                        return;
                    end;
                end);
            end;
        elseif l_v2_Descendants_0[v5]:IsA("Sound") then
            l_v2_Descendants_0[v5]:Destroy();
        end;
    end;
end;
repeat
    task.wait();
until script.Parent:GetAttribute("Fruit") ~= nil and _G.customWeld ~= nil and _G.PlayEffect ~= nil;
script.Parent:WaitForChild("AnimationController"):LoadAnimation(script:WaitForChild("Animation")):Play();
local l_Attribute_0 = script.Parent:GetAttribute("Fruit");
local l_FirstChild_0 = game.ReplicatedStorage.Tools:FindFirstChild(l_Attribute_0);
if l_FirstChild_0 then
    l_FirstChild_0 = l_FirstChild_0:Clone();
    l_FirstChild_0:ScaleTo(l_FirstChild_0:GetScale() * 0.5);
    v7(l_FirstChild_0, script.Parent.BunnySkin);
    Instance.new("Attachment", l_FirstChild_0.PrimaryPart).Position = Vector3.new(0, 0, 0, 0);
    l_FirstChild_0.PrimaryPart.Anchored = true;
    l_FirstChild_0:SetPrimaryPartCFrame(script.Parent.RootPart.CFrame);
    l_FirstChild_0.Parent = workspace.Effects;
    _G.bindableExcu(function() --[[ Line: 57 ]]
        -- upvalues: l_Parent_0 (copy), l_FirstChild_0 (ref)
        l_Parent_0.Destroying:Once(function() --[[ Line: 58 ]]
            -- upvalues: l_FirstChild_0 (ref)
            l_FirstChild_0:Destroy();
        end);
    end);
    _G.PlayEffect("CustomWeld", nil, l_FirstChild_0.PrimaryPart, l_SnackMesh_0, CFrame.new(), l_FirstChild_0);
    return;
else
    return;
end;