local l_RunService_0 = game:GetService("RunService");
local l_GuiService_0 = game:GetService("GuiService");
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_Parent_0 = script.Parent.Parent;
local l_Components_0 = l_Parent_0.Components;
local l_Modules_0 = l_Parent_0.Modules;
local v6 = require(l_Modules_0.Packages);
local v7 = require(v6.Directory.Roact);
local v8 = require(v6.Directory.PacketSizeCounter);
local v9 = require(l_Components_0.StudioTheme);
local v10 = require(l_Modules_0.CircularBuffer);
local v11 = require(l_Components_0.PacketFrame);
local l_l_GuiService_0_GuiInset_0 = l_GuiService_0:GetGuiInset();
local v13 = v7.Component:extend("PacketFrames");
local v14 = not l_RunService_0:IsRunning();
local v15 = l_RunService_0:IsClient() and "OnClientEvent" or "OnServerEvent";
local l_l_ReplicatedStorage_0_FirstChild_0 = l_ReplicatedStorage_0:FindFirstChild("RemoteFunctionEvent.profiler", true);
v13.init = function(v17) --[[ Line: 31 ]] --[[ Name: init ]]
    -- upvalues: v7 (copy), v14 (copy), v10 (copy), v13 (copy), l_RunService_0 (copy), v8 (copy), l_l_GuiService_0_GuiInset_0 (copy)
    v17.Cleanup = {};
    v17.ProfilerBackgroundRef = v7.createRef();
    v17.Enabled = not v14;
    v17.PacketFrames = v10.new(256);
    v17:setState({
        PacketFrames = v13
    });
    local v18, v19 = v7.createBinding(v17.PacketFrames);
    v17.PacketsChanged = v18;
    v17.SetPacketsChanged = v19;
    v17.RemoteCallback = function(v20, v21, ...) --[[ Line: 43 ]] --[[ Name: RemoteCallback ]]
        -- upvalues: v17 (copy), l_RunService_0 (ref), v8 (ref)
        if not v17.Enabled then
            return;
        else
            local v22 = 0;
            v22 = if l_RunService_0:IsClient() then v8.GetPacketSize({
                RunContext = "Client", 
                RemoteType = v20.ClassName, 
                PacketData = {
                    v21, 
                    ...
                }
            }) else v8.GetPacketSize({
                RunContext = "Server", 
                RemoteType = v20.ClassName, 
                PacketData = {
                    ...
                }
            });
            local l_CurrentFrame_0 = v17.CurrentFrame;
            l_CurrentFrame_0.TotalSize = l_CurrentFrame_0.TotalSize + v22;
            table.insert(v17.CurrentFrame.Packets, {
                Remote = v20, 
                Data = l_RunService_0:IsClient() and {
                    v21, 
                    ...
                } or {
                    ...
                }, 
                RawData = {
                    v21, 
                    ...
                }, 
                Size = v22, 
                RunContext = l_RunService_0:IsClient() and "Client" or "Server"
            });
            return;
        end;
    end;
    v17.InputBegan = function(_, v25) --[[ Line: 73 ]] --[[ Name: InputBegan ]]
        -- upvalues: v17 (copy), l_l_GuiService_0_GuiInset_0 (ref)
        if v25.UserInputType == Enum.UserInputType.MouseButton1 then
            local v26 = v17.UpdateMouseData(v25.Position.X, v25.Position.Y + l_l_GuiService_0_GuiInset_0.Y, true);
            if v26 then
                v17.props.Signals.ProfilerFrameSelected:Fire(v26);
            end;
            v17.props.OnPacketProfilerPaused:Fire(true);
        end;
    end;
    v18, v19 = v7.createBinding(Vector2.new(0, 0));
    v17.MousePosition = v18;
    v17.SetMousePosition = v19;
    v18, v19 = v7.createBinding(false);
    v17.MouseOver = v18;
    v17.SetMouseOver = v19;
    v18 = {
        Selected = false, 
        Index = 0, 
        TotalSize = 0, 
        Packets = {}
    };
    local v27;
    v19, v27 = v7.createBinding(v18);
    v17.SelectedFrameData = v19;
    v17.SetSelectedFrameData = v27;
    v19, v27 = v7.createBinding(v18);
    v17.MouseFrameData = v19;
    v17.SetMouseFrameData = v27;
    v17.UpdateMouseData = function(v28, v29, v30) --[[ Line: 96 ]] --[[ Name: UpdateMouseData ]]
        -- upvalues: v17 (copy), v18 (copy)
        v17.SetMousePosition(Vector2.new(v28, v29));
        local v31 = 256 - math.floor(v28 / (v17.ProfilerBackgroundRef:getValue().AbsoluteSize.X * 0.00390625));
        local v32 = v28 > 0 and v17.PacketFrames[v31] or nil;
        if v32 then
            local v33 = {
                Selected = v30, 
                Index = v31, 
                TotalSize = v32.TotalSize, 
                Packets = v32.Packets
            };
            if v30 then
                v17.SetSelectedFrameData(v33);
            end;
            v17.SetMouseFrameData(v33);
            return v32;
        else
            v17.SetMouseFrameData(v18);
            return v32;
        end;
    end;
    v17.MouseEnter = function(_, v35, v36) --[[ Line: 126 ]] --[[ Name: MouseEnter ]]
        -- upvalues: v14 (ref), v17 (copy)
        if v14 then
            return;
        else
            v17.UpdateMouseData(v35, v36, false);
            v17.SetMouseOver(true);
            return;
        end;
    end;
    v17.MouseMoved = function(_, v38, v39) --[[ Line: 134 ]] --[[ Name: MouseMoved ]]
        -- upvalues: v14 (ref), v17 (copy)
        if v14 then
            return;
        else
            v17.UpdateMouseData(v38, v39, false);
            return;
        end;
    end;
    v17.MouseLeave = function(_) --[[ Line: 141 ]] --[[ Name: MouseLeave ]]
        -- upvalues: v14 (ref), v17 (copy)
        if v14 then
            return;
        else
            v17.UpdateMouseData(-1, -1, false);
            v17.SetMouseOver(false);
            return;
        end;
    end;
    v19, v27 = v7.createBinding(Vector2.zero);
    v17.TooltipSize = v19;
    v17.SetTooltipSize = v27;
end;
v13.didMount = function(v41) --[[ Line: 153 ]] --[[ Name: didMount ]]
    -- upvalues: v14 (copy), l_RunService_0 (copy), v15 (copy), l_l_ReplicatedStorage_0_FirstChild_0 (ref), l_ReplicatedStorage_0 (copy)
    if not v14 then
        table.insert(v41.Cleanup, v41.props.OnPacketProfilerPaused:Connect(function(v42) --[[ Line: 155 ]]
            -- upvalues: v41 (copy)
            v41.Enabled = not v42;
        end));
        v41.CurrentFrame = {
            Time = os.clock(), 
            TotalSize = 0, 
            Packets = {}
        };
        task.spawn(function() --[[ Line: 165 ]]
            -- upvalues: l_RunService_0 (ref), v41 (copy), v15 (ref), l_l_ReplicatedStorage_0_FirstChild_0 (ref), l_ReplicatedStorage_0 (ref)
            for _, v44 in {
                game:GetService("ReplicatedStorage"), 
                game:GetService("ReplicatedFirst"), 
                game:GetService("StarterPlayer"), 
                game:GetService("Workspace"), 
                game:GetService("StarterGui"), 
                game:GetService("Players"), 
                if l_RunService_0:IsServer() then game:GetService("ServerScriptService") else nil, 
                if l_RunService_0:IsServer() then game:GetService("ServerStorage") else nil
            } do
                for _, v46 in v44:GetDescendants() do
                    if v46:IsA("RemoteEvent") or v46:IsA("UnreliableRemoteEvent") then
                        table.insert(v41.Cleanup, v46[v15]:Connect(function(...) --[[ Line: 181 ]]
                            -- upvalues: v41 (ref), v46 (copy)
                            v41.RemoteCallback(v46, ...);
                        end));
                    end;
                end;
                table.insert(v41.Cleanup, v44.DescendantAdded:Connect(function(v47) --[[ Line: 187 ]]
                    -- upvalues: v41 (ref), v15 (ref)
                    if v47:IsA("RemoteEvent") or v47:IsA("UnreliableRemoteEvent") then
                        table.insert(v41.Cleanup, v47[v15]:Connect(function(...) --[[ Line: 189 ]]
                            -- upvalues: v41 (ref), v47 (copy)
                            v41.RemoteCallback(v47, ...);
                        end));
                    end;
                end));
            end;
            if l_l_ReplicatedStorage_0_FirstChild_0 == nil then
                local v48 = nil;
                do
                    local l_v48_0 = v48;
                    l_v48_0 = l_ReplicatedStorage_0.DescendantAdded:Connect(function(v50) --[[ Line: 197 ]]
                        -- upvalues: l_l_ReplicatedStorage_0_FirstChild_0 (ref), v41 (ref), l_v48_0 (ref)
                        if v50:IsA("BindableEvent") and v50.Name == "RemoteFunctionEvent.profiler" then
                            l_l_ReplicatedStorage_0_FirstChild_0 = v50;
                            table.insert(v41.Cleanup, l_l_ReplicatedStorage_0_FirstChild_0.Event:Connect(v41.RemoteCallback));
                            l_v48_0:Disconnect();
                        end;
                    end);
                end;
            else
                table.insert(v41.Cleanup, l_l_ReplicatedStorage_0_FirstChild_0.Event:Connect(v41.RemoteCallback));
            end;
            table.insert(v41.Cleanup, l_RunService_0.RenderStepped:Connect(function() --[[ Line: 208 ]]
                -- upvalues: v41 (ref)
                if not v41.Enabled then
                    return;
                else
                    v41.PacketFrames:push(v41.CurrentFrame);
                    v41.SetPacketsChanged(v41.PacketFrames);
                    v41.CurrentFrame = {
                        Time = os.clock(), 
                        TotalSize = 0, 
                        Packets = {}
                    };
                    if v41.MouseOver:getValue() then
                        local v51 = v41.MousePosition:getValue();
                        v41.UpdateMouseData(v51.X, v51.Y, v41.SelectedFrameData:getValue().Selected);
                    end;
                    return;
                end;
            end));
        end);
    end;
end;
v13.willUnmount = function(v52) --[[ Line: 230 ]] --[[ Name: willUnmount ]]
    for _, v54 in v52.Cleanup do
        v54:Disconnect();
    end;
end;
v13.render = function(v55) --[[ Line: 236 ]] --[[ Name: render ]]
    -- upvalues: v7 (copy), v11 (copy), v9 (copy), v14 (copy)
    local v56 = {};
    for v57 = 1, 256 do
        v56[v57] = v7.createElement(v11, {
            Index = v57, 
            PacketsChanged = v55.PacketsChanged, 
            MaxFrameSize = v55.props.MaxFrameSize, 
            MaxFrames = 256
        });
    end;
    return v7.createElement("Frame", {
        Size = UDim2.fromScale(1, 1), 
        BackgroundTransparency = 1, 
        BorderSizePixel = 0, 
        [v7.Event.InputBegan] = v55.InputBegan, 
        [v7.Event.MouseEnter] = v55.MouseEnter, 
        [v7.Event.MouseMoved] = v55.MouseMoved, 
        [v7.Event.MouseLeave] = v55.MouseLeave, 
        [v7.Ref] = v55.ProfilerBackgroundRef
    }, {
        Frames = v7.createFragment(v56), 
        SelectedHighlight = v7.createElement("Frame", {
            Size = UDim2.fromScale(0.00390625, 1), 
            BackgroundTransparency = 0.5, 
            Position = v55.SelectedFrameData:map(function(v58) --[[ Line: 263 ]]
                return UDim2.fromScale(1 - v58.Index / 256, 0);
            end), 
            BorderSizePixel = 0, 
            Visible = v55.SelectedFrameData:map(function(v59) --[[ Line: 267 ]]
                return v59 and v59.Selected;
            end), 
            ZIndex = 2, 
            BackgroundColor3 = Color3.fromHex("#34ff30")
        }), 
        FrameHighlight = v7.createElement("Frame", {
            Size = v55.MouseFrameData:map(function(v60) --[[ Line: 274 ]]
                -- upvalues: v55 (copy)
                local v61 = math.min(v60.TotalSize / v55.props.MaxFrameSize, 1);
                return UDim2.fromScale(0.00390625, v61);
            end), 
            AnchorPoint = Vector2.new(0, 1), 
            BackgroundTransparency = 0.25, 
            Position = v55.MouseFrameData:map(function(v62) --[[ Line: 280 ]]
                return UDim2.fromScale(1 - v62.Index / 256, 1);
            end), 
            ZIndex = 2, 
            BorderSizePixel = 0, 
            Visible = v55.MouseFrameData:map(function(v63) --[[ Line: 285 ]]
                return v63.Index ~= 0;
            end), 
            BackgroundColor3 = Color3.fromHex("#e8e8e8")
        }), 
        FrameTooltip = v9(function(v64) --[[ Line: 290 ]]
            -- upvalues: v7 (ref), v55 (copy)
            return v7.createElement("Frame", {
                AutomaticSize = Enum.AutomaticSize.XY, 
                BackgroundColor3 = v64:GetColor("Dropdown"), 
                BorderColor3 = v64:GetColor("Border"), 
                Position = v55.MousePosition:map(function(v65) --[[ Line: 295 ]]
                    -- upvalues: v55 (ref)
                    local l_CurrentCamera_0 = workspace.CurrentCamera;
                    local v67 = l_CurrentCamera_0 and l_CurrentCamera_0.ViewportSize or Vector2.new(0, 0);
                    local v68 = v55.TooltipSize:getValue();
                    return UDim2.fromOffset(math.min(v65.X, v67.X - v68.X), v65.Y + 12);
                end), 
                Visible = v55.MouseOver, 
                ZIndex = 2, 
                [v7.Change.AbsoluteSize] = function(v69) --[[ Line: 307 ]]
                    -- upvalues: v55 (ref)
                    v55.SetTooltipSize(v69.AbsoluteSize);
                end, 
                [v7.Ref] = function(v70) --[[ Line: 310 ]]
                    -- upvalues: v55 (ref)
                    if v70 then
                        v55.SetTooltipSize(v70.AbsoluteSize);
                    end;
                end
            }, {
                UIListLayout = v7.createElement("UIListLayout", {}), 
                FrameLabel = v7.createElement("TextLabel", {
                    AutoLocalize = false, 
                    Text = v55.MouseFrameData:map(function(v71) --[[ Line: 319 ]]
                        return string.format("%d packets, %d bytes", #v71.Packets, v71.TotalSize);
                    end), 
                    TextColor3 = v64:GetColor("BrightText"), 
                    TextXAlignment = Enum.TextXAlignment.Left, 
                    TextYAlignment = Enum.TextYAlignment.Center, 
                    Font = Enum.Font.SourceSans, 
                    TextSize = 16, 
                    Size = UDim2.fromOffset(200, 16), 
                    BackgroundTransparency = 1
                }), 
                KBSent = v7.createElement("TextLabel", {
                    AutoLocalize = false, 
                    Text = v55.MouseFrameData:map(function(v72) --[[ Line: 332 ]]
                        return string.format("%.3f KB sent", v72.TotalSize / 1000);
                    end), 
                    TextColor3 = v64:GetColor("BrightText"), 
                    TextXAlignment = Enum.TextXAlignment.Left, 
                    TextYAlignment = Enum.TextYAlignment.Center, 
                    Font = Enum.Font.SourceSans, 
                    TextSize = 16, 
                    Size = UDim2.fromOffset(200, 16), 
                    BackgroundTransparency = 1
                })
            });
        end), 
        EditModeNotifier = v9(function(v73) --[[ Line: 345 ]]
            -- upvalues: v7 (ref), v14 (ref)
            return v7.createElement("TextLabel", {
                AutoLocalize = false, 
                Size = UDim2.fromScale(1, 1), 
                Position = UDim2.fromScale(0.5, 0.5), 
                AnchorPoint = Vector2.new(0.5, 0.5), 
                BackgroundTransparency = 1, 
                Text = "Start session to begin", 
                TextColor3 = v73:GetColor("WarningText"), 
                TextSize = 20, 
                Font = Enum.Font.SourceSans, 
                TextXAlignment = Enum.TextXAlignment.Center, 
                TextYAlignment = Enum.TextYAlignment.Center, 
                Visible = v14
            });
        end)
    });
end;
return v13;