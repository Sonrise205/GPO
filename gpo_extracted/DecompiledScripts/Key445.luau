return function() --[[ Line: 3 ]]
    return (tonumber((string.sub(tostring(Random.new():NextNumber()), 3, 8))));
end;