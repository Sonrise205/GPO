local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_Players_0 = game:GetService("Players");
local l_UserInputService_0 = game:GetService("UserInputService");
local l_Modules_0 = l_ReplicatedStorage_0.Modules;
local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
local _ = require(l_Modules_0.ContextActionService);
local v6 = setmetatable({}, (require(script.Parent.Shared)));
v6.__index = v6;
_G.mobileJumpHeld = false;
local l_InputCallbacks_0 = require(l_LocalPlayer_0.Backpack:WaitForChild("InputCallbacks"));
v6.new = function(_) --[[ Line: 21 ]] --[[ Name: new ]]
    -- upvalues: v6 (copy), l_InputCallbacks_0 (ref), l_UserInputService_0 (copy), l_LocalPlayer_0 (copy)
    local v9 = setmetatable({}, v6);
    local v10 = false;
    local v11 = 0;
    local function v12() --[[ Line: 27 ]] --[[ Name: Activated ]]
        -- upvalues: v10 (ref), v11 (ref), l_InputCallbacks_0 (ref)
        if game.Players.LocalPlayer.Character == nil then
            return;
        elseif v10 == true then
            return;
        elseif tick() - v11 < 0.05 then
            return;
        else
            v10 = true;
            v11 = tick();
            if l_InputCallbacks_0 then
                pcall(function() --[[ Line: 45 ]]
                    -- upvalues: l_InputCallbacks_0 (ref)
                    l_InputCallbacks_0.Callbacks.Geppo:Mobile_Activate();
                end);
            end;
            v10 = false;
            return;
        end;
    end;
    if l_UserInputService_0.TouchEnabled then
        local l_JumpButton_0 = l_LocalPlayer_0.PlayerGui:WaitForChild("TouchGui"):WaitForChild("TouchControlFrame"):WaitForChild("JumpButton");
        l_JumpButton_0.MouseButton1Down:Connect(function() --[[ Line: 59 ]]
            -- upvalues: v12 (copy)
            _G.mobileJumpHeld = true;
            v12();
        end);
        l_JumpButton_0.MouseButton1Up:Connect(function() --[[ Line: 68 ]]
            _G.mobileJumpHeld = false;
        end);
    end;
    return v9;
end;
game.Players.LocalPlayer.CharacterRemoving:Connect(function() --[[ Line: 97 ]]
    -- upvalues: l_InputCallbacks_0 (ref)
    l_InputCallbacks_0 = nil;
end);
game.Players.LocalPlayer.CharacterAdded:Connect(function() --[[ Line: 101 ]]
    -- upvalues: l_InputCallbacks_0 (ref), l_LocalPlayer_0 (copy)
    l_InputCallbacks_0 = require(l_LocalPlayer_0.Backpack:WaitForChild("InputCallbacks"));
end);
return v6;