local v0 = require(script.Parent.CameraShakeInstance);
local v8 = {
    Bump = function() --[[ Line: 11 ]] --[[ Name: Bump ]]
        -- upvalues: v0 (copy)
        local v1 = v0.new(2.5, 4, 0.1, 0.75);
        v1.PositionInfluence = Vector3.new(0.15000000596046448, 0.15000000596046448, 0.15000000596046448, 0);
        v1.RotationInfluence = Vector3.new(1, 1, 1, 0);
        return v1;
    end, 
    Explosion = function() --[[ Line: 20 ]] --[[ Name: Explosion ]]
        -- upvalues: v0 (copy)
        local v2 = v0.new(5, 10, 0, 1.5);
        v2.PositionInfluence = Vector3.new(0.25, 0.25, 0.25, 0);
        v2.RotationInfluence = Vector3.new(4, 1, 1, 0);
        return v2;
    end, 
    Earthquake = function() --[[ Line: 28 ]] --[[ Name: Earthquake ]]
        -- upvalues: v0 (copy)
        local v3 = v0.new(0.6, 3.5, 2, 10);
        v3.PositionInfluence = Vector3.new(0.25, 0.25, 0.25, 0);
        v3.RotationInfluence = Vector3.new(1, 1, 4, 0);
        return v3;
    end, 
    BadTrip = function() --[[ Line: 36 ]] --[[ Name: BadTrip ]]
        -- upvalues: v0 (copy)
        local v4 = v0.new(10, 0.15, 5, 10);
        v4.PositionInfluence = Vector3.new(0, 0, 0.15000000596046448, 0);
        v4.RotationInfluence = Vector3.new(2, 1, 4, 0);
        return v4;
    end, 
    HandheldCamera = function() --[[ Line: 45 ]] --[[ Name: HandheldCamera ]]
        -- upvalues: v0 (copy)
        local v5 = v0.new(1, 0.25, 5, 10);
        v5.PositionInfluence = Vector3.new(0, 0, 0, 0);
        v5.RotationInfluence = Vector3.new(1, 0.5, 0.5, 0);
        return v5;
    end, 
    Vibration = function() --[[ Line: 54 ]] --[[ Name: Vibration ]]
        -- upvalues: v0 (copy)
        local v6 = v0.new(0.4, 20, 2, 2);
        v6.PositionInfluence = Vector3.new(0, 0.15000000596046448, 0, 0);
        v6.RotationInfluence = Vector3.new(1.25, 0, 4, 0);
        return v6;
    end, 
    RoughDriving = function() --[[ Line: 62 ]] --[[ Name: RoughDriving ]]
        -- upvalues: v0 (copy)
        local v7 = v0.new(1, 2, 1, 1);
        v7.PositionInfluence = Vector3.new(0, 0, 0, 0);
        v7.RotationInfluence = Vector3.new(1, 1, 1, 0);
        return v7;
    end
};
return (setmetatable({}, {
    __index = function(_, v10) --[[ Line: 74 ]] --[[ Name: __index ]]
        -- upvalues: v8 (copy)
        local v11 = v8[v10];
        if type(v11) == "function" then
            return v11();
        else
            error("No preset found with index \"" .. v10 .. "\"");
            return;
        end;
    end
}));