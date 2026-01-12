local v0 = require(game:GetService("ServerScriptService"):FindFirstChild("LoaderUtils", true).Parent).load(script);
local v1 = v0("Maid");
local v2 = v0("SoftShutdownTranslator");
local v3 = v0("SoftShutdownUI");
local v4 = v0("ServiceBag");
return function(v5) --[[ Line: 12 ]]
    -- upvalues: v1 (copy), v4 (copy), v2 (copy), v3 (copy)
    local v6 = v1.new();
    local v7 = v4.new();
    v6:GiveTask(v7);
    local l_v7_Service_0 = v7:GetService(v2);
    local v9 = v3.new();
    v6:GiveTask(v9);
    v6:GivePromise(l_v7_Service_0:PromiseFormatByKey("shutdown.lobby.title")):Then(function(v10) --[[ Line: 22 ]]
        -- upvalues: v9 (copy)
        v9:SetTitle(v10);
    end);
    v6:GivePromise(l_v7_Service_0:PromiseFormatByKey("shutdown.lobby.subtitle")):Then(function(v11) --[[ Line: 26 ]]
        -- upvalues: v9 (copy)
        v9:SetSubtitle(v11);
    end);
    v9:Show();
    v9.Gui.Parent = v5;
    return function() --[[ Line: 34 ]]
        -- upvalues: v6 (copy)
        v6:DoCleaning();
    end;
end;