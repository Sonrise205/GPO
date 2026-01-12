return function(v0) --[[ Line: 1 ]] --[[ Name: isMotor ]]
    local v1 = tostring(v0):match("^Motor%((.+)%)$");
    if v1 then
        return true, v1;
    else
        return false;
    end;
end;