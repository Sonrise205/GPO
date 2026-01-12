local l_Parent_0 = script.Parent.Parent;
local l_Packages_0 = l_Parent_0:FindFirstChild("Packages");
return {
    Directory = l_Packages_0 or l_Parent_0.Parent, 
    IsPlugin = l_Packages_0 ~= nil
};