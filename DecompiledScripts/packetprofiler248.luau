local l_LocalPlayer_0 = game:GetService("Players").LocalPlayer;
if l_LocalPlayer_0.Name ~= "Phoeating" then
    return;
else
    local l_Components_0 = script.Components;
    local l_Modules_0 = script.Modules;
    local v3 = require(l_Modules_0.Packages);
    v3.IsPlugin = false;
    local v4 = require(v3.Directory.Roact);
    local v5 = require(l_Components_0.MainPlugin);
    local v6 = v4.createElement(v5);
    v4.mount(v6, l_LocalPlayer_0.PlayerGui, "PacketProfiler");
    return;
end;