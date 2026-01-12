local v0 = game:GetService("RunService"):IsClient();
local v1 = {};
local v2 = require(game.ReplicatedStorage.Modules.MaidClass);
local v3 = require(game.ReplicatedStorage.Modules.RotatedRegion3);
local _ = game:GetService("HttpService");
local _ = v2.new();
v1.__index = v1;
local _ = Ray.new;
local l_RunService_0 = game:GetService("RunService");
local l_Signal_0 = require(script:WaitForChild("Signal"));
local _ = {};
local function _(v10, v11, v12, v13) --[[ Line: 69 ]] --[[ Name: MandateType ]]
    if v13 and v10 == nil then
        return;
    else
        assert(typeof(v10) == v11, ("Invalid type for parameter '%s' (Expected %s, got %s)"):format(v12 or "ERR_NO_PARAM_NAME", v11, (typeof(v10))));
        return;
    end;
end;
local function v19(v15, v16, v17, _) --[[ Line: 78 ]] --[[ Name: Cast ]]
    return _G.raycast:cast(v15, v16, v17, "Ignore");
end;
local function v24(v20, v21, v22, _) --[[ Line: 84 ]] --[[ Name: CastWithWhitelist ]]
    if not v22 or typeof(v22) ~= "table" then
        error("Call in CastWhitelist failed! Whitelist table is either nil, or is not actually a table.", 0);
    end;
    return _G.raycast:cast(v20, v21, v22);
end;
local function v29(v25, v26, v27, _) --[[ Line: 96 ]] --[[ Name: CastWithBlacklist ]]
    if not v27 or typeof(v27) ~= "table" then
        error("Call in CastBlacklist failed! Blacklist table is either nil, or is not actually a table.", 0);
    end;
    return _G.raycast:cast(v25, v26, v27, "Ignore");
end;
local l_new_1 = Vector3.new;
local function _(v31, v32, v33, v34) --[[ Line: 110 ]] --[[ Name: GetPositionAtTime ]]
    -- upvalues: l_new_1 (copy)
    local v35 = l_new_1(v34.X * v31 ^ 2 / 2, v34.Y * v31 ^ 2 / 2, v34.Z * v31 ^ 2 / 2);
    return v32 + v33 * v31 + v35;
end;
local v37 = {};
local v38 = {};
local _ = {};
local _ = function(v40, v41, v42, _, v44) --[[ Line: 118 ]] --[[ Name: remove ]]
    -- upvalues: v37 (copy), v38 (copy)
    if v42 == nil then
        v42 = 0.1;
    end;
    if v37[v41] then
        v37[v41] = nil;
    end;
    if v38[v41] then
        v38[v41] = nil;
    end;
    if v40 then
        v40:Disconnect();
        v40 = nil;
    end;
    if v41 and v44 then
        _G.destroy(v41, v42);
    end;
    v41 = nil;
end;
v1.GetBullet = function(_, v47) --[[ Line: 145 ]] --[[ Name: GetBullet ]]
    -- upvalues: v37 (copy), v38 (copy)
    return v37[v38[v47]];
end;
local v48 = nil;
local l_CollectionService_0 = game:GetService("CollectionService");
if game["Run Service"]:IsClient() == false then
    v48 = require(game.ServerScriptService.DamageHandler.Logia);
else
    script.RemoteEvent.OnClientEvent:Connect(function(v50, v51) --[[ Line: 155 ]]
        -- upvalues: v37 (copy), v38 (copy)
        if v37[v38[v50]] then
            v37[v38[v50]](v51);
        end;
    end);
end;
local v52 = nil;
v52 = if v0 then l_RunService_0.Stepped else l_RunService_0.Heartbeat;
v52 = l_RunService_0.Heartbeat;
local _ = function(v53, v54, _) --[[ Line: 170 ]] --[[ Name: getinregion ]]
    -- upvalues: v3 (copy)
    local v56 = v3.new(v53.CFrame, v53.Size);
    local v57 = {
        workspace.Islands, 
        workspace.Env, 
        workspace.Ships
    };
    local l_Children_0 = workspace.PlayerCharacters:GetChildren();
    for v59 = 1, #l_Children_0 do
        if l_Children_0[v59] ~= v54 then
            table.insert(v57, l_Children_0[v59]);
        end;
    end;
    if v54.Parent == workspace.PlayerCharacters then
        table.insert(v57, workspace.NPCs);
    end;
    return (v56:FindPartsInRegion3WithWhiteList(v57, 1));
end;
local function v122(_, v62, v63, v64, v65, v66, v67, v68, v69, v70, v71, v72, v73) --[[ Line: 186 ]] --[[ Name: SimulateCast ]]
    -- upvalues: v52 (ref), v0 (copy), v37 (copy), v38 (copy), l_new_1 (copy), l_CollectionService_0 (copy), v48 (ref)
    if type(v64) == "number" then
        v64 = v63.Unit * v64;
    end;
    local v74 = v71 or Vector3.new();
    local v75 = 0;
    local v76 = 0;
    local l_v62_0 = v62;
    local v78 = {};
    local v79 = nil;
    local v80 = tick();
    local l_magnitude_0 = v64.magnitude;
    v68.Anchored = true;
    v79 = v52:Connect(function(v82) --[[ Line: 201 ]]
        -- upvalues: v75 (ref), v0 (ref), v80 (ref), v79 (ref), v72 (copy), v73 (copy), v37 (ref), v38 (ref), v68 (copy), v63 (ref), v64 (ref), l_magnitude_0 (copy), v62 (ref), l_v62_0 (ref), v76 (ref), v74 (copy), l_new_1 (ref), v65 (copy), v69 (copy), v70 (copy), v78 (copy), l_CollectionService_0 (ref), v48 (ref), v67 (copy), v66 (copy)
        if v82 <= 0 then
            return;
        else
            v75 = v75 + v82;
            if v0 == true then
                if tick() - v80 >= 1 then
                    v80 = tick();
                    local l_v79_0 = v79;
                    local l_v72_0 = v72;
                    local v85 = nil;
                    local _ = v73;
                    if v85 == nil then
                        v85 = 0.1;
                    end;
                    if v37[l_v72_0] then
                        v37[l_v72_0] = nil;
                    end;
                    if v38[l_v72_0] then
                        v38[l_v72_0] = nil;
                    end;
                    if l_v79_0 then
                        l_v79_0:Disconnect();
                        l_v79_0 = nil;
                    end;
                    if l_v72_0 then
                        _G.destroy(l_v72_0, v85);
                    end;
                    l_v72_0 = nil;
                    v79:Disconnect();
                    v79 = nil;
                    return;
                else
                    v80 = tick();
                end;
            end;
            if v68:IsDescendantOf(game) == false then
                v79:Disconnect();
                local l_v79_1 = v79;
                local l_v72_1 = v72;
                local v89 = nil;
                local _ = v73;
                if v89 == nil then
                    v89 = 0.1;
                end;
                if v37[l_v72_1] then
                    v37[l_v72_1] = nil;
                end;
                if v38[l_v72_1] then
                    v38[l_v72_1] = nil;
                end;
                if l_v79_1 then
                    l_v79_1:Disconnect();
                    l_v79_1 = nil;
                end;
                if l_v72_1 then
                    _G.destroy(l_v72_1, v89);
                end;
                l_v72_1 = nil;
                v79 = nil;
                return;
            else
                if v68 and v68.Parent ~= nil and v68:FindFirstChild("tenseiSucked") and v68:FindFirstChild("tenseiSucked").Value ~= nil then
                    v63 = (v68:FindFirstChild("tenseiSucked").Value.Position - v68.Position).Unit * 200;
                    v64 = v63.Unit * l_magnitude_0;
                    v62 = v68.CFrame.p;
                    l_v62_0 = v68.CFrame.p;
                    v75 = 0;
                    v76 = 0;
                    v68:FindFirstChild("tenseiSucked").Value = nil;
                end;
                local l_Magnitude_0 = v63.Magnitude;
                local v92 = (v63.Unit + v64).Unit * v64.Magnitude;
                local l_v75_0 = v75;
                local l_v62_1 = v62;
                local l_v74_0 = v74;
                local v96 = l_new_1(l_v74_0.X * l_v75_0 ^ 2 / 2, l_v74_0.Y * l_v75_0 ^ 2 / 2, l_v74_0.Z * l_v75_0 ^ 2 / 2);
                local v97 = l_v62_1 + v92 * l_v75_0 + v96;
                l_v75_0 = v97 - l_v62_0;
                l_v62_1 = l_v75_0.Unit * v64.Magnitude * v82;
                local v98, v99;
                l_v74_0, v96, v98, v99 = v65(l_v62_0, l_v62_1, v69, v70);
                if l_v74_0 == nil then
                    local v100 = nil;
                    v100 = if v68:IsA("Model") then v68:GetModelSize() else v68.Size;
                    if v100 then
                        local v101 = RaycastParams.new();
                        v101.FilterDescendantsInstances = v69;
                        v101.FilterType = Enum.RaycastFilterType.Exclude;
                        local v102 = true;
                        if l_v62_1.Magnitude ~= l_v62_1.Magnitude or l_v62_1.Magnitude == 1e999 or l_v62_1.Magnitude == -1e999 then
                            v102 = false;
                        end;
                        if v100.X ~= v100.X or v100.X == 1e999 or v100.X == -1e999 then
                            v102 = false;
                        end;
                        if v102 == true then
                            local v103 = workspace:Spherecast(CFrame.new(l_v62_0, l_v62_1).Position, (v100 * 0.4).X, l_v62_1, v101);
                            if v103 and v103.Instance then
                                l_v74_0 = v103.Instance;
                                v96 = v103.Position;
                                v98 = v103.Normal;
                            end;
                        end;
                    end;
                end;
                if l_v74_0 and l_v74_0 ~= v68 and v68:FindFirstChild("FinishHit") == nil then
                    local v104 = _G.getHumanoid(l_v74_0);
                    if v104 ~= nil and v104.Parent:FindFirstChild("KenHaki") and v104.Parent:findFirstChild("SafeFF") == nil then
                        if v0 == true and v104.Parent == game.Players.LocalPlayer.Character then
                            v104:LoadAnimation(script.Dodge["D" .. math.random(1, 4)]):Play();
                        elseif v0 == false and v78[v104.Parent] == nil then
                            v78[v104.Parent] = true;
                            require(game.ServerScriptService.DamageHandler):KenDodge(v104.Parent, false);
                            return;
                        end;
                    end;
                    if l_CollectionService_0:HasTag(v68, "BulletLogia") == false then
                        if v104 == nil or v104 then
                            if v48 and v104 and v104.Parent:GetAttribute("ToriLoaded") == nil and v104.Parent:FindFirstChild("Logia") ~= nil and v68:FindFirstChild("Buso") == nil and v48:apply(v104.Parent, l_v74_0) == true then
                                l_CollectionService_0:AddTag(v68, "BulletLogia");
                                return;
                            else
                                pcall(function() --[[ Line: 314 ]]
                                    -- upvalues: v67 (ref), l_v74_0 (ref), v96 (ref), v98 (ref), v99 (copy), v68 (ref)
                                    v67:Fire(l_v74_0, v96, v98, v99, v68);
                                end);
                                local l_v79_2 = v79;
                                local l_v72_2 = v72;
                                local v107 = 5;
                                local _ = v73;
                                if v107 == nil then
                                    v107 = 0.1;
                                end;
                                if v37[l_v72_2] then
                                    v37[l_v72_2] = nil;
                                end;
                                if v38[l_v72_2] then
                                    v38[l_v72_2] = nil;
                                end;
                                if l_v79_2 then
                                    l_v79_2:Disconnect();
                                    l_v79_2 = nil;
                                end;
                                if l_v72_2 then
                                    _G.destroy(l_v72_2, v107);
                                end;
                                l_v72_2 = nil;
                                return;
                            end;
                        elseif v48 and v68:FindFirstChild("Buso") == nil and v104.Parent:GetAttribute("ToriLoaded") == nil and v48:apply(v104.Parent, l_v74_0) == true then
                            l_CollectionService_0:AddTag(v68, "BulletLogia");
                            return;
                        end;
                    end;
                    Instance.new("BoolValue", v68).Name = "FinishHit";
                elseif v68:FindFirstChild("FinishHit") then
                    local l_v79_3 = v79;
                    local l_v72_3 = v72;
                    local v111 = 5;
                    local _ = v73;
                    if v111 == nil then
                        v111 = 0.1;
                    end;
                    if v37[l_v72_3] then
                        v37[l_v72_3] = nil;
                    end;
                    if v38[l_v72_3] then
                        v38[l_v72_3] = nil;
                    end;
                    if l_v79_3 then
                        l_v79_3:Disconnect();
                        l_v79_3 = nil;
                    end;
                    if l_v72_3 then
                        _G.destroy(l_v72_3, v111);
                    end;
                    l_v72_3 = nil;
                    return;
                end;
                if v0 then
                    local v113 = l_Magnitude_0 * 10 + 500;
                    if v113 < (workspace.CurrentCamera.CFrame.Position - l_v62_0).magnitude and v113 < (workspace.CurrentCamera.CFrame.Position - v62).magnitude then
                        local l_v79_4 = v79;
                        local l_v72_4 = v72;
                        local v116 = nil;
                        local _ = v73;
                        if v116 == nil then
                            v116 = 0.1;
                        end;
                        if v37[l_v72_4] then
                            v37[l_v72_4] = nil;
                        end;
                        if v38[l_v72_4] then
                            v38[l_v72_4] = nil;
                        end;
                        if l_v79_4 then
                            l_v79_4:Disconnect();
                            l_v79_4 = nil;
                        end;
                        if l_v72_4 then
                            _G.destroy(l_v72_4, v116);
                        end;
                        l_v72_4 = nil;
                        if v68 then
                            v68:Destroy();
                        end;
                        return;
                    end;
                end;
                if l_Magnitude_0 < v76 then
                    pcall(function() --[[ Line: 347 ]]
                        -- upvalues: v67 (ref), l_v62_0 (ref), v68 (ref), v79 (ref), v72 (ref), v73 (ref), v37 (ref), v38 (ref)
                        v67:Fire(nil, l_v62_0, nil, nil, v68);
                        v79:Disconnect();
                        local l_v79_5 = v79;
                        local l_v72_5 = v72;
                        local v120 = nil;
                        local _ = v73;
                        if v120 == nil then
                            v120 = 0.1;
                        end;
                        if v37[l_v72_5] then
                            v37[l_v72_5] = nil;
                        end;
                        if v38[l_v72_5] then
                            v38[l_v72_5] = nil;
                        end;
                        if l_v79_5 then
                            l_v79_5:Disconnect();
                            l_v79_5 = nil;
                        end;
                        if l_v72_5 then
                            _G.destroy(l_v72_5, v120);
                        end;
                        l_v72_5 = nil;
                    end);
                    if v68 then
                        v68:Destroy();
                    end;
                    return;
                else
                    v66:Fire(v62, l_v62_0, l_v62_1.Unit, l_v75_0.Magnitude, v68, v82);
                    l_v62_0 = v97;
                    v76 = v76 + l_v75_0.Magnitude;
                    return;
                end;
            end;
        end;
    end);
end;
local function v138(v123, v124, v125, v126, v127, v128, v129, v130, v131, v132, v133, v134, v135) --[[ Line: 364 ]] --[[ Name: BaseFireMethod ]]
    -- upvalues: v19 (copy), v24 (copy), v29 (copy), v122 (copy)
    assert(typeof(v125) == "Vector3", ("Invalid type for parameter '%s' (Expected %s, got %s)"):format("origin", "Vector3", (typeof(v125))));
    assert(typeof(v126) == "Vector3", ("Invalid type for parameter '%s' (Expected %s, got %s)"):format("directionWithMagnitude", "Vector3", (typeof(v126))));
    local v136 = true;
    if typeof(v127) ~= "Vector3" then
        v136 = typeof(v127) == "number";
    end;
    assert(v136, ("Invalid type for parameter '%s' (Expected %s, got %s)"):format("velocity", "Variant<Vector3, number>", (typeof(v127))));
    if v128 ~= nil then
        assert(typeof(v128) == "Instance", ("Invalid type for parameter '%s' (Expected %s, got %s)"):format("cosmeticBulletObject", "Instance", (typeof(v128))));
    end;
    if v130 ~= nil then
        assert(typeof(v130) == "boolean", ("Invalid type for parameter '%s' (Expected %s, got %s)"):format("ignoreWater", "boolean", (typeof(v130))));
    end;
    if v131 ~= nil then
        assert(typeof(v131) == "Vector3", ("Invalid type for parameter '%s' (Expected %s, got %s)"):format("bulletAcceleration", "Vector3", (typeof(v131))));
    end;
    if v132 ~= nil then
        assert(typeof(v132) == "table", ("Invalid type for parameter '%s' (Expected %s, got %s)"):format("list", "table", (typeof(v132))));
    end;
    local l_v19_0 = v19;
    v136 = v129;
    if v132 ~= nil then
        v136 = v132;
        l_v19_0 = if v133 then v24 else v29;
    end;
    v122(v123, v125, v126, v127, l_v19_0, v124.LengthChanged, v124.RayHit, v128, v136, v130, v131, v134, v135);
end;
v1.new = function() --[[ Line: 395 ]] --[[ Name: new ]]
    -- upvalues: l_Signal_0 (copy), v1 (copy)
    return (setmetatable({
        LengthChanged = l_Signal_0:CreateNewSignal(), 
        RayHit = l_Signal_0:CreateNewSignal()
    }, v1));
end;
v1.Fire = function(v139, v140, v141, v142, v143, v144, v145, v146, v147, v148, v149) --[[ Line: 403 ]] --[[ Name: Fire ]]
    -- upvalues: v1 (copy), v138 (copy)
    assert(getmetatable(v139) == v1, ("Cannot statically invoke method '%s' - It is an instance method. Call it on an instance of this class created via %s"):format("Fire", "FastCast.new()"));
    v138(v140, v139, v141, v142, v143, v144, v145, v146, v147, nil, nil, v148, v149);
end;
v1.FireWithWhitelist = function(v150, v151, v152, v153, v154, v155, v156, v157, v158, v159, _) --[[ Line: 409 ]] --[[ Name: FireWithWhitelist ]]
    -- upvalues: v1 (copy), v138 (copy)
    assert(getmetatable(v150) == v1, ("Cannot statically invoke method '%s' - It is an instance method. Call it on an instance of this class created via %s"):format("FireWithWhitelist", "FastCast.new()"));
    v138(v151, v150, v152, v153, v154, v156, nil, v157, v158, v155, true, v159);
end;
v1.FireWithBlacklist = function(v161, v162, v163, v164, v165, v166, v167, v168, v169, v170, v171) --[[ Line: 415 ]] --[[ Name: FireWithBlacklist ]]
    -- upvalues: v1 (copy), v138 (copy)
    assert(getmetatable(v161) == v1, ("Cannot statically invoke method '%s' - It is an instance method. Call it on an instance of this class created via %s"):format("FireWithBlacklist", "FastCast.new()"));
    v138(v162, v161, v163, v164, v165, v167, nil, v168, v169, v166, false, v170, v171);
end;
return v1;