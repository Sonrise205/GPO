local _ = game:GetService("TweenService");
local v1 = {};
v1.__index = v1;
v1.new = function(v2, v3) --[[ Line: 6 ]] --[[ Name: new ]]
    -- upvalues: v1 (copy)
    local v4 = setmetatable({}, v1);
    v4.Duration = v2.Duration * (math.random(75, 100) / 100);
    v4.Elapsed = 0;
    v4.SpinModifier = Random.new():NextNumber(5, 10);
    v4.TrackingPart = v2.Track;
    v4.Position = v2.Position;
    v4.Model = v4:_createModel();
    v4.totalData = v3;
    v4:_main();
    return v4;
end;
v1._createModel = function(v5) --[[ Line: 21 ]] --[[ Name: _createModel ]]
    local v6 = script.Coin:Clone();
    v6.CFrame = CFrame.Angles(1.5707963267948966, 0, 0) + v5.Position;
    v6.Parent = workspace.Effects;
    return v6;
end;
v1._main = function(v7) --[[ Line: 29 ]] --[[ Name: _main ]]
    local l_Position_0 = v7.Position;
    local l_Position_1 = v7.TrackingPart.Position;
    local v10 = l_Position_0 + Random.new():NextUnitVector() * 15;
    local v11 = v7.Model.Size * (math.random(90, 110) / 100);
    task.spawn(function() --[[ Line: 36 ]]
        -- upvalues: v7 (copy), l_Position_1 (ref), l_Position_0 (copy), v10 (copy), v11 (copy)
        while true do
            if v7.Model then
                local v12 = task.wait();
                local l_v7_0 = v7;
                l_v7_0.Elapsed = l_v7_0.Elapsed + v12;
                l_v7_0 = v7.Elapsed / v7.Duration;
                if l_v7_0 >= 1 or not v7.TrackingPart then
                    local l_totalData_0 = v7.totalData;
                    l_totalData_0.PickedUp = l_totalData_0.PickedUp + 1;
                    _G.PlaySound(v7.Model.CFrame, script.CoinPickup, {
                        Pitch = 0.9 + v7.totalData.PickedUp / 10
                    });
                    v7:Destroy();
                    return;
                else
                    l_Position_1 = v7.TrackingPart.Position;
                    local v15 = l_Position_0:Lerp(v10, l_v7_0):Lerp(v10:Lerp(l_Position_1, l_v7_0), l_v7_0);
                    v7.Model.CFrame = CFrame.Angles(1.5707963267948966, 0, v7.Elapsed * v7.SpinModifier) + v15;
                    v7.Model.Size = v11 * (1 - l_v7_0 * 0.75);
                    v7.Model.shader.Size = Vector3.new(v7.Model.Size.X * 1.2, v7.Model.Size.Y - 0.1, v7.Model.Size.Z * 1.2);
                    local v16 = v7.Model.Size.X / 10;
                    v7.Model.Attachment1.Position = Vector3.new(0, v16, 0);
                    v7.Model.Attachment2.Position = Vector3.new(0, -v16, 0);
                end;
            else
                return;
            end;
        end;
    end);
end;
v1.Destroy = function(v17) --[[ Line: 66 ]] --[[ Name: Destroy ]]
    v17.Model:Destroy();
    v17.Model = nil;
    setmetatable(v17, nil);
end;
v1.start = function(_, v19) --[[ Line: 73 ]] --[[ Name: start ]]
    -- upvalues: v1 (copy)
    local v20 = {
        PickedUp = 0
    };
    for _ = 1, v19.Count do
        local _ = v1.new(v19, v20);
        task.wait(0.05 + math.random(50, 200) / 10000);
    end;
    task.delay(v19.Duration + 1, function() --[[ Line: 79 ]]
        -- upvalues: v20 (ref)
        table.clear(v20);
        v20 = nil;
    end);
end;
return v1;