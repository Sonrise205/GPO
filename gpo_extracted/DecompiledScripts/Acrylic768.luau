local l_Parent_0 = script.Parent.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_1.Sift);
local v3 = require(l_Parent_1.Roact);
local l_createElement_0 = v3.createElement;
local l_WithTheme_0 = require(l_Parent_0.Theme).WithTheme;
local v6 = v3.PureComponent:extend(script.Name);
v6.render = function(v7) --[[ Line: 16 ]] --[[ Name: render ]]
    -- upvalues: l_WithTheme_0 (copy), l_createElement_0 (copy), v2 (copy)
    return l_WithTheme_0(function(v8) --[[ Line: 19 ]]
        -- upvalues: l_createElement_0 (ref), v2 (ref), v7 (copy)
        local v9 = v8["images/Texture/Effect/Acrylic"];
        return l_createElement_0("ImageLabel", v2.Dictionary.join({
            BackgroundTransparency = 0.5, 
            Image = v9.Image, 
            ImageRectOffset = v9.ImageRectOffset, 
            ImageRectSize = v9.ImageRectSize, 
            ImageTransparency = v9.ImageTransparency, 
            ScaleType = v9.ScaleType, 
            TileSize = v9.TileSize
        }, v7.props));
    end);
end;
return v6;