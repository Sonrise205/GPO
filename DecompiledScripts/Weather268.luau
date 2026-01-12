local v0 = {};
local _ = require(game.ReplicatedStorage.Modules.Rain);
local _ = _G.getEffect("StormLightning");
local function v7(v3, v4) --[[ Line: 6 ]] --[[ Name: tweeneffect ]]
    local v5 = {};
    if v4:IsA("Atmosphere") then
        return;
    else
        v5 = if v4:IsA("BlurEffect") then {
            Size = v4.Size
        } else if v4:IsA("DepthOfFieldEffect") then {
            FarIntensity = v4.FarIntensity, 
            FocusDistance = v4.FocusDistance, 
            InFocusRadius = v4.InFocusRadius, 
            NearIntensity = v4.NearIntensity
        } else {
            Brightness = v4.Brightness, 
            Contrast = v4.Contrast, 
            Saturation = v4.Saturation, 
            TintColor = v4.TintColor
        };
        local v6 = TweenInfo.new(0.25, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, false, 0);
        game:GetService("TweenService"):Create(v3, v6, v5):Play();
        return;
    end;
end;
local function v11(v8) --[[ Line: 32 ]] --[[ Name: disableparticle ]]
    local l_v8_Children_0 = v8:GetChildren();
    for v10 = 1, #l_v8_Children_0 do
        if l_v8_Children_0[v10]:IsA("ParticleEmitter") then
            l_v8_Children_0[v10].Enabled = false;
        end;
    end;
end;
local function v15(v12) --[[ Line: 41 ]] --[[ Name: lightingprops ]]
    local v13 = {
        FogColor = v12.FogColor.Value, 
        FogEnd = v12.FogEnd.Value, 
        FogStart = v12.FogStart.Value
    };
    local v14 = TweenInfo.new(3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, false, 0);
    game:GetService("TweenService"):Create(game.Lighting, v14, v13):Play();
end;
v0.set = function(_, v17, v18) --[[ Line: 51 ]] --[[ Name: set ]]
    -- upvalues: v7 (copy), v11 (copy), v15 (copy)
    if script:FindFirstChild(v17) == nil then
        return;
    else
        local l_script_Children_0 = script:GetChildren();
        for v20 = 1, #l_script_Children_0 do
            if l_script_Children_0[v20].Name ~= v17 and l_script_Children_0[v20]:FindFirstChild("sfx") and l_script_Children_0[v20].sfx.IsPlaying == true then
                l_script_Children_0[v20].sfx:Stop();
            end;
        end;
        local l_Children_0 = script[v17]:GetChildren();
        for v22 = 1, #l_Children_0 do
            if game.Lighting:FindFirstChild(l_Children_0[v22].Name) then
                v7(game.Lighting:FindFirstChild(l_Children_0[v22].Name), l_Children_0[v22]);
            end;
        end;
        if script[v17]:FindFirstChild("WeatherFollow") ~= nil then
            script[v17]:FindFirstChild("WeatherFollow"):Clone().Parent = workspace.Effects;
        end;
        if script[v17]:FindFirstChild("WeatherFollow") == nil and workspace.Effects:FindFirstChild("WeatherFollow") then
            local l_WeatherFollow_0 = workspace.Effects:FindFirstChild("WeatherFollow");
            _G.destroy(l_WeatherFollow_0, 5);
            v11(l_WeatherFollow_0);
            l_WeatherFollow_0.Name = "weatherfollowdisabled";
        end;
        if script[v17]:FindFirstChild("sfx") and script[v17].sfx.IsPlaying == false then
            script[v17].sfx.SoundGroup = game.SoundService.Music;
            script[v17].sfx:Play();
        end;
        if script[v17]:FindFirstChild("LightingProps") then
            v15(script[v17]:FindFirstChild("LightingProps"));
        end;
        if script[v17]:FindFirstChild("Clouds") then
            _G.tween(workspace.Terrain.Clouds, {
                1, 
                Enum.EasingStyle.Quad, 
                Enum.EasingDirection.Out, 
                0, 
                false, 
                0
            }, {
                Density = script[v17].Clouds.Density, 
                Cover = script[v17].Clouds.Cover
            });
        end;
        if script[v17]:FindFirstChild("Atmosphere") then
            _G.tween(game.Lighting.Atmosphere, {
                1, 
                Enum.EasingStyle.Quad, 
                Enum.EasingDirection.Out, 
                0, 
                false, 
                0
            }, {
                Color = script[v17].Atmosphere.Color, 
                Decay = script[v17].Atmosphere.Decay, 
                Glare = script[v17].Atmosphere.Glare, 
                Offset = script[v17].Atmosphere.Offset, 
                Density = script[v17].Atmosphere.Density, 
                Haze = script[v17].Atmosphere.Haze
            });
        end;
        local _ = {
            Scale = Vector3.new(script[v17]:FindFirstChild("LightingProps").FogEnd.Value, script[v17]:FindFirstChild("LightingProps").FogEnd.Value, script[v17]:FindFirstChild("LightingProps").FogEnd.Value)
        };
        local _ = TweenInfo.new(0.25, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, false, 0);
        if v18:FindFirstChild("Mesh") then

        end;
        task.spawn(function() --[[ Line: 109 ]]
            -- upvalues: v17 (copy)
            local v26 = {
                FocusDistance = 200
            };
            local v27 = TweenInfo.new(3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, false, 0);
            local _ = game:GetService("TweenService"):Create(game.Lighting.DepthOfFieldF, v27, v26);
            local v29 = {
                FocusDistance = script[v17].DepthOfFieldF.FocusDistance
            };
            local v30 = TweenInfo.new(3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, false, 0);
            local _ = game:GetService("TweenService"):Create(game.Lighting.DepthOfFieldF, v30, v29);
            local v32 = {
                FogStart = script[v17].LightingProps.FogStart.Value + 50
            };
            local v33 = TweenInfo.new(3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, false, 0);
            local _ = game:GetService("TweenService"):Create(game.Lighting, v33, v32);
            local v35 = {
                FogStart = script[v17].LightingProps.FogStart.Value
            };
            local v36 = TweenInfo.new(3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, false, 0);
            local _ = game:GetService("TweenService"):Create(game.Lighting, v36, v35);
            local l_Brightness_0 = script[v17].ColorCorrectionF.Brightness;
            if l_Brightness_0 < -0.001 then
                l_Brightness_0 = l_Brightness_0 + 0.2;
            end;
            if script[v17].ColorCorrectionF.Brightness < l_Brightness_0 then
                l_Brightness_0 = script[v17].ColorCorrectionF.Brightness;
            end;
            local v39 = {
                Brightness = l_Brightness_0
            };
            local v40 = TweenInfo.new(3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, false, 0);
            local _ = game:GetService("TweenService"):Create(game.Lighting.ColorCorrectionF, v40, v39);
            local v42 = {
                Brightness = script[v17].ColorCorrectionF.Brightness
            };
            local v43 = TweenInfo.new(3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, false, 0);
            game:GetService("TweenService"):Create(game.Lighting.ColorCorrectionF, v43, v42):Play();
            local _ = tick();
        end);
        _G.currentweather = v17;
        _G.weatherfolder = script[v17];
        return;
    end;
end;
return v0;