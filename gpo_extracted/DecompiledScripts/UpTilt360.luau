local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_LocalPlayer_0 = game:GetService("Players").LocalPlayer;
local l_Modules_0 = l_ReplicatedStorage_0.Modules;
local v3 = require(l_Modules_0.ContextActionService);
local v4 = require(script.Parent.Shared);
local v5 = require(l_Modules_0.SwordHandle.SwordInfo);
local v6 = setmetatable({}, v4);
v6.__index = v6;
v6.new = function(v7) --[[ Line: 20 ]] --[[ Name: new ]]
    -- upvalues: v6 (copy)
    local v8 = setmetatable({}, v6);
    v8.Mobile = v7;
    v8.Button = v8:_createButton({
        ButtonData = v7.SavedButtons[script.Name], 
        Texture = "rbxassetid://18124381653", 
        Name = "UpTilt", 
        Title = "Ground"
    });
    v8:_main();
    return v8;
end;
v6.Activated = function(_) --[[ Line: 36 ]] --[[ Name: Activated ]]
    -- upvalues: v3 (copy)
    _G.mobileUpTilt = not _G.mobileUpTilt;
    v3:UpdateTexture({
        ButtonName = "UpTilt", 
        Texture = _G.mobileUpTilt and "rbxassetid://18124381913" or "rbxassetid://18124381653"
    });
    v3:UpdateTitle({
        ButtonName = "UpTilt", 
        Title = _G.mobileUpTilt and "Up Tilt" or "Ground"
    });
end;
v6._isValidMelee = function(_, v11) --[[ Line: 50 ]] --[[ Name: _isValidMelee ]]
    -- upvalues: v5 (copy)
    if v11 == nil or v11 and v11:GetAttributes().MeleeTool == nil and v5[v11.Name] == nil then
        return false;
    else
        return true;
    end;
end;
v6._main = function(v12) --[[ Line: 57 ]] --[[ Name: _main ]]
    -- upvalues: l_LocalPlayer_0 (copy)
    local function v14(v13) --[[ Line: 59 ]] --[[ Name: ToolAdded ]]
        -- upvalues: v12 (copy)
        if not v13:IsA("Tool") then
            return;
        else
            v12.Button.Visible = v12:_isValidMelee(v13) or v12.Mobile.EditMode.Editting;
            return;
        end;
    end;
    local function v16(v15) --[[ Line: 64 ]] --[[ Name: ToolRemoving ]]
        -- upvalues: v12 (copy)
        if not v15:IsA("Tool") then
            return;
        else
            v12.Button.Visible = v12.Mobile.EditMode.Editting;
            return;
        end;
    end;
    local function v18(v17) --[[ Line: 69 ]] --[[ Name: CharacterAdded ]]
        -- upvalues: v12 (copy), v14 (copy), v16 (copy)
        v12.Button.Visible = false;
        v17.ChildAdded:Connect(v14);
        v17.ChildRemoved:Connect(v16);
    end;
    local v19 = l_LocalPlayer_0.Character or l_LocalPlayer_0.CharacterAdded:Wait();
    v12.Button.Visible = false;
    v19.ChildAdded:Connect(v14);
    v19.ChildRemoved:Connect(v16);
    l_LocalPlayer_0.CharacterAdded:Connect(v18);
end;
return v6;