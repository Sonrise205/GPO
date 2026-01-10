local v3 = {
    fromUDim = function(v0) --[[ Line: 8 ]] --[[ Name: fromUDim ]]
        local l_UIPadding_0 = Instance.new("UIPadding");
        l_UIPadding_0.PaddingBottom = v0;
        l_UIPadding_0.PaddingTop = v0;
        l_UIPadding_0.PaddingLeft = v0;
        l_UIPadding_0.PaddingRight = v0;
        return l_UIPadding_0;
    end, 
    getTotalPadding = function(v2) --[[ Line: 18 ]] --[[ Name: getTotalPadding ]]
        return UDim2.new(v2.PaddingLeft + v2.PaddingRight, v2.PaddingBottom + v2.PaddingTop);
    end
};
v3.getTotalAbsolutePadding = function(v4, v5) --[[ Line: 23 ]] --[[ Name: getTotalAbsolutePadding ]]
    -- upvalues: v3 (copy)
    local v6 = v3.getTotalPadding(v4);
    return Vector2.new(v6.X.Offset + v6.X.Scale * v5.x, v6.Y.Offset + v6.Y.Scale * v5.Y);
end;
v3.getHorizontalPadding = function(v7) --[[ Line: 31 ]] --[[ Name: getHorizontalPadding ]]
    return v7.PaddingLeft + v7.PaddingRight;
end;
return v3;