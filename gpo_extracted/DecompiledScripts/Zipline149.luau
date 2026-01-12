local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_ZipLines_0 = workspace:WaitForChild("ZipLines");
if #l_ZipLines_0:GetChildren() <= 0 then
    l_ZipLines_0.ChildAdded:Wait();
end;
require(l_ReplicatedStorage_0.Modules["GPO Zipline"]).Initialize();