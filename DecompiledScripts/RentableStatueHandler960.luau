local v0 = require(script.Statue);
local v1 = require(script.Sign);
local v2 = {
    Initialized = false, 
    Duration = 1800
};
v2.init = function(_) --[[ Line: 8 ]] --[[ Name: init ]]
    -- upvalues: v2 (copy), v0 (copy), v1 (copy)
    if v2.Initialized then
        return;
    else
        v2.Initialized = true;
        v2.Statue = v0.new(script.Parent.tradingStatue);
        v2.Sign = v1.new(script.Parent.Sign, v2);
        print("Rentable Statue Handler initialized");
        return;
    end;
end;
return v2;