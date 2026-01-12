return {
    onNext = function(v0, v1) --[[ Line: 14 ]] --[[ Name: onNext ]]
        assert(typeof(v0) == "RBXScriptSignal", "Bad event");
        assert(type(v1) == "function", "Bad _function");
        local v2 = nil;
        v2 = v0:Connect(function(...) --[[ Line: 19 ]]
            -- upvalues: v2 (ref), v1 (copy)
            if v2.Connected then
                return;
            else
                v2:Disconnect();
                v1(...);
                return;
            end;
        end);
        return v2;
    end
};