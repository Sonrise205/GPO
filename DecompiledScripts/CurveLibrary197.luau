local function _(v0, v1, v2) --[[ Line: 1 ]] --[[ Name: Lerp ]]
    return v0 + (v1 - v0) * v2;
end;
return {
    Bezier = {
        QuadBezier = function(v4, v5, v6, v7) --[[ Line: 7 ]] --[[ Name: QuadBezier ]]
            local v8 = v5 + (v6 - v5) * v4;
            return v8 + (v6 + (v7 - v6) * v4 - v8) * v4;
        end
    }, 
    Easings = {
        easeOutSine = function(v9) --[[ Line: 14 ]] --[[ Name: easeOutSine ]]
            return (math.sin(v9 * 3.141592653589793 / 2));
        end
    }
};