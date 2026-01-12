local function v0(...) --[[ Line: 1 ]] --[[ Name: msg ]]
    return (("[Forge Emit API]: %*"):format((table.concat({
        ...
    }, " "))));
end;
return {
    error = function(...) --[[ Line: 7 ]] --[[ Name: error ]]
        -- upvalues: v0 (copy)
        error(v0(..., "\n"));
    end, 
    warn = function(...) --[[ Line: 11 ]] --[[ Name: warn ]]
        -- upvalues: v0 (copy)
        warn(v0(...));
        warn(v0(debug.traceback("stack trace:")));
    end, 
    info = function(...) --[[ Line: 16 ]] --[[ Name: info ]]
        -- upvalues: v0 (copy)
        print(v0(...));
    end
};