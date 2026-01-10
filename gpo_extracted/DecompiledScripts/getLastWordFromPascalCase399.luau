return function(v0) --[[ Line: 12 ]]
    local v1 = string.sub(v0, #v0 - ((string.find(string.reverse(v0), "%u") or #v0 + 1) - 1));
    return (string.gsub(v1, "%d+$", ""));
end;