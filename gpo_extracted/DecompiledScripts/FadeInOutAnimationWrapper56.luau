local l_Packages_0 = script.Parent.Parent.Packages;
local v1 = require(l_Packages_0.Maid);
local v2 = require(l_Packages_0.Flipper);
local v3 = require(l_Packages_0.Roact);
local l_createElement_0 = v3.createElement;
local v5 = v3.PureComponent:extend(script.Name);
v5.init = function(v6) --[[ Line: 13 ]] --[[ Name: init ]]
    -- upvalues: v1 (copy), v2 (copy), v3 (copy)
    local l_props_0 = v6.props;
    v6.Maid = v1.new();
    v6.CurrentAnimationState = "Rest";
    v6.TransparencyMotor = v2.SingleMotor.new(1);
    local v8, v9 = v3.createBinding(1);
    v6.Transparency = v8;
    v6.SetTransparency = v9;
    v6.Maid.TransparencyMotor = function() --[[ Line: 22 ]]
        -- upvalues: v6 (copy)
        v6.TransparencyMotor:destroy();
    end;
    v6.TransparencyMotor:onStep(function(v10) --[[ Line: 28 ]]
        -- upvalues: v6 (copy)
        v6.SetTransparency(v10);
    end);
    v6.TransparencyMotor:onComplete(function() --[[ Line: 32 ]]
        -- upvalues: v6 (copy), l_props_0 (copy)
        if v6.CurrentAnimationState == "FadeOut" then
            l_props_0.OnFadeOutCompleted();
        end;
        v6.CurrentAnimationState = "Rest";
    end);
    v6.Maid.FadeIn = l_props_0.FadeInSignal:Connect(function() --[[ Line: 40 ]]
        -- upvalues: v6 (copy), v2 (ref), l_props_0 (copy)
        v6.CurrentAnimationState = "FadeIn";
        v6.TransparencyMotor:setGoal(v2.Linear.new(0, {
            velocity = l_props_0.FadeInVelocity
        }));
    end);
    v6.Maid.FadeOut = l_props_0.FadeOutSignal:Connect(function() --[[ Line: 47 ]]
        -- upvalues: v6 (copy), v2 (ref), l_props_0 (copy)
        v6.CurrentAnimationState = "FadeOut";
        v6.TransparencyMotor:setGoal(v2.Linear.new(1, {
            velocity = l_props_0.FadeOutVelocity
        }));
    end);
end;
v5.willUnmount = function(v11) --[[ Line: 55 ]] --[[ Name: willUnmount ]]
    v11.Maid:Destroy();
end;
v5.render = function(v12) --[[ Line: 59 ]] --[[ Name: render ]]
    -- upvalues: l_createElement_0 (copy), v3 (copy)
    local l_props_1 = v12.props;
    return l_createElement_0("CanvasGroup", {
        GroupTransparency = v12.Transparency, 
        BackgroundTransparency = 1, 
        Size = UDim2.fromScale(1, 1)
    }, l_props_1[v3.Children]);
end;
return v5;