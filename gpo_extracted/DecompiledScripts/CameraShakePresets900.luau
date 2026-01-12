local v0 = require(script.Parent.CameraShakeInstance);
local v18 = {
    Bump = function() --[[ Line: 26 ]] --[[ Name: Bump ]]
        -- upvalues: v0 (copy)
        local v1 = v0.new(2.5, 4, 0.1, 0.75);
        v1.PositionInfluence = Vector3.new(0.15000000596046448, 0.15000000596046448, 0.15000000596046448, 0);
        v1.RotationInfluence = Vector3.new(1, 1, 1, 0);
        return v1;
    end, 
    Punch = function() --[[ Line: 33 ]] --[[ Name: Punch ]]
        -- upvalues: v0 (copy)
        local v2 = v0.new(1, 10, 0, 0.4);
        v2.PositionInfluence = Vector3.new(0.30000001192092896, 0.30000001192092896, 0.30000001192092896, 0);
        v2.RotationInfluence = Vector3.new(1, 1, 1, 0);
        return v2;
    end, 
    PunchHeavy = function() --[[ Line: 40 ]] --[[ Name: PunchHeavy ]]
        -- upvalues: v0 (copy)
        local v3 = v0.new(4, 8, 0.1, 0.8);
        v3.PositionInfluence = Vector3.new(0.30000001192092896, 0.30000001192092896, 0.30000001192092896, 0);
        v3.RotationInfluence = Vector3.new(3, 1, 1, 0);
        return v3;
    end, 
    Explosion = function() --[[ Line: 48 ]] --[[ Name: Explosion ]]
        -- upvalues: v0 (copy)
        local v4 = v0.new(5, 10, 0, 1.5);
        v4.PositionInfluence = Vector3.new(0.25, 0.25, 0.25, 0);
        v4.RotationInfluence = Vector3.new(4, 1, 1, 0);
        return v4;
    end, 
    Earthquake = function() --[[ Line: 58 ]] --[[ Name: Earthquake ]]
        -- upvalues: v0 (copy)
        local v5 = v0.new(0.6, 3.5, 2, 10);
        v5.PositionInfluence = Vector3.new(0.25, 0.25, 0.25, 0);
        v5.RotationInfluence = Vector3.new(1, 1, 4, 0);
        return v5;
    end, 
    BadTrip = function() --[[ Line: 68 ]] --[[ Name: BadTrip ]]
        -- upvalues: v0 (copy)
        local v6 = v0.new(10, 0.15, 5, 10);
        v6.PositionInfluence = Vector3.new(0, 0, 0.15000000596046448, 0);
        v6.RotationInfluence = Vector3.new(2, 1, 4, 0);
        return v6;
    end, 
    WindBreak = function() --[[ Line: 75 ]] --[[ Name: WindBreak ]]
        -- upvalues: v0 (copy)
        local v7 = v0.new(3, 5, 0.05, 0.75);
        v7.PositionInfluence = Vector3.new(0.07999999821186066, 0.07999999821186066, 0.07999999821186066, 0);
        v7.RotationInfluence = Vector3.new(0.44999998807907104, 0.30000001192092896, 0.3499999940395355, 0);
        return v7;
    end, 
    HandheldCamera = function() --[[ Line: 84 ]] --[[ Name: HandheldCamera ]]
        -- upvalues: v0 (copy)
        local v8 = v0.new(1, 0.25, 5, 10);
        v8.PositionInfluence = Vector3.new(0, 0, 0, 0);
        v8.RotationInfluence = Vector3.new(1, 0.5, 0.5, 0);
        return v8;
    end, 
    Vibration = function() --[[ Line: 94 ]] --[[ Name: Vibration ]]
        -- upvalues: v0 (copy)
        local v9 = v0.new(0.4, 20, 2, 2);
        v9.PositionInfluence = Vector3.new(0, 0.15000000596046448, 0, 0);
        v9.RotationInfluence = Vector3.new(1.25, 0, 4, 0);
        return v9;
    end, 
    RoughDriving = function() --[[ Line: 104 ]] --[[ Name: RoughDriving ]]
        -- upvalues: v0 (copy)
        local v10 = v0.new(1, 2, 1, 1);
        v10.PositionInfluence = Vector3.new(0, 0, 0, 0);
        v10.RotationInfluence = Vector3.new(1, 1, 1, 0);
        return v10;
    end, 
    Underwater = function() --[[ Line: 111 ]] --[[ Name: Underwater ]]
        -- upvalues: v0 (copy)
        local v11 = v0.new(1, 0.25, 5, 10);
        v11.PositionInfluence = Vector3.new(0, 0, 0, 0);
        v11.RotationInfluence = Vector3.new(0.25, 0.25, 0.25, 0);
        return v11;
    end, 
    Choke = function() --[[ Line: 118 ]] --[[ Name: Choke ]]
        -- upvalues: v0 (copy)
        local v12 = v0.new(2, 4, 1, 1);
        v12.PositionInfluence = Vector3.new(0, 0, 0, 0);
        v12.RotationInfluence = Vector3.new(3, 1, 3, 0);
        return v12;
    end, 
    JinxMinigun = function() --[[ Line: 125 ]] --[[ Name: JinxMinigun ]]
        -- upvalues: v0 (copy)
        local v13 = v0.new(0.4, 20, 0.2, 0.2);
        v13.PositionInfluence = Vector3.new(0.10000000149011612, 0.10000000149011612, 0.10000000149011612, 0);
        v13.RotationInfluence = Vector3.new(1, 1, 1, 0);
        return v13;
    end, 
    DragonBreath = function() --[[ Line: 132 ]] --[[ Name: DragonBreath ]]
        -- upvalues: v0 (copy)
        local v14 = v0.new(0.8, 6, 0.25, 0.5);
        v14.PositionInfluence = Vector3.new(0.10000000149011612, 0.10000000149011612, 0.10000000149011612, 0);
        v14.RotationInfluence = Vector3.new(1, 1, 1, 0);
        return v14;
    end, 
    Shaking = function() --[[ Line: 139 ]] --[[ Name: Shaking ]]
        -- upvalues: v0 (copy)
        local v15 = v0.new(1, 6, 0.05, 0.45);
        v15.PositionInfluence = Vector3.new(0.30000001192092896, 0.30000001192092896, 0.30000001192092896, 0);
        v15.RotationInfluence = Vector3.new(0.5, 0.75, 1, 0);
        return v15;
    end, 
    AceBlowUp = function() --[[ Line: 146 ]] --[[ Name: AceBlowUp ]]
        -- upvalues: v0 (copy)
        local v16 = v0.new(5, 10, 0.05, 0.75);
        v16.PositionInfluence = Vector3.new(0.10000000149011612, 0.10000000149011612, 0.10000000149011612, 0);
        v16.RotationInfluence = Vector3.new(1, 0.5, 0.8500000238418579, 0);
        return v16;
    end, 
    HakaiSlashHold = function() --[[ Line: 152 ]] --[[ Name: HakaiSlashHold ]]
        -- upvalues: v0 (copy)
        local v17 = v0.new(0.3, 5, 0.25, 0.5);
        v17.PositionInfluence = Vector3.new(0.10000000149011612, 0.10000000149011612, 0.10000000149011612, 0);
        v17.RotationInfluence = Vector3.new(1, 1, 1, 0);
        return v17;
    end
};
return (setmetatable({}, {
    __index = function(_, v20) --[[ Line: 162 ]] --[[ Name: __index ]]
        -- upvalues: v18 (copy)
        local v21 = v18[v20];
        if type(v21) == "function" then
            return v21();
        else
            error("No preset found with index \"" .. v20 .. "\"");
            return;
        end;
    end
}));