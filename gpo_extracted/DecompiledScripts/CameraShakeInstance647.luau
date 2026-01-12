local v0 = {};
v0.__index = v0;
local l_new_0 = Vector3.new;
local l_noise_0 = math.noise;
v0.CameraShakeState = {
    FadingIn = 0, 
    FadingOut = 1, 
    Sustained = 2, 
    Inactive = 3
};
v0.new = function(v3, v4, v5, v6) --[[ Line: 20 ]] --[[ Name: new ]]
    -- upvalues: l_new_0 (copy), v0 (copy)
    if v5 == nil then
        v5 = 0;
    end;
    if v6 == nil then
        v6 = 0;
    end;
    assert(type(v3) == "number", "Magnitude must be a number");
    assert(type(v4) == "number", "Roughness must be a number");
    assert(type(v5) == "number", "FadeInTime must be a number");
    assert(type(v6) == "number", "FadeOutTime must be a number");
    return (setmetatable({
        Magnitude = v3, 
        Roughness = v4, 
        PositionInfluence = l_new_0(), 
        RotationInfluence = l_new_0(), 
        DeleteOnInactive = true, 
        roughMod = 1, 
        magnMod = 1, 
        fadeOutDuration = v6, 
        fadeInDuration = v5, 
        sustain = v5 > 0, 
        currentFadeTime = v5 > 0 and 0 or 1, 
        tick = Random.new():NextNumber(-100, 100), 
        _camShakeInstance = true
    }, v0));
end;
v0.UpdateShake = function(v7, v8) --[[ Line: 51 ]] --[[ Name: UpdateShake ]]
    -- upvalues: l_noise_0 (copy), l_new_0 (copy)
    local l_tick_0 = v7.tick;
    local l_currentFadeTime_0 = v7.currentFadeTime;
    local v11 = l_new_0(l_noise_0(l_tick_0, 0) * 0.5, l_noise_0(0, l_tick_0) * 0.5, l_noise_0(l_tick_0, l_tick_0) * 0.5);
    if v7.fadeInDuration > 0 and v7.sustain then
        if l_currentFadeTime_0 < 1 then
            l_currentFadeTime_0 = l_currentFadeTime_0 + v8 / v7.fadeInDuration;
        elseif v7.fadeOutDuration > 0 then
            v7.sustain = false;
        end;
    end;
    if not v7.sustain then
        l_currentFadeTime_0 = l_currentFadeTime_0 - v8 / v7.fadeOutDuration;
    end;
    if v7.sustain then
        v7.tick = l_tick_0 + v8 * v7.Roughness * v7.roughMod;
    else
        v7.tick = l_tick_0 + v8 * v7.Roughness * v7.roughMod * l_currentFadeTime_0;
    end;
    v7.currentFadeTime = l_currentFadeTime_0;
    return v11 * v7.Magnitude * v7.magnMod * l_currentFadeTime_0;
end;
v0.StartFadeOut = function(v12, v13) --[[ Line: 87 ]] --[[ Name: StartFadeOut ]]
    if v13 == 0 then
        v12.currentFadeTime = 0;
    end;
    v12.fadeOutDuration = v13;
    v12.fadeInDuration = 0;
    v12.sustain = false;
end;
v0.StartFadeIn = function(v14, v15) --[[ Line: 97 ]] --[[ Name: StartFadeIn ]]
    if v15 == 0 then
        v14.currentFadeTime = 1;
    end;
    v14.fadeInDuration = v15 or v14.fadeInDuration;
    v14.fadeOutDuration = 0;
    v14.sustain = true;
end;
v0.GetScaleRoughness = function(v16) --[[ Line: 107 ]] --[[ Name: GetScaleRoughness ]]
    return v16.roughMod;
end;
v0.SetScaleRoughness = function(v17, v18) --[[ Line: 112 ]] --[[ Name: SetScaleRoughness ]]
    v17.roughMod = v18;
end;
v0.GetScaleMagnitude = function(v19) --[[ Line: 117 ]] --[[ Name: GetScaleMagnitude ]]
    return v19.magnMod;
end;
v0.SetScaleMagnitude = function(v20, v21) --[[ Line: 122 ]] --[[ Name: SetScaleMagnitude ]]
    v20.magnMod = v21;
end;
v0.GetNormalizedFadeTime = function(v22) --[[ Line: 127 ]] --[[ Name: GetNormalizedFadeTime ]]
    return v22.currentFadeTime;
end;
v0.IsShaking = function(v23) --[[ Line: 132 ]] --[[ Name: IsShaking ]]
    local v24 = true;
    if v23.currentFadeTime <= 0 then
        v24 = v23.sustain;
    end;
    return v24;
end;
v0.IsFadingOut = function(v25) --[[ Line: 137 ]] --[[ Name: IsFadingOut ]]
    return not v25.sustain and v25.currentFadeTime > 0;
end;
v0.IsFadingIn = function(v26) --[[ Line: 142 ]] --[[ Name: IsFadingIn ]]
    local v27 = false;
    if v26.currentFadeTime < 1 then
        v27 = v26.sustain and v26.fadeInDuration > 0;
    end;
    return v27;
end;
v0.GetState = function(v28) --[[ Line: 147 ]] --[[ Name: GetState ]]
    -- upvalues: v0 (copy)
    if v28:IsFadingIn() then
        return v0.CameraShakeState.FadingIn;
    elseif v28:IsFadingOut() then
        return v0.CameraShakeState.FadingOut;
    elseif v28:IsShaking() then
        return v0.CameraShakeState.Sustained;
    else
        return v0.CameraShakeState.Inactive;
    end;
end;
return v0;