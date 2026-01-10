return {
    start = function(_, v1, v2, v3) --[[ Line: 3 ]] --[[ Name: start ]]
        if _G.checkRenderDistance(v1, 150) == false then
            return;
        else
            local v4 = workspace:GetServerTimeNow() - v3;
            task.delay(0.283 - v4, function() --[[ Line: 9 ]]
                -- upvalues: v2 (copy)
                if v2:FindFirstChild("Head") == nil then
                    return;
                else
                    local v5 = script.VFXRig.Head.Alert:Clone();
                    v5.Parent = v2.Head;
                    _G.customEmit(v5);
                    _G.destroy(v5, 5);
                    return;
                end;
            end);
            task.delay(3.05 - v4, function() --[[ Line: 21 ]]
                -- upvalues: v2 (copy)
                local l_LeftHand_0 = v2:FindFirstChild("LeftHand");
                if l_LeftHand_0 == nil then
                    return;
                else
                    local v7 = script.VFXRig.LeftHand.Attachment:Clone();
                    v7.Parent = l_LeftHand_0;
                    _G.customEmit(v7);
                    _G.destroy(v7, 5);
                    return;
                end;
            end);
            local v8 = script.Frame:Clone();
            v8.CFrame = v1;
            v8.Parent = workspace.Effects;
            task.delay(0.083 - v4, function() --[[ Line: 37 ]]
                -- upvalues: v8 (copy)
                _G.customEmit(v8);
            end);
            task.delay(4.533 - v4, function() --[[ Line: 41 ]]
                -- upvalues: v8 (copy)
                _G.customEmit(v8);
                _G.destroy(v8, 5);
            end);
            return;
        end;
    end
};