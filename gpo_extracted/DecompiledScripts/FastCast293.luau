local v0 = {};
local v1 = require(game.ReplicatedStorage.Modules.FastCastRedux).new();
v1.IgnoreDescendantsInstance = {
    workspace.Effects, 
    game.Players.LocalPlayer.Character, 
    workspace.CurrentCamera
};
warn("\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\tCASTED \t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t");
local v2 = {};
local v3 = {};
setmetatable(v3, {
    __mode = "k"
});
setmetatable(v2, {
    __mode = "k"
});
local v4 = require(game.ReplicatedStorage.Modules.MaidClass);
local v5 = {};
local _ = _G.getHumanoid;
local function _(v7) --[[ Line: 17 ]] --[[ Name: checkreflect ]]
    if v7 == nil then
        return false;
    elseif v7.Parent:FindFirstChild("Reflecting") then
        return true;
    else
        return false;
    end;
end;
local _ = function(v9, v10) --[[ Line: 28 ]] --[[ Name: isRight ]]
    local _, _, _, v14, _, _, v17, _, _, v20, _, _ = v9:components();
    local v23 = v14 * v10.x + v17 * v10.y + v20 * v10.z;
    if v23 < 0 then
        return -1;
    elseif v23 > 0 then
        return 1;
    else
        return 0;
    end;
end;
local v25 = {};
local function v29(v26) --[[ Line: 44 ]] --[[ Name: getFireModule ]]
    -- upvalues: v25 (copy)
    if game["Run Service"]:IsStudio() == false and v25[v26] then
        return v25[v26];
    else
        local l_Descendants_0 = script.FireEffects:GetDescendants();
        for v28 = 1, #l_Descendants_0 do
            if l_Descendants_0[v28].Name == v26 and l_Descendants_0[v28]:IsA("ModuleScript") then
                v25[l_Descendants_0[v28].Name] = l_Descendants_0[v28];
                return l_Descendants_0[v28];
            end;
        end;
        return;
    end;
end;
local function _(v30) --[[ Line: 59 ]] --[[ Name: cleanBullet ]]
    -- upvalues: v5 (copy), v2 (copy), v3 (copy)
    v5[v30]:Destroy();
    v5[v30] = nil;
    v2[v30] = nil;
    v3[v30] = nil;
    pcall(function() --[[ Line: 64 ]]

    end);
end;
local function v75(v32, v33, v34, _, v36, _) --[[ Line: 69 ]] --[[ Name: onhit ]]
    -- upvalues: v3 (copy), v2 (copy), v29 (copy), v5 (copy), v1 (copy)
    local v38 = false;
    local v39 = false;
    local v40 = false;
    local v41 = v3[v36];
    if v41 == nil then
        return;
    else
        local _ = v41.ply;
        local v43 = nil;
        if v32 then
            v43 = _G.getHumanoid(v32);
        end;
        local l_canReflect_0 = v41.canReflect;
        local v45 = _G.checkPartIsBarrierFruit(v32);
        if l_canReflect_0 == true and v41.perfectReflect == true and v32 and v45 == false then
            l_canReflect_0 = false;
            if v43 then
                local l_Blocking_0 = v43.Parent:FindFirstChild("Blocking");
                if l_Blocking_0 then
                    local l_Value_0 = l_Blocking_0.BlockTime.Value;
                    if _G.tick - l_Value_0 <= 0.2 then
                        l_canReflect_0 = true;
                    end;
                end;
            end;
        end;
        if v32 then
            if v2[v36] ~= true and l_canReflect_0 ~= false then
                if l_canReflect_0 == true then
                    local l_v43_0 = v43;
                    v38 = (l_v43_0 ~= nil and (l_v43_0.Parent:FindFirstChild("Reflecting") and true or false)) ~= false;
                else
                    v38 = true;
                end;
            end;
            if not v38 then
                if not v38 then
                    if v45 == false then
                        if v36 and v36.Parent ~= nil then
                            local v49 = v29(v36.Name);
                            if v49 then
                                local v50 = require(v49);
                                pcall(function() --[[ Line: 104 ]]
                                    -- upvalues: v33 (copy), v50 (copy), v36 (copy), v32 (copy), v34 (copy), v41 (ref)
                                    if _G.checkRenderDistance(v33) == true then
                                        v50.impact(v36, v32, v33, v34, v41);
                                    end;
                                end);
                            end;
                        end;
                        v41 = nil;
                        v5[v36]:Destroy();
                        v5[v36] = nil;
                        v2[v36] = nil;
                        v3[v36] = nil;
                        pcall(function() --[[ Line: 64 ]]

                        end);
                        v39 = true;
                    end;
                end;
            end;
        end;
        if not v39 then
            v38 = false;
            if v32 then
                if v43 and l_canReflect_0 == true then
                    local l_v43_1 = v43;
                    v40 = (l_v43_1 ~= nil and (l_v43_1.Parent:FindFirstChild("Reflecting") and true or false)) == true;
                end;
                if not v40 then
                    v39 = v45 ~= true;
                end;
                if v40 or not v39 then
                    v40 = false;
                    v2[v36] = true;
                    if v3[v36].reflectTimes == nil then
                        v3[v36].reflectTimes = 0;
                    end;
                    v3[v36].reflectTimes = v3[v36].reflectTimes + 1;
                    if v3[v36].reflectTimes > 25 then
                        v5[v36]:Destroy();
                        v5[v36] = nil;
                        v2[v36] = nil;
                        v3[v36] = nil;
                        pcall(function() --[[ Line: 64 ]]

                        end);
                        v36:Destroy();
                        return;
                    else
                        local v52 = CFrame.new(v33, v33 + v34);
                        local l_lookVector_0 = v52.lookVector;
                        local v54 = l_lookVector_0 - 2 * l_lookVector_0:Dot(v34) * v34;
                        v54 = Vector3.new(v54.X, -math.clamp(v54.Y, 0.1, 0.2), v54.Z);
                        if v32 and _G.checkPartIsBarrierFruit(v32) == true then
                            local v55 = Instance.new("Attachment", workspace.Terrain);
                            _G.destroy(v55, 2);
                            v55.WorldCFrame = CFrame.new(v33);
                            local v56 = script.BarrierHits["forcefieldhit" .. math.random(1, 4)]:Clone();
                            v56.Parent = v55;
                            v56:Play();
                        end;
                        v36.CFrame = v52;
                        pcall(function() --[[ Line: 140 ]]
                            -- upvalues: v36 (copy), v52 (copy), v3 (ref)
                            v36.CFrame = v52 * v3[v36].offset;
                        end);
                        local v57 = {
                            workspace.Effects, 
                            workspace.CurrentCamera, 
                            v41.char
                        };
                        if v43 then
                            table.insert(v57, v43.Parent);
                        end;
                        if v36:FindFirstChild("reflected") == nil then
                            Instance.new("BoolValue", v36).Name = "reflected";
                        end;
                        v1:Fire(v3[v36].ply, v33, -v54 * 1000, v41.speed, v36, v57, true, v41.grav);
                        if game.Players.LocalPlayer == v41.ply then

                        end;
                        local v58 = script.Part.Attachment:Clone();
                        v58.Parent = workspace.Terrain;
                        v58.WorldPosition = v33;
                        _G.destroy(v58, 0.2);
                        v58.ParticleEmitter:Emit(1);
                        local v59 = script.SFX["S" .. math.random(1, 2)]:Clone();
                        v59.Parent = v36;
                        v59:Play();
                        if v36:FindFirstChild("OrgA") then
                            v36.OrgA.Value.WorldPosition = v33;
                        end;
                        if v43 and v43.Parent == game.Players.LocalPlayer.Character and v45 == false then
                            local _ = nil;
                            local _, _, _, v64, _, _, v67, _, _, v70, _, _ = v43.Parent.HumanoidRootPart.CFrame:components();
                            local v73 = v64 * l_lookVector_0.x + v67 * l_lookVector_0.y + v70 * l_lookVector_0.z;
                            local v74 = v73 < 0 and -1 or v73 > 0 and 1 or 0;
                            (if v74 == -1 then v43:LoadAnimation(script.Anims.R1) else if v74 == 1 then v43:LoadAnimation(script.Anims.R3) else v43:LoadAnimation(script.Anims.R2)):Play();
                        end;
                    end;
                end;
            end;
        end;
        v39 = false;
        return;
    end;
end;
updateRay = function(_, v77, v78, v79, v80, v81) --[[ Line: 186 ]] --[[ Name: updateRay ]]
    -- upvalues: v3 (copy), v5 (copy), v2 (copy), v29 (copy)
    local v82 = v3[v80];
    if v82 == nil then
        return;
    else
        local l_bulletLen_0 = v82.bulletLen;
        local v84 = CFrame.new(v77, v77 + v78) * CFrame.new(0, 0, -(v79 - l_bulletLen_0)) * v3[v80].offset;
        if v80 and v80.Parent and v80.Parent:IsA("Model") and v80.Parent.PrimaryPart ~= nil then
            v80.Parent:PivotTo(v84);
            v80 = v80.Parent.PrimaryPart;
        elseif v80 then
            v80.CFrame = v84;
        else
            local l_v80_0 = v80;
            v5[l_v80_0]:Destroy();
            v5[l_v80_0] = nil;
            v2[l_v80_0] = nil;
            v3[l_v80_0] = nil;
            pcall(function() --[[ Line: 64 ]]

            end);
            return;
        end;
        if v82.delta >= 10 then
            local l_v80_1 = v80;
            v5[l_v80_1]:Destroy();
            v5[l_v80_1] = nil;
            v2[l_v80_1] = nil;
            v3[l_v80_1] = nil;
            pcall(function() --[[ Line: 64 ]]

            end);
            return;
        else
            local v87 = v29(v80.Name);
            if v87 then
                v87 = require(v87);
            end;
            if v87 and v87.move ~= nil then
                pcall(function() --[[ Line: 215 ]]
                    -- upvalues: v87 (ref), v80 (ref), v84 (copy)
                    v87.move(v80, v84);
                end);
            end;
            local l_Y_0 = v80.Position.Y;
            local l_Y_1 = workspace.Env.WaterStuff.Ocean.Position.Y;
            local v90 = l_Y_0 - l_Y_1;
            if l_Y_0 <= l_Y_1 - 1 and v80:FindFirstChild("Splash") == nil and v90 < 5 and v90 > -10 and v80:FindFirstChild("FinishHit") == nil and v87 then
                local l_BoolValue_0 = Instance.new("BoolValue");
                l_BoolValue_0.Name = "Splash";
                l_BoolValue_0.Parent = v80;
                pcall(function() --[[ Line: 231 ]]
                    -- upvalues: v87 (ref), v80 (ref)
                    v87.splash(v80, v80.CFrame);
                end);
                if v82.splashRemove ~= nil then
                    pcall(function() --[[ Line: 236 ]]
                        -- upvalues: v80 (ref), v87 (ref), v84 (copy), v82 (copy)
                        Instance.new("BoolValue", v80).Name = "FinishHit";
                        v87.impact(v80, v80, v84.p, Vector3.new(0, 0, 0, 0), v82);
                    end);
                end;
            end;
            local _ = game.Players.LocalPlayer.Character;
            v82.delta = v82.delta + v81;
            return;
        end;
    end;
end;
v0.start = function(_, v94, v95, v96, v97, v98, _, v100) --[[ Line: 261 ]] --[[ Name: start ]]
    -- upvalues: v3 (copy), v5 (copy), v4 (copy), v29 (copy), v1 (copy)
    if v94 and _G.tick and _G.tick - v94 >= 1 then
        return;
    elseif (workspace.CurrentCamera.CFrame.Position - v95.startpos).magnitude > v95.maxdistance + 500 then
        return;
    else
        if v97 == nil then
            v97 = {};
        end;
        local l_startpos_0 = v95.startpos;
        local l_bullet_0 = v95.bullet;
        local v103 = v95.direction * v95.maxdistance;
        local l_speed_0 = v95.speed;
        if v95.ply == nil then
            return;
        else
            if game.ReplicatedStorage.FCProjectiles:FindFirstChild(l_bullet_0) then
                local l_Model_0 = Instance.new("Model");
                l_Model_0.Name = "gun";
                local v106 = game.ReplicatedStorage.FCProjectiles:FindFirstChild(l_bullet_0):Clone();
                if v106:IsA("Model") and v106.PrimaryPart ~= nil then
                    v106.PrimaryPart.Anchored = true;
                end;
                v106.Parent = l_Model_0;
                l_Model_0.Parent = workspace.Projectiles;
                if workspace.Projectiles:FindFirstChild(v95.ply.Name) then
                    l_Model_0.Parent = workspace.Projectiles:FindFirstChild(v95.ply.Name);
                end;
                if v98 == nil then
                    v98 = CFrame.Angles(1.5707963267948966, 0, 0);
                end;
                if v106:IsA("BasePart") then
                    v106.CFrame = CFrame.new(l_startpos_0, l_startpos_0 + v103.Unit) * v98;
                else
                    v106:PivotTo(CFrame.new(l_startpos_0, l_startpos_0 + v103.Unit) * v98);
                    table.insert(v97, v106);
                    v106 = v106.PrimaryPart;
                end;
                local l_Vector3Value_0 = Instance.new("Vector3Value");
                l_Vector3Value_0.Name = "org";
                l_Vector3Value_0.Value = l_startpos_0;
                l_Vector3Value_0.Parent = v106;
                v95.offset = v98;
                v3[v106] = v95;
                v5[v106] = v4.new();
                local v108 = {
                    workspace.Effects, 
                    workspace.CurrentCamera, 
                    v95.char, 
                    workspace.PlayerCharacters.KenHaki
                };
                if v97 then
                    for v109 = 1, #v97 do
                        table.insert(v108, v97[v109]);
                    end;
                end;
                if workspace.Projectiles:FindFirstChild(v95.ply.Name) then
                    l_Model_0.Parent = workspace.Projectiles:FindFirstChild(v95.ply.Name);
                    table.insert(v108, workspace.Projectiles:FindFirstChild(v95.ply.Name));
                end;
                if v95.ply.Parent == workspace.NPCs or v95.ply.Parent == workspace.Ships.NPC then
                    l_Model_0.Parent = workspace.Projectiles.NPC;
                    table.insert(v108, workspace.Projectiles.NPC);
                    table.insert(v108, workspace.NPCs);
                end;
                local v110 = false;
                if v95.ply and (v95.ply:IsA("Player") and v95.ply.Character:FindFirstChild("BusoMelee") or v95.ply:FindFirstChild("BusoMelee")) or v95.buso == true then
                    v110 = true;
                end;
                if v110 == true then
                    Instance.new("BoolValue", v106).Name = "Buso";
                else
                    local l_Children_0 = workspace.PlayerCharacters:GetChildren();
                    for v112 = 1, #l_Children_0 do
                        if l_Children_0[v112]:FindFirstChild("Logia") then
                            table.insert(v108, l_Children_0[v112]);
                        end;
                    end;
                end;
                local v113 = v29(v106.Name);
                do
                    local l_v106_0, l_v113_0 = v106, v113;
                    if l_v113_0 then
                        l_v113_0 = require(l_v113_0);
                        pcall(function() --[[ Line: 353 ]]
                            -- upvalues: l_v113_0 (ref), v96 (copy), l_v106_0 (ref)
                            l_v113_0:Fire(v96, l_v106_0, l_v106_0.CFrame);
                        end);
                    end;
                    local l_ply_1 = v95.ply;
                    pcall(function() --[[ Line: 358 ]]
                        -- upvalues: l_ply_1 (ref), v95 (copy)
                        l_ply_1 = v95.ply.Character;
                    end);
                    if v95.regionBox ~= nil then
                        Instance.new("BoolValue", l_v106_0).Name = "regionBox";
                    end;
                    v95.bulletLen = l_v106_0.Size.Z / 2;
                    v1:Fire(l_ply_1, l_startpos_0, v103, l_speed_0, l_v106_0, v108, true, v95.grav, l_Model_0, v100);
                end;
            end;
            return;
        end;
    end;
end;
v1.LengthChanged:Connect(updateRay);
v1.RayHit:Connect(v75);
return v0;