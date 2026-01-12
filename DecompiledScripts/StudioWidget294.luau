local l_script_FirstAncestorOfClass_0 = script:FindFirstAncestorOfClass("Plugin");
local l_Modules_0 = l_script_FirstAncestorOfClass_0:FindFirstChildOfClass("Script").Modules;
local v2 = require(l_Modules_0.Packages);
local v3 = require(v2.Directory.Roact);
local v4 = v3.Component:extend("StudioWidget");
v4.init = function(v5) --[[ Line: 10 ]] --[[ Name: init ]]
    -- upvalues: l_script_FirstAncestorOfClass_0 (copy)
    local v6 = DockWidgetPluginGuiInfo.new(v5.props.InitialDockState, v5.props.Enabled, false, v5.props.DefaultSize.X, v5.props.DefaultSize.Y, v5.props.MinimumSize.X, v5.props.MinimumSize.Y);
    local l_l_script_FirstAncestorOfClass_0_DockWidgetPluginGui_0 = l_script_FirstAncestorOfClass_0:CreateDockWidgetPluginGui(v5.props.WidgetId, v6);
    l_l_script_FirstAncestorOfClass_0_DockWidgetPluginGui_0.Title = v5.props.WidgetTitle;
    l_l_script_FirstAncestorOfClass_0_DockWidgetPluginGui_0.Name = v5.props.WidgetId;
    l_l_script_FirstAncestorOfClass_0_DockWidgetPluginGui_0.ZIndexBehavior = v5.props.ZIndexBehavior or Enum.ZIndexBehavior.Global;
    v5.Widget = l_l_script_FirstAncestorOfClass_0_DockWidgetPluginGui_0;
end;
v4.didMount = function(v8) --[[ Line: 29 ]] --[[ Name: didMount ]]
    v8.OnEnabled = v8.props.OnEnabled:Connect(function(v9) --[[ Line: 30 ]]
        -- upvalues: v8 (copy)
        v8.Widget.Enabled = v9;
    end);
    v8.Widget:BindToClose(function() --[[ Line: 33 ]]
        -- upvalues: v8 (copy)
        v8.Widget.Enabled = false;
    end);
end;
v4.render = function(v10) --[[ Line: 38 ]] --[[ Name: render ]]
    -- upvalues: v3 (copy)
    return v3.createElement(v3.Portal, {
        target = v10.Widget
    }, v10.props[v3.Children]);
end;
v4.didUpdate = function(v11, v12) --[[ Line: 44 ]] --[[ Name: didUpdate ]]
    if v11.props.Enabled ~= v12.Enabled then
        v11.Widget.Enabled = v11.props.Enabled;
    end;
end;
v4.willUnmount = function(v13) --[[ Line: 50 ]] --[[ Name: willUnmount ]]
    v13.OnEnabled:Disconnect();
end;
return v4;