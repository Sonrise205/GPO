local v0 = require(script.Parent.ConnectionUtil);
local v1 = {};
v1.__index = v1;
v1.new = function() --[[ Line: 39 ]] --[[ Name: new ]]
    -- upvalues: v0 (copy), v1 (copy)
    return (setmetatable({
        _camera = game.Workspace.CurrentCamera, 
        _callbacks = {}, 
        _connectionUtil = v0.new(), 
        _enabled = false
    }, v1));
end;
v1._connectCallbacks = function(v2) --[[ Line: 52 ]] --[[ Name: _connectCallbacks ]]
    v2._camera = game.Workspace.CurrentCamera;
    if not v2._camera then
        return;
    else
        for v3, v4 in v2._callbacks do
            v2._connectionUtil:trackConnection(v3, v2._camera:GetPropertyChangedSignal(v3):Connect(v4));
            v4();
        end;
        return;
    end;
end;
v1.Enable = function(v5) --[[ Line: 65 ]] --[[ Name: Enable ]]
    if v5._enabled then
        return;
    else
        v5._enabled = true;
        v5._cameraChangedConnection = game.Workspace:GetPropertyChangedSignal("CurrentCamera"):Connect(function() --[[ Line: 72 ]]
            -- upvalues: v5 (copy)
            v5:_connectCallbacks();
        end);
        v5:_connectCallbacks();
        return;
    end;
end;
v1.Disable = function(v6) --[[ Line: 79 ]] --[[ Name: Disable ]]
    if not v6._enabled then
        return;
    else
        v6._enabled = false;
        if v6._cameraChangedConnection then
            v6._cameraChangedConnection:Disconnect();
            v6._cameraChangedConnection = nil;
        end;
        v6._connectionUtil:disconnectAll();
        return;
    end;
end;
v1.Connect = function(v7, v8, v9) --[[ Line: 94 ]] --[[ Name: Connect ]]
    v7._callbacks[v8] = v9;
    if not v7._camera then
        return;
    else
        v7._connectionUtil:trackConnection(v8, v7._camera:GetPropertyChangedSignal(v8):Connect(v9));
        return;
    end;
end;
v1.Disconnect = function(v10, v11) --[[ Line: 104 ]] --[[ Name: Disconnect ]]
    v10._connectionUtil:disconnect(v11);
    v10._callbacks[v11] = nil;
end;
v1.getCamera = function(v12) --[[ Line: 110 ]] --[[ Name: getCamera ]]
    return v12._camera;
end;
return v1;