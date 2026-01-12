local l_CatmullRom_0 = require(script:WaitForChild("CatmullRom"));
return {
    Make = function(_, v2) --[[ Line: 7 ]] --[[ Name: Make ]]
        -- upvalues: l_CatmullRom_0 (copy)
        local v3 = #v2;
        if v3 <= 1 then
            return function(_) --[[ Line: 11 ]]
                -- upvalues: v2 (copy)
                local v5 = v2[1];
                return v5.X, v5.Y, v5.Z;
            end;
        elseif v3 == 2 then
            local function _(v6, v7, v8) --[[ Line: 17 ]] --[[ Name: lerp ]]
                return v6 * (1 - v8) + v7 * v8;
            end;
            return function(v10) --[[ Line: 21 ]]
                -- upvalues: v2 (copy)
                local v11 = v2[1];
                local v12 = v2[2];
                local l_X_0 = v11.X;
                local l_X_1 = v12.X;
                local v15 = l_X_0 * (1 - v10) + l_X_1 * v10;
                l_X_1 = v11.Y;
                local l_Y_0 = v12.Y;
                l_X_0 = l_X_1 * (1 - v10) + l_Y_0 * v10;
                l_Y_0 = v11.Z;
                local l_Z_0 = v12.Z;
                return v15, l_X_0, l_Y_0 * (1 - v10) + l_Z_0 * v10;
            end;
        elseif v3 == 3 then
            local function _(v18, v19, v20, v21) --[[ Line: 32 ]] --[[ Name: cubicbezier ]]
                return (1 - v21) ^ 2 * v18 + 2 * (1 - v21) * v21 * v19 + v21 ^ 2 * v20;
            end;
            return function(v23) --[[ Line: 36 ]]
                -- upvalues: v2 (copy)
                local v24 = v2[1];
                local v25 = v2[2];
                local v26 = v2[3];
                local l_X_2 = v24.X;
                local l_X_3 = v25.X;
                local l_X_4 = v26.X;
                local v30 = (1 - v23) ^ 2 * l_X_2 + 2 * (1 - v23) * v23 * l_X_3 + v23 ^ 2 * l_X_4;
                l_X_3 = v24.Y;
                l_X_4 = v25.Y;
                local l_Y_1 = v26.Y;
                l_X_2 = (1 - v23) ^ 2 * l_X_3 + 2 * (1 - v23) * v23 * l_X_4 + v23 ^ 2 * l_Y_1;
                l_X_4 = v24.Z;
                l_Y_1 = v25.Z;
                local l_Z_1 = v26.Z;
                return v30, l_X_2, (1 - v23) ^ 2 * l_X_4 + 2 * (1 - v23) * v23 * l_Y_1 + v23 ^ 2 * l_Z_1;
            end;
        elseif v3 >= 4 then
            local v33 = {};
            for v34, v35 in v2 do
                v33[v34] = Vector3.new(v35.X, v35.Y, v35.Z);
            end;
            local v36 = l_CatmullRom_0.Path.create(v33);
            return function(v37) --[[ Line: 56 ]]
                -- upvalues: v36 (copy)
                local v38 = v36.GetPointOnPath(v37);
                return v38.X, v38.Y, v38.Z;
            end;
        else
            return;
        end;
    end, 
    V3 = function(_, v40, v41, v42) --[[ Line: 64 ]] --[[ Name: V3 ]]
        return (Vector3.new(v40, v41, v42));
    end
};