local l_RunService_0 = game:GetService("RunService");
local v1 = require(script.Parent.FrustumCulling);
local v2 = require(script.Parent.TextureSync);
local v3 = script.Parent:GetAttribute("MaxRenderDistance") or 512;
local v4 = script.Parent:GetAttribute("RefreshRate") or 0.02;
local v5 = {};
v5.__index = v5;
local v6 = {};
local v7 = false;
local v8 = nil;
local v9 = 0;
v5.AddWavePlane = function(v10) --[[ Line: 16 ]] --[[ Name: AddWavePlane ]]
    -- upvalues: v6 (copy)
    v6[v10] = true;
end;
v5.RemoveWavePlane = function(v11) --[[ Line: 20 ]] --[[ Name: RemoveWavePlane ]]
    -- upvalues: v6 (copy)
    v6[v11] = nil;
end;
v5.SetEnabled = function(v12) --[[ Line: 24 ]] --[[ Name: SetEnabled ]]
    -- upvalues: v7 (ref), v8 (ref), l_RunService_0 (copy), v5 (copy)
    v7 = v12;
    if v7 and not v8 then
        v8 = l_RunService_0.Heartbeat:Connect(function(v13) --[[ Line: 28 ]]
            -- upvalues: v5 (ref)
            v5.Update(v13);
        end);
        return;
    else
        if not v7 and v8 then
            v8:Disconnect();
            v8 = nil;
        end;
        return;
    end;
end;
v5.Update = function(v14) --[[ Line: 37 ]] --[[ Name: Update ]]
    -- upvalues: v2 (copy), v9 (ref), v4 (copy), v1 (copy), v3 (copy), v6 (copy)
    v2.Update(v14);
    v9 = v9 + v14;
    if v9 < v4 then
        return;
    else
        v9 = 0;
        local l_workspace_ServerTimeNow_0 = workspace:GetServerTimeNow();
        local l_CurrentCamera_0 = workspace.CurrentCamera;
        local l_Position_0 = l_CurrentCamera_0.CFrame.Position;
        local v18 = v1.getFrustumPlanes(l_CurrentCamera_0, v3);
        for v19 in pairs(v6) do
            v19:UpdateSimulation(l_workspace_ServerTimeNow_0, v18, l_Position_0);
        end;
        return;
    end;
end;
return v5;