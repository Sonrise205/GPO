local l_Parent_0 = script.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_1.Roact);
local v3 = require(l_Parent_1.Sift);
local v4 = require(l_Parent_0.strict);
local v5 = {
    Provider = require(script.StyleProvider), 
    Consumer = require(script.StyleConsumer), 
    ApplyDescription = require(script.ApplyDescription), 
    RegisterStateAction = require(script.RegisterStateAction), 
    ColorThemes = {
        DarkTheme = require(script.Themes["Color.DarkTheme"]), 
        LightTheme = require(script.Themes["Color.LightTheme"])
    }, 
    FontThemes = {
        SourceSans = require(script.Themes["Font.SourceSansTheme"]), 
        Gotham = require(script.Themes["Font.GothamTheme"])
    }, 
    StyleThemes = {
        Default = require(script.Themes["Style.Default"])
    }, 
    ImageThemes = {
        Default = require(script.Themes["Image.Default"]), 
        RobloxImages = require(script.Themes["Image.RobloxImages.lua"])
    }
};
for _, v7 in pairs(script.Themes:GetChildren()) do
    local v8, v9 = unpack(v7.Name:split("."));
    if v8 and v9 and (v8 == "Color" or v8 == "Font" or v8 == "Style") then
        xpcall(function() --[[ Line: 47 ]]
            -- upvalues: v5 (copy), v8 (copy), v9 (copy), v7 (copy)
            v5[v8 .. "Themes"][v9] = require(v7);
        end, function(v10) --[[ Line: 49 ]]
            -- upvalues: v7 (copy)
            warn("Failed to register theme. Theme:", v7, "Error:", v10);
        end);
    end;
end;
local v17 = {
    colors = function(v11) --[[ Line: 56 ]] --[[ Name: colors ]]
        if typeof(v11) == "Color3" then
            return {
                Color = v11, 
                Transparency = 0
            };
        else
            warn("A missing color style was found for", v11, "in Winro theme files");
            local v12 = nil;
            local v13 = math.random(0, 2);
            if v13 == 0 then
                v12 = Color3.new(0, 1, 1);
            elseif v13 == 1 then
                v12 = Color3.new(1, 0, 1);
            elseif v13 == 2 then
                v12 = Color3.new(1, 1, 0);
            end;
            return {
                Color = v12, 
                Transparency = 0.25
            };
        end;
    end, 
    images = function(v14) --[[ Line: 85 ]] --[[ Name: images ]]
        if tostring(v14):find("rbxassetid://") then
            return {
                Image = v14, 
                ImageRectOffset = Vector2.new(), 
                ImageRectSize = Vector2.new()
            };
        else
            warn("A missing image style was found for", v14, "in Winro image files");
            return {
                Image = "rbxassetid://925810526", 
                ImageTransparency = 0.75, 
                ImageRectOffset = Vector2.new(), 
                ImageRectSize = Vector2.new(), 
                ScaleType = Enum.ScaleType.Tile, 
                ResampleMode = Enum.ResamplerMode.Pixelated, 
                TileSize = UDim2.fromOffset(25, 25)
            };
        end;
    end, 
    styles = function(v15) --[[ Line: 109 ]] --[[ Name: styles ]]
        error(("could not find a style with the path of `%s`"):format(v15));
    end, 
    fonts = function(v16) --[[ Line: 112 ]] --[[ Name: fonts ]]
        if typeof(v16) == "EnumItem" then
            return {
                Font = Font.fromEnum(v16), 
                Size = 20, 
                LineHeight = 20, 
                ParagraphSpacing = 0
            };
        else
            warn("A missing font style was found for", v16, "in Winro theme files");
            return {
                Font = Font.fromEnum(Enum.Font.RobotoMono), 
                Size = 14, 
                LineHeight = 0.74, 
                ParagraphSpacing = 0
            };
        end;
    end
};
v5.new = function(v18) --[[ Line: 136 ]] --[[ Name: new ]]
    -- upvalues: v3 (copy), v17 (copy)
    local v19 = v3.Dictionary.join({}, unpack(v18));
    return (setmetatable({}, {
        __newindex = function() --[[ Line: 143 ]] --[[ Name: __newindex ]]
            error("Theme is read only.");
        end, 
        __index = function(_, v21) --[[ Line: 146 ]] --[[ Name: __index ]]
            -- upvalues: v19 (copy), v17 (ref)
            local v22 = rawget(v19, v21);
            if v22 ~= nil then
                return v22;
            else
                local v23 = v17[tostring(v21):split("/")[1]];
                if v23 then
                    return v23(v21);
                elseif v21 ~= nil then
                    return v21;
                else
                    warn(("`%s` is not a valid member of Theme."):format((tostring(v21))));
                    return function() --[[ Line: 167 ]]
                        -- upvalues: v21 (copy)
                        error(("`%s` is not a valid member of Theme."):format((tostring(v21))));
                    end;
                end;
            end;
        end
    }));
end;
v5.Themes = {
    DarkTheme = v5.new({
        v5.ImageThemes.Default, 
        v5.ImageThemes.RobloxImages, 
        v5.StyleThemes.Default, 
        v5.FontThemes.SourceSans, 
        v5.ColorThemes.DarkTheme
    }), 
    LightTheme = v5.new({
        v5.ImageThemes.Default, 
        v5.ImageThemes.RobloxImages, 
        v5.StyleThemes.Default, 
        v5.FontThemes.SourceSans, 
        v5.ColorThemes.LightTheme
    })
};
v5.WithTheme = function(v24) --[[ Line: 194 ]] --[[ Name: WithTheme ]]
    -- upvalues: v2 (copy), v5 (copy)
    return v2.createElement(v5.Consumer, {
        render = function(v25) --[[ Line: 197 ]] --[[ Name: render ]]
            -- upvalues: v24 (copy), v5 (ref)
            if not v25 then
                return v24(v5.Themes.LightTheme);
            else
                return v24(v25.Theme);
            end;
        end
    });
end;
return v4(v5, "Winro.Theme");