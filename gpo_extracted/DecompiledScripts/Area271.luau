local v0 = {};
isInsideBrick = function(v1, v2, v3) --[[ Line: 3 ]] --[[ Name: isInsideBrick ]]
    local v4 = v2:PointToObjectSpace(v1);
    local v5 = false;
    if math.abs(v4.X) <= v3.X / 2 then
        v5 = false;
        if math.abs(v4.Y) <= v3.Y / 2 then
            v5 = math.abs(v4.Z) <= v3.Z / 2;
        end;
    end;
    return v5;
end;
local _ = {};
local _ = {};
v0.setup = function(_, _, v10, v11) --[[ Line: 12 ]] --[[ Name: setup ]]
    local l_p_0 = workspace.CurrentCamera.CFrame.p;
    if (l_p_0 - v10.p).magnitude > v11.magnitude then
        return false;
    elseif isInsideBrick(l_p_0, v10, v11) == true then
        return true;
    else
        return false;
    end;
end;
return v0;