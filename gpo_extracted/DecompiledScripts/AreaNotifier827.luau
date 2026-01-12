local _, _, _, _, _ = require(game.ReplicatedStorage.Modules.ScriptSet).get(true);
local v5 = require(game.ReplicatedStorage.Util.Area.Area);
_G.currentisland = "";
_G.currentweather = "";
_G.weatherfolder = nil;
if _G.areaParent == nil then
    _G.areaParent = workspace.Effects.Areas;
end;
local v6 = "First Sea";
if game.ReplicatedStorage:FindFirstChild("2ndSea") then
    v6 = "Second Sea";
end;
workspace:WaitForChild("Env"):WaitForChild("WaterStuff");
local v7 = game.ReplicatedStorage.Util.Area.Fog:Clone();
v7.Parent = workspace.CurrentCamera;
v7:WaitForChild("Mesh");
if _G.themeSong then
    _G.themeSong:Stop();
end;
local function v16() --[[ Line: 33 ]] --[[ Name: updateSounds ]]
    local l_Children_0 = workspace.Islands:GetChildren();
    for v9 = 1, #l_Children_0 do
        if l_Children_0[v9]:FindFirstChild("Settings") and l_Children_0[v9].Settings:GetAttribute("ThemeID") then
            local v10 = script.Folder.CalmNightCricketsAmb:Clone();
            v10.Name = l_Children_0[v9].Name;
            local l_Attribute_0 = l_Children_0[v9].Settings:GetAttribute("ThemeID");
            if tonumber(l_Attribute_0) ~= nil then
                l_Attribute_0 = "rbxassetid://" .. l_Attribute_0;
            end;
            v10.SoundId = l_Attribute_0;
            v10.Volume = 0.25;
            v10.Parent = game.ReplicatedStorage.Assets.IslandMusic;
        end;
    end;
    local l_Children_1 = game.ReplicatedStorage.Assets.IslandMusic:GetChildren();
    local l_Children_2 = game.ReplicatedStorage.Util.SeaSounds:GetChildren();
    for v14 = 1, #l_Children_2 do
        table.insert(l_Children_1, l_Children_2[v14]);
    end;
    for v15 = 1, #l_Children_1 do
        if l_Children_1[v15]:IsA("Sound") and _G.allThemeIDs[l_Children_1[v15].Name] == nil then
            _G.allThemeIDs[l_Children_1[v15].Name] = {
                id = l_Children_1[v15].SoundId, 
                volume = l_Children_1[v15].Volume
            };
            l_Children_1[v15]:Destroy();
        end;
    end;
end;
local function v21() --[[ Line: 74 ]] --[[ Name: updateCustomAreaSounds ]]
    local l_Children_3 = _G.areaParent:GetChildren();
    for v18 = 1, #l_Children_3 do
        local v19 = l_Children_3[v18];
        if v19:FindFirstChild("Settings") and v19.Settings:GetAttribute("ThemeID") then
            local l_Attribute_1 = v19.Settings:GetAttribute("ThemeID");
            if tonumber(l_Attribute_1) ~= nil then
                l_Attribute_1 = "rbxassetid://" .. l_Attribute_1;
            end;
            if _G.allThemeIDs[v19.Name] == nil then
                _G.allThemeIDs[v19.Name] = {
                    id = l_Attribute_1, 
                    volume = 0.5
                };
            end;
        end;
    end;
end;
if _G.allThemeIDs == nil then
    _G.allThemeIDs = {};
    v16();
end;
v21();
_G.themeSong = nil;
workspace:WaitForChild("Islands");
while true do
    task.wait();
    if _G.tween and game.ReplicatedStorage.reservedCode.Value ~= "checking" then
        local function _(v22, v23, v24) --[[ Line: 101 ]] --[[ Name: textnote ]]
            if game.ReplicatedStorage.reservedCode.Value == "arena" then
                return;
            else
                task.spawn(function() --[[ Line: 105 ]]
                    -- upvalues: v22 (copy), v24 (copy), v23 (copy)
                    repeat
                        task.wait();
                    until game.Players.LocalPlayer.PlayerGui:FindFirstChild("IslandNote") == nil;
                    if _G.currentisland ~= v22 then
                        return;
                    else
                        local v25 = game.ReplicatedStorage.Util.Area.IslandNote:Clone();
                        v25.Parent = game.Players.LocalPlayer.PlayerGui;
                        v25.Frame.NameFrame.TextLabel.Text = v22;
                        if v24 then
                            v25.Frame.DescFrame.TextLabel.TextColor3 = v24;
                        end;
                        v25.Frame.DescFrame.TextLabel.Text = v23;
                        v25.Frame.LocalScript.Disabled = false;
                        game.ReplicatedStorage.Util.Area.notification:Play();
                        return;
                    end;
                end);
                return;
            end;
        end;
        local function _(v27, v28) --[[ Line: 123 ]] --[[ Name: disableparticle ]]
            local l_v27_Children_0 = v27:GetChildren();
            for v30 = 1, #l_v27_Children_0 do
                if l_v27_Children_0[v30]:IsA("ParticleEmitter") then
                    if v28 == nil then
                        l_v27_Children_0[v30].Enabled = false;
                    else
                        l_v27_Children_0[v30].Enabled = v28;
                    end;
                end;
            end;
        end;
        local v32 = require(game.ReplicatedStorage.Modules.Weather);
        local _ = tick();
        local v34 = require(game.ReplicatedStorage.Modules.Rain);
        local function v35() --[[ Line: 141 ]] --[[ Name: resetrain ]]
            -- upvalues: v34 (copy)
            v34:SetIntensityRatio(1);
            v34:SetTransparency(0);
            v34:SetDirection((Vector3.new(0, -1, 0, 0)));
            v34:SetColor(Color3.fromRGB(255, 255, 255));
            v34:SetVolume(0);
        end;
        local function v37(v36) --[[ Line: 150 ]] --[[ Name: rain ]]
            -- upvalues: v35 (copy), v34 (copy)
            v35();
            v34:SetStraightTexture("rbxassetid://1822883048");
            v34:SetTopDownTexture("rbxassetid://1822856633");
            v34:SetSplashTexture("rbxassetid://1822856633");
            v34:SetSoundId("rbxassetid://11157690509");
            v34:SetVolume(0.5);
            if v36 and v36:FindFirstChild("Settings") then
                v34:SetIntensityRatio(v36.Settings.WeatherIntensity.Value);
            end;
            v34:Enable();
        end;
        local function v39(_) --[[ Line: 165 ]] --[[ Name: thunderstorm ]]
            -- upvalues: v35 (copy), v34 (copy)
            v35();
            if _G.fastmode == false then
                v34:SetStraightTexture("rbxassetid://1822883048");
                v34:SetTopDownTexture("rbxassetid://1822856633");
                v34:SetSplashTexture("rbxassetid://1822856633");
                v34:SetSoundId("rbxassetid://9941973365");
                v34:SetVolume(0.2);
                v34:Enable();
            end;
        end;
        local _ = function(_) --[[ Line: 180 ]] --[[ Name: snow ]]
            -- upvalues: v35 (copy)
            v35();
        end;
        local _ = function(_) --[[ Line: 197 ]] --[[ Name: snowy ]]
            -- upvalues: v35 (copy)
            v35();
        end;
        local _ = function(_) --[[ Line: 204 ]] --[[ Name: dust ]]
            -- upvalues: v35 (copy)
            v35();
        end;
        local function v52(v46, v47) --[[ Line: 220 ]] --[[ Name: special_weather ]]
            -- upvalues: v37 (copy), v35 (copy), v39 (copy), v34 (copy)
            local l_status_0, l_result_0 = pcall(function() --[[ Line: 221 ]]
                -- upvalues: v46 (copy), v37 (ref), v47 (copy), v35 (ref), v39 (ref), v34 (ref)
                if v46 == "Rain" then
                    v37(v47);
                    return;
                elseif v46 == "Snow" then
                    local _ = v47;
                    v35();
                    return;
                elseif v46 == "Dust" then
                    local _ = v47;
                    v35();
                    return;
                elseif v46 == "ThunderStorm" then
                    v39(v47);
                    return;
                elseif v46 == "Snowy" then
                    v35();
                    v34:Disable();
                    return;
                else
                    v35();
                    v34:Disable();
                    return;
                end;
            end);
            if not l_status_0 then
                task.spawn(function() --[[ Line: 239 ]]
                    -- upvalues: l_result_0 (copy)
                    error(l_result_0);
                end);
            end;
        end;
        local l_Children_4 = workspace.Islands:GetChildren();
        local function _() --[[ Line: 247 ]] --[[ Name: refreshIslands ]]
            -- upvalues: l_Children_4 (ref)
            l_Children_4 = workspace.Islands:GetChildren();
            local l_Children_5 = _G.areaParent:GetChildren();
            for v55 = 1, #l_Children_5 do
                table.insert(l_Children_4, l_Children_5[v55]);
            end;
        end;
        workspace.Islands.ChildAdded:Connect(function(v57) --[[ Line: 255 ]]
            -- upvalues: l_Children_4 (ref)
            if v57:WaitForChild("Settings", 60) and v57.Settings:GetAttribute("ThemeID") and not _G.allThemeIDs[v57.Name] then
                local l_Attribute_2 = v57.Settings:GetAttribute("ThemeID");
                if tonumber(l_Attribute_2) ~= nil then
                    l_Attribute_2 = "rbxassetid://" .. l_Attribute_2;
                end;
                _G.allThemeIDs[v57.Name] = {
                    id = l_Attribute_2, 
                    volume = 0.5
                };
            end;
            l_Children_4 = workspace.Islands:GetChildren();
            local l_Children_6 = _G.areaParent:GetChildren();
            for v60 = 1, #l_Children_6 do
                table.insert(l_Children_4, l_Children_6[v60]);
            end;
        end);
        workspace.Effects.Areas.ChildAdded:Connect(function(v61) --[[ Line: 267 ]]
            local v62 = v61:WaitForChild("Settings", 60);
            if v62 then
                local l_v62_Attribute_0 = v62:GetAttribute("ThemeID");
                if l_v62_Attribute_0 and not _G.allThemeIDs[v61.Name] then
                    if tonumber(l_v62_Attribute_0) ~= nil then
                        l_v62_Attribute_0 = "rbxassetid://" .. l_v62_Attribute_0;
                    end;
                    _G.allThemeIDs[v61.Name] = {
                        id = l_v62_Attribute_0, 
                        volume = 0.5
                    };
                end;
            end;
        end);
        workspace.Islands.ChildRemoved:Connect(function() --[[ Line: 280 ]]
            -- upvalues: l_Children_4 (ref)
            l_Children_4 = workspace.Islands:GetChildren();
            local l_Children_7 = _G.areaParent:GetChildren();
            for v65 = 1, #l_Children_7 do
                table.insert(l_Children_4, l_Children_7[v65]);
            end;
        end);
        l_Children_4 = workspace.Islands:GetChildren();
        local l_Children_8 = _G.areaParent:GetChildren();
        for v67 = 1, #l_Children_8 do
            local v68 = l_Children_8[v67];
            table.insert(l_Children_4, v68);
        end;
        l_Children_8 = function(v69) --[[ Line: 293 ]] --[[ Name: stopallbut ]]
            -- upvalues: l_Children_4 (ref)
            for v70 = 1, #l_Children_4 do
                if l_Children_4[v70] ~= v69 and l_Children_4[v70]:FindFirstChild("ThemeSong") then
                    l_Children_4[v70].ThemeSong:Stop();
                end;
            end;
            local l_islandMusic_0 = workspace:FindFirstChild("islandMusic");
            if l_islandMusic_0 and (v69 == nil or _G.allThemeIDs[v69.Name] and l_islandMusic_0.SoundId ~= _G.allThemeIDs[v69.Name].id) then
                l_islandMusic_0:Stop();
                l_islandMusic_0.Name = "gone";
                _G.destroy(l_islandMusic_0, 1);
            end;
        end;
        local function _(v72) --[[ Line: 307 ]] --[[ Name: getSound ]]
            local l_Sound_0 = Instance.new("Sound");
            l_Sound_0.Name = "islandMusic";
            l_Sound_0.SoundId = _G.allThemeIDs[v72].id;
            l_Sound_0.Volume = _G.allThemeIDs[v72].volume;
            l_Sound_0.SoundGroup = game.SoundService.Music;
            l_Sound_0.Parent = workspace;
            return l_Sound_0;
        end;
        local function v95() --[[ Line: 317 ]] --[[ Name: atsea ]]
            -- upvalues: v6 (ref), l_Children_8 (copy)
            if _G.currentisland == v6 then
                return;
            else
                l_Children_8(nil);
                _G.currentisland = v6;
                if v6 == "First Sea" then
                    if game.ReplicatedStorage.reservedCode.Value ~= "arena" then
                        local l_spawn_0 = task.spawn;
                        local v76 = "First Sea";
                        local v77 = nil;
                        local v78 = "Vast waters of the blue ocean";
                        local l_v76_0 = v76 --[[ copy: 2 -> 8 ]];
                        local l_v78_0 = v78 --[[ copy: 4 -> 9 ]];
                        l_spawn_0(function() --[[ Line: 105 ]]
                            -- upvalues: l_v76_0 (copy), v77 (copy), l_v78_0 (copy)
                            repeat
                                task.wait();
                            until game.Players.LocalPlayer.PlayerGui:FindFirstChild("IslandNote") == nil;
                            if _G.currentisland ~= l_v76_0 then
                                return;
                            else
                                local v81 = game.ReplicatedStorage.Util.Area.IslandNote:Clone();
                                v81.Parent = game.Players.LocalPlayer.PlayerGui;
                                v81.Frame.NameFrame.TextLabel.Text = l_v76_0;
                                if v77 then
                                    v81.Frame.DescFrame.TextLabel.TextColor3 = v77;
                                end;
                                v81.Frame.DescFrame.TextLabel.Text = l_v78_0;
                                v81.Frame.LocalScript.Disabled = false;
                                game.ReplicatedStorage.Util.Area.notification:Play();
                                return;
                            end;
                        end);
                    end;
                elseif game.ReplicatedStorage.reservedCode.Value ~= "arena" then
                    local l_spawn_1 = task.spawn;
                    local v83 = "Second Sea";
                    local v84 = nil;
                    local v85 = "Waters of the new world";
                    local l_v83_0 = v83 --[[ copy: 2 -> 6 ]];
                    local l_v85_0 = v85 --[[ copy: 4 -> 7 ]];
                    l_spawn_1(function() --[[ Line: 105 ]]
                        -- upvalues: l_v83_0 (copy), v84 (copy), l_v85_0 (copy)
                        repeat
                            task.wait();
                        until game.Players.LocalPlayer.PlayerGui:FindFirstChild("IslandNote") == nil;
                        if _G.currentisland ~= l_v83_0 then
                            return;
                        else
                            local v88 = game.ReplicatedStorage.Util.Area.IslandNote:Clone();
                            v88.Parent = game.Players.LocalPlayer.PlayerGui;
                            v88.Frame.NameFrame.TextLabel.Text = l_v83_0;
                            if v84 then
                                v88.Frame.DescFrame.TextLabel.TextColor3 = v84;
                            end;
                            v88.Frame.DescFrame.TextLabel.Text = l_v85_0;
                            v88.Frame.LocalScript.Disabled = false;
                            game.ReplicatedStorage.Util.Area.notification:Play();
                            return;
                        end;
                    end);
                end;
                local v89 = math.random(1, 13);
                local l_Children_9 = game.ReplicatedStorage.Util.SeaSounds:GetChildren();
                for v91 = 1, #l_Children_9 do
                    l_Children_9[v91]:Stop();
                end;
                if _G.themeSong then
                    _G.themeSong:Stop();
                    _G.themeSong = nil;
                end;
                local l__G_0 = _G;
                local v93 = "SeaSFX" .. v89;
                local l_Sound_1 = Instance.new("Sound");
                l_Sound_1.Name = "islandMusic";
                l_Sound_1.SoundId = _G.allThemeIDs[v93].id;
                l_Sound_1.Volume = _G.allThemeIDs[v93].volume;
                l_Sound_1.SoundGroup = game.SoundService.Music;
                l_Sound_1.Parent = workspace;
                l__G_0.themeSong = l_Sound_1;
                _G.themeSong:Play();
                return;
            end;
        end;
        local function v113(v96) --[[ Line: 345 ]] --[[ Name: onislanddisplay ]]
            -- upvalues: l_Children_8 (copy), v95 (copy)
            if v96 == nil then
                if game.ReplicatedStorage.reservedCode.Value == "arena" then
                    l_Children_8(nil);
                    return;
                else
                    v95();
                    return;
                end;
            else
                if _G.currentisland ~= v96.Name then
                    warn("DZRL", v96.Name);
                    _G.currentisland = v96.Name;
                    v96:WaitForChild("Settings", 2);
                    if v96.Settings:GetAttribute("HideNotification") == nil then
                        local l_Name_0 = v96.Name;
                        local l_Value_0 = v96.Settings.Desc.Value;
                        local l_Value_1 = v96.Settings.TextColor.Value;
                        if game.ReplicatedStorage.reservedCode.Value ~= "arena" then
                            local l_l_Name_0_0 = l_Name_0 --[[ copy: 1 -> 6 ]];
                            local l_l_Value_1_0 = l_Value_1 --[[ copy: 3 -> 7 ]];
                            local l_l_Value_0_0 = l_Value_0 --[[ copy: 2 -> 8 ]];
                            task.spawn(function() --[[ Line: 105 ]]
                                -- upvalues: l_l_Name_0_0 (copy), l_l_Value_1_0 (copy), l_l_Value_0_0 (copy)
                                repeat
                                    task.wait();
                                until game.Players.LocalPlayer.PlayerGui:FindFirstChild("IslandNote") == nil;
                                if _G.currentisland ~= l_l_Name_0_0 then
                                    return;
                                else
                                    local v103 = game.ReplicatedStorage.Util.Area.IslandNote:Clone();
                                    v103.Parent = game.Players.LocalPlayer.PlayerGui;
                                    v103.Frame.NameFrame.TextLabel.Text = l_l_Name_0_0;
                                    if l_l_Value_1_0 then
                                        v103.Frame.DescFrame.TextLabel.TextColor3 = l_l_Value_1_0;
                                    end;
                                    v103.Frame.DescFrame.TextLabel.Text = l_l_Value_0_0;
                                    v103.Frame.LocalScript.Disabled = false;
                                    game.ReplicatedStorage.Util.Area.notification:Play();
                                    return;
                                end;
                            end);
                        end;
                    end;
                    local l_Children_10 = game.ReplicatedStorage.Util.SeaSounds:GetChildren();
                    for v105 = 1, #l_Children_10 do
                        l_Children_10[v105]:Stop();
                    end;
                    l_Children_10 = v96:FindFirstChild("ThemeSong");
                    if l_Children_10 == nil then
                        l_Children_10 = v96.Settings:FindFirstChild("ThemeSong");
                    end;
                    if l_Children_10 == nil and _G.allThemeIDs[v96.Name] then
                        local l_Name_1 = v96.Name;
                        local l_Sound_2 = Instance.new("Sound");
                        l_Sound_2.Name = "islandMusic";
                        l_Sound_2.SoundId = _G.allThemeIDs[l_Name_1].id;
                        l_Sound_2.Volume = _G.allThemeIDs[l_Name_1].volume;
                        l_Sound_2.SoundGroup = game.SoundService.Music;
                        l_Sound_2.Parent = workspace;
                        l_Children_10 = l_Sound_2;
                        warn("using cache sound");
                    end;
                    if _G.themeSong and _G.themeSong ~= l_Children_10 then
                        local l_themeSong_0 = _G.themeSong;
                        _G.tween(l_themeSong_0, {
                            1, 
                            Enum.EasingStyle.Quad, 
                            Enum.EasingDirection.Out, 
                            0, 
                            false, 
                            0
                        }, {
                            Volume = 0
                        });
                        if l_themeSong_0.Name == "islandMusic" then
                            _G.destroy(l_themeSong_0, 1);
                        end;
                        _G.themeSong = nil;
                        local l_l_themeSong_0_0 = l_themeSong_0 --[[ copy: 2 -> 5 ]];
                        task.spawn(function() --[[ Line: 387 ]]
                            -- upvalues: l_l_themeSong_0_0 (copy)
                            task.wait(1);
                            l_l_themeSong_0_0:Stop();
                        end);
                    end;
                    if l_Children_10 ~= nil and l_Children_10.IsPlaying == false then
                        l_Children_10.Looped = true;
                        l_Children_10:Play();
                        local _ = l_Children_10.Volume;
                        l_Children_10.Volume = 0;
                        _G.tween(l_Children_10, {
                            1, 
                            Enum.EasingStyle.Quad, 
                            Enum.EasingDirection.Out, 
                            0, 
                            false, 
                            0
                        }, {
                            Volume = 1
                        });
                        _G.themeSong = l_Children_10;
                    end;
                    if l_Children_10 then
                        l_Children_10.SoundGroup = game.SoundService.Music;
                    end;
                end;
                l_Children_8(v96);
                local l_Children_11 = game.ReplicatedStorage.Util.SeaSounds:GetChildren();
                for v112 = 1, #l_Children_11 do
                    l_Children_11[v112]:Stop();
                end;
                return;
            end;
        end;
        local _ = math.random(1, 1000);
        local v115 = nil;
        local v116 = 0;
        if _G.themeSong then
            _G.themeSong:Stop();
            _G.themeSong = nil;
        end;
        local function _(v117, v118, v119) --[[ Line: 425 ]] --[[ Name: Lerp ]]
            return v117 + (v118 - v117) * v119;
        end;
        if game.ReplicatedStorage.reservedCode:GetAttribute("battleRoyale") ~= nil then
            game.ReplicatedStorage.Assets.IslandMusic:ClearAllChildren();
        end;
        local v121 = {};
        local v122 = Vector3.new();
        while true do
            local l_CurrentCamera_0 = workspace.CurrentCamera;
            if tick() - v116 >= 1 or (l_CurrentCamera_0.CFrame.Position - v122).Magnitude >= 300 then
                v122 = l_CurrentCamera_0.CFrame.Position;
                local l_Children_12 = _G.areaParent:GetChildren();
                local l_Children_13 = workspace.Islands:GetChildren();
                local v126 = nil;
                local v127 = nil;
                for v128 = 1, #l_Children_12 do
                    local v129 = l_Children_12[v128];
                    local v130 = nil;
                    local v131 = nil;
                    local v132 = nil;
                    if v121[v129.Name] == nil then
                        if v129:IsA("Model") then
                            v130 = v129:GetAttribute("islandCFrame");
                            if v129:GetAttribute("islandSize") then
                                size = v129:GetAttribute("islandSize") + Vector3.new(50, 500, 50, 0);
                            else
                                size = v129:GetModelSize() + Vector3.new(50, 500, 50, 0);
                            end;
                        else
                            v130 = v129.CFrame;
                            size = v129.Size;
                        end;
                        v132 = Vector2.new(size.X, size.Z);
                        v121[v129.Name] = {
                            cf = v130, 
                            size = size, 
                            size2D = v132
                        };
                    end;
                    if v129:IsA("Model") then
                        v130 = v121[v129.Name].cf;
                        v131 = v121[v129.Name].size;
                    else
                        v130 = v129.CFrame;
                        v131 = v129.Size;
                    end;
                    if v5:setup(v129, v130, v131) == true then
                        local l_Magnitude_0 = v131.Magnitude;
                        if v127 == nil or l_Magnitude_0 < v121[v127.Name].size.Magnitude then
                            v127 = v129;
                        end;
                    end;
                end;
                if v127 then
                    v126 = v127;
                else
                    for v134 = 1, #l_Children_13 do
                        local v135 = nil;
                        local v136 = nil;
                        local v137 = nil;
                        if v121[l_Children_13[v134].Name] == nil then
                            if l_Children_13[v134]:IsA("Model") then
                                v135 = l_Children_13[v134]:GetAttribute("islandCFrame");
                                if l_Children_13[v134]:GetAttribute("islandSize") then
                                    size = l_Children_13[v134]:GetAttribute("islandSize") + Vector3.new(50, 500, 50, 0);
                                else
                                    size = l_Children_13[v134]:GetModelSize() + Vector3.new(50, 500, 50, 0);
                                end;
                            else
                                v135 = l_Children_13[v134].CFrame;
                                size = l_Children_13[v134].Size;
                            end;
                            v137 = Vector2.new(size.X, size.Z);
                            v121[l_Children_13[v134].Name] = {
                                cf = v135, 
                                size = size, 
                                size2D = v137
                            };
                        end;
                        if l_Children_13[v134]:IsA("Model") then
                            v135 = v121[l_Children_13[v134].Name].cf;
                            v136 = v121[l_Children_13[v134].Name].size;
                        else
                            v135 = l_Children_13[v134].CFrame;
                            v136 = l_Children_13[v134].Size;
                        end;
                        if v5:setup(l_Children_13[v134], v135, v136) == true then
                            if l_Children_13[v134]:IsA("Part") and v126 and (v126.Name == "???? Shrine" or v126:FindFirstChild("Pro")) then
                                local v138 = true;
                                if l_Children_13[v134]:IsA("Part") and l_Children_13[v134].Size.Magnitude < v136.Magnitude and l_Children_13[v134]:FindFirstChild("Pro") and l_Children_13[v134]:FindFirstChild("Pro2") == nil then
                                    v138 = false;
                                end;
                                if v138 == true then
                                    continue;
                                end;
                            end;
                            v126 = l_Children_13[v134];
                        end;
                    end;
                end;
                if v126 ~= nil then
                    local l_Position_0 = v121[v126.Name].cf.Position;
                    local _ = v121[v126.Name].size;
                    local l_size2D_0 = v121[v126.Name].size2D;
                    local l_v126_0 = v126;
                    if l_v126_0:IsA("Part") and l_v126_0:GetAttribute("ParentIsland") ~= nil then
                        l_v126_0 = workspace.Islands:FindFirstChild(l_v126_0:GetAttribute("ParentIsland"));
                    end;
                    local v143 = Vector3.new(l_Position_0.X, workspace.Env.WaterStuff.Falls.Position.Y, l_Position_0.Z);
                    local l_Position_1 = l_CurrentCamera_0.CFrame.Position;
                    local _ = (v143 - Vector3.new(l_Position_1.X, v143.Y, l_Position_1.Z)).Magnitude;
                    local _ = l_size2D_0.magnitude / 20;
                    if script.Folder.OceanWavesAmb.Volume ~= 0 then
                        _G.tween(script.Folder.OceanWavesAmb, {
                            1, 
                            Enum.EasingStyle.Quad, 
                            Enum.EasingDirection.Out, 
                            0, 
                            false, 
                            0
                        }, {
                            Volume = 0
                        });
                    end;
                    local l_ClockTime_0 = game.Lighting.ClockTime;
                    local l_FirstChild_0 = script.Folder.CustomAmbs:FindFirstChild(l_v126_0.Name);
                    if l_FirstChild_0 == nil then
                        if l_ClockTime_0 >= 18 then
                            if script.Folder.CalmNightCricketsAmb.IsPlaying == false then
                                script.Folder.CalmNightCricketsAmb:Play();
                                script.Folder.CalmNightCricketsAmb.Volume = 0;
                                _G.tween(script.Folder.CalmNightCricketsAmb, {
                                    1, 
                                    Enum.EasingStyle.Quad, 
                                    Enum.EasingDirection.Out, 
                                    0, 
                                    false, 
                                    0
                                }, {
                                    Volume = 0.6
                                });
                            end;
                            if script.Folder.SunnyDayAmb.Volume ~= 0 then
                                _G.tween(script.Folder.SunnyDayAmb, {
                                    1, 
                                    Enum.EasingStyle.Quad, 
                                    Enum.EasingDirection.Out, 
                                    0, 
                                    false, 
                                    0
                                }, {
                                    Volume = 0
                                });
                                task.delay(1, function() --[[ Line: 569 ]]
                                    script.Folder.SunnyDayAmb:Stop();
                                end);
                            end;
                        elseif l_ClockTime_0 >= 6 and l_ClockTime_0 < 17 then
                            if script.Folder.CalmNightCricketsAmb.Volume ~= 0 then
                                _G.tween(script.Folder.CalmNightCricketsAmb, {
                                    1, 
                                    Enum.EasingStyle.Quad, 
                                    Enum.EasingDirection.Out, 
                                    0, 
                                    false, 
                                    0
                                }, {
                                    Volume = 0
                                });
                                task.delay(1, function() --[[ Line: 576 ]]
                                    script.Folder.CalmNightCricketsAmb:Stop();
                                end);
                            end;
                            if script.Folder.SunnyDayAmb.IsPlaying == false and _G.currentweather == "Normal" then
                                script.Folder.SunnyDayAmb.Volume = 0;
                                script.Folder.SunnyDayAmb:Play();
                                _G.tween(script.Folder.SunnyDayAmb, {
                                    1, 
                                    Enum.EasingStyle.Quad, 
                                    Enum.EasingDirection.Out, 
                                    0, 
                                    false, 
                                    0
                                }, {
                                    Volume = 0.6
                                });
                            elseif _G.currentweather ~= "Normal" then
                                script.Folder.SunnyDayAmb:Stop();
                            end;
                        end;
                        local l_Children_14 = script.Folder.CustomAmbs:GetChildren();
                        for v150 = 1, #l_Children_14 do
                            if l_Children_14[v150].Volume ~= 0 and l_Children_14[v150]:GetAttribute("settingVolume") == nil then
                                l_Children_14[v150]:SetAttribute("settingVolume", true);
                                _G.tween(l_Children_14[v150], {
                                    1, 
                                    Enum.EasingStyle.Quad, 
                                    Enum.EasingDirection.Out, 
                                    0, 
                                    false, 
                                    0
                                }, {
                                    Volume = 0
                                });
                                task.delay(1, function() --[[ Line: 594 ]]
                                    -- upvalues: l_Children_14 (copy), v150 (copy)
                                    l_Children_14[v150]:SetAttribute("settingVolume", nil);
                                    l_Children_14[v150]:Stop();
                                end);
                            end;
                        end;
                    else
                        script.Folder.SunnyDayAmb:Stop();
                        script.Folder.CalmNightCricketsAmb:Play();
                        local l_Children_15 = script.Folder.CustomAmbs:GetChildren();
                        for v152 = 1, #l_Children_15 do
                            if l_Children_15[v152] ~= l_FirstChild_0 then
                                l_Children_15[v152]:Stop();
                            end;
                        end;
                        if l_FirstChild_0.IsPlaying == false then
                            l_FirstChild_0:Play();
                            l_FirstChild_0.Volume = 0;
                            _G.tween(l_FirstChild_0, {
                                1, 
                                Enum.EasingStyle.Quad, 
                                Enum.EasingDirection.Out, 
                                0, 
                                false, 
                                0
                            }, {
                                Volume = 0.2
                            });
                        end;
                    end;
                else
                    if script.Folder.DistantWavesAmb.Volume ~= 0 then
                        _G.tween(script.Folder.DistantWavesAmb, {
                            1, 
                            Enum.EasingStyle.Quad, 
                            Enum.EasingDirection.Out, 
                            0, 
                            false, 
                            0
                        }, {
                            Volume = 0
                        });
                        task.delay(1, function() --[[ Line: 620 ]]
                            script.Folder.DistantWavesAmb:stop();
                        end);
                    end;
                    if script.Folder.OceanWavesAmb.Volume ~= 0.2 then
                        _G.tween(script.Folder.OceanWavesAmb, {
                            1, 
                            Enum.EasingStyle.Quad, 
                            Enum.EasingDirection.Out, 
                            0, 
                            false, 
                            0
                        }, {
                            Volume = 0.2
                        });
                    end;
                    if script.Folder.OceanWavesAmb.IsPlaying == false then
                        script.Folder.OceanWavesAmb:Play();
                    end;
                    if script.Folder.SunnyDayAmb.IsPlaying == true then
                        script.Folder.SunnyDayAmb:Stop();
                    end;
                    if script.Folder.CalmNightCricketsAmb.IsPlaying == true then
                        script.Folder.CalmNightCricketsAmb:Stop();
                    end;
                end;
                if v126 == nil and _G.currentweather ~= workspace.Env.Settings.Weather.Value then
                    v32:set(workspace.Env.Settings.Weather.Value, v7);
                end;
                if v126 and v126:FindFirstChild("Settings") and _G.currentweather ~= v126.Settings.Weather.Value then
                    v32:set(v126.Settings.Weather.Value, v7);
                end;
                v115 = v126;
                v113(v126);
                if v126 == nil then
                    v126 = workspace.Env;
                end;
                v52(v126.Settings.Weather.Value, v126);
                v116 = tick();
            end;
            task.wait();
        end;
    end;
end;