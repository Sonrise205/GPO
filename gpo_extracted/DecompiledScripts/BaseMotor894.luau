local l_RunService_0 = game:GetService("RunService");
local v1 = require(script.Parent.Signal);
local function v2() --[[ Line: 5 ]]

end;
local v3 = {};
v3.__index = v3;
v3.new = function() --[[ Line: 10 ]] --[[ Name: new ]]
    -- upvalues: v1 (copy), v3 (copy)
    return (setmetatable({
        _onStep = v1.new(), 
        _onStart = v1.new(), 
        _onComplete = v1.new()
    }, v3));
end;
v3.onStep = function(v4, v5) --[[ Line: 18 ]] --[[ Name: onStep ]]
    return v4._onStep:connect(v5);
end;
v3.onStart = function(v6, v7) --[[ Line: 22 ]] --[[ Name: onStart ]]
    return v6._onStart:connect(v7);
end;
v3.onComplete = function(v8, v9) --[[ Line: 26 ]] --[[ Name: onComplete ]]
    return v8._onComplete:connect(v9);
end;
v3.start = function(v10) --[[ Line: 30 ]] --[[ Name: start ]]
    -- upvalues: l_RunService_0 (copy)
    if not v10._connection then
        v10._connection = l_RunService_0.RenderStepped:Connect(function(v11) --[[ Line: 32 ]]
            -- upvalues: v10 (copy)
            v10:step(v11);
        end);
    end;
end;
v3.stop = function(v12) --[[ Line: 38 ]] --[[ Name: stop ]]
    if v12._connection then
        v12._connection:Disconnect();
        v12._connection = nil;
    end;
end;
v3.destroy = v3.stop;
v3.step = v2;
v3.getValue = v2;
v3.setGoal = v2;
v3.__tostring = function(_) --[[ Line: 51 ]] --[[ Name: __tostring ]]
    return "Motor";
end;
return v3;