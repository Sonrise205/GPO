--!native
return function(v0, v1, v2) --[[ Line: 4 ]]
    if not v0 then
        error(("Warp: %*"):format(v1), v2 or 2);
    end;
end;