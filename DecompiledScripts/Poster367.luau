local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_Players_0 = game:GetService("Players");
local l_BountyHunting_0 = l_ReplicatedStorage_0.BountyHunting;
local l_Modules_0 = l_BountyHunting_0.Modules;
local l_Remotes_0 = l_BountyHunting_0.Remotes;
local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
local _ = l_LocalPlayer_0.PlayerGui;
local v7 = require(l_Modules_0.Maid);
local v8 = require(l_Modules_0.Signal);
local v9 = {};
v9.__index = v9;
v9.new = function(v10) --[[ Line: 17 ]] --[[ Name: new ]]
    -- upvalues: v9 (copy), v7 (copy), v8 (copy)
    local v11 = setmetatable({}, v9);
    v11.Cleaner = v7.new();
    v11.Destroyed = v8.new();
    v11.HuntedCharacter = v10.HuntedCharacter;
    v11.Parent = v10.Parent;
    v11.UI = v11:_createUI(v10.ParentUI);
    v11:_main();
    return v11;
end;
v9._createUI = function(v12, v13) --[[ Line: 32 ]] --[[ Name: _createUI ]]
    local v14 = script.BountyPoster:Clone();
    v12.UI = v14;
    local l_ViewportFrame_0 = v14.Background.ViewportFrame;
    local v16 = v12.HuntedCharacter:Clone();
    v16.Parent = l_ViewportFrame_0;
    v12.Cleaner:AddTask(task.spawn(function() --[[ Line: 42 ]]
        -- upvalues: v16 (copy), l_ViewportFrame_0 (copy), v14 (copy)
        local l_Humanoid_0 = v16.Humanoid;
        local l_HumanoidRootPart_0 = v16:WaitForChild("HumanoidRootPart");
        local _ = l_HumanoidRootPart_0.Size.Y * 0.5 + l_Humanoid_0.HipHeight;
        local l_Camera_0 = Instance.new("Camera");
        l_Camera_0.CFrame = v16.Head.CFrame * CFrame.new(0, 0, -l_HumanoidRootPart_0.Size.Z * 3) * CFrame.Angles(0, 3.141592653589793, 0);
        l_Camera_0.Parent = l_ViewportFrame_0;
        l_ViewportFrame_0.CurrentCamera = l_Camera_0;
        v14.Name = v16.Name;
    end));
    v12.Cleaner:AddTask(v12.UI);
    v14.Parent = v13;
    return v14;
end;
v9._main = function(v21) --[[ Line: 62 ]] --[[ Name: _main ]]
    -- upvalues: l_LocalPlayer_0 (copy), l_Remotes_0 (copy)
    local l_Background_0 = v21.UI.Background;
    l_Background_0.PlayerName.Text = v21.HuntedCharacter.Name;
    local function v24() --[[ Line: 66 ]] --[[ Name: UpdateBounty ]]
        -- upvalues: v21 (copy), l_Background_0 (copy)
        local l_Attribute_0 = v21.HuntedCharacter:GetAttribute("Bounty");
        l_Background_0.Peli.Text = l_Attribute_0;
        v21.UI.Visible = v21.HuntedCharacter:GetAttribute("NPC") or l_Attribute_0 >= 10000;
        if _G.arena == true then
            v21.UI.Visible = true;
        end;
    end;
    local function v27(_) --[[ Line: 76 ]] --[[ Name: Clicked ]]
        -- upvalues: v21 (copy), l_LocalPlayer_0 (ref), l_Remotes_0 (ref)
        if not v21.Parent then
            warn("no parent");
            return;
        else
            local l_Model_0 = v21.Parent.Model;
            if l_LocalPlayer_0.Character.Name == v21.HuntedCharacter.Name then
                warn("same person");
                return;
            elseif (l_Model_0.Position - l_LocalPlayer_0.Character.HumanoidRootPart.Position).Magnitude >= 25 then
                warn("too far");
                return;
            else
                l_Remotes_0.Interact:FireServer({
                    ID = v21.Parent.ID, 
                    Board = l_Model_0, 
                    Wanted = v21.HuntedCharacter
                });
                return;
            end;
        end;
    end;
    local l_Attribute_1 = v21.HuntedCharacter:GetAttribute("Bounty");
    l_Background_0.Peli.Text = l_Attribute_1;
    v21.UI.Visible = v21.HuntedCharacter:GetAttribute("NPC") or l_Attribute_1 >= 10000;
    if _G.arena == true then
        v21.UI.Visible = true;
    end;
    v21.Cleaner:AddTask(v21.HuntedCharacter:GetAttributeChangedSignal("Bounty"):Connect(v24));
    v21.Cleaner:AddTask(l_Background_0.Activated:Connect(v27));
end;
v9.Destroy = function(v29) --[[ Line: 96 ]] --[[ Name: Destroy ]]
    v29.Cleaner:Destroy();
    v29.Destroyed:Fire();
    setmetatable(v29, nil);
end;
return v9;