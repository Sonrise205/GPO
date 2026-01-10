local v0 = {};
local v1 = {};
local l_Children_0 = script.RightHand:GetChildren();
for v3 = 1, #l_Children_0 do
    table.insert(v1, l_Children_0[v3]);
end;
local v4 = {
    0.25, 
    Enum.EasingStyle.Quad, 
    Enum.EasingDirection.Out, 
    1, 
    true, 
    0
};
local v5 = {
    Brightness = 0
};
local function v9(v6) --[[ Line: 12 ]] --[[ Name: apply ]]
    -- upvalues: v1 (copy)
    for v7 = 1, #v1 do
        local v8 = v1[v7]:Clone();
        v8.Parent = v6;
        v8:Emit(math.random(1, 4));
        _G.destroy(v8, 0.4);
    end;
end;
v0.start = function(_, v11, v12, v13, v14) --[[ Line: 20 ]] --[[ Name: start ]]
    -- upvalues: v9 (copy), v4 (copy), v5 (copy)
    if v13:FindFirstChild("LowerTorso") == nil then
        return;
    elseif _G.checkRenderDistance(v13.HumanoidRootPart.CFrame.p) == false then
        return;
    else
        if (string.sub(v11, 1, 4) == "Mink" or v14 == true) and v12:FindFirstChild("HumanoidRootPart") then
            local l_v12_Children_0 = v12:GetChildren();
            for v16 = 1, #l_v12_Children_0 do
                if l_v12_Children_0[v16]:IsA("BasePart") then
                    v9(l_v12_Children_0[v16]);
                end;
            end;
            local v17 = script.minklight:Clone();
            v17.Parent = v12.HumanoidRootPart;
            _G.tween(v17, v4, v5);
            _G.destroy(v17, 0.2);
            local v18 = script.elec1:Clone();
            v18.Parent = v12.Head;
            v18.Pitch = math.random(90, 120) / 100;
            v18:Play();
            _G.destroy(v18, 1.1);
        end;
        return;
    end;
end;
return v0;