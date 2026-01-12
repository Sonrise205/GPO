local l_Players_0 = game:GetService("Players");
local l_Parent_0 = script.Parent.Parent;
local l_Components_0 = l_Parent_0.Components;
local l_Modules_0 = l_Parent_0.Modules;
local v4 = require(l_Modules_0.Packages);
local v5 = require(v4.Directory.Roact);
local v6 = require(v4.Directory.Signal);
local v7 = require(l_Components_0.StudioTheme);
local v8 = require(l_Components_0.PacketFrames);
local v9 = require(l_Components_0.TopbarButtonsGroup);
local v10 = require(l_Components_0.TopbarButton);
local v11 = v4.IsPlugin and game:GetService("CoreGui") or l_Players_0.LocalPlayer.PlayerGui;
local v12 = v5.Component:extend("PacketProfiler");
v12.init = function(v13) --[[ Line: 22 ]] --[[ Name: init ]]
    -- upvalues: v5 (copy), v6 (copy)
    v13:setState({
        MaxFrameSize = 1000
    });
    v13.Cleanup = {};
    local v14, v15 = v5.createBinding(false);
    v13.PacketProfilerPaused = v14;
    v13.SetPacketProfilerPaused = v15;
    v13.OnPacketProfilerPaused = v6.new();
    table.insert(v13.Cleanup, v13.OnPacketProfilerPaused:Connect(function(v16) --[[ Line: 32 ]]
        -- upvalues: v13 (copy)
        v13.SetPacketProfilerPaused(v16);
    end));
    v13.Pause = function(v17) --[[ Line: 36 ]] --[[ Name: Pause ]]
        -- upvalues: v13 (copy)
        v13.OnPacketProfilerPaused:Fire(v17);
    end;
end;
v12.didMount = function(v18) --[[ Line: 41 ]] --[[ Name: didMount ]]
    table.insert(v18.Cleanup, v18.props.Signals.ProfilerPaused:Connect(function(v19) --[[ Line: 42 ]]
        -- upvalues: v18 (copy)
        v18.Pause(v19);
    end));
end;
v12.willUnmount = function(v20) --[[ Line: 46 ]] --[[ Name: willUnmount ]]
    for _, v22 in v20.Cleanup do
        v22:Disconnect();
    end;
end;
v12.render = function(v23) --[[ Line: 52 ]] --[[ Name: render ]]
    -- upvalues: v4 (copy), v5 (copy), v11 (copy), v7 (copy), v8 (copy), v10 (copy), v9 (copy)
    local v24 = v4.IsPlugin and "Left" or "Right";
    local v25 = v4.IsPlugin and -1 or 1;
    return v5.createElement(v5.Portal, {
        target = v11
    }, {
        PacketProfiler = v5.createElement("ScreenGui", {
            DisplayOrder = 10, 
            IgnoreGuiInset = true, 
            ResetOnSpawn = false, 
            ZIndexBehavior = Enum.ZIndexBehavior.Sibling
        }, {
            Background = v7(function(v26) --[[ Line: 65 ]]
                -- upvalues: v5 (ref), v8 (ref), v23 (copy)
                return v5.createElement("Frame", {
                    BackgroundColor3 = v26:GetColor("Light"), 
                    BorderSizePixel = 1, 
                    BorderColor3 = v26:GetColor("Border"), 
                    Size = UDim2.new(1, 0, 0, 50), 
                    Position = UDim2.fromOffset(0, 10)
                }, {
                    PacketFrames = v5.createElement(v8, {
                        Enabled = v23.props.Enabled, 
                        MaxFrameSize = v23.state.MaxFrameSize, 
                        OnPacketProfilerPaused = v23.OnPacketProfilerPaused, 
                        OnPacketProfilerEnabled = v23.props.OnEnabled, 
                        Signals = v23.props.Signals
                    })
                });
            end), 
            Topbar = v7(function(v27) --[[ Line: 82 ]]
                -- upvalues: v5 (ref), v24 (copy), v10 (ref), v25 (copy), v9 (ref), v23 (copy)
                return v5.createElement("Frame", {
                    BackgroundColor3 = v27:GetColor("Item"), 
                    BorderSizePixel = 0, 
                    ZIndex = 2, 
                    Size = UDim2.new(1, 0, 0, 10)
                }, {
                    UIListLayout = v5.createElement("UIListLayout", {
                        FillDirection = Enum.FillDirection.Horizontal, 
                        HorizontalAlignment = v24 == "Left" and Enum.HorizontalAlignment.Left or Enum.HorizontalAlignment.Right, 
                        VerticalAlignment = Enum.VerticalAlignment.Center, 
                        SortOrder = Enum.SortOrder.LayoutOrder, 
                        Padding = UDim.new(0, 5)
                    }), 
                    Title = v5.createElement(v10, {
                        Text = "PacketProfiler", 
                        Theme = v27, 
                        LayoutOrder = v25
                    }), 
                    MaxKBScale = v5.createElement(v9, {
                        Theme = v27, 
                        Text = "Max KB scale", 
                        Options = {
                            {
                                Name = "10 B", 
                                Callback = function() --[[ Line: 107 ]] --[[ Name: Callback ]]
                                    -- upvalues: v23 (ref)
                                    v23:setState({
                                        MaxFrameSize = 10
                                    });
                                end
                            }, 
                            {
                                Name = "100 B", 
                                Callback = function() --[[ Line: 115 ]] --[[ Name: Callback ]]
                                    -- upvalues: v23 (ref)
                                    v23:setState({
                                        MaxFrameSize = 100
                                    });
                                end
                            }, 
                            {
                                Name = "1 KB", 
                                Callback = function() --[[ Line: 123 ]] --[[ Name: Callback ]]
                                    -- upvalues: v23 (ref)
                                    v23:setState({
                                        MaxFrameSize = 1000
                                    });
                                end
                            }, 
                            {
                                Name = "10 KB", 
                                Callback = function() --[[ Line: 131 ]] --[[ Name: Callback ]]
                                    -- upvalues: v23 (ref)
                                    v23:setState({
                                        MaxFrameSize = 10000
                                    });
                                end
                            }, 
                            {
                                Name = "50 KB", 
                                Callback = function() --[[ Line: 139 ]] --[[ Name: Callback ]]
                                    -- upvalues: v23 (ref)
                                    v23:setState({
                                        MaxFrameSize = 50000
                                    });
                                end
                            }, 
                            {
                                Name = "100 KB", 
                                Callback = function() --[[ Line: 147 ]] --[[ Name: Callback ]]
                                    -- upvalues: v23 (ref)
                                    v23:setState({
                                        MaxFrameSize = 100000
                                    });
                                end
                            }
                        }, 
                        LayoutOrder = v25 * 2
                    }), 
                    PausedLabel = v5.createElement(v10, {
                        Text = v23.PacketProfilerPaused:map(function(v28) --[[ Line: 157 ]]
                            if v28 then
                                return "[Paused]";
                            else
                                return "[Running]";
                            end;
                        end), 
                        Theme = v27, 
                        OnClick = function() --[[ Line: 161 ]] --[[ Name: OnClick ]]
                            -- upvalues: v23 (ref)
                            v23.props.Signals.ProfilerPaused:Fire(not v23.PacketProfilerPaused:getValue());
                        end, 
                        LayoutIndex = v25 * 3
                    })
                });
            end)
        })
    });
end;
return v12;