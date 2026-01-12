local l_Players_0 = game:GetService("Players");
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local _ = game:GetService("StarterPlayer");
local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
local _ = l_LocalPlayer_0.PlayerGui;
local _ = {};
local l_UserInputService_0 = game:GetService("UserInputService");
local v7 = require(l_ReplicatedStorage_0.Modules.Trove);
local _ = l_LocalPlayer_0.PlayerScripts:WaitForChild("PlayerModule");
local l_Marker_0 = game:GetService("ReplicatedStorage").Marker;
local v10 = nil;
local l_l_LocalPlayer_0_Mouse_0 = l_LocalPlayer_0:GetMouse();
local v12 = false;
local v13 = require(script.MarkerMenu).new();
local v14 = Vector2.new();
local v15 = Vector3.new();
local v16 = {};
local l_Marker_1 = require(script:WaitForChild("Marker"));
local v18 = nil;
l_Marker_0.OnClientEvent:Connect(function(v19) --[[ Line: 27 ]]
    -- upvalues: v16 (copy), l_Marker_1 (copy), v10 (ref)
    local l_Player_0 = v19.Player;
    local v21 = v16[v19.Player];
    local l_FirstChild_0 = script.MarkerMenu:FindFirstChild(v19.Type);
    local v23 = nil;
    local v24 = nil;
    if not v21 then
        v24 = l_Marker_1.new(v19);
        if v10 then
            v23 = _G.addBlip("Marker", v24.Part, v19.Type);
        end;
        v16[v19.Player] = {
            Marker = v24, 
            Blip = v23
        };
    else
        v24 = v16[v19.Player].Marker;
        v23 = v16[v19.Player].Blip;
    end;
    if v23 then
        v23.ImageColor3 = l_FirstChild_0.ImageColor3;
        v23.Image = l_FirstChild_0.Image;
        v23.areaLabel.Text = v19.Type .. "<br/>-" .. v19.Player.DisplayName;
        v23.UIGradient.Color = l_FirstChild_0.UIGradient.Color;
        v23.shadow.Image = v23.Image;
        v23.AnchorPoint = v19.Minimap and Vector2.one or Vector2.new(0.5, 0.5);
    end;
    v24:Update(v19.Position, v19.Type);
    if script.PingSFX:FindFirstChild(v19.Type) then
        _G.PlaySound(CFrame.new(v19.Position), script.PingSFX[v19.Type]);
    end;
    if v16[v19.Player] and v16[v19.Player].Destroy and coroutine.status(v16[v19.Player].Destroy) ~= "dead" then
        task.cancel(v16[v19.Player].Destroy);
    end;
    v16[v19.Player].Destroy = task.delay(v16[v19.Player].Marker.Duration - 1, function() --[[ Line: 70 ]]
        -- upvalues: v24 (ref), v16 (ref), l_Player_0 (copy)
        v24:FadeOut();
        task.delay(1, function() --[[ Line: 72 ]]
            -- upvalues: v24 (ref)
            v24:Destroy();
        end);
        v16[l_Player_0] = nil;
    end);
end);
l_UserInputService_0.InputBegan:Connect(function(v25, v26) --[[ Line: 79 ]]
    -- upvalues: v13 (copy), v14 (ref), l_l_LocalPlayer_0_Mouse_0 (copy), v15 (ref), v12 (ref)
    if v26 then
        return;
    elseif v25.UserInputType ~= Enum.UserInputType.MouseButton3 then
        return;
    elseif game:GetService("GuiService"):IsTenFootInterface() == true then
        return;
    else
        v13:Choose();
        v14 = Vector2.new(l_l_LocalPlayer_0_Mouse_0.X, l_l_LocalPlayer_0_Mouse_0.Y);
        v15 = l_l_LocalPlayer_0_Mouse_0.Hit.Position;
        if v12 == true then
            Hovering = true;
        end;
        return;
    end;
end);
l_UserInputService_0.InputEnded:Connect(function(v27, v28) --[[ Line: 100 ]]
    -- upvalues: v13 (copy), v10 (ref), v18 (ref), l_LocalPlayer_0 (copy), l_Marker_0 (copy), v15 (ref)
    if v28 then
        return;
    elseif v27.UserInputType ~= Enum.UserInputType.MouseButton3 then
        return;
    elseif game:GetService("GuiService"):IsTenFootInterface() == true then
        return;
    else
        v13:Select();
        if Hovering and v10 and v10.ScreenGui.Enabled then
            local v29 = v10.MainBlip.AbsolutePosition - v13.MousePosition;
            local l_AbsoluteSize_0 = v18.customBlip.AbsoluteSize;
            local v31 = (Vector3.new(v29.X, 0, v29.Y) + Vector3.new(l_AbsoluteSize_0.X, 0, l_AbsoluteSize_0.Y) * 0.5) / Vector3.new(v10.TruePixelsPerStudX, 1, v10.TruePixelsPerStudY);
            local l_PrimaryPart_0 = l_LocalPlayer_0.Character.PrimaryPart;
            if l_LocalPlayer_0.ReplicationFocus ~= nil then
                l_PrimaryPart_0 = l_LocalPlayer_0.ReplicationFocus;
            end;
            local v33 = l_PrimaryPart_0.Position - v31;
            l_Marker_0:FireServer({
                Position = v33, 
                Type = v13.Selected, 
                MinimapOpen = true
            });
            Hovering = false;
            return;
        else
            l_Marker_0:FireServer({
                Position = v15, 
                Type = v13.Selected
            });
            return;
        end;
    end;
end);
local v34 = v7.new();
_G.attachMinimapToMarker = function(v35, v36) --[[ Line: 136 ]]
    -- upvalues: v10 (ref), v18 (ref), v34 (copy), v12 (ref)
    v10 = v35;
    v18 = v36;
    local l_Frame_0 = v10.ScreenGui.Frame;
    local _ = l_Frame_0.Size;
    v34:Clean();
    v34:Add(l_Frame_0.MouseEnter:Connect(function() --[[ Line: 146 ]]
        -- upvalues: v12 (ref)
        v12 = true;
    end));
    v34:Add(l_Frame_0.MouseLeave:Connect(function() --[[ Line: 152 ]]
        -- upvalues: v12 (ref)
        v12 = false;
    end));
end;