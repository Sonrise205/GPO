local v0 = {};
v0.__index = v0;
local function _(v1, v2, v3) --[[ Line: 11 ]] --[[ Name: tripleProduct ]]
    return v2 * v3:Dot(v1) - v1 * v3:Dot(v2);
end;
local function v27(_, v6, v7) --[[ Line: 15 ]] --[[ Name: containsOrigin ]]
    local v8 = v6[#v6];
    local v9 = -v8;
    if #v6 == 4 then
        local v10 = v6[3];
        local v11 = v6[2];
        local v12 = v6[1];
        local v13 = v10 - v8;
        local v14 = v11 - v8;
        local v15 = v12 - v8;
        local v16 = v13:Cross(v14);
        local v17 = v14:Cross(v15);
        local v18 = v15:Cross(v13);
        v16 = v16:Dot(v15) > 0 and -v16 or v16;
        v17 = v17:Dot(v13) > 0 and -v17 or v17;
        v18 = v18:Dot(v14) > 0 and -v18 or v18;
        if v16:Dot(v9) > 0 then
            table.remove(v6, 1);
            v7 = v16;
        elseif v17:Dot(v9) > 0 then
            table.remove(v6, 2);
            v7 = v17;
        elseif v18:Dot(v9) > 0 then
            table.remove(v6, 3);
            v7 = v18;
        else
            return true;
        end;
    elseif #v6 == 3 then
        local v19 = v6[2];
        local v20 = v6[1];
        local v21 = v19 - v8;
        local v22 = v20 - v8;
        local v23 = v21:Cross(v22);
        local l_Unit_0 = (v21 * v21:Dot(v22) - v22 * v21:Dot(v21)).Unit;
        local l_Unit_1 = (v22 * v22:Dot(v21) - v21 * v22:Dot(v22)).Unit;
        if l_Unit_0:Dot(v9) > 0 then
            table.remove(v6, 1);
            v7 = l_Unit_0;
        elseif l_Unit_1:Dot(v9) > 0 then
            table.remove(v6, 2);
            v7 = l_Unit_1;
        elseif not (v8 - v8 == Vector3.new(0, 0, 0, 0)) then
            return true;
        else
            v7 = v23:Dot(v9) > 0 and v23 or -v23;
        end;
    else
        local v26 = v6[1] - v8;
        v7 = (v9 * v26:Dot(v26) - v26 * v26:Dot(v9)).Unit;
    end;
    return false, v7;
end;
v0.new = function(v28, v29, v30, v31, v32, v33) --[[ Line: 74 ]] --[[ Name: new ]]
    -- upvalues: v0 (copy)
    local v34 = setmetatable({}, v0);
    v34.SetA = v28;
    v34.SetB = v29;
    v34.CentroidA = v30;
    v34.CentroidB = v31;
    v34.SupportA = v32;
    v34.SupportB = v33;
    return v34;
end;
v0.IsColliding = function(v35) --[[ Line: 89 ]] --[[ Name: IsColliding ]]
    -- upvalues: v27 (copy)
    local l_Unit_2 = (v35.CentroidA - v35.CentroidB).Unit;
    local v37 = {
        v35.SupportA(v35.SetA, l_Unit_2) - v35.SupportB(v35.SetB, -l_Unit_2)
    };
    l_Unit_2 = -l_Unit_2;
    for _ = 1, 20 do
        table.insert(v37, v35.SupportA(v35.SetA, l_Unit_2) - v35.SupportB(v35.SetB, -l_Unit_2));
        if v37[#v37]:Dot(l_Unit_2) <= 0 then
            return false;
        else
            local v39, v40 = v27(v35, v37, l_Unit_2);
            if v39 then
                return true;
            else
                l_Unit_2 = v40;
            end;
        end;
    end;
    return false;
end;
return v0;