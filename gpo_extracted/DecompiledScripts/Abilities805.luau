local l_Players_0 = game:GetService("Players");
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_HttpService_0 = game:GetService("HttpService");
local l_UserInputService_0 = game:GetService("UserInputService");
local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
local l_PlayerGui_0 = l_LocalPlayer_0:WaitForChild("PlayerGui");
local l_Modules_0 = l_ReplicatedStorage_0:WaitForChild("Modules");
local _ = require(l_Modules_0.Trove);
local v8 = require(l_Modules_0.Skills);
local l_Shared_0 = l_Modules_0.Shared;
local _ = require(l_Shared_0.GameUtils);
local v11 = require(l_Shared_0.Queues.QueueTask);
local v12 = require(l_Shared_0.Signals.GoodSignal);
local _ = l_ReplicatedStorage_0:WaitForChild("Events");
local v14 = {
    Initialized = false
};
v8.Moves = {};
local v15 = 0;
for _, v17 in pairs(v8.Skills) do
    for v18, v19 in pairs(v17) do
        v8.Moves[v18] = v19;
    end;
    v15 = v15 + 1;
    if v15 == 5 then
        v15 = 0;
        task.wait();
    end;
end;
v8.GetMoveData = function(v20) --[[ Line: 41 ]] --[[ Name: GetMoveData ]]
    -- upvalues: v8 (copy)
    return v8.Moves[v20];
end;
v15 = {
    ["Ope-Ope Surgeon Mode"] = "Ope-Ope", 
    ["Gomu-Gomu Gear 2"] = "Gomu-Gomu", 
    ["Buddha-Buddha Full Form"] = "Buddha-Buddha", 
    ["Buddha-Buddha Half Form"] = "Buddha-Buddha", 
    ["Venom Demon"] = "Venom-Venom", 
    ["Tori-Tori Transformed"] = "Tori-Tori", 
    BlackLegD = "BlackLeg", 
    ["Pteranodon-Pteranodon Hybrid Form"] = "Pteranodon-Pteranodon", 
    ["Pteranodon-Pteranodon Full Form"] = "Pteranodon-Pteranodon", 
    ["Dragon-Dragon Full Form"] = "Dragon-Dragon", 
    ["Dragon-Dragon Half Form"] = "Dragon-Dragon", 
    ["Soul-Soul: Prometheus"] = "Soul-Soul", 
    ["Soul-Soul: Prometheus RAGE"] = "Soul-Soul", 
    ["Soul-Soul: Zeus"] = "Soul-Soul", 
    ["Soul-Soul: Zeus RAGE"] = "Soul-Soul", 
    ["Soul-Soul: Soul Summon"] = "Soul-Soul"
};
v14.Initialize = function(v21) --[[ Line: 69 ]] --[[ Name: Initialize ]]
    -- upvalues: v14 (copy), l_LocalPlayer_0 (copy), l_ReplicatedStorage_0 (copy), l_PlayerGui_0 (copy), v11 (copy), l_HttpService_0 (copy), v8 (copy), v15 (copy), v12 (copy), l_UserInputService_0 (copy), l_Modules_0 (copy)
    if v14.Initialized then
        return;
    else
        local l_PlayerScripts_0 = l_LocalPlayer_0:WaitForChild("PlayerScripts");
        local l_InputHandler_0 = require(l_PlayerScripts_0:WaitForChild("InputHandler"));
        local v24 = require(l_ReplicatedStorage_0.Modules.ContextActionService);
        local l_v21_StatsFolder_0 = v21:GetStatsFolder();
        local l_Stats_0 = l_v21_StatsFolder_0:WaitForChild("Stats");
        local l_Skills_0 = l_v21_StatsFolder_0:WaitForChild("Skills");
        local v28 = l_PlayerGui_0:WaitForChild("Abilities", 360);
        local l_Main_0 = v28:WaitForChild("Main");
        local l_List_0 = l_Main_0:WaitForChild("List");
        local l_Title_0 = l_List_0:WaitForChild("Title");
        local l_ModeBar_0 = l_List_0:WaitForChild("ModeBar");
        local l_Toggle_0 = l_Main_0:WaitForChild("Toggle");
        local l_MasteryBar_0 = l_List_0:WaitForChild("MasteryBar");
        local l_Fill_0 = l_MasteryBar_0:WaitForChild("Base"):WaitForChild("Bar"):WaitForChild("Fill");
        v14.QueueTask = v11.new();
        local v36 = {};
        local v37 = {};
        local v38 = {};
        local v39 = {};
        local v40 = {};
        local v41 = {};
        local v42 = Color3.fromRGB(255, 0, 0);
        local v43 = nil;
        local function _(v44) --[[ Line: 106 ]] --[[ Name: round ]]
            if v44 >= 0 then
                return (math.floor(v44 + 0.5));
            else
                return (math.ceil(v44 - 0.5));
            end;
        end;
        local function _(v46) --[[ Line: 114 ]] --[[ Name: roundToNearestHundredth ]]
            local v47 = v46 * 10;
            return (if v47 >= 0 then math.floor(v47 + 0.5) else math.ceil(v47 - 0.5)) / 10;
        end;
        local function v54(v49, v50) --[[ Line: 118 ]] --[[ Name: mobileButtonCD ]]
            v49.CD.Text = v50;
            local v51 = tick();
            while tick() - v51 < v50 do
                local l_CD_0 = v49.CD;
                local v53 = (v50 - (tick() - v51)) * 10;
                l_CD_0.Text = (if v53 >= 0 then math.floor(v53 + 0.5) else math.ceil(v53 - 0.5)) / 10;
                task.wait(0.1);
            end;
            if v49 then
                v49.CD.Text = "";
            end;
        end;
        v14.UpdateSkillCooldown = function(_, v56, v57, _) --[[ Line: 133 ]] --[[ Name: UpdateSkillCooldown ]]
            -- upvalues: l_InputHandler_0 (copy), v39 (copy), v41 (ref), v38 (copy), l_List_0 (copy), v28 (copy), l_HttpService_0 (ref), v42 (copy)
            local l_l_InputHandler_0_CurrentInput_0 = l_InputHandler_0:GetCurrentInput();
            if v39[v56] == nil then
                v39[v56] = {
                    CooldownTime = v57, 
                    StartTime = os.clock(), 
                    EndTime = os.clock() + v57
                };
                task.delay(v57, function() --[[ Line: 146 ]]
                    -- upvalues: v39 (ref), v56 (copy)
                    v39[v56] = nil;
                end);
            end;
            if l_l_InputHandler_0_CurrentInput_0 == "Mobile" then
                task.spawn(function() --[[ Line: 153 ]]
                    -- upvalues: v41 (ref), v56 (copy), v57 (copy)
                    for v60 = 1, #v41 do
                        if v41[v60].Name == v56 then
                            local v61 = v41[v60];
                            print(v61, v57);
                            v61.CD.Text = v57;
                            local v62 = tick();
                            while tick() - v62 < v57 do
                                local l_CD_1 = v61.CD;
                                local v64 = (v57 - (tick() - v62)) * 10;
                                l_CD_1.Text = (if v64 >= 0 then math.floor(v64 + 0.5) else math.ceil(v64 - 0.5)) / 10;
                                task.wait(0.1);
                            end;
                            if v61 then
                                v61.CD.Text = "";
                                return;
                            else
                                break;
                            end;
                        end;
                    end;
                end);
                return;
            else
                if v38[v56] == nil then
                    v38[v56] = {
                        SkillFrame = nil
                    };
                end;
                local v65 = v38[v56];
                local v66 = v56 == "Block" and l_List_0:FindFirstChild("Block") or v65 and v65.SkillFrame or nil;
                if v66 and v66:IsDescendantOf(v28) == false or v66 == nil then
                    local l_l_List_0_FirstChild_0 = l_List_0:FindFirstChild(v56);
                    if l_l_List_0_FirstChild_0 then
                        v66 = l_l_List_0_FirstChild_0;
                        if v65 then
                            v65.SkillFrame = v66;
                        end;
                    end;
                end;
                if v65.CooldownData == nil then
                    v65.CooldownData = {
                        CooldownTime = v57, 
                        StartTime = os.clock(), 
                        EndTime = os.clock() + v57, 
                        SerialId = l_HttpService_0:GenerateGUID()
                    };
                    task.delay(v57, function() --[[ Line: 211 ]]
                        -- upvalues: v38 (ref), v56 (copy)
                        if v38[v56] then
                            v38[v56].CooldownData = nil;
                        end;
                    end);
                end;
                if v66 == nil then
                    return;
                else
                    local l_CDTimer_0 = v66.CDTimer;
                    local l_Icon_0 = v66.Icon;
                    local l_UIGradient_0 = l_Icon_0.UIGradient;
                    task.spawn(function() --[[ Line: 230 ]]
                        -- upvalues: l_CDTimer_0 (ref), v56 (copy), v66 (ref), v65 (copy), v57 (copy), l_Icon_0 (ref), l_UIGradient_0 (ref), v42 (ref), v38 (ref)
                        if l_CDTimer_0.Visible == true and v56 ~= "Block" then
                            warn("exting cd visible");
                            return;
                        elseif v66:GetAttribute("IsInCD") == true then
                            warn("exting cd attribute");
                            return;
                        else
                            l_CDTimer_0.Visible = true;
                            v66:SetAttribute("IsInCD", true);
                            local l_v66_0 = v66;
                            local v72 = false;
                            while v65 and v65.CooldownData ~= nil and os.clock() - v65.CooldownData.StartTime < v57 do
                                if v66 ~= v65.SkillFrame and v56 ~= "Block" then
                                    v66 = v65.SkillFrame;
                                    l_CDTimer_0 = v66.CDTimer;
                                    l_Icon_0 = v66.Icon;
                                    l_UIGradient_0 = l_Icon_0.UIGradient;
                                end;
                                if v66 ~= l_v66_0 then
                                    v72 = true;
                                    break;
                                else
                                    local v73 = 1 - (os.clock() - v65.CooldownData.StartTime) / v57;
                                    pcall(function() --[[ Line: 256 ]]
                                        -- upvalues: l_UIGradient_0 (ref), v42 (ref), v73 (copy)
                                        l_UIGradient_0.Color = ColorSequence.new({
                                            ColorSequenceKeypoint.new(0, v42), 
                                            ColorSequenceKeypoint.new(math.clamp(v73 * 0.9, 0, 0.9), v42), 
                                            ColorSequenceKeypoint.new(v73, Color3.fromRGB(255, 255, 255)), 
                                            ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 255, 255))
                                        });
                                    end);
                                    local l_l_CDTimer_0_0 = l_CDTimer_0;
                                    local v75 = (v57 - (os.clock() - v65.CooldownData.StartTime)) * 10;
                                    l_l_CDTimer_0_0.Text = (if v75 >= 0 then math.floor(v75 + 0.5) else math.ceil(v75 - 0.5)) / 10;
                                    task.wait(0.1);
                                end;
                            end;
                            if v66 ~= v65.SkillFrame and v56 ~= "Block" or v72 == true then
                                return;
                            else
                                v66:SetAttribute("IsInCD", false);
                                v38[v56].CooldownData = nil;
                                l_UIGradient_0.Color = ColorSequence.new(Color3.fromRGB(255, 255, 255));
                                l_CDTimer_0.Visible = false;
                                return;
                            end;
                        end;
                    end);
                    return;
                end;
            end;
        end;
        v14.UpdateSkillCooldown2 = function(_, v77, v78, _) --[[ Line: 281 ]] --[[ Name: UpdateSkillCooldown2 ]]
            -- upvalues: l_InputHandler_0 (copy), v38 (copy), v39 (copy), v41 (ref), v54 (copy), l_List_0 (copy), v28 (copy), v42 (copy)
            local l_l_InputHandler_0_CurrentInput_1 = l_InputHandler_0:GetCurrentInput();
            local _ = v38[v77];
            if v39[v77] == nil then
                v39[v77] = {
                    CooldownTime = v78, 
                    StartTime = os.clock(), 
                    EndTime = os.clock() + v78
                };
                task.delay(v78, function() --[[ Line: 295 ]]
                    -- upvalues: v39 (ref), v77 (copy)
                    v39[v77] = nil;
                end);
            end;
            if l_l_InputHandler_0_CurrentInput_1 == "Mobile" then
                task.spawn(function() --[[ Line: 302 ]]
                    -- upvalues: v41 (ref), v77 (copy), v54 (ref), v78 (copy)
                    for v82 = 1, #v41 do
                        if v41[v82].Name == v77 then
                            local v83 = v41[v82];
                            v54(v83, v78);
                            return;
                        end;
                    end;
                end);
                return;
            else
                local v84 = v38[v77];
                print("Update SkillCooldown", v77, v78);
                local v85 = v77 == "Block" and l_List_0:FindFirstChild("Block") or v84 and v84.SkillFrame or nil;
                if v85 and v85:IsDescendantOf(v28) == false or v85 == nil then
                    local l_l_List_0_FirstChild_1 = l_List_0:FindFirstChild(v77);
                    if l_l_List_0_FirstChild_1 then
                        v85 = l_l_List_0_FirstChild_1;
                        if v84 then
                            v84.SkillFrame = v85;
                        end;
                    end;
                end;
                if v85 == nil then
                    print("frame is nil?");
                    return;
                elseif v85:WaitForChild("CDTimer", 1) == nil then
                    warn("cant find cd timer for ", v77);
                    return;
                else
                    local l_CDTimer_1 = v85.CDTimer;
                    local l_Icon_1 = v85.Icon;
                    local l_UIGradient_1 = l_Icon_1.UIGradient;
                    task.spawn(function() --[[ Line: 346 ]]
                        -- upvalues: l_CDTimer_1 (ref), v77 (copy), v85 (ref), v84 (copy), v78 (copy), l_Icon_1 (ref), l_UIGradient_1 (ref), v42 (ref), v38 (ref)
                        if l_CDTimer_1.Visible == true and v77 ~= "Block" then
                            warn("exting cd visible");
                            return;
                        elseif v85:GetAttribute("IsInCD") == true then
                            warn("exting cd attribute");
                            return;
                        else
                            l_CDTimer_1.Visible = true;
                            v85:SetAttribute("IsInCD", true);
                            local l_v85_0 = v85;
                            local v91 = false;
                            while v84 and v84.CooldownData ~= nil and os.clock() - v84.CooldownData.StartTime < v78 do
                                if v85 ~= v84.SkillFrame and v77 ~= "Block" then
                                    v85 = v84.SkillFrame;
                                    l_CDTimer_1 = v85.CDTimer;
                                    l_Icon_1 = v85.Icon;
                                    l_UIGradient_1 = l_Icon_1.UIGradient;
                                end;
                                if v85 ~= l_v85_0 then
                                    v91 = true;
                                    break;
                                else
                                    local v92 = 1 - (os.clock() - v84.CooldownData.StartTime) / v78;
                                    l_UIGradient_1.Color = ColorSequence.new({
                                        ColorSequenceKeypoint.new(0, v42), 
                                        ColorSequenceKeypoint.new(math.clamp(v92 * 0.9, 0, 0.9), v42), 
                                        ColorSequenceKeypoint.new(v92, Color3.fromRGB(255, 255, 255)), 
                                        ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 255, 255))
                                    });
                                    local l_l_CDTimer_1_0 = l_CDTimer_1;
                                    local v94 = (v78 - (os.clock() - v84.CooldownData.StartTime)) * 10;
                                    l_l_CDTimer_1_0.Text = (if v94 >= 0 then math.floor(v94 + 0.5) else math.ceil(v94 - 0.5)) / 10;
                                    task.wait(0.1);
                                end;
                            end;
                            if v85 ~= v84.SkillFrame and v77 ~= "Block" or v91 == true then
                                return;
                            else
                                v85:SetAttribute("IsInCD", false);
                                v38[v77].CooldownData = nil;
                                l_UIGradient_1.Color = ColorSequence.new(Color3.fromRGB(255, 255, 255));
                                l_CDTimer_1.Visible = false;
                                return;
                            end;
                        end;
                    end);
                    return;
                end;
            end;
        end;
        local v95 = nil;
        local function v101(v96) --[[ Line: 394 ]] --[[ Name: SetPreviousAbilityDisplay ]]
            -- upvalues: v95 (ref), v37 (copy)
            if v95 ~= v96 and v37[v95] ~= nil then
                for _, v98 in pairs(v37[v95]) do
                    local l_CDTimer_2 = v98.CDTimer;
                    local l_UIGradient_2 = v98.Icon.UIGradient;
                    v98.Parent = nil;
                    l_CDTimer_2.Visible = false;
                    v98:SetAttribute("IsInCD", false);
                    l_UIGradient_2.Color = ColorSequence.new(Color3.fromRGB(255, 255, 255));
                end;
                v95 = nil;
            end;
        end;
        local v102 = {};
        local function _(v103) --[[ Line: 413 ]] --[[ Name: FindStatObject ]]
            -- upvalues: v102 (copy), l_Stats_0 (copy)
            local v104 = v102[v103];
            if v104 then
                return v104;
            else
                v104 = l_Stats_0:FindFirstChild(v103);
                v102[v103] = v104;
                return v104;
            end;
        end;
        local function _(v106) --[[ Line: 426 ]] --[[ Name: FindSkillObject ]]
            -- upvalues: v102 (copy), l_Skills_0 (copy)
            local v107 = v102[v106];
            if v107 then
                return v107;
            else
                v107 = l_Skills_0:FindFirstChild(v106);
                v102[v106] = v107;
                return v107;
            end;
        end;
        local function _(v109, v110, v111) --[[ Line: 438 ]] --[[ Name: IsSkillRequirementMet ]]
            -- upvalues: v102 (copy), l_Stats_0 (copy), l_Skills_0 (copy)
            local v112 = v102[v109];
            local v113;
            if v112 then
                v113 = v112;
            else
                v112 = l_Stats_0:FindFirstChild(v109);
                v102[v109] = v112;
                v113 = v112;
            end;
            if v113 then
                if (v113:IsA("NumberValue") or v113:IsA("IntValue")) and v113.Value < v110 then
                    return false;
                elseif v113:IsA("StringValue") then
                    if typeof(v110) == "table" then
                        for v114 = 1, #v110 do
                            if v110[v114] == v113.Value then
                                return true;
                            end;
                        end;
                    end;
                    if v113.Value ~= v110 then
                        return false;
                    end;
                end;
            elseif v109:match("/SKILL/") and v111 == nil then
                v112 = string.gsub(v109, "/SKILL/", "");
                local v115 = v102[v112];
                local v116;
                if v115 then
                    v116 = v115;
                else
                    v115 = l_Skills_0:FindFirstChild(v112);
                    v102[v112] = v115;
                    v116 = v115;
                end;
                if v116 and v116.Value < v110 then
                    return false;
                elseif v116 == nil then
                    return false;
                end;
            end;
            return true;
        end;
        local function _(v118, v119) --[[ Line: 474 ]] --[[ Name: SkillRequirementsMet ]]
            -- upvalues: l_LocalPlayer_0 (ref)
            return _G.SkillRequirementsMet(l_LocalPlayer_0, v118, v119);
        end;
        local function v137(v121, v122) --[[ Line: 491 ]] --[[ Name: UpdateSkillFrame ]]
            -- upvalues: v8 (ref), l_LocalPlayer_0 (ref)
            local v123 = v8.GetMoveData(v121);
            local v124 = true;
            local v125 = false;
            if v123 then
                local l_statreq_0 = v123.statreq;
                if l_statreq_0 ~= nil then
                    v125 = v123.hiddenLock or false;
                    local v127, v128 = _G.SkillRequirementsMet(l_LocalPlayer_0, l_statreq_0, nil);
                    local l_v127_0 = v127;
                    local l_v128_0 = v128;
                    if l_v127_0 then
                        v124 = false;
                        v122.Icon.Key.Text = v122:GetAttribute("Key");
                        v122.SkillName.Text = v121;
                    else
                        v124 = true;
                        if typeof(l_v128_0) == "string" or typeof(l_v128_0) == "number" then
                            v122.Icon.Key.Text = "<stroke><font color=\"rgb(255,0,0)\">" .. l_v128_0 .. "</font></stroke>";
                        elseif typeof(l_v128_0) == "table" then
                            v127 = function(v131) --[[ Line: 514 ]] --[[ Name: getFirstPart ]]
                                local v132 = string.split(v131, "-");
                                return string.gsub(v132[1], "V2", "");
                            end;
                            v128 = {};
                            for v133 = 1, #l_v128_0 do
                                local v134 = l_v128_0[v133];
                                local v135 = string.split(v134, "-");
                                table.insert(v128, (string.gsub(v135[1], "V2", "")));
                            end;
                            local v136 = table.concat(v128, " or ");
                            v122.Icon.Key.Text = "<stroke><font color=\"rgb(255,0,0)\">" .. v136 .. "</font></stroke>";
                        end;
                        v122.SkillName.Text = "???";
                    end;
                else
                    v124 = false;
                end;
            else
                v124 = false;
            end;
            v122:SetAttribute("Locked", v124);
            if v124 == true then
                if v125 then
                    v122.SkillName.Text = "?";
                end;
                v122.Icon.Lock.Visible = true;
                return;
            else
                if v124 == false then
                    v122.Icon.Lock.Visible = false;
                end;
                return;
            end;
        end;
        local function _() --[[ Line: 551 ]] --[[ Name: ClearMobileButtons ]]
            -- upvalues: v41 (ref)
            for v138 = 1, #v41 do
                v41[v138].Parent = nil;
                v41[v138] = nil;
            end;
            v41 = {};
        end;
        local function v144() --[[ Line: 560 ]] --[[ Name: updateMasteryBar ]]
            -- upvalues: l_LocalPlayer_0 (ref), v43 (ref), l_MasteryBar_0 (copy), l_Fill_0 (copy)
            local v140, v141 = _G.getMasteryInfo(l_LocalPlayer_0, v43);
            if v140 ~= nil then
                l_MasteryBar_0.Visible = true;
                local v142 = math.min(1, v140 / v141);
                local v143 = v142 < 1 and math.floor(v142 * 100) .. "%" or "MAXED";
                l_MasteryBar_0.Base.Progress.Text = v143;
                l_Fill_0:TweenSize(UDim2.new(v142, 0, 1.01, 0), "Out", "Quad", 0.25, true);
                return;
            else
                l_MasteryBar_0.Visible = false;
                return;
            end;
        end;
        local function v211(v145, v146) --[[ Line: 574 ]] --[[ Name: QueueBindAbility ]]
            -- upvalues: v43 (ref), v144 (copy), l_InputHandler_0 (copy), v101 (copy), v95 (ref), l_Title_0 (copy), l_Main_0 (copy), v37 (copy), v38 (copy), v14 (ref), l_List_0 (copy), v41 (ref), v137 (copy), v8 (ref), v40 (copy), l_LocalPlayer_0 (ref), v24 (copy), v15 (ref), v12 (ref), l_UserInputService_0 (ref), l_v21_StatsFolder_0 (copy), v39 (copy), v54 (copy)
            local v147 = false;
            local v148 = false;
            v43 = v145;
            v144();
            local _ = l_InputHandler_0:GetCurrentInput();
            v101(v145);
            v95 = v145;
            l_Title_0.Text = v145;
            local l_l_InputHandler_0_CurrentInput_3 = l_InputHandler_0:GetCurrentInput();
            if l_l_InputHandler_0_CurrentInput_3 ~= "Mobile" then
                l_Main_0.Visible = true;
            else
                l_Main_0.Visible = false;
            end;
            local _ = function(v151) --[[ Line: 595 ]] --[[ Name: countTable ]]
                local v152 = 0;
                for _, _ in pairs(v151) do
                    v152 = v152 + 1;
                end;
                return v152;
            end;
            if v37[v145] ~= nil then
                if v37[v145] then
                    local v156 = v37[v145];
                    local v157 = 0;
                    for _, _ in pairs(v156) do
                        v157 = v157 + 1;
                    end;
                    local l_v157_0 = v157;
                    v157 = 0;
                    for _, _ in pairs(v146) do
                        v157 = v157 + 1;
                    end;
                    v147 = l_v157_0 ~= v157;
                end;
                if not v147 then
                    if l_l_InputHandler_0_CurrentInput_3 ~= "Mobile" then
                        for v163, v164 in pairs(v37[v145]) do
                            v164.Parent = l_List_0;
                            local v165 = v38[v163];
                            if v165 and v165.CooldownData ~= nil then
                                v14.UpdateSkillCooldown(nil, v163, v165.CooldownData.CooldownTime);
                            end;
                        end;
                        return;
                    else
                        v148 = true;
                    end;
                end;
            end;
            if not v148 then
                v147 = false;
                for v166 = 1, #v146 do
                    local v167 = v146[v166];
                    local v168 = v38[v167];
                    if v168 and v168.CooldownData ~= nil then
                        warn("new cd setting", v167);
                        v14.UpdateSkillCooldown(nil, v167, v168.CooldownData.CooldownTime);
                    end;
                end;
                v37[v145] = {};
            end;
            v148 = false;
            for v169 = 1, #v41 do
                v41[v169].Parent = nil;
                v41[v169] = nil;
            end;
            v41 = {};
            for v170, v171 in pairs(v146) do
                local v172 = v171[1];
                local v173 = v171[2];
                local v174 = v171[3];
                local l_l_InputHandler_0_CurrentInput_4 = l_InputHandler_0:GetCurrentInput();
                if v172 ~= "Armament Haki" then
                    if l_l_InputHandler_0_CurrentInput_4 ~= "Mobile" then
                        if l_List_0:FindFirstChild(v172) then
                            warn("existing frame for", v172);
                        else
                            v173 = string.len(v173) == 1 and string.upper(v173) or v173;
                            local v176 = script.Template:Clone();
                            v176.Name = v172;
                            v176.LayoutOrder = #v146 - v170;
                            v176.Parent = l_List_0;
                            v176:SetAttribute("Key", v173);
                            v37[v145][v172] = v176;
                            v176.SkillName.Text = v172;
                            v176.Icon.Key.Text = v174 and v174 .. " " .. v173 or v173;
                            v137(v172, v176);
                            local v177 = v38[v172];
                            if v177 ~= nil then
                                v38[v172].SkillFrame = v176;
                                if v177.CooldownData ~= nil then
                                    v14.UpdateSkillCooldown(nil, v172, v177.CooldownData.CooldownTime);
                                end;
                            else
                                v38[v172] = {
                                    SkillFrame = v176
                                };
                            end;
                        end;
                    elseif v172 ~= "Block" then
                        local v178 = v8.GetMoveData(v172);
                        if v178.hideMobile == nil then
                            local v179 = v40[v172];
                            local l_SkillCallbacks_0 = require(l_LocalPlayer_0.Backpack:WaitForChild("SkillCallbacks"));
                            local v181 = #v41 + 1;
                            local v182 = ("Skill%*"):format(v181) or v172;
                            local v183 = l_InputHandler_0.Inputs.Mobile.SavedButtons[v182];
                            local _, _, v186 = v24:GetMobileUI();
                            if true then
                                local l_v179_0 = v179;
                                if not l_v179_0 then
                                    local v188 = false;
                                    if true then
                                        local l_v188_0 = v188;
                                        l_v179_0 = v24:CreateButton({
                                            Name = v172, 
                                            Title = v172, 
                                            AutoScaling = true, 
                                            SizeRatio = v183 and v183.SizeRatio, 
                                            Size = v183 and UDim2.fromOffset(v183.SizeRatio.X * v186.AbsoluteSize.X, v183.SizeRatio.Y * v186.AbsoluteSize.Y), 
                                            Callbacks = {
                                                InputBegan = function() --[[ Line: 714 ]] --[[ Name: InputBegan ]]
                                                    -- upvalues: l_v188_0 (ref), v43 (ref), v15 (ref), l_SkillCallbacks_0 (copy), v172 (copy), v178 (copy), l_v179_0 (ref), v12 (ref), l_UserInputService_0 (ref), l_v21_StatsFolder_0 (ref)
                                                    if l_v188_0 then
                                                        warn("already using?");
                                                        return;
                                                    else
                                                        local l_v43_0 = v43;
                                                        l_v43_0 = v15[l_v43_0] or l_v43_0;
                                                        l_v188_0 = true;
                                                        warn((("Ability used: %*"):format(l_v43_0)));
                                                        local l_l_SkillCallbacks_0_SkillCallback_0 = l_SkillCallbacks_0:GetSkillCallback(l_v43_0);
                                                        local v192 = v172:gsub("%s+", "");
                                                        _G.mobileUsingSkill = true;
                                                        if v178.InstantCast ~= nil then
                                                            local l_Image_0 = l_v179_0.ActionIcon.Image;
                                                            l_v179_0.ActionIcon.Image = "rbxassetid://17714973640";
                                                            l_v179_0.ActionIcon.ImageColor3 = Color3.fromRGB(255, 255, 255);
                                                            local v194 = v12.new();
                                                            local v195 = nil;
                                                            do
                                                                local l_v194_0 = v194;
                                                                v195 = l_UserInputService_0.TouchTapInWorld:Connect(function(v197, v198) --[[ Line: 734 ]]
                                                                    -- upvalues: l_v179_0 (ref), l_Image_0 (copy), l_v194_0 (ref)
                                                                    if v198 then
                                                                        return;
                                                                    else
                                                                        l_v179_0.ActionIcon.Image = l_Image_0;
                                                                        _G.Mouse:SetPosition(v197);
                                                                        l_v194_0:Fire();
                                                                        return;
                                                                    end;
                                                                end);
                                                                if l_v21_StatsFolder_0.Settings.InstantCastSkills.Value == false and v178.IgnoreInstantCastSetting == nil then
                                                                    l_v194_0:Wait();
                                                                end;
                                                                l_v179_0.ActionIcon.ImageColor3 = Color3.fromRGB(255, 255, 255);
                                                                l_v194_0:DisconnectAll();
                                                                l_v194_0 = nil;
                                                                v195:Disconnect();
                                                                v195 = nil;
                                                            end;
                                                        end;
                                                        if l_l_SkillCallbacks_0_SkillCallback_0.canUseSkills and not l_l_SkillCallbacks_0_SkillCallback_0.canUseSkills() then
                                                            l_v188_0 = nil;
                                                            warn("alreaedy yusing returning!");
                                                            return;
                                                        else
                                                            task.delay(0.1, function() --[[ Line: 756 ]]
                                                                _G.mobileUsingSkill = nil;
                                                            end);
                                                            l_l_SkillCallbacks_0_SkillCallback_0[v192](l_l_SkillCallbacks_0_SkillCallback_0, l_v179_0);
                                                            l_v188_0 = nil;
                                                            return;
                                                        end;
                                                    end;
                                                end
                                            }
                                        });
                                        l_v179_0:SetAttribute("Skill", true);
                                        v40[v172] = l_v179_0;
                                        task.spawn(function() --[[ Line: 770 ]]
                                            -- upvalues: l_v179_0 (ref), v178 (copy), l_LocalPlayer_0 (ref), v24 (ref), v172 (copy)
                                            local v199 = false;
                                            l_v179_0.Destroying:Connect(function() --[[ Line: 773 ]]
                                                -- upvalues: v199 (ref)
                                                v199 = true;
                                            end);
                                            while v199 == false do
                                                if l_v179_0.Parent ~= nil and l_v179_0.ActionIcon.Image ~= "rbxassetid://17672867931" and l_v179_0.ActionIcon.Image ~= "rbxassetid://17714973640" then
                                                    local l_statreq_1 = v178.statreq;
                                                    local v201, v202 = _G.SkillRequirementsMet(l_LocalPlayer_0, l_statreq_1, nil);
                                                    local l_v201_0 = v201;
                                                    local l_v202_0 = v202;
                                                    v201 = l_statreq_1 and l_v201_0 == true;
                                                    if l_v201_0 == false then
                                                        l_v179_0.LockedText.Text = "<stroke><font color=\"rgb(255,0,0)\">" .. l_v202_0 .. "</font></stroke>";
                                                        l_v179_0.LockedText.Visible = true;
                                                    else
                                                        l_v179_0.LockedText.Visible = false;
                                                    end;
                                                    v24:UpdateTexture({
                                                        ButtonName = v172, 
                                                        Texture = not v201 and "http://www.roblox.com/asset/?id=15938966453" or "rbxassetid://16527536731"
                                                    });
                                                end;
                                                task.wait(0.1);
                                            end;
                                            warn("mobile button gone");
                                        end);
                                    end;
                                end;
                                table.insert(v41, l_v179_0);
                                v24:GetButtonData(v172).Ability = v145;
                                local l_v24_PositionAndSize_0, _ = v24:GetPositionAndSize();
                                local l_v24_Button_0 = v24:GetButton("Block");
                                local v208 = 2.356194490192345 + 4.71238898038469 / math.max(#v146 - 1, 5) * #v41;
                                local v209 = l_v24_PositionAndSize_0.X.Offset * 1.75;
                                v24:UpdatePosition({
                                    ButtonName = v172, 
                                    Position = v183 and UDim2.fromOffset(v183.X, v183.Y) or l_v24_Button_0.Position + UDim2.new(0, math.sin(v208) * v209, 0, -math.cos(v208) * v209)
                                });
                                if v183 then
                                    v24:UpdateSize({
                                        ButtonName = v172, 
                                        Size = UDim2.fromOffset(v183.SizeRatio.X * v186.AbsoluteSize.X, v183.SizeRatio.Y * v186.AbsoluteSize.Y)
                                    });
                                end;
                                l_InputHandler_0.Inputs.Mobile.EditMode.Skills[v181] = v172;
                                local l_v24_MobileUI_1 = v24:GetMobileUI();
                                l_v179_0.Parent = l_v24_MobileUI_1;
                                if v39[v172] then
                                    task.spawn(function() --[[ Line: 835 ]]
                                        -- upvalues: v54 (ref), l_v179_0 (ref), v39 (ref), v172 (copy)
                                        v54(l_v179_0, v39[v172].EndTime - os.clock());
                                    end);
                                end;
                            end;
                        end;
                    end;
                end;
            end;
        end;
        v14.BindAbility = function(_, v213, v214) --[[ Line: 844 ]] --[[ Name: BindAbility ]]
            -- upvalues: v14 (ref), v211 (copy)
            v14.QueueTask:QueueTask(v211, v213, v214);
        end;
        v14.Cleanup = function(_) --[[ Line: 848 ]] --[[ Name: Cleanup ]]
            -- upvalues: l_Main_0 (copy), v41 (ref), l_Title_0 (copy), v101 (copy)
            l_Main_0.Visible = false;
            for v216 = 1, #v41 do
                v41[v216].Parent = nil;
                v41[v216] = nil;
            end;
            v41 = {};
            l_Title_0.Text = "None";
            v101(nil);
        end;
        v14.cooldown = v14.UpdateSkillCooldown;
        v14.setup = v14.BindAbility;
        v14.Destroy = v14.Cleanup;
        _G.keysetup = v14;
        local v217 = nil;
        local function v258(v218) --[[ Line: 866 ]] --[[ Name: AddModeBar ]]
            -- upvalues: v36 (copy), l_ReplicatedStorage_0 (ref), l_LocalPlayer_0 (ref), l_InputHandler_0 (copy), l_ModeBar_0 (copy), v217 (ref), l_HttpService_0 (ref), l_Modules_0 (ref), v24 (copy), v15 (ref), l_PlayerGui_0 (ref)
            local l_ModeAssets_0 = script.ModeAssets;
            local l_v218_Attribute_0 = v218:GetAttribute("barName");
            local l_v218_Attribute_1 = v218:GetAttribute("damageName");
            local l_v218_Attribute_2 = v218:GetAttribute("filledBarSFX");
            local l_v218_Attribute_3 = v218:GetAttribute("barColor");
            if not l_v218_Attribute_1 then
                return;
            elseif v36[l_v218_Attribute_1] then
                return;
            else
                local l_FirstChild_0 = l_ReplicatedStorage_0.Modules.Skills.Modes:FindFirstChild(_G.modeBarModuleNames(v218.Name));
                if not l_FirstChild_0 then
                    warn((("%* does not have a mode module!"):format(l_v218_Attribute_0)));
                    return;
                else
                    local v225 = require(l_FirstChild_0)(l_LocalPlayer_0);
                    warn("mode bar ", v218.Name);
                    local l_l_InputHandler_0_CurrentInput_5 = l_InputHandler_0:GetCurrentInput();
                    v218.Destroying:Connect(function() --[[ Line: 885 ]]
                        -- upvalues: v36 (ref), l_v218_Attribute_1 (copy)
                        v36[l_v218_Attribute_1] = nil;
                    end);
                    if l_l_InputHandler_0_CurrentInput_5 ~= "Mobile" then
                        local l_Character_0 = l_LocalPlayer_0.Character;
                        local l_Base_0 = l_ModeBar_0.Base;
                        local l_Fill_1 = l_Base_0.Bar.Fill;
                        local l_Progress_0 = l_Base_0.Progress;
                        local l_ModeName_0 = l_ModeBar_0.ModeName;
                        v36[l_v218_Attribute_1] = {};
                        local v232 = v36[l_v218_Attribute_1];
                        l_ModeBar_0.Visible = false;
                        local v233 = false;
                        do
                            local l_v233_0 = v233;
                            local function v242() --[[ Line: 906 ]] --[[ Name: UpdateBar ]]
                                -- upvalues: v218 (copy), v217 (ref), l_v218_Attribute_0 (copy), l_ModeName_0 (copy), l_HttpService_0 (ref), v225 (ref), l_FirstChild_0 (copy), l_LocalPlayer_0 (ref), l_Character_0 (copy), l_v218_Attribute_1 (copy), l_Progress_0 (copy), l_Fill_1 (copy), l_v233_0 (ref), l_ModeAssets_0 (copy), l_v218_Attribute_2 (copy), l_v218_Attribute_3 (copy)
                                if v218 ~= v217 then
                                    return;
                                elseif l_v218_Attribute_0 ~= l_ModeName_0.Text then
                                    return;
                                else
                                    local l_v218_Attribute_4 = v218:GetAttribute("customModeData");
                                    local v236 = v218:GetAttribute("modePercent") or 1;
                                    if l_v218_Attribute_4 then
                                        l_v218_Attribute_4 = l_HttpService_0:JSONDecode(l_v218_Attribute_4);
                                    end;
                                    v225 = require(l_FirstChild_0)(l_LocalPlayer_0);
                                    local v237 = 0.25;
                                    if l_v218_Attribute_4 and l_v218_Attribute_4.Max then
                                        v225 = l_v218_Attribute_4.Max;
                                    end;
                                    if l_v218_Attribute_4 and l_v218_Attribute_4.Volume then
                                        v237 = l_v218_Attribute_4.Volume;
                                    end;
                                    local v238 = math.floor(l_Character_0:GetAttribute(l_v218_Attribute_1) or 0);
                                    local v239 = math.min(1, v238 / v225);
                                    local v240 = v239 < 1 and math.floor(v239 * 100) .. "%" or "MAXED";
                                    if l_v218_Attribute_4 == nil then
                                        l_Progress_0.Text = v240;
                                    else
                                        l_Progress_0.Text = ("%* %*"):format(v238, l_v218_Attribute_4.ModeType);
                                    end;
                                    l_Fill_1:TweenSize(UDim2.new(v239, 0, 1.01, 0), "Out", "Quad", 0.25, true);
                                    if (l_v218_Attribute_4 == nil and v225 * v236 <= v238 or l_v218_Attribute_4 and l_v218_Attribute_4.ModeRequirement <= v238) and l_v233_0 == false then
                                        l_v233_0 = true;
                                        l_ModeAssets_0.enough.Volume = v237;
                                        l_ModeAssets_0.enough.SoundId = l_v218_Attribute_2;
                                        l_ModeAssets_0.enough:Play();
                                        local v241 = l_ModeAssets_0.ColorCorrection:Clone();
                                        v241.TintColor = l_v218_Attribute_3;
                                        v241.Parent = workspace.CurrentCamera;
                                        _G.tween(v241, {
                                            2, 
                                            Enum.EasingStyle.Quad, 
                                            Enum.EasingDirection.Out, 
                                            0, 
                                            false, 
                                            0
                                        }, {
                                            TintColor = Color3.fromRGB(255, 255, 255), 
                                            Contrast = 0
                                        });
                                        _G.destroy(v241, 2);
                                        return;
                                    else
                                        if l_v218_Attribute_4 == nil and v238 < v225 * v236 * 0.8 or l_v218_Attribute_4 ~= nil and v238 < l_v218_Attribute_4.ModeRequirement then
                                            l_v233_0 = false;
                                        end;
                                        return;
                                    end;
                                end;
                            end;
                            local function v243() --[[ Line: 960 ]] --[[ Name: DisplayModeBar ]]
                                -- upvalues: v217 (ref), v218 (copy), l_Fill_1 (copy), l_v218_Attribute_3 (copy), l_ModeName_0 (copy), l_v218_Attribute_0 (copy), v242 (copy), l_ModeBar_0 (ref)
                                v217 = v218;
                                l_Fill_1.BackgroundColor3 = l_v218_Attribute_3;
                                l_ModeName_0.Text = l_v218_Attribute_0;
                                v242();
                                l_ModeBar_0.Visible = true;
                            end;
                            local function v244() --[[ Line: 972 ]] --[[ Name: HideModeBar ]]
                                -- upvalues: l_ModeBar_0 (ref), v217 (ref)
                                l_ModeBar_0.Visible = false;
                                v217 = nil;
                            end;
                            v217 = v218;
                            l_Fill_1.BackgroundColor3 = l_v218_Attribute_3;
                            l_ModeName_0.Text = l_v218_Attribute_0;
                            v242();
                            l_ModeBar_0.Visible = true;
                            print(v218, "bind to", l_v218_Attribute_1);
                            v232.UpdateBar = l_Character_0:GetAttributeChangedSignal(l_v218_Attribute_1):Connect(v242);
                            v232.DisplayModeBar = v218.Equipped:Connect(v243);
                            v232.HideModeBar = v218.Unequipped:Connect(v244);
                        end;
                    else
                        print("mobile", v218.Name);
                        local l_Skills_1 = l_Modules_0:WaitForChild("Skills");
                        local v246 = require(l_Skills_1);
                        local v247 = nil;
                        for v248, v249 in pairs(v24.Buttons) do
                            print("action name", v248);
                            if v249.Ability == nil then
                                warn("canht find " .. v248);
                            elseif v249.Ability == v218.Name or v15[v249.Ability] ~= nil and v15[v249.Ability] == v218.Name then
                                local v250 = v246.GetM(v248);
                                if v250 == nil then
                                    warn("invalid");
                                else
                                    print("skill desc", v250);
                                    if v250.transformation == true then
                                        v247 = v24:GetButton(v248);
                                        break;
                                    end;
                                end;
                            end;
                        end;
                        if v247 == nil then
                            print("failed");
                            return;
                        else
                            v36[l_v218_Attribute_1] = true;
                            print(l_v218_Attribute_1);
                            local v251 = l_ModeAssets_0.Circular:Clone();
                            v251.Name = "CircularModeUI";
                            v251.Parent = l_PlayerGui_0;
                            local l_Progress_1 = v251.Progress;
                            local l_Left_0 = l_Progress_1.Left;
                            local l_Right_0 = l_Progress_1.Right;
                            local l_Position_0 = v247.Position;
                            l_Progress_1.Size = v247.Size;
                            l_Progress_1.Position = l_Position_0;
                            do
                                local l_v247_0 = v247;
                                l_v247_0.Changed:Connect(function(v257) --[[ Line: 1035 ]]
                                    -- upvalues: l_v247_0 (ref), l_Progress_1 (copy)
                                    if l_v247_0.Parent ~= nil then
                                        if v257 == "Position" then
                                            l_Progress_1.Position = l_v247_0.Position;
                                            return;
                                        elseif v257 == "Size" then
                                            l_Progress_1.Size = l_v247_0.Size;
                                        end;
                                    end;
                                end);
                                l_v247_0:GetPropertyChangedSignal("Parent"):Connect(function() --[[ Line: 1045 ]]
                                    -- upvalues: l_v247_0 (ref), v251 (copy)
                                    if l_v247_0.Parent == nil then
                                        v251.Enabled = false;
                                        return;
                                    else
                                        v251.Enabled = true;
                                        return;
                                    end;
                                end);
                                v251:GetPropertyChangedSignal("Enabled"):Connect(function() --[[ Line: 1053 ]]
                                    -- upvalues: v251 (copy), l_Progress_1 (copy), l_v247_0 (ref)
                                    if v251.Enabled then
                                        l_Progress_1.Position = l_v247_0.Position;
                                    end;
                                end);
                                v218.Destroying:Connect(function() --[[ Line: 1059 ]]
                                    -- upvalues: l_v218_Attribute_1 (copy), v36 (ref)
                                    print(l_v218_Attribute_1, "removed?");
                                    v36[l_v218_Attribute_1] = nil;
                                end);
                                l_Left_0.Bar.ImageColor3 = l_v218_Attribute_3;
                                l_Right_0.Bar.ImageColor3 = l_v218_Attribute_3;
                                v251.LocalScript.enough.SoundId = l_v218_Attribute_2;
                                v251.LocalScript.ColorCorrection.TintColor = l_v218_Attribute_3;
                                v251.LocalScript.tool.Value = v218;
                                v251.LocalScript.Enabled = true;
                            end;
                        end;
                    end;
                    return;
                end;
            end;
        end;
        l_v21_StatsFolder_0.MasteryPercentages.AllMasterys.Changed:Connect(v144);
        _G.addModeBar = v258;
        l_ModeBar_0.Visible = false;
        l_Main_0.Visible = false;
        task.spawn(function() --[[ Line: 1082 ]]
            -- upvalues: l_InputHandler_0 (copy), v95 (ref), v37 (copy), v137 (copy)
            while true do
                local _ = task.wait(0.5);
                local _ = l_InputHandler_0:GetCurrentInput();
                if v95 ~= nil and v37[v95] ~= nil then
                    for v261, v262 in pairs(v37[v95]) do
                        v137(v261, v262);
                    end;
                end;
            end;
        end);
        local function v266(v263) --[[ Line: 1094 ]] --[[ Name: GetSkillFrameFromKeyCode ]]
            -- upvalues: v95 (ref), v37 (copy)
            if v95 ~= nil and v37[v95] ~= nil then
                for _, v265 in pairs(v37[v95]) do
                    if typeof(v265) ~= "table" and v265:GetAttribute("Key") == v263.Name then
                        return v265;
                    end;
                end;
            end;
        end;
        l_UserInputService_0.InputBegan:Connect(function(v267, v268) --[[ Line: 1107 ]]
            -- upvalues: v266 (copy), l_UserInputService_0 (ref)
            if v268 then
                return;
            else
                local v269 = v266(v267.KeyCode);
                if v269 ~= nil and v269.Parent ~= nil and v269:GetAttribute("Locked") ~= true then
                    local l_Icon_2 = v269:FindFirstChild("Icon");
                    l_Icon_2.ImageColor3 = Color3.fromRGB(151, 198, 255);
                    local v271 = nil;
                    do
                        local l_v271_0 = v271;
                        l_v271_0 = l_UserInputService_0.InputEnded:Connect(function(v273, _) --[[ Line: 1116 ]]
                            -- upvalues: v267 (copy), l_v271_0 (ref), l_Icon_2 (copy)
                            if v273.KeyCode == v267.KeyCode then
                                l_v271_0:Disconnect();
                                l_v271_0 = nil;
                                l_Icon_2.ImageColor3 = Color3.fromRGB(255, 255, 255);
                            end;
                        end);
                    end;
                end;
                return;
            end;
        end);
        l_Toggle_0.MouseButton1Click:Connect(function() --[[ Line: 1129 ]]
            -- upvalues: v21 (copy), l_List_0 (copy), l_Toggle_0 (copy)
            v21.UIUtils.ButtonEffect();
            l_List_0.Visible = not l_List_0.Visible;
            l_Toggle_0.Status.Text = l_List_0.Visible == true and "Close" or "Open";
        end);
        local function v288(_) --[[ Line: 1136 ]] --[[ Name: CharacterAdded ]]
            -- upvalues: l_Main_0 (copy), v40 (copy), v38 (copy), v37 (copy), v36 (copy), l_ModeBar_0 (copy)
            l_Main_0.Visible = false;
            for v276, v277 in v40 do
                v277:Destroy();
                v40[v276] = nil;
            end;
            for _, v279 in pairs(v38) do
                if v279.SkillFrame then
                    v279.SkillFrame:Destroy();
                end;
            end;
            table.clear(v38);
            for v280, v281 in pairs(v37) do
                for _, v283 in pairs(v281) do
                    v283:Destroy();
                end;
                v37[v280] = nil;
            end;
            for v284, v285 in pairs(v36) do
                if typeof(v285) == "boolean" then
                    v36[v284] = nil;
                else
                    for v286, v287 in v285 do
                        v287:Disconnect();
                        v285[v286] = nil;
                    end;
                end;
            end;
            l_ModeBar_0.Visible = false;
            table.clear(v36);
        end;
        v288(l_LocalPlayer_0.Character or l_LocalPlayer_0.CharacterAdded:Wait());
        l_LocalPlayer_0.CharacterAdded:Connect(v288);
        v14.Initialized = true;
        return;
    end;
end;
return v14;