local l_Parent_0 = script.Parent;
local function v4(v1) --[[ Line: 3 ]] --[[ Name: cleanPart ]]
    local l_v1_Descendants_0 = v1:GetDescendants();
    for v3 = 1, #l_v1_Descendants_0 do
        if not l_v1_Descendants_0[v3]:IsA("Attachment") then
            l_v1_Descendants_0[v3]:Destroy();
        else
            l_v1_Descendants_0[v3].Visible = false;
        end;
    end;
end;
l_Parent_0:GetAttributeChangedSignal("Vaporated"):Connect(function() --[[ Line: 14 ]]
    -- upvalues: l_Parent_0 (copy), v4 (copy)
    local l_l_Parent_0_Descendants_0 = l_Parent_0:GetDescendants();
    local v6 = _G.getAccessorys(l_Parent_0);
    if v6 then
        for v7 = 1, #v6 do
            table.insert(l_l_Parent_0_Descendants_0, v6[v7]);
        end;
    end;
    for v8 = 1, #l_l_Parent_0_Descendants_0 do
        if l_l_Parent_0_Descendants_0[v8]:IsA("BasePart") then
            l_l_Parent_0_Descendants_0[v8].Transparency = 1;
            task.spawn(function() --[[ Line: 25 ]]
                -- upvalues: v4 (ref), l_l_Parent_0_Descendants_0 (copy), v8 (copy)
                v4(l_l_Parent_0_Descendants_0[v8]);
            end);
            if l_l_Parent_0_Descendants_0[v8].Parent == l_Parent_0 then
                l_l_Parent_0_Descendants_0[v8].Anchored = true;
            end;
        end;
    end;
end);