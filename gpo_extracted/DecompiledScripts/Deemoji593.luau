local _ = function(v0) --[[ Line: 11 ]] --[[ Name: lookupify ]]
    local v1 = {};
    for _, v3 in v0 do
        v1[v3] = true;
    end;
    return v1;
end;
local v5 = {
    {
        128513, 
        128591
    }, 
    {
        9986, 
        10160
    }, 
    {
        128640, 
        128704
    }, 
    {
        9410, 
        127569
    }, 
    {
        127744, 
        128511
    }, 
    {
        8596, 
        8601
    }, 
    {
        9193, 
        9203
    }, 
    {
        9723, 
        9981
    }, 
    {
        127744, 
        128511
    }, 
    {
        128512, 
        128566
    }, 
    {
        128641, 
        128709
    }, 
    {
        127757, 
        128359
    }
};
local v6 = {
    169, 
    174, 
    8252, 
    8265, 
    8419, 
    8482, 
    8505, 
    8617, 
    8618, 
    8986, 
    8987, 
    9642, 
    9643, 
    9654, 
    9664, 
    10548, 
    10549, 
    11013, 
    11014, 
    11015, 
    11035, 
    11036, 
    11088, 
    11093, 
    12336, 
    12349, 
    12951, 
    12953, 
    126980, 
    127183
};
local v7 = {};
for _, v9 in v6 do
    v7[v9] = true;
end;
local l_v7_0 = v7;
return function(v11) --[[ Line: 70 ]]
    -- upvalues: l_v7_0 (copy), v5 (copy)
    local v12 = {};
    for _, v14 in utf8.codes(v11) do
        local v15 = true;
        if l_v7_0[v14] then
            v15 = false;
        else
            for _, v17 in v5 do
                if v17[1] <= v14 and v14 <= v17[2] then
                    v15 = false;
                    break;
                end;
            end;
        end;
        if v15 then
            table.insert(v12, v14);
        end;
    end;
    return utf8.char(unpack(v12));
end;