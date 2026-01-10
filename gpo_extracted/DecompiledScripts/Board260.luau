local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_Players_0 = game:GetService("Players");
local l_Modules_0 = l_ReplicatedStorage_0.BountyHunting.Modules;
local l_BountyCharacters_0 = workspace.BountyCharacters;
local l_PlayerGui_0 = l_Players_0.LocalPlayer.PlayerGui;
local v5 = require(l_Modules_0.Maid);
local _ = require(l_Modules_0.Signal);
local v7 = require(script.Parent.Poster);
local v8 = require(l_ReplicatedStorage_0.Modules.Shared.Queues.QueueTask);
local v9 = {};
v9.__index = v9;
v9.new = function(v10) --[[ Line: 19 ]] --[[ Name: new ]]
    -- upvalues: v9 (copy), v5 (copy), v8 (copy)
    local v11 = setmetatable({}, v9);
    v11.Cleaner = v5.new();
    v11.Model = v10.Board;
    v11.ID = v11.Model:GetAttribute("ID");
    v11.Posters = {};
    v11.UI = v11:_createUI();
    v11.Serialized = {};
    v11.Queue = v8.new();
    v11:_main();
    return v11;
end;
v9._createUI = function(v12) --[[ Line: 37 ]] --[[ Name: _createUI ]]
    -- upvalues: l_PlayerGui_0 (copy)
    local v13 = script.BoardUI:Clone();
    v13.Adornee = v12.Model;
    v13.Parent = l_PlayerGui_0:WaitForChild("BountyHunt"):WaitForChild("Board");
    v12.Cleaner:AddTask(v13);
    return v13;
end;
v9.GetPoster = function(v14, v15) --[[ Line: 47 ]] --[[ Name: GetPoster ]]
    return v14.Posters[v15];
end;
v9.AddPoster = function(v16, v17) --[[ Line: 51 ]] --[[ Name: AddPoster ]]
    -- upvalues: v7 (copy)
    if v16:GetPoster(v17) then
        return;
    else
        v16.Queue:QueueTask(function() --[[ Line: 54 ]]
            -- upvalues: v16 (copy), v17 (copy), v7 (ref)
            v16.Posters[v17] = v7.new({
                HuntedCharacter = v17, 
                ParentUI = v16.UI.CanvasGroup:WaitForChild("ScrollingFrame", 2), 
                Parent = v16
            });
            task.wait(0.5);
        end);
        v16.Serialized[v17] = v16.Queue.pendingTasks[#v16.Queue.pendingTasks];
        return;
    end;
end;
v9.RemovePoster = function(v18, v19) --[[ Line: 62 ]] --[[ Name: RemovePoster ]]
    local v20 = table.find(v18.Queue.pendingTasks, v18.Serialized[v19]);
    if v20 then
        table.remove(v18.Queue.pendingTasks, v20);
        v18.Serialized[v19] = nil;
    end;
    if not v18:GetPoster(v19) then
        return;
    else
        v18.Posters[v19]:Destroy();
        v18.Posters[v19] = nil;
        return;
    end;
end;
v9._main = function(v21) --[[ Line: 76 ]] --[[ Name: _main ]]
    -- upvalues: l_BountyCharacters_0 (copy)
    for _, v23 in l_BountyCharacters_0:GetChildren() do
        v21.Cleaner:AddTask(task.delay(0, v21.AddPoster, v21, v23));
    end;
end;
v9.Destroy = function(v24) --[[ Line: 84 ]] --[[ Name: Destroy ]]
    for _, v26 in v24.Posters do
        v26:Destroy();
    end;
    v24.Cleaner:Destroy();
    setmetatable(v24, nil);
end;
return v9;