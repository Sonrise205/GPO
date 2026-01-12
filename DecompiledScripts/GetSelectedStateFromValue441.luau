return function(v0) --[[ Line: 1 ]]
    if v0 == nil then
        return "Indeterminate";
    elseif v0 == true then
        return "Selected";
    elseif v0 == false then
        return "None";
    else
        return;
    end;
end;