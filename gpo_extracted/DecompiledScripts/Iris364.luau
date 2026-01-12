local _ = require(script.Types);
local v1 = {};
local v2 = require(script.Internal)(v1);
v1.Disabled = false;
v1.Args = {};
v1.Events = {};
v1.HasInit = function() --[[ Line: 12 ]] --[[ Name: HasInit ]]
    -- upvalues: v2 (copy)
    return v2._started;
end;
v1.Init = function(v3, v4) --[[ Line: 16 ]] --[[ Name: Init ]]
    -- upvalues: v2 (copy), v1 (copy)
    if v3 == nil then
        v3 = game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui");
    end;
    if v4 == nil then
        v4 = game:GetService("RunService").Heartbeat;
    end;
    v2.parentInstance = v3;
    assert(v2._started == false, "Iris.Init can only be called once.");
    v2._started = true;
    v2._generateRootInstance();
    v2._generateSelectionImageObject();
    task.spawn(function() --[[ Line: 33 ]]
        -- upvalues: v4 (ref), v2 (ref)
        if typeof(v4) == "function" then
            while true do
                v4();
                v2._cycle();
            end;
        end;
        if v4 ~= nil then
            v4:Connect(function() --[[ Line: 40 ]]
                -- upvalues: v2 (ref)
                v2._cycle();
            end);
        end;
    end);
    return v1;
end;
v1.Connect = function(_, v6) --[[ Line: 49 ]] --[[ Name: Connect ]]
    -- upvalues: v2 (copy)
    if v2._started == false then
        warn("Iris:Connect() was called before calling Iris.Init(), the connected function will never run");
    end;
    table.insert(v2._connectedFunctions, v6);
end;
v1.Append = function(v7) --[[ Line: 56 ]] --[[ Name: Append ]]
    -- upvalues: v2 (copy)
    local v8 = v2._GetParentWidget();
    local _ = nil;
    v7.Parent = if v2._config.Parent then v2._config.Parent else v2._widgets[v8.type].ChildAdded(v8, {
        type = "userInstance"
    });
end;
v1.End = function() --[[ Line: 67 ]] --[[ Name: End ]]
    -- upvalues: v2 (copy)
    if v2._stackIndex == 1 then
        error("Callback has too many calls to Iris.End()", 2);
    end;
    v2._IDStack[v2._stackIndex] = nil;
    local l_v2_0 = v2;
    l_v2_0._stackIndex = l_v2_0._stackIndex - 1;
end;
v1.ForceRefresh = function() --[[ Line: 81 ]] --[[ Name: ForceRefresh ]]
    -- upvalues: v2 (copy)
    v2._globalRefreshRequested = true;
end;
v1.UpdateGlobalConfig = function(v11) --[[ Line: 85 ]] --[[ Name: UpdateGlobalConfig ]]
    -- upvalues: v2 (copy), v1 (copy)
    for v12, v13 in v11 do
        v2._rootConfig[v12] = v13;
    end;
    v1.ForceRefresh();
end;
v1.PushConfig = function(v14) --[[ Line: 92 ]] --[[ Name: PushConfig ]]
    -- upvalues: v1 (copy), v2 (copy)
    local v15 = v1.State(-1);
    if v15.value == -1 then
        v15:set(v14);
    elseif v2._deepCompare(v15:get(), v14) == false then
        v2._localRefreshActive = true;
        v15:set(v14);
    end;
    v2._config = setmetatable(v14, {
        __index = v2._config
    });
end;
v1.PopConfig = function() --[[ Line: 110 ]] --[[ Name: PopConfig ]]
    -- upvalues: v2 (copy)
    v2._localRefreshActive = false;
    v2._config = getmetatable(v2._config).__index;
end;
v1.TemplateConfig = require(script.config);
v1.UpdateGlobalConfig(v1.TemplateConfig.colorDark);
v1.UpdateGlobalConfig(v1.TemplateConfig.sizeDefault);
v1.UpdateGlobalConfig(v1.TemplateConfig.utilityDefault);
v2._globalRefreshRequested = false;
v1.PushId = function(v16) --[[ Line: 127 ]] --[[ Name: PushId ]]
    -- upvalues: v2 (copy)
    assert(typeof(v16) == "string", "Iris expected Iris.PushId id to PushId to be a string.");
    v2._pushedId = tostring(v16);
end;
v1.PopId = function() --[[ Line: 133 ]] --[[ Name: PopId ]]
    -- upvalues: v2 (copy)
    v2._pushedId = nil;
end;
v1.SetNextWidgetID = function(v17) --[[ Line: 137 ]] --[[ Name: SetNextWidgetID ]]
    -- upvalues: v2 (copy)
    v2._nextWidgetId = v17;
end;
v1.State = function(v18) --[[ Line: 147 ]] --[[ Name: State ]]
    -- upvalues: v2 (copy)
    local v19 = v2._getID(2);
    if v2._states[v19] then
        return v2._states[v19];
    else
        v2._states[v19] = {
            value = v18, 
            ConnectedWidgets = {}, 
            ConnectedFunctions = {}
        };
        setmetatable(v2._states[v19], v2.StateClass);
        return v2._states[v19];
    end;
end;
v1.WeakState = function(v20) --[[ Line: 161 ]] --[[ Name: WeakState ]]
    -- upvalues: v2 (copy)
    local v21 = v2._getID(2);
    if v2._states[v21] then
        if #v2._states[v21].ConnectedWidgets == 0 then
            v2._states[v21] = nil;
        else
            return v2._states[v21];
        end;
    end;
    v2._states[v21] = {
        value = v20, 
        ConnectedWidgets = {}, 
        ConnectedFunctions = {}
    };
    setmetatable(v2._states[v21], v2.StateClass);
    return v2._states[v21];
end;
v1.ComputedState = function(v22, v23) --[[ Line: 179 ]] --[[ Name: ComputedState ]]
    -- upvalues: v2 (copy)
    local v24 = v2._getID(2);
    if v2._states[v24] then
        return v2._states[v24];
    else
        v2._states[v24] = {
            value = v23(v22.value), 
            ConnectedWidgets = {}, 
            ConnectedFunctions = {}
        };
        v22:onChange(function(v25) --[[ Line: 190 ]]
            -- upvalues: v2 (ref), v24 (copy), v23 (copy)
            v2._states[v24]:set(v23(v25));
        end);
        setmetatable(v2._states[v24], v2.StateClass);
        return v2._states[v24];
    end;
end;
v1.ShowDemoWindow = require(script.demoWindow)(v1);
require(script.widgets)(v2);
require(script.API)(v1);
return v1;