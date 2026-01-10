local l_TextService_0 = game:GetService("TextService");
local l_RunService_0 = game:GetService("RunService");
local l_Modules_0 = script.Parent.Parent.Modules;
local v3 = require(l_Modules_0.Packages);
local v4 = require(v3.Directory.Roact);
local v5 = not l_RunService_0:IsRunning();
local function v7(v6) --[[ Line: 13 ]] --[[ Name: TopbarOptionsButton ]]
    -- upvalues: v4 (copy)
    return v4.createElement("TextButton", {
        AutoLocalize = false, 
        Text = v6.ButtonName, 
        TextXAlignment = Enum.TextXAlignment.Right, 
        TextYAlignment = Enum.TextYAlignment.Center, 
        Font = Enum.Font.Code, 
        TextColor3 = v6.Theme.Name == "Light" and Color3.new(0, 0, 0) or Color3.new(1, 1, 1), 
        TextSize = 12, 
        BackgroundColor3 = v6.Theme:GetColor("ScrollBarBackground"), 
        Size = v6.Size, 
        BorderSizePixel = 0, 
        [v4.Event.Activated] = v6.OnClick
    });
end;
local v8 = v4.Component:extend("TopbarButtonsGroup");
v8.init = function(v9) --[[ Line: 31 ]] --[[ Name: init ]]
    -- upvalues: v4 (copy)
    local v10, v11 = v4.createBinding(0);
    v9.MouseHovering = v10;
    v9.SetMouseHovering = v11;
    v9.TopbarRef = v4.createRef();
end;
v8.render = function(v12) --[[ Line: 36 ]] --[[ Name: render ]]
    -- upvalues: l_TextService_0 (copy), v7 (copy), v4 (copy), v5 (copy)
    local l_props_0 = v12.props;
    local v14 = {};
    local l_l_TextService_0_TextSize_0 = l_TextService_0:GetTextSize(l_props_0.Text, 12, Enum.Font.Code, Vector2.new(10000, 11));
    local l_X_0 = l_l_TextService_0_TextSize_0.X;
    for _, v18 in l_props_0.Options do
        l_X_0 = math.max(l_X_0, l_TextService_0:GetTextSize(v18.Name, 11, Enum.Font.Code, Vector2.new(10000, 11)).X);
    end;
    for _, v20 in l_props_0.Options do
        table.insert(v14, v7({
            ButtonName = v20.Name, 
            OnClick = v20.Callback, 
            Theme = l_props_0.Theme, 
            Size = UDim2.fromOffset(l_X_0, 11)
        }));
    end;
    return v4.createElement("TextLabel", {
        AutoLocalize = false, 
        Text = l_props_0.Text, 
        TextColor3 = l_props_0.Theme.Name == "Light" and Color3.new(0, 0, 0) or Color3.new(1, 1, 1), 
        BackgroundColor3 = v12.MouseHovering:map(function(v21) --[[ Line: 60 ]]
            -- upvalues: l_props_0 (copy)
            return v21 > 0 and l_props_0.Theme:GetColor("Light") or l_props_0.Theme:GetColor("ScrollBarBackground");
        end), 
        TextSize = 12, 
        Font = Enum.Font.Code, 
        BorderSizePixel = 0, 
        Size = UDim2.fromOffset(l_l_TextService_0_TextSize_0.X, 10), 
        TextXAlignment = Enum.TextXAlignment.Left, 
        TextYAlignment = Enum.TextYAlignment.Center, 
        LayoutOrder = l_props_0.LayoutOrder, 
        Visible = not v5, 
        [v4.Event.MouseEnter] = function() --[[ Line: 71 ]]
            -- upvalues: v12 (copy)
            v12.SetMouseHovering(1);
        end, 
        [v4.Event.MouseLeave] = function() --[[ Line: 74 ]]
            -- upvalues: v12 (copy)
            task.defer(function() --[[ Line: 75 ]]
                -- upvalues: v12 (ref)
                if v12.MouseHovering:getValue() == 1 then
                    v12.SetMouseHovering(0);
                end;
            end);
        end, 
        [v4.Ref] = v12.TopbarRef
    }, {
        OptionsHolder = v4.createElement("Frame", {
            AutomaticSize = Enum.AutomaticSize.Y, 
            BackgroundTransparency = 1, 
            Visible = v12.MouseHovering:map(function(v22) --[[ Line: 86 ]]
                return v22 > 0;
            end), 
            Position = UDim2.fromOffset(0, 10), 
            [v4.Event.MouseEnter] = function() --[[ Line: 90 ]]
                -- upvalues: v12 (copy)
                v12.SetMouseHovering(2);
            end, 
            [v4.Event.MouseLeave] = function() --[[ Line: 93 ]]
                -- upvalues: v12 (copy)
                task.defer(function() --[[ Line: 94 ]]
                    -- upvalues: v12 (ref)
                    if v12.MouseHovering:getValue() == 2 then
                        v12.SetMouseHovering(0);
                    end;
                end);
            end, 
            Size = UDim2.fromOffset(l_X_0, 0)
        }, {
            OptionsListLayout = v4.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Vertical, 
                HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                VerticalAlignment = Enum.VerticalAlignment.Top
            }), 
            Buttons = v4.createFragment(v14)
        })
    });
end;
return v8;