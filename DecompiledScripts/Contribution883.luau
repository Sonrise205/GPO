local _ = game:GetService("TweenService");
local _ = game:GetService("MarketplaceService");
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_Players_0 = game:GetService("Players");
local _ = l_Players_0.LocalPlayer;
local l_Shared_0 = l_ReplicatedStorage_0.Modules.Shared;
local _ = require(l_Shared_0.CrewUtils);
local v7 = {};
local v8 = {};
GetNameFromUserId = function(v9) --[[ Line: 15 ]] --[[ Name: GetNameFromUserId ]]
    -- upvalues: v8 (copy), l_Players_0 (copy)
    local l_UserId_0 = v9.UserId;
    if l_UserId_0 == nil then
        return nil;
    elseif typeof(l_UserId_0) ~= "number" then
        return nil;
    else
        local v11 = v8[l_UserId_0];
        if v11 then
            return v11;
        else
            local v12 = nil;
            local l_status_0, _ = pcall(function() --[[ Line: 27 ]]
                -- upvalues: v12 (ref), l_Players_0 (ref), l_UserId_0 (copy)
                v12 = l_Players_0:GetNameFromUserIdAsync(l_UserId_0);
            end);
            if l_status_0 then
                v8[l_UserId_0] = v12;
            end;
            return v12;
        end;
    end;
end;
v7.Setup = function(v15) --[[ Line: 38 ]] --[[ Name: Setup ]]
    -- upvalues: l_ReplicatedStorage_0 (copy)
    local _ = v15.CrewsUI;
    local l_Frame_0 = v15.Frame;
    local l_List_0 = l_Frame_0:WaitForChild("Frame"):WaitForChild("List");
    local v19 = {};
    local function v26(v20, v21) --[[ Line: 46 ]] --[[ Name: AddMember ]]
        -- upvalues: v19 (copy), l_List_0 (copy)
        local l_Key_0 = v21.Key;
        local l_Value_0 = v21.Value;
        local v24 = v19[l_Key_0] or script.ContributerTemplate:Clone();
        v24.LayoutOrder = v20;
        v24.Parent = l_List_0;
        v24.Name = l_Key_0;
        local l_Info_0 = v24.Info;
        l_Info_0.Rank.Text = "#" .. v20;
        l_Info_0.Portrait.Image = ("rbxthumb://type=AvatarHeadShot&id=%*&w=420&h=420"):format(l_Key_0);
        l_Info_0.Username.Text = "Loading name for UserId:" .. l_Key_0;
        l_Info_0.ContributionAmount.Text = l_Value_0 .. " Infamy";
        task.spawn(function() --[[ Line: 62 ]]
            -- upvalues: l_Info_0 (copy), l_Key_0 (copy)
            l_Info_0.Username.Text = GetNameFromUserId({
                UserId = tonumber(l_Key_0)
            }) or "Failed to load name";
        end);
        v19[l_Key_0] = v24;
    end;
    local function _(v27) --[[ Line: 69 ]] --[[ Name: RemoveMember ]]
        -- upvalues: v19 (copy)
        if v19[v27] then
            v19[v27]:Destroy();
            v19[v27] = nil;
        end;
    end;
    local v29 = "";
    v15.UpdateList = function(_, v31) --[[ Line: 76 ]] --[[ Name: UpdateList ]]
        -- upvalues: v26 (copy), v19 (copy), v29 (ref)
        local l_MemberContribution_0 = v31.MemberContribution;
        local v33 = {};
        for v34, v35 in pairs(l_MemberContribution_0) do
            table.insert(v33, {
                Key = v34, 
                Value = v35
            });
        end;
        table.sort(v33, function(v36, v37) --[[ Line: 85 ]]
            return v36.Value > v37.Value;
        end);
        local v38 = {};
        for v39, v40 in pairs(v33) do
            if v39 < 51 then
                v26(v39, v40);
                v38[v40.Key] = true;
            else
                break;
            end;
        end;
        for v41, _ in pairs(v19) do
            if v38[v41] == nil and v19[v41] then
                v19[v41]:Destroy();
                v19[v41] = nil;
            end;
        end;
        v29 = v31.Name;
    end;
    task.spawn(function() --[[ Line: 103 ]]
        -- upvalues: l_ReplicatedStorage_0 (ref), v29 (ref), l_Frame_0 (copy)
        local v43 = l_ReplicatedStorage_0:WaitForChild("CrewsInServer", 360);
        while true do
            local l_v43_FirstChild_0 = v43:FindFirstChild(v29 .. "NextUpdate");
            if l_v43_FirstChild_0 then
                l_Frame_0.Refresh.Text = "\240\159\148\132 " .. math.floor(90 - l_v43_FirstChild_0:GetAttribute("NextCacheUpdate"));
            end;
            task.wait(1);
        end;
    end);
end;
return v7;