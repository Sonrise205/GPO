local l_Collider_0 = require(script.Parent:WaitForChild("Collider"));
local l_SB_VERBOSE_LOG_0 = require(script.Parent.Parent.Parent:WaitForChild("Dependencies"):WaitForChild("Utilities")).SB_VERBOSE_LOG;
local v2 = {};
v2.__index = v2;
v2.new = function(v3, v4) --[[ Line: 57 ]] --[[ Name: new ]]
    -- upvalues: v2 (copy)
    local v5 = setmetatable({
        m_Object = v4, 
        m_Awake = true, 
        m_LastSleepCycle = 0, 
        Destroyed = false, 
        Colliders = {}
    }, v2);
    v5:m_LoadColliderTable(v3);
    v5.DestroyConnection = v4:GetPropertyChangedSignal("Parent"):Connect(function() --[[ Line: 68 ]]
        -- upvalues: v4 (copy), v5 (copy)
        if v4.Parent == nil then
            v5.Destroyed = true;
        end;
    end);
    return v5;
end;
v2.m_LoadCollider = function(v6, v7) --[[ Line: 80 ]] --[[ Name: m_LoadCollider ]]
    -- upvalues: l_Collider_0 (copy)
    local v8 = Vector3.new(v7.ScaleX, v7.ScaleY, v7.ScaleZ);
    local v9 = Vector3.new(v7.OffsetX, v7.OffsetY, v7.OffsetZ);
    local v10 = Vector3.new(v7.RotationX, v7.RotationY, v7.RotationZ);
    local v11 = l_Collider_0.new();
    v11.Scale = v8;
    v11.Offset = v9;
    v11.Rotation = v10;
    v11.Type = v7.Type;
    v11:SetObject(v6.m_Object);
    table.insert(v6.Colliders, v11);
end;
v2.m_LoadColliderTable = function(v12, v13) --[[ Line: 98 ]] --[[ Name: m_LoadColliderTable ]]
    for _, v15 in v13 do
        v12:m_LoadCollider(v15);
    end;
end;
v2.GetObject = function(v16) --[[ Line: 108 ]] --[[ Name: GetObject ]]
    return v16.m_Object;
end;
v2.GetCollisions = function(v17, v18, v19) --[[ Line: 116 ]] --[[ Name: GetCollisions ]]
    if not v17.m_Object then
        return {};
    elseif #v17.Colliders == 0 then
        return {};
    else
        if os.clock() - v17.m_LastSleepCycle >= 0.2 then
            v17.m_LastSleepCycle = os.clock();
            if v17.m_Object:IsDescendantOf(workspace) then
                v17.m_Awake = true;
            else
                v17.m_Awake = false;
            end;
        end;
        if not v17.m_Awake then
            return {};
        else
            local v20 = {};
            for _, v22 in v17.Colliders do
                local l_v22_ClosestPoint_0, v24, v25 = v22:GetClosestPoint(v18, v19);
                if l_v22_ClosestPoint_0 then
                    table.insert(v20, {
                        ClosestPoint = v24, 
                        Normal = v25
                    });
                end;
            end;
            return v20;
        end;
    end;
end;
v2.Step = function(v26) --[[ Line: 164 ]] --[[ Name: Step ]]
    for _, v28 in v26.Colliders do
        v28:Step();
    end;
end;
v2.DrawDebug = function(v29, v30, v31, v32, v33) --[[ Line: 177 ]] --[[ Name: DrawDebug ]]
    for _, v35 in v29.Colliders do
        v35:DrawDebug(v29, v30, v31, v32, v33);
        v35.InNarrowphase = false;
    end;
end;
v2.Destroy = function(v36) --[[ Line: 185 ]] --[[ Name: Destroy ]]
    -- upvalues: l_SB_VERBOSE_LOG_0 (copy)
    task.synchronize();
    l_SB_VERBOSE_LOG_0((("Collider object destroying, object: %*"):format(v36.m_Object)));
    v36.DestroyConnection:Disconnect();
    if #v36.Colliders ~= 0 then
        for _, v38 in v36.Colliders do
            v38:Destroy();
        end;
    end;
    setmetatable(v36, nil);
    task.desynchronize();
end;
return v2;