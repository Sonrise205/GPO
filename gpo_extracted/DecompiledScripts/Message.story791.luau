local l_Packages_0 = script.Parent.Parent.Packages;
local v1 = require(l_Packages_0.Roact);
local l_createElement_0 = v1.createElement;
local v3 = require(script.Parent.Message);
local v4 = v1.PureComponent:extend(script.Name);
v4.render = function(v5) --[[ Line: 10 ]] --[[ Name: render ]]
    -- upvalues: l_createElement_0 (copy), v3 (copy)
    local l_props_0 = v5.props;
    local v7 = (l_props_0.Image and "rbxthumb://type=AvatarHeadShot&id=649787117&w=48&h=48" or nil) and (l_props_0.ThumbnailAsImage or "rbxassetid://8303332379");
    return l_createElement_0(v3, {
        TitleText = l_props_0.TitleText or "Message from <b>omwot</b>", 
        BodyText = "Dont we all love text wrapping because it is so great and this text should be wrapped, if it is not wrapped then something is wrong or it is just bad design. We all know about the things that we have to do but this is just some nonsense text in order to test some stuff. Blah blah blah is all i hear right now because yes and the yeaaou aou afouwa elf oug.", 
        Image = v7, 
        Condensed = l_props_0.Condensed
    });
end;
return {
    controls = {
        ThumbnailAsImage = true, 
        Image = true
    }, 
    stories = {
        Message = function(v8) --[[ Line: 32 ]] --[[ Name: Message ]]
            -- upvalues: l_createElement_0 (copy), v4 (copy)
            return l_createElement_0(v4, v8.controls);
        end, 
        SmallMessage = function(v9) --[[ Line: 35 ]] --[[ Name: SmallMessage ]]
            -- upvalues: l_createElement_0 (copy), v4 (copy)
            local v10 = table.clone(v9.controls);
            v10.Condensed = true;
            return l_createElement_0(v4, v10);
        end
    }
};