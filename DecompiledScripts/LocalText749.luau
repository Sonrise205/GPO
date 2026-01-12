local v0 = require(script.Parent:FindFirstChild("RichText") or script.Parent.Parent);
script.Parent.Enabled = true;
local l_TweenService_0 = game:GetService("TweenService");
local l_Dialogue_0 = script.Parent.Dialogue;
local l_TextFrame_0 = l_Dialogue_0.TextFrame;
local l_Button_0 = l_Dialogue_0.Button;
l_Dialogue_0.Visible = false;
l_Button_0.Visible = false;
local v5 = l_TweenService_0:Create(l_Button_0, TweenInfo.new(0.1), {
    ImageTransparency = 0
});
local v6 = l_TweenService_0:Create(l_Button_0, TweenInfo.new(0.1), {
    ImageTransparency = 1
});
local v7 = l_TweenService_0:Create(l_Button_0, TweenInfo.new(0.05, Enum.EasingStyle.Quart, Enum.EasingDirection.InOut), {
    Size = UDim2.new(0.25, 0, 0.25, 0)
});
local v8 = l_TweenService_0:Create(l_Dialogue_0, TweenInfo.new(0.4), {
    Size = l_Dialogue_0.Size, 
    ImageTransparency = 0
});
local v9 = l_TweenService_0:Create(l_Dialogue_0, TweenInfo.new(0.4), {
    ImageTransparency = 1
});
local function _() --[[ Line: 21 ]] --[[ Name: showButton ]]
    -- upvalues: l_Button_0 (copy), v5 (copy)
    l_Button_0.Size = UDim2.new(0.3, 0, 0.3, 0);
    l_Button_0.Visible = true;
    v5:Play();
    wait(v5.TweenInfo.Time);
end;
local function _() --[[ Line: 28 ]] --[[ Name: clickButton ]]
    -- upvalues: v7 (copy), v6 (copy), l_Button_0 (copy)
    v7:Play();
    wait(v7.TweenInfo.Time);
    v6:Play();
    wait(v6.TweenInfo.Time);
    l_Button_0.Visible = false;
end;
local function _() --[[ Line: 36 ]] --[[ Name: showFrame ]]
    -- upvalues: l_Dialogue_0 (copy), v8 (copy)
    l_Dialogue_0.Size = UDim2.new(0.4, 0, 0.1, 0);
    l_Dialogue_0.ImageTransparency = 1;
    l_Dialogue_0.Visible = true;
    v8:Play();
    wait(v8.TweenInfo.Time);
end;
local function _() --[[ Line: 44 ]] --[[ Name: hideFrame ]]
    -- upvalues: v9 (copy), l_Dialogue_0 (copy)
    v9:Play();
    wait(v9.TweenInfo.Time);
    l_Dialogue_0.Visible = false;
end;
local function v17(v14, v15) --[[ Line: 50 ]] --[[ Name: showDialogue ]]
    -- upvalues: v0 (copy), l_TextFrame_0 (copy), l_Button_0 (copy), v5 (copy), v7 (copy), v6 (copy)
    local v16 = v0:New(l_TextFrame_0, v14, {
        Font = "Cartoon"
    });
    v16:Animate(true);
    l_Button_0.Size = UDim2.new(0.3, 0, 0.3, 0);
    l_Button_0.Visible = true;
    v5:Play();
    wait(v5.TweenInfo.Time);
    wait(v15);
    v7:Play();
    wait(v7.TweenInfo.Time);
    v6:Play();
    wait(v6.TweenInfo.Time);
    l_Button_0.Visible = false;
    v16:Hide();
end;
local v18 = {
    {
        Text = "I just saw a <Color=Red>wild<Color=/>...a <AnimateStyle=Wiggle><Color=Red>wild pig\240\159\144\183<Color=/>!<AnimateYield=1><AnimateStyle=/>\nOoh! See? Look! That black one there...<AnimateYield=1>\nDon't you see him?", 
        Delay = 1.5
    }, 
    {
        Text = "<AnimateYield=0.3>This is perfect! My wife was just telling me how she really wanted a pet...", 
        Delay = 2.7
    }, 
    {
        Text = "You ready to go grab it, Link?<AnimateYield=0.3>\n Now, you can't just run up on it!\nPigs are too alert to their surroundings for you to just jog up and capture one.", 
        Delay = 3.5
    }, 
    {
        Text = "If you want to get close to one, you have to hold <Img=1014975764> to crouch and tilt <Img=1014975761> to crawl slowly up behind it. <AnimateYield=1.5>Slow<AnimateYield=1>ly...", 
        Delay = 3
    }, 
    {
        Text = "You could also distract it with bait, I guess.", 
        Delay = 1.5
    }
};
wait(2);
l_Dialogue_0.Size = UDim2.new(0.4, 0, 0.1, 0);
l_Dialogue_0.ImageTransparency = 1;
l_Dialogue_0.Visible = true;
v8:Play();
wait(v8.TweenInfo.Time);
for _, v20 in pairs(v18) do
    v17(v20.Text, v20.Delay);
end;
v9:Play();
wait(v9.TweenInfo.Time);
l_Dialogue_0.Visible = false;