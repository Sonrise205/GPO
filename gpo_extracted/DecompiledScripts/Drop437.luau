local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_Players_0 = game:GetService("Players");
local l_Modules_0 = l_ReplicatedStorage_0.Modules;
local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
local _ = require(l_Modules_0.ContextActionService);
local v5 = setmetatable({}, (require(script.Parent.Shared)));
v5.__index = v5;
v5.new = function(v6) --[[ Line: 16 ]] --[[ Name: new ]]
    -- upvalues: v5 (copy)
    local v7 = setmetatable({}, v5);
    v7.Mobile = v6;
    v7.Button = v7:_createButton({
        ButtonData = v6.SavedButtons[script.Name], 
        Texture = "http://www.roblox.com/asset/?id=17644360865", 
        Name = script.Name
    });
    v7:_main();
    return v7;
end;
v5.Activated = function(_) --[[ Line: 31 ]] --[[ Name: Activated ]]
    -- upvalues: l_LocalPlayer_0 (copy)
    require(l_LocalPlayer_0.Backpack:WaitForChild("InputCallbacks")).Callbacks.DropTool:Mobile_Activate();
end;
v5._main = function(v9) --[[ Line: 36 ]] --[[ Name: _main ]]
    -- upvalues: l_LocalPlayer_0 (copy)
    local function v13(v10) --[[ Line: 38 ]] --[[ Name: ToolAdded ]]
        -- upvalues: v9 (copy)
        if not v10:IsA("Tool") then
            return;
        else
            local l_Button_0 = v9.Button;
            local v12 = true;
            if v10:FindFirstChild("CanBeDropped") == nil then
                v12 = v9.Mobile.EditMode.Editting;
            end;
            l_Button_0.Visible = v12;
            return;
        end;
    end;
    local function v15(v14) --[[ Line: 43 ]] --[[ Name: ToolRemoving ]]
        -- upvalues: v9 (copy)
        if not v14:IsA("Tool") then
            return;
        else
            v9.Button.Visible = v9.Mobile.EditMode.Editting;
            return;
        end;
    end;
    local function v17(v16) --[[ Line: 48 ]] --[[ Name: CharacterAdded ]]
        -- upvalues: v9 (copy), v13 (copy), v15 (copy)
        v9.Button.Visible = false;
        v16.ChildAdded:Connect(v13);
        v16.ChildRemoved:Connect(v15);
    end;
    local v18 = l_LocalPlayer_0.Character or l_LocalPlayer_0.CharacterAdded:Wait();
    v9.Button.Visible = false;
    v18.ChildAdded:Connect(v13);
    v18.ChildRemoved:Connect(v15);
    l_LocalPlayer_0.CharacterAdded:Connect(v17);
end;
return v5;