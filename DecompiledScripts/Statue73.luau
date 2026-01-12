local l_Players_0 = game:GetService("Players");
local l_Shared_0 = game:GetService("ReplicatedStorage"):WaitForChild("Modules").Shared;
local v2 = require(l_Shared_0.Promises.Promise);
local v3 = {};
v3.__index = v3;
v3.new = function(v4) --[[ Line: 12 ]] --[[ Name: new ]]
    -- upvalues: v3 (copy)
    local v5 = setmetatable({}, v3);
    v5.Model = v4;
    v5.LoadedUsernames = {};
    v5.Model.Humanoid:LoadAnimation(script.Animation):Play();
    v5:_main();
    return v5;
end;
v3._main = function(v6) --[[ Line: 24 ]] --[[ Name: _main ]]
    task.spawn(function() --[[ Line: 25 ]]
        -- upvalues: v6 (copy)
        while true do
            v6:forceUpdateCharacter();
            task.wait(10);
        end;
    end);
end;
v3._promiseUsername = function(v7, v8) --[[ Line: 33 ]] --[[ Name: _promiseUsername ]]
    -- upvalues: v2 (copy), l_Players_0 (copy)
    return v2.new(function(v9, v10) --[[ Line: 34 ]]
        -- upvalues: v7 (copy), v8 (copy), l_Players_0 (ref)
        if v7.LoadedUsernames[v8] then
            return v9(v7.LoadedUsernames[v8]);
        else
            local v11 = "Not found";
            local l_status_0, l_result_0 = pcall(function() --[[ Line: 40 ]]
                -- upvalues: v11 (ref), l_Players_0 (ref), v8 (ref)
                v11 = l_Players_0:GetNameFromUserIdAsync(v8);
            end);
            if l_status_0 then
                v7.LoadedUsernames[v8] = v11;
                return v9(v11);
            else
                v10(l_result_0);
                return;
            end;
        end;
    end);
end;
v3.forceUpdateCharacter = function(v14, v15) --[[ Line: 53 ]] --[[ Name: forceUpdateCharacter ]]
    -- upvalues: l_Players_0 (copy)
    if v15 then
        if v15 == "None" then
            v15 = nil;
        end;
        v14.Model:SetAttribute("RentedCharacterID", v15);
    end;
    local v16 = v14.Model:GetAttribute("RentedCharacterID") or v14.Model:GetAttribute("DefaultCharacterID");
    local l_l_Players_0_HumanoidDescriptionFromUserId_0 = l_Players_0:GetHumanoidDescriptionFromUserId(v16);
    l_l_Players_0_HumanoidDescriptionFromUserId_0.WidthScale = 9;
    l_l_Players_0_HumanoidDescriptionFromUserId_0.HeadScale = 9;
    l_l_Players_0_HumanoidDescriptionFromUserId_0.DepthScale = 9;
    l_l_Players_0_HumanoidDescriptionFromUserId_0.HeightScale = 9;
    v14.Model.Humanoid:ApplyDescriptionReset(l_l_Players_0_HumanoidDescriptionFromUserId_0);
    local function v18() --[[ Line: 73 ]] --[[ Name: updateName ]]
        -- upvalues: v14 (copy), v16 (copy), v18 (copy)
        v14:_promiseUsername(v16):Then(function(v19) --[[ Line: 75 ]]
            -- upvalues: v14 (ref)
            local v20 = "STATUE OF " .. v19:upper();
            local l_TextLabel_0 = v14.Model.Parent.Stand.Engraving.SurfaceGui.TextLabel;
            l_TextLabel_0.Text = v20;
            l_TextLabel_0.Shadow.Text = v20;
        end):Catch(function(_) --[[ Line: 82 ]]
            -- upvalues: v18 (ref)
            print("fetchign username again");
            task.wait(15);
            v18();
        end);
    end;
    v18();
    local v23 = RaycastParams.new();
    v23.FilterType = Enum.RaycastFilterType.Exclude;
    v23.FilterDescendantsInstances = {
        workspace.PlayerCharacters, 
        workspace.NPCs, 
        v14.Model, 
        workspace.Effects
    };
    local v24 = workspace:Raycast(v14.Model.HumanoidRootPart.Position, Vector3.new(0, -999, 0, 0), v23);
    if not v24 then
        return;
    else
        local v25 = v14.Model.HumanoidRootPart.CFrame - v14.Model.HumanoidRootPart.CFrame.Position;
        v14.Model:PivotTo(CFrame.new(v24.Position + Vector3.new(0, v14.Model.Humanoid.HipHeight + v14.Model.HumanoidRootPart.Size.Y / 2, 0)) * v25);
        local l_Descendants_0 = v14.Model:GetDescendants();
        for v27 = 1, #l_Descendants_0 do
            if l_Descendants_0[v27]:IsA("BasePart") then
                l_Descendants_0[v27].CollisionGroup = "Players";
            end;
        end;
        return;
    end;
end;
return v3;