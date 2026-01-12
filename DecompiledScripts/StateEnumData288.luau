local l_Modules_0 = game:GetService("ReplicatedStorage").Modules;
local v1 = require(l_Modules_0.DataStructures.CustomEnum);
local v2 = v1.Class.new("Climbing", {
    "Up", 
    "Down", 
    "Left", 
    "Right", 
    "Tip", 
    "Idling"
});
local v3 = v1.Class.new("Stunned", {
    "Default", 
    "GettingUp"
});
local v4 = v1.Class.new("Crouching", {
    "Idling", 
    "Walking"
});
local v5 = v1.Class.new("State", {
    "Idling", 
    "Jumping", 
    "Walking", 
    "Running", 
    "Falling"
});
local v6 = v1.Class.new("ImmutableState", {
    "Dead", 
    "CastingSpell", 
    "Ragdolling", 
    "Slashing", 
    "Swimming"
});
v6:AddItem(v2);
v6:AddItem(v3);
v5:AddItem(v4);
return {
    State = v5, 
    CrouchState = v4, 
    ImmutableState = v6, 
    ClimbState = v2, 
    StunState = v3
};