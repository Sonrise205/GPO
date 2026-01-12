local v0 = require(script.Parent.loader).load(script)("LinearValue");
return {
    animating = function(v1, v2) --[[ Line: 22 ]] --[[ Name: animating ]]
        -- upvalues: v0 (copy)
        v2 = v2 or 1.0E-6;
        local l_Position_0 = v1.Position;
        local l_Target_0 = v1.Target;
        local v5 = nil;
        if type(l_Target_0) == "number" then
            local v6 = true;
            if v2 >= math.abs(v1.Position - v1.Target) then
                v6 = v2 < math.abs(v1.Velocity);
            end;
            v5 = v6;
        else
            local v7 = typeof(l_Target_0);
            if v7 == "Vector3" or v7 == "Vector2" or v0.isLinear(l_Target_0) then
                local v8 = true;
                if v2 >= (v1.Position - v1.Target).magnitude then
                    v8 = v2 < v1.Velocity.magnitude;
                end;
                v5 = v8;
            else
                error("Unknown type");
            end;
        end;
        if v5 then
            return true, l_Position_0;
        else
            return false, l_Target_0;
        end;
    end, 
    getVelocityAdjustment = function(v9, v10, v11) --[[ Line: 58 ]] --[[ Name: getVelocityAdjustment ]]
        assert(v9, "Bad velocity");
        assert(v10, "Bad dampen");
        assert(v11, "Bad speed");
        return v9 * (2 * v10 / v11);
    end, 
    toLinearIfNeeded = function(v12) --[[ Line: 73 ]] --[[ Name: toLinearIfNeeded ]]
        -- upvalues: v0 (copy)
        if typeof(v12) == "Color3" then
            return v0.new(Color3.new, {
                v12.r, 
                v12.g, 
                v12.b
            });
        elseif typeof(v12) == "UDim2" then
            return v0.new(UDim2.new, {
                v12.X.Scale, 
                v12.X.Offset, 
                v12.Y.Scale, 
                v12.Y.Offset
            });
        elseif typeof(v12) == "UDim" then
            return v0.new(UDim.new, {
                v12.scale, 
                v12.offset
            });
        else
            return v12;
        end;
    end, 
    fromLinearIfNeeded = function(v13) --[[ Line: 91 ]] --[[ Name: fromLinearIfNeeded ]]
        -- upvalues: v0 (copy)
        if v0.isLinear(v13) then
            return v13:ToBaseValue();
        else
            return v13;
        end;
    end
};