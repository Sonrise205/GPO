local v0 = {};
v0.__index = v0;
local function _(v1, v2) --[[ Line: 3 ]] --[[ Name: loadanims ]]
    if v2 then
        return v1:LoadAnimation(v2);
    else
        return nil;
    end;
end;
local function _(v4, v5) --[[ Line: 10 ]] --[[ Name: CheckArrayEquality ]]
    if #v4 ~= #v5 then
        return false;
    else
        for v6 = 1, #v4 do
            if v4[v6] ~= v5[v6] then
                return false;
            end;
        end;
        return true;
    end;
end;
v0.SetUp = function(v8) --[[ Line: 15 ]]
    -- upvalues: v0 (copy)
    local v9 = {};
    local v10 = require(v8.Parent.Info.Settings):Get();
    local l_Occupant_0 = v8.Occupant;
    if l_Occupant_0 == nil then
        return;
    else
        v9.orgInfo = v10;
        v9.MaxSpeed = v8.MaxSpeed;
        v9.Speed = 0;
        v9.TiltAngle = v10.TiltAngle;
        v9.RotateAngle = v10.Rotate;
        v9.WheelAngle = 1;
        v9.Driver = l_Occupant_0.Parent;
        v9.Accel = v10.Accl;
        v9.Brake = v10.Brake;
        v9.MainPart = v8.Parent.m;
        v9.Seat = v8;
        v9.GroundDeep = v10.Deep;
        v9.preFlag = 0;
        if v8.Parent:FindFirstChild("Wheel") then
            v9.wheel = v8.Parent.Wheel.Model.TriColor.Wheel;
        end;
        local v12 = {};
        local l_Children_0 = v8.Parent:GetChildren();
        for v14 = 1, #l_Children_0 do
            if l_Children_0[v14].Name == "Sail" then
                table.insert(v12, l_Children_0[v14]);
            end;
        end;
        v9.Sails = v12;
        v9.ShipType = v10.Type;
        setmetatable(v9, v0);
        local l_ShipWheel_0 = v10.ShipWheel;
        local v16 = nil;
        local v17 = nil;
        local v18 = nil;
        local v19 = nil;
        local v20 = nil;
        if l_ShipWheel_0 and script.ShipAnimations:FindFirstChild(l_ShipWheel_0) then
            v16 = script.ShipAnimations:FindFirstChild(l_ShipWheel_0):FindFirstChild("Idle");
            v17 = script.ShipAnimations:FindFirstChild(l_ShipWheel_0):FindFirstChild("Right");
            v18 = script.ShipAnimations:FindFirstChild(l_ShipWheel_0):FindFirstChild("Left");
            v19 = script.ShipAnimations:FindFirstChild(l_ShipWheel_0):FindFirstChild("Back");
            v20 = script.ShipAnimations:FindFirstChild(l_ShipWheel_0):FindFirstChild("Foward");
            local l_v16_0 = v16;
            v16 = if l_v16_0 then l_Occupant_0:LoadAnimation(l_v16_0) else nil;
            l_v16_0 = v17;
            v17 = if l_v16_0 then l_Occupant_0:LoadAnimation(l_v16_0) else nil;
            l_v16_0 = v18;
            v18 = if l_v16_0 then l_Occupant_0:LoadAnimation(l_v16_0) else nil;
            l_v16_0 = v19;
            v19 = if l_v16_0 then l_Occupant_0:LoadAnimation(l_v16_0) else nil;
            l_v16_0 = v20;
            v20 = if l_v16_0 then l_Occupant_0:LoadAnimation(l_v16_0) else nil;
            v9.Anims = {
                idle = v16, 
                right = v17, 
                left = v18, 
                back = v19, 
                front = v20
            };
            v9.Anims.idle:Play();
            v9.Anims.idle:AdjustWeight(2);
            for _, v23 in v9.Anims do
                if v23 ~= v9.Anims.idle then
                    v23:AdjustWeight(4);
                end;
            end;
        end;
        if script.ShipSpecs:FindFirstChild(v10.Type) then
            local v24 = require(script.ShipSpecs[v10.Type]);
            if v24.Foward ~= nil and game["Run Service"]:IsClient() == true then
                v9.customControls = v24:int(l_Occupant_0.Parent, v8.Parent);
            end;
        end;
        v9.LastGround = nil;
        v9.PlayAnimation = function(v25) --[[ Line: 88 ]]
            -- upvalues: v9 (copy)
            if v9.Anims ~= nil then
                for _, v27 in v9.Anims do
                    if v27 ~= v9.Anims.idle then
                        if v27 ~= v25 and v27.IsPlaying == true then
                            v27:Stop();
                        elseif v27 == v25 and v27.IsPlaying == false then
                            v27:Play();
                        end;
                    end;
                end;
            end;
        end;
        return v9;
    end;
end;
local function v32(v28, v29) --[[ Line: 106 ]] --[[ Name: decaltrans ]]
    local l_v28_Children_0 = v28:GetChildren();
    for v31 = 1, #l_v28_Children_0 do
        if l_v28_Children_0[v31]:IsA("Decal") then
            l_v28_Children_0[v31].Transparency = v29;
        end;
    end;
end;
v0.Flags = function(v33, v34) --[[ Line: 114 ]] --[[ Name: Flags ]]
    -- upvalues: v32 (copy)
    local l_Seat_0 = v33.Seat;
    if l_Seat_0.Parent:FindFirstChild("Sail") ~= nil and tick() - v33.preFlag >= 0.15 and l_Seat_0.Parent.Sail.Transparency ~= v34 then
        local l_Sails_0 = v33.Sails;
        for v37 = 1, #l_Sails_0 do
            if l_Sails_0[v37].Name == "Sail" then
                l_Sails_0[v37].Transparency = v34;
                if l_Sails_0[v37]:FindFirstChild("Flag") and v34 == 0 then
                    l_Sails_0[v37].Flag:Play();
                elseif l_Sails_0[v37]:FindFirstChild("Flag") then
                    l_Sails_0[v37].Flag:Stop();
                end;
                v32(l_Sails_0[v37], v34);
            end;
        end;
        v33.preFlag = tick();
        game.ReplicatedStorage.Events.ShipEvents.Flag:FireServer(l_Seat_0.Parent, v34);
    end;
end;
v0.ApplySpeed = function(v38) --[[ Line: 137 ]] --[[ Name: ApplySpeed ]]
    if v38.done ~= nil then
        return;
    else
        local l_Seat_1 = v38.Seat;
        local l_Parent_0 = l_Seat_1.Parent;
        if v38.Speed >= v38.MaxSpeed then
            v38.Speed = v38.MaxSpeed;
        end;
        local v41 = Ray.new(l_Parent_0.Bottom.Position, (Vector3.new(0, -v38.GroundDeep, 0)));
        local v42, _ = _G.raycastIgnoreList(v41, {
            workspace.Ragdolls, 
            v38.Seat.Parent, 
            workspace.Effects, 
            workspace.Projectiles, 
            workspace.PlayerCharacters, 
            workspace.CurrentCamera, 
            workspace.Env, 
            workspace.NPCs
        });
        if v42 and l_Seat_1.Occupant then
            if v38.Speed > 0 and l_Seat_1.Throttle == 1 then
                v38.Speed = 4;
            elseif v38.Speed < 0 then
                v38.Speed = 0;
            elseif v38.Speed == 0 then
                v38.Speed = 0;
            end;
            l_Parent_0.Bottom.ParticleEmitter.Color = ColorSequence.new(v42.Color);
            l_Parent_0.Bottom.ParticleEmitter.Enabled = true;
            if l_Parent_0.Bottom.SandSFX.IsPlaying == false then
                l_Parent_0.Bottom.SandSFX:Play();
            end;
            game.ReplicatedStorage.Events.ShipEvents.Rough:FireServer(l_Parent_0, true, l_Parent_0.Bottom.Position);
        elseif v42 == nil and l_Parent_0.Bottom.SandSFX.IsPlaying == true then
            l_Parent_0.Bottom.SandSFX:Stop();
            l_Parent_0.Bottom.ParticleEmitter.Enabled = false;
            game.ReplicatedStorage.Events.ShipEvents.Rough:FireServer(l_Parent_0, false, l_Parent_0.Bottom.Position);
        end;
        local v44 = l_Parent_0.shipHP.Value / l_Parent_0.shipHP.MaxValue;
        if v44 >= 1 then
            v44 = 1;
        end;
        if _G.currentisland and _G.currentisland == "Rough Waters" then
            v44 = v44 * 0.6;
        end;
        v38.MainPart.BodyVelocity.Velocity = l_Seat_1.CFrame.lookVector * (v38.Speed * v44);
        return;
    end;
end;
v0.Foward = function(v45) --[[ Line: 177 ]] --[[ Name: Foward ]]
    local v46 = false;
    if v45.done ~= nil then
        return;
    else
        local l_Seat_2 = v45.Seat;
        local l_WaterSFX_0 = l_Seat_2.Parent.MainPart.Value.WaterSFX;
        v45.Speed = v45.Speed + _G.ScaleWithFPS(v45.Accel);
        local l_orgInfo_0 = v45.orgInfo;
        local v50 = require(l_Seat_2.Parent.Info.Settings):Get();
        local v51;
        if #l_orgInfo_0 ~= #v50 then
            v51 = false;
        else
            for v52 = 1, #l_orgInfo_0 do
                if l_orgInfo_0[v52] ~= v50[v52] then
                    v51 = false;
                    v46 = true;
                end;
                if v46 then
                    break;
                end;
            end;
            if not v46 then
                v51 = true;
            end;
        end;
        v46 = false;
        if v51 == false then
            l_Seat_2.Parent:Destroy();
        end;
        if v45.Anims and v45.Anims.front ~= nil then
            v45.PlayAnimation(v45.Anims.front);
            v45.Anims.front:AdjustSpeed(1 + v45.Speed / v45.MaxSpeed);
        end;
        v45:Flags(0);
        v45:ApplySpeed();
        if v45.customControls ~= nil and v45.customControls.Foward then
            v45.customControls:Foward(l_Seat_2.Parent);
        end;
        if v45.ShipType == "Hoverboard" then
            v51 = CFrame.new(l_Seat_2.Position);
            l_orgInfo_0 = Ray.new(v51.Position, v51.UpVector * -5);
            local v53;
            v50, v53 = _G.raycastWhitelist(l_orgInfo_0, {
                workspace.Islands, 
                workspace.Env
            });
            if v53.Y > workspace.Env.WaterStuff.Falls.Position.Y and l_WaterSFX_0.IsPlaying == true then
                game.ReplicatedStorage.Events.ShipEvents.sfx:FireServer(v45.Seat.Parent, l_WaterSFX_0, false);
                l_WaterSFX_0:Stop();
                return;
            elseif l_WaterSFX_0.IsPlaying == false then
                game.ReplicatedStorage.Events.ShipEvents.sfx:FireServer(v45.Seat.Parent, l_WaterSFX_0, true);
                l_WaterSFX_0:Play();
                return;
            end;
        elseif v45.ShipType ~= "Hoverboard" and l_WaterSFX_0.IsPlaying == false then
            game.ReplicatedStorage.Events.ShipEvents.sfx:FireServer(v45.Seat.Parent, l_WaterSFX_0, true);
            l_WaterSFX_0:Play();
        end;
        return;
    end;
end;
v0.Backward = function(v54) --[[ Line: 215 ]] --[[ Name: Backward ]]
    if v54.done ~= nil then
        return;
    else
        local l_Seat_3 = v54.Seat;
        local l_WaterSFX_1 = l_Seat_3.Parent.MainPart.Value.WaterSFX;
        v54.Speed = v54.Speed - _G.ScaleWithFPS(v54.Brake);
        if v54.Speed <= -v54.MaxSpeed / 2 then
            v54.Speed = -v54.MaxSpeed / 2;
        end;
        if l_WaterSFX_1.IsPlaying == true then
            game.ReplicatedStorage.Events.ShipEvents.sfx:FireServer(v54.Seat.Parent, l_WaterSFX_1, false);
            l_WaterSFX_1:Stop();
        end;
        if v54.Anims and v54.Anims.back ~= nil then
            v54.PlayAnimation(v54.Anims.back);
        end;
        v54:Flags(1);
        v54:ApplySpeed();
        if v54.customControls ~= nil and v54.customControls.Backward then
            v54.customControls:Backward(l_Seat_3.Parent);
        end;
        return;
    end;
end;
v0.Idle = function(v57) --[[ Line: 240 ]] --[[ Name: Idle ]]
    if v57.done ~= nil then
        return;
    else
        local l_Speed_0 = v57.Speed;
        local l_Seat_4 = v57.Seat;
        local l_WaterSFX_2 = l_Seat_4.Parent.MainPart.Value.WaterSFX;
        local _ = l_Seat_4.Parent.MainPart.Value.sway;
        if l_Speed_0 > 0 then
            v57.Speed = v57.Speed - _G.ScaleWithFPS(v57.Brake / 2);
            if v57.Speed <= 0 then
                v57.Speed = 0;
            end;
        elseif l_Speed_0 < 0 then
            v57.Speed = v57.Speed + _G.ScaleWithFPS(v57.Brake / 2);
            if v57.Speed >= 0 then
                v57.Speed = 0;
            end;
        end;
        if l_Seat_4.Steer == 0 and v57.Anims and v57.Anims.idle ~= nil then
            v57.PlayAnimation(v57.Anims.idle);
        end;
        if l_WaterSFX_2.IsPlaying == true then
            game.ReplicatedStorage.Events.ShipEvents.sfx:FireServer(v57.Seat.Parent, l_WaterSFX_2, false);
            l_WaterSFX_2:Stop();
        end;
        v57:Flags(1);
        v57:ApplySpeed();
        if v57.customControls ~= nil and v57.customControls.Idle then
            v57.customControls:Idle(l_Seat_4.Parent);
        end;
        return;
    end;
end;
v0.RightTurn = function(v62) --[[ Line: 278 ]] --[[ Name: RightTurn ]]
    if v62.done ~= nil then
        return;
    else
        local _ = v62.Seat;
        local l_tilt_0 = v62.MainPart.tilt;
        local l_TiltAngle_0 = v62.TiltAngle;
        local _ = v62.MainPart.BodyGyro;
        local l_wheel_0 = v62.wheel;
        l_tilt_0.DesiredAngle = l_TiltAngle_0;
        if v62.Anims and v62.Anims.right ~= nil then
            if v62.Anims.right.IsPlaying == false then
                v62.PlayAnimation(v62.Anims.right);
            end;
            if l_wheel_0 then
                l_wheel_0.DesiredAngle = -v62.WheelAngle;
                if l_wheel_0.CurrentAngle <= -v62.WheelAngle then
                    v62.Anims.right:AdjustSpeed(0);
                    return;
                else
                    v62.Anims.right:AdjustSpeed(1);
                end;
            end;
        end;
        return;
    end;
end;
v0.LeftTurn = function(v68) --[[ Line: 306 ]] --[[ Name: LeftTurn ]]
    if v68.done ~= nil then
        return;
    else
        local _ = v68.Seat;
        local l_tilt_1 = v68.MainPart.tilt;
        local l_TiltAngle_1 = v68.TiltAngle;
        local _ = v68.MainPart.BodyGyro;
        local l_wheel_1 = v68.wheel;
        l_tilt_1.DesiredAngle = -l_TiltAngle_1;
        if v68.Anims and v68.Anims.left ~= nil then
            if v68.Anims.left.IsPlaying == false then
                v68.PlayAnimation(v68.Anims.left);
            end;
            if l_wheel_1 then
                l_wheel_1.DesiredAngle = v68.WheelAngle;
                if l_wheel_1.CurrentAngle >= v68.WheelAngle then
                    v68.Anims.left:AdjustSpeed(0);
                    return;
                else
                    v68.Anims.left:AdjustSpeed(1);
                end;
            end;
        end;
        return;
    end;
end;
v0.NormalWheel = function(v74) --[[ Line: 333 ]] --[[ Name: NormalWheel ]]
    if v74.done ~= nil then
        return;
    else
        local _ = v74.Seat;
        local l_tilt_2 = v74.MainPart.tilt;
        local _ = v74.TiltAngle;
        local _ = v74.MainPart.BodyGyro;
        local l_wheel_2 = v74.wheel;
        l_tilt_2.DesiredAngle = 0;
        if l_wheel_2 then
            if l_wheel_2.Part0 ~= nil and v74.Anims and v74.Anims.idle ~= nil then
                v74.PlayAnimation(v74.Anims.idle);
            end;
            l_wheel_2.DesiredAngle = 0;
        end;
        return;
    end;
end;
v0.looped = function(v80) --[[ Line: 352 ]] --[[ Name: looped ]]
    if v80.customControls ~= nil and v80.customControls.looped ~= nil then
        v80.customControls:looped(v80.Seat.Parent);
    end;
end;
v0.End = function(v81) --[[ Line: 360 ]] --[[ Name: End ]]
    if v81.Anims ~= nil then
        for _, v83 in v81.Anims do
            v83:Stop();
            v83:Destroy();
        end;
        v81.done = true;
        if v81.MainPart and v81.MainPart:FindFirstChild("BodyVelocity") then
            v81.MainPart.BodyVelocity.Velocity = Vector3.new();
        end;
        v81.Speed = 0;
        pcall(function() --[[ Line: 372 ]]

        end);
        local l_WaterSFX_3 = v81.Seat.Parent.MainPart.Value.WaterSFX;
        game.ReplicatedStorage.Events.ShipEvents.sfx:FireServer(v81.Seat.Parent, l_WaterSFX_3, false);
        l_WaterSFX_3:Stop();
        v81:Flags(1);
        v81.Anims = nil;
    end;
    if v81.specs then
        v81.specs:End();
    end;
    if v81.customControls then
        v81.customControls:End();
        setmetatable(v81.customControls, nil);
        v81.customControls = nil;
    end;
    setmetatable(v81, nil);
    v81 = nil;
end;
return v0;