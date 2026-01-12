local l_CollectionService_0 = game:GetService("CollectionService");
local l_PlayerGui_0 = game:GetService("Players").LocalPlayer.PlayerGui;
local l_BountyCharacters_0 = workspace.BountyCharacters;
local v3 = require(script.Board);
local v4 = require(script.Poster);
return {
    Initialized = false, 
    Boards = {}, 
    Tools = {}, 
    AddPoster = function(v5, v6) --[[ Line: 16 ]] --[[ Name: AddPoster ]]
        for _, v8 in v5.Boards do
            v8:AddPoster(v6);
        end;
    end, 
    RemovePoster = function(v9, v10) --[[ Line: 22 ]] --[[ Name: RemovePoster ]]
        for _, v12 in v9.Boards do
            v12:RemovePoster(v10);
        end;
    end, 
    AddBoard = function(v13, v14) --[[ Line: 28 ]] --[[ Name: AddBoard ]]
        -- upvalues: v3 (copy)
        if v13.Boards[v14] then
            return;
        else
            v13.Boards[v14] = v3.new({
                Board = v14
            });
            return;
        end;
    end, 
    RemoveBoard = function(v15, v16) --[[ Line: 33 ]] --[[ Name: RemoveBoard ]]
        if not v15.Boards[v16] then
            return;
        else
            v15.Boards[v16]:Destroy();
            v15.Boards[v16] = nil;
            return;
        end;
    end, 
    AddTool = function(v17, v18) --[[ Line: 39 ]] --[[ Name: AddTool ]]
        -- upvalues: l_PlayerGui_0 (copy), v4 (copy)
        local v19 = Instance.fromExisting(script.Board.BoardUI);
        v19.ResetOnSpawn = false;
        v19.LightInfluence = 1;
        v19.Adornee = v18:WaitForChild("Handle");
        v19.Parent = l_PlayerGui_0:WaitForChild("BountyHunt"):WaitForChild("Tools");
        if not v18:WaitForChild("Render") then
            v19:Destroy();
            return;
        else
            local v20 = v18.Render.Value or v18.Render.Changed:Wait();
            local v21 = v4.new({
                HuntedCharacter = v20, 
                ParentUI = v19
            });
            v21.Cleaner:AddTask(v19);
            local function v22() --[[ Line: 58 ]] --[[ Name: UpdateVisibility ]]
                -- upvalues: v18 (copy), v17 (copy), v19 (copy)
                if v18:IsDescendantOf(game) == false then
                    v17:RemoveTool(v18);
                    return;
                else
                    v19.Enabled = v18.Parent:FindFirstChild("Humanoid") ~= nil;
                    return;
                end;
            end;
            local function v24(v23) --[[ Line: 63 ]] --[[ Name: UpdateAdornee ]]
                -- upvalues: v19 (copy)
                if v23.Name ~= "Handle" then
                    return;
                else
                    v19.Adornee = v23;
                    return;
                end;
            end;
            local l_UI_0 = v21.UI;
            l_UI_0.Background.Rotation = 0;
            l_UI_0.Size = UDim2.fromScale(1, 1);
            if v18:IsDescendantOf(game) == false then
                v17:RemoveTool(v18);
            else
                v19.Enabled = v18.Parent:FindFirstChild("Humanoid") ~= nil;
            end;
            v21.Cleaner:AddTask(v18:GetPropertyChangedSignal("Parent"):Connect(v22));
            v21.Cleaner:AddTask(v18.ChildAdded:Connect(v24));
            print("tool added");
            v17.Tools[v18] = v21;
            return;
        end;
    end, 
    RemoveTool = function(v26, v27) --[[ Line: 80 ]] --[[ Name: RemoveTool ]]
        if not v26.Tools[v27] then
            return;
        else
            print("tool destroyed");
            v26.Tools[v27]:Destroy();
            v26.Tools[v27] = nil;
            return;
        end;
    end, 
    Initialize = function(v28) --[[ Line: 89 ]] --[[ Name: Initialize ]]
        -- upvalues: l_CollectionService_0 (copy), l_BountyCharacters_0 (copy)
        if v28.Initialized then
            return;
        else
            local function v30(v29) --[[ Line: 92 ]] --[[ Name: AddBoard ]]
                -- upvalues: v28 (copy)
                v28:AddBoard(v29);
            end;
            local function v32(v31) --[[ Line: 96 ]] --[[ Name: RemoveBoard ]]
                -- upvalues: v28 (copy)
                v28:RemoveBoard(v31);
            end;
            for _, v34 in l_CollectionService_0:GetTagged("Bounty Boards") do
                task.spawn(v30, v34);
            end;
            l_CollectionService_0:GetInstanceAddedSignal("Bounty Boards"):Connect(v30);
            l_CollectionService_0:GetInstanceRemovedSignal("Bounty Boards"):Connect(v32);
            local function v36(v35) --[[ Line: 104 ]] --[[ Name: AddPoster ]]
                -- upvalues: v28 (copy)
                v28:AddPoster(v35);
            end;
            local function v38(v37) --[[ Line: 108 ]] --[[ Name: RemovePoster ]]
                -- upvalues: v28 (copy)
                v28:RemovePoster(v37);
            end;
            for _, v40 in l_BountyCharacters_0:GetChildren() do
                task.spawn(v36, v40);
            end;
            l_BountyCharacters_0.ChildAdded:Connect(v36);
            l_BountyCharacters_0.ChildRemoved:Connect(v38);
            local function v42(v41) --[[ Line: 116 ]] --[[ Name: AddTool ]]
                -- upvalues: v28 (copy)
                v28:AddTool(v41);
            end;
            local function v44(v43) --[[ Line: 120 ]] --[[ Name: RemoveTool ]]
                -- upvalues: v28 (copy)
                v28:RemoveTool(v43);
            end;
            l_CollectionService_0:GetInstanceAddedSignal("Bounty Posters"):Connect(v42);
            l_CollectionService_0:GetInstanceRemovedSignal("Bounty Posters"):Connect(v44);
            warn("bounty hunting initialized");
            v28.Initialized = true;
            return;
        end;
    end
};