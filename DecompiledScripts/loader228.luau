local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_ServerScriptService_0 = game:GetService("ServerScriptService");
local l_RunService_0 = game:GetService("RunService");
local v3 = require(script.LegacyLoader);
local v4 = require(script.StaticLegacyLoader);
local v5 = require(script.LoaderUtils);
local v6 = nil;
local v7 = nil;
if l_RunService_0:IsRunning() then
    v6 = v3.new(script);
    v7 = {
        __call = function(_, v9) --[[ Line: 28 ]] --[[ Name: __call ]]
            -- upvalues: v6 (ref)
            return v6:Require(v9);
        end, 
        __index = function(_, v11) --[[ Line: 31 ]] --[[ Name: __index ]]
            -- upvalues: v6 (ref)
            return v6:Require(v11);
        end
    };
else
    v6 = v4.new();
    v7 = {
        __call = function(_, v13) --[[ Line: 38 ]] --[[ Name: __call ]]
            -- upvalues: v6 (ref)
            local v14 = getfenv(2);
            return v6:Require(v14.script, v13);
        end, 
        __index = function(_, v16) --[[ Line: 42 ]] --[[ Name: __index ]]
            -- upvalues: v6 (ref)
            local v17 = getfenv(2);
            return v6:Require(v17.script, v16);
        end
    };
end;
local function v22(v18) --[[ Line: 70 ]] --[[ Name: bootstrapGame ]]
    -- upvalues: l_RunService_0 (copy), v6 (ref), v5 (copy), l_ReplicatedStorage_0 (copy), l_ServerScriptService_0 (copy)
    assert(typeof(v18) == "Instance", "Bad instance");
    assert(l_RunService_0:IsRunning(), "Game must be running");
    v6:Lock();
    local v19, v20, v21 = v5.toWallyFormat(v18, false);
    v19.Parent = l_ReplicatedStorage_0;
    v21.Parent = l_ReplicatedStorage_0;
    v20.Parent = l_ServerScriptService_0;
    return v20;
end;
local function v26(v23) --[[ Line: 85 ]] --[[ Name: bootstrapPlugin ]]
    -- upvalues: v6 (ref), v3 (copy), v5 (copy)
    assert(typeof(v23) == "Instance", "Bad instance");
    v6 = v3.new(script);
    v6:Lock();
    local v24 = v5.toWallyFormat(v23, true);
    v24.Parent = v23;
    return function(v25) --[[ Line: 93 ]]
        -- upvalues: v24 (copy)
        if type(v25) == "string" then
            if v24:FindFirstChild(v25) then
                return require(v24:FindFirstChild(v25));
            else
                error(("Unknown module %q"):format((tostring(v25))));
                return;
            end;
        else
            return require(v25);
        end;
    end;
end;
return (setmetatable({
    load = function(v27) --[[ Line: 127 ]] --[[ Name: handleLoad ]]
        -- upvalues: v6 (ref)
        assert(typeof(v27) == "Instance", "Bad moduleScript");
        return v6:GetLoader(v27);
    end, 
    bootstrapGame = v22, 
    bootstrapPlugin = v26
}, v7));