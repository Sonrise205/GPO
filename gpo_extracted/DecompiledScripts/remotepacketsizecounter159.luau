local v0 = {
    ["nil"] = 0, 
    EnumItem = 4, 
    boolean = 1, 
    number = 8, 
    UDim = 8, 
    UDim2 = 16, 
    Ray = 24, 
    Faces = 6, 
    Axes = 6, 
    BrickColor = 4, 
    Color3 = 12, 
    Vector2 = 8, 
    Vector3 = 12, 
    Instance = 4, 
    Vector2int16 = 4, 
    Vector3int16 = 6, 
    NumberSequenceKeypoint = 12, 
    ColorSequenceKeypoint = 16, 
    NumberRange = 8, 
    Rect = 16, 
    PhysicalProperties = 20, 
    Color3uint8 = 3
};
local v1 = {
    [CFrame.Angles(0, 0, 0)] = true, 
    [CFrame.Angles(0, 3.141592653589793, 0)] = true, 
    [CFrame.Angles(1.5707963267948966, 0, 0)] = true, 
    [CFrame.Angles(-1.5707963267948966, -3.141592653589793, 0)] = true, 
    [CFrame.Angles(0, 3.141592653589793, 3.141592653589793)] = true, 
    [CFrame.Angles(0, 0, 3.141592653589793)] = true, 
    [CFrame.Angles(-1.5707963267948966, 0, 0)] = true, 
    [CFrame.Angles(1.5707963267948966, 3.141592653589793, 0)] = true, 
    [CFrame.Angles(0, 3.141592653589793, 1.5707963267948966)] = true, 
    [CFrame.Angles(0, 0, -1.5707963267948966)] = true, 
    [CFrame.Angles(0, 1.5707963267948966, 1.5707963267948966)] = true, 
    [CFrame.Angles(0, -1.5707963267948966, -1.5707963267948966)] = true, 
    [CFrame.Angles(0, 0, 1.5707963267948966)] = true, 
    [CFrame.Angles(0, -3.141592653589793, -1.5707963267948966)] = true, 
    [CFrame.Angles(0, -1.5707963267948966, 1.5707963267948966)] = true, 
    [CFrame.Angles(0, 1.5707963267948966, -1.5707963267948966)] = true, 
    [CFrame.Angles(-1.5707963267948966, -1.5707963267948966, 0)] = true, 
    [CFrame.Angles(1.5707963267948966, 1.5707963267948966, 0)] = true, 
    [CFrame.Angles(0, -1.5707963267948966, 0)] = true, 
    [CFrame.Angles(0, 1.5707963267948966, 0)] = true, 
    [CFrame.Angles(1.5707963267948966, -1.5707963267948966, 0)] = true, 
    [CFrame.Angles(-1.5707963267948966, 1.5707963267948966, 0)] = true, 
    [CFrame.Angles(0, 1.5707963267948966, 3.141592653589793)] = true, 
    [CFrame.Angles(0, -1.5707963267948966, 3.141592653589793)] = true
};
local function _(v2, v3) --[[ Line: 74 ]] --[[ Name: GetVLQSize ]]
    return (math.max(math.ceil((math.log(v3 + v2, 128))), v2));
end;
local function v5(v6, v7) --[[ Line: 78 ]] --[[ Name: GetDataByteSize ]]
    -- upvalues: v0 (copy), v5 (copy), v1 (copy)
    local v8 = typeof(v6);
    if v0[v8] then
        return v0[v8];
    elseif v8 == "string" or v8 == "buffer" then
        local v9 = v8 == "string" and #v6 or buffer.len(v6);
        return math.max(math.ceil((math.log(v9 + 1, 128))), 1) + v9;
    elseif v8 == "table" then
        if v7[v6] then
            return 0;
        else
            v7[v6] = true;
            local v10 = 0;
            local v11 = 0;
            local v12 = 1;
            local v13 = v6[1] ~= nil;
            for v14, v15 in next, v6 do
                v12 = v12 + 1;
                if not v13 then
                    v10 = v10 + (v5(v14, v7) + 1);
                end;
                v11 = v11 + (v5(v15, v7) + 1);
            end;
            if v13 then
                return math.max(math.ceil((math.log(v12 + 1, 128))), 1) + v11;
            else
                return math.max(math.ceil((math.log(v12 + 1, 128))), 1) + v10 + v11;
            end;
        end;
    elseif v8 == "CFrame" then
        local v16 = false;
        for v17 in next, v1 do
            if v17 == v6.Rotation then
                v16 = true;
                break;
            end;
        end;
        if v16 then
            return 13;
        else
            return 19;
        end;
    elseif v8 == "NumberSequence" or v8 == "ColorSequence" then
        local v18 = 4;
        for _, v20 in next, v6.Keypoints do
            v18 = v18 + v5(v20, v7);
        end;
        return v18;
    else
        warn("[PacketSizeCounter]: Unsupported data type: " .. v8);
        return 0;
    end;
end;
local v27 = {
    BaseRemoteOverhead = 9, 
    RemoteFunctionOverhead = 2, 
    ClientToServerOverhead = 5, 
    TypeOverhead = 1, 
    GetPacketSize = function(v21) --[[ Line: 173 ]] --[[ Name: GetPacketSize ]]
        -- upvalues: v5 (copy)
        local v22 = 9;
        if v21.RemoteType == "RemoteFunction" then
            v22 = v22 + 2;
        end;
        if v21.RunContext == "Client" then
            v22 = v22 + 5;
        end;
        local v23 = {};
        for _, v25 in ipairs(v21.PacketData) do
            v22 = v22 + (v5(v25, v23) + 1);
        end;
        return v22;
    end, 
    GetDataByteSize = function(v26) --[[ Line: 195 ]] --[[ Name: GetDataByteSize ]]
        -- upvalues: v5 (copy)
        return v5(v26, {}) + 1;
    end
};
table.freeze(v27);
return v27;