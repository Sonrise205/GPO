client = nil;
service = nil;
return function(v0, v1) --[[ Line: 4 ]]
    if v1 then
        setfenv(1, v1);
    end;
    local l_Title_0 = v0.Title;
    local v3 = v0.TitleButtons or {};
    local _ = v0.Tabs;
    local l_Icon_0 = v0.Icon;
    local v6 = v0.Table or v0.Tab;
    local l_Update_0 = v0.Update;
    local l_UpdateArg_0 = v0.UpdateArg;
    local l_UpdateArgs_0 = v0.UpdateArgs;
    local l_AutoUpdate_0 = v0.AutoUpdate;
    local _ = v0.LoadTime;
    local _ = v0.gIndex;
    local l_gTable_0 = v0.gTable;
    local _ = v0.Dots;
    local l_Size_0 = v0.Size;
    local _ = v0.Sanitize;
    local l_Stacking_0 = v0.Stacking;
    local v18 = v0.PagesEnabled ~= nil and v0.PagesEnabled or v0.PagesEnabled == nil and true;
    local v19 = v0.PageSize or 100;
    local v20 = v0.PageNumber or 1;
    local v21 = v20 or 1;
    local v22 = v0.RichTextSupported or v0.RichTextAllowed or v0.RichText;
    local l_TextSelectable_0 = v0.TextSelectable;
    local v24 = nil;
    local v25 = nil;
    local v26 = nil;
    local v27 = nil;
    local v28 = nil;
    local v29 = nil;
    local v30 = nil;
    local v31 = nil;
    local v32 = nil;
    local v33 = nil;
    local v34 = nil;
    local v35 = nil;
    local v36 = false;
    v25 = function(v37, v38) --[[ Line: 38 ]] --[[ Name: getPage ]]
        -- upvalues: v18 (copy), v19 (copy)
        if not v18 then
            return v37;
        else
            local v39 = v38 or 1;
            local v40 = (v39 - 1) * v19;
            local v41 = v39 * v19;
            local v42 = {};
            for v43 = v40, v41 do
                if v37[v43] ~= nil then
                    table.insert(v42, v37[v43]);
                end;
            end;
            return v42;
        end;
    end;
    v24 = function(v44) --[[ Line: 57 ]] --[[ Name: getListTab ]]
        -- upvalues: l_Stacking_0 (copy), v0 (copy)
        local v45 = {};
        for v46, v47 in next, v44 do
            if type(v47) == "table" then
                v45[v46] = {
                    Text = v47.Text, 
                    Desc = v47.Desc, 
                    Color = v47.Color, 
                    Time = v47.Time, 
                    Filter = v47.Filter, 
                    Duplicates = v47.Duplicates
                };
            elseif type(v47) == "string" then
                v45[v46] = {
                    Text = v47, 
                    Desc = v47
                };
            end;
        end;
        if l_Stacking_0 then
            local l_v45_0 = v45;
            v45 = {};
            local v49 = nil;
            for _, v51 in next, l_v45_0 do
                v51.Text = service.Trim(v51.Text);
                v51.Desc = service.Trim(v51.Desc);
                if not v49 then
                    v49 = v51;
                    table.insert(v45, v51);
                elseif v49.Text == v51.Text and v49.Desc == v51.Desc then
                    v49.Duplicates = v49.Duplicates and v49.Duplicates + 1 or 2;
                else
                    v49 = v51;
                    table.insert(v45, v51);
                end;
            end;
        end;
        for _, v53 in next, v45 do
            v53.Text = v0.Sanitize and service.SanitizeString(v53.Text) or v53.Text;
            if v53.Duplicates then
                v53.Text = ("(x%*) %*"):format(v53.Duplicates, v53.Text);
            end;
            if v53.Time then
                v53.Text = ("[%*] %*"):format(type(v53.Time) == "number" and service.FormatTime(v53.Time) or v53.Time, v53.Text);
            end;
        end;
        return v45;
    end;
    v26 = function(v54, v55) --[[ Line: 114 ]] --[[ Name: doSearch ]]
        local v56 = {};
        v55 = tostring(v55):lower();
        for _, v58 in next, v54 do
            if v55 == "" or type(v58) == "string" and v58:lower():find(v55) or type(v58) == "table" and (v58.Text and tostring(v58.Text):lower():find(v55) or v58.Filter and v58.Filter:lower():find(v55)) then
                table.insert(v56, v58);
            end;
        end;
        return v56;
    end;
    v27 = function(v59) --[[ Line: 126 ]] --[[ Name: genList ]]
        -- upvalues: v36 (ref), v30 (ref), v21 (ref), v24 (ref), v26 (ref), v20 (copy), v18 (copy), v19 (copy), v29 (ref), v32 (ref), v33 (ref), v34 (ref), v31 (ref), v25 (ref), v22 (copy), l_TextSelectable_0 (copy)
        local l_v59_0 = v59;
        if not v36 then
            v36 = true;
            if v30.Text ~= "" then
                v21 = 1;
                l_v59_0 = v24(v26(v59, v30.Text));
            else
                v21 = v20;
                v30.Text = "";
                l_v59_0 = v24(v59);
            end;
            if v18 and #l_v59_0 > v19 then
                v29.Size = UDim2.new(1, -10, 1, -60);
                v32.Visible = true;
                v33.Visible = true;
                if v34 then
                    local v61 = math.ceil(#v34 / v19);
                    v33.Text = ("Page: %*/%*"):format(v21, v61);
                else
                    v33.Text = ("Page: %*"):format(v21);
                end;
                if v21 > 1 then
                    v31.Visible = true;
                else
                    v31.Visible = false;
                end;
            else
                v29.Size = UDim2.new(1, -10, 1, -30);
                v32.Visible = false;
                v31.Visible = false;
                v33.Visible = false;
            end;
            for _, v63 in next, v29:GetChildren() do
                v63:Destroy();
            end;
            v34 = l_v59_0;
            v29:GenerateList(v25(l_v59_0, v21), {
                RichTextAllowed = v22, 
                TextSelectable = l_TextSelectable_0
            });
            v36 = false;
        end;
    end;
    v28 = client.UI.Make("Window", {
        Name = "List", 
        Title = l_Title_0, 
        Size = l_Size_0 or {
            240, 
            225
        }, 
        Icon = l_Icon_0 or "rbxassetid://7467255930", 
        MinSize = {
            150, 
            100
        }, 
        OnRefresh = l_Update_0 and function() --[[ Line: 184 ]]
            -- upvalues: v6 (ref), l_Update_0 (copy), l_UpdateArgs_0 (copy), l_UpdateArg_0 (copy), v34 (ref), v27 (ref)
            v6 = client.Remote.Get("UpdateList", l_Update_0, unpack(l_UpdateArgs_0 or {
                l_UpdateArg_0
            }));
            if v6 then
                v34 = v6;
                v27(v6);
            end;
        end, 
        RichTextSupport = v0.RichTextSupport or v0.SupportRichText or false
    });
    v29 = v28:Add("ScrollingFrame", {
        List = {}, 
        ScrollBarThickness = 2, 
        BackgroundTransparency = 1, 
        Position = UDim2.new(0, 5, 0, 30), 
        Size = UDim2.new(1, -10, 1, -30)
    });
    v33 = v28:Add("TextLabel", {
        Size = UDim2.new(0, 60, 0, 20), 
        Position = UDim2.new(0.5, -30, 1, -25), 
        Text = "Page: 1", 
        TextTruncate = Enum.TextTruncate.None, 
        BackgroundTransparency = 1, 
        TextTransparency = 0.5, 
        TextWrapped = false, 
        ClipsDescendants = false, 
        TextXAlignment = "Center"
    });
    v32 = v28:Add("TextButton", {
        Size = UDim2.new(0, 50, 0, 20), 
        Position = UDim2.new(1, -60, 1, -25), 
        Text = ">", 
        Visible = false, 
        Debounce = true, 
        OnClick = function() --[[ Line: 224 ]] --[[ Name: OnClick ]]
            -- upvalues: v35 (ref), v32 (ref), v31 (ref), v34 (ref), v19 (copy), v21 (ref), v33 (ref), v29 (ref), v25 (ref), v22 (copy), l_TextSelectable_0 (copy)
            if not v35 then
                v35 = true;
                local l_BackgroundTransparency_0 = v32.BackgroundTransparency;
                v31.BackgroundTransparency = l_BackgroundTransparency_0 + 0.35;
                local l_BackgroundTransparency_1 = v32.BackgroundTransparency;
                v32.BackgroundTransparency = l_BackgroundTransparency_1 + 0.35;
                v31.TextTransparency = 0.8;
                v32.TextTransparency = 0.8;
                if v34 then
                    local v66 = math.ceil(#v34 / v19);
                    v21 = math.clamp(v21 + 1, 1, v66);
                    v33.Text = ("Page: %*/%*"):format(v21, v66);
                    if v21 > 1 then
                        v31.Visible = true;
                    end;
                    if v21 == v66 then
                        v32.Visible = false;
                    end;
                    for _, v68 in next, v29:GetChildren() do
                        v68:Destroy();
                    end;
                    v29.CanvasPosition = Vector2.new(0, 0);
                    v29:GenerateList(v25(v34, v21), {
                        RichTextAllowed = v22, 
                        TextSelectable = l_TextSelectable_0
                    });
                end;
                v31.BackgroundTransparency = l_BackgroundTransparency_0;
                v32.BackgroundTransparency = l_BackgroundTransparency_1;
                v31.TextTransparency = 0;
                v32.TextTransparency = 0;
                v35 = false;
            end;
        end
    });
    v31 = v28:Add("TextButton", {
        Size = UDim2.new(0, 50, 0, 20), 
        Position = UDim2.new(0, 10, 1, -25), 
        Text = "<", 
        Visible = false, 
        Debounce = true, 
        OnClick = function() --[[ Line: 278 ]] --[[ Name: OnClick ]]
            -- upvalues: v35 (ref), v32 (ref), v31 (ref), v34 (ref), v19 (copy), v21 (ref), v33 (ref), v29 (ref), v25 (ref), v22 (copy), l_TextSelectable_0 (copy)
            if not v35 then
                v35 = true;
                local l_BackgroundTransparency_2 = v32.BackgroundTransparency;
                v31.BackgroundTransparency = l_BackgroundTransparency_2 + 0.2;
                local l_BackgroundTransparency_3 = v32.BackgroundTransparency;
                v32.BackgroundTransparency = l_BackgroundTransparency_3 + 0.2;
                v31.TextTransparency = 0.8;
                v32.TextTransparency = 0.8;
                if v34 then
                    local v71 = math.ceil(#v34 / v19);
                    v21 = math.clamp(v21 - 1, 1, v71);
                    v33.Text = ("Page: %*/%*"):format(v21, v71);
                    if v21 == 1 then
                        v31.Visible = false;
                    end;
                    if v21 == v71 then
                        v32.Visible = false;
                    else
                        v32.Visible = true;
                    end;
                    for _, v73 in next, v29:GetChildren() do
                        v73:Destroy();
                    end;
                    v29.CanvasPosition = Vector2.new(0, 0);
                    v29:GenerateList(v25(v34, v21), {
                        RichTextAllowed = v22, 
                        TextSelectable = l_TextSelectable_0
                    });
                end;
                v31.BackgroundTransparency = l_BackgroundTransparency_2;
                v32.BackgroundTransparency = l_BackgroundTransparency_3;
                v31.TextTransparency = 0;
                v32.TextTransparency = 0;
                v35 = false;
            end;
        end
    });
    for _, v75 in ipairs(v3) do
        local v76 = v28:AddTitleButton(v75);
        if v75.Text == "?" then
            local _ = v76:Add("ImageLabel", {
                Size = UDim2.new(1, 0, 0.85, 0), 
                AnchorPoint = Vector2.new(0.5, 0.5), 
                Position = UDim2.new(0.5, 0, 0.536, 0), 
                ScaleType = Enum.ScaleType.Fit, 
                Image = "rbxassetid://7467152517", 
                BackgroundTransparency = 1
            });
            v76.Text = "";
        end;
    end;
    v30 = v28:Add("TextBox", {
        Size = UDim2.new(1, -10, 0, 20), 
        Position = UDim2.new(0, 5, 0, 5), 
        BackgroundTransparency = 0.5, 
        BorderSizePixel = 0, 
        TextColor3 = Color3.new(1, 1, 1), 
        ClearTextOnFocus = false, 
        Text = "", 
        PlaceholderText = "Search", 
        TextStrokeTransparency = 0.8
    });
    v30:GetPropertyChangedSignal("Text"):Connect(function() --[[ Line: 355 ]]
        -- upvalues: v34 (ref), v6 (ref), v27 (ref)
        v34 = v6;
        v27(v6);
    end);
    l_gTable_0 = v28.gTable;
    v28:Ready();
    v34 = v6;
    v27(v6);
    if l_Update_0 and l_AutoUpdate_0 then
        while l_gTable_0.Active and wait(l_AutoUpdate_0) do
            v28:Refresh();
        end;
    end;
end;