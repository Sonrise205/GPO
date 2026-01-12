local v0 = require(game.ReplicatedStorage.Modules.FastSignal);
local v1 = {};
local v2 = RaycastParams.new();
v2.FilterDescendantsInstances = {
    workspace.Env, 
    workspace.Islands, 
    workspace.Ships
};
v2.FilterType = Enum.RaycastFilterType.Whitelist;
v1.AwaitLanding = function(_, v4) --[[ Line: 9 ]] --[[ Name: AwaitLanding ]]
    -- upvalues: v0 (copy), v2 (copy)
    assert(v4, "No Data provided!");
    assert(v4.Character, "No Character provided!");
    local l_Duration_0 = v4.Duration;
    local l_checkDelay_0 = v4.checkDelay;
    local _ = v4.Type or "Normal";
    local l_Character_0 = v4.Character;
    local l_HumanoidRootPart_0 = l_Character_0.HumanoidRootPart;
    local v10 = tick();
    local v11 = v0.new();
    coroutine.wrap(function() --[[ Line: 22 ]]
        -- upvalues: l_checkDelay_0 (copy), l_Character_0 (copy), l_HumanoidRootPart_0 (copy), v2 (ref), v11 (copy), v10 (copy), l_Duration_0 (copy)
        local v12 = false;
        local v13 = nil;
        if l_checkDelay_0 then
            task.wait(l_checkDelay_0);
        end;
        local v14 = nil;
        local v15, _, _ = _G.getRayFloor(l_Character_0.PrimaryPart.CFrame, 10);
        repeat
            if v13 then
                local l_CFrame_0 = l_HumanoidRootPart_0.CFrame;
                local l_Position_0 = l_CFrame_0.Position;
                v14 = workspace:Raycast(v13.Position, (l_Position_0 - v13.Position).Unit * 5, v2);
                if not v14 then
                    local v20 = workspace:Raycast(l_Position_0, -l_CFrame_0.RightVector * 4, v2);
                    local v21 = workspace:Raycast(l_Position_0, -l_CFrame_0.RightVector * 4, v2);
                    local v22 = workspace:Raycast(l_Position_0, l_CFrame_0.LookVector * 4, v2);
                    v14 = workspace:Raycast(l_Position_0, -l_CFrame_0.LookVector * 5, v2) or v22 or v20 or v21;
                end;
                if v14 then
                    if v15 and v14.Instance == v15 then
                        v14 = nil;
                        v12 = true;
                    else
                        v11:Fire(v14);
                        break;
                    end;
                end;
            end;
            if not v12 then
                v13 = l_HumanoidRootPart_0.CFrame;
                game["Run Service"].Stepped:Wait();
            end;
            v12 = false;
        until tick() - v10 >= l_Duration_0;
        if not v14 then
            v11:Fire();
        end;
    end)();
    return v11;
end;
return v1;