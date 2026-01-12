local l_StarterGui_0 = game:GetService("StarterGui");
local l_Parent_0 = script.Parent;
local l_Parent_1 = l_Parent_0.Parent.Parent;
local v3 = require(l_Parent_1.Roact);
local v4 = require(l_Parent_0.StyleContext);
local v5 = v3.Component:extend("StyleProvider");
v5.init = function(v6) --[[ Line: 13 ]] --[[ Name: init ]]
    -- upvalues: l_StarterGui_0 (copy), l_Parent_0 (copy)
    v6.UpdateConnection = l_StarterGui_0:GetAttributeChangedSignal("Theme"):Connect(function() --[[ Line: 17 ]]
        -- upvalues: v6 (copy), l_Parent_0 (ref), l_StarterGui_0 (ref)
        if v6.props.Theme then
            return;
        else
            v6.ThemeObject:Update(require(l_Parent_0).Themes[l_StarterGui_0:GetAttribute("Theme")]);
            return;
        end;
    end);
    v6:setState({
        Theme = v6.props.Theme or require(l_Parent_0).Themes[l_StarterGui_0:GetAttribute("Theme")]
    });
end;
v5.render = function(v7) --[[ Line: 32 ]] --[[ Name: render ]]
    -- upvalues: v3 (copy), v4 (copy)
    local v10 = {
        Theme = v7.state.Theme, 
        Update = function(v8, v9) --[[ Line: 36 ]] --[[ Name: Update ]]
            -- upvalues: v7 (copy)
            if v7.mounted then
                v8.Theme = v9;
                v7:setState({
                    Theme = v9
                });
            end;
        end
    };
    v7.ThemeObject = v10;
    return v3.createElement(v4.Provider, {
        value = v10
    }, v3.createFragment(v7.props[v3.Children]));
end;
v5.didMount = function(v11) --[[ Line: 51 ]] --[[ Name: didMount ]]
    v11.mounted = true;
end;
v5.willUnmount = function(v12) --[[ Line: 55 ]] --[[ Name: willUnmount ]]
    v12.UpdateConnection:Disconnect();
    v12.mounted = false;
end;
return v5;