local l_select_0 = select;
local function v6(v1, v2, ...)
    local v3, v4 = {
        ...
    }, l_select_0("#", ...);
    for v5 = v2, v2 + v4 - 1 do
        v1[v5] = v3[v5 - v2 + 1];
    end;
end;
local v7 = {};
local v8 = nil;
local v9 = nil;
local v10 = nil;
local v11 = nil;
local v12 = nil;
local function _(v13, v14) --[[ Line: 10 ]] --[[ Name: distancePlaneFromOrigin ]]
    return -v14:Dot(v13);
end;
v7.getFrustumPlanes = function(v16, v17) --[[ Line: 14 ]] --[[ Name: getFrustumPlanes ]]
    -- upvalues: v9 (ref), v10 (ref), v11 (ref), v12 (ref), v8 (ref)
    local l_CFrame_0 = v16.CFrame;
    if l_CFrame_0 ~= v9 or v16.FieldOfView ~= v10 or v16.MaxAxisFieldOfView ~= v11 or v17 ~= v12 then
        v9 = l_CFrame_0;
        v10 = v16.FieldOfView;
        v11 = v16.MaxAxisFieldOfView;
        v12 = v17;
        local v19 = math.rad(v16.MaxAxisFieldOfView) * 0.5;
        local v20 = math.rad(v16.FieldOfView) * 0.5;
        local v21 = {};
        local l_LookVector_0 = l_CFrame_0.LookVector;
        local l_Position_0 = l_CFrame_0.Position;
        local v24 = -l_CFrame_0.LookVector:Dot(l_Position_0);
        v6(v21, 1, l_LookVector_0, v24);
        l_LookVector_0 = l_CFrame_0 * CFrame.new(0, 0, -v17);
        v24 = {};
        l_Position_0 = -l_LookVector_0.LookVector;
        local l_Position_1 = l_LookVector_0.Position;
        local v26 = -(-l_LookVector_0.LookVector):Dot(l_Position_1);
        v6(v24, 1, l_Position_0, v26);
        l_Position_0 = l_CFrame_0 * CFrame.Angles(0, -v19, 0);
        v26 = {};
        l_Position_1 = -l_Position_0.RightVector;
        local l_Position_2 = l_Position_0.Position;
        local v28 = -(-l_Position_0.RightVector):Dot(l_Position_2);
        v6(v26, 1, l_Position_1, v28);
        l_Position_1 = l_CFrame_0 * CFrame.Angles(0, v19, 0);
        v28 = {};
        l_Position_2 = l_Position_1.RightVector;
        local l_Position_3 = l_Position_1.Position;
        local v30 = -l_Position_1.RightVector:Dot(l_Position_3);
        v6(v28, 1, l_Position_2, v30);
        l_Position_2 = l_CFrame_0 * CFrame.Angles(-v20, 0, 0);
        v30 = {};
        l_Position_3 = l_Position_2.UpVector;
        local l_Position_4 = l_Position_2.Position;
        local v32 = -l_Position_2.UpVector:Dot(l_Position_4);
        v6(v30, 1, l_Position_3, v32);
        l_Position_3 = l_CFrame_0 * CFrame.Angles(v20, 0, 0);
        v32 = {};
        l_Position_4 = -l_Position_3.UpVector;
        local l_Position_5 = l_Position_3.Position;
        local v34 = -(-l_Position_3.UpVector):Dot(l_Position_5);
        v6(v32, 1, l_Position_4, v34);
        v8 = {
            v21, 
            v24, 
            v26, 
            v28, 
            v30, 
            v32
        };
    end;
    return v8;
end;
v7.findInFrustum = function(v35, v36, v37) --[[ Line: 54 ]] --[[ Name: findInFrustum ]]
    for _, v39 in ipairs(v35) do
        local v40 = v39[1];
        local v41 = v39[2];
        if v36:Dot(v40) + v41 + v37 * 0.7 <= 0 then
            return false;
        end;
    end;
    return true;
end;
return v7;