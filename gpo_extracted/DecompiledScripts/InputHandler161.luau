local l_Players_0 = game:GetService("Players");
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_UserInputService_0 = game:GetService("UserInputService");
local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
local _ = l_LocalPlayer_0:WaitForChild("PlayerGui");
local _ = l_LocalPlayer_0:WaitForChild("Backpack");
local l_GetPreferredInput_0 = require(script:WaitForChild("GetPreferredInput"));
local v7 = require(l_ReplicatedStorage_0.Modules.Shared.Signals.Signal);
local v9 = {
    InputsRegistered = {}, 
    Inputs = {}, 
    DeviceDetected = v7.new(), 
    GetCurrentInput = function(_) --[[ Line: 18 ]] --[[ Name: GetCurrentInput ]]
        -- upvalues: l_GetPreferredInput_0 (copy)
        return l_GetPreferredInput_0.Current;
    end
};
v9._addInput = function(_, v11) --[[ Line: 22 ]] --[[ Name: _addInput ]]
    -- upvalues: v9 (copy)
    warn("Adding INPUT FOR", v11);
    local v12 = require(script.DeviceInputs[v11]);
    v12:Initialize();
    v9.Inputs[v11] = v12;
    v9.InputsRegistered[v11] = true;
    warn("ADDED INPUT FOR", v11);
end;
v9.Initialize = function(v13) --[[ Line: 32 ]] --[[ Name: Initialize ]]
    -- upvalues: l_LocalPlayer_0 (copy), l_UserInputService_0 (copy), l_GetPreferredInput_0 (copy), v9 (copy)
    warn("initalziing input handler");
    if l_LocalPlayer_0.Character == nil then
        repeat
            task.wait();
        until l_LocalPlayer_0.Character;
        local _ = l_LocalPlayer_0.Character:WaitForChild("HumanoidRootPart");
    end;
    if _G.displayMessage == nil then
        repeat
            task.wait();
        until _G.displayMessage ~= nil;
    end;
    local v15 = false;
    local function _() --[[ Line: 48 ]] --[[ Name: ConsoleCheck ]]
        -- upvalues: l_UserInputService_0 (ref), v15 (ref)
        print("its controller, check for kbm");
        print(l_UserInputService_0.MouseEnabled, l_UserInputService_0.KeyboardEnabled);
        if v15 == true then
            return;
        else
            v15 = true;
            _G.displayMessage("You are playing on CONSOLE, some features such as the <Color=Red>CHAT have been disabled<Color=/> due to ROBLOX guidelines. <Color=Orange>A MOUSE AND KEYBOARD IS REQUIRED TO PLAY!");
            return;
        end;
    end;
    local v17 = game:GetService("GuiService"):IsTenFootInterface();
    if l_GetPreferredInput_0.Current then
        if v17 == true then
            print("its controller, check for kbm");
            print(l_UserInputService_0.MouseEnabled, l_UserInputService_0.KeyboardEnabled);
            if v15 ~= true then
                v15 = true;
                _G.displayMessage("You are playing on CONSOLE, some features such as the <Color=Red>CHAT have been disabled<Color=/> due to ROBLOX guidelines. <Color=Orange>A MOUSE AND KEYBOARD IS REQUIRED TO PLAY!");
            end;
        end;
        v13:_addInput(l_GetPreferredInput_0.Current);
    else
        warn("NO CURRENT FOR INPUT HANDLER NOT DOING ADDINPIT");
    end;
    local v18 = nil;
    v18 = l_GetPreferredInput_0.Observe(function(v19) --[[ Line: 74 ]]
        -- upvalues: v9 (ref), v17 (copy), l_UserInputService_0 (ref), v15 (ref), v13 (copy)
        if v9.InputsRegistered[v19] then
            return;
        else
            task.wait();
            if v17 == true then
                print("its controller, check for kbm");
                print(l_UserInputService_0.MouseEnabled, l_UserInputService_0.KeyboardEnabled);
                if v15 ~= true then
                    v15 = true;
                    _G.displayMessage("You are playing on CONSOLE, some features such as the <Color=Red>CHAT have been disabled<Color=/> due to ROBLOX guidelines. <Color=Orange>A MOUSE AND KEYBOARD IS REQUIRED TO PLAY!");
                end;
            end;
            v13:_addInput(v19);
            return;
        end;
    end);
    l_GetPreferredInput_0.Update();
    local l_KeyboardEnabled_0 = l_UserInputService_0.KeyboardEnabled;
    local l_MouseEnabled_0 = l_UserInputService_0.MouseEnabled;
    if v17 == true then
        l_UserInputService_0.InputBegan:Connect(function(v22, v23) --[[ Line: 92 ]]
            -- upvalues: l_KeyboardEnabled_0 (ref), l_MouseEnabled_0 (ref)
            if v23 then
                return;
            elseif v22.UserInputType == Enum.UserInputType.Keyboard then
                if l_KeyboardEnabled_0 == false then
                    _G.displayMessage("<Color=Green>Keyboard Detected!");
                end;
                l_KeyboardEnabled_0 = true;
                return;
            else
                if v22.UserInputType.Name:match("Mouse") ~= nil then
                    if l_MouseEnabled_0 == false then
                        _G.displayMessage("<Color=Green>Mouse Detected!");
                    end;
                    l_MouseEnabled_0 = true;
                end;
                return;
            end;
        end);
    end;
    task.spawn(function() --[[ Line: 111 ]]
        -- upvalues: v17 (copy), l_KeyboardEnabled_0 (ref), l_MouseEnabled_0 (ref)
        if v17 == true then
            while task.wait(3) do
                local v24 = {};
                if l_KeyboardEnabled_0 == false then
                    table.insert(v24, "Keyboard");
                end;
                if l_MouseEnabled_0 == false then
                    table.insert(v24, "Mouse");
                end;
                if #v24 > 0 then
                    _G.displayMessage("<Color=Red>A " .. table.concat(v24, ",") .. " is required to play the game.");
                end;
            end;
        end;
    end);
    warn("FINISHED initalziing input handler");
end;
return v9;