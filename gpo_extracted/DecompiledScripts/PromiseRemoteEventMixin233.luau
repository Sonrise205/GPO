local v0 = require(script.Parent.loader).load(script)("promiseChild");
return {
    Add = function(v1, v2, v3) --[[ Line: 40 ]] --[[ Name: Add ]]
        assert(type(v2) == "table", "Bad class");
        assert(type(v3) == "string", "Bad remoteEventName");
        assert(not v2.PromiseRemoteEventMixin, "Class already has PromiseRemoteEventMixin defined");
        assert(not v2._remoteEventName, "Class already has _remoteEventName defined");
        v2.PromiseRemoteEvent = v1.PromiseRemoteEvent;
        v2._remoteEventName = v3;
    end, 
    PromiseRemoteEvent = function(v4) --[[ Line: 54 ]] --[[ Name: PromiseRemoteEvent ]]
        -- upvalues: v0 (copy)
        return v4._maid:GivePromise(v0(v4._obj, v4._remoteEventName));
    end
};