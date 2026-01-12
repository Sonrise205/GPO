local _ = game:GetService("SoundService");
local l_Shared_0 = game:GetService("ReplicatedStorage"):WaitForChild("Modules"):WaitForChild("Shared");
local l_DebrisService_0 = require(l_Shared_0:WaitForChild("DebrisService"));
local l_Sounds_0 = script:WaitForChild("Sounds");
local v6 = {
    Disabled = false, 
    Debug = false, 
    SetSoundsFolder = function(_, v5) --[[ Line: 20 ]] --[[ Name: SetSoundsFolder ]]
        -- upvalues: l_Sounds_0 (ref)
        l_Sounds_0 = v5;
    end
};
v6.Disable = function(_, v8) --[[ Line: 24 ]] --[[ Name: Disable ]]
    -- upvalues: v6 (copy)
    v6.Disabled = v8;
    warn(("SoundService has been %s"):format(v8 and "Disabled!" or "Enabled!"));
end;
v6.EnableDebug = function(_, v10) --[[ Line: 29 ]] --[[ Name: EnableDebug ]]
    -- upvalues: v6 (copy)
    v6.Debug = v10;
end;
v6.AdjustInstanceProperties = function(_, v12, v13) --[[ Line: 33 ]] --[[ Name: AdjustInstanceProperties ]]
    for v14, v15 in pairs(v13) do
        v12[v14] = v15;
    end;
end;
local v16 = {
    Chrous = {
        ClassName = "ChorusSoundEffect"
    }, 
    Compressor = {
        ClassName = "CompressorSoundEffect"
    }, 
    Distortion = {
        ClassName = "DistortionSoundEffect"
    }, 
    Echo = {
        ClassName = "EchoSoundEffect"
    }, 
    Equalizer = {
        ClassName = "EqualizerSoundEffect"
    }, 
    Flange = {
        ClassName = "FlangeSoundEffect"
    }, 
    PitchShift = {
        ClassName = "PitchShiftSoundEffect"
    }, 
    Reverb = {
        ClassName = "ReverbSoundEffect"
    }, 
    Tremolo = {
        ClassName = "TremoloSoundEffect"
    }
};
v6.AdjustSoundEffects = function(_, v18, v19) --[[ Line: 51 ]] --[[ Name: AdjustSoundEffects ]]
    -- upvalues: v16 (copy), v6 (copy)
    for v20, v21 in pairs(v19) do
        local v22 = v16[v20];
        local v23 = Instance.new(v22.ClassName);
        v23.Parent = v18;
        v6:AdjustInstanceProperties(v23, v21);
    end;
end;
v6.GetSoundCategory = function(_, v25) --[[ Line: 62 ]] --[[ Name: GetSoundCategory ]]
    -- upvalues: l_Sounds_0 (ref)
    local l_l_Sounds_0_FirstChild_0 = l_Sounds_0:FindFirstChild(v25);
    if l_l_Sounds_0_FirstChild_0 then
        return l_l_Sounds_0_FirstChild_0;
    else
        warn(("[SoundService]: Failed to find category with the name of (%s)!"):format(v25));
        return nil;
    end;
end;
v6.GetSound = function(_, v28, v29) --[[ Line: 73 ]] --[[ Name: GetSound ]]
    -- upvalues: l_Sounds_0 (ref)
    assert(type(v28) == "string", "Requested sound must be a string!");
    local v30 = v29.SoundCategory or nil;
    local v31 = v29.SubCategory or nil;
    local v32 = v31 ~= nil and v30 ~= nil and l_Sounds_0[v30] ~= nil and l_Sounds_0[v30][v31] ~= nil and l_Sounds_0[v30][v31]:FindFirstChild(v28) or v30 ~= nil and l_Sounds_0[v30] ~= nil and l_Sounds_0[v30]:FindFirstChild(v28) or l_Sounds_0:FindFirstChild(v28, true);
    if v32 then
        return v32;
    else
        warn(("[SoundService]: Failed to find sound with the name of (%s)!"):format(v28));
        return nil;
    end;
end;
v6.PlaySound = function(v33, v34) --[[ Line: 96 ]] --[[ Name: PlaySound ]]
    -- upvalues: v6 (copy), l_DebrisService_0 (copy), l_Sounds_0 (ref)
    assert(type(v33) == "string", "Requested sound must be a string!");
    if v6.Disabled == false then
        local _ = v34.SoundCategory or nil;
        local v36 = v34.InObject or nil;
        local v37 = v34.Location or nil;
        if v34.RandomPitch then
            if v34.Properties == nil then
                v34.Properties = {};
            end;
            v34.Properties.Pitch = math.random(90, 110) / 100;
        end;
        local v38 = v34.Properties or nil;
        local v39 = v34.SoundEffects or nil;
        local l_v6_Sound_0 = v6:GetSound(v33, v34);
        if l_v6_Sound_0 then
            local v41 = l_v6_Sound_0:Clone();
            v41.PlayOnRemove = false;
            local l_TimeLength_0 = l_v6_Sound_0.TimeLength;
            l_DebrisService_0:AddItem(v41, l_TimeLength_0 + 1);
            if v38 ~= nil then
                v6:AdjustInstanceProperties(v41, v38);
            end;
            if v39 ~= nil then
                v6:AdjustSoundEffects(v41, v39);
            end;
            if v37 then
                v36 = Instance.new("Part");
                v36.Anchored = true;
                v36.CanCollide = false;
                v36.CanQuery = false;
                v36.CanTouch = false;
                v36.Transparency = 1;
                v36.Size = Vector3.new(1, 1, 1, 0);
                v36.Name = "SFX";
                v36.CFrame = v37;
                v36.Parent = workspace.Effects;
            end;
            v41.Parent = v36 or l_Sounds_0.Debris;
            v41:Play();
            return v41;
        end;
    end;
    if v6.Debug then
        warn(v33, v34);
    end;
end;
return v6;