local v0 = {};
local v1 = require(game.ReplicatedStorage.Modules.sBeat);
v0.start = function(_, _, _) --[[ Line: 4 ]] --[[ Name: start ]]
    -- upvalues: v1 (copy)
    local l_Children_0 = script.Frames:GetChildren();
    local _ = CFrame.new(1242.48682, 455.18222, -249.810471, 0, 0, -1, 0, 1, 0, 1, 0, 0);
    local _ = workspace.Islands["Reverse Mountain"].Gate.PrimaryPart.CFrame;
    local v8 = CFrame.new(1069.09082, 427.88681, -298.473633, 1, 0, 0, 0, 1, 0, 0, 0, 1);
    workspace.NPCs["Gatekeeper Puff"].Humanoid:LoadAnimation(game.ReplicatedStorage.Modules.NPCInteractions.Talks["Gatekeeper Puff"].Animation):Play();
    local l_Value_0 = script.Frames["1"].Value;
    local v10 = {};
    local v11 = #script.Frames:GetChildren();
    local _ = {};
    local l_CFrame_1 = workspace.CurrentCamera.CFrame;
    for v14 = 1, #l_Children_0 do
        local _ = tonumber(l_Children_0[v14].Name);
        v10[v14] = l_Children_0[v14].Value;
        l_Children_0[v14]:SetAttribute("num", v14);
    end;
    local v16 = {};
    local l_Children_1 = game.Players.LocalPlayer.PlayerGui:GetChildren();
    for v18 = 1, #l_Children_1 do
        if l_Children_1[v18]:IsA("ScreenGui") and l_Children_1[v18].Enabled == true then
            l_Children_1[v18].Enabled = false;
            table.insert(v16, l_Children_1[v18]);
        end;
    end;
    _G.tween(workspace.CurrentCamera, {
        1, 
        "EntranceExpressive", 
        Enum.EasingDirection.Out, 
        0, 
        false, 
        0
    }, {
        FieldOfView = 100
    });
    local v19 = script.ScreenGui:Clone();
    v19.Parent = game.Players.LocalPlayer.PlayerGui;
    for v20 = 1, v11 do
        workspace.CurrentCamera.CameraType = Enum.CameraType.Scriptable;
        local v21 = l_Value_0:Lerp(script.Frames[v20].Value, 0.2);
        local v22 = v8:ToObjectSpace(v21);
        workspace.CurrentCamera.CFrame = workspace.Islands["Reverse Mountain"].Gate.PrimaryPart.CFrame:ToWorldSpace(v22);
        l_Value_0 = v21;
        v1();
    end;
    task.wait(2);
    _G.tween(workspace.CurrentCamera, {
        1, 
        "EntranceExpressive", 
        Enum.EasingDirection.Out, 
        0, 
        false, 
        0
    }, {
        CFrame = l_CFrame_1, 
        FieldOfView = 70
    });
    v19:Destroy();
    task.wait(1);
    workspace.CurrentCamera.CameraType = Enum.CameraType.Custom;
    for v23 = 1, #v16 do
        if v16[v23] then
            v16[v23].Enabled = true;
        end;
    end;
end;
return v0;