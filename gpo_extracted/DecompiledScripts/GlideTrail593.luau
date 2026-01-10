local v0 = {};
local v1 = {};
local function v9(v2, v3) --[[ Line: 5 ]] --[[ Name: trail ]]
    -- upvalues: v1 (copy)
    if v1[v2] == nil then
        v1[v2] = {};
    end;
    local v4 = Instance.new("Attachment", v3);
    v4.Position = Vector3.new(0, 0.10000000149011612, 0, 0);
    local v5 = v4:Clone();
    v5.Position = Vector3.new(0, -0.10000000149011612, 0, 0);
    v5.Parent = v3;
    local v6 = script.Trail:Clone();
    v6.Parent = v3;
    v6.Attachment0 = v4;
    v6.Attachment1 = v5;
    local v7 = {
        v4, 
        v5, 
        v6
    };
    for v8 = 1, #v7 do
        table.insert(v1[v2], v7[v8]);
    end;
end;
v0.start = function(_, v11, v12, v13) --[[ Line: 24 ]] --[[ Name: start ]]
    -- upvalues: v9 (copy), v1 (copy)
    if v11 == game.Players.LocalPlayer then
        return;
    else
        warn(v11, v12, v13);
        v12:WaitForChild("LeftHand", 10);
        v12:WaitForChild("RightHand", 10);
        v12:WaitForChild("RightFoot", 10);
        v12:WaitForChild("LeftFoot", 10);
        v9(v12, v12.RightHand);
        v9(v12, v12.LeftHand);
        v9(v12, v12.RightFoot);
        v9(v12, v12.LeftFoot);
        repeat
            game["Run Service"].Heartbeat:Wait();
        until v13.Parent == nil;
        if v1[v12] then
            for v14 = 1, #v1[v12] do
                if v1[v12][v14]:IsA("Trail") == true then
                    v1[v12][v14].Enabled = false;
                end;
                _G.destroy(v1[v12][v14], 0.25);
            end;
            v1[v12] = nil;
        end;
        return;
    end;
end;
return v0;