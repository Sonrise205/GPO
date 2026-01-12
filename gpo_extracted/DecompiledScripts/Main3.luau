local l_TweenService_0 = game:GetService("TweenService");
local _ = {
    "... how did u evne die...", 
    "bro how did this happen", 
    "smg disgracefull how did u die...", 
    "You lived a good one", 
    "You died crying like baby", 
    "what a tragic death..", 
    "did u just get 1 tapped??", 
    "buy guardian angel next time", 
    "get a sage res", 
    "rest up kiddo", 
    "ntnt.. jus unlucky", 
    "better luck next time bud", 
    "sleep well!", 
    "skill issue.. get better", 
    "i had faith in you", 
    "you will be missed"
};
local v2 = {
    "Destroyed by", 
    "Eradicated by", 
    "Obliterated by", 
    "Exterminated by", 
    "Eliminated by", 
    "Erased by", 
    "Annihilated by", 
    "Demolished by", 
    "Slaughtered by", 
    "Executed by", 
    "Deleted by", 
    "Killed by", 
    "Owned by", 
    "Terminated by"
};
local l_Parent_0 = script.Parent;
local l_Bar_0 = l_Parent_0:WaitForChild("Bar");
local l_FirstMessage_0 = l_Bar_0:WaitForChild("Frame"):WaitForChild("FirstMessage");
local function v6() --[[ Line: 44 ]] --[[ Name: AnimateDeathScreen ]]
    -- upvalues: l_Bar_0 (copy), l_FirstMessage_0 (copy), v2 (copy), l_TweenService_0 (copy)
    if _G.music == true then
        script.DeathMusic:Play();
    end;
    l_Bar_0.Size = UDim2.new(1, 0, 0, 0);
    l_FirstMessage_0.TextTransparency = 0;
    l_FirstMessage_0.Size = UDim2.new(1, 0, 1, 0);
    l_FirstMessage_0.Text = ("%* %*"):format(v2[math.random(#v2)], script.Parent.killerName.Value);
    l_Bar_0:TweenSize(UDim2.new(1, 0, 0.1, 0), Enum.EasingDirection.InOut, Enum.EasingStyle.Quad, 0.35, true);
    task.wait(0.35);
    l_FirstMessage_0:TweenSize(UDim2.new(1, 0, 1, 0), Enum.EasingDirection.InOut, Enum.EasingStyle.Quad, 0.35, true);
    task.wait(4);
    l_TweenService_0:Create(l_FirstMessage_0, TweenInfo.new(1, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut), {
        TextTransparency = 1
    }):Play();
    task.wait(1.25);
    l_Bar_0:TweenSize(UDim2.new(1, 0, 0, 0), Enum.EasingDirection.InOut, Enum.EasingStyle.Quad, 0.35, true);
end;
_G.hideUI(true);
v6();
local v7 = nil;
v7 = game.Players.LocalPlayer.CharacterAdded:Connect(function() --[[ Line: 84 ]]
    -- upvalues: v7 (ref), l_Parent_0 (copy)
    _G.hideUI(false);
    v7:Disconnect();
    v7 = nil;
    l_Parent_0:Destroy();
end);