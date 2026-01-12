local v0 = {};
v0.__index = v0;
local l_LocalPlayer_0 = game.Players.LocalPlayer;
local _ = game:GetService("UserInputService");
local v3 = l_LocalPlayer_0.Character or l_LocalPlayer_0.CharacterAdded:Wait();
local v4 = workspace:WaitForChild("Ragdolls", 5);
v0.new = function(v5) --[[ Line: 10 ]] --[[ Name: new ]]
    -- upvalues: v0 (copy)
    local v6 = setmetatable({}, v0);
    v6.Handler = v5;
    v6.Utils = v5.Utils;
    return v6;
end;
local v7 = false;
v0.PC_Activate = function(v8) --[[ Line: 19 ]] --[[ Name: PC_Activate ]]
    -- upvalues: v3 (copy), v7 (ref), v4 (copy)
    if v3:FindFirstChild("Blocking") == nil and v8.Handler.carrycd == false and v3.Humanoid.Health > 0 and v7 == false and game.ReplicatedStorage:FindFirstChild("tradingHUB") == nil then
        v7 = true;
        if _G.check:inspect(v3) and _G.canuse == true and v3.HumanoidRootPart:FindFirstChild("gripweld") == nil then
            local v9 = v8.Utils.getinregion(v3, {
                v3.HumanoidRootPart.CFrame, 
                (Vector3.new(8, 8, 8, 0))
            });
            for v10 = 1, #v9 do
                if v9[v10].Parent.Parent == v4 then
                    game.ReplicatedStorage.Events.KnockedOut:FireServer("grip", v9[v10].Parent, v3.HumanoidRootPart.CFrame);
                    break;
                end;
            end;
        elseif v3:FindFirstChild("gripweld") then
            warn("atemoping cancel client");
            game.ReplicatedStorage.Events.KnockedOut:FireServer("grip", nil);
        end;
        task.wait(0.5);
        v7 = false;
    end;
end;
v0.Mobile_Activate = v0.PC_Activate;
return v0;