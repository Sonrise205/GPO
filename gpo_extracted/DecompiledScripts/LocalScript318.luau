local v0 = require(script.ConfigReader);
local v1 = {
    diameter = 120, 
    padding = 4, 
    count = 64, 
    size = 1024
};
local v2 = 0;
local l_new_0 = Vector2.new;
script.Parent.ImageRectSize = l_new_0(v0.GetSize(v1));
while task.wait(0.1) do
    script.Parent.ImageRectOffset = l_new_0(v0.GetOffset(v1, v2));
    v2 = v2 + 1;
end;