return {
    fromScale = function(v0, v1) --[[ Line: 7 ]] --[[ Name: fromScale ]]
        local l_UICorner_0 = Instance.new("UICorner");
        l_UICorner_0.CornerRadius = UDim.new(v0, 0);
        l_UICorner_0.Parent = v1;
        return l_UICorner_0;
    end, 
    fromOffset = function(v3, v4) --[[ Line: 14 ]] --[[ Name: fromOffset ]]
        local l_UICorner_1 = Instance.new("UICorner");
        l_UICorner_1.CornerRadius = UDim.new(0, v3);
        l_UICorner_1.Parent = v4;
        return l_UICorner_1;
    end, 
    clampPositionToFrame = function(v6, v7, v8, v9) --[[ Line: 23 ]] --[[ Name: clampPositionToFrame ]]
        assert(v8 > 0, "Bad radius");
        assert(v9, "Bad point");
        local l_x_0 = v9.x;
        local l_y_0 = v9.y;
        local l_x_1 = v6.x;
        local l_y_1 = v6.y;
        local l_x_2 = v7.x;
        local l_y_2 = v7.y;
        local v16 = l_x_1 + v8;
        local v17 = l_x_1 + l_x_2 - v8;
        local v18 = l_y_1 + v8;
        local v19 = l_y_1 + l_y_2 - v8;
        local v20 = nil;
        local v21 = nil;
        v20 = if v16 < v17 then math.clamp(l_x_0, v16, v17) else v16;
        v21 = if v18 < v19 then math.clamp(l_y_0, v18, v19) else v18;
        local v22 = Vector2.new(v20, v21);
        local v23 = v9 - v22;
        if v23.magnitude == 0 then
            return nil, nil;
        else
            local l_unit_0 = v23.unit;
            return v22 + l_unit_0 * v8, l_unit_0;
        end;
    end
};