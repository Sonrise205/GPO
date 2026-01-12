local v0 = {};
v0.pseudoLocalize = function(v1) --[[ Line: 15 ]] --[[ Name: pseudoLocalize ]]
    -- upvalues: v0 (copy)
    local l_PSEUDO_CHARACTER_MAP_0 = v0.PSEUDO_CHARACTER_MAP;
    local v3 = "";
    local v4 = false;
    for v5, v6 in utf8.graphemes(v1) do
        local v7 = v1:sub(v5, v6);
        if v7 == "{" or v7 == "[" then
            v4 = true;
            v3 = v3 .. v7;
        elseif v7 == "}" or v7 == "]" then
            v4 = false;
            v3 = v3 .. v7;
        elseif not v4 and l_PSEUDO_CHARACTER_MAP_0[v7] then
            v3 = v3 .. l_PSEUDO_CHARACTER_MAP_0[v7];
        else
            v3 = v3 .. v7;
        end;
    end;
    return v3;
end;
v0.addToLocalizationTable = function(v8, v9, v10) --[[ Line: 46 ]] --[[ Name: addToLocalizationTable ]]
    -- upvalues: v0 (copy)
    local v11 = v9 or "qlp-pls";
    local v12 = v10 or "en";
    local l_v8_Entries_0 = v8:GetEntries();
    for _, v15 in pairs(l_v8_Entries_0) do
        if not v15.Values[v11] then
            local v16 = v15.Values[v12];
            if v16 then
                v15.Values[v11] = v0.pseudoLocalize(v16);
            else
                warn(("[PseudoLocalize.addToLocalizationTable] - No entry in key %q for locale %q"):format(v15.Key, v12));
            end;
        end;
    end;
    v8:SetEntries(l_v8_Entries_0);
end;
v0.PSEUDO_CHARACTER_MAP = {
    a = "\195\161", 
    b = "\206\178", 
    c = "\195\167", 
    d = "\206\180", 
    e = "\195\168", 
    f = "\198\146", 
    g = "\207\177", 
    h = "\206\187", 
    i = "\195\175", 
    j = "J", 
    k = "\198\153", 
    l = "\226\132\147", 
    m = "\226\130\165", 
    n = "\195\177", 
    o = "\195\180", 
    p = "\198\165", 
    q = "9", 
    r = "\197\153", 
    s = "\198\168", 
    t = "\198\173", 
    u = "\195\186", 
    v = "\198\178", 
    w = "\207\137", 
    x = "\208\182", 
    y = "\194\165", 
    z = "\198\186", 
    A = "\195\130", 
    B = "\195\159", 
    C = "\195\135", 
    D = "\195\144", 
    E = "\195\137", 
    F = "F", 
    G = "G", 
    H = "H", 
    I = "\195\140", 
    J = "J", 
    K = "K", 
    L = "\194\163", 
    M = "M", 
    N = "N", 
    O = "\195\147", 
    P = "\195\158", 
    Q = "Q", 
    R = "R", 
    S = "\194\167", 
    T = "T", 
    U = "\195\155", 
    V = "V", 
    W = "W", 
    X = "X", 
    Y = "\195\157", 
    Z = "Z"
};
return v0;