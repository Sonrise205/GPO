local l_Client_0 = game:GetService("ReplicatedStorage"):WaitForChild("Modules").Client;
local l_UIUtils_0 = require(l_Client_0:WaitForChild("UIUtils"));
local v2 = require(game.ReplicatedStorage.Modules.RichText);
local v3 = require(game.ReplicatedStorage.Modules.ToolDesc);
local l_script_Attribute_0 = script:GetAttribute("Item");
local v5 = v3[l_script_Attribute_0].Max - _G.CheckItemAmmount(game.Players.LocalPlayer, l_script_Attribute_0);
local v6 = "How many do you want? <Color=Yellow>MAX: " .. v5 .. "<Color=/><AnimateYield=1>";
local v7 = {
    SFX = true
};
_G.hideUI(true);
v2:New(script.Parent.Frame.ImageLabel.desc, v6, v7):Show();
script.Parent.Frame.cancel.MouseButton1Click:Connect(function() --[[ Line: 18 ]]
    -- upvalues: l_UIUtils_0 (copy)
    l_UIUtils_0.ButtonEffect();
    _G.hideUI(false);
    script.done.Value = true;
    script.Parent.Enabled = false;
    task.wait(1);
    script.Parent:Destroy();
end);
local l_FirstChild_0 = game.ReplicatedStorage:FindFirstChild("Stats" .. game.Players.LocalPlayer.Name);
script.Parent.Frame.buy.MouseButton1Click:Connect(function() --[[ Line: 28 ]]
    -- upvalues: l_UIUtils_0 (copy), v5 (copy), l_FirstChild_0 (copy)
    l_UIUtils_0.ButtonEffect();
    local v9 = tonumber(script.Parent.Frame.count.Text);
    if v9 == nil or v9 and v9 <= 0 then
        _G.displayMessage("<Color=Red>Enter a valid number");
        return;
    elseif v5 < v9 then
        _G.displayMessage("<Color=Red>Above max: " .. v5);
        return;
    else
        local v10 = v9 * script.itemProp.Value.Info.Price.Value;
        if l_FirstChild_0.Stats.Peli.Value < v10 then
            _G.displayMessage("You need <Color=Red>" .. v10 - l_FirstChild_0.Stats.Peli.Value .. "<Color=/> more Peli!");
            return;
        else
            game.ReplicatedStorage.Events.Shop:InvokeServer(script.itemProp.Value, v9);
            script.Item_Box_Get2:Play();
            script.Parent.Enabled = false;
            _G.hideUI(false);
            script.done.Value = true;
            _G.destroy(script.Parent, 5);
            return;
        end;
    end;
end);