local v0 = {};
local _ = require(game.ReplicatedStorage.Modules.sBeat);
v0.start = function(_) --[[ Line: 4 ]] --[[ Name: start ]]
    local v3 = workspace.NPCs["Gatekeeper Puff"];
    local v4 = {
        6.17, 
        7.12, 
        8.05
    };
    if not _G.checkRenderDistance(v3.PrimaryPart.Position) then
        return;
    else
        for v5 = 1, #v4 do
            task.spawn(function() --[[ Line: 11 ]]
                -- upvalues: v4 (copy), v5 (copy), v3 (copy)
                task.wait(v4[v5]);
                local l_CFrame_0 = v3.LeftHand.CFrame;
                local v7 = script.Part:Clone();
                v7.Parent = workspace.Effects;
                v7.CFrame = l_CFrame_0;
                _G.tween(v7.Mesh, {
                    0.2, 
                    Enum.EasingStyle.Quad, 
                    Enum.EasingDirection.Out, 
                    0, 
                    false, 
                    0
                }, {
                    Scale = Vector3.new(50, 50, 50, 0)
                });
                _G.tween(v7, {
                    0.2, 
                    Enum.EasingStyle.Quad, 
                    Enum.EasingDirection.Out, 
                    0, 
                    false, 
                    0
                }, {
                    Transparency = 1
                });
                v7.Attachment.new3.Size = NumberSequence.new({
                    NumberSequenceKeypoint.new(0, 5, 0), 
                    NumberSequenceKeypoint.new(1, 50, 25)
                });
                v7.Attachment.Lines.Size = NumberSequence.new({
                    NumberSequenceKeypoint.new(0, 25, 10), 
                    NumberSequenceKeypoint.new(1, 0, 0)
                });
                v7.Attachment.new2.Size = NumberSequence.new({
                    NumberSequenceKeypoint.new(0, 50, 10), 
                    NumberSequenceKeypoint.new(0.35, 9, 0), 
                    NumberSequenceKeypoint.new(1, 0, 0)
                });
                v7.Attachment.new2:Emit(25);
                v7.Attachment.new3:Emit(25);
                v7.Attachment.Lines:Emit(35);
                _G.destroy(v7, 2.2);
            end);
        end;
        return;
    end;
end;
return v0;