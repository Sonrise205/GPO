local _ = require(script.Parent.Types);
return function(v1) --[[ Line: 3 ]]
    local v2 = {
        _started = false, 
        _cycleTick = 0, 
        _globalRefreshRequested = false, 
        _localRefreshActive = false, 
        _widgets = {}, 
        _widgetCount = 0, 
        _stackIndex = 1, 
        _rootInstance = nil
    };
    v2._rootWidget = {
        ID = "R", 
        type = "Root", 
        Instance = v2._rootInstance, 
        ZIndex = 0
    };
    v2._lastWidget = v2._rootWidget;
    v2._rootConfig = {};
    v2._config = v2._rootConfig;
    v2._IDStack = {
        "R"
    };
    v2._usedIDs = {};
    v2._pushedId = nil;
    v2._nextWidgetId = nil;
    v2._states = {};
    v2._postCycleCallbacks = {};
    v2._connectedFunctions = {};
    v2._cycleCoroutine = coroutine.create(function() --[[ Line: 49 ]]
        -- upvalues: v2 (copy)
        while true do
            for _, v4 in v2._connectedFunctions do
                local l_status_0, l_result_0 = pcall(v4);
                if not l_status_0 then
                    v2._stackIndex = 1;
                    coroutine.yield(false, l_result_0);
                end;
                if v2._stackIndex ~= 1 then
                    v2._stackIndex = 1;
                    error("Callback has too few calls to Iris.End()", 0);
                end;
            end;
            coroutine.yield(true);
        end;
    end);
    local v7 = {};
    v7.__index = v7;
    v7.get = function(v8) --[[ Line: 80 ]] --[[ Name: get ]]
        return v8.value;
    end;
    v7.set = function(v9, v10) --[[ Line: 84 ]] --[[ Name: set ]]
        -- upvalues: v2 (copy)
        if v10 == v9.value then
            return v9.value;
        else
            v9.value = v10;
            for _, v12 in v9.ConnectedWidgets do
                v2._widgets[v12.type].UpdateState(v12);
            end;
            for _, v14 in v9.ConnectedFunctions do
                v14(v10);
            end;
            return v9.value;
        end;
    end;
    v7.onChange = function(v15, v16) --[[ Line: 99 ]] --[[ Name: onChange ]]
        table.insert(v15.ConnectedFunctions, v16);
    end;
    v2.StateClass = v7;
    v2._cycle = function() --[[ Line: 111 ]] --[[ Name: _cycle ]]
        -- upvalues: v1 (copy), v2 (copy)
        if v1.Disabled then
            return;
        else
            v2._rootWidget.lastCycleTick = v2._cycleTick;
            if v2._rootInstance == nil or v2._rootInstance.Parent == nil then
                v1.ForceRefresh();
            end;
            for _, v18 in v2._lastVDOM do
                if v18.lastCycleTick ~= v2._cycleTick then
                    v2._DiscardWidget(v18);
                end;
            end;
            v2._lastVDOM = v2._VDOM;
            v2._VDOM = v2._generateEmptyVDOM();
            task.spawn(function() --[[ Line: 135 ]]
                -- upvalues: v2 (ref)
                for _, v20 in v2._postCycleCallbacks do
                    v20();
                end;
            end);
            if v2._globalRefreshRequested then
                v2._generateSelectionImageObject();
                v2._globalRefreshRequested = false;
                for _, v22 in v2._lastVDOM do
                    v2._DiscardWidget(v22);
                end;
                v2._generateRootInstance();
                v2._lastVDOM = v2._generateEmptyVDOM();
            end;
            local l_v2_0 = v2;
            l_v2_0._cycleTick = l_v2_0._cycleTick + 1;
            v2._widgetCount = 0;
            table.clear(v2._usedIDs);
            if v2.parentInstance:IsA("GuiBase2d") and math.min(v2.parentInstance.AbsoluteSize.X, v2.parentInstance.AbsoluteSize.Y) < 100 then
                error("Iris Parent Instance is too small");
            end;
            if (v2.parentInstance:IsA("GuiBase2d") or v2.parentInstance:IsA("CoreGui") or v2.parentInstance:IsA("PluginGui") or v2.parentInstance:IsA("PlayerGui")) == false then
                error("Iris Parent Instance cant contain GUI");
            end;
            if game:GetService("RunService"):IsStudio() then
                for _, v25 in v2._connectedFunctions do
                    v25();
                end;
                return;
            else
                local v26 = coroutine.status(v2._cycleCoroutine);
                if v26 == "suspended" then
                    local _, v28, v29 = coroutine.resume(v2._cycleCoroutine);
                    if v28 == false then
                        error(v29, 0);
                        return;
                    end;
                elseif v26 == "running" then
                    error("Iris cycleCoroutine took to long to yield. Connected functions should not yield.");
                    return;
                else
                    error("unrecoverable state");
                end;
                return;
            end;
        end;
    end;
    v2._NoOp = function() --[[ Line: 206 ]] --[[ Name: _NoOp ]]

    end;
    v2.WidgetConstructor = function(v30, v31) --[[ Line: 210 ]] --[[ Name: WidgetConstructor ]]
        -- upvalues: v2 (copy), v1 (copy)
        local v32 = {
            All = {
                Required = {
                    "Generate", 
                    "Discard", 
                    "Update", 
                    "Args", 
                    "Events", 
                    "hasChildren", 
                    "hasState"
                }, 
                Optional = {}
            }, 
            IfState = {
                Required = {
                    "GenerateState", 
                    "UpdateState"
                }, 
                Optional = {}
            }, 
            IfChildren = {
                Required = {
                    "ChildAdded"
                }, 
                Optional = {
                    "ChildDiscarded"
                }
            }
        };
        local v33 = {};
        for _, v35 in v32.All.Required do
            assert(v31[v35] ~= nil, (("field %* is missing from widget %*, it is required for all widgets"):format(v35, v30)));
            v33[v35] = v31[v35];
        end;
        for _, v37 in v32.All.Optional do
            if v31[v37] == nil then
                v33[v37] = v2._NoOp;
            else
                v33[v37] = v31[v37];
            end;
        end;
        if v31.hasState then
            for _, v39 in v32.IfState.Required do
                assert(v31[v39] ~= nil, (("field %* is missing from widget %*, it is required for all widgets with state"):format(v39, v30)));
                v33[v39] = v31[v39];
            end;
            for _, v41 in v32.IfState.Optional do
                if v31[v41] == nil then
                    v33[v41] = v2._NoOp;
                else
                    v33[v41] = v31[v41];
                end;
            end;
        end;
        if v31.hasChildren then
            for _, v43 in v32.IfChildren.Required do
                assert(v31[v43] ~= nil, (("field %* is missing from widget %*, it is required for all widgets with children"):format(v43, v30)));
                v33[v43] = v31[v43];
            end;
            for _, v45 in v32.IfChildren.Optional do
                if v31[v45] == nil then
                    v33[v45] = v2._NoOp;
                else
                    v33[v45] = v31[v45];
                end;
            end;
        end;
        v2._widgets[v30] = v33;
        v1.Args[v30] = v33.Args;
        local v46 = {};
        for v47, v48 in v33.Args do
            v46[v48] = v47;
        end;
        v33.ArgNames = v46;
        for v49, _ in v33.Events do
            if v1.Events[v49] == nil then
                v1.Events[v49] = function() --[[ Line: 301 ]]
                    -- upvalues: v2 (ref), v49 (copy)
                    return v2._EventCall(v2._lastWidget, v49);
                end;
            end;
        end;
    end;
    v2._Insert = function(v51, v52, v53) --[[ Line: 308 ]] --[[ Name: _Insert ]]
        -- upvalues: v2 (copy)
        local v54 = nil;
        local v55 = v2._getID(3);
        local v56 = v2._widgets[v51];
        local l_v2_1 = v2;
        l_v2_1._widgetCount = l_v2_1._widgetCount + 1;
        if v2._VDOM[v55] then
            return v2._ContinueWidget(v55, v51);
        else
            l_v2_1 = {};
            if v52 ~= nil then
                if type(v52) ~= "table" then
                    v52 = {
                        v52
                    };
                end;
                for v58, v59 in v52 do
                    l_v2_1[v56.ArgNames[v58]] = v59;
                end;
            end;
            table.freeze(l_v2_1);
            if v2._lastVDOM[v55] and v51 == v2._lastVDOM[v55].type then
                if v2._localRefreshActive then
                    v2._DiscardWidget(v2._lastVDOM[v55]);
                else
                    v54 = v2._lastVDOM[v55];
                end;
            end;
            if v54 == nil then
                v54 = v2._GenNewWidget(v51, l_v2_1, v53, v55);
            end;
            if v2._deepCompare(v54.providedArguments, l_v2_1) == false then
                v54.arguments = v2._deepCopy(l_v2_1);
                v54.providedArguments = l_v2_1;
                v56.Update(v54);
            end;
            v54.lastCycleTick = v2._cycleTick;
            if v56.hasChildren then
                local l_v2_2 = v2;
                l_v2_2._stackIndex = l_v2_2._stackIndex + 1;
                v2._IDStack[v2._stackIndex] = v54.ID;
            end;
            v2._VDOM[v55] = v54;
            v2._lastWidget = v54;
            return v54;
        end;
    end;
    v2._GenNewWidget = function(v61, v62, v63, v64) --[[ Line: 375 ]] --[[ Name: _GenNewWidget ]]
        -- upvalues: v2 (copy)
        local v65 = v2._IDStack[v2._stackIndex];
        local v66 = v2._widgets[v61];
        local v67 = {};
        setmetatable(v67, v67);
        v67.ID = v64;
        v67.type = v61;
        v67.parentWidget = v2._VDOM[v65];
        v67.trackedEvents = {};
        v67.ZIndex = v67.parentWidget.ZIndex + v2._widgetCount * 64 + v2._config.ZIndexOffset;
        v67.Instance = v66.Generate(v67);
        v67.Instance.Parent = if v2._config.Parent then v2._config.Parent else v2._widgets[v67.parentWidget.type].ChildAdded(v67.parentWidget, v67);
        v67.providedArguments = v62;
        v67.arguments = v2._deepCopy(v62);
        v66.Update(v67);
        local v68 = nil;
        if v66.hasState then
            if v63 then
                for v69, v70 in v63 do
                    if type(v70) ~= "table" or getmetatable(v70) ~= v2.StateClass then
                        v63[v69] = v2._widgetState(v67, v69, v70);
                    end;
                end;
                v67.state = v63;
                for _, v72 in v63 do
                    v72.ConnectedWidgets[v67.ID] = v67;
                end;
            else
                v67.state = {};
            end;
            v66.GenerateState(v67);
            v66.UpdateState(v67);
            v67.stateMT = {};
            setmetatable(v67.state, v67.stateMT);
            v67.__index = v67.state;
            v68 = v67.stateMT;
        else
            v68 = v67;
        end;
        v68.__index = function(_, v74) --[[ Line: 432 ]]
            -- upvalues: v2 (ref), v67 (copy)
            return function() --[[ Line: 433 ]]
                -- upvalues: v2 (ref), v67 (ref), v74 (copy)
                return v2._EventCall(v67, v74);
            end;
        end;
        return v67;
    end;
    v2._ContinueWidget = function(v75, v76) --[[ Line: 440 ]] --[[ Name: _ContinueWidget ]]
        -- upvalues: v2 (copy)
        local v77 = v2._widgets[v76];
        local v78 = v2._VDOM[v75];
        if v77.hasChildren then
            local l_v2_3 = v2;
            l_v2_3._stackIndex = l_v2_3._stackIndex + 1;
            v2._IDStack[v2._stackIndex] = v78.ID;
        end;
        v2._lastWidget = v78;
        return v78;
    end;
    v2._DiscardWidget = function(v80) --[[ Line: 454 ]] --[[ Name: _DiscardWidget ]]
        -- upvalues: v2 (copy)
        local l_parentWidget_0 = v80.parentWidget;
        if l_parentWidget_0 then
            v2._widgets[l_parentWidget_0.type].ChildDiscarded(l_parentWidget_0, v80);
        end;
        v2._widgets[v80.type].Discard(v80);
    end;
    v2._widgetState = function(v82, v83, v84) --[[ Line: 465 ]] --[[ Name: _widgetState ]]
        -- upvalues: v2 (copy)
        local v85 = v82.ID .. v83;
        if v2._states[v85] then
            v2._states[v85].ConnectedWidgets[v82.ID] = v82;
            return v2._states[v85];
        else
            v2._states[v85] = {
                value = v84, 
                ConnectedWidgets = {
                    [v82.ID] = v82
                }, 
                ConnectedFunctions = {}
            };
            setmetatable(v2._states[v85], v2.StateClass);
            return v2._states[v85];
        end;
    end;
    v2._EventCall = function(v86, v87) --[[ Line: 481 ]] --[[ Name: _EventCall ]]
        -- upvalues: v2 (copy)
        local v88 = v2._widgets[v86.type].Events[v87];
        assert(v88 ~= nil, (("widget %* has no event of name %*"):format(v86.type, v87)));
        if v86.trackedEvents[v87] == nil then
            v88.Init(v86);
            v86.trackedEvents[v87] = true;
        end;
        return v88.Get(v86);
    end;
    v2._GetParentWidget = function() --[[ Line: 493 ]] --[[ Name: _GetParentWidget ]]
        -- upvalues: v2 (copy)
        return v2._VDOM[v2._IDStack[v2._stackIndex]];
    end;
    v2._generateEmptyVDOM = function() --[[ Line: 499 ]] --[[ Name: _generateEmptyVDOM ]]
        -- upvalues: v2 (copy)
        return {
            R = v2._rootWidget
        };
    end;
    v2._generateRootInstance = function() --[[ Line: 505 ]] --[[ Name: _generateRootInstance ]]
        -- upvalues: v2 (copy)
        v2._rootInstance = v2._widgets.Root.Generate(v2._widgets.Root);
        v2._rootInstance.Parent = v2.parentInstance;
        v2._rootWidget.Instance = v2._rootInstance;
    end;
    v2._generateSelectionImageObject = function() --[[ Line: 512 ]] --[[ Name: _generateSelectionImageObject ]]
        -- upvalues: v2 (copy)
        if v2.SelectionImageObject then
            v2.SelectionImageObject:Destroy();
        end;
        local l_Frame_0 = Instance.new("Frame");
        l_Frame_0.Position = UDim2.fromOffset(-1, -1);
        l_Frame_0.Size = UDim2.new(1, 2, 1, 2);
        l_Frame_0.BackgroundColor3 = v2._config.SelectionImageObjectColor;
        l_Frame_0.BackgroundTransparency = v2._config.SelectionImageObjectTransparency;
        l_Frame_0.BorderSizePixel = 0;
        local l_UIStroke_0 = Instance.new("UIStroke");
        l_UIStroke_0.Thickness = 1;
        l_UIStroke_0.Color = v2._config.SelectionImageObjectBorderColor;
        l_UIStroke_0.Transparency = v2._config.SelectionImageObjectBorderTransparency;
        l_UIStroke_0.LineJoinMode = Enum.LineJoinMode.Round;
        l_UIStroke_0.ApplyStrokeMode = Enum.ApplyStrokeMode.Border;
        l_UIStroke_0.Parent = l_Frame_0;
        local l_UICorner_0 = Instance.new("UICorner");
        l_UICorner_0.CornerRadius = UDim.new(0, 2);
        l_UICorner_0.Parent = l_Frame_0;
        v2.SelectionImageObject = l_Frame_0;
    end;
    v2._getID = function(v92) --[[ Line: 543 ]] --[[ Name: _getID ]]
        -- upvalues: v2 (copy)
        if v2._nextWidgetId then
            local l__nextWidgetId_0 = v2._nextWidgetId;
            v2._nextWidgetId = nil;
            return l__nextWidgetId_0;
        else
            local v94 = 1 + (v92 or 1);
            local v95 = "";
            local v96 = debug.info(v94, "l");
            while v96 ~= -1 and v96 ~= nil do
                v95 = v95 .. "+" .. v96;
                v94 = v94 + 1;
                v96 = debug.info(v94, "l");
            end;
            if v2._usedIDs[v95] then
                local l__usedIDs_0 = v2._usedIDs;
                l__usedIDs_0[v95] = l__usedIDs_0[v95] + 1;
            else
                v2._usedIDs[v95] = 1;
            end;
            return v95 .. ":" .. if v2._pushedId then v2._pushedId else v2._usedIDs[v95];
        end;
    end;
    v2._deepCompare = function(v98, v99) --[[ Line: 570 ]] --[[ Name: _deepCompare ]]
        -- upvalues: v2 (copy)
        for v100, v101 in v98 do
            local v102 = v99[v100];
            if type(v101) == "table" then
                if v102 and type(v102) == "table" then
                    if v2._deepCompare(v101, v102) == false then
                        return false;
                    end;
                else
                    return false;
                end;
            elseif type(v101) ~= type(v102) or v101 ~= v102 then
                return false;
            end;
        end;
        return true;
    end;
    v2._deepCopy = function(v103) --[[ Line: 592 ]] --[[ Name: _deepCopy ]]
        -- upvalues: v2 (copy)
        local v104 = {};
        for v105, v106 in pairs(v103) do
            if type(v106) == "table" then
                v106 = v2._deepCopy(v106);
            end;
            v104[v105] = v106;
        end;
        return v104;
    end;
    v2._lastVDOM = v2._generateEmptyVDOM();
    v2._VDOM = v2._generateEmptyVDOM();
    v1.Internal = v2;
    v1._config = v2._config;
    return v2;
end;