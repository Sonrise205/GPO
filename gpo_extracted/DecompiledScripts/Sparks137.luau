local l_Effects_0 = workspace.Effects;
local _ = game:GetService("RunService");
local l_TweenService_0 = game:GetService("TweenService");
local v3 = {};
v3.__index = v3;
v3.new = function(v4) --[[ Line: 21 ]] --[[ Name: new ]]
    -- upvalues: v3 (copy), l_Effects_0 (copy)
    local v5 = setmetatable({}, v3);
    v5.Direction = v4.Direction;
    v5.Model = script.Spark:Clone();
    local v6 = Random.new():NextNumber(3, 6);
    v5.Model.CustomPhysicalProperties = PhysicalProperties.new(0.3, 0.1, 1, 0, v6);
    v5.Model.Position = v4.Position;
    v5.Model.Parent = l_Effects_0;
    v5.Bounces = math.random(2, 5);
    v5:_main();
    _G.destroy(v5.Model, 3);
    return v5;
end;
local v7 = RaycastParams.new();
v7.FilterDescendantsInstances = {
    workspace.Islands, 
    workspace.Env, 
    workspace.Ships
};
v7.FilterType = Enum.RaycastFilterType.Include;
local function _(v8, v9) --[[ Line: 48 ]] --[[ Name: Raycast ]]
    -- upvalues: v7 (copy)
    return workspace:Raycast(v8, v9, v7);
end;
v3._main = function(v11) --[[ Line: 52 ]] --[[ Name: _main ]]
    -- upvalues: l_TweenService_0 (copy)
    v11.Model.AssemblyLinearVelocity = v11.Direction;
    local l_BodyForce_0 = Instance.new("BodyForce");
    l_BodyForce_0.Force = Vector3.new(0, workspace.Gravity * v11.Model:GetMass() * 0.5, 0);
    l_BodyForce_0.Parent = v11.Model;
    local v13 = Random.new():NextNumber(1, 2);
    l_TweenService_0:Create(v11.Model.Trail, TweenInfo.new(v13), {
        MaxLength = 0.1
    }):Play();
    l_TweenService_0:Create(v11.Model.Att1, TweenInfo.new(v13), {
        Position = Vector3.new()
    }):Play();
    l_TweenService_0:Create(v11.Model.Att2, TweenInfo.new(v13), {
        Position = Vector3.new()
    }):Play();
end;
local v14 = {};
local v15 = 0;
v14.start = function(_, v17) --[[ Line: 92 ]] --[[ Name: start ]]
    -- upvalues: v15 (ref), v3 (copy)
    if _G.checkRenderDistance(v17.Position) == false then
        return;
    elseif v15 >= 25 or _G.FPS <= 30 then
        return;
    else
        v15 = v15 + 1;
        v3.new({
            Direction = v17.Direction, 
            Position = v17.Position
        });
        task.delay(2, function() --[[ Line: 104 ]]
            -- upvalues: v15 (ref)
            v15 = v15 - 1;
        end);
        return;
    end;
end;
return v14;