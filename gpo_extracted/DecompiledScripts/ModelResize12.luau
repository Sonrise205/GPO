local v0 = {};
local v1 = {};
local _ = game:GetService("RunService");
local l_TweenService_0 = game:GetService("TweenService");
local _ = require(game.ReplicatedStorage.Modules.BindToRender);
resizeModel = function(v5, v6) --[[ Line: 9 ]] --[[ Name: resizeModel ]]
    local l_Position_0 = v5.PrimaryPart.Position;
    for _, v9 in (v5:GetChildren()) do
        if v9:IsA("BasePart") then
            v9.Position = l_Position_0:Lerp(v9.Position, v6);
            v9.Size = v9.Size * v6;
        end;
    end;
end;
v0.TweenResize = function(_, v11, v12, v13, v14, v15) --[[ Line: 19 ]] --[[ Name: TweenResize ]]
    -- upvalues: v1 (copy)
    v1[v11] = {
        v13 - 1, 
        0, 
        0, 
        v12, 
        v14, 
        v15, 
        v11
    };
end;
game["Run Service"].Heartbeat:Connect(function(v16) --[[ Line: 26 ]] --[[ Name: renderFunction ]]
    -- upvalues: v1 (copy), l_TweenService_0 (copy)
    for v17, v18 in v1 do
        local v19, v20, v21, v22, v23, v24, v25 = unpack(v18);
        if v25.Parent ~= nil and v20 < 1 then
            v1[v25][2] = math.min(v20 + v16 / v22, 1);
            local l_l_TweenService_0_Value_0 = l_TweenService_0:GetValue(v20, v23, v24);
            resizeModel(v25, (l_l_TweenService_0_Value_0 * v19 + 1) / (v21 * v19 + 1));
            v1[v25][3] = l_l_TweenService_0_Value_0;
        else
            v1[v17] = nil;
        end;
    end;
end);
return v0;