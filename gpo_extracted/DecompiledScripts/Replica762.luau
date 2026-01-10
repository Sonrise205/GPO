local l_ReplicaShared_0 = game.ReplicatedStorage.ReplicaShared;
local v1 = require(l_ReplicaShared_0.Remote);
local v2 = require(l_ReplicaShared_0.Signal);
local v3 = require(l_ReplicaShared_0.Maid);
local v4 = {};
local l_CollectionService_0 = game:GetService("CollectionService");
local _ = game:GetService("ReplicatedStorage");
local _ = game:GetService("Players");
local v8 = false;
local v9 = {};
local v10 = {};
local v11 = {};
local v12 = {};
local v13 = {};
local v14 = v1.New("ReplicaRequestData");
local v15 = v1.New("ReplicaSet");
local v16 = v1.New("ReplicaSetValues");
local v17 = v1.New("ReplicaTableInsert");
local v18 = v1.New("ReplicaTableRemove");
local v19 = v1.New("ReplicaWrite");
local v20 = v1.New("ReplicaSignal");
local v21 = v1.New("ReplicaParent");
local v22 = v1.New("ReplicaCreate");
local v23 = v1.New("ReplicaBind");
local v24 = v1.New("ReplicaDestroy");
local v25 = v1.New("ReplicaSignalUnreliable", true);
local v26 = {};
local v27 = false;
local function v39(v28) --[[ Line: 112 ]] --[[ Name: LoadWriteLib ]]
    -- upvalues: v26 (copy)
    local v29 = v26[v28];
    if v29 ~= nil then
        return v29;
    else
        local v30 = require(v28);
        local v31 = {};
        for v32, v33 in pairs(v30) do
            table.insert(v31, {
                v32, 
                v33
            });
        end;
        table.sort(v31, function(v34, v35) --[[ Line: 128 ]]
            return v34[1] < v35[1];
        end);
        v29 = {};
        for v36, v37 in ipairs(v31) do
            local v38 = {
                Name = v37[1], 
                Id = v36, 
                fn = v37[2]
            };
            v29[v37[1]] = v38;
            v29[v36] = v38;
        end;
        v26[v28] = v29;
        return v29;
    end;
end;
local v40 = nil;
local function v43(v41, ...) --[[ Line: 178 ]] --[[ Name: AcquireRunnerThreadAndCallEventHandler ]]
    -- upvalues: v40 (ref)
    local l_v40_0 = v40;
    v40 = nil;
    v41(...);
    v40 = l_v40_0;
end;
local function v44(...) --[[ Line: 186 ]] --[[ Name: RunEventHandlerInFreeThread ]]
    -- upvalues: v43 (copy)
    v43(...);
    while true do
        v43(coroutine.yield());
    end;
end;
local v45 = {
    IsReady = false, 
    OnLocalReady = v2.New()
};
v45.__index = v45;
local function v52(v46, v47) --[[ Line: 199 ]] --[[ Name: ReplicaNew ]]
    -- upvalues: v39 (copy), v11 (copy), v10 (copy), v2 (copy), v3 (copy), v4 (copy), v45 (copy)
    local v48 = nil;
    if v47[5] ~= nil then
        v48 = v39(v47[5]);
    end;
    local v49 = v47[1];
    local v50 = v11[v47[4]] or v10[v47[4]];
    local v51 = setmetatable({
        Tags = v47[2], 
        Data = v47[3], 
        Id = v46, 
        Token = v49, 
        Parent = v50, 
        Children = {}, 
        BoundInstance = nil, 
        OnClientEvent = v2.New(), 
        Maid = v3.New(v4), 
        self_creation = v47, 
        write_lib = v48, 
        set_listeners = {}, 
        write_listeners = {}, 
        changed_listeners = v2.New()
    }, v45);
    if v50 ~= nil then
        v50.Children[v51] = true;
    end;
    return v51;
end;
v45.RequestData = function() --[[ Line: 238 ]] --[[ Name: RequestData ]]
    -- upvalues: v8 (ref), v14 (copy), v45 (copy)
    if v8 == true then
        return;
    else
        v8 = true;
        task.spawn(function() --[[ Line: 246 ]]
            -- upvalues: v14 (ref), v45 (ref)
            v14:FireServer();
            while task.wait(2) and v45.IsReady ~= true do
                v14:FireServer();
            end;
        end);
        return;
    end;
end;
v45.OnNew = function(v53, v54) --[[ Line: 261 ]] --[[ Name: OnNew ]]
    -- upvalues: v13 (copy), v2 (copy), v9 (copy), v40 (ref), v44 (copy)
    if type(v53) ~= "string" then
        error((("[%*]: \"token\" must be a string"):format(script.Name)));
    end;
    local v55 = v13[v53];
    if v55 == nil then
        v55 = v2.New();
        v13[v53] = v55;
    end;
    local v56 = v9[v53];
    local v57 = v55:Connect(v54);
    if v56 ~= nil then
        local v58 = {};
        for v59 in pairs(v56) do
            v58[v59] = true;
        end;
        task.defer(function() --[[ Line: 285 ]]
            -- upvalues: v58 (copy), v57 (copy), v40 (ref), v44 (ref), v54 (copy)
            for v60 in pairs(v58) do
                if v57.IsConnected == true then
                    if not v40 then
                        v40 = coroutine.create(v44);
                    end;
                    task.spawn(v40, v54, v60);
                else
                    break;
                end;
            end;
        end);
    end;
    return v57;
end;
v45.FromId = function(v61) --[[ Line: 302 ]] --[[ Name: FromId ]]
    -- upvalues: v10 (copy)
    return v10[v61];
end;
v45.Test = function() --[[ Line: 306 ]] --[[ Name: Test ]]
    -- upvalues: v9 (copy), v10 (copy), v11 (copy), v12 (copy)
    return {
        TokenReplicas = v9, 
        Replicas = v10, 
        BindReplicas = v11, 
        BindInstances = v12
    };
end;
v45.OnSet = function(v62, v63, v64) --[[ Line: 315 ]] --[[ Name: OnSet ]]
    -- upvalues: v2 (copy)
    local v65 = table.concat(v63, ".");
    local v66 = v62.set_listeners[v65];
    if v66 == nil then
        v66 = v2.New();
        v62.set_listeners[v65] = v66;
    end;
    return v66:Connect(v64);
end;
v45.OnWrite = function(v67, v68, v69) --[[ Line: 326 ]] --[[ Name: OnWrite ]]
    -- upvalues: v2 (copy)
    local v70 = v67.write_listeners[v68];
    if v70 == nil then
        v70 = v2.New();
        v67.write_listeners[v68] = v70;
    end;
    return v70:Connect(v69);
end;
v45.OnChange = function(v71, v72) --[[ Line: 336 ]] --[[ Name: OnChange ]]
    return v71.changed_listeners:Connect(v72);
end;
v45.GetChild = function(v73, v74) --[[ Line: 340 ]] --[[ Name: GetChild ]]
    if type(v74) ~= "string" then
        error((("[%*]: \"token\" must be a string"):format(script.Name)));
    end;
    for v75 in pairs(v73.Children) do
        if v75.Token == v74 then
            return v75;
        end;
    end;
    return nil;
end;
v45.FireServer = function(v76, ...) --[[ Line: 352 ]] --[[ Name: FireServer ]]
    -- upvalues: v20 (copy)
    v20:FireServer(v76.Id, ...);
end;
v45.UFireServer = function(v77, ...) --[[ Line: 356 ]] --[[ Name: UFireServer ]]
    -- upvalues: v25 (copy)
    v25:FireServer(v77.Id, ...);
end;
v45.Identify = function(v78) --[[ Line: 360 ]] --[[ Name: Identify ]]
    local v79 = "";
    local v80 = true;
    for v81, v82 in pairs(v78.Tags) do
        v79 = v79 .. ("%*%*=%*"):format(v80 == true and "" or ";", tostring(v81), (tostring(v82)));
        v80 = false;
    end;
    return (("[Id:%*;Token:%*;Tags:[%*]]"):format(v78.Id, v78.Token, v79));
end;
v45.IsActive = function(v83) --[[ Line: 370 ]] --[[ Name: IsActive ]]
    return v83.Maid:IsActive();
end;
v45.Set = function(v84, v85, v86) --[[ Line: 374 ]] --[[ Name: Set ]]
    -- upvalues: v27 (ref)
    if v27 ~= true then
        error((("[%*]: \"Set()\" can't be called outside of WriteLibs client-side"):format(script.Name)));
    end;
    local l_Data_0 = v84.Data;
    for v88 = 1, #v85 - 1 do
        l_Data_0 = l_Data_0[v85[v88]];
    end;
    local v89 = v85[#v85];
    local v90 = l_Data_0[v89];
    l_Data_0[v89] = v86;
    if next(v84.set_listeners) ~= nil then
        local v91 = v84.set_listeners[table.concat(v85, ".")];
        if v91 ~= nil then
            v91:Fire(v86, v90);
        end;
    end;
    v84.changed_listeners:Fire("Set", v85, v86, v90);
end;
v45.SetValues = function(v92, v93, v94) --[[ Line: 402 ]] --[[ Name: SetValues ]]
    -- upvalues: v27 (ref)
    if v27 ~= true then
        error((("[%*]: \"SetValues()\" can't be called outside of WriteLibs client-side"):format(script.Name)));
    end;
    local l_Data_1 = v92.Data;
    for _, v97 in ipairs(v93) do
        l_Data_1 = l_Data_1[v97];
    end;
    for v98, v99 in pairs(v94) do
        l_Data_1[v98] = v99;
    end;
    v92.changed_listeners:Fire("SetValues", v93, v94);
end;
v45.TableInsert = function(v100, v101, v102, v103) --[[ Line: 424 ]] --[[ Name: TableInsert ]]
    -- upvalues: v27 (ref)
    if v27 ~= true then
        error((("[%*]: \"TableInsert()\" can't be called outside of WriteLibs client-side"):format(script.Name)));
    end;
    local l_Data_2 = v100.Data;
    for _, v106 in ipairs(v101) do
        l_Data_2 = l_Data_2[v106];
    end;
    if v103 ~= nil then
        table.insert(l_Data_2, v103, v102);
    else
        table.insert(l_Data_2, v102);
        v103 = #l_Data_2;
    end;
    v100.changed_listeners:Fire("TableInsert", v101, v102, v103);
    return v103;
end;
v45.TableRemove = function(v107, v108, v109) --[[ Line: 451 ]] --[[ Name: TableRemove ]]
    -- upvalues: v27 (ref)
    if v27 ~= true then
        error((("[%*]: \"TableRemove()\" can't be called outside of WriteLibs client-side"):format(script.Name)));
    end;
    local l_Data_3 = v107.Data;
    for _, v112 in ipairs(v108) do
        l_Data_3 = l_Data_3[v112];
    end;
    local v113 = table.remove(l_Data_3, v109);
    v107.changed_listeners:Fire("TableRemove", v108, v113, v109);
    return v113;
end;
v45.Write = function(v114, v115, ...) --[[ Line: 473 ]] --[[ Name: Write ]]
    -- upvalues: v27 (ref)
    if v27 ~= true then
        error((("[%*]: \"Write()\" can't be called outside of WriteLibs client-side"):format(script.Name)));
    end;
    local v116 = v114.write_lib[v115];
    local v117 = table.pack(v116.fn(v114, ...));
    local v118 = v114.write_listeners[v115];
    if v118 ~= nil then
        v118:Fire(...);
    end;
    return table.unpack(v117);
end;
local function v119(v120, v121) --[[ Line: 495 ]] --[[ Name: DestroyReplica ]]
    -- upvalues: v119 (copy), v9 (copy), v10 (copy), v11 (copy), v4 (copy)
    for v122 in pairs(v120.Children) do
        v119(v122, true);
    end;
    if v121 ~= true and v120.Parent ~= nil then
        v120.Parent.Children[v120] = nil;
    end;
    local l_Id_0 = v120.Id;
    local v124 = v9[v120.Token];
    if v124 ~= nil then
        v124[v120] = nil;
    end;
    if v10[l_Id_0] == v120 then
        v10[l_Id_0] = nil;
    end;
    if v11[l_Id_0] == v120 then
        v11[l_Id_0] = nil;
    end;
    v120.Maid:Unlock(v4);
    v120.Maid:Cleanup();
    v120.BoundInstance = nil;
end;
local function v125(v126, v127) --[[ Line: 527 ]] --[[ Name: ReplicaToBindBuffer ]]
    -- upvalues: v52 (copy), v11 (copy), v125 (copy), v119 (copy)
    local v128 = v52(v126.Id, v126.self_creation);
    v11[v126.Id] = v128;
    for v129 in pairs(v126.Children) do
        v125(v129, true);
    end;
    if v127 ~= true then
        v119(v126);
    end;
    return v128;
end;
local function v130(v131, v132) --[[ Line: 548 ]] --[[ Name: ReplicaFromBindBuffer ]]
    -- upvalues: v11 (copy), v9 (copy), v10 (copy), v130 (copy), v13 (copy)
    local v133 = false;
    if v132 == nil then
        v133 = true;
        v132 = {};
    end;
    v11[v131.Id] = nil;
    local l_Token_0 = v131.Token;
    local v135 = v9[l_Token_0];
    if v135 == nil then
        v135 = {};
        v9[l_Token_0] = v135;
    end;
    v135[v131] = true;
    v10[v131.Id] = v131;
    table.insert(v132, v131);
    for v136 in pairs(v131.Children) do
        v130(v136, v132);
    end;
    if v133 == true then
        for _, v138 in ipairs(v132) do
            local v139 = v13[v138.Token];
            if v139 ~= nil then
                v139:Fire(v138);
            end;
        end;
    end;
end;
local function v140(v141, v142, v143) --[[ Line: 587 ]] --[[ Name: CreationScan ]]
    -- upvalues: v140 (copy)
    local v144 = v141[v143];
    if v144 ~= nil then
        table.sort(v144, function(v145, v146) --[[ Line: 591 ]]
            return v145.Id < v146.Id;
        end);
        for _, v148 in ipairs(v144) do
            v142(v148.Id, v148.SelfCreation);
            v140(v141, v142, v148.Id);
        end;
    end;
end;
local function v180(v149, v150, v151) --[[ Line: 603 ]] --[[ Name: BreadthCreationSort ]]
    -- upvalues: v140 (copy)
    local v152 = {};
    local v153 = {};
    local v154 = {};
    if type(v149[1]) == "table" then
        for _, v156 in ipairs(v149) do
            for v157, v158 in pairs(v156) do
                local v159 = {
                    Id = tonumber(v157), 
                    SelfCreation = v158
                };
                local v160 = v158[4];
                if v160 == 0 or v159.Id == v150 then
                    table.insert(v152, v159);
                elseif v156[tostring(v160)] ~= nil then
                    local v161 = v153[v160];
                    if v161 == nil then
                        v161 = {};
                        v153[v160] = v161;
                    end;
                    table.insert(v161, v159);
                else
                    table.insert(v154, v159);
                end;
            end;
        end;
    else
        for v162, v163 in pairs(v149) do
            local v164 = {
                Id = tonumber(v162), 
                SelfCreation = v163
            };
            local v165 = v163[4];
            if v165 == 0 or v164.Id == v150 then
                table.insert(v152, v164);
            elseif v149[tostring(v165)] ~= nil then
                local v166 = v153[v165];
                if v166 == nil then
                    v166 = {};
                    v153[v165] = v166;
                end;
                table.insert(v166, v164);
            else
                table.insert(v154, v164);
            end;
        end;
    end;
    table.sort(v152, function(v167, v168) --[[ Line: 654 ]]
        return v167.Id < v168.Id;
    end);
    local v169 = {};
    for _, v171 in ipairs(v152) do
        v151(v171.Id, v171.SelfCreation);
        v140(v153, v151, v171.Id);
    end;
    if #v154 ~= 0 then
        local v172 = ("[%*]: GROUP REPLICATION ERROR - Missing parents for:\n"):format(script.Name);
        for v173 = 1, math.min(#v154, 50) do
            local v174 = v154[v173];
            local l_SelfCreation_0 = v174.SelfCreation;
            local v176 = "";
            local v177 = true;
            for v178, v179 in pairs(l_SelfCreation_0[2]) do
                v176 = v176 .. ("%*%*=%*"):format(v177 == true and "" or ";", tostring(v178), (tostring(v179)));
                v177 = false;
            end;
            v172 = v172 .. ("[Id:%*;ParentId:%*;Token:%*;Tags:[%*]]\n"):format(v174.Id, l_SelfCreation_0[4], l_SelfCreation_0[1], v176);
        end;
        if #v154 > 50 then
            v172 = v172 .. ("(hiding %* more)\n"):format(50 - #v154);
        end;
        v172 = v172 .. "Traceback:\n" .. debug.traceback();
        warn(v172);
    end;
    return v169;
end;
local function _(v181) --[[ Line: 695 ]] --[[ Name: GetInternalReplica ]]
    -- upvalues: v10 (copy), v11 (copy)
    local v182 = v10[v181] or v11[v181];
    if v182 == nil then
        error((("[%*]: Received update for missing replica [Id:%*]"):format(script.Name, v181)));
    end;
    return v182;
end;
v14.OnClientEvent:Connect(function() --[[ Line: 705 ]]
    -- upvalues: v45 (copy)
    if v45.IsReady == true then
        return;
    else
        v45.IsReady = true;
        print((("[%*]: Initial data received"):format(script.Name)));
        v45.OnLocalReady:Fire();
        return;
    end;
end);
v15.OnClientEvent:Connect(function(v184, v185, v186) --[[ Line: 717 ]]
    -- upvalues: v10 (copy), v11 (copy), v27 (ref)
    local v187 = v10[v184] or v11[v184];
    if v187 == nil then
        error((("[%*]: Received update for missing replica [Id:%*]"):format(script.Name, v184)));
    end;
    local l_v187_0 = v187;
    v27 = true;
    local v189;
    v187, v189 = pcall(l_v187_0.Set, l_v187_0, v185, v186);
    v27 = false;
    if v187 ~= true then
        error(("[%*]: Error while updating replica:\n%*\n"):format(script.Name, (l_v187_0:Identify())) .. v189);
    end;
end);
v16.OnClientEvent:Connect(function(v190, v191, v192) --[[ Line: 727 ]]
    -- upvalues: v10 (copy), v11 (copy), v27 (ref)
    local v193 = v10[v190] or v11[v190];
    if v193 == nil then
        error((("[%*]: Received update for missing replica [Id:%*]"):format(script.Name, v190)));
    end;
    local l_v193_0 = v193;
    v27 = true;
    local v195;
    v193, v195 = pcall(l_v193_0.SetValues, l_v193_0, v191, v192);
    v27 = false;
    if v193 ~= true then
        error(("[%*]: Error while updating replica:\n%*\n"):format(script.Name, (l_v193_0:Identify())) .. v195);
    end;
end);
v17.OnClientEvent:Connect(function(v196, v197, v198, v199) --[[ Line: 737 ]]
    -- upvalues: v10 (copy), v11 (copy), v27 (ref)
    local v200 = v10[v196] or v11[v196];
    if v200 == nil then
        error((("[%*]: Received update for missing replica [Id:%*]"):format(script.Name, v196)));
    end;
    local l_v200_0 = v200;
    v27 = true;
    local v202;
    v200, v202 = pcall(l_v200_0.TableInsert, l_v200_0, v197, v198, v199);
    v27 = false;
    if v200 ~= true then
        error(("[%*]: Error while updating replica:\n%*\n"):format(script.Name, (l_v200_0:Identify())) .. v202);
    end;
end);
v18.OnClientEvent:Connect(function(v203, v204, v205) --[[ Line: 747 ]]
    -- upvalues: v10 (copy), v11 (copy), v27 (ref)
    local v206 = v10[v203] or v11[v203];
    if v206 == nil then
        error((("[%*]: Received update for missing replica [Id:%*]"):format(script.Name, v203)));
    end;
    local l_v206_0 = v206;
    v27 = true;
    local v208;
    v206, v208 = pcall(l_v206_0.TableRemove, l_v206_0, v204, v205);
    v27 = false;
    if v206 ~= true then
        error(("[%*]: Error while updating replica:\n%*\n"):format(script.Name, (l_v206_0:Identify())) .. v208);
    end;
end);
v19.OnClientEvent:Connect(function(v209, v210, ...) --[[ Line: 757 ]]
    -- upvalues: v10 (copy), v11 (copy), v27 (ref)
    local v211 = v10[v209] or v11[v209];
    if v211 == nil then
        error((("[%*]: Received update for missing replica [Id:%*]"):format(script.Name, v209)));
    end;
    local l_v211_0 = v211;
    v211 = l_v211_0.write_lib[v210].Name;
    v27 = true;
    local l_status_0, l_result_0 = pcall(l_v211_0.Write, l_v211_0, v211, ...);
    v27 = false;
    if l_status_0 ~= true then
        error(("[%*]: Error while updating replica:\n%*\n"):format(script.Name, (l_v211_0:Identify())) .. l_result_0);
    end;
end);
local function v217(v215, ...) --[[ Line: 768 ]] --[[ Name: RemoteSignalHandle ]]
    -- upvalues: v10 (copy), v11 (copy)
    local v216 = v10[v215] or v11[v215];
    if v216 == nil then
        error((("[%*]: Received update for missing replica [Id:%*]"):format(script.Name, v215)));
    end;
    v216.OnClientEvent:Fire(...);
end;
v20.OnClientEvent:Connect(v217);
v25.OnClientEvent:Connect(v217);
v21.OnClientEvent:Connect(function(v218, v219) --[[ Line: 776 ]]
    -- upvalues: v10 (copy), v11 (copy), v130 (copy), v125 (copy)
    local v220 = v10[v218] or v11[v218];
    if v220 == nil then
        error((("[%*]: Received update for missing replica [Id:%*]"):format(script.Name, v218)));
    end;
    local l_v220_0 = v220;
    v220 = l_v220_0.Parent;
    local v222 = v10[v219] or v11[v219];
    if v222 == nil then
        error((("[%*]: Received update for missing replica [Id:%*]"):format(script.Name, v219)));
    end;
    local l_v222_0 = v222;
    v220.Children[l_v220_0] = nil;
    l_v222_0.Children[l_v220_0] = true;
    l_v220_0.Parent = l_v222_0;
    l_v220_0.self_creation[4] = v219;
    if v11[v220.Id] ~= nil and v10[v219] ~= nil then
        v130(l_v220_0);
        return;
    else
        if v10[v220.Id] ~= nil and v11[v219] ~= nil then
            v125(l_v220_0);
        end;
        return;
    end;
end);
v22.OnClientEvent:Connect(function(v224, v225) --[[ Line: 797 ]]
    -- upvalues: v180 (copy), v52 (copy), v12 (copy), v11 (copy), v9 (copy), v10 (copy), v13 (copy)
    local v226 = {};
    v180(v224, v225, function(v227, v228) --[[ Line: 801 ]]
        -- upvalues: v52 (ref), v12 (ref), v11 (ref), v9 (ref), v10 (ref), v226 (copy)
        local v229 = v228[4];
        local v230 = v52(v227, v228);
        local v231 = false;
        if v229 == 0 then
            if v230.Tags.Bind == true then
                local v232 = v12[v227];
                v230.BoundInstance = v232;
                if v232 == nil then
                    v231 = true;
                end;
            end;
        elseif v11[v229] ~= nil then
            v231 = true;
        end;
        if v231 == true then
            v11[v227] = v230;
            return;
        else
            local l_Token_1 = v230.Token;
            local v234 = v9[l_Token_1];
            if v234 == nil then
                v234 = {};
                v9[l_Token_1] = v234;
            end;
            v234[v230] = true;
            v10[v227] = v230;
            table.insert(v226, v230);
            return;
        end;
    end);
    for _, v236 in ipairs(v226) do
        local v237 = v13[v236.Token];
        if v237 ~= nil then
            v237:Fire(v236);
        end;
    end;
end);
v23.OnClientEvent:Connect(function(v238) --[[ Line: 856 ]]
    -- upvalues: v10 (copy), v11 (copy), v12 (copy), v125 (copy)
    local v239 = v10[v238] or v11[v238];
    if v239 == nil then
        error((("[%*]: Received update for missing replica [Id:%*]"):format(script.Name, v238)));
    end;
    local l_v239_0 = v239;
    l_v239_0.Tags.Bind = true;
    v239 = v12[v238];
    l_v239_0.BoundInstance = v239;
    if v239 == nil then
        v125(l_v239_0);
    end;
end);
v24.OnClientEvent:Connect(function(v241) --[[ Line: 870 ]]
    -- upvalues: v10 (copy), v11 (copy), v119 (copy)
    local v242 = v10[v241] or v11[v241];
    if v242 == nil then
        error((("[%*]: Received update for missing replica [Id:%*]"):format(script.Name, v241)));
    end;
    v119(v242);
end);
local function _(v243) --[[ Line: 877 ]] --[[ Name: OnBindInstanceAdded ]]
    -- upvalues: v12 (copy), v11 (copy), v130 (copy)
    local l_Value_0 = v243.Value;
    local l_Parent_0 = v243.Parent;
    v12[l_Value_0] = l_Parent_0;
    local v246 = v11[l_Value_0];
    if v246 ~= nil then
        v246.BoundInstance = l_Parent_0;
        v130(v246);
    end;
end;
local function _(v248) --[[ Line: 892 ]] --[[ Name: OnBindInstanceRemoved ]]
    -- upvalues: v12 (copy), v10 (copy), v125 (copy)
    local l_Value_1 = v248.Value;
    v12[l_Value_1] = nil;
    local v250 = v10[l_Value_1];
    if v250 ~= nil then
        v125(v250);
    end;
end;
l_CollectionService_0:GetInstanceAddedSignal("REPLICA"):Connect(function(v252) --[[ Line: 905 ]]
    -- upvalues: v12 (copy), v11 (copy), v130 (copy)
    if v252:IsA("NumberValue") == true then
        local l_Value_2 = v252.Value;
        local l_Parent_1 = v252.Parent;
        v12[l_Value_2] = l_Parent_1;
        local v255 = v11[l_Value_2];
        if v255 ~= nil then
            v255.BoundInstance = l_Parent_1;
            v130(v255);
        end;
    end;
end);
l_CollectionService_0:GetInstanceRemovedSignal("REPLICA"):Connect(function(v256) --[[ Line: 911 ]]
    -- upvalues: v12 (copy), v10 (copy), v125 (copy)
    if v256:IsA("NumberValue") == true then
        local l_Value_3 = v256.Value;
        v12[l_Value_3] = nil;
        local v258 = v10[l_Value_3];
        if v258 ~= nil then
            v125(v258);
        end;
    end;
end);
for _, v260 in pairs(l_CollectionService_0:GetTagged("REPLICA")) do
    if v260:IsA("NumberValue") == true then
        local l_Value_4 = v260.Value;
        local l_Parent_2 = v260.Parent;
        v12[l_Value_4] = l_Parent_2;
        local v263 = v11[l_Value_4];
        if v263 ~= nil then
            v263.BoundInstance = l_Parent_2;
            v130(v263);
        end;
    end;
end;
return v45;