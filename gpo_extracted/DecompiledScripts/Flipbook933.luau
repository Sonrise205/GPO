local v0 = require(script.Parent.Range);
local v31 = {
    Loop = function(v1, v2, v3, v4) --[[ Line: 5 ]] --[[ Name: Loop ]]
        -- upvalues: v0 (copy)
        local v5 = {};
        for _, v7 in pairs(v2:GetChildren()) do
            if v7.Texture then
                table.insert(v5, v7);
            end;
        end;
        if #v5 == 0 then
            return;
        else
            table.sort(v5, function(v8, v9) --[[ Line: 16 ]]
                return tonumber(v8.Name) < tonumber(v9.Name);
            end);
            local v10 = {};
            for _, v12 in ipairs(v5) do
                table.insert(v10, v12.Texture);
            end;
            local v13 = 1 / v0.RandomValueFromRange(v1.FlipbookFramerate);
            local v14 = v1.FlipbookStartRandom and math.random(1, #v10) or 1;
            local v15 = tick();
            task.spawn(function() --[[ Line: 32 ]]
                -- upvalues: v15 (copy), v4 (copy), v3 (copy), v10 (copy), v14 (ref), v13 (copy)
                while tick() - v15 < v4 do
                    v3.Texture = v10[v14];
                    v14 = v14 + 1;
                    if v14 > #v10 then
                        v14 = 1;
                    end;
                    task.wait(v13);
                end;
            end);
            return;
        end;
    end, 
    OneShot = function(v16, v17, v18, v19) --[[ Line: 46 ]] --[[ Name: OneShot ]]
        local v20 = {};
        for _, v22 in pairs(v17:GetChildren()) do
            if v22.Texture then
                table.insert(v20, v22);
            end;
        end;
        if #v20 == 0 then
            return;
        else
            table.sort(v20, function(v23, v24) --[[ Line: 58 ]]
                return tonumber(v23.Name) < tonumber(v24.Name);
            end);
            local v25 = {};
            for _, v27 in ipairs(v20) do
                table.insert(v25, v27.Texture);
            end;
            if #v25 == 0 then
                return;
            else
                local v28 = v19 / #v25;
                local v29 = v16.FlipbookStartRandom and math.random(1, #v25) or 1;
                task.spawn(function() --[[ Line: 75 ]]
                    -- upvalues: v25 (copy), v29 (ref), v18 (copy), v28 (copy)
                    for _ = 1, #v25 do
                        if v29 <= #v25 then
                            v18.Texture = v25[v29];
                            v29 = v29 + 1;
                            task.wait(v28);
                        else
                            break;
                        end;
                    end;
                end);
                return;
            end;
        end;
    end
};
v31.Flip = function(v32, v33, v34, v35) --[[ Line: 87 ]] --[[ Name: Flip ]]
    -- upvalues: v31 (copy)
    local l_FlipbookMode_0 = v32.FlipbookMode;
    if l_FlipbookMode_0 == Enum.ParticleFlipbookMode.Loop then
        v31.Loop(v32, v33, v34, v35);
        return;
    elseif l_FlipbookMode_0 == Enum.ParticleFlipbookMode.OneShot then
        v31.OneShot(v32, v33, v34, v35);
        return;
    else
        return;
    end;
end;
return v31;