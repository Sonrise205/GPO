local v0 = require(game.ReplicatedStorage.Modules.SwordHandle.SwordInfo);
local function _(v1) --[[ Line: 2 ]] --[[ Name: makesfx ]]
    local l_Sound_0 = Instance.new("Sound");
    l_Sound_0.Name = v1;
    l_Sound_0.SoundId = v1;
    l_Sound_0.Parent = game.ReplicatedStorage.Modules.SwordHandle.SwordInfo;
end;
for v4, v5 in pairs(v0) do
    warn(v4);
    if v5.swingSFX then
        for v6 = 1, #v5.swingSFX do
            local v7 = v5.swingSFX[v6];
            local l_Sound_1 = Instance.new("Sound");
            l_Sound_1.Name = v7;
            l_Sound_1.SoundId = v7;
            l_Sound_1.Parent = game.ReplicatedStorage.Modules.SwordHandle.SwordInfo;
        end;
    end;
    if v5.hitSounds then
        for v9 = 1, #v5.hitSounds do
            local v10 = v5.hitSounds[v9];
            local l_Sound_2 = Instance.new("Sound");
            l_Sound_2.Name = v10;
            l_Sound_2.SoundId = v10;
            l_Sound_2.Parent = game.ReplicatedStorage.Modules.SwordHandle.SwordInfo;
        end;
    end;
end;