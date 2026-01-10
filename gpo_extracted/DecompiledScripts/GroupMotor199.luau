local v0 = require(script.Parent.BaseMotor);
local v1 = require(script.Parent.SingleMotor);
local v2 = require(script.Parent.isMotor);
local v3 = setmetatable({}, v0);
v3.__index = v3;
local function v6(v4) --[[ Line: 9 ]] --[[ Name: toMotor ]]
    -- upvalues: v2 (copy), v1 (copy), v3 (copy)
    if v2(v4) then
        return v4;
    else
        local v5 = typeof(v4);
        if v5 == "number" then
            return v1.new(v4, false);
        elseif v5 == "table" then
            return v3.new(v4, false);
        else
            error(("Unable to convert %q to motor; type %s is unsupported"):format(v4, v5), 2);
            return;
        end;
    end;
end;
v3.new = function(v7, v8) --[[ Line: 25 ]] --[[ Name: new ]]
    -- upvalues: v0 (copy), v3 (copy), v6 (copy)
    assert(v7, "Missing argument #1: initialValues");
    assert(typeof(v7) == "table", "initialValues must be a table!");
    assert(not v7.step, "initialValues contains disallowed property \"step\". Did you mean to put a table of values here?");
    local v9 = setmetatable(v0.new(), v3);
    if v8 ~= nil then
        v9._useImplicitConnections = v8;
    else
        v9._useImplicitConnections = true;
    end;
    v9._complete = true;
    v9._motors = {};
    for v10, v11 in pairs(v7) do
        v9._motors[v10] = v6(v11);
    end;
    return v9;
end;
v3.step = function(v12, v13) --[[ Line: 48 ]] --[[ Name: step ]]
    if v12._complete then
        return true;
    else
        local v14 = true;
        for _, v16 in pairs(v12._motors) do
            if not v16:step(v13) then
                v14 = false;
            end;
        end;
        v12._onStep:fire(v12:getValue());
        if v14 then
            if v12._useImplicitConnections then
                v12:stop();
            end;
            v12._complete = true;
            v12._onComplete:fire();
        end;
        return v14;
    end;
end;
v3.setGoal = function(v17, v18) --[[ Line: 77 ]] --[[ Name: setGoal ]]
    assert(not v18.step, "goals contains disallowed property \"step\". Did you mean to put a table of goals here?");
    v17._complete = false;
    v17._onStart:fire();
    for v19, v20 in pairs(v18) do
        assert(v17._motors[v19], ("Unknown motor for key %s"):format(v19)):setGoal(v20);
    end;
    if v17._useImplicitConnections then
        v17:start();
    end;
end;
v3.getValue = function(v21) --[[ Line: 93 ]] --[[ Name: getValue ]]
    local v22 = {};
    for v23, v24 in pairs(v21._motors) do
        v22[v23] = v24:getValue();
    end;
    return v22;
end;
v3.__tostring = function(_) --[[ Line: 103 ]] --[[ Name: __tostring ]]
    return "Motor(Group)";
end;
return v3;