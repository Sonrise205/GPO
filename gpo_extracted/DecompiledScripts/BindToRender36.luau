local v0 = {};
local v1 = {};
local l_RunService_0 = game:GetService("RunService");
local v3 = require(game.ReplicatedStorage.Modules.MaidClass).new();
local v4 = 0;
v0.AddToRender = function(_, v6, v7, v8) --[[ Line: 9 ]] --[[ Name: AddToRender ]]
    -- upvalues: v0 (copy), v1 (copy), v3 (copy)
    local v9 = {};
    v0:RemoveFromRender(v6);
    v9.scriptObj = v7;
    v9.Name = v6;
    v9.orgFPS = v8 or 1;
    v9.FPS = v8 or 1;
    v9.CurrentFrame = 0;
    local v10 = Instance.new("BindableEvent", script.Binds);
    v10.Name = v6;
    v9.BindEvent = v10;
    v1[v6] = v9;
    v3[v9] = v9;
    return v10;
end;
local function v15(v11, v12) --[[ Line: 26 ]] --[[ Name: cleanRender ]]
    -- upvalues: v3 (copy), v1 (copy)
    if v11.BindEvent ~= nil then
        v12.BindEvent:Destroy();
    end;
    for v13, _ in v12 do
        v12[v13] = nil;
    end;
    v3[{}] = nil;
    v1[v11] = nil;
    v12 = nil;
    v11 = nil;
end;
v0.RemoveFromRender = function(_, v17) --[[ Line: 41 ]] --[[ Name: RemoveFromRender ]]
    -- upvalues: v1 (copy), v15 (copy)
    if v1[v17] then
        v15(v1[v17], v1[v17]);
    end;
end;
local v18 = 0;
local v19 = 0;
local function v24(v20) --[[ Line: 49 ]] --[[ Name: renderBind ]]
    -- upvalues: v19 (ref), v18 (ref), v1 (copy), v15 (copy), v4 (ref)
    v19 = v19 + 1;
    if tick() - v18 >= 1 then
        v19 = 0;
        v18 = tick();
    elseif tick() - v18 < 1 and v19 > 60 then
        v19 = 0;
        return;
    end;
    local v21 = 0;
    for v22, v23 in v1 do
        if v23.scriptObj ~= nil and v23.scriptObj.Parent ~= nil and (v23.scriptObj:IsA("Script") or v23.scriptObj:IsA("LocalScript") and v23.scriptObj.Disabled == false) then
            v23.CurrentFrame = v23.CurrentFrame + 1;
            if v23.CurrentFrame % v23.FPS == 0 then
                task.spawn(function() --[[ Line: 64 ]]
                    -- upvalues: v23 (copy), v20 (copy)
                    v23.BindEvent:Fire(v20);
                end);
            end;
            v21 = v21 + 1;
        else
            v15(v22, v23);
        end;
    end;
    v4 = v21;
end;
local l_Heartbeat_0 = game:GetService("RunService").Heartbeat;
local v26 = nil;
local v27 = nil;
local v28 = {};
local function v31() --[[ Line: 81 ]] --[[ Name: HeartbeatUpdate ]]
    -- upvalues: v26 (ref), v28 (copy), v27 (ref)
    v26 = tick();
    for v29 = #v28, 1, -1 do
        v28[v29 + 1] = v28[v29] >= v26 - 1 and v28[v29] or nil;
    end;
    v28[1] = v26;
    local v30 = math.floor(tick() - v27 >= 1 and #v28 or #v28 / (tick() - v27));
    _G.FPS = v30;
    script:SetAttribute("FPS", v30);
end;
v27 = tick();
l_Heartbeat_0:Connect(v31);
l_RunService_0.RenderStepped:Connect(v24);
return v0;