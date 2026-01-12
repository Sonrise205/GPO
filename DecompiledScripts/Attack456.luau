local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_Players_0 = game:GetService("Players");
local l_UserInputService_0 = game:GetService("UserInputService");
local l_Modules_0 = l_ReplicatedStorage_0.Modules;
local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
local _ = require(l_Modules_0.ContextActionService);
local v6 = require(script.Parent.Shared);
local v7 = require(l_Modules_0.SwordHandle.SwordInfo);
local v8 = setmetatable({}, v6);
v8.__index = v8;
v8.new = function(v9) --[[ Line: 18 ]] --[[ Name: new ]]
    -- upvalues: v8 (copy)
    local v10 = setmetatable({}, v8);
    v10.Mobile = v9;
    v10.Button = v10:_createButton({
        ButtonData = v9.SavedButtons.Attack, 
        Texture = "rbxassetid://18629682395", 
        Name = "Attack"
    });
    v10:_main();
    return v10;
end;
local v11 = false;
v8.Activated = function(_, v13) --[[ Line: 35 ]] --[[ Name: Activated ]]
    -- upvalues: l_LocalPlayer_0 (copy), v11 (ref)
    if _G.mobileUsingSkill then
        return;
    else
        local l_InputCallbacks_0 = require(l_LocalPlayer_0.Backpack:WaitForChild("InputCallbacks"));
        if v11 == false then
            v11 = true;
            while v11 == true do
                if not l_InputCallbacks_0.Utils.holdingValidMelee() then
                    return;
                else
                    l_InputCallbacks_0.Callbacks.Attack:Mobile_Activate();
                    if v13 ~= true then
                        task.wait();
                    else
                        break;
                    end;
                end;
            end;
            v11 = false;
        end;
        return;
    end;
end;
v8.Deactivated = function(_) --[[ Line: 56 ]] --[[ Name: Deactivated ]]
    -- upvalues: v11 (ref)
    v11 = false;
end;
v8._isValidMelee = function(_, v17) --[[ Line: 65 ]] --[[ Name: _isValidMelee ]]
    -- upvalues: v7 (copy)
    if v17 == nil or v17 and v17:GetAttributes().MeleeTool == nil and v7[v17.Name] == nil then
        return false;
    else
        return true;
    end;
end;
v8._main = function(v18) --[[ Line: 72 ]] --[[ Name: _main ]]
    -- upvalues: l_ReplicatedStorage_0 (copy), l_LocalPlayer_0 (copy), l_UserInputService_0 (copy)
    local v19 = l_ReplicatedStorage_0:WaitForChild((("Stats%*"):format(l_LocalPlayer_0)));
    local function v23(_, v21) --[[ Line: 75 ]] --[[ Name: DetectTaps ]]
        -- upvalues: v19 (copy), l_LocalPlayer_0 (ref), v18 (copy)
        if v21 then
            return;
        elseif _G.mobileUsingSkill then
            return;
        elseif v19.Settings.M1Button.Value == true then
            return;
        else
            local l_Tool_0 = l_LocalPlayer_0.Character:FindFirstChildWhichIsA("Tool");
            if not v18:_isValidMelee(l_Tool_0) then
                return;
            else
                v18:Activated(true);
                return;
            end;
        end;
    end;
    local function v25(v24) --[[ Line: 86 ]] --[[ Name: ToolAdded ]]
        -- upvalues: v18 (copy), v19 (copy)
        if not v24:IsA("Tool") then
            return;
        else
            v18.Button.Visible = v18:_isValidMelee(v24) and v19.Settings.M1Button.Value or v18.Mobile.EditMode.Editting;
            return;
        end;
    end;
    local function v27(v26) --[[ Line: 91 ]] --[[ Name: ToolRemoving ]]
        -- upvalues: v18 (copy)
        if not v26:IsA("Tool") then
            return;
        else
            v18.Button.Visible = v18.Mobile.EditMode.Editting;
            return;
        end;
    end;
    local function v29(v28) --[[ Line: 96 ]] --[[ Name: CharacterAdded ]]
        -- upvalues: v18 (copy), v25 (copy), v27 (copy)
        v18.Button.Visible = false;
        v28.ChildAdded:Connect(v25);
        v28.ChildRemoved:Connect(v27);
    end;
    local v30 = l_LocalPlayer_0.Character or l_LocalPlayer_0.CharacterAdded:Wait();
    v18.Button.Visible = false;
    v30.ChildAdded:Connect(v25);
    v30.ChildRemoved:Connect(v27);
    l_LocalPlayer_0.CharacterAdded:Connect(v29);
    v19.Settings.M1Button.Changed:Connect(function() --[[ Line: 106 ]]
        -- upvalues: l_LocalPlayer_0 (ref), v18 (copy), v19 (copy)
        local l_Tool_1 = l_LocalPlayer_0.Character:FindFirstChildWhichIsA("Tool");
        if not l_Tool_1:IsA("Tool") then
            return;
        else
            v18.Button.Visible = v18:_isValidMelee(l_Tool_1) and v19.Settings.M1Button.Value or v18.Mobile.EditMode.Editting;
            return;
        end;
    end);
    l_UserInputService_0.TouchTapInWorld:Connect(v23);
end;
return v8;