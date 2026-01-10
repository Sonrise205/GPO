return {
    RandomValueFromRange = function(v0) --[[ Line: 3 ]]
        if v0.Min == v0.Max then
            return v0.Min;
        else
            return v0.Min + (v0.Max - v0.Min) * math.random();
        end;
    end
};