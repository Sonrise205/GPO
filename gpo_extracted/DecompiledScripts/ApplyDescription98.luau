local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Flipper);
local function v10(v2) --[[ Line: 4 ]] --[[ Name: CollectKeypoints ]]
    if typeof(v2) == "ColorSequence" then
        local v3 = {};
        for v4, v5 in pairs(v2.Keypoints) do
            local l_Value_0 = v5.Value;
            v3[v4] = {
                T = v5.Time, 
                V = {
                    R = l_Value_0.R, 
                    G = l_Value_0.G, 
                    B = l_Value_0.B
                }
            };
        end;
        return v3;
    else
        local v7 = {};
        for v8, v9 in pairs(v2.Keypoints) do
            v7[v8] = {
                T = v9.Time, 
                V = v9.Value
            };
        end;
        return v7;
    end;
end;
local function _(v11, v12) --[[ Line: 40 ]] --[[ Name: SpringKeypoints ]]
    -- upvalues: v1 (copy)
    local v13 = {};
    for v14, v15 in pairs(v11) do
        v13[v14] = {
            T = v1.Spring.new(v15.T, v12)
        };
        if typeof(v15.V) == "table" then
            local l_V_0 = v15.V;
            v13[v14].V = {
                R = v1.Spring.new(l_V_0.R, v12), 
                G = v1.Spring.new(l_V_0.G, v12), 
                B = v1.Spring.new(l_V_0.B, v12)
            };
        else
            v13[v14].V = v1.Spring.new(v15.V, v12);
        end;
    end;
    return v13;
end;
return function(v18, v19, v20, v21, v22) --[[ Line: 70 ]]
    -- upvalues: v10 (copy), v1 (copy)
    for _, v24 in pairs(v18.StyleBindings) do
        local v25 = v20[v19[v24]];
        local v26 = v18[v24]:getValue();
        if not v26 or not v26.Color then
            v18["Set" .. v24](v25);
        else
            local l_Color_0 = v26.Color;
            local l_R_0 = l_Color_0.R;
            local l_G_0 = l_Color_0.G;
            local l_B_0 = l_Color_0.B;
            local v31 = v18[v24 .. "Motor"];
            if v31 then
                pcall(v31.destroy, v31);
            end;
            local v32 = {
                R = l_R_0, 
                G = l_G_0, 
                B = l_B_0, 
                T = v26.Transparency
            };
            if v26.ColorSequence then
                v32.CS = v10(v26.ColorSequence);
            end;
            if v26.TransparencySequence then
                v32.TS = v10(v26.TransparencySequence);
            end;
            local v33 = v1.GroupMotor.new(v32);
            v18[v24 .. "Motor"] = v33;
            v33:onStep(function(v34) --[[ Line: 131 ]]
                -- upvalues: v18 (copy), v24 (copy), v25 (copy)
                local v35 = nil;
                local v36 = nil;
                if v34.CS then
                    local v37 = {};
                    for v38, v39 in pairs(v34.CS) do
                        local l_V_1 = v39.V;
                        v37[v38] = ColorSequenceKeypoint.new(v39.T, Color3.new(l_V_1.R, l_V_1.G, l_V_1.B));
                    end;
                    v35 = ColorSequence.new(v37);
                end;
                if v34.TS then
                    local v41 = {};
                    for v42, v43 in pairs(v34.TS) do
                        v41[v42] = NumberSequenceKeypoint.new(v43.T, v43.V);
                    end;
                    v36 = NumberSequence.new(v41);
                end;
                v18["Set" .. v24]({
                    Color = Color3.new(v34.R, v34.G, v34.B), 
                    Transparency = v34.T, 
                    ColorSequence = v25.ColorSequence, 
                    TransparencySequence = v25.TransparencySequence
                });
            end);
            v33:onComplete(function() --[[ Line: 173 ]]
                -- upvalues: v33 (copy), v18 (copy), v24 (copy)
                v33:destroy();
                v18[v24 .. "Motor"] = nil;
            end);
            local l_Color_1 = v25.Color;
            local l_R_1 = l_Color_1.R;
            local l_G_1 = l_Color_1.G;
            local l_B_1 = l_Color_1.B;
            local v48 = {
                R = v1.Spring.new(l_R_1, v21), 
                G = v1.Spring.new(l_G_1, v21), 
                B = v1.Spring.new(l_B_1, v21), 
                T = v1.Spring.new(v25.Transparency, v22)
            };
            if v25.ColorSequence then

            end;
            if v25.TransparencySequence then

            end;
            v33:setGoal(v48);
        end;
    end;
end;