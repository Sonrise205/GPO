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
    v5.carrycd = false;
    return v6;
end;
v0.PC_Activate = function(v7) --[[ Line: 20 ]] --[[ Name: PC_Activate ]]
    -- upvalues: v3 (copy), v4 (copy)
    task.wait();
    if v7.Handler.carrycd == false and v3.Humanoid.Health > 0 and _G.canuse == true and game.ReplicatedStorage:FindFirstChild("tradingHUB") == nil then
        if _G.check:inspect(v3) then
            v7.Handler.carrycd = true;
            local v8 = v7.Utils.getinregion(v3, {
                v3.HumanoidRootPart.CFrame, 
                (Vector3.new(8, 8 * v3.Humanoid.BodyHeightScale.Value, 8))
            });
            for v9 = 1, #v8 do
                if v8[v9].Parent.Parent == v4 and v8[v9].Parent:FindFirstChild("gripped") == nil then
                    game.ReplicatedStorage.Events.KnockedOut:FireServer("carry", v8[v9].Parent);
                    break;
                end;
            end;
        elseif v3:FindFirstChild("ragcarry") then
            v7.Handler.carrycd = true;
            game.ReplicatedStorage.Events.KnockedOut:FireServer("drop", v3:FindFirstChild("ragcarry").Value);
        end;
        if v7.Handler.carrycd == true then
            task.wait(0.5);
            v7.Handler.carrycd = false;
        end;
    end;
end;
v0.Mobile_Activate = v0.PC_Activate;
return v0;