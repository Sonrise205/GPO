local l_TextService_0 = game:GetService("TextService");
return function(v1, v2, v3, v4) --[[ Line: 3 ]]
    -- upvalues: l_TextService_0 (copy)
    local l_status_0, l_result_0 = pcall(function() --[[ Line: 5 ]]
        -- upvalues: v1 (copy), v2 (copy), v3 (copy), l_TextService_0 (ref), v4 (copy)
        local l_GetTextBoundsParams_0 = Instance.new("GetTextBoundsParams");
        l_GetTextBoundsParams_0.Text = v1;
        l_GetTextBoundsParams_0.Font = v2;
        l_GetTextBoundsParams_0.Size = v3;
        l_GetTextBoundsParams_0.Width = 1e999;
        local l_l_TextService_0_TextBoundsAsync_0 = l_TextService_0:GetTextBoundsAsync(l_GetTextBoundsParams_0);
        if v4 then
            l_l_TextService_0_TextBoundsAsync_0 = Vector2.new(l_l_TextService_0_TextBoundsAsync_0.X, l_l_TextService_0_TextBoundsAsync_0.Y * v4);
        end;
        return l_l_TextService_0_TextBoundsAsync_0;
    end);
    if l_status_0 then
        return l_status_0, l_result_0;
    else
        return l_status_0, Vector2.new();
    end;
end;