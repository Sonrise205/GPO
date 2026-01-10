local l_Packages_0 = script.Parent.Parent.Packages;
local v1 = require(l_Packages_0.Roact);
local l_createElement_0 = v1.createElement;
local v3 = require(script.Parent.Hint);
local v4 = v1.PureComponent:extend(script.Name);
v4.render = function(v5) --[[ Line: 10 ]] --[[ Name: render ]]
    -- upvalues: l_createElement_0 (copy), v3 (copy)
    local l_props_0 = v5.props;
    local v7 = (l_props_0.Image and "rbxthumb://type=AvatarHeadShot&id=649787117&w=48&h=48" or nil) and (l_props_0.ThumbnailAsImage or "rbxassetid://8303332379");
    return l_createElement_0(v3, {
        TitleText = l_props_0.Title and "<i>subtle</i> hint" or nil, 
        BodyText = "Hints shouldnt have that much text", 
        Image = v7
    });
end;
return {
    controls = {
        Title = false, 
        ThumbnailAsImage = true, 
        Image = true
    }, 
    story = function(v8) --[[ Line: 31 ]] --[[ Name: story ]]
        -- upvalues: l_createElement_0 (copy), v4 (copy)
        return l_createElement_0(v4, v8.controls);
    end
};