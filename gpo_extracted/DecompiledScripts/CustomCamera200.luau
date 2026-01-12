return {
    start = function(_, v1) --[[ Line: 3 ]] --[[ Name: start ]]
        local l_CurrentCamera_0 = workspace.CurrentCamera;
        game["Run Service"].RenderStepped:Connect(function() --[[ Line: 5 ]]
            -- upvalues: l_CurrentCamera_0 (copy), v1 (copy)
            l_CurrentCamera_0.CameraType = Enum.CameraType.Scriptable;
            l_CurrentCamera_0.CFrame = v1.CFrame;
            pcall(function() --[[ Line: 8 ]]
                game.Players.LocalPlayer.Character.Humanoid.AutoRotate = false;
            end);
        end);
    end
};