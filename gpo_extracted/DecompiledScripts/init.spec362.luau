return function() --[[ Line: 1 ]]
    local v0 = require(script.Parent);
    it("should load with all public APIs", function() --[[ Line: 4 ]]
        -- upvalues: v0 (copy)
        local v1 = {
            createElement = "function", 
            createFragment = "function", 
            createRef = "function", 
            forwardRef = "function", 
            createBinding = "function", 
            joinBindings = "function", 
            mount = "function", 
            unmount = "function", 
            update = "function", 
            oneChild = "function", 
            setGlobalConfig = "function", 
            createContext = "function", 
            reify = "function", 
            teardown = "function", 
            reconcile = "function", 
            Component = true, 
            PureComponent = true, 
            Portal = true, 
            Children = true, 
            Event = true, 
            Change = true, 
            Ref = true, 
            None = true, 
            UNSTABLE = true
        };
        expect(v0).to.be.ok();
        for v2, v3 in pairs(v1) do
            local _ = nil;
            if not if typeof(v3) == "string" then typeof(v0[v2]) == v3 else v0[v2] ~= nil then
                local v5 = typeof(v3) == "boolean" and "present" or "of type " .. tostring(v3);
                local v6 = ("Expected public API member %q to be %s, but instead it was of type %s"):format(tostring(v2), v5, (typeof(v0[v2])));
                error(v6);
            end;
        end;
        for v7 in pairs(v0) do
            if v1[v7] == nil then
                local v8 = ("Found unknown public API key %q!"):format((tostring(v7)));
                error(v8);
            end;
        end;
    end);
end;