local l_UserInputService_0 = game:GetService("UserInputService");
local l_Parent_0 = script.Parent.Parent;
local l_l_Parent_0_FirstAncestorOfClass_0 = l_Parent_0:FindFirstAncestorOfClass("Plugin");
local l_Components_0 = l_Parent_0.Components;
local l_Modules_0 = l_Parent_0.Modules;
local v5 = require(l_Modules_0.Packages);
local v6 = require(v5.Directory.Roact);
local v7 = require(v5.Directory.Signal);
v6.setGlobalConfig({
    elementTracing = true
});
local v8 = v6.Component:extend("MainPlugin");
v8.init = function(v9) --[[ Line: 18 ]] --[[ Name: init ]]
    -- upvalues: v7 (copy), l_l_Parent_0_FirstAncestorOfClass_0 (copy), v5 (copy)
    v9.OnPacketProfilerEnabled = v7.new();
    v9.IsPacketChartEnabled = if l_l_Parent_0_FirstAncestorOfClass_0 then l_l_Parent_0_FirstAncestorOfClass_0:GetSetting("PacketChartEnabled") == true else false;
    v9.OnPacketChartEnabled = v7.new();
    v9:setState({
        PacketProfilerEnabled = if l_l_Parent_0_FirstAncestorOfClass_0 then l_l_Parent_0_FirstAncestorOfClass_0:GetSetting("PacketProfilerEnabled") == true else false
    });
    if v5.IsPlugin then
        v9.props.PacketProfiler:SetActive(v9.state.PacketProfilerEnabled);
        v9.props.PacketChart:SetActive(v9.IsPacketChartEnabled);
    end;
    v9.Connections = {};
    v9.Signals = {
        ProfilerFrameSelected = v7.new(), 
        ProfilerPaused = v7.new()
    };
    v9.OnPacketProfilerClicked = function() --[[ Line: 38 ]] --[[ Name: OnPacketProfilerClicked ]]
        -- upvalues: v9 (copy), l_l_Parent_0_FirstAncestorOfClass_0 (ref)
        local v10 = not v9.state.PacketProfilerEnabled;
        v9.OnPacketProfilerEnabled:Fire(v10);
        v9:setState({
            PacketProfilerEnabled = v10
        });
        if l_l_Parent_0_FirstAncestorOfClass_0 then
            l_l_Parent_0_FirstAncestorOfClass_0:SetSetting("PacketProfilerEnabled", v10);
        end;
    end;
    v9.OnPacketChartClicked = function(v11) --[[ Line: 49 ]] --[[ Name: OnPacketChartClicked ]]
        -- upvalues: v9 (copy), l_l_Parent_0_FirstAncestorOfClass_0 (ref)
        local v12 = v11 or not v9.IsPacketChartEnabled;
        v9.IsPacketChartEnabled = v12;
        v9.OnPacketChartEnabled:Fire(v12);
        if l_l_Parent_0_FirstAncestorOfClass_0 then
            l_l_Parent_0_FirstAncestorOfClass_0:SetSetting("PacketChartEnabled", v12);
        end;
    end;
end;
v8.didMount = function(v13) --[[ Line: 60 ]] --[[ Name: didMount ]]
    -- upvalues: v5 (copy), l_UserInputService_0 (copy)
    if v5.IsPlugin then
        table.insert(v13.Connections, v13.props.PacketProfiler.Click:Connect(v13.OnPacketProfilerClicked));
        table.insert(v13.Connections, v13.props.PacketChart.Click:Connect(v13.OnPacketChartClicked));
        return;
    else
        table.insert(v13.Connections, l_UserInputService_0.InputBegan:Connect(function(v14) --[[ Line: 65 ]]
            -- upvalues: l_UserInputService_0 (ref), v13 (copy)
            if not l_UserInputService_0:IsKeyDown(Enum.KeyCode.LeftControl) then
                return;
            elseif v14.KeyCode == Enum.KeyCode.F5 then
                v13.OnPacketProfilerClicked();
                return;
            else
                if v14.KeyCode == Enum.KeyCode.P then
                    v13.ProfilerPaused = not v13.ProfilerPaused;
                    v13.Signals.ProfilerPaused:Fire(v13.ProfilerPaused);
                end;
                return;
            end;
        end));
        table.insert(v13.Connections, v13.Signals.ProfilerFrameSelected:Connect(function(v15) --[[ Line: 78 ]]
            -- upvalues: v13 (copy)
            if #v15.Packets == 0 then
                v13.OnPacketChartClicked(false);
                return;
            else
                v13.OnPacketChartClicked(true);
                return;
            end;
        end));
        return;
    end;
end;
v8.render = function(v16) --[[ Line: 88 ]] --[[ Name: render ]]
    -- upvalues: v6 (copy), l_Components_0 (copy), l_l_Parent_0_FirstAncestorOfClass_0 (copy)
    return v6.createFragment({
        PacketProfiler = v16.state.PacketProfilerEnabled and v6.createElement(require(l_Components_0.PacketProfiler), {
            Enabled = true, 
            OnEnabled = v16.OnPacketProfilerEnabled, 
            Signals = v16.Signals
        }) or nil, 
        PacketChart = v6.createElement(require(l_Components_0.PacketChart), {
            Enabled = v16.IsPacketChartEnabled, 
            OnEnabled = v16.OnPacketChartEnabled, 
            Signals = v16.Signals, 
            PluginMouse = l_l_Parent_0_FirstAncestorOfClass_0 and l_l_Parent_0_FirstAncestorOfClass_0:GetMouse() or nil
        })
    });
end;
v8.willUnmount = function(v17) --[[ Line: 104 ]] --[[ Name: willUnmount ]]
    for _, v19 in v17.Connections do
        v19:Disconnect();
    end;
    table.clear(v17.Connections);
end;
return v8;