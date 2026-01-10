return function(v0, v1, v2) --[[ Line: 1 ]]
    local v3 = {};
    local v4 = {};
    for _, v6 in v2 do
        local l_v6_Collisions_0 = v6:GetCollisions(v1, v0.Radius);
        if #l_v6_Collisions_0 > 0 then
            table.insert(v4, v6:GetObject());
        end;
        for _, v9 in l_v6_Collisions_0 do
            table.insert(v3, v9);
        end;
    end;
    for _, v11 in v3 do
        v1 = v11.ClosestPoint + v11.Normal * v0.Radius;
    end;
    v0.CollisionsData = v3;
    v0.CollisionHits = v4;
    return v1;
end;