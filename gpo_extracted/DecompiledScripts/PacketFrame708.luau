local l_Modules_0 = script.Parent.Parent.Modules;
local v1 = require(l_Modules_0.Packages);
local v2 = require(v1.Directory.Roact);
local v3 = v2.Component:extend("PacketFrame");
v3.render = function(v4) --[[ Line: 9 ]] --[[ Name: render ]]
    -- upvalues: v2 (copy)
    local l_props_0 = v4.props;
    return v2.createElement("ImageLabel", {
        Size = l_props_0.PacketsChanged:map(function(v6) --[[ Line: 12 ]]
            -- upvalues: l_props_0 (copy), v2 (ref), v4 (copy)
            local v7 = v6[l_props_0.Index];
            if not v7 then
                return v2.Constant.SkipBindingUpdate;
            else
                local v8 = math.min(v7.TotalSize / v4.props.MaxFrameSize, 1);
                local v9 = UDim2.fromScale(1 / l_props_0.MaxFrames, v8);
                if v9 == v4.PreviousFrameSize then
                    return v2.Constant.SkipBindingUpdate;
                else
                    v4.PreviousFrameSize = v9;
                    return v9;
                end;
            end;
        end), 
        Image = "rbxassetid://10370998310", 
        AnchorPoint = Vector2.new(0, 1), 
        Position = UDim2.fromScale(1 - l_props_0.Index / l_props_0.MaxFrames, 1), 
        BorderSizePixel = 0, 
        Visible = l_props_0.PacketsChanged:map(function(v10) --[[ Line: 31 ]]
            -- upvalues: l_props_0 (copy), v4 (copy), v2 (ref)
            local v11 = v10[l_props_0.Index] ~= nil;
            if v11 == v4.PreviousIsVisible then
                return v2.Constant.SkipBindingUpdate;
            else
                v4.PreviousIsVisible = v11;
                return v11;
            end;
        end), 
        BorderColor3 = Color3.new(1, 1, 1)
    });
end;
return v3;