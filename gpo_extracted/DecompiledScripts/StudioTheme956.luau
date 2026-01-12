local l_Parent_0 = script.Parent.Parent;
local l_Components_0 = l_Parent_0.Components;
local l_Modules_0 = l_Parent_0.Modules;
local v3 = require(l_Modules_0.Packages);
local v4 = require(v3.Directory.Roact);
local v5 = require(l_Components_0.StudioSettings);
local v6 = v4.Component:extend("StudioThemeProvider");
v6.init = function(v7) --[[ Line: 11 ]] --[[ Name: init ]]
    -- upvalues: v5 (copy)
    v7:setState({
        CurrentTheme = v5.Theme
    });
    v7.StudioThemeChanged = v5.ThemeChanged:Connect(function() --[[ Line: 15 ]]
        -- upvalues: v7 (copy), v5 (ref)
        v7:setState({
            CurrentTheme = v5.Theme
        });
    end);
end;
v6.render = function(v8) --[[ Line: 22 ]] --[[ Name: render ]]
    -- upvalues: v4 (copy)
    return v4.oneChild(v8.props[v4.Children])(v8.state.CurrentTheme);
end;
v6.willUnmount = function(v9) --[[ Line: 27 ]] --[[ Name: willUnmount ]]
    v9.StudioThemeChanged:Disconnect();
end;
return function(v10) --[[ Line: 31 ]] --[[ Name: StudioTheme ]]
    -- upvalues: v4 (copy), v6 (copy)
    return v4.createElement(v6, {}, {
        Component = v10
    });
end;