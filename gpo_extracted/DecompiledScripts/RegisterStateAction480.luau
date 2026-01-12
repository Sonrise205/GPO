return function(v0, v1, v2) --[[ Line: 1 ]]
    v0[v1] = function(...) --[[ Line: 3 ]]
        -- upvalues: v0 (copy), v2 (copy), v1 (copy)
        v0:setState({
            State = v2
        });
        local v3 = v0.props[v1];
        if v3 then
            v3(...);
        end;
    end;
end;