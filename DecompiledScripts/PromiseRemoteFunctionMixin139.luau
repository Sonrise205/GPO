local v0 = require(script.Parent.loader).load(script)("promiseChild");
return {
    Add = function(v1, v2, v3) --[[ Line: 40 ]] --[[ Name: Add ]]
        assert(type(v2) == "table", "Bad class");
        assert(type(v3) == "string", "Bad remoteFunctionName");
        assert(not v2.PromiseRemoteFunctionMixin, "Class already has PromiseRemoteFunctionMixin defined");
        assert(not v2._remoteFunctionName, "Class already has _remoteFunctionName defined");
        v2.PromiseRemoteFunction = v1.PromiseRemoteFunction;
        v2._remoteFunctionName = v3;
    end, 
    PromiseRemoteFunction = function(v4) --[[ Line: 54 ]] --[[ Name: PromiseRemoteFunction ]]
        -- upvalues: v0 (copy)
        return v4._maid:GivePromise(v0(v4._obj, v4._remoteFunctionName));
    end
};