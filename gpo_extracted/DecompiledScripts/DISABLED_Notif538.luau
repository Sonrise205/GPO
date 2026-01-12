client = nil;
service = nil;
local l_AdonisModernComponents_0 = script.Parent.Components.AdonisModernComponents;
local l_Packages_0 = l_AdonisModernComponents_0.Parent.Packages;
local v2 = require(l_Packages_0.Maid);
local v3 = require(l_Packages_0.Signal);
local v4 = require(l_Packages_0.Roact);
local l_createElement_0 = v4.createElement;
local v6 = require(l_AdonisModernComponents_0.FadeInOutAnimationWrapper);
local v7 = require(l_AdonisModernComponents_0.Hint);
local v8 = nil;
return function(v9) --[[ Line: 17 ]]
    -- upvalues: v8 (ref), v2 (copy), v3 (copy), l_createElement_0 (copy), v6 (copy), v7 (copy), v4 (copy)
    if v8 then
        v8:Destroy();
        v8 = nil;
    end;
    local v10 = v2.new();
    local v11 = v3.new();
    local v12 = v3.new();
    v8 = v10;
    v10.FadeInSignal = v11;
    v10.FadeOutSignal = v12;
    local v13 = l_createElement_0("ScreenGui", {
        DisplayOrder = v9.DisplayOrder or 100, 
        IgnoreGuiInset = true, 
        ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    }, {
        AnimationContainer = l_createElement_0(v6, {
            FadeInSignal = v11, 
            FadeOutSignal = v12, 
            FadeInVelocity = 3, 
            FadeOutVelocity = 4, 
            OnFadeOutCompleted = function() --[[ Line: 60 ]] --[[ Name: OnFadeOutCompleted ]]
                -- upvalues: v10 (copy)
                v10:Destroy();
            end
        }, {
            Hint = l_createElement_0(v7, {
                BodyText = v9.Message, 
                Image = v9.Image, 
                TitleText = v9.Title, 
                BackgroundColor3 = Color3.new()
            })
        })
    });
    local v14 = v4.mount(v13, service.UnWrap(service.PlayerGui), "AdonisUI.Notif");
    v10.RemoveHandle = function() --[[ Line: 78 ]]
        -- upvalues: v14 (ref), v4 (ref)
        v14 = v4.unmount(v14);
    end;
    v11:Fire();
    if v9.Time then
        task.wait(v9.Time);
        v12:Fire();
    end;
end;