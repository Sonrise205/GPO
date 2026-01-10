local v0 = {};
local _ = require(game.ReplicatedStorage.Modules.BindToRender);
local v2 = {};
v0.start = function(_, v4, v5) --[[ Line: 5 ]] --[[ Name: start ]]
    -- upvalues: v2 (copy)
    if v4 == nil then
        warn("returned");
        return;
    else
        table.insert(v2, {
            v4, 
            v5
        });
        return;
    end;
end;
local function _(v6, v7) --[[ Line: 13 ]] --[[ Name: mult ]]
    local v8, v9, v10, v11, v12, v13, v14, v15, v16, v17, v18, v19 = v6:components();
    return CFrame.new(v8 * v7, v9 * v7, v10 * v7, v11 * v7, v12 * v7, v13 * v7, v14 * v7, v15 * v7, v16 * v7, v17 * v7, v18 * v7, v19 * v7);
end;
game["Run Service"].RenderStepped:Connect(function(v21) --[[ Line: 18 ]] --[[ Name: renderFunction ]]
    -- upvalues: v2 (copy)
    local v22 = {};
    local v23 = {};
    for v24 = 1, #v2 do
        if v2[v24] then
            local v25, v26 = unpack(v2[v24]);
            if v25 then
                if (v25:IsA("BasePart") or v25:IsA("Model")) and _G.checkRenderDistance(v25:GetPivot().Position) == false then
                    continue;
                end;
            elseif _G.checkRenderDistance(v25.Parent:GetPivot().Position) == false then
                continue;
            end;
            if not pcall(function() --[[ Line: 37 ]]
                -- upvalues: v25 (copy), v26 (copy), v21 (copy), v22 (copy), v23 (copy), v2 (ref), v24 (copy)
                if v25 and v25.Parent ~= nil and v25:IsDescendantOf(workspace) then
                    local l_v26_0 = v26;
                    local v28 = v21 * 60;
                    local v29, v30, v31, v32, v33, v34, v35, v36, v37, v38, v39, v40 = l_v26_0:components();
                    local v41 = CFrame.new(v29 * v28, v30 * v28, v31 * v28, v32 * v28, v33 * v28, v34 * v28, v35 * v28, v36 * v28, v37 * v28, v38 * v28, v39 * v28, v40 * v28);
                    if v25:IsA("BasePart") then
                        table.insert(v22, v25);
                        table.insert(v23, v25.CFrame * v41);
                        return;
                    elseif v25:IsA("Model") then
                        v25:SetPrimaryPartCFrame(v25.PrimaryPart.CFrame * v41);
                        return;
                    else
                        v25.C0 = v25.C0 * v41;
                        return;
                    end;
                else
                    table.clear(v2[v24]);
                    table.remove(v2, v24);
                    return;
                end;
            end) then
                table.clear(v2[v24]);
                table.remove(v2, v24);
            end;
        else
            table.remove(v2, v24);
        end;
    end;
    if #v22 > 0 then
        workspace:BulkMoveTo(v22, v23, Enum.BulkMoveMode.FireCFrameChanged);
    end;
end);
return v0;