local v0 = {};
local _ = require(script.Parent.Lightning);
local function _(v2, v3, v4) --[[ Line: 4 ]] --[[ Name: Lerp ]]
    return v2 + (v3 - v2) * v4;
end;
v0.start = function(_, v7, v8) --[[ Line: 8 ]] --[[ Name: start ]]
    local v9 = nil;
    local v10 = nil;
    v10 = game["Run Service"].Heartbeat:Connect(function() --[[ Line: 11 ]]
        -- upvalues: v7 (copy), v8 (copy), v9 (ref), v10 (ref)
        if v7 and v7.Parent ~= nil then
            local v11 = v7.PlaybackLoudness / 100;
            if v7.IsPlaying == true then
                local v12 = v11 / 50;
                v8.Parent.Bone.LeftBlast.Position = v8.Parent.Bone.LeftBlast.Position:Lerp(Vector3.new(-0.161 - v12, v8.Parent.Bone.LeftBlast.Position.Y, v8.Parent.Bone.LeftBlast.Position.Z), 0.2);
                v8.Parent.BoneR.RightBlast.Position = v8.Parent.BoneR.RightBlast.Position:Lerp(Vector3.new(-0.161 - v12, v8.Parent.BoneR.RightBlast.Position.Y, v8.Parent.BoneR.RightBlast.Position.Z), 0.2);
                local l_v8_Children_0 = v8:GetChildren();
                for v14 = 1, #l_v8_Children_0 do
                    if l_v8_Children_0[v14]:IsA("ParticleEmitter") then
                        if v9 == nil then
                            v9 = v11 / 7;
                        end;
                        local l_v9_0 = v9;
                        local v16 = math.clamp(l_v9_0 + (v11 / 8 - l_v9_0) * 0.2, 0, 20);
                        l_v8_Children_0[v14].Rate = 1 + v11 * 1;
                        l_v8_Children_0[v14].Drag = 2 - v11;
                        l_v8_Children_0[v14].RotSpeed = NumberRange.new(-v11 * 10, v11 * 10);
                        l_v8_Children_0[v14].Speed = NumberRange.new(v11);
                        l_v8_Children_0[v14].Size = NumberSequence.new(v16);
                        v9 = v16;
                    end;
                end;
                return;
            end;
        else
            v10:Disconnect();
            v10 = nil;
        end;
    end);
end;
return v0;