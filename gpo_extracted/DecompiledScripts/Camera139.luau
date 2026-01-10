local v0 = {};
local v1 = require(game.ReplicatedStorage.Modules.sBeat);
local v6 = {
    Mes = function() --[[ Line: 5 ]]
        task.spawn(function() --[[ Line: 6 ]]
            task.wait(0.4);
            local v2 = script.Mes.ColorCorrection:Clone();
            v2.Parent = workspace.CurrentCamera;
            v2.TintColor = Color3.fromRGB(255, 255, 255);
            v2.Saturation = 0;
            _G.tween(v2, {
                0.25, 
                Enum.EasingStyle.Quad, 
                Enum.EasingDirection.Out, 
                0, 
                false, 
                0
            }, {
                TintColor = script.Mes.ColorCorrection.TintColor, 
                Saturation = script.Mes.ColorCorrection.Saturation
            });
            _G.destroy(v2, 0.5);
        end);
    end, 
    Rokuogan = function() --[[ Line: 18 ]]
        task.spawn(function() --[[ Line: 19 ]]
            task.wait(0.85);
            local v3 = script.Rokuogan.ColorCorrection:Clone();
            v3.Parent = workspace.CurrentCamera;
            v3.TintColor = Color3.fromRGB(255, 255, 255);
            v3.Saturation = 0;
            local v4 = TweenInfo.new(0.25, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, true, 0);
            local v5 = {
                Saturation = -1
            };
            game:GetService("TweenService"):Create(v3, v4, v5):Play();
            _G.destroy(v3, 0.5);
        end);
    end
};
v0.start = function(_, v8, v9, v10) --[[ Line: 37 ]] --[[ Name: start ]]
    -- upvalues: v1 (copy), v6 (copy)
    local l_LocalPlayer_0 = game.Players.LocalPlayer;
    local l_Character_0 = l_LocalPlayer_0.Character;
    if v10 then
        l_Character_0 = v10;
    end;
    task.spawn(function() --[[ Line: 43 ]]
        -- upvalues: v8 (copy), l_LocalPlayer_0 (copy), l_Character_0 (ref), v9 (copy), v1 (ref), v6 (ref)
        if script:FindFirstChild(v8) then
            workspace.CurrentCamera.CameraType = Enum.CameraType.Scriptable;
            local v13 = {};
            local l_Children_0 = l_LocalPlayer_0.PlayerGui:GetChildren();
            for v15 = 1, #l_Children_0 do
                if l_Children_0[v15]:IsA("ScreenGui") and l_Children_0[v15].Enabled == true then
                    l_Children_0[v15].Enabled = false;
                    table.insert(v13, l_Children_0[v15]);
                end;
            end;
            l_Character_0.Humanoid.AutoRotate = false;
            local l_v9_0 = v9;
            local l_Children_1 = script:FindFirstChild(v8):GetChildren();
            local v18 = 0;
            local _ = l_Children_1[1];
            local v20 = tick();
            while true do
                v18 = v18 + math.floor((tick() - v20) * 60 + 0.5);
                if l_Children_1[v18] then
                    workspace.CurrentCamera.CFrame = workspace.CurrentCamera.CFrame:Lerp(l_Character_0.HumanoidRootPart.CFrame:ToWorldSpace(l_Children_1[v18].Value) * CFrame.new(0, 0, l_v9_0), 60 / _G.FPS);
                    if #l_Children_1 - 1 > v18 then
                        v20 = tick();
                        v1();
                    else
                        break;
                    end;
                else
                    break;
                end;
            end;
            if v6[v8] then
                v6[v8]();
            end;
            l_Character_0.Humanoid.AutoRotate = true;
            workspace.CurrentCamera.CameraType = game.Players.LocalPlayer and Enum.CameraType.Custom or Enum.CameraType.Fixed;
            for v21 = 1, #v13 do
                if v13[v21] then
                    v13[v21].Enabled = true;
                end;
            end;
        end;
    end);
end;
return v0;