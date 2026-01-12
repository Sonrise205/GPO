local v0 = {};
v0.__index = v0;
local _ = nil;
local v2 = require(game.ReplicatedStorage.Modules.MaidClass);
local v3 = nil;
if game["Run Service"]:IsClient() == true then
    print("is client");
    v3 = game.ReplicatedStorage.Events:WaitForChild("GunManager");
    v3.Name = "CIcklcon";
    game.ReplicatedStorage.Events.GunManager2.Name = "GunManager";
end;
v2 = v2.new();
local v4 = nil;
local v5 = nil;
local v6 = nil;
local v7 = nil;
local v8 = nil;
if game:GetService("RunService"):IsServer() == false then
    local v9, v10, v11, v12, v13 = require(game.ReplicatedStorage.Modules.ScriptSet).get();
    v4 = v9;
    v5 = v10;
    v6 = v11;
    v7 = v12;
    v8 = v13;
end;
local v14 = nil;
local v15 = {};
local v16 = {
    Bazooka = 0.65, 
    ["Burn Bazooka"] = 0.5, 
    Rifle = 0.3, 
    Pistol = 0.5, 
    Shotgun = 0.92, 
    Galt = 0.5
};
v0.aimTimes = v16;
local v17 = {
    Bazooka = 4, 
    ["Burn Bazooka"] = 5.2, 
    Rifle = 1.3, 
    Pistol = 1.25, 
    Shotgun = 1, 
    Galt = 8
};
v0.reloadTimes = v17;
local v18 = {
    Galt = true
};
local v19 = {
    ["Burn Bazooka"] = {
        4.5, 
        1
    }
};
local v20 = {
    ["Burn Bazooka"] = 5
};
local v21 = {
    Galt = 1002323
};
v0.revs = v18;
v0.chargeables = v19;
v0.maxcharge = v20;
v0.revAmm = v21;
local v22 = {
    Bazooka = "Explosive", 
    ["Burn Bazooka"] = "Explosive", 
    Rifle = "Normal", 
    Pistol = "Normal", 
    Shotgun = "Spread", 
    Galt = "Spread"
};
v0.getAimTimes = function(_) --[[ Line: 73 ]] --[[ Name: getAimTimes ]]
    -- upvalues: v16 (copy)
    return v16;
end;
v0.getReloadTimes = function(_) --[[ Line: 77 ]] --[[ Name: getReloadTimes ]]
    -- upvalues: v17 (copy)
    return v17;
end;
v0.getRevs = function(_) --[[ Line: 81 ]] --[[ Name: getRevs ]]
    -- upvalues: v18 (copy)
    return v18;
end;
v0.getRevsAm = function(_) --[[ Line: 85 ]] --[[ Name: getRevsAm ]]
    -- upvalues: v21 (copy)
    return v21;
end;
v0.getIcons = function(_) --[[ Line: 89 ]] --[[ Name: getIcons ]]
    -- upvalues: v22 (copy)
    return v22;
end;
local function _() --[[ Line: 94 ]] --[[ Name: getId ]]
    return (game:GetService("HttpService"):GenerateGUID(true));
end;
local function v33(v29) --[[ Line: 100 ]] --[[ Name: specialFire ]]
    -- upvalues: v4 (ref)
    local l_Character_0 = v4.Character;
    if v29 == "Bazooka" then
        local v31 = Instance.new("BodyVelocity", l_Character_0.HumanoidRootPart);
        v31.MaxForce = Vector3.new(1000000000, 1000000000, 1000000000, 0);
        v31.Velocity = l_Character_0.HumanoidRootPart.CFrame.lookVector * -50;
        _G.destroy(v31, 0.1);
        return;
    else
        if v29 == "Burn Bazooka" then
            local v32 = Instance.new("BodyVelocity", l_Character_0.HumanoidRootPart);
            v32.MaxForce = Vector3.new(1000000000, 1000000000, 1000000000, 0);
            v32.Velocity = l_Character_0.HumanoidRootPart.CFrame.lookVector * -75;
            _G.destroy(v32, 0.1);
        end;
        return;
    end;
end;
v0.New = function(v34, v35) --[[ Line: 115 ]] --[[ Name: New ]]
    -- upvalues: v14 (ref), v15 (ref), v2 (ref), v0 (copy)
    if script.Guns:FindFirstChild(v34) == nil then
        return;
    else
        local l_Character_1 = game.Players.LocalPlayer.Character;
        if game["Run Service"]:IsClient() == true then
            if v14 == nil then
                v14 = l_Character_1;
            elseif v14 and v14 ~= l_Character_1 and v15[v14] ~= nil then
                table.clear(v15[v14]);
                v15[v14] = nil;
            end;
        end;
        if v15[l_Character_1] == nil then
            v15 = {};
            v15[l_Character_1] = {};
        end;
        local l_FirstChild_0 = script.Guns:FindFirstChild(v34);
        local v38 = l_Character_1.Humanoid:LoadAnimation(l_FirstChild_0.Idle);
        local v39 = l_Character_1.Humanoid:LoadAnimation(l_FirstChild_0.Aim);
        local v40 = l_Character_1.Humanoid:LoadAnimation(l_FirstChild_0.Aim2);
        local v41 = l_Character_1.Humanoid:LoadAnimation(l_FirstChild_0.Fire);
        local v42 = l_Character_1.Humanoid:LoadAnimation(l_FirstChild_0.Reload);
        v38.Priority = Enum.AnimationPriority.Movement;
        v40.Priority = Enum.AnimationPriority.Action;
        v42.Priority = Enum.AnimationPriority.Action;
        local v43 = nil;
        v43 = {
            Reloaded = true, 
            Ready = true, 
            Equiped = true, 
            IsAiming = false, 
            Reved = false, 
            EqId = nil, 
            Name = v34, 
            Tool = v35, 
            Anims = {
                idle = v38, 
                aim = v39, 
                aimHold = v40, 
                fire = v41, 
                reload = v42
            }, 
            term = function() --[[ Line: 156 ]] --[[ Name: term ]]
                -- upvalues: v43 (ref), v2 (ref)
                table.clear(v43);
                v2[v43] = nil;
                setmetatable(v43, nil);
            end
        };
        table.insert(v15[l_Character_1], v43);
        setmetatable(v43, v0);
        v2[v43] = v43;
        return v43;
    end;
end;
v0.Aim = function(v44) --[[ Line: 168 ]] --[[ Name: Aim ]]
    -- upvalues: v16 (copy)
    if v44.Equiped == false then
        warn("equiped is False");
        return;
    else
        if v44.Anims.aim.IsPlaying == false and v44.IsAiming == false and v44.Ready == true and v44.Reloaded == true then
            v44.Anims.aim:Play();
            script.AimSFX:Play();
            _G.TurnCharacterToMouse = true;
            v44.Ready = false;
            local v45 = tick();
            repeat
                game["Run Service"].RenderStepped:Wait();
            until tick() - v45 >= v16[v44.Name] or v44.Anims.aim.TimePosition >= v16[v44.Name];
            v44.Ready = true;
            if v44.Equiped == true then
                v44.Anims.aim:AdjustSpeed(0);
                v44.Anims.aimHold:Play(0);
                v44.IsAiming = true;
                return;
            end;
        elseif v44.Reloaded == false and v44.Ready == true then
            script.NOAMMO:Play();
        end;
        return;
    end;
end;
local v46 = {};
v0.Rev = function(v47, v48) --[[ Line: 191 ]] --[[ Name: Rev ]]
    -- upvalues: v18 (copy), v5 (ref), v46 (copy)
    if v47.Equiped == false then
        return;
    elseif v47.Anims.IsAiming == false then
        return;
    elseif v18[v47.Name] == nil then
        return;
    else
        local l_v5_FirstChild_0 = v5:FindFirstChild(v47.Name .. "Gun");
        if l_v5_FirstChild_0 == nil then
            return;
        else
            local l_FirstChild_1 = script.Customs:FindFirstChild(v47.Name);
            if v46[v5] == nil then
                v46[v5] = {};
            end;
            if l_FirstChild_1 then
                if v46[v5][v47.Name] == nil then
                    v46[v5][v47.Name] = require(script.Customs[v47.Name]);
                end;
                v46[v5][v47.Name]:Rev(l_v5_FirstChild_0, v48, v47);
            end;
            return;
        end;
    end;
end;
v0.Fire = function(v51, v52) --[[ Line: 218 ]] --[[ Name: Fire ]]
    -- upvalues: v4 (ref), v3 (ref), v33 (copy)
    if v51.Equiped == false then
        return;
    else
        local l_Character_2 = v4.Character;
        if v51.IsAiming == true and v51.Reloaded == true and l_Character_2:FindFirstChild(v51.Name .. "Gun") and v51.Ready == true and l_Character_2:FindFirstChild("Blocking") == nil then
            v51.Ready = false;
            v51.IsAiming = false;
            if v52 == nil then
                v52 = {};
            end;
            v52.Gun = v51.Name;
            v52.Position = _G.MouseCF.p;
            v52.Start = l_Character_2:FindFirstChild(v51.Name .. "Gun").Hole.CFrame;
            v52.joe = "true";
            v3:FireServer("fire", v52);
            task.wait(0.1);
            v33(v51.Name);
            v51.Anims.aimHold:Stop();
            v51.Anims.aim:Stop();
            v51.Reloaded = false;
            v51.Anims.fire:Play();
            task.spawn(function() --[[ Line: 240 ]]
                -- upvalues: v51 (copy)
                v51.Anims.fire.Stopped:Wait();
                _G.TurnCharacterToMouse = false;
            end);
            task.wait(0.5);
            v51.Ready = true;
        end;
        return;
    end;
end;
v0.GetCharge = function(v54) --[[ Line: 249 ]] --[[ Name: GetCharge ]]
    -- upvalues: v3 (ref)
    return v3.gunFunctions:InvokeServer("charge", {
        Gun = v54.Name
    });
end;
local function v61(_) --[[ Line: 252 ]] --[[ Name: checkFloor ]]
    local l_Character_3 = game.Players.LocalPlayer.Character;
    local v57 = Ray.new(l_Character_3.HumanoidRootPart.CFrame.p, CFrame.new(l_Character_3.HumanoidRootPart.Position).upVector * -12);
    local v58, _, _ = _G.raycastWhitelist(v57, {
        workspace.Islands, 
        workspace.Env, 
        workspace.Ships
    });
    if v58 ~= nil then
        return true;
    else
        return false;
    end;
end;
v0.Reload = function(v62) --[[ Line: 262 ]] --[[ Name: Reload ]]
    -- upvalues: v61 (copy), v5 (ref), v46 (copy), v3 (ref)
    if v62.Equiped == false then
        return;
    elseif v61(v5) == false then
        _G.displayMessage("<Color=Red>You need to be touching the ground to reload!");
        return;
    else
        if v62.Reloaded == false and v62.Equiped == true and v62.Ready == true then
            v62.Ready = false;
            local v63 = nil;
            do
                local l_v63_0 = v63;
                if script.Guns[v62.Name]:FindFirstChild("Reload1") == nil then
                    v62.Anims.reload:Play();
                    if script.Guns:FindFirstChild(v62.Name).Reload:FindFirstChild("Speed") then
                        v62.Anims.reload:AdjustSpeed(script.Guns:FindFirstChild(v62.Name).Reload:FindFirstChild("Speed").Value);
                    end;
                    l_v63_0 = game["Run Service"].Heartbeat:Connect(function() --[[ Line: 278 ]]
                        -- upvalues: v5 (ref), v62 (copy), l_v63_0 (ref)
                        if _G.check:inspect(v5) == false or v5:FindFirstChild(v62.Name .. "Gun") == nil then
                            v62.Anims.reload:Stop();
                            l_v63_0:Disconnect();
                            l_v63_0 = nil;
                        end;
                    end);
                else
                    v46[v5][v62.Name]:Reload(v5, v62.Name, v62);
                end;
                local v65 = game:GetService("HttpService"):GenerateGUID(true);
                v62.EqId = v65;
                local v66 = v3.gunFunctions:InvokeServer("reload", {
                    Gun = v62.Name
                });
                if l_v63_0 then
                    l_v63_0:Disconnect();
                    l_v63_0 = nil;
                end;
                v62.Ready = true;
                if v62.Equiped == true and v65 == v62.EqId then
                    if v62.StartRev ~= nil then
                        v62.StartRev = nil;
                    end;
                    v62.Reloaded = v66;
                end;
            end;
        end;
        return;
    end;
end;
if game["Run Service"]:IsClient() then
    v3.OnClientEvent:Connect(function(v67, v68, v69) --[[ Line: 308 ]]
        if v67 == game.Players.LocalPlayer then
            return;
        else
            if v68 == "velocity" then
                v69.m.MaxVelocity = v69.val;
            end;
            return;
        end;
    end);
    game["Run Service"].Heartbeat:Connect(function() --[[ Line: 317 ]]
        -- upvalues: v15 (ref)
        for v70, v71 in v15 do
            if v70 == nil or v70.Parent == nil then
                for v72 = 1, #v71 do
                    local v73 = v71[v72];
                    if v73 then
                        v73:term();
                    end;
                end;
                v15[v70] = nil;
            end;
        end;
    end);
end;
return v0;