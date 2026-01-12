local l_Packages_0 = script.Parent.Parent.Packages;
local v1 = require(l_Packages_0.Roact);
local l_createElement_0 = v1.createElement;
local v3 = require(script.Parent.Notification);
local v4 = v1.PureComponent:extend(script.Name);
v4.render = function(_) --[[ Line: 10 ]] --[[ Name: render ]]
    -- upvalues: l_createElement_0 (copy), v3 (copy)
    return l_createElement_0(v3, {
        TitleText = "Notification", 
        OnClose = warn
    }, {
        Test = l_createElement_0("TextLabel", {
            Size = UDim2.fromOffset(200, 100), 
            BackgroundTransparency = 0.9, 
            Text = "[Roact.Children] goes here.\n200 x 100 test TextLabel", 
            TextColor3 = Color3.fromRGB(255, 255, 255)
        })
    });
end;
return v4;