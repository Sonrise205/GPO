local v0 = require(script.FallbackImages);
local v1 = require(script.GetImageSetData);
local v2 = {};
for v3, v4 in pairs(v1(1)) do
    local v5 = {
        Image = v0[v4.ImageSet], 
        ImageRectOffset = v4.ImageRectOffset, 
        ImageRectSize = v4.ImageRectSize, 
        ResampleMode = Enum.ResamplerMode.Default
    };
    v2["images/roblox/" .. v3 .. "/1x"] = v5;
    v2["images/roblox/" .. v3 .. "/2x"] = v5;
    v2["images/roblox/" .. v3 .. "/3x"] = v5;
end;
return v2;