local l_Blade_0 = script.Parent:WaitForChild("Blade");
l_Blade_0.Transparency = 1;
local v1 = script.Parent.AnimationController:LoadAnimation(game.ReplicatedStorage.Modules.SwordHandle.Swords["Vera's Whip"].Idle);
v1:Play(0);
v1.Priority = Enum.AnimationPriority.Core;
task.wait(0.1);
l_Blade_0.Transparency = 0;