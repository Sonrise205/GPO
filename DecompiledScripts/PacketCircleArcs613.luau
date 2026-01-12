local l_RunService_0 = game:GetService("RunService");
local l_TweenService_0 = game:GetService("TweenService");
local l_Players_0 = game:GetService("Players");
local l_Modules_0 = script.Parent.Parent.Modules;
local v4 = require(l_Modules_0.Packages);
local v5 = require(v4.Directory.Roact);
local v6 = v5.Component:extend("PacketCircleArcs");
local function _(v7, v8, v9) --[[ Line: 13 ]] --[[ Name: lerp ]]
    return v7 + (v8 - v7) * v9;
end;
local function v21(v11) --[[ Line: 17 ]] --[[ Name: CircleArc ]]
    -- upvalues: v5 (copy)
    local l_EndPercent_0 = v11.Data.EndPercent;
    local l_StartPercent_0 = v11.Data.StartPercent;
    local l_VisiblePercent_0 = v11.Data.VisiblePercent;
    return v5.createElement("ImageLabel", {
        BackgroundTransparency = 1, 
        Image = "rbxassetid://3587367081", 
        ImageColor3 = v11.Highlighted:map(function(v15) --[[ Line: 25 ]]
            -- upvalues: l_StartPercent_0 (copy), l_EndPercent_0 (copy), v11 (copy)
            if l_StartPercent_0 <= v15 and v15 < l_EndPercent_0 then
                return v11.Data.Color:Lerp(Color3.new(1, 1, 1), 0.5);
            else
                return v11.Data.Color;
            end;
        end), 
        Size = UDim2.fromScale(2, 1), 
        Position = UDim2.fromScale(v11.Side == "Left" and 0 or -1, 0), 
        ZIndex = v11.ZIndex
    }, {
        UIGradient = v5.createElement("UIGradient", {
            Rotation = v11.AnimationAlpha:map(function(v16) --[[ Line: 37 ]]
                -- upvalues: v11 (copy), l_VisiblePercent_0 (copy)
                if v11.Side == "Left" then
                    local l_l_VisiblePercent_0_0 = l_VisiblePercent_0;
                    local v18 = math.clamp(v16 * 2, 0, 1);
                    return -3.6 * (0 + (l_l_VisiblePercent_0_0 - 0) * v18) + 180;
                else
                    local v19 = l_VisiblePercent_0 - 50;
                    local v20 = math.clamp(v16 * 2 - 1, 0, 1);
                    return (0 + -180 * ((0 + (v19 - 0) * v20) / 100)) * 2;
                end;
            end), 
            Transparency = NumberSequence.new({
                NumberSequenceKeypoint.new(0, 0), 
                NumberSequenceKeypoint.new(v11.Side == "Left" and 0.498 or 0.5, 0), 
                NumberSequenceKeypoint.new(v11.Side == "Left" and 0.499 or 0.501, 1), 
                NumberSequenceKeypoint.new(1, 1)
            })
        })
    });
end;
v6.init = function(v22) --[[ Line: 57 ]] --[[ Name: init ]]
    -- upvalues: v5 (copy), v4 (copy), l_Players_0 (copy), l_RunService_0 (copy), l_TweenService_0 (copy)
    local v23, v24 = v5.createBinding(0);
    v22.AnimationAlpha = v23;
    v22.SetAnimationAlpha = v24;
    v23, v24 = v5.createBinding(0);
    v22.ActualAlpha = v23;
    v22.SetActualAlpha = v24;
    v23, v24 = v5.createBinding(Vector2.zero);
    v22.MousePosition = v23;
    v22.SetMousePosition = v24;
    v23, v24 = v5.createBinding(-1);
    v22.HighlightedPercent = v23;
    v22.SetHighlightedPercent = v24;
    v23, v24 = v5.createBinding(UDim2.fromOffset(0, 0));
    v22.DebugMousePos = v23;
    v22.SetDebugMousePos = v24;
    v23, v24 = v5.createBinding(false);
    v22.ShowDebug = v23;
    v22.SetShowDebug = v24;
    v23 = v4.IsPlugin and v22.props.PluginMouse or l_Players_0.LocalPlayer:GetMouse();
    l_RunService_0.RenderStepped:Connect(function(v25) --[[ Line: 68 ]]
        -- upvalues: v23 (copy), v22 (copy), l_TweenService_0 (ref)
        local v26 = Vector2.new(v23.X, v23.Y);
        v22.SetMousePosition(v26);
        local v27 = v22.ActualAlpha:getValue();
        v22.SetAnimationAlpha(l_TweenService_0:GetValue(v27, Enum.EasingStyle.Quad, Enum.EasingDirection.Out));
        v22.SetActualAlpha((math.clamp(v27 + v25 * 2, 0, 1)));
    end);
end;
v6.render = function(v28) --[[ Line: 79 ]] --[[ Name: render ]]
    -- upvalues: v21 (copy), v5 (copy)
    local v29 = {
        Left = {}, 
        Right = {}
    };
    local v30 = 0;
    v28.SetActualAlpha(0);
    local v31 = {};
    local v32 = #v28.props.Arcs;
    for v33, v34 in v28.props.Arcs do
        local v35 = v32 - v33 + 2;
        local v36 = math.min(v30 + v34.Percent, 100);
        if v30 <= 100 then
            v31[v33] = {
                StartPercent = v30, 
                EndPercent = v36, 
                Color = v34.Color, 
                Name = v34.Name
            };
            if v36 > 50 and v30 <= 50 then
                v29.Left[v33] = v21({
                    ZIndex = v35, 
                    Data = {
                        StartPercent = v30, 
                        EndPercent = v36, 
                        VisiblePercent = 50, 
                        Color = v34.Color
                    }, 
                    Side = "Left", 
                    AnimationAlpha = v28.AnimationAlpha, 
                    Highlighted = v28.HighlightedPercent
                });
            end;
            local v37 = v36 > 50 and "Right" or "Left";
            v29[v37][v33] = v21({
                ZIndex = v35, 
                Data = {
                    StartPercent = v30, 
                    EndPercent = v36, 
                    VisiblePercent = v36, 
                    Color = v34.Color
                }, 
                Side = v37, 
                AnimationAlpha = v28.AnimationAlpha, 
                Highlighted = v28.HighlightedPercent
            });
            v30 = v30 + v34.Percent;
        else
            break;
        end;
    end;
    return v5.createElement("Frame", {
        BackgroundTransparency = 1, 
        Size = UDim2.new(1, -8, 1, -8), 
        Position = UDim2.fromScale(0.5, 0.5), 
        AnchorPoint = Vector2.new(0.5, 0.5), 
        [v5.Event.MouseEnter] = function(_, _, _) --[[ Line: 143 ]]
            -- upvalues: v28 (copy)
            v28.MouseOver = true;
            v28.SetShowDebug(true);
        end, 
        [v5.Event.MouseLeave] = function() --[[ Line: 147 ]]
            -- upvalues: v28 (copy)
            v28.MouseOver = false;
            v28.SetHighlightedPercent(-1);
            v28.SetShowDebug(false);
        end, 
        [v5.Event.MouseMoved] = function(v41, v42, v43) --[[ Line: 152 ]]
            -- upvalues: v28 (copy)
            if v28.MouseOver then
                local v44 = Vector2.new(v42, v43);
                local v45 = v41.AbsolutePosition + v41.AbsoluteSize / 2;
                v28.SetDebugMousePos(UDim2.fromOffset(v42 - 1, v43 - 1));
                local v46 = math.deg((math.atan2(v44.Y - v45.Y, -(v44.X - v45.X)))) + 90;
                if v46 < 0 then
                    v46 = v46 + 360;
                end;
                local v47 = v46 / 360 * 100;
                v28.SetHighlightedPercent(v47);
            end;
        end, 
        [v5.Event.InputEnded] = function(_, v49) --[[ Line: 168 ]]
            -- upvalues: v28 (copy), v31 (copy)
            if v49.UserInputType ~= Enum.UserInputType.MouseButton1 then
                return;
            else
                local v50 = v28.HighlightedPercent:getValue();
                if v50 == -1 then
                    return;
                else
                    for _, v52 in v31 do
                        if v52.StartPercent <= v50 and v50 < v52.EndPercent then
                            if v28.props.OnArcClicked then
                                v28.props.OnArcClicked(v52.Name);
                                break;
                            else
                                break;
                            end;
                        end;
                    end;
                    v28.SetHighlightedPercent(-1);
                    return;
                end;
            end;
        end
    }, {
        Left = v5.createElement("Frame", {
            BackgroundTransparency = 1, 
            ClipsDescendants = true, 
            Size = UDim2.fromScale(0.5, 1)
        }, {
            Arcs = v5.createFragment(v29.Left)
        }), 
        Right = v5.createElement("Frame", {
            AnchorPoint = Vector2.new(1, 0), 
            BackgroundTransparency = 1, 
            ClipsDescendants = true, 
            Position = UDim2.fromScale(1, 0), 
            Size = UDim2.fromScale(0.5, 1)
        }, {
            Arcs = v5.createFragment(v29.Right)
        })
    });
end;
return v6;