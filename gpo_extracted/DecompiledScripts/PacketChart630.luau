local l_RunService_0 = game:GetService("RunService");
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_Parent_0 = script.Parent.Parent;
local l_Components_0 = l_Parent_0.Components;
local l_Modules_0 = l_Parent_0.Modules;
local v5 = require(l_Modules_0.Packages);
local v6 = require(v5.Directory.Roact);
local v7 = require(v5.Directory.Signal);
local v8 = require(v5.Directory.PacketSizeCounter);
local v9 = require(l_Components_0.StudioTheme);
local v10 = require(l_Components_0.PacketCircleArcs);
local v11 = require(l_Components_0.PacketChartItems);
local v12 = require(l_Components_0.ChartResize);
local v13 = require(l_Modules_0.TableToSyntaxString);
local v14 = not l_RunService_0:IsRunning();
local v15 = 0;
local function _() --[[ Line: 29 ]] --[[ Name: GetRemoteColor ]]
    -- upvalues: v15 (ref)
    v15 = (v15 + 0.6180339887498949) % 1;
    return (Color3.fromHSV(v15, 0.5, 0.95));
end;
local l_l_ReplicatedStorage_0_FirstChild_0 = l_ReplicatedStorage_0:FindFirstChild("RemoteName.profiler", true);
local v18 = nil;
if l_l_ReplicatedStorage_0_FirstChild_0 == nil then
    local v19 = nil;
    do
        local l_v19_0 = v19;
        l_v19_0 = l_ReplicatedStorage_0.DescendantAdded:Connect(function(v21) --[[ Line: 41 ]]
            -- upvalues: v18 (ref), l_v19_0 (ref)
            if v21.Name == "RemoteName.profiler" then
                assert(typeof(require(v21)) == "function", "Return of RemoteName.profiler must be a function");
                v18 = require(v21);
                l_v19_0:Disconnect();
            end;
        end);
    end;
else
    assert(typeof(require(l_l_ReplicatedStorage_0_FirstChild_0)) == "function", "Return of RemoteName.profiler must be a function");
    v18 = require(l_l_ReplicatedStorage_0_FirstChild_0);
end;
local function v25(v22, ...) --[[ Line: 53 ]] --[[ Name: GetRemoteData ]]
    -- upvalues: v18 (ref)
    local v23 = v18 and v18(v22, ...);
    if not v23 then
        local l_Name_0 = v22.Name;
        return (("%*.%*"):format(v22.Parent, l_Name_0));
    else
        return v23;
    end;
end;
local v26 = v6.Component:extend("PacketChart");
v26.init = function(v27) --[[ Line: 65 ]] --[[ Name: init ]]
    -- upvalues: v7 (copy), v6 (copy)
    v27.ArcsUpdated = v7.new();
    v27.OnArcClicked = v7.new();
    local v28, v29 = v6.createBinding(false);
    v27.ChartEnabled = v28;
    v27.SetChartEnabled = v29;
    v28, v29 = v6.createBinding({
        Size = 0, 
        Visible = false
    });
    v27.ScrollBarChanged = v28;
    v27.SetScrollBarChanged = v29;
    v27.OpenRemoteData = v7.new();
    v27:setState({
        Arcs = {}
    });
end;
v26.didMount = function(v30) --[[ Line: 81 ]] --[[ Name: didMount ]]
    -- upvalues: v25 (copy), v13 (copy), v8 (copy), v15 (ref)
    v30.props.Signals.ProfilerFrameSelected:Connect(function(v31) --[[ Line: 82 ]]
        -- upvalues: v25 (ref), v13 (ref), v8 (ref), v15 (ref), v30 (copy)
        local v32 = {};
        for _, v34 in v31.Packets do
            local v35 = v25(v34.Remote, unpack(v34.RawData));
            local l_Size_0 = v34.Size;
            if typeof(v35) == "string" then
                if not v32[v35] then
                    v32[v35] = {
                        Size = 0, 
                        Data = {}
                    };
                end;
                local v37 = v32[v35];
                v37.Size = v37.Size + l_Size_0;
                v37 = #v32[v35].Data + 1;
                v32[v35].Data[v37] = {
                    Name = ("Remote call %*:"):format(v37), 
                    Packet = ("%*"):format(v34.Data and v13(v34.Data) or "[None]")
                };
            else
                local v38 = 0;
                local v39 = {};
                for v40, v41 in v35 do
                    local v42 = v8.GetPacketSize({
                        RunContext = v34.RunContext, 
                        RemoteType = "RemoteEvent", 
                        PacketData = v41.Arguments
                    }) - v8.BaseRemoteOverhead;
                    if v34.RunContext == "Client" then
                        v42 = v42 - v8.ClientToServerOverhead;
                    end;
                    v39[v40] = v42;
                    v38 = v38 + v42;
                end;
                for v43, v44 in v35 do
                    local l_Name_1 = v44.Name;
                    if not v32[l_Name_1] then
                        v32[l_Name_1] = {
                            Size = 0, 
                            Data = {}
                        };
                    end;
                    local v46 = v32[l_Name_1];
                    v46.Size = v46.Size + v39[v43] / v38 * l_Size_0;
                    v46 = #v32[l_Name_1].Data + 1;
                    v32[l_Name_1].Data[v46] = {
                        Name = v44.Name, 
                        Packet = v13(v44.Arguments, true)
                    };
                end;
            end;
        end;
        local v47 = {};
        local l_TotalSize_0 = v31.TotalSize;
        for v49, v50 in v32 do
            local v51 = v50.Size / l_TotalSize_0;
            v15 = (v15 + 0.6180339887498949) % 1;
            local v52 = Color3.fromHSV(v15, 0.5, 0.95);
            table.insert(v47, {
                Name = v49, 
                DataSize = v50.Size, 
                Percent = v51 * 100, 
                Color = v52, 
                RemoteData = v50.Data
            });
        end;
        table.sort(v47, function(v53, v54) --[[ Line: 159 ]]
            return v53.Percent > v54.Percent;
        end);
        v30:setState({
            Arcs = v47
        });
    end);
    v30.props.Signals.ProfilerPaused:Connect(function(v55) --[[ Line: 167 ]]
        -- upvalues: v30 (copy)
        v30.SetChartEnabled(v55);
    end);
    v30.props.OnEnabled:Connect(function(v56) --[[ Line: 170 ]]
        -- upvalues: v30 (copy)
        v30.SetChartEnabled(v56);
    end);
end;
v26.render = function(v57) --[[ Line: 175 ]] --[[ Name: render ]]
    -- upvalues: v6 (copy), v5 (copy), l_Components_0 (copy), v9 (copy), v12 (copy), v14 (copy), v10 (copy), v11 (copy)
    return v6.createElement(v5.IsPlugin and require(l_Components_0.StudioWidget) or "ScreenGui", ({
        Plugin = {
            WidgetId = "PacketChart", 
            WidgetTitle = "Packet Chart", 
            InitialDockState = Enum.InitialDockState.Float, 
            Enabled = v57.props.Enabled, 
            OnEnabled = v57.props.OnEnabled, 
            DefaultSize = Vector2.new(350, 200), 
            ZIndexBehavior = Enum.ZIndexBehavior.Sibling, 
            MinimumSize = Vector2.new(300, 100)
        }, 
        Client = {
            IgnoreGuiInset = true, 
            ResetOnSpawn = false, 
            Enabled = v57.ChartEnabled, 
            ZIndexBehavior = Enum.ZIndexBehavior.Sibling
        }
    })[v5.IsPlugin and "Plugin" or "Client"], {
        Holder = v9(function(v58) --[[ Line: 194 ]]
            -- upvalues: v12 (ref), v6 (ref), v5 (ref), v14 (ref), v57 (copy), v10 (ref), v11 (ref)
            return v12(function(v59) --[[ Line: 195 ]]
                -- upvalues: v6 (ref), v5 (ref), v58 (copy), v14 (ref), v57 (ref), v10 (ref), v11 (ref)
                return v6.createElement("Frame", {
                    BackgroundTransparency = 1, 
                    AnchorPoint = v5.IsPlugin and Vector2.new() or Vector2.new(1, 0), 
                    Position = v5.IsPlugin and UDim2.new() or UDim2.new(1, 0, 0, 61), 
                    Size = v5.IsPlugin and UDim2.fromScale(1, 1) or v59.UISize, 
                    [v6.Ref] = not v5.IsPlugin and v59.SetSizeTarget or nil
                }, {
                    Background = v6.createElement("Frame", {
                        BackgroundColor3 = v58:GetColor("MainBackground"), 
                        BorderSizePixel = 0, 
                        ZIndex = 0, 
                        Size = UDim2.fromScale(1, 1)
                    }, {
                        Notches = v6.createElement("ImageLabel", {
                            AnchorPoint = Vector2.new(0, 1), 
                            BackgroundTransparency = 1, 
                            Image = "rbxassetid://18701486909", 
                            ImageColor3 = v58:GetColor("BrightText"), 
                            ImageTransparency = 0.5, 
                            Position = UDim2.fromScale(0, 1), 
                            Size = UDim2.fromOffset(16, 16)
                        })
                    }), 
                    UIStroke = v6.createElement("UIStroke", {
                        Color = v58:GetColor("DropShadow"), 
                        Thickness = 1
                    }), 
                    BackgroundCircle = v6.createElement("Frame", {
                        BackgroundTransparency = 1, 
                        Size = UDim2.fromOffset(100, 100), 
                        Visible = not v14, 
                        Position = UDim2.fromOffset(8, 8)
                    }, {
                        BackgroundUI = v6.createElement("Frame", {
                            BackgroundColor3 = v58:GetColor("ScrollBarBackground"), 
                            Size = UDim2.fromScale(1, 1), 
                            Visible = #v57.state.Arcs > 0
                        }, {
                            UIStroke = v6.createElement("UIStroke", {
                                Color = v58:GetColor("DropShadow"), 
                                LineJoinMode = Enum.LineJoinMode.Round, 
                                Transparency = 0.5
                            }), 
                            UICorner = v6.createElement("UICorner", {
                                CornerRadius = UDim.new(0, 4)
                            })
                        }), 
                        PacketCircle = v6.createElement(v10, {
                            Arcs = v57.state.Arcs, 
                            PluginMouse = v57.props.PluginMouse, 
                            OnArcClicked = function(v60) --[[ Line: 247 ]] --[[ Name: OnArcClicked ]]
                                -- upvalues: v57 (ref)
                                v57.OnArcClicked:Fire(v60);
                            end
                        })
                    }), 
                    DataList = v6.createElement("ScrollingFrame", {
                        BackgroundColor3 = v58:GetColor("MainBackground"), 
                        Size = UDim2.new(1, -121, 1, -1), 
                        Position = UDim2.new(1, -1, 0, 0), 
                        AnchorPoint = Vector2.new(1, 0), 
                        AutomaticCanvasSize = Enum.AutomaticSize.Y, 
                        CanvasSize = UDim2.new(), 
                        BorderSizePixel = 0, 
                        BackgroundTransparency = 1, 
                        Visible = not v14, 
                        ZIndex = 2, 
                        BottomImage = "rbxassetid://5234388158", 
                        MidImage = "rbxassetid://5234388158", 
                        TopImage = "rbxassetid://5234388158", 
                        ScrollBarImageColor3 = v58:GetColor("Light"), 
                        ScrollBarThickness = 10, 
                        [v6.Change.AbsoluteCanvasSize] = function(v61) --[[ Line: 269 ]]
                            -- upvalues: v57 (ref)
                            v57.SetScrollBarChanged({
                                Size = v61.AbsoluteSize.Y, 
                                Visible = v61.AbsoluteSize.Y < v61.AbsoluteCanvasSize.Y
                            });
                        end, 
                        [v6.Change.AbsoluteSize] = function(v62) --[[ Line: 275 ]]
                            -- upvalues: v57 (ref)
                            v57.SetScrollBarChanged({
                                Size = v62.AbsoluteSize.Y, 
                                Visible = v62.AbsoluteSize.Y < v62.AbsoluteCanvasSize.Y
                            });
                        end
                    }, {
                        UIListLayout = v6.createElement("UIListLayout", {
                            SortOrder = Enum.SortOrder.LayoutOrder, 
                            FillDirection = Enum.FillDirection.Vertical, 
                            HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                            VerticalAlignment = Enum.VerticalAlignment.Top, 
                            [v6.Change.AbsoluteContentSize] = function(v63) --[[ Line: 287 ]]
                                v63.Parent.CanvasSize = UDim2.fromOffset(0, v63.AbsoluteContentSize.Y);
                            end
                        }), 
                        Items = v6.createElement(v11, {
                            Arcs = v57.state.Arcs, 
                            ScrollBarChanged = v57.ScrollBarChanged, 
                            OnArcClicked = v57.OnArcClicked
                        }), 
                        UIPadding = v6.createElement("UIPadding", {
                            PaddingTop = UDim.new(0, 8), 
                            PaddingBottom = UDim.new(0, 8)
                        })
                    }), 
                    EditModeNotifier = v6.createElement("TextLabel", {
                        AutoLocalize = false, 
                        Size = UDim2.fromScale(1, 1), 
                        Position = UDim2.fromScale(0.5, 0.5), 
                        AnchorPoint = Vector2.new(0.5, 0.5), 
                        BackgroundTransparency = 1, 
                        Text = "Start session to begin", 
                        TextColor3 = v58:GetColor("WarningText"), 
                        TextSize = 20, 
                        Font = Enum.Font.SourceSans, 
                        TextXAlignment = Enum.TextXAlignment.Center, 
                        TextYAlignment = Enum.TextYAlignment.Center, 
                        Visible = v14
                    }), 
                    ScrollBarOutline = v6.createElement("Frame", {
                        BackgroundColor3 = v58:GetColor("ScrollBarBackground"), 
                        BorderSizePixel = 0, 
                        Size = v57.ScrollBarChanged:map(function(v64) --[[ Line: 318 ]]
                            return UDim2.fromOffset(12, v64.Size);
                        end), 
                        Position = UDim2.new(1, 0, 0, 0), 
                        AnchorPoint = Vector2.new(1, 0), 
                        Visible = v57.ScrollBarChanged:map(function(v65) --[[ Line: 323 ]]
                            return v65.Visible;
                        end)
                    })
                });
            end);
        end)
    });
end;
return v26;