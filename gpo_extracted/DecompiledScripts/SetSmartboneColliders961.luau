local l_Parent_0 = script.Parent;
local v1 = {
    "UpperTorso", 
    "Head", 
    "LeftUpperArm", 
    "RightUpperArm", 
    "RightUpperLeg", 
    "LeftUpperLeg"
};
for v2 = 1, #v1 do
    local v3 = l_Parent_0:WaitForChild(v1[v2], 3);
    if v3 then
        game:GetService("CollectionService"):AddTag(v3, "SmartCollider");
        game:GetService("CollectionService"):AddTag(v3, "SmartBone");
        game:GetService("CollectionService"):AddTag(v3, "Roots");
        v3:SetAttribute("ColliderShape", "Box");
    end;
end;
script:Destroy();