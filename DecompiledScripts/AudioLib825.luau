local v0 = {};
local _ = game:GetService("SoundService");
v0.new = function(v2) --[[ Line: 4 ]] --[[ Name: new ]]
    local v10 = {
        DefaultProperties = {
            Children = nil, 
            Looped = false, 
            PlaybackSpeed = 1, 
            Playing = false, 
            SoundId = nil, 
            TimePosition = 0, 
            Volume = 0.25
        }, 
        Playlist = {}, 
        Shuffle = false, 
        GetSound = function(v3) --[[ Line: 23 ]] --[[ Name: GetSound ]]
            return v3.Sound;
        end, 
        UpdateSound = function(v4, v5) --[[ Line: 28 ]] --[[ Name: UpdateSound ]]
            for v6, v7 in v5 do
                v4.Sound[v6] = v7;
            end;
            return v4.Sound;
        end, 
        SoundEnded = function(v8) --[[ Line: 36 ]] --[[ Name: SoundEnded ]]
            if #v8.Playlist > 0 then
                local v9 = table.find(v8.Playlist, v8.Sound.SoundId);
                if v8.Shuffle then
                    v9 = math.random(0, #v8.Playlist);
                end;
                if v9 + 1 > #v8.Playlist then
                    v9 = 0;
                end;
                v8.Sound.SoundId = v8.Playlist[v9 + 1];
            end;
        end, 
        Sound = v2:FindFirstChild("AudioLib_Sound")
    };
    if not v10.Sound then
        v10.Sound = Instance.new("Sound");
        v10.Sound.Name = "AudioLib_Sound";
        v10.Sound.Parent = v2;
        v10.Sound.Ended:Connect(function() --[[ Line: 52 ]]
            -- upvalues: v10 (copy)
            v10:SoundEnded();
        end);
        v10:UpdateSound(v10.DefaultProperties);
    end;
    return v10;
end;
return v0;