local _, _, _, _, _ = require(game.ReplicatedStorage.Modules.ScriptSet).get();
local l_Players_0 = game:GetService("Players");
local l_RunService_0 = game:GetService("RunService");
local _ = game:GetService("StarterPlayer");
local _ = game:GetService("ReplicatedStorage");
local _ = game:GetService("MarketplaceService");
local _ = UserSettings().GameSettings.Parent;
local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
local v12 = assert(script.Parent, "Animate script has no parent!");
local v13 = assert(if v12:IsA("Model") then v12 else nil, "Parent of Animate must be a Model!");
local v14 = assert(v13:FindFirstChildOfClass("Humanoid"), "No Humanoid object found for the Animate script to use!");
local l_Animator_0 = v14:FindFirstChildOfClass("Animator");
local v16 = v13:WaitForChild("HumanoidRootPart", 100000000000);
local v17 = nil;
local l_Y_0 = v16.Position.Y;
if not l_Animator_0 then
    l_Animator_0 = if l_RunService_0:IsServer() then Instance.new("Animator", v14) else v14:WaitForChild("Animator");
end;
local function v20(v19) --[[ Line: 40 ]] --[[ Name: keyFrameReachedFunc ]]
    -- upvalues: v13 (copy), v14 (copy), v16 (copy)
    if v13.PrimaryPart.Anchored == true then
        return;
    else
        if v19:match("step") and v14.WalkSpeed < 25 and v16.Anchored == false and v16.AssemblyLinearVelocity.Magnitude >= 3 and v16:FindFirstChildWhichIsA("BodyVelocity") == nil and _G.footstep then
            _G.footstep(v19);
        end;
        return;
    end;
end;
local function _(v21) --[[ Line: 51 ]] --[[ Name: connectNewTrack ]]
    -- upvalues: v17 (ref), v20 (copy)
    if v17 ~= nil then
        v17:Disconnect();
        v17 = nil;
    end;
    v17 = v21.KeyframeReached:Connect(v20);
end;
local v23 = {
    Animations = {}, 
    Defaults = {}, 
    Emotes = {}, 
    Callbacks = {}, 
    DidLoop = {}, 
    Dirty = {}, 
    Emotes = {
        wave = false, 
        point = false, 
        dance = true, 
        dance2 = true, 
        dance3 = true, 
        laugh = false, 
        cheer = false
    }, 
    Defaults = {
        idle = {
            {
                Id = "rbxassetid://7075728341", 
                Weight = 1
            }
        }, 
        walk = {
            {
                Id = "rbxassetid://13630769186", 
                Weight = 10
            }
        }, 
        run = {
            {
                Id = "rbxassetid://17650838050", 
                Weight = 10
            }
        }, 
        swim = {
            {
                Id = "rbxassetid://507784897", 
                Weight = 10
            }
        }, 
        swimidle = {
            {
                Id = "rbxassetid://507785072", 
                Weight = 10
            }
        }, 
        jump = {
            {
                Id = "rbxassetid://10001707271", 
                Weight = 10
            }
        }, 
        fall = {
            {
                Id = "rbxassetid://10001705684", 
                Weight = 10
            }
        }, 
        climb = {
            {
                Id = "rbxassetid://507765644", 
                Weight = 10
            }
        }, 
        sit = {
            {
                Id = "rbxassetid://2506281703", 
                Weight = 10
            }
        }, 
        toolnone = {
            {
                Id = "rbxassetid://507768375", 
                Weight = 10
            }
        }, 
        toolslash = {
            {
                Id = "rbxassetid://522635514", 
                Weight = 10
            }
        }, 
        toollunge = {
            {
                Id = "rbxassetid://522638767", 
                Weight = 10
            }
        }, 
        wave = {
            {
                Id = "rbxassetid://507770239", 
                Weight = 10
            }
        }, 
        point = {
            {
                Id = "rbxassetid://507770453", 
                Weight = 10
            }
        }, 
        dance = {
            {
                Id = "rbxassetid://507771019", 
                Weight = 10
            }, 
            {
                Id = "rbxassetid://507771955", 
                Weight = 10
            }, 
            {
                Id = "rbxassetid://507772104", 
                Weight = 10
            }
        }, 
        dance2 = {
            {
                Id = "rbxassetid://507776043", 
                Weight = 10
            }, 
            {
                Id = "rbxassetid://507776720", 
                Weight = 10
            }, 
            {
                Id = "rbxassetid://507776879", 
                Weight = 10
            }
        }, 
        dance3 = {
            {
                Id = "rbxassetid://507777268", 
                Weight = 10
            }, 
            {
                Id = "rbxassetid://507777451", 
                Weight = 10
            }, 
            {
                Id = "rbxassetid://507777623", 
                Weight = 10
            }
        }, 
        laugh = {
            {
                Id = "rbxassetid://507770818", 
                Weight = 10
            }
        }, 
        cheer = {
            {
                Id = "rbxassetid://507770677", 
                Weight = 10
            }
        }
    }
};
local function _() --[[ Line: 279 ]] --[[ Name: newAnimSet ]]
    return {
        TotalWeight = 0
    };
end;
local function _(v25, v26) --[[ Line: 283 ]] --[[ Name: registerCallback ]]
    -- upvalues: v23 (copy)
    v23.Callbacks[v25] = v26;
end;
local function _(v28) --[[ Line: 287 ]] --[[ Name: getTrackController ]]
    -- upvalues: v23 (copy)
    return assert(v23.Animations[v28], "Unknown animation name: " .. tostring(v28));
end;
local function _(v30, v31) --[[ Line: 292 ]] --[[ Name: getNumber ]]
    local l_v30_FirstChild_0 = v30:FindFirstChild(v31);
    if l_v30_FirstChild_0 and l_v30_FirstChild_0:IsA("NumberValue") then
        return l_v30_FirstChild_0.Value;
    else
        local l_v30_Attribute_0 = v30:GetAttribute(v31);
        if typeof(l_v30_Attribute_0) == "number" then
            return l_v30_Attribute_0;
        else
            return nil;
        end;
    end;
end;
local function _() --[[ Line: 307 ]] --[[ Name: getHeightScale ]]
    -- upvalues: v14 (copy)
    if not v14.AutomaticScalingEnabled then
        return 1;
    else
        local l_script_0 = script;
        local l_ScaleDampeningPercent_0 = l_script_0:FindFirstChild("ScaleDampeningPercent");
        local v37;
        if l_ScaleDampeningPercent_0 and l_ScaleDampeningPercent_0:IsA("NumberValue") then
            v37 = l_ScaleDampeningPercent_0.Value;
        else
            local l_l_script_0_Attribute_0 = l_script_0:GetAttribute("ScaleDampeningPercent");
            v37 = if typeof(l_l_script_0_Attribute_0) == "number" then l_l_script_0_Attribute_0 else nil;
        end;
        if v37 then
            return 1 + (v14.HipHeight - 2) * v37 / 2;
        else
            return v14.HipHeight / 2;
        end;
    end;
end;
local function v43(v40) --[[ Line: 321 ]] --[[ Name: loadAnimation ]]
    -- upvalues: v14 (copy), l_Animator_0 (ref), v23 (copy)
    if not v40.Track then
        local l_Animation_0 = v40.Animation;
        if l_Animation_0 == nil then
            l_Animation_0 = Instance.new("Animation");
            assert(l_Animation_0);
            l_Animation_0.AnimationId = assert(v40.Id);
            v40.Animation = l_Animation_0;
        end;
        local v42 = (if script:GetAttribute("DebugHumanoidLoadAnimation") then v14 else l_Animator_0):LoadAnimation(assert(l_Animation_0));
        v42.Priority = Enum.AnimationPriority.Core;
        v42.DidLoop:Connect(function() --[[ Line: 344 ]]
            -- upvalues: v23 (ref), v42 (copy)
            v23.DidLoop[v42] = true;
        end);
        v40.Track = v42;
    end;
    return assert(v40.Track);
end;
local function v48(v44) --[[ Line: 354 ]] --[[ Name: getAnimSetForAnimation ]]
    -- upvalues: v23 (copy)
    local l_Parent_1 = v44.Parent;
    if l_Parent_1 and l_Parent_1:IsA("StringValue") then
        if l_Parent_1.Parent ~= script then
            return;
        else
            local l_Name_0 = l_Parent_1.Name;
            local v47 = v23.Animations[l_Name_0];
            if not v47 then
                v47 = {
                    DefaultSet = {
                        TotalWeight = 0
                    }, 
                    CustomSet = {
                        TotalWeight = 0
                    }
                };
                v23.Animations[l_Name_0] = v47;
            end;
            return v47.CustomSet;
        end;
    else
        return nil;
    end;
end;
local function v58(v49) --[[ Line: 380 ]] --[[ Name: rollAnimation ]]
    -- upvalues: v43 (copy)
    local v50 = if #v49.CustomSet == 0 then v49.DefaultSet else v49.CustomSet;
    if #v50 == 1 then
        local v51 = v50[1];
        return v43(v51), false;
    elseif #v50 == 0 then
        return nil, nil;
    else
        local v52 = assert(v50.TotalWeight);
        local v53 = math.random() * v52;
        local v54 = 0;
        local v55 = 1;
        while true do
            if v54 < v52 then
                local v56 = assert(v50[v55]);
                local v57 = v54 + v56.Weight;
                if v54 <= v53 and v53 < v57 then
                    return v43(v56), true;
                else
                    v55 = v55 + 1;
                    v54 = v57;
                end;
            else
                return nil, nil;
            end;
        end;
    end;
end;
local function _() --[[ Line: 413 ]] --[[ Name: canEmote ]]
    -- upvalues: v14 (copy)
    local l_MoveDirection_0 = v14.MoveDirection;
    local l_v14_State_0 = v14:GetState();
    if l_MoveDirection_0 ~= Vector3.new(0, 0, 0, 0) then
        return false;
    elseif l_v14_State_0 ~= Enum.HumanoidStateType.Running then
        return false;
    else
        return true;
    end;
end;
local function v68(v62) --[[ Line: 431 ]] --[[ Name: checkAnimationAdded ]]
    -- upvalues: v48 (copy), v43 (copy)
    if v62:IsA("Animation") then
        local v63 = v48(v62);
        if v63 then
            local l_Weight_0 = v62:FindFirstChild("Weight");
            local v65;
            if l_Weight_0 and l_Weight_0:IsA("NumberValue") then
                v65 = l_Weight_0.Value;
            else
                local l_v62_Attribute_0 = v62:GetAttribute("Weight");
                v65 = if typeof(l_v62_Attribute_0) == "number" then l_v62_Attribute_0 else nil;
            end;
            local v67 = v65 or 1;
            v63.TotalWeight = v63.TotalWeight + v67;
            v65 = {
                Id = v62.AnimationId, 
                Animation = v62, 
                Weight = v67
            };
            v43(v65);
            table.insert(v63, v65);
        end;
    end;
end;
local function v74(v69) --[[ Line: 451 ]] --[[ Name: checkAnimationRemoving ]]
    -- upvalues: v48 (copy)
    if v69:IsA("Animation") then
        local v70 = v48(v69);
        if v70 then
            local v71 = nil;
            for v72, v73 in ipairs(v70) do
                if v73.Animation == v69 then
                    v70.TotalWeight = v70.TotalWeight - v73.Weight;
                    v71 = v72;
                    break;
                end;
            end;
            if v71 then
                table.remove(v70, v71);
            end;
        end;
    end;
end;
for v75, v76 in v23.Defaults do
    local v77 = {
        TotalWeight = 0
    };
    for _, v79 in v76 do
        v77.TotalWeight = v77.TotalWeight + v79.Weight;
        table.insert(v77, v79);
        v43(v79);
    end;
    v23.Animations[v75] = {
        DefaultSet = v77, 
        CustomSet = {
            TotalWeight = 0
        }
    };
end;
for _, v81 in script:GetDescendants() do
    v68(v81);
end;
script.DescendantAdded:Connect(v68);
script.DescendantRemoving:Connect(v74);
local v82 = nil;
local v83 = nil;
local v84 = 0;
local v85 = 0;
local function v86() --[[ Line: 510 ]] --[[ Name: onJumping ]]
    -- upvalues: v84 (ref)
    v84 = tick() + 0.4;
end;
local function v88() --[[ Line: 514 ]] --[[ Name: onFreefall ]]
    -- upvalues: v84 (ref), v23 (copy)
    local v87 = if tick() < v84 then assert(v23.Animations.jump, "Unknown animation name: " .. tostring("jump")) else assert(v23.Animations.fall, "Unknown animation name: " .. tostring("fall"));
    v87.Weight = 1;
    v87.FadeTime = 0.1;
end;
local function v90() --[[ Line: 525 ]] --[[ Name: onSeated ]]
    -- upvalues: v23 (copy)
    local v89 = assert(v23.Animations.sit, "Unknown animation name: " .. tostring("sit"));
    v89.FadeTime = 0.4;
    v89.Weight = 1;
    v89.Speed = 0;
end;
local function v94() --[[ Line: 532 ]] --[[ Name: onClimbing ]]
    -- upvalues: v14 (copy), v23 (copy)
    local l_RootPart_0 = v14.RootPart;
    local v92 = 0;
    if l_RootPart_0 then
        v92 = l_RootPart_0.AssemblyLinearVelocity.Y / 5;
    end;
    local v93 = assert(v23.Animations.climb, "Unknown animation name: " .. tostring("climb"));
    v93.Speed = v92;
    v93.Weight = 1;
end;
local function v99() --[[ Line: 546 ]] --[[ Name: onSwimming ]]
    -- upvalues: v14 (copy), v23 (copy)
    local l_RootPart_1 = v14.RootPart;
    local v96 = 0;
    if l_RootPart_1 then
        v96 = l_RootPart_1.AssemblyLinearVelocity.Magnitude;
    end;
    local v97 = assert(v23.Animations.swim, "Unknown animation name: " .. tostring("swim"));
    v97.FadeTime = 0.4;
    local v98 = assert(v23.Animations.swimidle, "Unknown animation name: " .. tostring("swimidle"));
    v98.FadeTime = 0.4;
    if v96 > 1 then
        v97.Speed = v96 / 10;
        v97.Weight = 1;
        return;
    else
        v98.Weight = 1;
        return;
    end;
end;
local function v122() --[[ Line: 569 ]] --[[ Name: onRunning ]]
    -- upvalues: v14 (copy), v23 (copy), v17 (ref), v20 (copy)
    local l_RootPart_2 = v14.RootPart;
    local v101 = nil;
    local v102 = nil;
    if l_RootPart_2 then
        local v103 = l_RootPart_2.Size.Y / 2;
        local l_HipHeight_0 = v14.HipHeight;
        local v105 = Vector3.new(0, 1, 0, 0) * (l_HipHeight_0 + v103);
        local _ = l_RootPart_2.Position - v105;
        local l_AssemblyLinearVelocity_0 = l_RootPart_2.AssemblyLinearVelocity;
        local l_CFrame_0 = l_RootPart_2.CFrame;
        local v109 = l_CFrame_0.RightVector:Dot(l_AssemblyLinearVelocity_0);
        local v110 = l_CFrame_0.LookVector:Dot(l_AssemblyLinearVelocity_0);
        v102 = Vector2.new(v109, v110).Magnitude;
    else
        v101 = Vector2.zero;
        v102 = 0;
    end;
    local v111;
    if not v14.AutomaticScalingEnabled then
        v111 = 1;
    else
        local l_script_1 = script;
        local l_ScaleDampeningPercent_1 = l_script_1:FindFirstChild("ScaleDampeningPercent");
        local v114;
        if l_ScaleDampeningPercent_1 and l_ScaleDampeningPercent_1:IsA("NumberValue") then
            v114 = l_ScaleDampeningPercent_1.Value;
        else
            local l_l_script_1_Attribute_0 = l_script_1:GetAttribute("ScaleDampeningPercent");
            v114 = if typeof(l_l_script_1_Attribute_0) == "number" then l_l_script_1_Attribute_0 else nil;
        end;
        v111 = if v114 then 1 + (v14.HipHeight - 2) * v114 / 2 else v14.HipHeight / 2;
    end;
    if v111 / 2 < v102 then
        local v116 = v102 / 12.8 / v111;
        local v117 = (v116 - 0.5) / 0.5;
        local v118 = assert(v23.Animations.run, "Unknown animation name: " .. tostring("run"));
        v118.Speed = math.max(1, (math.log(v117 + 1)));
        v118.Weight = math.clamp(v117, 1.0E-4, 1);
        local v119 = if v118.Weight == 1.0E-4 then v116 / 0.5 else 1 - v117;
        local v120 = assert(v23.Animations.walk, "Unknown animation name: " .. tostring("walk"));
        v120.Weight = math.clamp(v119, 1.0E-4, 1);
        if v120.ActiveTrack then
            local l_ActiveTrack_0 = v120.ActiveTrack;
            if v17 ~= nil then
                v17:Disconnect();
                v17 = nil;
            end;
            v17 = l_ActiveTrack_0.KeyframeReached:Connect(v20);
            return;
        end;
    else
        assert(v23.Animations.idle, "Unknown animation name: " .. tostring("idle")).Weight = 1;
    end;
end;
local function v127(v123) --[[ Line: 677 ]] --[[ Name: onChatted ]]
    -- upvalues: v23 (copy), v14 (copy), v83 (ref)
    local v124 = nil;
    if v123:sub(1, 3) == "/e " then
        v124 = v123:sub(4);
    elseif v123:sub(1, 7) == "/emote " then
        v124 = v123:sub(8);
    end;
    if v23.Emotes[v124] ~= nil then
        local l_MoveDirection_1 = v14.MoveDirection;
        local l_v14_State_1 = v14:GetState();
        if l_MoveDirection_1 == Vector3.new(0, 0, 0, 0) and l_v14_State_1 == Enum.HumanoidStateType.Running then
            v83 = v124;
        end;
    end;
end;
v14.Jumping:Connect(v86);
if l_LocalPlayer_0 then
    game.TextChatService.emote.Triggered:Connect(function(_, v129) --[[ Line: 695 ]]
        -- upvalues: v127 (copy)
        local _ = Instance.new("TextChatMessageProperties");
        v127(v129);
    end);
end;
local l_Seated_0 = Enum.HumanoidStateType.Seated;
v23.Callbacks[l_Seated_0] = v90;
l_Seated_0 = Enum.HumanoidStateType.Running;
v23.Callbacks[l_Seated_0] = v122;
l_Seated_0 = Enum.HumanoidStateType.Climbing;
v23.Callbacks[l_Seated_0] = v94;
l_Seated_0 = Enum.HumanoidStateType.Freefall;
v23.Callbacks[l_Seated_0] = v88;
l_Seated_0 = Enum.HumanoidStateType.Swimming;
v23.Callbacks[l_Seated_0] = v99;
assert(l_Animator_0);
l_Seated_0 = function(v132) --[[ Line: 732 ]] --[[ Name: updateToolAnimation ]]
    -- upvalues: v82 (ref), v85 (ref), v14 (copy), v23 (copy)
    local v133 = tick();
    local v134 = "toolnone";
    local l_toolanim_0 = v132:FindFirstChild("toolanim");
    if l_toolanim_0 and l_toolanim_0:IsA("StringValue") then
        v82 = l_toolanim_0.Value;
        v85 = v133 + 0.3;
        l_toolanim_0.Parent = nil;
    end;
    if v133 < v85 then
        if v82 == "Slash" then
            v134 = "toolslash";
        elseif v82 == "Lunge" and not v14.Sit then
            v134 = "toollunge";
        end;
    elseif v82 then
        v82 = nil;
    end;
    local l_v134_0 = v134;
    local v137 = assert(v23.Animations[l_v134_0], "Unknown animation name: " .. tostring(l_v134_0));
    v137.Priority = Enum.AnimationPriority.Action;
    v137.FadeTime = 0.1;
    v137.Weight = 1;
end;
local function v155() --[[ Line: 759 ]] --[[ Name: updateAnimations ]]
    -- upvalues: v13 (copy), l_Seated_0 (copy), v83 (ref), v14 (copy), v23 (copy), v58 (copy), l_Y_0 (ref), v16 (copy)
    local v138 = false;
    local l_Tool_0 = v13:FindFirstChildWhichIsA("Tool");
    if l_Tool_0 and l_Tool_0.RequiresHandle then
        l_Seated_0(l_Tool_0);
    end;
    local v140, v141;
    if v83 then
        v141 = v14.MoveDirection;
        local l_v14_State_2 = v14:GetState();
        if v141 == Vector3.new(0, 0, 0, 0) and l_v14_State_2 == Enum.HumanoidStateType.Running then
            v141 = v83;
            assert(v23.Animations[v141], "Unknown animation name: " .. tostring(v141)).Weight = 1;
            v138 = true;
        end;
    end;
    if not v138 then
        v140 = v14:GetState();
        v141 = v23.Callbacks[v140];
        if v141 then
            v141();
        end;
        v83 = nil;
    end;
    v138 = false;
    for _, v144 in v23.Animations do
        local l_Speed_0 = v144.Speed;
        local l_Weight_1 = v144.Weight;
        local l_FadeTime_0 = v144.FadeTime;
        local l_ActiveTrack_1 = v144.ActiveTrack;
        if l_Speed_0 or l_Weight_1 then
            local v149 = if l_ActiveTrack_1 then l_ActiveTrack_1.IsPlaying else false;
            local v150 = nil;
            local _ = nil;
            if v149 and l_ActiveTrack_1 and v23.DidLoop[l_ActiveTrack_1] then
                local v152, v153 = v58(v144);
                v150 = v152;
                if v153 then
                    v149 = false;
                end;
                v23.DidLoop[l_ActiveTrack_1] = nil;
            end;
            if not v149 then
                if l_ActiveTrack_1 and l_ActiveTrack_1 ~= v150 then
                    l_ActiveTrack_1:Stop(l_FadeTime_0 or 0.2);
                end;
                l_ActiveTrack_1 = v150 or v58(v144);
                v144.ActiveTrack = l_ActiveTrack_1;
            end;
            if l_ActiveTrack_1 then
                assert(l_ActiveTrack_1);
                if l_ActiveTrack_1.IsPlaying then
                    local l_Priority_0 = v144.Priority;
                    if l_Speed_0 then
                        v144.Speed = nil;
                        if math.abs(l_Speed_0 - l_ActiveTrack_1.Speed) > 0.01 then
                            l_ActiveTrack_1:AdjustSpeed(l_Speed_0);
                        end;
                    end;
                    if l_Weight_1 then
                        v144.Weight = nil;
                        if l_Weight_1 == 1.0E-4 and l_ActiveTrack_1.WeightTarget ~= 1.0E-4 then
                            l_ActiveTrack_1:AdjustWeight(1.0E-4);
                        elseif math.abs(l_Weight_1 - l_ActiveTrack_1.WeightTarget) > 0.01 then
                            l_ActiveTrack_1:AdjustWeight(l_Weight_1);
                        end;
                    end;
                    if l_Priority_0 then
                        l_ActiveTrack_1.Priority = l_Priority_0;
                        v144.Priority = nil;
                    end;
                else
                    l_ActiveTrack_1.TimePosition = 0;
                    l_ActiveTrack_1:Play(l_FadeTime_0 or 0.2, l_Weight_1 or 1, l_Speed_0 or 1);
                end;
            else
                continue;
            end;
        elseif l_ActiveTrack_1 and l_ActiveTrack_1.IsPlaying then
            l_ActiveTrack_1:Stop(l_FadeTime_0 or 0.2);
        end;
        if l_FadeTime_0 then
            v144.FadeTime = nil;
        end;
    end;
    if v14.FloorMaterial == Enum.Material.Air and l_Y_0 < v16.Position.Y then
        l_Y_0 = v16.Position.Y;
    end;
end;
l_RunService_0.Heartbeat:Connect(v155);
local v156 = v14:LoadAnimation(script.LandAnim);
v156.Priority = Enum.AnimationPriority.Action;
local v157 = 0;
v14.StateChanged:Connect(function(v158) --[[ Line: 873 ]]
    -- upvalues: v13 (copy), v14 (copy), l_Y_0 (ref), v16 (copy), v157 (ref), v156 (copy)
    if v158 == Enum.HumanoidStateType.Landed then
        local v159 = tick();
        local v160 = nil;
        local v161 = nil;
        local v162 = nil;
        while true do
            local v163, v164, v165 = _G.getRayFloor(v13.PrimaryPart.CFrame, v14.HipHeight + v13.PrimaryPart.Size.Y / 2 + 0.2);
            v160 = v163;
            v161 = v164;
            v162 = v165;
            if not v160 then
                task.wait();
                if v160 ~= nil or tick() - v159 >= 0.1 then
                    break;
                end;
            else
                break;
            end;
        end;
        if l_Y_0 - v16.Position.Y >= 10 and tick() - v157 >= 0.05 and _G.canuse == true then
            v157 = tick();
            _G.footstep("land");
            v156:Play();
        end;
        l_Y_0 = v16.Position.Y;
    end;
end);