local l_getLastWordFromPascalCase_0 = require(script.Parent:WaitForChild("getLastWordFromPascalCase"));
local v1 = {};
for _, v3 in ipairs(script:GetChildren()) do
    v1[v3.Name] = v3;
end;
local function _(v4) --[[ Line: 44 ]] --[[ Name: getConstraintTemplate ]]
    -- upvalues: l_getLastWordFromPascalCase_0 (copy), v1 (copy)
    return v1[l_getLastWordFromPascalCase_0(v4)] or v1.Default;
end;
local function _(v6) --[[ Line: 49 ]] --[[ Name: createConstraint ]]
    -- upvalues: l_getLastWordFromPascalCase_0 (copy), v1 (copy)
    local l_Name_0 = v6.Joint.Name;
    local v8 = (v1[l_getLastWordFromPascalCase_0(l_Name_0)] or v1.Default):Clone();
    v8.Attachment0 = v6.Attachment0;
    v8.Attachment1 = v6.Attachment1;
    v8.Name = l_Name_0 .. "RagdollConstraint";
    local l_ObjectValue_0 = Instance.new("ObjectValue");
    l_ObjectValue_0.Name = "RigidJoint";
    l_ObjectValue_0.Value = v6.Joint;
    l_ObjectValue_0.Parent = v8;
    return v8;
end;
return function(v11) --[[ Line: 69 ]]
    -- upvalues: l_getLastWordFromPascalCase_0 (copy), v1 (copy)
    local l_Folder_0 = Instance.new("Folder");
    l_Folder_0.Name = "RagdollConstraints";
    for _, v14 in pairs(v11) do
        if v14.Joint.Name ~= "Root" then
            local l_Name_1 = v14.Joint.Name;
            local v16 = (v1[l_getLastWordFromPascalCase_0(l_Name_1)] or v1.Default):Clone();
            v16.Attachment0 = v14.Attachment0;
            v16.Attachment1 = v14.Attachment1;
            v16.Name = l_Name_1 .. "RagdollConstraint";
            local l_ObjectValue_1 = Instance.new("ObjectValue");
            l_ObjectValue_1.Name = "RigidJoint";
            l_ObjectValue_1.Value = v14.Joint;
            l_ObjectValue_1.Parent = v16;
            v16.Parent = l_Folder_0;
        end;
    end;
    return l_Folder_0;
end;