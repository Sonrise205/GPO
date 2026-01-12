if workspace.StreamingEnabled == true then
    return;
else
    local v0 = 1000;
    local l_RenderCache_0 = script.RenderCache;
    l_RenderCache_0.Parent = nil;
    if game.ReplicatedStorage.reservedCode.Value == "arena" then
        script:Destroy();
        return;
    else
        _G.RenderCache = l_RenderCache_0;
        _G.IslandCFrames = {};
        local v2 = {
            "Tree", 
            "Bookshelf", 
            "Hut", 
            "Cactus", 
            "FirePole", 
            "Bush", 
            "House", 
            "Building", 
            "Buildings", 
            "Lantern", 
            "Barrel", 
            "Table", 
            "Lamp", 
            "Torch", 
            "Boxes"
        };
        local v3 = require(script.Octree.Octree).new();
        local function v10(v4, v5) --[[ Line: 21 ]] --[[ Name: ClosestPointOnModel ]]
            local l_v4_BoundingBox_0, v7 = v4:GetBoundingBox();
            local v8 = l_v4_BoundingBox_0:pointToObjectSpace(v5);
            local v9 = v7 * 0.5;
            return l_v4_BoundingBox_0 * Vector3.new(math.clamp(v8.x, -v9.x, v9.x), math.clamp(v8.y, -v9.y, v9.y), (math.clamp(v8.z, -v9.z, v9.z)));
        end;
        local function _(v11) --[[ Line: 32 ]] --[[ Name: checkName ]]
            -- upvalues: v2 (copy)
            local v12 = false;
            for v13 = 1, #v2 do
                if string.lower(v11.Name):match(string.lower(v2[v13])) then
                    return true;
                end;
            end;
            return v12;
        end;
        local v15 = {};
        local l_CurrentCamera_0 = workspace.CurrentCamera;
        local _ = {};
        local v18 = {};
        for _, v20 in (workspace.Islands:GetChildren()) do
            if v20:IsA("Model") then
                v15[v20] = true;
                v18[v20] = v20.Parent;
                _G.IslandCFrames[v20.Name] = v20:GetModelCFrame();
                v3:CreateNode(v20:GetModelCFrame().p, v20);
            end;
        end;
        for _, v22 in (workspace.Islands:GetDescendants()) do
            if v22:IsA("Model") and v22.Parent ~= workspace.Islands then
                v18[v22] = v22.Parent;
                v3:CreateNode(v22:GetModelCFrame().p, v22);
            end;
        end;
        for _, v24 in (workspace.BuyableItems:GetChildren()) do
            if v24:IsA("Model") then
                v18[v24] = v24.Parent;
                v3:CreateNode(v24:GetModelCFrame().p, v24);
            end;
        end;
        for _, v26 in (workspace.Jails:GetDescendants()) do
            if v26:IsA("Model") and v26.Parent:IsA("ObjectValue") then
                v18[v26] = v26.Parent;
                v3:CreateNode(v26:GetModelCFrame().p, v26);
            end;
        end;
        local l_Children_0 = workspace.Env:GetChildren();
        for v28 = 1, #l_Children_0 do
            if l_Children_0[v28]:GetAttribute("render") ~= nil and l_Children_0[v28]:IsA("Model") then
                local v29 = l_Children_0[v28];
                v18[v29] = v29.Parent;
                v3:CreateNode(v29:GetModelCFrame().p, v29);
            end;
        end;
        local l_Tagged_0 = game:GetService("CollectionService"):GetTagged("Seats");
        for v31 = 1, #l_Tagged_0 do
            if l_Tagged_0[v31]:IsA("Seat") then
                l_Tagged_0[v31].Disabled = false;
            end;
        end;
        workspace.Islands.ChildAdded:Connect(function(v32) --[[ Line: 101 ]]
            -- upvalues: v15 (copy), v18 (copy), v3 (copy)
            if v15[v32] == true then
                return;
            else
                for _, v34 in (v32:GetDescendants()) do
                    if v34:IsA("Model") and v34.Parent ~= workspace.Islands then
                        v18[v34] = v34.Parent;
                        v3:CreateNode(v34:GetModelCFrame().p, v34);
                    end;
                end;
                return;
            end;
        end);
        local l_LocalPlayer_0 = game.Players.LocalPlayer;
        local v36 = {};
        local v37 = Vector3.new(0, 10000000000, 0, 0);
        local l_FirstChild_0 = game.ReplicatedStorage:FindFirstChild("Stats" .. l_LocalPlayer_0.Name);
        local v39 = tick();
        local v40 = 0;
        local _ = function() --[[ Line: 123 ]] --[[ Name: updateRender ]]
            -- upvalues: v0 (ref), v37 (ref), l_CurrentCamera_0 (copy), v39 (ref), l_FirstChild_0 (ref), l_LocalPlayer_0 (copy), v3 (copy), v10 (copy), v36 (copy), l_RenderCache_0 (copy), v18 (copy), v40 (ref)
            if _G.omegabooster == true then
                v0 = 500;
            elseif _G.fastmode == true then
                v0 = 500;
            else
                v0 = 1000;
            end;
            if (v37 - l_CurrentCamera_0.CFrame.Position).magnitude < v0 / 2 and tick() - v39 < 10 then
                return;
            else
                v37 = l_CurrentCamera_0.CFrame.Position;
                if l_FirstChild_0 == nil then
                    l_FirstChild_0 = game.ReplicatedStorage:FindFirstChild("Stats" .. l_LocalPlayer_0.Name);
                end;
                v39 = tick();
                if l_FirstChild_0 then
                    for _, v42 in (v3:GetAllNodes()) do
                        local l_v42_Object_0 = v42:GetObject();
                        v42:SetPosition((v10(l_v42_Object_0, l_CurrentCamera_0.CFrame.p)));
                        if v36[l_v42_Object_0] == nil then
                            v36[l_v42_Object_0] = {
                                pos = l_v42_Object_0:GetModelCFrame().p, 
                                size = l_v42_Object_0:GetModelSize()
                            };
                        end;
                        v36[l_v42_Object_0].isInRangeThisFrame = false;
                    end;
                    for _, v45 in (v3:RadiusSearch(l_CurrentCamera_0.CFrame.p, 1000)) do
                        v36[v45].isInRangeThisFrame = true;
                    end;
                    for _, v47 in (v3:GetAllNodes()) do
                        local l_v47_Object_0 = v47:GetObject();
                        if v36[l_v47_Object_0].isInRangeThisFrame == false and l_v47_Object_0 ~= nil and game.ReplicatedStorage.reservedCode.Value ~= "arena" then
                            if l_v47_Object_0 and l_v47_Object_0.Parent ~= nil and l_v47_Object_0:FindFirstChild(l_FirstChild_0.Stats.SpawnPoint.Value) == nil then
                                l_v47_Object_0.Parent = l_RenderCache_0;
                            end;
                        elseif l_v47_Object_0 ~= nil and l_v47_Object_0.Parent == l_RenderCache_0 then
                            l_v47_Object_0.Parent = v18[l_v47_Object_0];
                            v40 = v40 + 1;
                        end;
                    end;
                end;
                return;
            end;
        end;
        game.ReplicatedStorage.Events.loadIsland.OnClientEvent:Connect(function(v50, v51) --[[ Line: 180 ]]
            -- upvalues: l_RenderCache_0 (copy), v18 (copy)
            if v51 and workspace.StreamingEnabled == true then
                _G.requestStream(v51.p);
                return;
            else
                if l_RenderCache_0:FindFirstChild(v50) and v18[l_RenderCache_0:FindFirstChild(v50)] == workspace.Islands then
                    l_RenderCache_0:FindFirstChild(v50).Parent = workspace.Islands;
                end;
                return;
            end;
        end);
        return;
    end;
end;