local l_Parent_0 = script.Parent;
local l_FirstChild_0 = l_Parent_0:WaitForChild("RootPart"):FindFirstChild("WeaponHoldAttachment", true);
local function _(v2, v3) --[[ Line: 5 ]] --[[ Name: cleanFruit ]]
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
until _G.customWeld ~= nil and _G.PlayEffect ~= nil;
script.Parent:WaitForChild("AnimationController"):LoadAnimation(script:WaitForChild("Animation")):Play();
local v8 = nil;
local v9 = {};
local function v14(v10) --[[ Line: 40 ]] --[[ Name: setWeapon ]]
    -- upvalues: v8 (ref), l_Parent_0 (copy), l_FirstChild_0 (copy), v9 (copy)
    if v8 then
        v8:Destroy();
    end;
    local v11 = game.ReplicatedStorage.Tools:FindFirstChild(v10):Clone();
    v11:ScaleTo(v11:GetScale() * 0.3);
    Instance.new("Attachment", v11.PrimaryPart).Position = Vector3.new(0, 0, 0, 0);
    v11.PrimaryPart.Anchored = true;
    v11:SetPrimaryPartCFrame(script.Parent.RootPart.CFrame);
    v11.Parent = workspace.Effects;
    _G.bindableExcu(function() --[[ Line: 53 ]]
        -- upvalues: l_Parent_0 (ref), v11 (copy)
        l_Parent_0.Destroying:Once(function() --[[ Line: 54 ]]
            -- upvalues: v11 (ref)
            v11:Destroy();
        end);
    end);
    _G.PlayEffect("CustomWeld", nil, v11.PrimaryPart, l_FirstChild_0, CFrame.new(), v11);
    table.clear(v9);
    local l_v11_Descendants_0 = v11:GetDescendants();
    for v13 = 1, #l_v11_Descendants_0 do
        if l_v11_Descendants_0[v13]:IsA("BasePart") and l_v11_Descendants_0[v13].Transparency ~= 1 then
            v9[l_v11_Descendants_0[v13]] = l_v11_Descendants_0[v13].Transparency;
        end;
    end;
    v8 = v11;
end;
task.spawn(function() --[[ Line: 70 ]]
    -- upvalues: l_Parent_0 (copy), v9 (copy)
    l_Parent_0:WaitForChild("Eyebrows"):GetPropertyChangedSignal("Transparency"):Connect(function() --[[ Line: 72 ]]
        -- upvalues: l_Parent_0 (ref), v9 (ref)
        if l_Parent_0.Eyebrows.Transparency == 1 then
            for v15, _ in pairs(v9) do
                v15.Transparency = 1;
            end;
            return;
        else
            for v17, v18 in pairs(v9) do
                v17.Transparency = v18;
            end;
            return;
        end;
    end);
end);
local v19 = game.ReplicatedStorage:WaitForChild("Stats" .. l_Parent_0.Parent.Name);
if v19 then
    local function v25() --[[ Line: 88 ]] --[[ Name: getEquipedWeapon ]]
        -- upvalues: v19 (copy), v14 (copy)
        local v20 = require(game.ReplicatedStorage.Modules.ToolDesc);
        local v21 = game:GetService("HttpService"):JSONDecode(v19.Inventory.Equiped.Value);
        local v22 = nil;
        for _, v24 in v21 do
            if v20 and v20[v24] and v20[v24].Type == "Katana" then
                v22 = v24;
                break;
            end;
        end;
        if v22 then
            v14(v22);
        end;
    end;
    local function _() --[[ Line: 104 ]] --[[ Name: equip ]]
        -- upvalues: v25 (copy), v14 (copy)
        local v26 = v25();
        if v26 then
            v14(v26);
        end;
    end;
    local v28 = v25();
    if v28 then
        v14(v28);
    end;
    v28 = v19.Customization.Height.Value;
    local _ = v28 / 10;
    local l_FirstChild_1 = script.Parent:FindFirstChild("Lower_Torso", true);
    GetOffset = function(v31) --[[ Line: 117 ]] --[[ Name: GetOffset ]]
        if v31 <= 10 then
            return 0.215;
        else
            return 0.215 * ((v31 - 10) * 0.05);
        end;
    end;
    if l_FirstChild_1 then
        l_FirstChild_1.Position = Vector3.new(0.007, -GetOffset(v28), -0.52);
    end;
    v19.Inventory.Equiped.Changed:Connect(function() --[[ Line: 129 ]]
        -- upvalues: v25 (copy), v14 (copy)
        local v32 = v25();
        if v32 then
            v14(v32);
        end;
    end);
    while true do
        task.wait(math.random(8, 12));
        if l_Parent_0.PrimaryPart then
            _G.PlaySound(l_Parent_0.PrimaryPart, script["BunnyPetVoice" .. math.random(1, 4)]).Parent = l_Parent_0.PrimaryPart;
        else
            break;
        end;
    end;
end;