local function _(v0) --[[ Line: 1 ]] --[[ Name: SafeUnit ]]
    if v0.Magnitude == 0 then
        return (Vector3.new(0, 0, 0, 0));
    else
        return v0.Unit;
    end;
end;
return function(v2, v3, v4) --[[ Line: 9 ]]
    local v5 = v4.Bones[v2.ParentIndex];
    if v5 then
        local l_FreeLength_0 = v2.FreeLength;
        local v7 = v3 - v5.Position;
        local v8 = if v7.Magnitude == 0 then Vector3.new(0, 0, 0, 0) else v7.Unit;
        return v5.Position + v8 * l_FreeLength_0;
    else
        return;
    end;
end;