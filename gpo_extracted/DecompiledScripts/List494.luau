local v0 = nil;
local v1 = nil;
client = v0;
service = v1;
return function(v2, v3) --[[ Line: 3 ]]
    if v3 then
        setfenv(1, v3);
    end;
    local _ = v2.Name;
    local l_Title_0 = v2.Title;
    local v6 = v2.TitleButtons or {};
    local l_Icon_0 = v2.Icon;
    local _ = v2.Tabs;
    local v9 = v2.Table or v2.Tab;
    local l_Update_0 = v2.Update;
    local l_UpdateArg_0 = v2.UpdateArg;
    local l_UpdateArgs_0 = v2.UpdateArgs;
    local l_AutoUpdate_0 = v2.AutoUpdate;
    local _ = v2.LoadTime;
    local _ = v2.gIndex;
    local l_gTable_0 = v2.gTable;
    local _ = v2.Dots;
    local l_Size_0 = v2.Size;
    local _ = v2.Sanitize;
    local l_Stacking_0 = v2.Stacking;
    local v21 = v2.PagesEnabled ~= nil and v2.PagesEnabled or v2.PagesEnabled == nil and true;
    local v22 = v2.PageSize or 100;
    local v23 = v2.PageNumber or 1;
    local v24 = v23 or 1;
    local v25 = v2.RichTextSupported or v2.RichTextAllowed or v2.RichText;
    local l_TextSelectable_0 = v2.TextSelectable;
    local l_TimeOptions_0 = v2.TimeOptions;
    local v28 = nil;
    local v29 = nil;
    local v30 = nil;
    local v31 = nil;
    local v32 = nil;
    local v33 = nil;
    local v34 = nil;
    local v35 = nil;
    local v36 = nil;
    local v37 = nil;
    local v38 = nil;
    local v39 = nil;
    local v40 = false;
    v29 = function(v41, v42) --[[ Line: 40 ]] --[[ Name: getPage ]]
        -- upvalues: v21 (copy), v22 (copy)
        if not v21 then
            return v41;
        else
            local v43 = v42 or 1;
            local v44 = (v43 - 1) * v22;
            local v45 = v43 * v22;
            local v46 = {};
            for v47 = v44, v45 do
                if v41[v47] ~= nil then
                    table.insert(v46, v41[v47]);
                end;
            end;
            return v46;
        end;
    end;
    v28 = function(v48) --[[ Line: 59 ]] --[[ Name: getListTab ]]
        -- upvalues: l_Stacking_0 (copy), v2 (copy), l_TimeOptions_0 (copy)
        local v49 = {};
        for v50, v51 in ipairs(v48) do
            if type(v51) == "table" then
                v49[v50] = {
                    Text = v51.Text, 
                    Desc = v51.Desc, 
                    Color = v51.Color, 
                    Time = v51.Time, 
                    Filter = v51.Filter, 
                    Duplicates = v51.Duplicates, 
                    OnClick = v51.OnClick
                };
            elseif type(v51) == "string" then
                v49[v50] = {
                    Text = v51, 
                    Desc = v51
                };
            end;
        end;
        if l_Stacking_0 then
            local l_v49_0 = v49;
            v49 = {};
            local v53 = nil;
            for _, v55 in ipairs(l_v49_0) do
                v55.Text = service.EscapeControlCharacters(service.Trim(v55.Text));
                v55.Desc = service.EscapeControlCharacters(service.Trim(v55.Desc));
                if not v53 then
                    v53 = v55;
                    table.insert(v49, v55);
                elseif v53.Text == v55.Text and v53.Desc == v55.Desc then
                    v53.Duplicates = v53.Duplicates and v53.Duplicates + 1 or 2;
                else
                    v53 = v55;
                    table.insert(v49, v55);
                end;
            end;
        end;
        for _, v57 in ipairs(v49) do
            v57.Text = v2.Sanitize and service.SanitizeString(v57.Text) or v57.Text;
            if v57.Duplicates then
                v57.Text = ("(x%*) %*"):format(v57.Duplicates, v57.Text);
            end;
            if v57.Time then
                v57.Text = ("[%*] %*"):format(type(v57.Time) == "number" and service.FormatTime(v57.Time, l_TimeOptions_0) or v57.Time, v57.Text);
            end;
        end;
        return v49;
    end;
    v30 = function(v58, v59) --[[ Line: 117 ]] --[[ Name: doSearch ]]
        local v60 = {};
        v59 = string.lower((tostring(v59))):gsub("%%", "%%%%"):gsub("%[", "%%["):gsub("%]", "%%]");
        for _, v62 in ipairs(v58) do
            if v59 == "" or type(v62) == "string" and string.find(string.lower(v62), v59) or type(v62) == "table" and (v62.Text and string.find(string.lower((tostring(v62.Text))), v59) or v62.Filter and string.find(string.lower(v62.Filter), v59)) then
                table.insert(v60, v62);
            end;
        end;
        return v60;
    end;
    v31 = function(v63) --[[ Line: 129 ]] --[[ Name: genList ]]
        -- upvalues: v40 (ref), v34 (ref), v24 (ref), v28 (ref), v30 (ref), v23 (copy), v21 (copy), v22 (copy), v33 (ref), v36 (ref), v37 (ref), v38 (ref), v35 (ref), v29 (ref), v25 (copy), l_TextSelectable_0 (copy)
        local l_v63_0 = v63;
        if not v40 then
            v40 = true;
            if v34.Text ~= "" then
                v24 = 1;
                l_v63_0 = v28(v30(v63, v34.Text));
            else
                v24 = v23;
                v34.Text = "";
                v34.PlaceholderText = "Search (" .. (#v63 == 1 and "1 Item" or #v63 .. " Items") .. ")";
                l_v63_0 = v28(v63);
            end;
            if v21 and #l_v63_0 > v22 then
                v33.Size = UDim2.new(1, -10, 1, -60);
                v36.Visible = true;
                v37.Visible = true;
                if v38 then
                    local v65 = math.ceil(#v38 / v22);
                    v37.Text = ("Page: %*/%*"):format(v24, v65);
                else
                    v37.Text = ("Page: %*"):format(v24);
                end;
                if v24 > 1 then
                    v35.Visible = true;
                else
                    v35.Visible = false;
                end;
            else
                v33.Size = UDim2.new(1, -10, 1, -30);
                v36.Visible = false;
                v35.Visible = false;
                v37.Visible = false;
            end;
            v33:ClearAllChildren();
            v38 = l_v63_0;
            v33:GenerateList(v29(l_v63_0, v24), {
                RichTextAllowed = v25, 
                TextSelectable = l_TextSelectable_0
            });
            v40 = false;
        end;
    end;
    v32 = client.UI.Make("Window", {
        Name = v2.Name or "List", 
        Title = l_Title_0, 
        Icon = l_Icon_0, 
        Size = l_Size_0 or {
            300, 
            250
        }, 
        MinSize = {
            200, 
            120
        }, 
        OnRefresh = l_Update_0 and function() --[[ Line: 188 ]]
            -- upvalues: v9 (ref), l_Update_0 (copy), l_UpdateArgs_0 (copy), l_UpdateArg_0 (copy), v38 (ref), v31 (ref)
            v9 = client.Remote.Get("UpdateList", l_Update_0, unpack(l_UpdateArgs_0 or {
                l_UpdateArg_0
            }));
            if v9 then
                v38 = v9;
                v31(v9);
            end;
        end, 
        RichTextSupport = v2.RichTextSupport or v2.SupportRichText or false
    });
    v33 = v32:Add("ScrollingFrame", {
        List = {}, 
        ScrollBarThickness = 2, 
        BackgroundTransparency = 1, 
        Position = UDim2.new(0, 5, 0, 30), 
        Size = UDim2.new(1, -10, 1, -30)
    });
    v37 = v32:Add("TextLabel", {
        Size = UDim2.new(0, 60, 0, 20), 
        Position = UDim2.new(0.5, -30, 1, -25), 
        Text = "Page: 1", 
        BackgroundTransparency = 1, 
        TextTransparency = 0.5, 
        TextWrapped = false, 
        ClipsDescendants = false, 
        TextXAlignment = "Center"
    });
    v36 = v32:Add("TextButton", {
        Size = UDim2.new(0, 50, 0, 20), 
        Position = UDim2.new(1, -60, 1, -25), 
        Text = ">", 
        Visible = false, 
        Debounce = true, 
        OnClick = function() --[[ Line: 226 ]] --[[ Name: OnClick ]]
            -- upvalues: v39 (ref), v36 (ref), v35 (ref), v38 (ref), v22 (copy), v24 (ref), v37 (ref), v33 (ref), v29 (ref), v25 (copy), l_TextSelectable_0 (copy)
            if not v39 then
                v39 = true;
                local l_BackgroundTransparency_0 = v36.BackgroundTransparency;
                v35.BackgroundTransparency = l_BackgroundTransparency_0 + 0.35;
                local l_BackgroundTransparency_1 = v36.BackgroundTransparency;
                v36.BackgroundTransparency = l_BackgroundTransparency_1 + 0.35;
                v35.TextTransparency = 0.8;
                v36.TextTransparency = 0.8;
                if v38 then
                    local v68 = math.ceil(#v38 / v22);
                    v24 = math.clamp(v24 + 1, 1, v68);
                    v37.Text = ("Page: %*/%*"):format(v24, v68);
                    if v24 > 1 then
                        v35.Visible = true;
                    end;
                    if v24 == v68 then
                        v36.Visible = false;
                    end;
                    v33:ClearAllChildren();
                    v33.CanvasPosition = Vector2.new(0, 0);
                    v33:GenerateList(v29(v38, v24), {
                        RichTextAllowed = v25, 
                        TextSelectable = l_TextSelectable_0
                    });
                end;
                v35.BackgroundTransparency = l_BackgroundTransparency_0;
                v36.BackgroundTransparency = l_BackgroundTransparency_1;
                v35.TextTransparency = 0;
                v36.TextTransparency = 0;
                v39 = false;
            end;
        end
    });
    v35 = v32:Add("TextButton", {
        Size = UDim2.new(0, 50, 0, 20), 
        Position = UDim2.new(0, 10, 1, -25), 
        Text = "<", 
        Visible = false, 
        Debounce = true, 
        OnClick = function() --[[ Line: 278 ]] --[[ Name: OnClick ]]
            -- upvalues: v39 (ref), v36 (ref), v35 (ref), v38 (ref), v22 (copy), v24 (ref), v37 (ref), v33 (ref), v29 (ref), v25 (copy), l_TextSelectable_0 (copy)
            if not v39 then
                v39 = true;
                local l_BackgroundTransparency_2 = v36.BackgroundTransparency;
                v35.BackgroundTransparency = l_BackgroundTransparency_2 + 0.2;
                local l_BackgroundTransparency_3 = v36.BackgroundTransparency;
                v36.BackgroundTransparency = l_BackgroundTransparency_3 + 0.2;
                v35.TextTransparency = 0.8;
                v36.TextTransparency = 0.8;
                if v38 then
                    local v71 = math.ceil(#v38 / v22);
                    v24 = math.clamp(v24 - 1, 1, v71);
                    v37.Text = ("Page: %*/%*"):format(v24, v71);
                    if v24 == 1 then
                        v35.Visible = false;
                    end;
                    if v24 == v71 then
                        v36.Visible = false;
                    else
                        v36.Visible = true;
                    end;
                    v33:ClearAllChildren();
                    v33.CanvasPosition = Vector2.new(0, 0);
                    v33:GenerateList(v29(v38, v24), {
                        RichTextAllowed = v25, 
                        TextSelectable = l_TextSelectable_0
                    });
                end;
                v35.BackgroundTransparency = l_BackgroundTransparency_2;
                v36.BackgroundTransparency = l_BackgroundTransparency_3;
                v35.TextTransparency = 0;
                v36.TextTransparency = 0;
                v39 = false;
            end;
        end
    });
    for _, v73 in ipairs(v6) do
        v32:AddTitleButton(v73);
    end;
    v34 = v32:Add("TextBox", {
        Size = UDim2.new(1, -10, 0, 20), 
        Position = UDim2.new(0, 5, 0, 5), 
        BackgroundTransparency = 0.5, 
        BorderSizePixel = 0, 
        TextColor3 = Color3.new(1, 1, 1), 
        Text = "", 
        PlaceholderText = "Search", 
        TextStrokeTransparency = 0.8
    });
    v34:GetPropertyChangedSignal("Text"):Connect(function() --[[ Line: 341 ]]
        -- upvalues: v38 (ref), v9 (ref), v31 (ref)
        v38 = v9;
        v31(v9);
    end);
    l_gTable_0 = v32.gTable;
    v32:Ready();
    v38 = v9;
    v31(v9);
    if l_Update_0 and l_AutoUpdate_0 then
        while l_gTable_0.Active and wait(l_AutoUpdate_0) do
            v32:Refresh();
        end;
    end;
end;