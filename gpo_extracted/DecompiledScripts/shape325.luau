--!native
local v0 = require("./utility");
local v6 = {
    getSurfaceCFrame = function(v1, v2, v3) --[[ Line: 7 ]] --[[ Name: getSurfaceCFrame ]]
        local v4 = if math.abs((v2:Dot((Vector3.new(0, 1, 0, 0))))) > 0.99 then Vector3.new(0, 0, 1, 0) else Vector3.new(0, 1, 0, 0);
        local v5 = CFrame.lookAt(Vector3.new(0, 0, 0, 0), v2, v4);
        return v1 * CFrame.new(v3) * v5;
    end
};
v6.getPointWithinBox = function(v7, v8, v9, v10) --[[ Line: 13 ]] --[[ Name: getPointWithinBox ]]
    -- upvalues: v6 (copy)
    debug.profilebegin("getPointWithinBox");
    local v11 = Random.new(v7);
    local v12 = v9 / 2;
    local v13 = Vector3.new(v11:NextNumber(-1, 1), v11:NextNumber(-1, 1), v11:NextNumber(-1, 1)) * v12;
    local v14 = v6.getSurfaceCFrame(v8, Vector3.FromNormalId(v10), v13);
    debug.profileend();
    return v14;
end;
v6.getPointOnBox = function(v15, v16, v17, v18) --[[ Line: 34 ]] --[[ Name: getPointOnBox ]]
    -- upvalues: v6 (copy)
    debug.profilebegin("getPointOnBox");
    local v19 = Random.new(v15);
    local v20 = Vector3.FromNormalId(v18);
    local v21 = v17 / 2;
    local v22 = Vector3.new(1, 1, 1, 0) - v20:Abs();
    local v23 = Vector3.new(v19:NextNumber(-1, 1), v19:NextNumber(-1, 1), v19:NextNumber(-1, 1)) * v21 * v22;
    local v24 = v6.getSurfaceCFrame(v16, v20, v23 + v20 * v21);
    debug.profileend();
    return v24;
end;
v6.getPointWithinCylinder = function(v25, v26, v27, v28, v29, v30) --[[ Line: 58 ]] --[[ Name: getPointWithinCylinder ]]
    -- upvalues: v0 (copy)
    debug.profilebegin("getPointWithinCylinder");
    local v31 = Random.new(v25);
    local v32 = math.sqrt((v31:NextNumber(v26, 1)));
    local v33 = v31:NextNumber(0, 6.283185307179586);
    if v30 == Enum.NormalId.Left or v30 == Enum.NormalId.Right then
        v28 = v28 * CFrame.fromOrientation(0, 1.5707963267948966 * (v30 == Enum.NormalId.Right and -1 or 1), 0);
        v29 = Vector3.new(v29.Z, v29.Y, v29.X);
    elseif v30 == Enum.NormalId.Front or v30 == Enum.NormalId.Back then
        v28 = v28 * CFrame.fromOrientation(0, 3.141592653589793, 0);
    end;
    local v34 = 1 - v31:NextNumber() ^ v0.lerp(0.5, 1, (math.sqrt(v27)));
    local v35 = v0.lerp(1, v27, v34);
    local v36 = Vector3.new(v34 * 2 - 1, v32 * math.sin(v33) * v35, v32 * math.cos(v33) * v35) * v29 / 2;
    local v37 = Vector3.new(0, math.sin(v33) * v35, math.cos(v33) * v35) * v29 / 2;
    local l_Unit_0 = v37.Unit;
    local l_UpVector_0 = v28.UpVector;
    if l_Unit_0 ~= l_Unit_0 then
        l_Unit_0 = Vector3.new(0, 0, 0, 0);
    end;
    if math.abs(l_Unit_0.Y) > 0.999 then
        l_UpVector_0 = if not (v30 ~= Enum.NormalId.Left) or v30 == Enum.NormalId.Right then v28.RightVector else v28.LookVector;
    end;
    local v40 = v28 * CFrame.new(v36) * CFrame.lookAt(Vector3.new(0, 0, 0, 0), v37, l_UpVector_0);
    debug.profileend();
    return v40;
end;
v6.getPointWithinSphere = function(v41, v42, v43, v44, v45, v46) --[[ Line: 121 ]] --[[ Name: getPointWithinSphere ]]
    -- upvalues: v6 (copy)
    debug.profilebegin("getPointWithinSphere");
    local v47 = Random.new(v41);
    local v48 = v47:NextNumber();
    local v49 = v47:NextNumber();
    local v50 = v48 * 2 * 3.141592653589793;
    local v51 = math.acos(2 * v49 - 1) * v43;
    local v52 = v47:NextNumber(v42, 1) ^ 0.3333333333333333;
    local v53 = math.sin(v50);
    local v54 = math.cos(v50);
    local v55 = math.sin(v51);
    local v56 = math.cos(v51);
    local v57 = Vector3.FromNormalId(v46);
    if v46 == Enum.NormalId.Left or v46 == Enum.NormalId.Right then
        v45 = Vector3.new(v45.Z, v45.Y, v45.X);
    elseif v46 == Enum.NormalId.Top or v46 == Enum.NormalId.Bottom then
        v45 = Vector3.new(v45.X, v45.Z, v45.Y);
    end;
    local v58 = v45 / 2;
    local v59 = v6.getSurfaceCFrame(v44, v57, (Vector3.new(0, 0, 0, 0)));
    local v60 = Vector3.new(v52 * v55 * v54, v52 * v55 * v53, v52 * v56) * v58;
    local l_Unit_1 = v60.Unit;
    local l_UpVector_1 = v44.UpVector;
    if l_Unit_1 ~= l_Unit_1 then
        l_Unit_1 = Vector3.new(0, 0, 0, 0);
    end;
    if math.abs(l_Unit_1.Y) > 0.999 then
        l_UpVector_1 = if not (v46 ~= Enum.NormalId.Left) or v46 == Enum.NormalId.Right then v44.RightVector else v44.LookVector;
    end;
    local v63 = v59 * CFrame.Angles(0, 3.141592653589793, 0) * CFrame.new(v60) * CFrame.lookAt(Vector3.new(0, 0, 0, 0), v60, l_UpVector_1);
    debug.profileend();
    return v63;
end;
v6.getPointWithinDisc = function(v64, v65, v66, v67, v68, v69) --[[ Line: 189 ]] --[[ Name: getPointWithinDisc ]]
    -- upvalues: v0 (copy), v6 (copy)
    debug.profilebegin("getPointWithinDisc");
    local v70 = Random.new(v64);
    local v71 = Vector3.FromNormalId(v69);
    local v72 = Vector3.new(1, 1, 1, 0) - v71:Abs() * v65;
    local v73 = v68 / 2;
    local v74 = v70:NextNumber(v65, 1);
    local v75 = v0.lerp(1, 0.5, v66 ^ 4);
    local v76 = v70:NextNumber(1 - v66, 1) ^ v75;
    local v77 = v70:NextNumber(0, 6.283185307179586);
    local v78 = Vector3.new(v74 * 2 - 1, v76 * math.sin(v77), v76 * math.cos(v77));
    if v69 == Enum.NormalId.Bottom or v69 == Enum.NormalId.Top then
        v78 = Vector3.new(v78.Z, v78.X, v78.Y);
    elseif v69 == Enum.NormalId.Front or v69 == Enum.NormalId.Back then
        v78 = Vector3.new(v78.Y, v78.Z, v78.X);
    end;
    v78 = v78 * (v73 * v72);
    local v79 = v6.getSurfaceCFrame(v67, v71, v78 + v71 * v65 * v73);
    debug.profileend();
    return v79;
end;
return v6;