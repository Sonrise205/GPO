local function v1(v0) --[[ Line: 1 ]] --[[ Name: Linear ]]
    return v0;
end;
return function(v2, v3, v4, v5) --[[ Line: 5 ]] --[[ Name: Bezier ]]
    -- upvalues: v1 (copy)
    if not v2 or not v3 or not v4 or not v5 then
        error("Need 4 numbers to construct a Bezier curve", 0);
    end;
    if v2 < 0 or v2 > 1 or v4 < 0 or v4 > 1 then
        error("The x values must be within range [0, 1]", 0);
    end;
    if v2 == v3 and v4 == v5 then
        return v1;
    else
        local v6 = {};
        for v7 = 0, 10 do
            local v8 = v7 / 10;
            v6[v7] = (((1 - 3 * v4 + 3 * v4) * v8 + (3 * v4 - 6 * v2)) * v8 + 3 * v2) * v8;
        end;
        return function(v9) --[[ Line: 24 ]]
            -- upvalues: v2 (copy), v3 (copy), v4 (copy), v5 (copy), v1 (ref), v6 (copy)
            if v2 == v3 and v4 == v5 then
                return v1;
            elseif v9 == 0 or v9 == 1 then
                return v9;
            else
                local v10 = nil;
                local v11 = 0;
                local v12 = 1;
                while v12 ~= 10 and v6[v12] <= v9 do
                    v11 = v11 + 0.1;
                    v12 = v12 + 1;
                end;
                v12 = v12 - 1;
                local v13 = v11 + (v9 - v6[v12]) / (v6[v12 + 1] - v6[v12]) / 10;
                local v14 = 3 * (1 - 3 * v4 + 3 * v2) * v13 * v13 + 2 * (3 * v4 - 6 * v2) * v13 + 3 * v2;
                if v14 >= 0.001 then
                    for _ = 0, 3 do
                        local v16 = 3 * (1 - 3 * v4 + 3 * v2) * v13 * v13 + 2 * (3 * v4 - 6 * v2) * v13 + 3 * v2;
                        v13 = v13 - ((((1 - 3 * v4 + 3 * v2) * v13 + (3 * v4 - 6 * v2)) * v13 + 3 * v2) * v13 - v9) / v16;
                    end;
                    v10 = v13;
                elseif v14 == 0 then
                    v10 = v13;
                else
                    local v17 = v11 + 0.1;
                    local v18 = 0;
                    local v19 = nil;
                    local v20 = nil;
                    while math.abs(v18) > 1.0E-7 and v20 < 10 do
                        v19 = v11 + (v17 - v11) / 2;
                        v18 = (((1 - 3 * v4 + 3 * v2) * v19 + (3 * v4 - 6 * v2)) * v19 + 3 * v2) * v19 - v9;
                        if v18 > 0 then
                            v17 = v19;
                        else
                            v11 = v19;
                        end;
                        v20 = v20 + 1;
                    end;
                    v10 = v19;
                end;
                return (((1 - 3 * v5 + 3 * v3) * v10 + (3 * v5 - 6 * v3)) * v10 + 3 * v3) * v10;
            end;
        end;
    end;
end;